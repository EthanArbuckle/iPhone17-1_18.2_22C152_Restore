@interface VNDetectTextRectanglesRequest
+ (Class)configurationClass;
+ (void)initialize;
- (BOOL)_detectCreditCardTextWithRequestPerformingContext:(id)a3 requestRevision:(unint64_t)a4 error:(id *)a5;
- (BOOL)_detectTextWithRequestPerformingContext:(id)a3 requestRevision:(unint64_t)a4 error:(id *)a5;
- (BOOL)detectDiacritics;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)minimizeFalseDetections;
- (BOOL)reportCharacterBoxes;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (NSString)additionalCharacters;
- (NSString)textRecognition;
- (id)_futharkRecognitionLanguage;
- (id)supportedComputeStageDevicesAndReturnError:(id *)a3;
- (unint64_t)algorithm;
- (unint64_t)minimumCharacterPixelHeight;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setAdditionalCharacters:(id)a3;
- (void)setAlgorithm:(unint64_t)a3;
- (void)setDetectDiacritics:(BOOL)a3;
- (void)setMinimizeFalseDetections:(BOOL)a3;
- (void)setMinimumCharacterPixelHeight:(unint64_t)a3;
- (void)setReportCharacterBoxes:(BOOL)reportCharacterBoxes;
- (void)setTextRecognition:(id)a3;
@end

@implementation VNDetectTextRectanglesRequest

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  VNValidatedLog(1, @"Processing detectTextRectangles request\n", v9, v10, v11, v12, v13, v14, v19);
  unint64_t v15 = [(VNDetectTextRectanglesRequest *)self algorithm];
  if (v15 < 2)
  {
    BOOL v16 = [(VNDetectTextRectanglesRequest *)self _detectTextWithRequestPerformingContext:v8 requestRevision:a3 error:a5];
LABEL_5:
    LOBYTE(a5) = v16;
    goto LABEL_6;
  }
  if (v15 == 2)
  {
    BOOL v16 = [(VNDetectTextRectanglesRequest *)self _detectCreditCardTextWithRequestPerformingContext:v8 requestRevision:a3 error:a5];
    goto LABEL_5;
  }
  if (a5)
  {
    v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid algorithm value of %lu", v15);
    *a5 = +[VNError errorWithCode:5 message:v18];

    LOBYTE(a5) = 0;
  }
LABEL_6:

  return (char)a5;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  v4 = (VNDetectTextRectanglesRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNDetectTextRectanglesRequest;
    [(VNImageBasedRequest *)&v6 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(VNDetectTextRectanglesRequest *)self setAlgorithm:[(VNDetectTextRectanglesRequest *)v4 algorithm]];
      v5 = [(VNDetectTextRectanglesRequest *)v4 textRecognition];
      [(VNDetectTextRectanglesRequest *)self setTextRecognition:v5];

      [(VNDetectTextRectanglesRequest *)self setMinimumCharacterPixelHeight:[(VNDetectTextRectanglesRequest *)v4 minimumCharacterPixelHeight]];
      [(VNDetectTextRectanglesRequest *)self setReportCharacterBoxes:[(VNDetectTextRectanglesRequest *)v4 reportCharacterBoxes]];
      [(VNDetectTextRectanglesRequest *)self setDetectDiacritics:[(VNDetectTextRectanglesRequest *)v4 detectDiacritics]];
      [(VNDetectTextRectanglesRequest *)self setMinimizeFalseDetections:[(VNDetectTextRectanglesRequest *)v4 minimizeFalseDetections]];
    }
  }
}

