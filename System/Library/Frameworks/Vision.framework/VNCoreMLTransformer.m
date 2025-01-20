@interface VNCoreMLTransformer
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (BOOL)needsMetalContext;
- (VNCoreMLModel)model;
- (VNCoreMLTransformer)initWithOptions:(id)a3 model:(id)a4 error:(id *)a5;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNCoreMLTransformer

- (void).cxx_destruct
{
}

- (VNCoreMLModel)model
{
  return (VNCoreMLModel *)objc_getProperty(self, a2, 56, 1);
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  v187[16] = *(id *)MEMORY[0x1E4F143B8];
  id v173 = a5;
  v175 = a8;
  v172 = +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:");
  if (v172)
  {
    v12 = [(VNCoreMLTransformer *)self model];
    id v13 = v173;
    v174 = v12;
    if (self)
    {
      v14 = [v12 scenePrintRequestSpecifier];

      if (v14)
      {
        v187[0] = 0;
        BOOL v15 = +[VNValidationUtilities getArray:v187 forKey:@"VNDetectorProcessOption_ScenePrints" inOptions:v13 withElementsOfClass:objc_opt_class() requiredMinimumCount:1 allowedMaximumCount:1 error:v175];
        id v16 = v187[0];
        v17 = v16;
        if (v15)
        {
          id v18 = [v16 objectAtIndexedSubscript:0];
          id v19 = v13;
          if (v12)
          {
            v20 = [VNSceneprintMLFeatureProvider alloc];
            uint64_t v22 = v174[13];
            uint64_t v21 = v174[14];
            v23 = [v174 featureProvider];
            v24 = [(VNSceneprintMLFeatureProvider *)v20 initWithSceneprint:v18 dataType:v21 forKey:v22 originalFeatureProvider:v23];

            v25 = -[VNCoreMLModel _configuredMLPredictionOptionsForOptions:error:](v174, v19, v175);
            if (v25)
            {
              v26 = [v174 model];
              v171 = [v26 predictionFromFeatures:v24 options:v25 error:v175];
            }
            else
            {
              v171 = 0;
            }
          }
          else
          {
            v171 = 0;
          }
        }
        else
        {
          v171 = 0;
        }
      }
      else
      {
        v28 = [v12 detectionPrintRequestSpecifier];

        if (v28)
        {
          v29 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNCoreMLTransformerProcessOption_Detectionprint" inOptions:v13 error:v175];
          v30 = v29;
          if (v29)
          {
            id v31 = v29;
            id v32 = v13;
            if (v12)
            {
              v33 = [VNDetectionprintMLFeatureProvider alloc];
              v34 = [v174 detectionPrintInputDescriptions];
              v35 = [v174 featureProvider];
              v36 = [(VNDetectionprintMLFeatureProvider *)v33 initWithDetectionprint:v31 featureDescriptions:v34 originalFeatureProvider:v35];

              v37 = -[VNCoreMLModel _configuredMLPredictionOptionsForOptions:error:](v174, v32, v175);
              if (v37)
              {
                v38 = [v174 model];
                v171 = [v38 predictionFromFeatures:v36 options:v37 error:v175];
              }
              else
              {
                v171 = 0;
              }
            }
            else
            {
              v171 = 0;
            }
          }
          else
          {
            v171 = 0;
          }
        }
        else
        {
          v171 = [v12 predictWithCVPixelBuffer:a4 options:v13 error:v175];
        }
      }
    }
    else
    {
      v171 = 0;
    }

    if (v171)
    {
      switch([v174 modelType])
      {
        case 0u:
        case 4u:
          v39 = v174;
          id v159 = v171;
          id v165 = v172;
          v155 = v39;
          if (self)
          {
            v168 = [v39 operationPoints];
            uint64_t v40 = [v39 predictedProbabilitiesKey];
            v157 = (void *)v40;
            if (v40)
            {
              v153 = [v159 featureValueForName:v40];
              v151 = [v153 dictionaryValue];
              v162 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v151, "count"));
              long long v184 = 0u;
              long long v185 = 0u;
              long long v182 = 0u;
              long long v183 = 0u;
              id v41 = v151;
              uint64_t v42 = [v41 countByEnumeratingWithState:&v182 objects:v187 count:16];
              if (v42)
              {
                uint64_t v43 = *(void *)v183;
                while (2)
                {
                  for (uint64_t i = 0; i != v42; ++i)
                  {
                    if (*(void *)v183 != v43) {
                      objc_enumerationMutation(v41);
                    }
                    id v45 = *(id *)(*((void *)&v182 + 1) + 8 * i);
                    v46 = [v41 objectForKeyedSubscript:v45];
                    [v46 floatValue];
                    int v48 = v47;

                    v49 = objc_opt_class();
                    if (([v49 isSubclassOfClass:objc_opt_class()] & 1) == 0)
                    {
                      uint64_t v50 = [[NSString alloc] initWithFormat:@"%@", v45];

                      id v45 = (id)v50;
                    }
                    v180[0] = 0;
                    char v51 = [v168 getClassificationMetrics:v180 forClassificationIdentifier:v45 error:v175];
                    id v52 = v180[0];
                    v53 = v52;
                    if ((v51 & 1) == 0)
                    {

                      id v27 = 0;
                      v58 = v162;
                      goto LABEL_83;
                    }
                    v54 = [VNClassificationObservation alloc];
                    LODWORD(v55) = v48;
                    v56 = [(VNClassificationObservation *)v54 initWithOriginatingRequestSpecifier:v165 identifier:v45 confidence:v53 classificationMetrics:v55];
                    [v162 addObject:v56];
                  }
                  uint64_t v42 = [v41 countByEnumeratingWithState:&v182 objects:v187 count:16];
                  if (v42) {
                    continue;
                  }
                  break;
                }
              }

              id v57 = &__block_literal_global_125;
              [v162 sortWithOptions:16 usingComparator:&__block_literal_global_125];

              v58 = v162;
              id v27 = v162;
LABEL_83:
            }
            else if (v175)
            {
              +[VNError errorForInvalidModelWithLocalizedDescription:@"predicted probabilities key is not available"];
              id v27 = 0;
              id *v175 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v27 = 0;
            }
          }
          else
          {
            id v27 = 0;
          }

          goto LABEL_103;
        case 3u:
        case 5u:
          v59 = v174;
          id v166 = v171;
          id v150 = v13;
          id v169 = v172;
          v160 = v59;
          if (self)
          {
            v60 = [v59 boundingBoxOutputDescription];
            v61 = [v60 coordinatesFeatureName];
            v158 = [v166 featureValueForName:v61];

            v62 = [v160 boundingBoxOutputDescription];
            v63 = [v62 confidenceFeatureName];
            v156 = [v166 featureValueForName:v63];

            if ([v158 type] == 5 && objc_msgSend(v156, "type") == 5)
            {
              v149 = [v158 multiArrayValue];
              v163 = [v156 multiArrayValue];
              v146 = [v149 shape];
              v145 = [v163 shape];
              v64 = [v149 strides];
              v65 = [v64 objectAtIndexedSubscript:0];
              uint64_t v143 = [v65 unsignedIntegerValue];

              v147 = [v163 strides];

              v66 = [v147 objectAtIndexedSubscript:0];
              uint64_t v141 = [v66 unsignedIntegerValue];

              v67 = [v146 objectAtIndexedSubscript:0];
              uint64_t v144 = [v67 unsignedIntegerValue];

              v68 = [v160 boundingBoxOutputDescription];
              v148 = [v68 labelNames];

              uint64_t v69 = [v148 count];
              v70 = [v145 objectAtIndexedSubscript:1];
              LOBYTE(v69) = v69 == [v70 unsignedIntegerValue];

              if (v69)
              {
                v71 = [v150 objectForKey:@"VNVNCoreMLTransformerProcessOption_NormalizedOriginOffsetX"];
                [v71 doubleValue];
                double v139 = v72;

                v73 = [v150 objectForKey:@"VNVNCoreMLTransformerProcessOption_NormalizedOriginOffsetY"];
                [v73 doubleValue];
                double v75 = v74;

                v76 = [v150 objectForKeyedSubscript:@"VNDetectorProcessOption_ImageCropAndScaleOption"];
                int v77 = [v76 intValue];

                v152 = [v160 operationPoints];
                v140 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v144];
                if (v144)
                {
                  uint64_t v142 = 0;
                  uint64_t v78 = 0;
                  uint64_t v137 = v77;
                  double v135 = v139 * -2.0 + 1.0;
                  double v79 = v75 * -2.0 + 1.0;
                  do
                  {
                    uint64_t v136 = v78;
                    uint64_t v80 = v78 * v143;
                    v81 = [v149 objectAtIndexedSubscript:v78 * v143 + 2];
                    [v81 doubleValue];
                    double v83 = v82;

                    v84 = [v149 objectAtIndexedSubscript:v80 + 3];
                    [v84 doubleValue];
                    double v86 = v85;

                    v87 = [v149 objectAtIndexedSubscript:v80];
                    [v87 doubleValue];
                    double v89 = v88;

                    v90 = [v149 objectAtIndexedSubscript:v80 + 1];
                    [v90 doubleValue];
                    double v92 = v91;

                    double v93 = v89 + v83 * -0.5;
                    double v94 = v92 + v86 * -0.5;
                    if (v137)
                    {
                      if (v137 == 1)
                      {
                        double v93 = (v93 - v139) / v135;
                        double v94 = (v94 - v75) / v79;
                        double v83 = v83 / v135;
                        double v86 = v86 / v79;
                      }
                    }
                    else
                    {
                      double v83 = v135 * v83;
                      double v86 = v79 * v86;
                      double v93 = v139 + v135 * v93;
                      double v94 = v75 + v79 * v94;
                    }
                    v154 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v148, "count"));
                    long long v184 = 0u;
                    long long v185 = 0u;
                    long long v182 = 0u;
                    long long v183 = 0u;
                    id v95 = v148;
                    uint64_t v96 = [v95 countByEnumeratingWithState:&v182 objects:v187 count:16];
                    if (v96)
                    {
                      uint64_t v97 = 0;
                      uint64_t v98 = *(void *)v183;
                      double v99 = 0.0;
                      while (2)
                      {
                        uint64_t v100 = 0;
                        uint64_t v138 = v97;
                        uint64_t v101 = v142 + v97;
                        do
                        {
                          if (*(void *)v183 != v98) {
                            objc_enumerationMutation(v95);
                          }
                          uint64_t v102 = *(void *)(*((void *)&v182 + 1) + 8 * v100);
                          v103 = [v163 objectAtIndexedSubscript:v101 + v100];
                          [v103 doubleValue];
                          double v105 = v104;

                          id v181 = 0;
                          char v106 = [v152 getClassificationMetrics:&v181 forClassificationIdentifier:v102 error:v175];
                          id v107 = v181;
                          v108 = v107;
                          if ((v106 & 1) == 0)
                          {

                            id v27 = 0;
                            v116 = v140;
                            goto LABEL_98;
                          }
                          v109 = [VNClassificationObservation alloc];
                          *(float *)&double v110 = v105;
                          v111 = [(VNClassificationObservation *)v109 initWithOriginatingRequestSpecifier:v169 identifier:v102 confidence:v108 classificationMetrics:v110];
                          [v154 addObject:v111];

                          double v99 = v99 + v105;
                          ++v100;
                        }
                        while (v96 != v100);
                        uint64_t v96 = [v95 countByEnumeratingWithState:&v182 objects:v187 count:16];
                        uint64_t v97 = v138 + v100;
                        if (v96) {
                          continue;
                        }
                        break;
                      }

                      if (v99 > 0.0)
                      {
                        v180[0] = (id)MEMORY[0x1E4F143A8];
                        v180[1] = (id)3221225472;
                        v180[2] = __119__VNCoreMLTransformer__recognizedObjectObservationsFromModel_outputFeatures_options_originatingRequestSpecifier_error___block_invoke;
                        v180[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
                        v180[4] = *(id *)&v99;
                        [v154 enumerateObjectsUsingBlock:v180];
                      }
                    }
                    else
                    {

                      double v99 = 0.0;
                    }
                    id v112 = &__block_literal_global_125;
                    [v154 sortWithOptions:16 usingComparator:&__block_literal_global_125];

                    v113 = [VNRecognizedObjectObservation alloc];
                    *(float *)&double v114 = v99;
                    v115 = -[VNRecognizedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:](v113, "initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:", v169, v154, 0, 0, v93, 1.0 - v94 - v86, v83, v86, v114);
                    [v140 addObject:v115];

                    uint64_t v78 = v136 + 1;
                    v142 += v141;
                  }
                  while (v136 + 1 != v144);
                }
                v116 = v140;
                id v27 = v140;
LABEL_98:
              }
              else if (v175)
              {
                +[VNError errorForInvalidModelWithLocalizedDescription:@"The confidence scores don't line up with the labels"];
                id v27 = 0;
                id *v175 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                id v27 = 0;
              }
            }
            else if (v175)
            {
              +[VNError errorForInvalidModelWithLocalizedDescription:@"The outputs of the model are of unexpected types"];
              id v27 = 0;
              id *v175 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v27 = 0;
            }
          }
          else
          {
            id v27 = 0;
          }

          goto LABEL_103;
        default:
          v117 = v174;
          id v170 = v171;
          v161 = v117;
          id v164 = v172;
          if (self)
          {
            id v167 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v118 = [v117 model];
            v119 = [v118 modelDescription];
            v120 = [v119 outputDescriptionsByName];

            long long v184 = 0u;
            long long v185 = 0u;
            long long v182 = 0u;
            long long v183 = 0u;
            id v121 = v120;
            uint64_t v122 = [v121 countByEnumeratingWithState:&v182 objects:v187 count:16];
            if (v122)
            {
              uint64_t v123 = *(void *)v183;
LABEL_69:
              uint64_t v124 = 0;
              while (1)
              {
                if (*(void *)v183 != v123) {
                  objc_enumerationMutation(v121);
                }
                uint64_t v125 = *(void *)(*((void *)&v182 + 1) + 8 * v124);
                v126 = [v121 objectForKeyedSubscript:v125];
                v127 = [v170 featureValueForName:v125];
                if (!v127)
                {
                  if (v175)
                  {
                    v130 = (void *)[[NSString alloc] initWithFormat:@"could not obtain a feature value for key \"%@\"", v125];
                    id *v175 = +[VNError errorForInvalidModelWithLocalizedDescription:v130];
                  }
                  id v27 = 0;
                  goto LABEL_89;
                }
                if ([v126 type] != 4 || objc_msgSend(v127, "type") != 4) {
                  break;
                }
                uint64_t v128 = [v127 imageBufferValue];
                if (v128)
                {
                  v129 = [[VNPixelBufferObservation alloc] initWithOriginatingRequestSpecifier:v164 featureName:v125 CVPixelBuffer:v128];
                  [v167 addObject:v129];
LABEL_78:
                }
                if (v122 == ++v124)
                {
                  uint64_t v122 = [v121 countByEnumeratingWithState:&v182 objects:v187 count:16];
                  if (v122) {
                    goto LABEL_69;
                  }
                  goto LABEL_81;
                }
              }
              v129 = [[VNCoreMLFeatureValueObservation alloc] initWithOriginatingRequestSpecifier:v164 featureName:v125 featureValue:v127];
              [v167 addObject:v129];
              goto LABEL_78;
            }
LABEL_81:

            id v27 = v167;
LABEL_89:
          }
          else
          {
            id v27 = 0;
          }

