@interface AXMVisionPipelineContext
+ (AXMVisionPipelineContext)contextWithSourceParameters:(id)a3 options:(id)a4;
+ (BOOL)supportsSecureCoding;
- (AXMPipelineContextInput)sourceInput;
- (AXMSequenceRequestManager)sequenceRequestManager;
- (AXMVisionAnalysisOptions)analysisOptions;
- (AXMVisionPipelineContext)initWithCoder:(id)a3;
- (AXMVisionPipelineContext)initWithSourceParameters:(id)a3 options:(id)a4;
- (AXMVisionResult)result;
- (AXMetricContainer)pipelineMetric;
- (AXMetricSession)metricSession;
- (BOOL)_addSignificantEventFeatureGateIfNeededToFeature:(id)a3 category:(id)a4 minimumConfidence:(double)a5;
- (BOOL)evaluationExclusivelyUsesVisionFramework;
- (BOOL)shouldCallCompletionHandlersForEmptyResultSet;
- (BOOL)shouldCallCompletionHandlersForEngineBusyError;
- (BOOL)shouldProcessRemotely;
- (BOOL)sourceProvidesResults;
- (BOOL)visionImageRequestHandlerIsLoaded;
- (CGSize)size;
- (NSArray)effectiveTextDetectionLocales;
- (NSArray)mediaAnalysisSceneLabelsForOCRDocumentTypeDetection;
- (NSArray)resultHandlers;
- (NSArray)sceneLabelsForOCRDocumentTypeDetection;
- (NSCopying)cacheKey;
- (NSError)error;
- (NSMutableArray)features;
- (NSMutableSet)evaluatedFeatureTypes;
- (NSNumber)appliedImageOrientation;
- (NSSecureCoding)userContext;
- (VNImageRequestHandler)visionImageRequestHandler;
- (id)_makeRequestHandlerForInput:(id)a3 options:(id)a4;
- (id)auxiliaryDetectors;
- (id)description;
- (id)generateFileNameForImageWithPrefix:(id)a3 extension:(id)a4;
- (id)generateImageRepresentation;
- (id)sceneObservation;
- (id)visionImageRequestHandlerWithOptions:(id)a3;
- (int64_t)imageRegistrationState;
- (unint64_t)sequenceID;
- (void)_commonInitWithDiagnosticsEnabled:(BOOL)a3;
- (void)addAuxiliaryDetector:(id)a3;
- (void)addEvaluatedFeatureType:(unint64_t)a3;
- (void)addMediaAnalysisSceneLabelForOCRDocumentTypeDetection:(id)a3;
- (void)addResultHandler:(id)a3;
- (void)addResultHandlers:(id)a3;
- (void)addSceneLabelForOCRDocumentTypeDetection:(id)a3;
- (void)appendFeature:(id)a3;
- (void)createSceneObservationIfNilWithBlock:(id)a3;
- (void)didFinishProcessingContext;
- (void)encodeWithCoder:(id)a3;
- (void)pipelineMetric;
- (void)produceImage:(id)a3;
- (void)removeAllAuxiliaryDetectors;
- (void)setAnalysisOptions:(id)a3;
- (void)setAppliedImageOrientation:(id)a3;
- (void)setCacheKey:(id)a3;
- (void)setEffectiveTextDetectionLocales:(id)a3;
- (void)setEquivalenceToken:(id)a3;
- (void)setError:(id)a3;
- (void)setEvaluatedFeatureTypes:(id)a3;
- (void)setEvaluationExclusivelyUsesVisionFramework:(BOOL)a3;
- (void)setFeatures:(id)a3;
- (void)setImageRegistrationState:(int64_t)a3;
- (void)setMetricSession:(id)a3;
- (void)setResult:(id)a3;
- (void)setSequenceID:(unint64_t)a3;
- (void)setSequenceRequestManager:(id)a3;
- (void)setShouldCallCompletionHandlersForEmptyResultSet:(BOOL)a3;
- (void)setShouldCallCompletionHandlersForEngineBusyError:(BOOL)a3;
- (void)setShouldProcessRemotely:(BOOL)a3;
- (void)setUserContext:(id)a3;
- (void)setVisionImageRequestHandler:(id)a3;
- (void)willBeginProcessingContext;
@end

