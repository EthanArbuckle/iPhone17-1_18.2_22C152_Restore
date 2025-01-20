@interface VNTrajectoryProcessor
- (VNTrajectoryProcessor)initWithFrameAnalysisSpacing:(id *)a3 trajectoryLength:(int64_t)a4;
- (__CVBuffer)_createCroppedAndScaledBufferFromVNImageBuffer:(id)a3 regionOfInterest:(CGRect)a4 withOptions:(id)a5 error:(id *)a6;
- (id)_VNPointsFromCGPoints:(const void *)a3;
- (id)processVNImageBuffer:(id)a3 regionOfInterest:(CGRect)a4 withOptions:(id)a5 warningRecorder:(id)a6 requestUUID:(id)a7 error:(id *)a8;
- (void)dealloc;
@end

@implementation VNTrajectoryProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parabolaDetector, 0);
  objc_storeStrong((id *)&self->_previousFrameImage, 0);
  objc_storeStrong((id *)&self->_previousFrameBuffer, 0);
  objc_storeStrong((id *)&self->_detectContoursRequest, 0);
  objc_storeStrong((id *)&self->_contrastFilter, 0);
  objc_storeStrong((id *)&self->_dilateFilter, 0);
  objc_storeStrong((id *)&self->_thresholdFilter, 0);
  objc_storeStrong((id *)&self->_absoluteDiffFilter, 0);

  objc_storeStrong((id *)&self->_ciContext, 0);
}

