@interface VCPVideoFacePoseAnalyzer
- (BOOL)updateFocalLengthInPixels:(float)a3;
- (VCPVideoFacePoseAnalyzer)init;
- (VCPVideoFacePoseAnalyzer)initWithFocalLengthInPixels:(float)a3;
- (double)pose;
- (int)analyzeFrameForPose:(__CVBuffer *)a3 withFaceRect:(CGRect)a4 withTimestamp:(id *)a5;
- (void)setPose:(__n128)a3;
@end

@implementation VCPVideoFacePoseAnalyzer

- (VCPVideoFacePoseAnalyzer)init
{
  return 0;
}

- (VCPVideoFacePoseAnalyzer)initWithFocalLengthInPixels:(float)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VCPVideoFacePoseAnalyzer;
  v4 = [(VCPVideoFacePoseAnalyzer *)&v11 init];
  v5 = v4;
  if (a3 < 1.0 || v4 == 0)
  {
    v8 = 0;
  }
  else
  {
    *((float *)v4 + 8) = a3;
    uint64_t v7 = MEMORY[0x1E4F1FA08];
    *(_OWORD *)(v4 + 36) = *MEMORY[0x1E4F1FA08];
    *(void *)(v4 + 52) = *(void *)(v7 + 16);
    *((_DWORD *)v4 + 15) = 0;
    *((_DWORD *)v4 + 16) = 0;
    v8 = v4;
  }
  v9 = v8;

  return v9;
}

- (BOOL)updateFocalLengthInPixels:(float)a3
{
  self->_focalLengthInPixels = a3;
  poseEstimator = self->_poseEstimator;
  if (poseEstimator) {
    -[VCPPnPSolver updateFocalLengthInPixels:](poseEstimator, "updateFocalLengthInPixels:");
  }
  filter = self->_filter;
  if (filter) {
    [(VCPVideoFacePoseFilter *)filter reset];
  }
  return 1;
}

- (int)analyzeFrameForPose:(__CVBuffer *)a3 withFaceRect:(CGRect)a4 withTimestamp:(id *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  int v12 = CVPixelBufferGetWidth(a3);
  int v13 = CVPixelBufferGetHeight(a3);
  if (!self->_landmarkDetector)
  {
    v14 = +[VCPCNNFaceLandmarkDetector detector];
    landmarkDetector = self->_landmarkDetector;
    self->_landmarkDetector = v14;

    if (!self->_landmarkDetector) {
      return -18;
    }
  }
  if (HIDWORD(self->_lastTimestamp.epoch) != v12 || self->_width != v13)
  {
    v16 = [VCPPnPSolver alloc];
    *(float *)&double v17 = self->_focalLengthInPixels;
    v18 = -[VCPPnPSolver initWithFocalLengthInPixels:principalPoint:cameraTowardsPositiveZ:](v16, "initWithFocalLengthInPixels:principalPoint:cameraTowardsPositiveZ:", 0, v17, (float)((float)v12 * 0.5), (float)((float)v13 * 0.5));
    poseEstimator = self->_poseEstimator;
    self->_poseEstimator = v18;

    if (self->_poseEstimator)
    {
      v20 = objc_alloc_init(VCPVideoFacePoseFilter);
      filter = self->_filter;
      self->_filter = v20;

      if (self->_filter)
      {
        HIDWORD(self->_lastTimestamp.epoch) = v12;
        self->_CGFloat width = v13;
        goto LABEL_8;
      }
    }
    return -18;
  }
LABEL_8:
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  if (CGRectIsEmpty(v48)) {
    return 0;
  }
  v45.b = 0.0;
  v45.c = 0.0;
  v45.a = (double)v12;
  v45.d = (double)-v13;
  v45.tCGFloat x = 0.0;
  v45.tCGFloat y = (double)v13;
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = width;
  v49.size.CGFloat height = height;
  CGRect v50 = CGRectApplyAffineTransform(v49, &v45);
  int v22 = -[VCPCNNFaceLandmarkDetector analyzeFrame:withFaceBounds:](self->_landmarkDetector, "analyzeFrame:withFaceBounds:", a3, v50.origin.x, v50.origin.y, v50.size.width, v50.size.height);
  if (!v22)
  {
    v23 = [(VCPCNNFaceLandmarkDetector *)self->_landmarkDetector landmarks];
    if ([v23 count] == 7)
    {
      uint64_t v24 = 0;
      float v25 = (float)v12;
      v26 = &self->_points2D[13];
      points2D = self->_points2D;
      do
      {
        v28 = [v23 objectAtIndexedSubscript:v24];
        if ([v28 count] != 3
          || ([v28 objectAtIndexedSubscript:0],
              v29 = objc_claimAutoreleasedReturnValue(),
              unsigned int v30 = [v29 intValue],
              v29,
              v30 > 0x34))
        {

          goto LABEL_23;
        }
        v31 = [v28 objectAtIndexedSubscript:1];
        [v31 floatValue];
        float v33 = v32;

        v34 = [v28 objectAtIndexedSubscript:2];
        [v34 floatValue];
        float v36 = v35 * (float)v13;

        v37 = (float *)((char *)&VCPAnchorFace3DLandmarks + 12 * v30);
        *(points2D - 1) = v33 * v25;
        float *points2D = v36;
        *(void *)v26 = *(void *)v37;
        v26[2] = v37[2];

        ++v24;
        v26 += 3;
        points2D += 2;
      }
      while (v24 != 7);
      int v22 = [(VCPPnPSolver *)self->_poseEstimator estimateExtrinsicsWith:&self->_height andPoints3D:&self->_points2D[13] andNumPoints:7];
      if (!v22)
      {
        [(VCPPnPSolver *)self->_poseEstimator pose];
        *(_OWORD *)&self->_points3D[20] = v38;
        *(_OWORD *)&self[1]._landmarkDetector = v39;
        *(_OWORD *)&self[1]._filter = v40;
        *(_OWORD *)&self[1]._lastTimestamp.value = v41;
        CMTime lhs = (CMTime)*a5;
        CMTime rhs = *(CMTime *)(&self->_focalLengthInPixels + 1);
        CMTimeSubtract(&time, &lhs, &rhs);
        if (CMTimeGetSeconds(&time) > 2.0) {
          [(VCPVideoFacePoseFilter *)self->_filter reset];
        }
        int v22 = [(VCPVideoFacePoseFilter *)self->_filter filteringPose:&self->_points3D[20]];
        if (!v22)
        {
          long long v42 = *(_OWORD *)&a5->var0;
          *(void *)&self->_lastTimestamp.flags = a5->var3;
          *(_OWORD *)(&self->_focalLengthInPixels + 1) = v42;
        }
      }
    }
    else
    {
LABEL_23:
      int v22 = -18;
    }
  }
  return v22;
}

- (double)pose
{
  objc_copyStruct(&v2, (const void *)(a1 + 208), 64, 1, 0);
  return *(double *)&v2;
}

- (void)setPose:(__n128)a3
{
  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  objc_copyStruct((void *)(a1 + 208), v5, 64, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_poseEstimator, 0);
  objc_storeStrong((id *)&self->_landmarkDetector, 0);
}

@end