@interface VNRecognizeTextRequest
+ (Class)configurationClass;
+ (NSArray)supportedRecognitionLanguagesForTextRecognitionLevel:(VNRequestTextRecognitionLevel)recognitionLevel revision:(NSUInteger)requestRevision error:(NSError *)error;
+ (const)revisionAvailability;
- (BOOL)automaticallyDetectsLanguage;
- (BOOL)hasCancellationHook;
- (BOOL)indeterminate;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)keepResourcesLoaded;
- (BOOL)usesLanguageCorrection;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (NSArray)customWords;
- (NSArray)recognitionLanguages;
- (NSArray)supportedRecognitionLanguagesAndReturnError:(NSError *)error;
- (VNRequestTextRecognitionLevel)recognitionLevel;
- (float)minimumTextHeight;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (id)progressHandler;
- (id)sequencedRequestPreviousObservationsKey;
- (unint64_t)_CRImageReaderRevisionForRevision:(unint64_t)a3;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setAutomaticallyDetectsLanguage:(BOOL)automaticallyDetectsLanguage;
- (void)setCustomWords:(NSArray *)customWords;
- (void)setKeepResourcesLoaded:(BOOL)a3;
- (void)setMinimumTextHeight:(float)minimumTextHeight;
- (void)setProgressHandler:(id)a3;
- (void)setRecognitionLanguages:(NSArray *)recognitionLanguages;
- (void)setRecognitionLevel:(VNRequestTextRecognitionLevel)recognitionLevel;
- (void)setUsesLanguageCorrection:(BOOL)usesLanguageCorrection;
@end

@implementation VNRecognizeTextRequest

- (void).cxx_destruct
{
}

- (BOOL)indeterminate
{
  return self->indeterminate;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->progressHandler;
}

- (NSArray)supportedRecognitionLanguagesAndReturnError:(NSError *)error
{
  unint64_t v5 = [(VNRequest *)self resolvedRevision];
  id v6 = [(VNRecognizeTextRequest *)self newDefaultDetectorOptionsForRequestRevision:v5 session:0];
  if (v5 == 1)
  {
    v7 = &unk_1EF7A7E98;
  }
  else
  {
    v7 = +[VNCRImageReaderDetector supportedLanguagesForProcessOptions:v6 error:error];
  }

  return (NSArray *)v7;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [v8 imageBufferAndReturnError:a5];
  if (v9)
  {
    v10 = [v8 session];
    id v19 = 0;
    v11 = [(VNRequest *)self applicableDetectorAndOptions:&v19 forRevision:a3 loadedInSession:v10 error:a5];
    id v12 = v19;
    if (v11)
    {
      v20[0] = v9;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      [v12 setObject:v13 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      v14 = [(VNRequest *)self detectorProgressHandler];
      uint64_t v15 = [v8 qosClass];
      [(VNImageBasedRequest *)self regionOfInterest];
      v16 = objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v15, v12, self, a5, v14);
      BOOL v17 = v16 != 0;
      if (v16) {
        [(VNRequest *)self setResults:v16];
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)sequencedRequestPreviousObservationsKey
{
  id v3 = [NSString alloc];
  v15.receiver = self;
  v15.super_class = (Class)VNRecognizeTextRequest;
  v4 = [(VNRequest *)&v15 sequencedRequestPreviousObservationsKey];
  unint64_t v5 = [(VNRecognizeTextRequest *)self recognitionLanguages];
  id v6 = _sequenceKeyComponentForArray(v5);
  v7 = [(VNRecognizeTextRequest *)self customWords];
  id v8 = _sequenceKeyComponentForArray(v7);
  VNRequestTextRecognitionLevel v9 = [(VNRecognizeTextRequest *)self recognitionLevel];
  BOOL v10 = [(VNRecognizeTextRequest *)self usesLanguageCorrection];
  BOOL v11 = [(VNRecognizeTextRequest *)self automaticallyDetectsLanguage];
  [(VNRecognizeTextRequest *)self minimumTextHeight];
  v13 = (void *)[v3 initWithFormat:@"%@:%@:%p:%ld:%d:%d:%f", v4, v6, v8, v9, v10, v11, v12];

  return v13;
}

- (BOOL)keepResourcesLoaded
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 keepResourcesLoaded];

  return v3;
}

- (void)setKeepResourcesLoaded:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setKeepResourcesLoaded:v3];
}