@implementation AXMVisionPipelineContext

+ (AXMVisionPipelineContext)contextWithSourceParameters:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[AXMVisionPipelineContext alloc] initWithSourceParameters:v6 options:v5];

  return v7;
}

- (AXMVisionPipelineContext)initWithSourceParameters:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AXMVisionPipelineContext;
  v9 = [(AXMVisionPipelineContext *)&v16 init];
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = _SequenceIDCounter++;
    v9->_sequenceID = v11;
    objc_storeStrong((id *)&v9->_sourceParameters, a3);
    v12 = [v7 objectForKeyedSubscript:@"sourceProvidesResults"];
    v10->_sourceProvidesOwnResults = [v12 BOOLValue];

    [(AXMVisionPipelineContext *)v10 setAnalysisOptions:v8];
    v13 = [v7 objectForKeyedSubscript:@"diagnosticsEnabled"];
    uint64_t v14 = [v13 BOOLValue];

    [(AXMVisionPipelineContext *)v10 _commonInitWithDiagnosticsEnabled:v14];
  }

  return v10;
}

- (void)_commonInitWithDiagnosticsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldCallCompletionHandlersForEmptyResultSet = 1;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  resultHandlers = self->_resultHandlers;
  self->_resultHandlers = v5;

  id v7 = [MEMORY[0x1E4F1CA48] array];
  detectedSceneClassifications = self->_detectedSceneClassifications;
  self->_detectedSceneClassifications = v7;

  v9 = [MEMORY[0x1E4F1CA48] array];
  features = self->_features;
  self->_features = v9;

  uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
  evaluatedFeatureTypes = self->_evaluatedFeatureTypes;
  self->_evaluatedFeatureTypes = v11;

  v13 = [MEMORY[0x1E4F1C978] array];
  effectiveTextDetectionLocales = self->_effectiveTextDetectionLocales;
  self->_effectiveTextDetectionLocales = v13;

  id v15 = objc_alloc(MEMORY[0x1E4F48330]);
  objc_super v16 = NSString;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v18 = objc_msgSend(v16, "stringWithFormat:", @"Pipeline-%ld", (uint64_t)v17);
  v19 = (AXMetricSession *)[v15 initWithName:v18 measurementsEnabled:v3 orEnabledByEnvironmentVariables:&unk_1F0E94110];
  metricSession = self->_metricSession;
  self->_metricSession = v19;

  v21 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v22 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.accessibility.sceneobservation", v21);
  sceneObservationQueue = self->_sceneObservationQueue;
  self->_sceneObservationQueue = v22;

  v24 = [MEMORY[0x1E4F1CA48] array];
  mediaAnalysisDetectedSceneClassifications = self->_mediaAnalysisDetectedSceneClassifications;
  self->_mediaAnalysisDetectedSceneClassifications = v24;
}