- (BOOL)_detectTextWithRequestPerformingContext:(id)a3 requestRevision:(unint64_t)a4 error:(id *)a5
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  v76 = a5;
  objc_super v6 = [v63 imageBufferAndReturnError:a5];
  v62 = v6;
  if (v6)
  {
    id v75 = v6;
    uint64_t v7 = [v75 width];
    uint64_t v8 = [v75 height];
    uint64_t v9 = 0;
    char v10 = 1;
    do
    {
      uint64_t v11 = (__CVBuffer *)[v75 bufferWithWidth:v7 height:v8 format:*((unsigned int *)&_createFutharkCompatiblePixelBufferFromImageBuffer(VNImageBuffer *,NSError * {__autoreleasing}*)::kPreferredPixelFormats+ v9) options:0 error:v76];
      char v12 = v10 & (v11 == 0);
      uint64_t v9 = 1;
      char v10 = 0;
    }
    while ((v12 & 1) != 0);

    if (v11)
    {
      BOOL v67 = [(VNDetectTextRectanglesRequest *)self reportCharacterBoxes];
      size_t Width = CVPixelBufferGetWidth(v11);
      size_t Height = CVPixelBufferGetHeight(v11);
      double v15 = (double)Height;
      BOOL v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F62BA8]), "initWithDimensions:", (double)Width, (double)Height);
      if (v16)
      {
        unint64_t v17 = [(VNDetectTextRectanglesRequest *)self minimumCharacterPixelHeight];
        if (v17)
        {
          if (v17 >= 0x7FFFFFFF) {
            uint64_t v18 = 0x7FFFFFFFLL;
          }
          else {
            uint64_t v18 = v17;
          }
          [v16 setMinimumCharacterHeight:v18];
        }
        else
        {
          uint64_t v18 = 0;
        }
        objc_msgSend(v16, "setDetectDiacritics:", -[VNDetectTextRectanglesRequest detectDiacritics](self, "detectDiacritics"));
        objc_msgSend(v16, "setMinimizeFalseDetections:", -[VNDetectTextRectanglesRequest minimizeFalseDetections](self, "minimizeFalseDetections"));
        if (Width >= Height) {
          unint64_t v21 = Height;
        }
        else {
          unint64_t v21 = Width;
        }
        if (v21 < 2 * v18) {
          VNRecordImageTooSmallWarningWithImageMinimumShortDimension(self, 2 * v18);
        }
        v22 = [(VNDetectTextRectanglesRequest *)self _futharkRecognitionLanguage];
        if (v22)
        {
          [v16 setRecognitionLanguage:v22];
          int v20 = 1;
        }
        else
        {
          int v20 = 0;
        }
        [v16 setReturnSubFeatures:v67];
        [(VNImageBasedRequest *)self regionOfInterestPixelRectForWidth:(unint64_t)(double)Width height:(unint64_t)v15];
        v61 = objc_msgSend(v16, "detectFeaturesInBuffer:withRegionOfInterest:error:", v11, v76);
        BOOL v23 = v61 == 0;
      }
      else
      {
        if (v76)
        {
          +[VNError errorWithCode:9 message:@"Text detector object was not created"];
          v61 = 0;
          int v20 = 0;
          id *v76 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v61 = 0;
          int v20 = 0;
        }
        BOOL v23 = 1;
      }

      BOOL v66 = v20 != 0;
      CVPixelBufferRelease(v11);
      if (v23)
      {
        BOOL v19 = 0;
LABEL_84:

        goto LABEL_85;
      }
      v80 = [(VNRequest *)self specifier];
      v64 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v61, "count"));
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id obj = v61;
      uint64_t v70 = [obj countByEnumeratingWithState:&v85 objects:v94 count:16];
      if (!v70)
      {
LABEL_79:

        [(VNRequest *)self setResults:v64];
        BOOL v19 = 1;
LABEL_83:

        goto LABEL_84;
      }
      uint64_t v69 = *(void *)v86;
LABEL_30:
      uint64_t v74 = 0;
      while (1)
      {
        if (*(void *)v86 != v69) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v85 + 1) + 8 * v74);
        if (!objc_msgSend(v24, "type", v61, v62)) {
          break;
        }