- (id)processVNImageBuffer:(id)a3 regionOfInterest:(CGRect)a4 withOptions:(id)a5 warningRecorder:(id)a6 requestUUID:(id)a7 error:(id *)a8
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v175[1] = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a5;
  id v133 = a6;
  id v134 = a7;
  v135 = v19;
  if (!self->_processAllFrames)
  {
    if (v18)
    {
      [v18 timingInfo];
    }
    else
    {
      v166.n128_u64[0] = 0;
      long long v165 = 0u;
      long long v163 = 0u;
      memset(v164, 0, sizeof(v164));
    }
    CMTime time1 = *(CMTime *)((char *)v164 + 8);
    CMTime time2 = (CMTime)self->_nextFrameToBeAnalyzedPTS;
    if (CMTimeCompare(&time1, &time2) == -1)
    {
      previousFrameBuffer = self->_previousFrameBuffer;
      self->_previousFrameBuffer = 0;

      previousFrameImage = self->_previousFrameImage;
      self->_previousFrameImage = 0;
      v51 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_103;
    }
  }
  previousFrameImage = +[VNValidationUtilities originatingRequestSpecifierInOptions:v19 error:a8];
  if (!previousFrameImage
    || (uint64_t v21 = [v18 width],
        uint64_t v22 = [v18 height],
        v160[0] = MEMORY[0x1E4F143A8],
        v160[1] = 3221225472,
        v160[2] = __109__VNTrajectoryProcessor_processVNImageBuffer_regionOfInterest_withOptions_warningRecorder_requestUUID_error___block_invoke,
        v160[3] = &unk_1E5B20040,
        v160[4] = self,
        !+[VNValidationUtilities validateNonZeroImageWidth:v21 height:v22 componentNameProvidingBlock:v160 error:a8]))
  {
    v51 = 0;
    goto LABEL_103;
  }
  v23 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNTrajectoryProcessorOption_RequestState" inOptions:v19 error:a8];
  v24 = v23;
  if (!v23) {
    goto LABEL_20;
  }
  v132 = v23;
  unint64_t v130 = [v23 targetImageDimensionForContourDetection];
  if (self->_previousFrameBuffer)
  {
    double HostTimeInMillis = getHostTimeInMillis();
    v26 = -[VNTrajectoryProcessor _createCroppedAndScaledBufferFromVNImageBuffer:regionOfInterest:withOptions:error:](self, "_createCroppedAndScaledBufferFromVNImageBuffer:regionOfInterest:withOptions:error:", v18, v135, a8, x, y, width, height);
    v27 = v26;
    if (v26)
    {
      self->_double currentImageWidth = CVPixelBufferGetWidth(v26);
      self->_double currentImageHeight = CVPixelBufferGetHeight(v27);
      v28 = (void *)MEMORY[0x1E4F1E050];
      uint64_t v172 = *MEMORY[0x1E4F1E328];
      uint64_t v173 = MEMORY[0x1E4F1CC38];
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v173 forKeys:&v172 count:1];
      id obj = [v28 imageWithCVImageBuffer:v27 options:v29];

      CVPixelBufferRelease(v27);
      absoluteDiffFilter = self->_absoluteDiffFilter;
      v31 = [(CIImage *)self->_previousFrameImage imageByColorMatchingColorSpaceToWorkingSpace:self->_sRGB];
      [(CIFilter *)absoluteDiffFilter setValue:v31 forKey:@"inputImage"];

      v32 = self->_absoluteDiffFilter;
      v33 = [obj imageByColorMatchingColorSpaceToWorkingSpace:self->_sRGB];
      [(CIFilter *)v32 setValue:v33 forKey:@"inputImage2"];

      thresholdFilter = self->_thresholdFilter;
      v35 = [(CIFilter *)self->_absoluteDiffFilter outputImage];
      v36 = [v35 imageByApplyingFilter:@"CIMaximumComponent" withInputParameters:MEMORY[0x1E4F1CC08]];
      [(CIFilter *)thresholdFilter setValue:v36 forKey:@"inputImage"];

      v128 = [(CIFilter *)self->_thresholdFilter outputImage];
      double v37 = (double)v130;
      float v38 = (double)self->_maximumImageDimension / (double)v130;
      self->_dilateRadius = v38;
      dilateFilter = self->_dilateFilter;
      v40 = objc_msgSend(NSNumber, "numberWithFloat:");
      [(CIFilter *)dilateFilter setValue:v40 forKey:@"inputWidth"];

      v41 = self->_dilateFilter;
      *(float *)&double v42 = self->_dilateRadius;
      v43 = [NSNumber numberWithFloat:v42];
      [(CIFilter *)v41 setValue:v43 forKey:@"inputHeight"];

      [(CIFilter *)self->_dilateFilter setValue:v128 forKey:@"inputImage"];
      v44 = [(CIFilter *)self->_dilateFilter outputImage];
      [(CIFilter *)self->_contrastFilter setValue:v44 forKey:@"inputImage"];
      CVPixelBufferRef pixelBufferOut = 0;
      double currentImageWidth = (double)self->_currentImageWidth;
      double v46 = (double)v130 / currentImageWidth;
      double currentImageHeight = (double)self->_currentImageHeight;
      if (v37 / currentImageWidth >= v37 / currentImageHeight) {
        double v46 = v37 / currentImageHeight;
      }
      double v48 = fmin(v46, 1.0);
      size_t v49 = (unint64_t)(v48 * currentImageWidth);
      size_t v50 = (unint64_t)(v48 * currentImageHeight);
      if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v49, v50, 0x4C303038u, 0, &pixelBufferOut))
      {
        if (a8)
        {
          +[VNError errorWithCode:3 message:@"Could not create intermediate buffer"];
          v51 = 0;
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v51 = 0;
        }
        goto LABEL_101;
      }
      memset(&v158, 0, sizeof(v158));
      CGAffineTransformMakeScale(&v158, v48, v48);
      v124 = v44;
      v58 = [(CIFilter *)self->_contrastFilter outputImage];
      CGAffineTransform v157 = v158;
      v125 = [v58 imageByApplyingTransform:&v157 highQualityDownsample:0];

      -[CIContext render:toCVPixelBuffer:bounds:colorSpace:](self->_ciContext, "render:toCVPixelBuffer:bounds:colorSpace:", v125, pixelBufferOut, 0, 0.0, 0.0, (double)v49, (double)v50);
      uint64_t v59 = +[VNValidationUtilities requiredSessionInOptions:v135 error:a8];
      v60 = (void *)v59;
      if (!v59)
      {
        v51 = 0;
LABEL_100:

        v44 = v124;
LABEL_101:

        v24 = v132;
        goto LABEL_102;
      }
      v122 = (void *)v59;
      v61 = [VNImageRequestHandler alloc];
      v123 = [(VNImageRequestHandler *)v61 initWithCVPixelBuffer:pixelBufferOut options:v135 session:v60];
      CVPixelBufferRelease(pixelBufferOut);
      objc_storeStrong((id *)&self->_previousFrameBuffer, a3);
      objc_storeStrong((id *)&self->_previousFrameImage, obj);
      if (!self->_processAllFrames)
      {
        if (v18)
        {
          [v18 timingInfo];
        }
        else
        {
          v166.n128_u64[0] = 0;
          long long v165 = 0u;
          long long v163 = 0u;
          memset(v164, 0, sizeof(v164));
        }
        *(_OWORD *)&self->_lastAnalyzedFramePTS.value = *(_OWORD *)((char *)v164 + 8);
        CMTimeEpoch v62 = *((void *)&v164[1] + 1);
        self->_lastAnalyzedFramePTS.epoch = *((void *)&v164[1] + 1);
        *(_OWORD *)&lhs.value = *(_OWORD *)&self->_lastAnalyzedFramePTS.value;
        lhs.epoch = v62;
        CMTime rhs = (CMTime)self->_frameAnalysisSpacing;
        CMTimeAdd((CMTime *)&v163, &lhs, &rhs);
        *(_OWORD *)&self->_nextFrameToBeAnalyzedPTS.value = v163;
        self->_nextFrameToBeAnalyzedPTS.epoch = *(void *)&v164[0];
      }
      [(VNDetectContoursRequest *)self->_detectContoursRequest setMaximumImageDimension:(unint64_t)v37];
      detectContoursRequest = self->_detectContoursRequest;
      v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&detectContoursRequest count:1];
      BOOL v64 = [(VNImageRequestHandler *)v123 performRequests:v63 error:a8];

      if (!v64)
      {
        v51 = 0;
LABEL_99:

        v60 = v122;
        goto LABEL_100;
      }
      v65 = [(VNRequest *)self->_detectContoursRequest results];
      v121 = [v65 firstObject];

      v66 = v121;
      if (v121)
      {
        float v154 = 0.0;
        if (+[VNValidationUtilities getFloatValue:&v154 forKey:@"VNTrajectoryProcessorOption_ObjectMinimumNormalizedRadius" inOptions:v135 error:a8])
        {
          float v67 = v154;
          unint64_t maximumImageDimension = self->_maximumImageDimension;
          float v153 = 1.0;
          if (+[VNValidationUtilities getFloatValue:&v153 forKey:@"VNTrajectoryProcessorOption_ObjectMaximumNormalizedRadius" inOptions:v135 error:a8])
          {
            if (v153 >= v154)
            {
              id v152 = 0;
              BOOL v72 = +[VNValidationUtilities getOptionalObject:&v152 ofClass:objc_opt_class() forKey:@"VNTrajectoryProcessorOption_ProcessingTargetFrameTime" inOptions:v135 error:a8];
              id v71 = v152;
              if (v72)
              {
                id v119 = v71;
                [v71 getValue:&v151 size:24];
                __p = 0;
                v149 = 0;
                v150 = 0;
                long long v144 = 0u;
                long long v145 = 0u;
                long long v146 = 0u;
                long long v147 = 0u;
                v73 = [v121 topLevelContours];
                location = v73;
                uint64_t v74 = [v73 countByEnumeratingWithState:&v144 objects:v170 count:16];
                unint64_t v120 = maximumImageDimension;
                if (v74)
                {
                  v75 = 0;
                  v76 = 0;
                  uint64_t v127 = *(void *)v145;
                  do
                  {
                    uint64_t v131 = v74;
                    for (uint64_t i = 0; i != v131; ++i)
                    {
                      if (*(void *)v145 != v127) {
                        objc_enumerationMutation(v73);
                      }
                      v78 = +[VNGeometryUtils boundingCircleForContour:*(void *)(*((void *)&v144 + 1) + 8 * i) error:a8];
                      v79 = v78;
                      if (v78)
                      {
                        [v78 radius];
                        float v80 = v81;
                        *(float *)&double v81 = v154;
                        *(float *)&double v82 = v153;
                        if (v154 <= v80 && v153 >= v80)
                        {
                          v84 = objc_msgSend(v79, "center", v81, v82);
                          [v84 location];
                          VisionCoreImagePointForNormalizedPoint();
                          uint64_t v86 = v85;
                          uint64_t v88 = v87;

                          float v89 = v80 * (float)self->_maximumImageDimension;
                          if (v76 >= v150)
                          {
                            unint64_t v91 = 0xAAAAAAAAAAAAAAABLL * ((v76 - v75) >> 3) + 1;
                            if (v91 > 0xAAAAAAAAAAAAAAALL) {
                              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                            }
                            if (0x5555555555555556 * ((v150 - v75) >> 3) > v91) {
                              unint64_t v91 = 0x5555555555555556 * ((v150 - v75) >> 3);
                            }
                            if (0xAAAAAAAAAAAAAAABLL * ((v150 - v75) >> 3) >= 0x555555555555555) {
                              unint64_t v92 = 0xAAAAAAAAAAAAAAALL;
                            }
                            else {
                              unint64_t v92 = v91;
                            }
                            if (v92)
                            {
                              if (v92 > 0xAAAAAAAAAAAAAAALL) {
                                std::__throw_bad_array_new_length[abi:ne180100]();
                              }
                              v93 = (char *)operator new(24 * v92);
                            }
                            else
                            {
                              v93 = 0;
                            }
                            v94 = &v93[8 * ((v76 - v75) >> 3)];
                            *(void *)v94 = v86;
                            *((void *)v94 + 1) = v88;
                            *((float *)v94 + 4) = v89;
                            v95 = (char *)__p;
                            v75 = v94;
                            if (v76 != __p)
                            {
                              do
                              {
                                long long v96 = *(_OWORD *)(v76 - 24);
                                *((_DWORD *)v75 - 2) = *((_DWORD *)v76 - 2);
                                *(_OWORD *)(v75 - 24) = v96;
                                v75 -= 24;
                                v76 -= 24;
                              }
                              while (v76 != v95);
                              v76 = (char *)__p;
                            }
                            v90 = v94 + 24;
                            __p = v75;
                            v149 = v94 + 24;
                            v150 = &v93[24 * v92];
                            if (v76) {
                              operator delete(v76);
                            }
                          }
                          else
                          {
                            *(void *)v76 = v86;
                            *((void *)v76 + 1) = v88;
                            v90 = v76 + 24;
                            *((float *)v76 + 4) = v89;
                          }
                          v149 = v90;
                          v76 = v90;
                          v73 = location;
                        }
                      }
                    }
                    uint64_t v74 = [v73 countByEnumeratingWithState:&v144 objects:v170 count:16];
                  }
                  while (v74);
                }

                v97 = [v121 topLevelContours];
                BOOL v98 = (unint64_t)[v97 count] > 0xF9;

                if (v98)
                {
                  if (a8)
                  {
                    +[VNError errorWithCode:3 message:@"Too many moving objects or noise detected which prevents trajectory processing."];
                    v51 = 0;
                    *a8 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v51 = 0;
                  }
                }
                else
                {
                  parabolaDetector = self->_parabolaDetector;
                  if (v18)
                  {
                    [v18 timingInfo];
                  }
                  else
                  {
                    v166.n128_u64[0] = 0;
                    long long v165 = 0u;
                    long long v163 = 0u;
                    memset(v164, 0, sizeof(v164));
                  }
                  long long v142 = *(_OWORD *)((char *)v164 + 8);
                  uint64_t v143 = *((void *)&v164[1] + 1);
                  v100 = (void *)[(VNParabolaDetection *)(uint64_t)parabolaDetector processContoursForParabolas:(uint64_t)&v142 withPTS:vcvtps_u32_f32(v67 * (float)v120) objectMinimumPixelSize:self->_currentImageWidth bufferWidth:self->_currentImageHeight bufferHeight:*(int32x4_t *)((char *)v164 + 8)];
                  v51 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v100[2]];
                  v103 = (void *)*v100;
                  v101 = v100 + 1;
                  v102 = v103;
                  if (v103 != v101)
                  {
                    do
                    {
                      ObservedParabola::ObservedParabola((ObservedParabola *)&v163, (const ObservedParabola *)(v102 + 6));
                      v104 = [VNTrajectoryObservation alloc];
                      v105 = (void *)v163;
                      v106 = [(VNTrajectoryProcessor *)self _VNPointsFromCGPoints:&v164[1]];
                      v107 = [(VNTrajectoryProcessor *)self _VNPointsFromCGPoints:(char *)&v163 + 8];
                      id v108 = -[VNTrajectoryObservation initWithOriginatingRequestSpecifier:requestUUID:trajectoryUUID:detectedPoints:projectedPoints:movingAverageRadius:equationCoefficients:confidence:](v104, previousFrameImage, v134, v105, v106, v107, *((double *)&v165 + 1) / (double)self->_maximumImageDimension, v166, v167);

                      CMTime start = v168;
                      CMTime end = v169;
                      CMTimeRangeFromTimeToTime(&v141, &start, &end);
                      CMTimeRange v138 = v141;
                      [v108 setTimeRange:&v138];
                      [v51 addObject:v108];

                      ObservedParabola::~ObservedParabola((ObservedParabola *)&v163);
                      v109 = (void *)v102[1];
                      if (v109)
                      {
                        do
                        {
                          v110 = v109;
                          v109 = (void *)*v109;
                        }
                        while (v109);
                      }
                      else
                      {
                        do
                        {
                          v110 = (void *)v102[2];
                          BOOL v111 = *v110 == (void)v102;
                          v102 = v110;
                        }
                        while (!v111);
                      }
                      v102 = v110;
                    }
                    while (v110 != v101);
                  }
                  double v112 = getHostTimeInMillis();
                  long long v163 = 0uLL;
                  *(void *)&v164[0] = 0;
                  CMTimeMakeWithSeconds((CMTime *)&v163, v112 - HostTimeInMillis, 1000);
                  *(_OWORD *)&v137.value = v163;
                  v137.epoch = *(void *)&v164[0];
                  CMTime v136 = v151;
                  if (CMTimeCompare(&v137, &v136) != 1
                    || ([v121 topLevelContours],
                        v113 = objc_claimAutoreleasedReturnValue(),
                        BOOL v114 = [v113 count] == 0,
                        v113,
                        v114))
                  {
                    double v117 = (320.0 - v37) * 0.5 + v37;
                    if ((((unint64_t)v117 + 1) & 0xFFFFFFFFFFFFFFFELL) >= 0x140) {
                      unint64_t v116 = 320;
                    }
                    else {
                      unint64_t v116 = ((unint64_t)v117 + 1) & 0xFFFFFFFFFFFFFFFELL;
                    }
                  }
                  else
                  {
                    double v115 = v37 + (v37 + -160.0) * -0.5;
                    if ((((unint64_t)v115 - 1) & 0xFFFFFFFFFFFFFFFELL) <= 0xA0) {
                      unint64_t v116 = 160;
                    }
                    else {
                      unint64_t v116 = ((unint64_t)v115 - 1) & 0xFFFFFFFFFFFFFFFELL;
                    }
                  }
                  [v132 setTargetImageDimensionForContourDetection:v116];
                }
                if (__p) {
                  operator delete(__p);
                }
                id v71 = v119;
              }
              else
              {
                v51 = 0;
              }
              goto LABEL_97;
            }
            if (a8)
            {
              id v69 = [NSString alloc];
              uint64_t v70 = objc_msgSend(v69, "initWithFormat:", @"cannot perform analysis with minimum object radius of %f and maximum object radius of %f", v154, v153);
              +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:");
              v51 = 0;
              *a8 = (id)objc_claimAutoreleasedReturnValue();
              id v71 = (id)v70;
LABEL_97:

              v66 = v121;
              goto LABEL_98;
            }
          }
        }
        v51 = 0;
      }
      else
      {
        v51 = (void *)MEMORY[0x1E4F1CBF0];
      }