- (id)description
{
  BOOL v3 = NSString;
  unint64_t sequenceID = self->_sequenceID;
  sourceParameters = self->_sourceParameters;
  id v6 = [(AXMVisionPipelineContext *)self error];
  id v7 = [v3 stringWithFormat:@"AXMVisionPipelineContext<%p>: seqID:%lu source params: %@. error: %@", self, sequenceID, sourceParameters, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionPipelineContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AXMVisionPipelineContext;
  id v5 = [(AXMVisionPipelineContext *)&v26 init];
  if (v5)
  {
    -[AXMVisionPipelineContext _commonInitWithDiagnosticsEnabled:](v5, "_commonInitWithDiagnosticsEnabled:", [v4 decodeBoolForKey:@"diagnosticsEnabled"]);
    id v6 = AXMSecureCodingClasses();
    id v7 = [v4 decodeObjectOfClasses:v6 forKey:@"sourceparams"];

    if (v7) {
      objc_storeStrong((id *)&v5->_sourceParameters, v7);
    }
    id v8 = AXMSecureCodingClasses();
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"features"];

    if (v9) {
      objc_storeStrong((id *)&v5->_features, v9);
    }
    v10 = AXMSecureCodingClasses();
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"evaluatedFeatureTypes"];

    if (v11) {
      objc_storeStrong((id *)&v5->_evaluatedFeatureTypes, v11);
    }
    v12 = AXMSecureCodingClasses();
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"analysisOptions"];
    [(AXMVisionPipelineContext *)v5 setAnalysisOptions:v13];

    uint64_t v14 = AXMSecureCodingClasses();
    id v15 = [v4 decodeObjectOfClasses:v14 forKey:@"appliedImageOrientation"];
    [(AXMVisionPipelineContext *)v5 setAppliedImageOrientation:v15];

    objc_super v16 = AXMSecureCodingClasses();
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v17;

    v5->_unint64_t sequenceID = [v4 decodeIntegerForKey:@"sequenceID"];
    v19 = AXMSecureCodingClasses();
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"userContext"];
    userContext = v5->_userContext;
    v5->_userContext = (NSSecureCoding *)v20;

    v22 = AXMSecureCodingClasses();
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"EffectiveTextDetectionLocales"];
    effectiveTextDetectionLocales = v5->_effectiveTextDetectionLocales;
    v5->_effectiveTextDetectionLocales = (NSArray *)v23;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AXMVisionPipelineContext *)self metricSession];
  objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v5, "measurementsEnabled"), @"diagnosticsEnabled");

  id v6 = [(AXMVisionPipelineContext *)self analysisOptions];
  [v4 encodeObject:v6 forKey:@"analysisOptions"];

  [v4 encodeObject:self->_sourceParameters forKey:@"sourceparams"];
  id v7 = [(AXMVisionPipelineContext *)self features];
  [v4 encodeObject:v7 forKey:@"features"];

  id v8 = [(AXMVisionPipelineContext *)self evaluatedFeatureTypes];
  [v4 encodeObject:v8 forKey:@"evaluatedFeatureTypes"];

  v9 = [(AXMVisionPipelineContext *)self error];
  [v4 encodeObject:v9 forKey:@"error"];

  v10 = [(AXMVisionPipelineContext *)self appliedImageOrientation];
  [v4 encodeObject:v10 forKey:@"appliedImageOrientation"];

  [v4 encodeInteger:self->_sequenceID forKey:@"sequenceID"];
  uint64_t v11 = [(AXMVisionPipelineContext *)self userContext];
  [v4 encodeObject:v11 forKey:@"userContext"];

  id v12 = [(AXMVisionPipelineContext *)self effectiveTextDetectionLocales];
  [v4 encodeObject:v12 forKey:@"EffectiveTextDetectionLocales"];
}

- (BOOL)sourceProvidesResults
{
  return self->_sourceProvidesOwnResults;
}

- (CGSize)size
{
  sourceInput = self->_sourceInput;
  if (sourceInput)
  {
    [(AXMPipelineContextInput *)sourceInput size];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB30];
    double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_makeRequestHandlerForInput:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = (id)MEMORY[0x1E4F1CC08];
  if (a4) {
    id v7 = a4;
  }
  id v8 = v7;
  switch([v6 inputType])
  {
    case 0:
      id v9 = objc_alloc((Class)getVNImageRequestHandlerClass());
      v10 = [v6 ciImage];
      uint64_t v11 = [v9 initWithCIImage:v10 options:v8];
      goto LABEL_7;
    case 1:
      id v12 = objc_alloc((Class)getVNImageRequestHandlerClass());
      v10 = [v6 pixelBuffer];
      uint64_t v13 = [(AXMPhotoAssetData *)v10 pixelBuffer];
      uint64_t v14 = [v6 pixelBuffer];
      uint64_t v15 = objc_msgSend(v12, "initWithCVPixelBuffer:orientation:options:", v13, objc_msgSend(v14, "orientation"), v8);
      goto LABEL_9;
    case 2:
      id v16 = objc_alloc((Class)getVNImageRequestHandlerClass());
      v10 = [v6 URL];
      uint64_t v11 = [v16 initWithURL:v10 options:v8];
LABEL_7:
      double v4 = (void *)v11;
      goto LABEL_10;
    case 3:
      uint64_t v17 = [AXMPhotoAssetData alloc];
      v18 = [v6 phAssetLocalIdentifier];
      v19 = [v6 photoLibraryURL];
      v10 = [(AXMPhotoAssetData *)v17 initWithImageAssetLocalIdentifier:v18 photoLibraryURL:v19 allowsNetworkAccess:1 needsImageData:1];

      id v20 = objc_alloc(MEMORY[0x1E4F1E050]);
      v21 = [(AXMPhotoAssetData *)v10 imageData];
      uint64_t v14 = (void *)[v20 initWithData:v21];

      uint64_t v15 = [objc_alloc((Class)getVNImageRequestHandlerClass()) initWithCIImage:v14 options:v8];
LABEL_9:
      double v4 = (void *)v15;

LABEL_10:
      break;
    default:
      break;
  }

  return v4;
}