- (float)minimumTextHeight
{
  v2 = [(VNRequest *)self configuration];
  [v2 minimumTextHeight];
  float v4 = v3;

  return v4;
}

- (void)setMinimumTextHeight:(float)minimumTextHeight
{
  id v5 = [(VNRequest *)self configuration];
  *(float *)&double v4 = minimumTextHeight;
  [v5 setMinimumTextHeight:v4];
}

- (BOOL)automaticallyDetectsLanguage
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 automaticallyDetectsLanguage];

  return v3;
}

- (void)setAutomaticallyDetectsLanguage:(BOOL)automaticallyDetectsLanguage
{
  BOOL v3 = automaticallyDetectsLanguage;
  id v4 = [(VNRequest *)self configuration];
  [v4 setAutomaticallyDetectsLanguage:v3];
}

- (BOOL)usesLanguageCorrection
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 usesLanguageCorrection];

  return v3;
}

- (void)setUsesLanguageCorrection:(BOOL)usesLanguageCorrection
{
  BOOL v3 = usesLanguageCorrection;
  id v4 = [(VNRequest *)self configuration];
  [v4 setUsesLanguageCorrection:v3];
}

- (VNRequestTextRecognitionLevel)recognitionLevel
{
  v2 = [(VNRequest *)self configuration];
  VNRequestTextRecognitionLevel v3 = [v2 recognitionLevel];

  return v3;
}

- (void)setRecognitionLevel:(VNRequestTextRecognitionLevel)recognitionLevel
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setRecognitionLevel:recognitionLevel];
}

- (NSArray)customWords
{
  v2 = [(VNRequest *)self configuration];
  VNRequestTextRecognitionLevel v3 = [v2 customWords];

  return (NSArray *)v3;
}

- (void)setCustomWords:(NSArray *)customWords
{
  id v5 = (id)[(NSArray *)customWords copy];
  id v4 = [(VNRequest *)self configuration];
  [v4 setCustomWords:v5];
}

- (NSArray)recognitionLanguages
{
  v2 = [(VNRequest *)self configuration];
  VNRequestTextRecognitionLevel v3 = [v2 recognitionLanguages];

  return (NSArray *)v3;
}