LABEL_98:

      goto LABEL_99;
    }
    goto LABEL_20;
  }
  objc_storeStrong((id *)&self->_previousFrameBuffer, a3);
  v24 = v132;
  v53 = -[VNTrajectoryProcessor _createCroppedAndScaledBufferFromVNImageBuffer:regionOfInterest:withOptions:error:](self, "_createCroppedAndScaledBufferFromVNImageBuffer:regionOfInterest:withOptions:error:", self->_previousFrameBuffer, v135, a8, x, y, width, height);
  if (!v53)
  {
LABEL_20:
    v51 = 0;
    goto LABEL_102;
  }
  v54 = (void *)MEMORY[0x1E4F1E050];
  uint64_t v174 = *MEMORY[0x1E4F1E328];
  v175[0] = MEMORY[0x1E4F1CC38];
  v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v175 forKeys:&v174 count:1];
  v56 = [v54 imageWithCVImageBuffer:v53 options:v55];
  v57 = self->_previousFrameImage;
  self->_previousFrameImage = v56;

  v24 = v132;
  CVPixelBufferRelease(v53);
  v51 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_102:

LABEL_103:

  return v51;
}

NSString *__109__VNTrajectoryProcessor_processVNImageBuffer_regionOfInterest_withOptions_warningRecorder_requestUUID_error___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v0);
}