- (VNImageRequestHandler)visionImageRequestHandler
{
  visionImageRequestHandler = self->_visionImageRequestHandler;
  if (!visionImageRequestHandler)
  {
    double v4 = [(AXMVisionPipelineContext *)self _makeRequestHandlerForInput:self->_sourceInput options:0];
    id v5 = self->_visionImageRequestHandler;
    self->_visionImageRequestHandler = v4;

    visionImageRequestHandler = self->_visionImageRequestHandler;
  }

  return visionImageRequestHandler;
}

- (id)visionImageRequestHandlerWithOptions:(id)a3
{
  sourceInput = self->_sourceInput;
  if (sourceInput)
  {
    id v5 = [(AXMVisionPipelineContext *)self _makeRequestHandlerForInput:sourceInput options:a3];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)visionImageRequestHandlerIsLoaded
{
  return self->_visionImageRequestHandler != 0;
}

- (void)createSceneObservationIfNilWithBlock:(id)a3
{
  id v4 = a3;
  sceneObservationQueue = self->_sceneObservationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__AXMVisionPipelineContext_createSceneObservationIfNilWithBlock___block_invoke;
  v7[3] = &unk_1E6116A50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(sceneObservationQueue, v7);
}

void __65__AXMVisionPipelineContext_createSceneObservationIfNilWithBlock___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 48))
  {
    uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = v2;
  }
}

- (id)sceneObservation
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  sceneObservationQueue = self->_sceneObservationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__AXMVisionPipelineContext_sceneObservation__block_invoke;
  v5[3] = &unk_1E6116EC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sceneObservationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__AXMVisionPipelineContext_sceneObservation__block_invoke(uint64_t a1)
{
}

- (void)setUserContext:(id)a3
{
  id v5 = (NSSecureCoding *)a3;
  if (v5)
  {
    uint64_t v6 = AXMSecureCodingClasses();
    char v7 = [v6 containsObject:objc_opt_class()];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = AXMediaLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[AXMVisionPipelineContext setUserContext:]((uint64_t)v5, v8);
      }
    }
  }
  userContext = self->_userContext;
  p_userContext = &self->_userContext;
  if (userContext != v5) {
    objc_storeStrong((id *)p_userContext, a3);
  }
}

- (NSArray)resultHandlers
{
  return (NSArray *)self->_resultHandlers;
}

- (void)addResultHandler:(id)a3
{
  if (a3)
  {
    resultHandlers = self->_resultHandlers;
    id v4 = (id)MEMORY[0x1BA9A1340](a3, a2);
    [(NSMutableArray *)resultHandlers addObject:v4];
  }
}

- (void)addResultHandlers:(id)a3
{
}

- (NSArray)sceneLabelsForOCRDocumentTypeDetection
{
  return (NSArray *)self->_detectedSceneClassifications;
}

- (void)addSceneLabelForOCRDocumentTypeDetection:(id)a3
{
}

- (NSArray)mediaAnalysisSceneLabelsForOCRDocumentTypeDetection
{
  return (NSArray *)self->_mediaAnalysisDetectedSceneClassifications;
}

- (void)addMediaAnalysisSceneLabelForOCRDocumentTypeDetection:(id)a3
{
}