LABEL_77:
        if (++v74 == v70)
        {
          uint64_t v70 = [obj countByEnumeratingWithState:&v85 objects:v94 count:16];
          if (!v70) {
            goto LABEL_79;
          }
          goto LABEL_30;
        }
      }
      v71 = [v24 corners];
      if (!v71 || [v71 count] != 4) {
        goto LABEL_45;
      }
      v25 = [v71 objectAtIndexedSubscript:0];
      if (CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)v25, &point))
      {
        v26 = [v71 objectAtIndexedSubscript:1];
        if (CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)v26, &v91))
        {
          v27 = [v71 objectAtIndexedSubscript:2];
          if (CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)v27, &v90))
          {
            CFDictionaryRef v28 = [v71 objectAtIndexedSubscript:3];
            BOOL v29 = CGPointMakeWithDictionaryRepresentation(v28, &v89);

            if (v29)
            {
              v30 = [VNTextObservation alloc];
              v72 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:](v30, "initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:", v80, point.x, 1.0 - point.y, v89.x, 1.0 - v89.y, v90.x, 1.0 - v90.y, v91.x, 1.0 - v91.y);
              if (v72)
              {
LABEL_46:
                if (v66)
                {
                  v35 = [v24 text];
                  [(VNTextObservation *)v72 setText:v35];
                }
                [v64 addObject:v72];
                if (v67)
                {
                  v36 = [v24 subFeatures];
                  if (v36)
                  {
                    id v77 = v36;
                    v79 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v36, "count"));
                    long long v83 = 0u;
                    long long v84 = 0u;
                    long long v81 = 0u;
                    long long v82 = 0u;
                    id v78 = v77;
                    uint64_t v37 = [v78 countByEnumeratingWithState:&v81 objects:v93 count:16];
                    if (!v37) {
                      goto LABEL_75;
                    }
                    uint64_t v38 = *(void *)v82;
                    while (1)
                    {
                      for (uint64_t i = 0; i != v37; ++i)
                      {
                        if (*(void *)v82 != v38) {
                          objc_enumerationMutation(v78);
                        }
                        id v40 = *(id *)(*((void *)&v81 + 1) + 8 * i);
                        id v41 = v80;
                        if (!v40 || [v40 type] != 1)
                        {
                          v59 = 0;
                          goto LABEL_71;
                        }
                        [v40 boundingBox];
                        double v43 = v42;
                        double v45 = v44;
                        double v47 = v46;
                        double v49 = v48;
                        v50 = [v40 corners];
                        v51 = v50;
                        double v52 = 1.0 - v45 - v49;
                        if (!v50 || [v50 count] != 4) {
                          goto LABEL_69;
                        }
                        CGPoint v91 = (CGPoint)*MEMORY[0x1E4F1DAD8];
                        CGPoint point = v91;
                        CGPoint v89 = v91;
                        CGPoint v90 = v91;
                        CFDictionaryRef v53 = [v51 objectAtIndexedSubscript:0];
                        if (!CGPointMakeWithDictionaryRepresentation(v53, &point)) {
                          goto LABEL_68;
                        }
                        CFDictionaryRef v54 = [v51 objectAtIndexedSubscript:1];
                        if (!CGPointMakeWithDictionaryRepresentation(v54, &v91)) {
                          goto LABEL_67;
                        }
                        v55 = [v51 objectAtIndexedSubscript:2];
                        if (!CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)v55, &v90))
                        {

LABEL_67:
LABEL_68:

                          goto LABEL_69;
                        }
                        CFDictionaryRef v56 = [v51 objectAtIndexedSubscript:3];
                        BOOL v73 = CGPointMakeWithDictionaryRepresentation(v56, &v89);

                        if (v73)
                        {
                          v57 = [_VNTextObservationCharacterBox alloc];
                          uint64_t v58 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:](v57, "initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:", v41, point.x, 1.0 - point.y, v89.x, 1.0 - v89.y, v90.x, 1.0 - v90.y, v91.x, 1.0 - v91.y);
                          v59 = (_VNTextObservationCharacterBox *)v58;
                          if (v58)
                          {
                            *(double *)(v58 + 96) = v43;
                            *(double *)(v58 + 104) = v52;
                            *(double *)(v58 + 112) = v47;
                            *(double *)(v58 + 120) = v49;
                          }
                          goto LABEL_70;
                        }
LABEL_69:
                        v59 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:boundingBox:]([_VNTextObservationCharacterBox alloc], "initWithOriginatingRequestSpecifier:boundingBox:", v41, v43, v52, v47, v49);