- (id)_VNPointsFromCGPoints:(const void *)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4];
  for (uint64_t i = *(void *)a3; i != *((void *)a3 + 1); i += 16)
  {
    VisionCoreNormalizedPointForImagePoint();
    v8 = -[VNPoint initWithLocation:]([VNPoint alloc], "initWithLocation:", v6, v7);
    if (v8) {
      [v4 addObject:v8];
    }
  }

  return v4;
}

- (__CVBuffer)_createCroppedAndScaledBufferFromVNImageBuffer:(id)a3 regionOfInterest:(CGRect)a4 withOptions:(id)a5 error:(id *)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  id v14 = a5;
  unint64_t v15 = [v13 width];
  unint64_t v16 = [v13 height];
  v27.origin.double x = x * (double)v15;
  v27.size.double width = width * (double)v15;
  v27.origin.double y = y * (double)v16;
  v27.size.double height = height * (double)v16;
  CGRect v28 = CGRectIntegral(v27);
  if (v28.size.width >= v28.size.height) {
    double v17 = v28.size.width;
  }
  else {
    double v17 = v28.size.height;
  }
  double v18 = 1280.0;
  if (v17 <= 1280.0) {
    double v18 = v17;
  }
  self->_unint64_t maximumImageDimension = (unint64_t)v18;
  float v19 = v17;
  self->_preScaleFactor = (float)(unint64_t)v18 / v19;
  double v20 = (double)(unint64_t)v18;
  unint64_t v21 = vcvtad_u64_f64(v28.size.height / (v28.size.width / v20));
  unint64_t v22 = vcvtad_u64_f64(v28.size.width / (v28.size.height / v20));
  if (v28.size.width < v28.size.height) {
    unint64_t v23 = (unint64_t)v18;
  }
  else {
    unint64_t v23 = v21;
  }
  if (v28.size.width < v28.size.height) {
    unint64_t v24 = v22;
  }
  else {
    unint64_t v24 = (unint64_t)v18;
  }
  v25 = (__CVBuffer *)objc_msgSend(v13, "croppedBufferWithWidth:height:format:cropRect:options:error:", v24, v23, 875704422, v14, a6, v28.origin.x, v28.origin.y);

  return v25;
}