- (void)produceImage:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (v4)
  {
    sourceParameters = self->_sourceParameters;
    id v17 = 0;
    uint64_t v13 = (*((void (**)(id, NSDictionary *, id *))v4 + 2))(v4, sourceParameters, &v17);
    uint64_t v14 = (uint64_t)v17;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0;
  }
  if (!(v14 | v13))
  {
    uint64_t v14 = _AXMMakeError(0, @"A creation node must return a valid image", v5, v6, v7, v8, v9, v10, v16);
  }
  if (v14)
  {
    [(AXMVisionPipelineContext *)self errorOccurred:v14];
  }
  else if (v13)
  {
    objc_storeStrong((id *)&self->_sourceInput, (id)v13);
  }
  uint64_t v15 = self->_sourceParameters;
  self->_sourceParameters = 0;
}

- (void)appendFeature:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXMVisionPipelineContext *)self userContext];
  [v4 setUserContext:v5];

  uint64_t v6 = [(AXMVisionPipelineContext *)self features];
  [v6 addObject:v4];

  uint64_t v7 = [v4 featureType];

  [(AXMVisionPipelineContext *)self addEvaluatedFeatureType:v7];
}

- (void)addEvaluatedFeatureType:(unint64_t)a3
{
  id v5 = [(AXMVisionPipelineContext *)self evaluatedFeatureTypes];
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 addObject:v4];
}

- (BOOL)_addSignificantEventFeatureGateIfNeededToFeature:(id)a3 category:(id)a4 minimumConfidence:(double)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 classificationLabel];
  if (![v9 isEqualToString:v8])
  {

    goto LABEL_5;
  }
  [v7 confidence];
  double v11 = v10;

  if (v11 <= a5)
  {
LABEL_5:
    BOOL v14 = 0;
    goto LABEL_6;
  }
  v16[0] = @"MinimumConfidence";
  id v12 = [NSNumber numberWithDouble:a5];
  v16[1] = @"ClassifierLabel";
  v17[0] = v12;
  v17[1] = v8;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  [v7 addFeatureGate:@"Taboo Filter" userInfo:v13];

  BOOL v14 = 1;
LABEL_6:

  return v14;
}

- (void)setEquivalenceToken:(id)a3
{
  id v4 = a3;
  id v5 = [(AXMVisionPipelineContext *)self result];
  [v5 setEquivalenceToken:v4];
}

- (AXMVisionResult)result
{
  if (!self->_result)
  {
    id v3 = [[AXMVisionResult alloc] _init];
    id v4 = self->_result;
    self->_CGSize result = v3;

    id v5 = [(AXMVisionPipelineContext *)self features];
    [(AXMVisionResult *)self->_result setFeatures:v5];

    uint64_t v6 = [(AXMVisionPipelineContext *)self effectiveTextDetectionLocales];
    [(AXMVisionResult *)self->_result setEffectiveTextDetectionLocales:v6];

    id v7 = [(AXMVisionPipelineContext *)self evaluatedFeatureTypes];
    [(AXMVisionResult *)self->_result setEvaluatedFeatureTypes:v7];

    id v8 = [(AXMVisionPipelineContext *)self appliedImageOrientation];
    [(AXMVisionResult *)self->_result setAppliedImageOrientation:v8];

    uint64_t v9 = [(AXMVisionPipelineContext *)self metricSession];
    [(AXMVisionResult *)self->_result setMetricSession:v9];

    [(AXMVisionResult *)self->_result setImageRegistrationState:[(AXMVisionPipelineContext *)self imageRegistrationState]];
    double v10 = [(AXMVisionPipelineContext *)self userContext];
    [(AXMVisionResult *)self->_result setUserContext:v10];

    double v11 = [(AXMVisionPipelineContext *)self analysisOptions];
    int v12 = [v11 includeImageInResult];

    if (v12)
    {
      uint64_t v13 = [(AXMVisionPipelineContext *)self generateImageRepresentation];
      [(AXMVisionResult *)self->_result setImage:v13];
    }
  }
  BOOL v14 = self->_result;

  return v14;
}