- (void)setRecognitionLanguages:(NSArray *)recognitionLanguages
{
  id v5 = (id)[(NSArray *)recognitionLanguages copy];
  id v4 = [(VNRequest *)self configuration];
  [v4 setRecognitionLanguages:v5];
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(VNRecognizeTextRequest *)self recognitionLanguages];
  id v6 = [v4 recognitionLanguages];
  char v7 = [v5 isEqualToArray:v6];

  if ((v7 & 1) == 0) {
    goto LABEL_7;
  }
  id v8 = [(VNRecognizeTextRequest *)self customWords];
  VNRequestTextRecognitionLevel v9 = [v4 customWords];
  char v10 = VisionCoreEquivalentOrNilUnorderedArrays();

  if ((v10 & 1) == 0) {
    goto LABEL_7;
  }
  VNRequestTextRecognitionLevel v11 = [(VNRecognizeTextRequest *)self recognitionLevel];
  if (v11 == [v4 recognitionLevel]
    && (int v12 = [(VNRecognizeTextRequest *)self usesLanguageCorrection],
        v12 == [v4 usesLanguageCorrection])
    && (int v13 = [(VNRecognizeTextRequest *)self automaticallyDetectsLanguage],
        v13 == [v4 automaticallyDetectsLanguage])
    && ([(VNRecognizeTextRequest *)self minimumTextHeight],
        float v15 = v14,
        [v4 minimumTextHeight],
        v15 == v16))
  {
    v19.receiver = self;
    v19.super_class = (Class)VNRecognizeTextRequest;
    BOOL v17 = [(VNImageBasedRequest *)&v19 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
LABEL_7:
    BOOL v17 = 0;
  }

  return v17;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)VNRecognizeTextRequest;
  id v6 = [(VNRequest *)&v17 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  if (a3 - 1 <= 2)
  {
    char v7 = objc_msgSend(NSNumber, "numberWithBool:", -[VNRecognizeTextRequest recognitionLevel](self, "recognitionLevel") != VNRequestTextRecognitionLevelAccurate);
    [v6 setObject:v7 forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_FastRecognition"];

    [v6 setObject:&unk_1EF7A7700 forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_MaximumCandidatesCount"];
    id v8 = [(VNRecognizeTextRequest *)self recognitionLanguages];
    [v6 setObject:v8 forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_RecognitionLanguages"];

    VNRequestTextRecognitionLevel v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNRecognizeTextRequest _CRImageReaderRevisionForRevision:](self, "_CRImageReaderRevisionForRevision:", a3));
    [v6 setObject:v9 forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_CRImageReaderRevisionKey"];

    [v6 setObject:self forKeyedSubscript:@"VNCRImageReaderDetectorProcessOption_OriginatingRequest"];
    char v10 = objc_msgSend(NSNumber, "numberWithBool:", -[VNRecognizeTextRequest usesLanguageCorrection](self, "usesLanguageCorrection") ^ 1);
    [v6 setObject:v10 forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_DisableLanguageCorrection"];

    VNRequestTextRecognitionLevel v11 = objc_msgSend(NSNumber, "numberWithBool:", -[VNRecognizeTextRequest automaticallyDetectsLanguage](self, "automaticallyDetectsLanguage"));
    [v6 setObject:v11 forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_UsesLanguageDetection"];

    int v12 = NSNumber;
    [(VNRecognizeTextRequest *)self minimumTextHeight];
    int v13 = objc_msgSend(v12, "numberWithFloat:");
    [v6 setObject:v13 forKeyedSubscript:@"VNCRImageReaderDetectorProcessOption_MinimumTextHeight"];

    float v14 = [(VNRecognizeTextRequest *)self customWords];
    [v6 setObject:v14 forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_CustomWords"];

    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_UsesCoreMode"];
    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_SkipVerticalText"];
    float v15 = objc_msgSend(NSNumber, "numberWithBool:", -[VNRecognizeTextRequest keepResourcesLoaded](self, "keepResourcesLoaded"));
    [v6 setObject:v15 forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_KeepResourcesLoaded"];
  }
  return v6;
}

- (BOOL)hasCancellationHook
{
  return 1;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  id v4 = (VNRecognizeTextRequest *)a3;
  if (self != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)VNRecognizeTextRequest;
    [(VNImageBasedRequest *)&v7 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(VNRecognizeTextRequest *)v4 recognitionLanguages];
      [(VNRecognizeTextRequest *)self setRecognitionLanguages:v5];

      id v6 = [(VNRecognizeTextRequest *)v4 customWords];
      [(VNRecognizeTextRequest *)self setCustomWords:v6];

      [(VNRecognizeTextRequest *)self setRecognitionLevel:[(VNRecognizeTextRequest *)v4 recognitionLevel]];
      [(VNRecognizeTextRequest *)self setUsesLanguageCorrection:[(VNRecognizeTextRequest *)v4 usesLanguageCorrection]];
      [(VNRecognizeTextRequest *)self setAutomaticallyDetectsLanguage:[(VNRecognizeTextRequest *)v4 automaticallyDetectsLanguage]];
      [(VNRecognizeTextRequest *)v4 minimumTextHeight];
      -[VNRecognizeTextRequest setMinimumTextHeight:](self, "setMinimumTextHeight:");
      [(VNRecognizeTextRequest *)self setKeepResourcesLoaded:[(VNRecognizeTextRequest *)v4 keepResourcesLoaded]];
    }
  }
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 - 1 > 2)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
      id v4 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = @"VNCRImageReaderDetectorType";
    id v5 = @"VNCRImageReaderDetectorType";
  }

  return v4;
}

- (unint64_t)_CRImageReaderRevisionForRevision:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0;
  }
  else {
    return qword_1A4123388[a3 - 1];
  }
}

+ (NSArray)supportedRecognitionLanguagesForTextRecognitionLevel:(VNRequestTextRecognitionLevel)recognitionLevel revision:(NSUInteger)requestRevision error:(NSError *)error
{
  id v8 = objc_alloc_init((Class)a1);
  if ([v8 setRevision:requestRevision error:error])
  {
    [v8 setRecognitionLevel:recognitionLevel];
    VNRequestTextRecognitionLevel v9 = [v8 supportedRecognitionLanguagesAndReturnError:error];
  }
  else
  {
    VNRequestTextRecognitionLevel v9 = 0;
  }

  return (NSArray *)v9;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNRecognizeTextRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end