- (void)dealloc
{
  CGColorSpaceRelease(self->_sRGB);
  v3.receiver = self;
  v3.super_class = (Class)VNTrajectoryProcessor;
  [(VNTrajectoryProcessor *)&v3 dealloc];
}

- (VNTrajectoryProcessor)initWithFrameAnalysisSpacing:(id *)a3 trajectoryLength:(int64_t)a4
{
  v73[2] = *MEMORY[0x1E4F143B8];
  v69.receiver = self;
  v69.super_class = (Class)VNTrajectoryProcessor;
  double v6 = [(VNTrajectoryProcessor *)&v69 init];
  double v7 = v6;
  if (v6)
  {
    *((_DWORD *)v6 + 20) = 1065353216;
    *((void *)v6 + 9) = 1280;
    long long v8 = *(_OWORD *)&a3->var0;
    *((void *)v6 + 13) = a3->var3;
    *(_OWORD *)(v6 + 88) = v8;
    CMTime time1 = (CMTime)*a3;
    v9 = (long long *)MEMORY[0x1E4F1FA48];
    CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    v6[160] = CMTimeCompare(&time1, &time2) == 0;
    long long v10 = *v9;
    *((_OWORD *)v7 + 7) = *v9;
    uint64_t v11 = *((void *)v9 + 2);
    *((void *)v7 + 16) = v11;
    *(_OWORD *)(v7 + 136) = v10;
    *((void *)v7 + 19) = v11;
    *((_DWORD *)v7 + 21) = 1082130432;
    v12 = (void *)MEMORY[0x1E4F1E018];
    v72[0] = *MEMORY[0x1E4F1E240];
    id v13 = [MEMORY[0x1E4F1CA98] null];
    v72[1] = *MEMORY[0x1E4F1E1E0];
    v73[0] = v13;
    v73[1] = MEMORY[0x1E4F1CC28];
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];
    uint64_t v15 = [v12 contextWithOptions:v14];
    unint64_t v16 = (void *)*((void *)v7 + 1);
    *((void *)v7 + 1) = v15;

    uint64_t v17 = [MEMORY[0x1E4F1E040] filterWithName:@"CIColorAbsoluteDifference"];
    double v18 = (void *)*((void *)v7 + 2);
    *((void *)v7 + 2) = v17;

    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1E040], "filterWithName:keysAndValues:", @"CIColorThreshold", @"inputThreshold", &unk_1EF7A8350, 0);
    double v20 = (void *)*((void *)v7 + 3);
    *((void *)v7 + 3) = v19;

    unint64_t v21 = (void *)MEMORY[0x1E4F1E040];
    LODWORD(v22) = *((_DWORD *)v7 + 21);
    unint64_t v23 = [NSNumber numberWithFloat:v22];
    LODWORD(v24) = *((_DWORD *)v7 + 21);
    v25 = [NSNumber numberWithFloat:v24];
    uint64_t v26 = objc_msgSend(v21, "filterWithName:keysAndValues:", @"CIMorphologyRectangleMaximum", @"inputWidth", v23, @"inputHeight", v25, 0);
    CGRect v27 = (void *)*((void *)v7 + 4);
    *((void *)v7 + 4) = v26;

    uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1E040], "filterWithName:keysAndValues:", @"CIColorControls", *MEMORY[0x1E4F1E458], &unk_1EF7A8360, 0);
    v29 = (void *)*((void *)v7 + 5);
    *((void *)v7 + 5) = v28;

    v30 = objc_alloc_init(VNDetectContoursRequest);
    v31 = (void *)*((void *)v7 + 6);
    *((void *)v7 + 6) = v30;

    *((void *)v7 + 21) = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    [*((id *)v7 + 6) setDetectsDarkOnLight:0];
    LODWORD(v32) = 1.0;
    [*((id *)v7 + 6) setContrastAdjustment:v32];
    [*((id *)v7 + 6) setForceUseInputCVPixelBufferDirectly:1];
    [*((id *)v7 + 6) setInHierarchy:0];
    uint64_t v70 = @"parabolaLength";
    v33 = [NSNumber numberWithInteger:a4];
    id v71 = v33;
    v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];

    v35 = [VNParabolaDetection alloc];
    id v36 = v34;
    double v37 = v36;
    if (!v35)
    {
LABEL_27:

      BOOL v64 = (void *)*((void *)v7 + 22);
      *((void *)v7 + 22) = v35;

      v65 = v7;
      goto LABEL_28;
    }
    float v38 = [v36 objectForKey:@"FAFrameRate"];
    BOOL v39 = v38 == 0;

    if (v39)
    {
      v35->_forestAlgoParams.FAFrameRate = 60.0;
    }
    else
    {
      v40 = [v37 objectForKey:@"FAFrameRate"];
      [v40 floatValue];
      v35->_forestAlgoParams.FAFrameRate = v41;
    }
    double v42 = [v37 objectForKey:@"parabolaLength"];
    BOOL v43 = v42 == 0;

    if (v43)
    {
      int v46 = (int)(float)((float)(v35->_forestAlgoParams.FAFrameRate * 5.0) / 30.0);
    }
    else
    {
      v44 = [v37 objectForKey:@"parabolaLength"];
      int v45 = [v44 intValue];

      if (v45 > 4)
      {
        if (v45 < 0x65)
        {
          v35->_forestAlgoParams.parabolaLength = v45;
          goto LABEL_13;
        }
        int v46 = 100;
      }
      else
      {
        int v46 = 5;
      }
    }
    v35->_forestAlgoParams.parabolaLength = v46;