LABEL_70:

LABEL_71:
                        if (v59) {
                          [v79 addObject:v59];
                        }
                      }
                      uint64_t v37 = [v78 countByEnumeratingWithState:&v81 objects:v93 count:16];
                      if (!v37)
                      {
LABEL_75:

                        [(VNTextObservation *)v72 setCharacterBoxes:v79];
                        break;
                      }
                    }
                  }
                }

                goto LABEL_77;
              }
            }
LABEL_45:
            [v24 boundingBox];
            v72 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:boundingBox:]([VNTextObservation alloc], "initWithOriginatingRequestSpecifier:boundingBox:", v80, v33, 1.0 - v31 - v32, v34, v32);
            if (!v72)
            {
              if (v76)
              {
                id *v76 = +[VNError errorForMemoryAllocationFailure];
              }

              BOOL v19 = 0;
              goto LABEL_83;
            }
            goto LABEL_46;
          }
        }
      }

      goto LABEL_45;
    }
  }
  BOOL v19 = 0;
LABEL_85:

  return v19;
}

- (id)_futharkRecognitionLanguage
{
  v3 = [(VNDetectTextRectanglesRequest *)self textRecognition];
  v4 = v3;
  if (v3 && ([v3 isEqualToString:@"VNTextRecognitionOptionNone"] & 1) == 0)
  {
    id v5 = [(id)ourTextRecognitionLanguageOptionToFutharkRecognitionLanguageMap objectForKeyedSubscript:v4];
    if (v5)
    {
      objc_super v6 = [(VNDetectTextRectanglesRequest *)self additionalCharacters];
      if ([v6 length])
      {
        uint64_t v7 = [v5 stringByAppendingFormat:@";%@", v6];

        id v5 = (id)v7;
      }
      id v5 = v5;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_detectCreditCardTextWithRequestPerformingContext:(id)a3 requestRevision:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = [v7 imageBufferAndReturnError:a5];
  if (v8)
  {
    uint64_t v9 = [v7 session];
    id v10 = [(VNRequest *)self newDefaultDetectorOptionsForSession:v9];
    uint64_t v11 = [[VNCCTextDetector alloc] initWithOptions:v10];
    if (v11)
    {
      char v12 = [(VNRequest *)self specifier];
      uint64_t v13 = [(VNCCTextDetector *)v11 textBoxesForImage:v8 originatingRequestSpecifier:v12 error:a5];

      BOOL v14 = v13 != 0;
      if (v13) {
        [(VNRequest *)self setResults:v13];
      }
    }
    else if (a5)
    {
      +[VNError errorWithCode:9 message:@"Text detector object was not created"];
      BOOL v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)setMinimizeFalseDetections:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setMinimizeFalseDetections:v3];
}

- (BOOL)minimizeFalseDetections
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 minimizeFalseDetections];

  return v3;
}

- (void)setDetectDiacritics:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setDetectDiacritics:v3];
}

- (BOOL)detectDiacritics
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 detectDiacritics];

  return v3;
}

- (void)setReportCharacterBoxes:(BOOL)reportCharacterBoxes
{
  BOOL v3 = reportCharacterBoxes;
  id v4 = [(VNRequest *)self configuration];
  [v4 setReportCharacterBoxes:v3];
}

- (BOOL)reportCharacterBoxes
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 reportCharacterBoxes];

  return v3;
}

- (void)setMinimumCharacterPixelHeight:(unint64_t)a3
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setMinimumCharacterPixelHeight:a3];
}

- (unint64_t)minimumCharacterPixelHeight
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 minimumCharacterPixelHeight];

  return v3;
}

- (void)setAdditionalCharacters:(id)a3
{
  id v5 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setAdditionalCharacters:v5];
}

- (NSString)additionalCharacters
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 additionalCharacters];

  return (NSString *)v3;
}

