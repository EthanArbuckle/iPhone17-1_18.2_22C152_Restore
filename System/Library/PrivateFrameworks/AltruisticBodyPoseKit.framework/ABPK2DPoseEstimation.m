@interface ABPK2DPoseEstimation
- (ABPK2DPoseEstimation)initWith2DDetectionConfig:(id)a3 use3DSkeletonForExtrapolation:(BOOL)a4 shouldPush3DSupportSkeleton:(BOOL)a5;
- (int)runWithMLImageData:(id)a3 rotationOfResultTensor:(int64_t)a4;
- (void)getRawTrackedHumanForLiftingSkeleton:(id)a3;
- (void)getRawTrackedHumanSkeleton:(id)a3;
- (void)getRawTrackedHumanSkeletonVector:(id)a3;
- (void)getTrackedHumanForLiftingSkeleton:(id)a3;
- (void)getTrackedHumanSkeleton:(id)a3;
@end

@implementation ABPK2DPoseEstimation

- (ABPK2DPoseEstimation)initWith2DDetectionConfig:(id)a3 use3DSkeletonForExtrapolation:(BOOL)a4 shouldPush3DSupportSkeleton:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ABPK2DPoseEstimation;
  v10 = [(ABPK2DPoseEstimation *)&v21 init];
  v11 = v10;
  if (!v10) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v10->_config2D, a3);
  v12 = [[ABPK2DDetection alloc] initWithNetworkConfig:v11->_config2D];
  detection2dAlgorithm = v11->_detection2dAlgorithm;
  v11->_detection2dAlgorithm = v12;

  if (!v11->_detection2dAlgorithm)
  {
    v17 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20[0] = 0;
      v18 = " Failed to initialize 2D Detection Algorithm. ";
LABEL_9:
      _os_log_impl(&dword_21B7C6000, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)v20, 2u);
    }
LABEL_10:

    v16 = 0;
    goto LABEL_11;
  }
  uint64_t v14 = +[ABPK2DDetectionPostProcessSelector get2DDetectionPostProcessWithNetworkConfig:v9 use3DSkeletonForExtrapolation:v6 shouldPush3DSupportSkeleton:v5 withExtrapolationTime:0.3];
  postprocess2d = v11->_postprocess2d;
  v11->_postprocess2d = (ABPK2DDetectionPostprocess *)v14;

  if (!v11->_postprocess2d)
  {
    v17 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20[0] = 0;
      v18 = " Failed to initialize 2D Detection Post-processing. ";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_4:
  v16 = v11;
LABEL_11:

  return v16;
}

- (int)runWithMLImageData:(id)a3 rotationOfResultTensor:(int64_t)a4
{
  id v6 = a3;
  detection2dAlgorithm = self->_detection2dAlgorithm;
  uint64_t v8 = [v6 pixelBuffer];
  uint64_t v9 = [v6 abpkDeviceOrientation];
  [v6 timestamp];
  v10 = -[ABPK2DDetection runWithImage:abpkOrientation:atTimestamp:rotationOfResultTensor:](detection2dAlgorithm, "runWithImage:abpkOrientation:atTimestamp:rotationOfResultTensor:", v8, v9, a4);
  if (v10)
  {
    v11 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_21B7C6000, v11, OS_LOG_TYPE_DEBUG, " \t Post-processing output ", v16, 2u);
    }

    postprocess2d = self->_postprocess2d;
    v13 = [v6 preprocessingParams];
    [v6 timestamp];
    LODWORD(postprocess2d) = -[ABPK2DDetectionPostprocess extract2DSkeletonfromBuffers:withImagePreProcessingParams:atTimestamp:previousSkeleton3D:](postprocess2d, "extract2DSkeletonfromBuffers:withImagePreProcessingParams:atTimestamp:previousSkeleton3D:", v10, v13, 0);

    if (postprocess2d) {
      int v14 = -6661;
    }
    else {
      int v14 = 0;
    }
  }
  else
  {
    int v14 = -6661;
  }

  return v14;
}

- (void)getRawTrackedHumanSkeleton:(id)a3
{
}

- (void)getRawTrackedHumanSkeletonVector:(id)a3
{
}

- (void)getTrackedHumanSkeleton:(id)a3
{
}

- (void)getTrackedHumanForLiftingSkeleton:(id)a3
{
}

- (void)getRawTrackedHumanForLiftingSkeleton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postprocess2d, 0);
  objc_storeStrong((id *)&self->_detection2dAlgorithm, 0);
  objc_storeStrong((id *)&self->_config2D, 0);
}

@end