LABEL_13:
    v47 = [v37 objectForKey:@"minXDistanceFromLastPointOnParabola"];
    BOOL v48 = v47 == 0;

    if (!v48)
    {
      size_t v49 = [v37 objectForKey:@"minXDistanceFromLastPointOnParabola"];
      v35->_forestAlgoParams.minXDistanceFromLastPointOnParabola = [v49 intValue];
    }
    size_t v50 = [v37 objectForKey:@"maxXDistanceFromLastPointOnParabola"];
    BOOL v51 = v50 == 0;

    if (v51)
    {
      v35->_forestAlgoParams.maxXDistanceFromLastPointOnParabola = (int)v35->internalParams.maxDistanceForSolution;
    }
    else
    {
      v52 = [v37 objectForKey:@"maxXDistanceFromLastPointOnParabola"];
      v35->_forestAlgoParams.maxXDistanceFromLastPointOnParabola = [v52 intValue];
    }
    v53 = [v37 objectForKey:@"minYDistanceFromLastPointOnParabola"];
    BOOL v54 = v53 == 0;

    if (!v54)
    {
      v55 = [v37 objectForKey:@"minYDistanceFromLastPointOnParabola"];
      v35->_forestAlgoParams.minYDistanceFromLastPointOnParabola = [v55 intValue];
    }
    v56 = [v37 objectForKey:@"maxYDistanceFromLastPointOnParabola"];
    BOOL v57 = v56 == 0;

    if (v57)
    {
      v35->_forestAlgoParams.maxYDistanceFromLastPointOnParabola = (int)v35->internalParams.maxDistanceForSolution;
    }
    else
    {
      v58 = [v37 objectForKey:@"maxYDistanceFromLastPointOnParabola"];
      v35->_forestAlgoParams.maxYDistanceFromLastPointOnParabola = [v58 intValue];
    }
    uint64_t v59 = [v37 objectForKey:@"maxFramesSkippedToContinueParabolaDetection"];
    BOOL v60 = v59 == 0;

    if (v60)
    {
      int maxFramesSkippedToContinueParabolaDetection = (int)(float)((float)(v35->_forestAlgoParams.FAFrameRate * 7.0) / 30.0);
      v35->_forestAlgoParams.int maxFramesSkippedToContinueParabolaDetection = maxFramesSkippedToContinueParabolaDetection;
    }
    else
    {
      v61 = [v37 objectForKey:@"maxFramesSkippedToContinueParabolaDetection"];
      v35->_forestAlgoParams.int maxFramesSkippedToContinueParabolaDetection = [v61 intValue];

      int maxFramesSkippedToContinueParabolaDetection = v35->_forestAlgoParams.maxFramesSkippedToContinueParabolaDetection;
    }
    v35->parabolaSearchBuffer.maxFramesSkippedForDetection = maxFramesSkippedToContinueParabolaDetection;
    *(void *)&v35->parabolaSearchBuffer.minRegionSizeX = *(void *)&v35->internalParams.minRegionSizeX;
    v35->UID_counter = 0;
    std::__tree<std::__value_type<int,InternalObservedParabola>,std::__map_value_compare<int,std::__value_type<int,InternalObservedParabola>,std::less<int>,true>,std::allocator<std::__value_type<int,InternalObservedParabola>>>::destroy((void *)v35->internalParabolas.__tree_.__pair1_.__value_.__left_);
    v35->internalParabolas.__tree_.__begin_node_ = &v35->internalParabolas.__tree_.__pair1_;
    v35->internalParabolas.__tree_.__pair3_.__value_ = 0;
    v35->internalParabolas.__tree_.__pair1_.__value_.__left_ = 0;
    std::__tree<std::__value_type<int,ObservedParabola>,std::__map_value_compare<int,std::__value_type<int,ObservedParabola>,std::less<int>,true>,std::allocator<std::__value_type<int,ObservedParabola>>>::destroy((void *)v35->_observedParabolas.__tree_.__pair1_.__value_.__left_);
    v35->_observedParabolas.__tree_.__begin_node_ = &v35->_observedParabolas.__tree_.__pair1_;
    v35->_observedParabolas.__tree_.__pair3_.__value_ = 0;
    v35->_observedParabolas.__tree_.__pair1_.__value_.__left_ = 0;
    v63 = v35;
    goto LABEL_27;
  }
LABEL_28:

  return (VNTrajectoryProcessor *)v7;
}

@end