- (id)generateFileNameForImageWithPrefix:(id)a3 extension:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AXMVisionPipelineContext *)self size];
  double v10 = [NSString stringWithFormat:@"%@-%ld-%ldx%ld.%@", v7, self->_sequenceID, (uint64_t)v9, (uint64_t)v8, v6];

  return v10;
}

- (id)generateImageRepresentation
{
  v26[2] = *MEMORY[0x1E4F143B8];
  sourceInput = self->_sourceInput;
  if (sourceInput)
  {
    switch([(AXMPipelineContextInput *)sourceInput inputType])
    {
      case 0:
        id v4 = [(AXMPipelineContextInput *)self->_sourceInput ciImage];
        break;
      case 1:
        uint64_t v5 = *MEMORY[0x1E4F1E330];
        v26[0] = MEMORY[0x1E4F1CC38];
        uint64_t v6 = *MEMORY[0x1E4F1E3C8];
        v25[0] = v5;
        v25[1] = v6;
        uint64_t v23 = *MEMORY[0x1E4F2FCA0];
        id v7 = NSNumber;
        double v8 = [(AXMPipelineContextInput *)self->_sourceInput pixelBuffer];
        double v9 = objc_msgSend(v7, "numberWithUnsignedInt:", objc_msgSend(v8, "orientation"));
        v24 = v9;
        double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        v26[1] = v10;
        double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

        int v12 = (void *)MEMORY[0x1E4F1E050];
        uint64_t v13 = [(AXMPipelineContextInput *)self->_sourceInput pixelBuffer];
        id v4 = objc_msgSend(v12, "imageWithCVPixelBuffer:options:", objc_msgSend(v13, "pixelBuffer"), v11);

        break;
      case 2:
        BOOL v14 = (void *)MEMORY[0x1E4F1E050];
        uint64_t v15 = [(AXMPipelineContextInput *)self->_sourceInput URL];
        id v4 = [v14 imageWithContentsOfURL:v15];

        break;
      case 3:
        uint64_t v16 = [AXMPhotoAssetData alloc];
        id v17 = [(AXMPipelineContextInput *)self->_sourceInput phAssetLocalIdentifier];
        v18 = [(AXMPipelineContextInput *)self->_sourceInput photoLibraryURL];
        v19 = [(AXMPhotoAssetData *)v16 initWithImageAssetLocalIdentifier:v17 photoLibraryURL:v18 allowsNetworkAccess:1 needsImageData:1];

        id v20 = objc_alloc(MEMORY[0x1E4F1E050]);
        v21 = [(AXMPhotoAssetData *)v19 imageData];
        id v4 = (void *)[v20 initWithData:v21];

        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    id v4 = 0;
  }

  return v4;
}

- (AXMPipelineContextInput)sourceInput
{
  return self->_sourceInput;
}

- (void)addAuxiliaryDetector:(id)a3
{
  id v4 = a3;
  auxiliaryDetectors = self->_auxiliaryDetectors;
  id v8 = v4;
  if (!auxiliaryDetectors)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA70] orderedSet];
    id v7 = self->_auxiliaryDetectors;
    self->_auxiliaryDetectors = v6;

    id v4 = v8;
    auxiliaryDetectors = self->_auxiliaryDetectors;
  }
  [(NSMutableOrderedSet *)auxiliaryDetectors addObject:v4];
}

- (id)auxiliaryDetectors
{
  return self->_auxiliaryDetectors;
}

- (void)removeAllAuxiliaryDetectors
{
}

- (AXMetricContainer)pipelineMetric
{
  piplelineMetric = self->_piplelineMetric;
  if (!piplelineMetric)
  {
    id v4 = AXMediaLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[AXMVisionPipelineContext pipelineMetric](v4);
    }

    piplelineMetric = self->_piplelineMetric;
  }

  return piplelineMetric;
}

- (void)willBeginProcessingContext
{
  id v5 = [(AXMVisionPipelineContext *)self metricSession];
  id v3 = [v5 startMeasure:@"Pipeline"];
  piplelineMetric = self->_piplelineMetric;
  self->_piplelineMetric = v3;
}

- (void)didFinishProcessingContext
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 metricSession];
  id v4 = [v3 generateReport];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_debug_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v5, 0xCu);
}

