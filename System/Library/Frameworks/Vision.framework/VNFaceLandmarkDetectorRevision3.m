@interface VNFaceLandmarkDetectorRevision3
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
+ (unsigned)landmarkDetectorDNNVersion;
+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3;
- (CGRect)normalizedFaceBBoxForLandmarks:(id)a3;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNFaceLandmarkDetectorRevision3

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return @"landmarksflow-gwkf986dmy_63053_plus_8dtz95rnyx_quantized.espresso";
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return @"image";
}

+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3
{
  id v4 = a3;
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___VNFaceLandmarkDetectorRevision3;
  objc_msgSendSuper2(&v5, sel_recordDefaultConfigurationOptionsInDictionary_, v4);
  [v4 setObject:&unk_1EF7A7340 forKeyedSubscript:@"VNFaceLandmarkDetectorDNNProcessOption_Constellation"];
}

+ (unsigned)landmarkDetectorDNNVersion
{
  return 2;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v12 = *(void *)&a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v65[1] = *MEMORY[0x1E4F143B8];
  id v19 = a5;
  id v20 = a7;
  id v21 = a9;
  v64.receiver = self;
  v64.super_class = (Class)VNFaceLandmarkDetectorRevision3;
  v22 = -[VNFaceLandmarkDetectorDNN processRegionOfInterest:croppedPixelBuffer:options:qosClass:warningRecorder:error:progressHandler:](&v64, sel_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler_, a4, v19, v12, v20, a8, v21, x, y, width, height);
  v23 = v22;
  if (!v22)
  {
    id v47 = 0;
    goto LABEL_44;
  }
  v24 = [v22 firstObject];
  if (v24)
  {
    if ([v23 count] != 1)
    {
      if (a8)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:@"Internal error while processing Face Landmarks"];
        id v47 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v47 = 0;
      }
      goto LABEL_43;
    }
    v25 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v19 error:a8];
    if (!v25
      || (uint64_t v63 = 0,
          unsigned int v62 = 0,
          ![(VNFaceLandmarkDetectorDNN *)self requestConstellation:&v63 cvmlConstellation:&v62 fromOptions:v19 error:a8]))
    {
      id v47 = 0;
LABEL_42:

      goto LABEL_43;
    }
    v26 = [(VNDetector *)self validatedImageBufferFromOptions:v19 error:a8];
    if (!v26)
    {
      id v47 = 0;
LABEL_41:

      goto LABEL_42;
    }
    __p = 0;
    v60 = 0;
    uint64_t v61 = 0;
    if (![(VNFaceLandmarkDetectorDNN *)self getLandmarkPoints:&__p forRequestConstellation:2 error:a8]|| (v27 = [(VNFaceLandmarkDetectorDNN *)self landmarkPoints65], ![(VNFaceLandmarkDetector *)self postprocessLandmarkResultsForLandmarks:v27 imageBuffer:v26 outputFace:v24 options:v19 warningRecorder:v20 error:a8])|| (v56 = (void *)*((void *)__p + 6), std::vector<_Geometry2D_point2D_>::push_back[abi:ne180100]((void **)v27, &v56), v56 = (void *)*((void *)__p + 13), std::vector<_Geometry2D_point2D_>::push_back[abi:ne180100]((void **)v27, &v56),
          ![(VNFaceLandmarkDetectorDNN *)self translateAndNormalizeLandmarkPointsWrtLLCofAlignedFaceBBox:v27 imageBuffer:v26 outputFace:v24 error:a8]))
    {
      id v47 = 0;
      goto LABEL_38;
    }
    v28 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*v27 length:v27[1] - *v27];
    if (v28)
    {
      id v55 = v28;
      objc_msgSend(v24, "setLandmarkPoints65Data:originatingRequestSpecifier:");
      if ([(VNFaceLandmarkDetectorDNN *)self translateAndNormalizeLandmarkPointsWrtLLCofAlignedFaceBBox:&__p imageBuffer:v26 outputFace:v24 error:a8])
      {
        v56 = 0;
        v57 = 0;
        uint64_t v58 = 0;
        if ([(VNFaceLandmarkDetectorDNN *)self getLandmarkErrorEstimates:&v56 forRequestConstellation:2 error:a8])
        {
          v31 = (float *)v56;
          if (v56 != v57)
          {
            v32 = (float *)((char *)v56 + 4);
            if ((char *)v56 + 4 != v57)
            {
              float v33 = *(float *)v56;
              v34 = (float *)((char *)v56 + 4);
              do
              {
                float v35 = *v34++;
                float v36 = v35;
                if (v33 < v35)
                {
                  float v33 = v36;
                  v31 = v32;
                }
                v32 = v34;
              }
              while (v34 != (float *)v57);
            }
          }
          float v37 = *v31 / 0.2;
          LODWORD(v29) = 1.0;
          *(float *)&double v30 = 1.0 - v37;
          BOOL v38 = v37 <= 1.0;
          double v39 = 0.0;
          if (!v38) {
            *(float *)&double v30 = 0.0;
          }
          if (*(float *)&v30 >= 0.0) {
            *(float *)&double v39 = *(float *)&v30;
          }
          if (*(float *)&v39 > 1.0) {
            *(float *)&double v39 = 1.0;
          }
          objc_msgSend(v24, "setLandmarkScore:", v39, v29, v30);
          if (v62 == 1) {
            goto LABEL_55;
          }
          if (v62 == 2)
          {
            id v40 = objc_alloc(MEMORY[0x1E4F1C9B8]);
            uint64_t v41 = [v40 initWithBytes:__p length:v60 - (unsigned char *)__p];
            v52 = (void *)v41;
            if (v41)
            {
              [v24 setLandmarkPointsData:v41 originatingRequestSpecifier:v25];
              id v42 = objc_alloc(MEMORY[0x1E4F1CA48]);
              v54 = (void *)[v42 initWithCapacity:(v57 - (unsigned char *)v56) >> 2];
              v45 = v56;
              v44 = v57;
              v53 = v57;
              while (v45 != v44)
              {
                LODWORD(v43) = *v45;
                v46 = [NSNumber numberWithFloat:v43];
                [v54 addObject:v46];

                ++v45;
                v44 = v53;
              }
              v51 = (void *)[v54 copy];
              [v24 setLandmarkPrecisionEstimatesPerPoint:v51];

LABEL_55:
              v65[0] = v24;
              id v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
              goto LABEL_56;
            }
            if (a8)
            {
              +[VNError errorForInternalErrorWithLocalizedDescription:@"Internal error while processing Face Landmarks"];
              id v47 = 0;
              *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:
              if (v56)
              {
                v57 = v56;
                operator delete(v56);
              }
              goto LABEL_58;
            }
          }
          else if (a8)
          {
            id v49 = [NSString alloc];
            v50 = objc_msgSend(v49, "initWithFormat:", @"Unexpected landmarks constellation (%d) while processing Face Landmarks", v62);
            *a8 = +[VNError errorForInternalErrorWithLocalizedDescription:v50];
          }
        }
        id v47 = 0;
        goto LABEL_56;
      }
      id v47 = 0;
    }
    else
    {
      if (!a8)
      {
        id v47 = 0;
LABEL_59:

LABEL_38:
        if (__p)
        {
          v60 = __p;
          operator delete(__p);
        }
        goto LABEL_41;
      }
      id v55 = 0;
      +[VNError errorForInternalErrorWithLocalizedDescription:@"Internal error while processing Face Landmarks"];
      id v47 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_58:
    v28 = v55;
    goto LABEL_59;
  }
  id v47 = v23;
LABEL_43:

LABEL_44:
  [(VNFaceLandmarkDetectorDNN *)self releaseResources];

  return v47;
}

- (CGRect)normalizedFaceBBoxForLandmarks:(id)a3
{
  id v4 = a3;
  if ([v4 requestRevision] == 2 || objc_msgSend(v4, "requestRevision") == 3737841664)
  {
    [v4 unalignedBoundingBox];
    CGRect v15 = CGRectInset(v14, v14.size.width * -0.399999976 * 0.5, v14.size.height * -0.399999976 * 0.5);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VNFaceLandmarkDetectorRevision3;
    [(VNFaceLandmarkDetector *)&v13 normalizedFaceBBoxForLandmarks:v4];
  }
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;

  double v9 = x;
  double v10 = y;
  double v11 = width;
  double v12 = height;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

@end