LABEL_103:
          if (v27)
          {
            long long v178 = 0u;
            long long v179 = 0u;
            long long v176 = 0u;
            long long v177 = 0u;
            id v27 = v27;
            uint64_t v131 = [v27 countByEnumeratingWithState:&v176 objects:v186 count:16];
            if (v131)
            {
              uint64_t v132 = *(void *)v177;
              do
              {
                for (uint64_t j = 0; j != v131; ++j)
                {
                  if (*(void *)v177 != v132) {
                    objc_enumerationMutation(v27);
                  }
                  [(VNDetector *)self recordImageCropQuickLookInfoFromOptions:v13 toObservation:*(void *)(*((void *)&v176 + 1) + 8 * j)];
                }
                uint64_t v131 = [v27 countByEnumeratingWithState:&v176 objects:v186 count:16];
              }
              while (v131);
            }
          }
          break;
      }
    }
    else
    {
      id v27 = 0;
    }
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

void __119__VNCoreMLTransformer__recognizedObjectObservationsFromModel_outputFeatures_options_originatingRequestSpecifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 confidence];
  double v4 = v3 / *(double *)(a1 + 32);
  *(float *)&double v4 = v4;
  [v5 setConfidence:v4];
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  uint64_t v17 = [(VNCoreMLTransformer *)self model];
  id v18 = [(id)v17 scenePrintRequestSpecifier];

  if (!v18)
  {
    v20 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a8];
    if (!v20)
    {
      BOOL v19 = 0;
LABEL_21:

      goto LABEL_22;
    }
    uint64_t v43 = v20;
    uint64_t v21 = [v16 objectForKeyedSubscript:@"VNDetectorProcessOption_ImageCropAndScaleOption"];
    int v22 = [v21 intValue];

    long long v47 = *MEMORY[0x1E4F1DAD8];
    uint64_t v45 = 0x3FF0000000000000;
    uint64_t v46 = 0x3FF0000000000000;
    unint64_t v23 = [v20 width];
    unint64_t v24 = [v20 height];
    v48.origin.double x = x * (double)v23;
    v48.size.double width = width * (double)v23;
    v48.origin.double y = y * (double)v24;
    v48.size.double height = height * (double)v24;
    CGRect v49 = CGRectIntegral(v48);
    double v25 = v49.origin.x;
    double v26 = v49.origin.y;
    double v27 = v49.size.width;
    double v28 = v49.size.height;
    if (v17 && v23 && v24 && *(void *)(v17 + 48))
    {
      [*(id *)(v17 + 40) modelDescription];
      v42 = int v40 = v22;
      id v41 = [v42 inputDescriptionsByName];
      v29 = [v41 objectForKeyedSubscript:*(void *)(v17 + 48)];
      v30 = [v29 imageConstraint];
      id v31 = [v30 sizeConstraint];

      int v22 = v40;
      if (v31)
      {
        id v32 = [v31 allowedImageSizeClosestToPixelsWide:v23 pixelsHigh:v24 preferDownScaling:1 preferInputAspectRatio:1];
        *(void *)(v17 + 80) = [v32 pixelsWide];
        *(void *)(v17 + 88) = [v32 pixelsHigh];
      }
    }
    uint64_t v33 = [(id)v17 inputImageWidth];
    uint64_t v34 = [(id)v17 inputImageHeight];
    if (v33 && v34)
    {
      id v44 = 0;
      v35 = (__CVBuffer *)objc_msgSend(v43, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:pixelBufferRepsCacheKey:", v33, v34, objc_msgSend((id)v17, "inputImageFormat"), v22, v16, a8, v25, v26, v27, v28, &v47, &v46, &v45, &v44);
      id v36 = v44;
      *a7 = v35;
      if (v35)
      {
        v37 = [NSNumber numberWithDouble:*(double *)&v47];
        [v16 setObject:v37 forKey:@"VNVNCoreMLTransformerProcessOption_NormalizedOriginOffsetX"];

        v38 = [NSNumber numberWithDouble:*((double *)&v47 + 1)];
        [v16 setObject:v38 forKey:@"VNVNCoreMLTransformerProcessOption_NormalizedOriginOffsetY"];

        [(VNDetector *)self recordImageCropQuickLookInfoToOptions:v16 cacheKey:v36 imageBuffer:v43];
        BOOL v19 = 1;
LABEL_20:

        v20 = v43;
        goto LABEL_21;
      }
    }
    else
    {
      if (a8)
      {
        +[VNError errorForInvalidModelWithLocalizedDescription:@"The inputImageFeatureName does not point to a MLFeatureTypeImage input."];
        id v36 = 0;
        BOOL v19 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      id v36 = 0;
    }
    BOOL v19 = 0;
    goto LABEL_20;
  }
  BOOL v19 = 1;
LABEL_22:

  return v19;
}

- (BOOL)needsMetalContext
{
  return 0;
}

- (VNCoreMLTransformer)initWithOptions:(id)a3 model:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9 && (v10 = objc_opt_class(), ([v10 isSubclassOfClass:objc_opt_class()] & 1) != 0))
  {
    v17.receiver = self;
    v17.super_class = (Class)VNCoreMLTransformer;
    v11 = [(VNDetector *)&v17 initWithConfigurationOptions:v8];
    v12 = v11;
    if (v11
      && (objc_storeStrong((id *)&v11->_model, a4),
          id v13 = objc_alloc_init(VNSession),
          BOOL v14 = [(VNDetector *)v12 completeInitializationForSession:v13 error:a5], v13, !v14))
    {
      BOOL v15 = 0;
      self = v12;
    }
    else
    {
      self = v12;
      BOOL v15 = self;
    }
  }
  else if (a5)
  {
    +[VNError errorWithCode:5 message:@"No valid VNCoreMLModel found in passed in options"];
    BOOL v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  double v4 = +[VNComputeDeviceUtilities allComputeDevices];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

@end