- (void)setTextRecognition:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(id)ourTextRecognitionLanguageOptionToFutharkRecognitionLanguageMap objectForKey:v4],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    id v7 = v4;
  }
  else
  {
    id v7 = (id)[v4 copy];

    objc_super v6 = [(VNRequest *)self configuration];
    [v6 setTextRecognition:v7];
  }
}

- (NSString)textRecognition
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 textRecognition];

  return (NSString *)v3;
}

- (void)setAlgorithm:(unint64_t)a3
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setAlgorithm:a3];
}

- (unint64_t)algorithm
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 algorithm];

  return v3;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(VNDetectTextRectanglesRequest *)self minimumCharacterPixelHeight];
  if (v5 < [v4 minimumCharacterPixelHeight]
    || [(VNDetectTextRectanglesRequest *)self reportCharacterBoxes]
    && ![v4 reportCharacterBoxes])
  {
    goto LABEL_8;
  }
  int v6 = [(VNDetectTextRectanglesRequest *)self detectDiacritics];
  if (v6 != [v4 detectDiacritics]) {
    goto LABEL_8;
  }
  int v7 = [(VNDetectTextRectanglesRequest *)self minimizeFalseDetections];
  if (v7 != [v4 minimizeFalseDetections]) {
    goto LABEL_8;
  }
  uint64_t v8 = [(VNDetectTextRectanglesRequest *)self additionalCharacters];
  uint64_t v9 = [v4 additionalCharacters];
  char v10 = VisionCoreEqualOrNilObjects();

  if (v10)
  {
    v13.receiver = self;
    v13.super_class = (Class)VNDetectTextRectanglesRequest;
    BOOL v11 = [(VNImageBasedRequest *)&v13 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
LABEL_8:
    BOOL v11 = 0;
  }

  return v11;
}

- (id)supportedComputeStageDevicesAndReturnError:(id *)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(VNDetectTextRectanglesRequest *)self algorithm];
  if (v4 >= 2)
  {
    if (v4 == 2)
    {
      uint64_t v9 = @"VNComputeStageMain";
      int v6 = +[VNComputeDeviceUtilities allCPUComputeDevices];
      char v10 = v6;
      a3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    }
    else if (a3)
    {
      int v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid algorithm value of %lu", v4);
      *a3 = +[VNError errorWithCode:5 message:v7];

      a3 = 0;
    }
  }
  else
  {
    BOOL v11 = @"VNComputeStageMain";
    unint64_t v5 = +[VNComputeDeviceUtilities allCPUComputeDevices];
    v12[0] = v5;
    a3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }

  return a3;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (void)initialize
{
  v5[12] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v4[0] = @"VNTextRecognitionOptionASCIICharacterSet";
    v4[1] = @"VNTextRecognitionOptionEnglishCharacterSet";
    v5[0] = @"ASCII";
    v5[1] = @"en";
    v4[2] = @"VNTextRecognitionOptionDanishCharacterSet";
    v4[3] = @"VNTextRecognitionOptionDutchCharacterSet";
    v5[2] = @"da";
    v5[3] = @"nl";
    v4[4] = @"VNTextRecognitionOptionFrenchCharacterSet";
    v4[5] = @"VNTextRecognitionOptionGermanCharacterSet";
    v5[4] = @"fr";
    v5[5] = @"de";
    v4[6] = @"VNTextRecognitionOptionIcelandicCharacterSet";
    v4[7] = @"VNTextRecognitionOptionItalianCharacterSet";
    v5[6] = @"is";
    v5[7] = @"it";
    v4[8] = @"VNTextRecognitionOptionNorwegianCharacterSet";
    v4[9] = @"VNTextRecognitionOptionPortugueseCharacterSet";
    v5[8] = @"no";
    v5[9] = @"pt";
    v4[10] = @"VNTextRecognitionOptionSpanishCharacterSet";
    v4[11] = @"VNTextRecognitionOptionSwedishCharacterSet";
    v5[10] = @"es";
    v5[11] = @"se";
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:12];
    unint64_t v3 = (void *)ourTextRecognitionLanguageOptionToFutharkRecognitionLanguageMap;
    ourTextRecognitionLanguageOptionToFutharkRecognitionLanguageMap = v2;
  }
}

@end