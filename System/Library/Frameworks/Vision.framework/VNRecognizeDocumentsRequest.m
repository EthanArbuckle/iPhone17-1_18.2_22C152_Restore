@interface VNRecognizeDocumentsRequest
+ (Class)configurationClass;
+ (id)supportedRecognitionLanguagesForTextRecognitionLevel:(int64_t)a3 revision:(unint64_t)a4 error:(id *)a5;
- (BOOL)detectionOnly;
- (BOOL)hasCancellationHook;
- (BOOL)indeterminate;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)keepResourcesLoaded;
- (BOOL)usesAlternateLineGrouping;
- (BOOL)usesFormFieldDetection;
- (BOOL)usesLanguageCorrection;
- (BOOL)usesLanguageDetection;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (NSArray)customWords;
- (NSArray)inputTextBlocks;
- (NSArray)recognitionLanguages;
- (VNDetectBarcodesRequest)barcodeRequest;
- (VNRecognizeDocumentsRequest)initWithFrameAnalysisSpacing:(id *)a3 trackingLevelBlockType:(unint64_t)a4 completionHandler:(id)a5;
- (float)minimumTextHeight;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (id)progressHandler;
- (id)sequencedRequestPreviousObservationsKey;
- (id)supportedRecognitionLanguagesAndReturnError:(id *)a3;
- (int64_t)recognitionLevel;
- (unint64_t)_CRImageReaderRevisionForRevision:(unint64_t)a3;
- (unint64_t)maximumCandidateCount;
- (void)setBarcodeRequest:(id)a3;
- (void)setCustomWords:(id)a3;
- (void)setDetectionOnly:(BOOL)a3;
- (void)setInputTextBlocks:(id)a3;
- (void)setKeepResourcesLoaded:(BOOL)a3;
- (void)setMaximumCandidateCount:(unint64_t)a3;
- (void)setMinimumTextHeight:(float)a3;
- (void)setProgressHandler:(id)a3;
- (void)setRecognitionLanguages:(id)a3;
- (void)setRecognitionLevel:(int64_t)a3;
- (void)setUsesAlternateLineGrouping:(BOOL)a3;
- (void)setUsesFormFieldDetection:(BOOL)a3;
- (void)setUsesLanguageCorrection:(BOOL)a3;
- (void)setUsesLanguageDetection:(BOOL)a3;
@end

@implementation VNRecognizeDocumentsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barcodeRequest, 0);
  objc_storeStrong((id *)&self->inputTextBlocks, 0);
  objc_storeStrong(&self->progressHandler, 0);

  objc_storeStrong((id *)&self->_trackingSession, 0);
}

- (void)setBarcodeRequest:(id)a3
{
}

- (VNDetectBarcodesRequest)barcodeRequest
{
  return self->_barcodeRequest;
}

- (void)setInputTextBlocks:(id)a3
{
}

- (NSArray)inputTextBlocks
{
  return self->inputTextBlocks;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->progressHandler;
}

- (BOOL)indeterminate
{
  return self->indeterminate;
}