- (BOOL)shouldProcessRemotely
{
  return self->_shouldProcessRemotely;
}

- (void)setShouldProcessRemotely:(BOOL)a3
{
  self->_shouldProcessRemotely = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (AXMVisionAnalysisOptions)analysisOptions
{
  return self->_analysisOptions;
}

- (void)setAnalysisOptions:(id)a3
{
}

- (NSArray)effectiveTextDetectionLocales
{
  return self->_effectiveTextDetectionLocales;
}

- (void)setEffectiveTextDetectionLocales:(id)a3
{
}

- (void)setVisionImageRequestHandler:(id)a3
{
}

- (int64_t)imageRegistrationState
{
  return self->_imageRegistrationState;
}

- (void)setImageRegistrationState:(int64_t)a3
{
  self->_imageRegistrationState = a3;
}

- (NSSecureCoding)userContext
{
  return self->_userContext;
}

- (void)setResult:(id)a3
{
}

- (NSCopying)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
}

- (BOOL)shouldCallCompletionHandlersForEngineBusyError
{
  return self->_shouldCallCompletionHandlersForEngineBusyError;
}

- (void)setShouldCallCompletionHandlersForEngineBusyError:(BOOL)a3
{
  self->_shouldCallCompletionHandlersForEngineBusyError = a3;
}

- (BOOL)shouldCallCompletionHandlersForEmptyResultSet
{
  return self->_shouldCallCompletionHandlersForEmptyResultSet;
}

- (void)setShouldCallCompletionHandlersForEmptyResultSet:(BOOL)a3
{
  self->_shouldCallCompletionHandlersForEmptyResultSet = a3;
}

- (BOOL)evaluationExclusivelyUsesVisionFramework
{
  return self->_evaluationExclusivelyUsesVisionFramework;
}

- (void)setEvaluationExclusivelyUsesVisionFramework:(BOOL)a3
{
  self->_evaluationExclusivelyUsesVisionFramework = a3;
}

- (unint64_t)sequenceID
{
  return self->_sequenceID;
}

- (void)setSequenceID:(unint64_t)a3
{
  self->_unint64_t sequenceID = a3;
}

- (AXMetricSession)metricSession
{
  return self->_metricSession;
}

- (void)setMetricSession:(id)a3
{
}

- (NSMutableArray)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
}

- (NSMutableSet)evaluatedFeatureTypes
{
  return self->_evaluatedFeatureTypes;
}

- (void)setEvaluatedFeatureTypes:(id)a3
{
}

- (NSNumber)appliedImageOrientation
{
  return self->_appliedImageOrientation;
}

- (void)setAppliedImageOrientation:(id)a3
{
}

- (AXMSequenceRequestManager)sequenceRequestManager
{
  return self->_sequenceRequestManager;
}

- (void)setSequenceRequestManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceRequestManager, 0);
  objc_storeStrong((id *)&self->_appliedImageOrientation, 0);
  objc_storeStrong((id *)&self->_evaluatedFeatureTypes, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_metricSession, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_visionImageRequestHandler, 0);
  objc_storeStrong((id *)&self->_effectiveTextDetectionLocales, 0);
  objc_storeStrong((id *)&self->_analysisOptions, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_auxiliaryDetectors, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisDetectedSceneClassifications, 0);
  objc_storeStrong((id *)&self->_detectedSceneClassifications, 0);
  objc_storeStrong((id *)&self->_sceneObservationQueue, 0);
  objc_storeStrong((id *)&self->_sceneObservation, 0);
  objc_storeStrong((id *)&self->_piplelineMetric, 0);
  objc_storeStrong((id *)&self->_resultHandlers, 0);
  objc_storeStrong((id *)&self->_sourceParameters, 0);

  objc_storeStrong((id *)&self->_sourceInput, 0);
}

- (void)setUserContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_fault_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_FAULT, "userContext class %@ not in AXMSecureCodingClasses()", (uint8_t *)&v4, 0xCu);
}

- (void)pipelineMetric
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B57D5000, log, OS_LOG_TYPE_FAULT, "pipelineMetric accessed before being created. This will certainly lead to unexpected behavior", v1, 2u);
}

@end