- (id)supportedRecognitionLanguagesAndReturnError:(id *)a3
{
  id v4 = [(VNRecognizeDocumentsRequest *)self newDefaultDetectorOptionsForRequestRevision:[(VNRequest *)self resolvedRevision] session:0];
  v5 = +[VNCRImageReaderDetector supportedLanguagesForProcessOptions:v4 error:a3];

  return v5;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [v8 imageBufferAndReturnError:a5];
  if (v9)
  {
    v10 = [v8 session];
    id v20 = 0;
    v11 = [(VNRequest *)self applicableDetectorAndOptions:&v20 forRevision:a3 loadedInSession:v10 error:a5];
    id v12 = v20;
    if (v11)
    {
      v21[0] = v9;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      [v12 setObject:v13 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      trackingSession = self->_trackingSession;
      if (trackingSession) {
        [v12 setObject:trackingSession forKeyedSubscript:@"VNCRImageReaderForDocumentsDetectorProcessOption_CRImageReaderTrackingSession"];
      }
      v15 = [(VNRequest *)self detectorProgressHandler];
      uint64_t v16 = [v8 qosClass];
      [(VNImageBasedRequest *)self regionOfInterest];
      v17 = objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v16, v12, self, a5, v15);
      BOOL v18 = v17 != 0;
      if (v17) {
        [(VNRequest *)self setResults:v17];
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (id)sequencedRequestPreviousObservationsKey
{
  id v3 = [NSString alloc];
  v17.receiver = self;
  v17.super_class = (Class)VNRecognizeDocumentsRequest;
  uint64_t v16 = [(VNRequest *)&v17 sequencedRequestPreviousObservationsKey];
  v15 = [(VNRecognizeDocumentsRequest *)self recognitionLanguages];
  id v4 = _sequenceKeyComponentForArray(v15);
  v5 = [(VNRecognizeDocumentsRequest *)self customWords];
  v6 = _sequenceKeyComponentForArray(v5);
  int64_t v7 = [(VNRecognizeDocumentsRequest *)self recognitionLevel];
  BOOL v8 = [(VNRecognizeDocumentsRequest *)self usesLanguageCorrection];
  BOOL v9 = [(VNRecognizeDocumentsRequest *)self usesLanguageDetection];
  BOOL v10 = [(VNRecognizeDocumentsRequest *)self usesAlternateLineGrouping];
  BOOL v11 = [(VNRecognizeDocumentsRequest *)self usesFormFieldDetection];
  [(VNRecognizeDocumentsRequest *)self minimumTextHeight];
  v13 = (void *)[v3 initWithFormat:@"%@:%@:%p:%ld:%d:%d:%d:%d:%f", v16, v4, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (unint64_t)maximumCandidateCount
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 maximumCandidateCount];

  return v3;
}

- (void)setMaximumCandidateCount:(unint64_t)a3
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setMaximumCandidateCount:a3];
}

- (BOOL)detectionOnly
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 detectionOnly];

  return v3;
}

- (void)setDetectionOnly:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setDetectionOnly:v3];
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

- (void)setMinimumTextHeight:(float)a3
{
  id v5 = [(VNRequest *)self configuration];
  *(float *)&double v4 = a3;
  [v5 setMinimumTextHeight:v4];
}

- (BOOL)usesFormFieldDetection
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 usesFormFieldDetection];

  return v3;
}

- (void)setUsesFormFieldDetection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setUsesFormFieldDetection:v3];
}

- (BOOL)usesAlternateLineGrouping
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 usesAlternateLineGrouping];

  return v3;
}

- (void)setUsesAlternateLineGrouping:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setUsesAlternateLineGrouping:v3];
}

- (BOOL)usesLanguageDetection
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 automaticallyDetectsLanguage];

  return v3;
}

- (void)setUsesLanguageDetection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setAutomaticallyDetectsLanguage:v3];
}

- (BOOL)usesLanguageCorrection
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 usesLanguageCorrection];

  return v3;
}

- (void)setUsesLanguageCorrection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setUsesLanguageCorrection:v3];
}

- (int64_t)recognitionLevel
{
  v2 = [(VNRequest *)self configuration];
  int64_t v3 = [v2 recognitionLevel];

  return v3;
}

- (void)setRecognitionLevel:(int64_t)a3
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setRecognitionLevel:a3];
}

- (NSArray)customWords
{
  v2 = [(VNRequest *)self configuration];
  int64_t v3 = [v2 customWords];

  return (NSArray *)v3;
}

- (void)setCustomWords:(id)a3
{
  id v5 = (id)[a3 copy];
  id v4 = [(VNRequest *)self configuration];
  [v4 setCustomWords:v5];
}

- (NSArray)recognitionLanguages
{
  v2 = [(VNRequest *)self configuration];
  int64_t v3 = [v2 recognitionLanguages];

  return (NSArray *)v3;
}

- (void)setRecognitionLanguages:(id)a3
{
  id v5 = (id)[a3 copy];
  id v4 = [(VNRequest *)self configuration];
  [v4 setRecognitionLanguages:v5];
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  int v5 = [(VNRecognizeDocumentsRequest *)self detectionOnly];
  if (v5 != [v4 detectionOnly]) {
    goto LABEL_11;
  }
  unint64_t v6 = [(VNRecognizeDocumentsRequest *)self maximumCandidateCount];
  if (v6 != [v4 maximumCandidateCount]) {
    goto LABEL_11;
  }
  int64_t v7 = [(VNRecognizeDocumentsRequest *)self recognitionLanguages];
  BOOL v8 = [v4 recognitionLanguages];
  char v9 = [v7 isEqualToArray:v8];

  if ((v9 & 1) == 0) {
    goto LABEL_11;
  }
  BOOL v10 = [(VNRecognizeDocumentsRequest *)self customWords];
  BOOL v11 = [v4 customWords];
  char v12 = VisionCoreEquivalentOrNilUnorderedArrays();

  if ((v12 & 1) == 0) {
    goto LABEL_11;
  }
  int64_t v13 = [(VNRecognizeDocumentsRequest *)self recognitionLevel];
  if (v13 != [v4 recognitionLevel]) {
    goto LABEL_11;
  }
  int v14 = [(VNRecognizeDocumentsRequest *)self usesLanguageCorrection];
  if (v14 == [v4 usesLanguageCorrection]
    && (int v15 = [(VNRecognizeDocumentsRequest *)self usesLanguageDetection],
        v15 == [v4 automaticallyDetectsLanguage])
    && (int v16 = [(VNRecognizeDocumentsRequest *)self usesAlternateLineGrouping],
        v16 == [v4 usesAlternateLineGrouping])
    && (int v17 = [(VNRecognizeDocumentsRequest *)self usesFormFieldDetection],
        v17 == [v4 usesFormFieldDetection])
    && ([(VNRecognizeDocumentsRequest *)self minimumTextHeight],
        float v19 = v18,
        [v4 minimumTextHeight],
        v19 == v20))
  {
    v23.receiver = self;
    v23.super_class = (Class)VNRecognizeDocumentsRequest;
    BOOL v21 = [(VNImageBasedRequest *)&v23 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
LABEL_11:
    BOOL v21 = 0;
  }

  return v21;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    id v4 = @"VNCRImageReaderForDocumentsDetectorType";
    int v5 = @"VNCRImageReaderForDocumentsDetectorType";
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    id v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v25.receiver = self;
  v25.super_class = (Class)VNRecognizeDocumentsRequest;
  id v6 = [(VNRequest *)&v25 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  int64_t v7 = v6;
  if (a3 == 1)
  {
    [v6 setObject:self forKeyedSubscript:@"VNCRImageReaderForDocumentsDetectorProcessOption_OriginatingRequest"];
    BOOL v8 = objc_msgSend(NSNumber, "numberWithBool:", -[VNRecognizeDocumentsRequest recognitionLevel](self, "recognitionLevel") != 0);
    [v7 setObject:v8 forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_FastRecognition"];

    char v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNRecognizeDocumentsRequest maximumCandidateCount](self, "maximumCandidateCount"));
    [v7 setObject:v9 forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_MaximumCandidatesCount"];

    BOOL v10 = [(VNRecognizeDocumentsRequest *)self recognitionLanguages];
    [v7 setObject:v10 forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_RecognitionLanguages"];

    BOOL v11 = objc_msgSend(NSNumber, "numberWithBool:", -[VNRecognizeDocumentsRequest usesLanguageDetection](self, "usesLanguageDetection"));
    [v7 setObject:v11 forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_UsesLanguageDetection"];

    char v12 = objc_msgSend(NSNumber, "numberWithBool:", -[VNRecognizeDocumentsRequest usesAlternateLineGrouping](self, "usesAlternateLineGrouping"));
    [v7 setObject:v12 forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_UsesAlternateLineGrouping"];

    int64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNRecognizeDocumentsRequest _CRImageReaderRevisionForRevision:](self, "_CRImageReaderRevisionForRevision:", 1));
    [v7 setObject:v13 forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_CRImageReaderRevisionKey"];

    [v7 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_UsesCoreMode"];
    [v7 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_SkipVerticalText"];
    int v14 = objc_msgSend(NSNumber, "numberWithBool:", -[VNRecognizeDocumentsRequest keepResourcesLoaded](self, "keepResourcesLoaded"));
    [v7 setObject:v14 forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_KeepResourcesLoaded"];

    int v15 = objc_msgSend(NSNumber, "numberWithBool:", -[VNRecognizeDocumentsRequest usesFormFieldDetection](self, "usesFormFieldDetection"));
    [v7 setObject:v15 forKeyedSubscript:@"VNCRImageReaderDetectorProcessOption_UsesFormFieldDetection"];

    [v7 setObject:self forKeyedSubscript:@"VNCRImageReaderDetectorProcessOption_OriginatingRequest"];
    int v16 = objc_msgSend(NSNumber, "numberWithBool:", -[VNRecognizeDocumentsRequest usesLanguageCorrection](self, "usesLanguageCorrection") ^ 1);
    [v7 setObject:v16 forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_DisableLanguageCorrection"];

    int v17 = NSNumber;
    [(VNRecognizeDocumentsRequest *)self minimumTextHeight];
    float v18 = objc_msgSend(v17, "numberWithFloat:");
    [v7 setObject:v18 forKeyedSubscript:@"VNCRImageReaderDetectorProcessOption_MinimumTextHeight"];

    float v19 = [(VNRecognizeDocumentsRequest *)self customWords];
    [v7 setObject:v19 forKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_CustomWords"];

    float v20 = objc_msgSend(NSNumber, "numberWithBool:", -[VNRecognizeDocumentsRequest detectionOnly](self, "detectionOnly"));
    [v7 setObject:v20 forKeyedSubscript:@"VNCRImageReaderForDocumentsDetectorProcessOption_DetectionOnly"];

    BOOL v21 = [(VNRecognizeDocumentsRequest *)self inputTextBlocks];

    if (v21)
    {
      v22 = [(VNRecognizeDocumentsRequest *)self inputTextBlocks];
      [v7 setObject:v22 forKeyedSubscript:@"VNCRImageReaderForDocumentsDetectorProcessOption_TextObservationsToRecognize"];
    }
    objc_super v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNRequest maximumProcessingDimensionOnTheLongSide](self, "maximumProcessingDimensionOnTheLongSide"));
    [v7 setObject:v23 forKeyedSubscript:@"VNCRImageReaderForDocumentsDetectorProcessOption_MaximumProcessingDimensionOnTheLongSide"];
  }
  return v7;
}

- (unint64_t)_CRImageReaderRevisionForRevision:(unint64_t)a3
{
  if (a3 == 1) {
    return 3;
  }
  else {
    return 0;
  }
}

- (BOOL)hasCancellationHook
{
  return 1;
}

- (VNRecognizeDocumentsRequest)initWithFrameAnalysisSpacing:(id *)a3 trackingLevelBlockType:(unint64_t)a4 completionHandler:(id)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a3;
  v12.receiver = self;
  v12.super_class = (Class)VNRecognizeDocumentsRequest;
  id v6 = [(VNStatefulRequest *)&v12 initWithFrameAnalysisSpacing:&v13 completionHandler:a5];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4FAF160]);
    if (a4 == 8) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = a4 == 4;
    }
    uint64_t v9 = [v7 initWithTrackingLevel:v8];
    trackingSession = v6->_trackingSession;
    v6->_trackingSession = (CRImageReaderTrackingSession *)v9;
  }
  return v6;
}

+ (id)supportedRecognitionLanguagesForTextRecognitionLevel:(int64_t)a3 revision:(unint64_t)a4 error:(id *)a5
{
  id v8 = objc_alloc_init((Class)a1);
  if ([v8 setRevision:a4 error:a5])
  {
    [v8 setRecognitionLevel:a3];
    uint64_t v9 = [v8 supportedRecognitionLanguagesAndReturnError:a5];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end