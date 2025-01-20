@interface AIAudiogramIngestionEngine
- (AIAudiogramAssetManager)assetManager;
- (AIAudiogramIngestionEngine)init;
- (AIAudiogramIngestionEngine)initWithDelegate:(id)a3;
- (AIAudiogramIngestionEngineDelegate)delegate;
- (BOOL)_isValidObject:(id)a3 toObject:(id)a4 withValueDifference:(double)a5 stepDistance:(double)a6 forAxis:(unint64_t)a7;
- (BOOL)isAvailable;
- (BOOL)isRetrievingLatestModel;
- (BOOL)isRetrievingLatestModelSilently;
- (CGRect)_adjustedRectForVisionCoordinateSpace:(CGRect)a3 inImage:(id)a4;
- (CGRect)_shrinkRect:(CGRect)a3 width:(double)a4 height:(double)a5 insideBounds:(CGSize)a6;
- (NSDictionary)assetProperties;
- (NSString)leftEarAirConductionMaskedSymbol;
- (NSString)leftEarAirConductionUnmaskedSymbol;
- (NSString)modelLabelGraph;
- (NSString)modelLabelLeftEarSymbol;
- (NSString)modelLabelRightEarSymbol;
- (NSString)rightEarAirConductionMaskedSymbol;
- (NSString)rightEarAirConductionUnmaskedSymbol;
- (OS_dispatch_queue)analysisQueue;
- (VNCoreMLModel)model;
- (_TtC18AudiogramIngestion27AudiogramGraphDetectorModel)graphModel;
- (_TtC18AudiogramIngestion28AudiogramSymbolDetectorModel)symbolModel;
- (double)_meanFromNumbers:(id)a3;
- (double)_stddevFromNumbers:(id)a3;
- (double)_zScoreFromNumber:(double)a3 mean:(double)a4 stddev:(double)a5;
- (float)modelLabelConfidenceThreshold;
- (id)_audiogramFromAudiogramPoints:(id)a3;
- (id)_audiogramFromImagesV2:(id)a3;
- (id)_audiogramFromSymbols:(id)a3 onAudiogramMap:(id)a4;
- (id)_audiogramFromSymbols:(id)a3 recognizedText:(id)a4;
- (id)_audiogramMapFromRecognizedText:(id)a3;
- (id)_audiogramPointsFromSymbolsV2:(id)a3 inGraphRect:(CGRect)a4 onAudiogramMap:(id)a5;
- (id)_audiogramPointsFromSymbolsV2:(id)a3 inGraphRect:(CGRect)a4 recognizedText:(id)a5;
- (id)_combineAudiograms:(id)a3;
- (id)_cropEdgesFromImage:(id)a3 graphRect:(CGRect)a4 symbolsRect:(CGRect)a5;
- (id)_cropResultsFromImage:(id)a3 observations:(id)a4;
- (id)_formatNumbersFromRecognizedText:(id)a3;
- (id)_groupNumbersByAxisFromRecognizedText:(id)a3;
- (id)_observationsFromCIImage:(id)a3;
- (id)_rectsOfGraphFromImage:(id)a3 objectData:(id)a4;
- (id)_rectsOfSymbolsFromImage:(id)a3 objectData:(id)a4;
- (id)_removeDuplicateSetsFromTextSets:(id)a3;
- (id)_sortAndRemoveInvalidAxisValues:(id)a3 forAxis:(unint64_t)a4 error:(id *)a5;
- (id)_textFromAudiogramImage:(id)a3 regionOfInterest:(CGRect)a4;
- (id)_validMapForPointPairs:(id)a3 stepDistance:(double)a4 forValueDifference:(double)a5 forAxis:(unint64_t)a6;
- (id)_validPointsFromMap:(id)a3 forValues:(id)a4;
- (id)_valueDifferencesForValues:(id)a3 stepDistance:(double)a4 forAxis:(unint64_t)a5;
- (id)audiogramDetectorResultsFromImage:(id)a3;
- (id)audiogramFromImage:(id)a3;
- (id)audiogramFromImages:(id)a3;
- (id)audiogramPointsFromImages:(id)a3;
- (unint64_t)failureMode;
- (unsigned)_propertyOrientationFromOrientation:(int64_t)a3;
- (void)_loadModelFromAssetPath:(id)a3 assetProperties:(id)a4;
- (void)_loadV2ModelFromAssetPath:(id)a3 assetProperties:(id)a4;
- (void)_retrieveModel;
- (void)_setAudiogramAxisError:(unint64_t)a3 onError:(id *)a4;
- (void)_stopRetrievingLatestModel;
- (void)audiogramFromImages:(id)a3 completion:(id)a4;
- (void)modelDidUpdate:(id)a3 assetProperties:(id)a4 assetVersion:(unint64_t)a5 withError:(id)a6;
- (void)modelDownloadProgressDidUpdate:(float)a3;
- (void)setAnalysisQueue:(id)a3;
- (void)setAssetManager:(id)a3;
- (void)setAssetProperties:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFailureMode:(unint64_t)a3;
- (void)setGraphModel:(id)a3;
- (void)setIsRetrievingLatestModel:(BOOL)a3;
- (void)setIsRetrievingLatestModelSilently:(BOOL)a3;
- (void)setLeftEarAirConductionMaskedSymbol:(id)a3;
- (void)setLeftEarAirConductionUnmaskedSymbol:(id)a3;
- (void)setModel:(id)a3;
- (void)setModelLabelConfidenceThreshold:(float)a3;
- (void)setModelLabelGraph:(id)a3;
- (void)setModelLabelLeftEarSymbol:(id)a3;
- (void)setModelLabelRightEarSymbol:(id)a3;
- (void)setRightEarAirConductionMaskedSymbol:(id)a3;
- (void)setRightEarAirConductionUnmaskedSymbol:(id)a3;
- (void)setSymbolModel:(id)a3;
- (void)startRetrievingLatestModel;
- (void)startRetrievingLatestModelSilently;
@end

@implementation AIAudiogramIngestionEngine

- (AIAudiogramIngestionEngine)init
{
  v7.receiver = self;
  v7.super_class = (Class)AIAudiogramIngestionEngine;
  v2 = [(AIAudiogramIngestionEngine *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AudiogramIngestion.AIAudiogramIngestionEngine.AnalysisQueue", v3);
    [(AIAudiogramIngestionEngine *)v2 setAnalysisQueue:v4];

    v5 = [[AIAudiogramAssetManager alloc] initWithDelegate:v2];
    [(AIAudiogramIngestionEngine *)v2 setAssetManager:v5];
  }
  return v2;
}

- (AIAudiogramIngestionEngine)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(AIAudiogramIngestionEngine *)self init];
  v6 = v5;
  if (v5) {
    [(AIAudiogramIngestionEngine *)v5 setDelegate:v4];
  }

  return v6;
}

- (BOOL)isAvailable
{
  if (_os_feature_enabled_impl())
  {
    v3 = [(AIAudiogramIngestionEngine *)self graphModel];
    if (v3)
    {
      id v4 = [(AIAudiogramIngestionEngine *)self symbolModel];
      BOOL v5 = v4 != 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    v3 = [(AIAudiogramIngestionEngine *)self model];
    BOOL v5 = v3 != 0;
  }

  return v5;
}

- (void)startRetrievingLatestModel
{
  v3 = AXLogAudiogram();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23F0D7000, v3, OS_LOG_TYPE_INFO, "Start retrieving latest model", v4, 2u);
  }

  [(AIAudiogramIngestionEngine *)self setIsRetrievingLatestModelSilently:0];
  [(AIAudiogramIngestionEngine *)self _retrieveModel];
}

- (void)startRetrievingLatestModelSilently
{
  v3 = AXLogAudiogram();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23F0D7000, v3, OS_LOG_TYPE_INFO, "Start retrieving latest model silently", v4, 2u);
  }

  [(AIAudiogramIngestionEngine *)self setIsRetrievingLatestModelSilently:1];
  [(AIAudiogramIngestionEngine *)self _retrieveModel];
}

- (void)_retrieveModel
{
  if ([(AIAudiogramIngestionEngine *)self isRetrievingLatestModel])
  {
    v3 = AXLogAudiogram();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F0D7000, v3, OS_LOG_TYPE_INFO, "AIAudiogramIngestionEngine is already retrieving a model. No need to start retrieving again", buf, 2u);
    }
  }
  else
  {
    [(AIAudiogramIngestionEngine *)self setIsRetrievingLatestModel:1];
    id v4 = [(AIAudiogramIngestionEngine *)self assetManager];
    [v4 refreshAssets];
  }
}

- (void)_stopRetrievingLatestModel
{
}

- (void)_loadModelFromAssetPath:(id)a3 assetProperties:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(AIAudiogramIngestionEngine *)self setAssetProperties:v7];
  if (!_os_feature_enabled_impl())
  {
    uint64_t v8 = [v7 objectForKey:@"LeftEarSymbolName"];
    v9 = (void *)v8;
    if (v8) {
      v10 = (__CFString *)v8;
    }
    else {
      v10 = @"Left Ear";
    }
    [(AIAudiogramIngestionEngine *)self setModelLabelLeftEarSymbol:v10];

    uint64_t v11 = [v7 objectForKey:@"RightEarSymbolName"];
    v12 = (void *)v11;
    if (v11) {
      v13 = (__CFString *)v11;
    }
    else {
      v13 = @"Right Ear";
    }
    [(AIAudiogramIngestionEngine *)self setModelLabelRightEarSymbol:v13];

    uint64_t v14 = [v7 objectForKey:@"GraphName"];
    v15 = (void *)v14;
    if (v14) {
      v16 = (__CFString *)v14;
    }
    else {
      v16 = @"Graph";
    }
    [(AIAudiogramIngestionEngine *)self setModelLabelGraph:v16];

    v17 = [v7 objectForKey:@"SymbolConfidenceThreshold"];
    v19 = v17;
    if (v17) {
      [v17 floatValue];
    }
    else {
      LODWORD(v18) = 0.5;
    }
    [(AIAudiogramIngestionEngine *)self setModelLabelConfidenceThreshold:v18];
    v20 = [v7 objectForKey:@"IsModelCompiled"];
    v21 = v20;
    if (v20) {
      int v22 = [v20 BOOLValue];
    }
    else {
      int v22 = 0;
    }
    uint64_t v23 = objc_msgSend(v7, "objectForKey:", @"ModelName", v19);
    v24 = (void *)v23;
    v25 = @"SymbolsDetector";
    if (v23) {
      v25 = (__CFString *)v23;
    }
    v26 = v25;

    v27 = AXLogAudiogram();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = [(AIAudiogramIngestionEngine *)self modelLabelLeftEarSymbol];
      v29 = [(AIAudiogramIngestionEngine *)self modelLabelRightEarSymbol];
      v30 = [(AIAudiogramIngestionEngine *)self modelLabelGraph];
      [(AIAudiogramIngestionEngine *)self modelLabelConfidenceThreshold];
      *(_DWORD *)buf = 138413570;
      v47 = v28;
      __int16 v48 = 2112;
      v49 = v29;
      __int16 v50 = 2112;
      v51 = v30;
      __int16 v52 = 2048;
      double v53 = v31;
      __int16 v54 = 2112;
      v55 = v26;
      __int16 v56 = 1024;
      int v57 = v22;
      _os_log_impl(&dword_23F0D7000, v27, OS_LOG_TYPE_INFO, "Loading audiogram model properties. left='%@', right='%@', graph='%@', confidence=%f, model name='%@', compiled=%i", buf, 0x3Au);
    }
    v32 = [v6 URLByAppendingPathComponent:v26];
    v33 = v32;
    if (v22)
    {
      v34 = [v32 URLByAppendingPathExtension:@"mlmodelc"];
    }
    else
    {
      v35 = [v32 URLByAppendingPathExtension:@"mlmodel"];

      id v45 = 0;
      v34 = [MEMORY[0x263F00D80] compileModelAtURL:v35 error:&v45];
      id v36 = v45;
      if (v36)
      {
        id v37 = v36;
        v38 = AXLogAudiogram();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          -[AIAudiogramIngestionEngine _loadModelFromAssetPath:assetProperties:]();
        }
        v39 = v42;
        goto LABEL_38;
      }
      v33 = v35;
    }

    id v44 = 0;
    v35 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v34 error:&v44];
    id v40 = v44;
    if (v40)
    {
      id v37 = v40;
      v38 = AXLogAudiogram();
      v39 = v42;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[AIAudiogramIngestionEngine _loadModelFromAssetPath:assetProperties:]();
      }
    }
    else
    {
      id v43 = 0;
      v38 = [MEMORY[0x263F1EE40] modelForMLModel:v35 error:&v43];
      id v37 = v43;
      v39 = v42;
      if (v37)
      {
        v41 = AXLogAudiogram();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          -[AIAudiogramIngestionEngine _loadModelFromAssetPath:assetProperties:]();
        }
      }
      else
      {
        [(AIAudiogramIngestionEngine *)self setModel:v38];
        v41 = AXLogAudiogram();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23F0D7000, v41, OS_LOG_TYPE_INFO, "Successfully loaded model!", buf, 2u);
        }
      }
    }
LABEL_38:

    goto LABEL_39;
  }
  [(AIAudiogramIngestionEngine *)self _loadV2ModelFromAssetPath:v6 assetProperties:v7];
LABEL_39:
}

- (void)_loadV2ModelFromAssetPath:(id)a3 assetProperties:(id)a4
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 objectForKey:@"LeftEarACUnmaskedSymbolName"];
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = @"x";
  }
  [(AIAudiogramIngestionEngine *)self setLeftEarAirConductionUnmaskedSymbol:v10];

  uint64_t v11 = [v7 objectForKey:@"LeftEarACMaskedSymbolName"];
  v12 = (void *)v11;
  if (v11) {
    v13 = (__CFString *)v11;
  }
  else {
    v13 = @"square";
  }
  [(AIAudiogramIngestionEngine *)self setLeftEarAirConductionMaskedSymbol:v13];

  uint64_t v14 = [v7 objectForKey:@"RightEarACUnmaskedSymbolName"];
  v15 = (void *)v14;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  else {
    v16 = @"o";
  }
  [(AIAudiogramIngestionEngine *)self setRightEarAirConductionUnmaskedSymbol:v16];

  uint64_t v17 = [v7 objectForKey:@"RightEarACMaskedSymbolName"];
  double v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = @"triangle";
  }
  [(AIAudiogramIngestionEngine *)self setRightEarAirConductionMaskedSymbol:v19];

  uint64_t v20 = [v7 objectForKey:@"SymbolNames"];
  v21 = (void *)v20;
  int v22 = &unk_26F2DB508;
  if (v20) {
    int v22 = (void *)v20;
  }
  id v23 = v22;

  uint64_t v24 = [v7 objectForKey:@"CollisionMitigationSymbolNames"];
  v25 = (void *)v24;
  v26 = &unk_26F2DB520;
  if (v24) {
    v26 = (void *)v24;
  }
  id v87 = v26;

  v27 = [v7 objectForKey:@"SymbolConfidenceThreshold"];
  v86 = v27;
  if (v27)
  {
    [v27 floatValue];
    int v29 = v28;
  }
  else
  {
    int v29 = 1045220557;
  }
  v30 = [v7 objectForKey:@"GraphConfidenceThreshold"];
  v85 = v30;
  if (v30)
  {
    [v30 floatValue];
    int v32 = v31;
  }
  else
  {
    int v32 = 1041865114;
  }
  v33 = [v7 objectForKey:@"GraphModelInputWidth"];
  v84 = v33;
  if (v33)
  {
    [v33 floatValue];
    double v35 = v34;
  }
  else
  {
    double v35 = 960.0;
  }
  id v36 = [v7 objectForKey:@"GraphModelInputHeight"];
  v83 = v36;
  if (v36)
  {
    [v36 floatValue];
    double v38 = v37;
  }
  else
  {
    double v38 = 960.0;
  }
  v39 = [v7 objectForKey:@"SymbolModelInputWidth"];
  v82 = v39;
  if (v39)
  {
    [v39 floatValue];
    double v41 = v40;
  }
  else
  {
    double v41 = 960.0;
  }
  v42 = [v7 objectForKey:@"SymbolModelInputHeight"];
  v81 = v42;
  if (v42)
  {
    [v42 floatValue];
    double v44 = v43;
  }
  else
  {
    double v44 = 960.0;
  }
  uint64_t v45 = [v7 objectForKey:@"GraphModelName"];
  v46 = (void *)v45;
  v47 = @"GraphDetector";
  if (v45) {
    v47 = (__CFString *)v45;
  }
  __int16 v48 = v47;

  v49 = [v7 objectForKey:@"IsGraphModelCompiled"];
  __int16 v50 = v49;
  if (v49) {
    int v51 = [v49 BOOLValue] ^ 1;
  }
  else {
    int v51 = 1;
  }
  uint64_t v52 = objc_msgSend(v7, "objectForKey:", @"SymbolModelName", v23);
  double v53 = (void *)v52;
  __int16 v54 = @"SymbolDetector";
  if (v52) {
    __int16 v54 = (__CFString *)v52;
  }
  v88 = v54;

  v55 = [v7 objectForKey:@"IsSymbolModelCompiled"];
  __int16 v56 = v55;
  if (v55) {
    int v57 = [v55 BOOLValue] ^ 1;
  }
  else {
    int v57 = 1;
  }
  uint64_t v58 = AXLogAudiogram();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v92 = v7;
    _os_log_impl(&dword_23F0D7000, v58, OS_LOG_TYPE_INFO, "Loading v2 audiogram model properties %@", buf, 0xCu);
  }

  v80 = v48;
  v59 = [v6 URLByAppendingPathComponent:v48];
  v60 = v59;
  if (v51)
  {
    v61 = v6;
    v62 = [v59 URLByAppendingPathExtension:@"mlmodel"];

    id v90 = 0;
    v63 = [MEMORY[0x263F00D80] compileModelAtURL:v62 error:&v90];
    id v64 = v90;
    if (v64)
    {
      v65 = v64;
      v66 = AXLogAudiogram();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        -[AIAudiogramIngestionEngine _loadV2ModelFromAssetPath:assetProperties:]();
      }
      v67 = v79;
      goto LABEL_66;
    }
    v60 = v62;
  }
  else
  {
    v63 = [v59 URLByAppendingPathExtension:@"mlmodelc"];
  }

  v68 = [_TtC18AudiogramIngestion27AudiogramGraphDetectorModel alloc];
  LODWORD(v69) = v32;
  v70 = -[AudiogramGraphDetectorModel initWithModelUrl:modelInputSize:confidenceThreshold:](v68, "initWithModelUrl:modelInputSize:confidenceThreshold:", v63, v35, v38, v69);
  [(AIAudiogramIngestionEngine *)self setGraphModel:v70];

  v71 = AXLogAudiogram();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F0D7000, v71, OS_LOG_TYPE_INFO, "Successfully loaded graph model!", buf, 2u);
  }

  v61 = v6;
  v72 = [v6 URLByAppendingPathComponent:v88];
  v73 = v72;
  if (v57)
  {
    v66 = [v72 URLByAppendingPathExtension:@"mlmodel"];

    id v89 = 0;
    v62 = [MEMORY[0x263F00D80] compileModelAtURL:v66 error:&v89];
    id v74 = v89;
    if (v74)
    {
      v65 = v74;
      v75 = AXLogAudiogram();
      v67 = v79;
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
        -[AIAudiogramIngestionEngine _loadV2ModelFromAssetPath:assetProperties:]();
      }

      goto LABEL_66;
    }
    v73 = v66;
  }
  else
  {
    v62 = [v72 URLByAppendingPathExtension:@"mlmodelc"];
  }
  v67 = v79;

  v76 = [_TtC18AudiogramIngestion28AudiogramSymbolDetectorModel alloc];
  LODWORD(v77) = v29;
  v78 = -[AudiogramSymbolDetectorModel initWithModelUrl:modelInputSize:confidenceThreshold:classNames:collisionMitigationClassNames:](v76, "initWithModelUrl:modelInputSize:confidenceThreshold:classNames:collisionMitigationClassNames:", v62, v79, v87, v41, v44, v77);
  [(AIAudiogramIngestionEngine *)self setSymbolModel:v78];

  v66 = AXLogAudiogram();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F0D7000, v66, OS_LOG_TYPE_INFO, "Successfully loaded symbol model!", buf, 2u);
  }
  v65 = 0;
LABEL_66:
}

- (void)modelDidUpdate:(id)a3 assetProperties:(id)a4 assetVersion:(unint64_t)a5 withError:(id)a6
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    v12 = AXLogAudiogram();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v11;
      _os_log_impl(&dword_23F0D7000, v12, OS_LOG_TYPE_INFO, "AIAudiogramIngestionEngine failed to download model: %@", (uint8_t *)&v16, 0xCu);
    }

    if ([(AIAudiogramIngestionEngine *)self isRetrievingLatestModelSilently]) {
      goto LABEL_12;
    }
    v13 = [(AIAudiogramIngestionEngine *)self delegate];
    [v13 audiogramIngestionEngineModelDownloadFailed:v11];
LABEL_11:

LABEL_12:
    [(AIAudiogramIngestionEngine *)self _stopRetrievingLatestModel];
    goto LABEL_13;
  }
  uint64_t v14 = AXLogAudiogram();
  v15 = v14;
  if (v9)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_23F0D7000, v15, OS_LOG_TYPE_INFO, "AIAudiogramIngestionEngine finished downloading model", (uint8_t *)&v16, 2u);
    }

    [(AIAudiogramIngestionEngine *)self _loadModelFromAssetPath:v9 assetProperties:v10];
    if ([(AIAudiogramIngestionEngine *)self isRetrievingLatestModelSilently]) {
      goto LABEL_12;
    }
    v13 = [(AIAudiogramIngestionEngine *)self delegate];
    [v13 audiogramIngestionEngineModelDownloadComplete];
    goto LABEL_11;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[AIAudiogramIngestionEngine modelDidUpdate:assetProperties:assetVersion:withError:]();
  }

LABEL_13:
}

- (void)modelDownloadProgressDidUpdate:(float)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v5 = AXLogAudiogram();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    double v9 = (float)(a3 * 100.0);
    _os_log_impl(&dword_23F0D7000, v5, OS_LOG_TYPE_INFO, "AIAudiogramIngestionEngine downloading model %0.1f%%", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(AIAudiogramIngestionEngine *)self delegate];
  *(float *)&double v7 = a3;
  [v6 audiogramIngestionEngineModelDownloadProgressed:v7];
}

- (id)_textFromAudiogramImage:(id)a3 regionOfInterest:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v29[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  double v9 = objc_opt_new();
  id v10 = objc_alloc_init(MEMORY[0x263F1EF90]);
  id v11 = [MEMORY[0x263EFF960] preferredLanguages];
  [v10 setRecognitionLanguages:v11];

  [v10 setUsesLanguageCorrection:1];
  [v10 setMinimumTextHeight:0.0];
  [v10 setRecognitionLevel:0];
  v31.origin.double x = x;
  v31.origin.double y = y;
  v31.size.double width = width;
  v31.size.double height = height;
  if (!CGRectIsEmpty(v31)) {
    objc_msgSend(v10, "setRegionOfInterest:", x, y, width, height);
  }
  id v12 = objc_alloc(MEMORY[0x263F1EF40]);
  v13 = (void *)[v12 initWithCIImage:v8 options:MEMORY[0x263EFFA78]];

  v29[0] = v10;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  id v28 = 0;
  [v13 performRequests:v14 error:&v28];
  id v15 = v28;

  if (v15)
  {
    int v16 = AXLogAudiogram();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[AIAudiogramIngestionEngine _textFromAudiogramImage:regionOfInterest:]();
    }

    id v17 = v9;
  }
  else
  {
    uint64_t v18 = [v10 results];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __71__AIAudiogramIngestionEngine__textFromAudiogramImage_regionOfInterest___block_invoke;
    v22[3] = &unk_265058878;
    double v24 = x;
    double v25 = y;
    double v26 = width;
    double v27 = height;
    id v19 = v9;
    id v23 = v19;
    [v18 enumerateObjectsUsingBlock:v22];

    id v20 = v19;
  }

  return v9;
}

void __71__AIAudiogramIngestionEngine__textFromAudiogramImage_regionOfInterest___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(a2, "blocksWithTypes:inRegion:", 16, 0.0, 0.0, 1.0, 1.0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__AIAudiogramIngestionEngine__textFromAudiogramImage_regionOfInterest___block_invoke_2;
  v5[3] = &unk_265058850;
  long long v4 = *(_OWORD *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 40);
  long long v8 = v4;
  id v6 = *(id *)(a1 + 32);
  [v3 enumerateObjectsUsingBlock:v5];
}

void __71__AIAudiogramIngestionEngine__textFromAudiogramImage_regionOfInterest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    IsEmptdouble y = CGRectIsEmpty(*(CGRect *)(a1 + 40));
    id v6 = [AIRecognizedText alloc];
    if (IsEmpty) {
      uint64_t v7 = [(AIRecognizedText *)v6 initWithTextObservation:v4];
    }
    else {
      uint64_t v7 = -[AIRecognizedText initWithTextObservation:regionOfInterest:](v6, "initWithTextObservation:regionOfInterest:", v4, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    }
    long long v8 = (void *)v7;
    [*(id *)(a1 + 32) addObject:v7];
    double v9 = AXLogAudiogram();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __71__AIAudiogramIngestionEngine__textFromAudiogramImage_regionOfInterest___block_invoke_2_cold_1();
    }
  }
}

- (id)_observationsFromCIImage:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(AIAudiogramIngestionEngine *)self model];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F1EE48]);
    uint64_t v7 = [(AIAudiogramIngestionEngine *)self model];
    long long v8 = (void *)[v6 initWithModel:v7];

    id v9 = objc_alloc(MEMORY[0x263F1EF40]);
    id v10 = (void *)[v9 initWithCIImage:v4 options:MEMORY[0x263EFFA78]];
    v17[0] = v8;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    id v16 = 0;
    [v10 performRequests:v11 error:&v16];
    id v12 = v16;

    if (v12)
    {
      v13 = AXLogAudiogram();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[AIAudiogramIngestionEngine _observationsFromCIImage:]();
      }

      uint64_t v14 = (void *)MEMORY[0x263EFFA68];
    }
    else
    {
      uint64_t v14 = [v8 results];
    }
  }
  else
  {
    id v12 = AXLogAudiogram();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AIAudiogramIngestionEngine _observationsFromCIImage:]();
    }
    uint64_t v14 = (void *)MEMORY[0x263EFFA68];
  }

  return v14;
}

- (id)_cropEdgesFromImage:(id)a3 graphRect:(CGRect)a4 symbolsRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v9 = a4.size.height;
  CGFloat v10 = a4.size.width;
  CGFloat v11 = a4.origin.y;
  CGFloat v12 = a4.origin.x;
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v13 = a3;
  uint64_t v14 = objc_opt_new();
  v62.origin.CGFloat x = x;
  v62.origin.CGFloat y = y;
  v62.size.CGFloat width = width;
  v62.size.CGFloat height = height;
  v81.origin.CGFloat x = v12;
  v81.origin.CGFloat y = v11;
  v81.size.CGFloat width = v10;
  v81.size.CGFloat height = v9;
  if (!CGRectIntersectsRect(v62, v81))
  {
    float v40 = AXLogAudiogram();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v79.origin.CGFloat x = x;
      v79.origin.CGFloat y = y;
      v79.size.CGFloat width = width;
      v79.size.CGFloat height = height;
      double v41 = NSStringFromCGRect(v79);
      v80.origin.CGFloat x = v12;
      v80.origin.CGFloat y = v11;
      v80.size.CGFloat width = v10;
      v80.size.CGFloat height = v9;
      v42 = NSStringFromCGRect(v80);
      *(_DWORD *)buf = 138412546;
      int v57 = v41;
      __int16 v58 = 2112;
      v59 = v42;
      _os_log_impl(&dword_23F0D7000, v40, OS_LOG_TYPE_INFO, "No valid crops from rects: %@ %@", buf, 0x16u);

      goto LABEL_23;
    }
LABEL_24:

    goto LABEL_25;
  }
  [v13 extent];
  double v53 = v15;
  [v13 extent];
  double v52 = v16;
  v63.origin.CGFloat x = v12;
  v63.origin.CGFloat y = v11;
  v63.size.CGFloat width = v10;
  v63.size.CGFloat height = v9;
  double MinX = CGRectGetMinX(v63);
  v64.origin.CGFloat x = v12;
  v64.origin.CGFloat y = v11;
  v64.size.CGFloat width = v10;
  v64.size.CGFloat height = v9;
  double MaxX = CGRectGetMaxX(v64);
  v65.origin.CGFloat x = v12;
  v65.origin.CGFloat y = v11;
  v65.size.CGFloat width = v10;
  v65.size.CGFloat height = v9;
  double MinY = CGRectGetMinY(v65);
  v66.origin.CGFloat x = v12;
  CGFloat v50 = v9;
  CGFloat v51 = v11;
  v66.origin.CGFloat y = v11;
  CGFloat rect = v10;
  v66.size.CGFloat width = v10;
  v66.size.CGFloat height = v9;
  double MaxY = CGRectGetMaxY(v66);
  v67.origin.CGFloat x = x;
  v67.origin.CGFloat y = y;
  v67.size.CGFloat width = width;
  v67.size.CGFloat height = height;
  double v17 = CGRectGetMinX(v67);
  v68.origin.CGFloat x = x;
  v68.origin.CGFloat y = y;
  v68.size.CGFloat width = width;
  v68.size.CGFloat height = height;
  double v18 = CGRectGetMaxX(v68);
  v69.origin.CGFloat x = x;
  v69.origin.CGFloat y = y;
  v69.size.CGFloat width = width;
  v69.size.CGFloat height = height;
  double v45 = CGRectGetMinY(v69);
  v70.origin.CGFloat x = x;
  v70.origin.CGFloat y = y;
  double v19 = MinX;
  v70.size.CGFloat width = width;
  v70.size.CGFloat height = height;
  double v20 = CGRectGetMaxY(v70);
  double v21 = MaxX;
  double v44 = v20;
  if (MinX < v17 && MaxX > v17)
  {
    v71.origin.CGFloat x = v12;
    v71.size.CGFloat height = v50;
    v71.origin.CGFloat y = v51;
    v71.size.CGFloat width = rect;
    double v22 = CGRectGetHeight(v71) / v53;
    id v23 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", MinX / v52, MinY / v53, (v17 - MinX) / v52, v22);
    [v14 addObject:v23];

    double v24 = AXLogAudiogram();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v72.origin.CGFloat x = MinX / v52;
      v72.origin.CGFloat y = MinY / v53;
      v72.size.CGFloat width = (v17 - MinX) / v52;
      v72.size.CGFloat height = v22;
      double v25 = NSStringFromCGRect(v72);
      *(_DWORD *)buf = 138412290;
      int v57 = v25;
      _os_log_impl(&dword_23F0D7000, v24, OS_LOG_TYPE_INFO, "Cropped left edge: %@", buf, 0xCu);
    }
    double v19 = MinX;
    double v20 = v44;
    double v21 = MaxX;
  }
  if (v19 < v18 && v21 > v18)
  {
    double v26 = v18 / v52;
    double v27 = (v21 - v18) / v52;
    v73.origin.CGFloat x = v12;
    v73.origin.CGFloat y = v51;
    v73.size.CGFloat width = rect;
    v73.size.CGFloat height = v50;
    double v28 = CGRectGetHeight(v73) / v53;
    int v29 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v26, MinY / v53, v27, v28);
    [v14 addObject:v29];

    v30 = AXLogAudiogram();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v74.origin.CGFloat x = v26;
      v74.origin.CGFloat y = MinY / v53;
      v74.size.CGFloat width = v27;
      v74.size.CGFloat height = v28;
      CGRect v31 = NSStringFromCGRect(v74);
      *(_DWORD *)buf = 138412290;
      int v57 = v31;
      _os_log_impl(&dword_23F0D7000, v30, OS_LOG_TYPE_INFO, "Cropped right edge: %@", buf, 0xCu);
    }
    double v20 = v44;
  }
  if (MinY < v20 && MaxY > v20)
  {
    double v32 = v20 / v53;
    double v49 = v12;
    v75.origin.CGFloat x = v12;
    double v33 = v20;
    v75.origin.CGFloat y = v51;
    v75.size.CGFloat width = rect;
    v75.size.CGFloat height = v50;
    double v34 = CGRectGetWidth(v75) / v52;
    double v35 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v19 / v52, v32, v34, (MaxY - v33) / v53);
    [v14 addObject:v35];

    id v36 = AXLogAudiogram();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v76.origin.CGFloat x = v19 / v52;
      v76.origin.CGFloat y = v32;
      v76.size.CGFloat width = v34;
      v76.size.CGFloat height = (MaxY - v33) / v53;
      float v37 = NSStringFromCGRect(v76);
      *(_DWORD *)buf = 138412290;
      int v57 = v37;
      _os_log_impl(&dword_23F0D7000, v36, OS_LOG_TYPE_INFO, "Cropped top edge: %@", buf, 0xCu);
    }
    CGFloat v12 = v49;
  }
  if (MinY < v45 && MaxY > v45)
  {
    v77.origin.CGFloat x = v12;
    v77.origin.CGFloat y = v51;
    v77.size.CGFloat width = rect;
    v77.size.CGFloat height = v50;
    double v38 = CGRectGetWidth(v77) / v52;
    v39 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v19 / v52, MinY / v53, v38, (v45 - MinY) / v53);
    [v14 addObject:v39];

    float v40 = AXLogAudiogram();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v78.origin.CGFloat x = v19 / v52;
      v78.origin.CGFloat y = MinY / v53;
      v78.size.CGFloat width = v38;
      v78.size.CGFloat height = (v45 - MinY) / v53;
      double v41 = NSStringFromCGRect(v78);
      *(_DWORD *)buf = 138412290;
      int v57 = v41;
      _os_log_impl(&dword_23F0D7000, v40, OS_LOG_TYPE_INFO, "Cropped bottom edge: %@", buf, 0xCu);
LABEL_23:

      goto LABEL_24;
    }
    goto LABEL_24;
  }
LABEL_25:

  return v14;
}

- (id)_rectsOfSymbolsFromImage:(id)a3 objectData:(id)a4
{
  v88[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [v6 extent];
  uint64_t v9 = v8;
  CGRect v67 = v6;
  [v6 extent];
  uint64_t v11 = v10;
  CGFloat v12 = (void *)[v7 mutableCopy];
  CGRect v66 = v7;
  id v13 = (void *)[v7 mutableCopy];
  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke;
  v81[3] = &unk_2650588A0;
  v81[4] = self;
  objc_msgSend(v12, "ax_removeObjectsFromArrayUsingBlock:", v81);
  v80[0] = MEMORY[0x263EF8330];
  v80[1] = 3221225472;
  v80[2] = __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_2;
  v80[3] = &unk_2650588A0;
  v80[4] = self;
  objc_msgSend(v13, "ax_removeObjectsFromArrayUsingBlock:", v80);
  uint64_t v14 = objc_opt_new();
  CGRect v64 = v13;
  CGRect v65 = v12;
  v88[0] = v12;
  v88[1] = v13;
  double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:2];
  v76[0] = MEMORY[0x263EF8330];
  v76[1] = 3221225472;
  v76[2] = __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_3;
  v76[3] = &unk_265058940;
  v76[4] = self;
  uint64_t v78 = v9;
  uint64_t v79 = v11;
  id v16 = v14;
  id v77 = v16;
  CGRect v63 = v15;
  [v15 enumerateObjectsUsingBlock:v76];
  double v17 = AXLogAudiogram();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v83 = v16;
    _os_log_impl(&dword_23F0D7000, v17, OS_LOG_TYPE_INFO, "Uncombined symbol rects %@", buf, 0xCu);
  }

  if ([v16 count])
  {
    unint64_t v18 = 0;
    double v19 = 0.5;
    do
    {
      double v20 = [v16 objectAtIndex:v18];
      [v20 symbolsRect];
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      soft_AX_CGRectGetCenter(v21, v23, v25, v27);
      double v74 = v30;
      double v75 = v29;
      CGFloat v71 = v24;
      CGFloat v72 = v22;
      v89.origin.CGFloat x = v22;
      v89.origin.CGFloat y = v24;
      CGFloat v69 = v28;
      CGFloat v70 = v26;
      v89.size.CGFloat width = v26;
      v89.size.CGFloat height = v28;
      double Width = CGRectGetWidth(v89);
      CGRect v31 = AXLogAudiogram();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v90.origin.CGFloat y = v24;
        v90.origin.CGFloat x = v22;
        v90.size.CGFloat height = v28;
        v90.size.CGFloat width = v26;
        double v32 = NSStringFromCGRect(v90);
        *(_DWORD *)buf = 138412290;
        id v83 = v32;
        _os_log_impl(&dword_23F0D7000, v31, OS_LOG_TYPE_INFO, "RectA %@", buf, 0xCu);
      }
      unint64_t v68 = v18 + 1;
      if ([v16 count] > v18 + 1)
      {
        unint64_t v33 = v18 + 1;
        do
        {
          double v34 = [v16 objectAtIndex:v33];
          [v34 symbolsRect];
          double v36 = v35;
          double v38 = v37;
          double v40 = v39;
          double v42 = v41;

          soft_AX_CGRectGetCenter(v36, v38, v40, v42);
          double v44 = v43;
          double v46 = v45;
          v91.origin.CGFloat x = v36;
          v91.origin.CGFloat y = v38;
          v91.size.CGFloat width = v40;
          v91.size.CGFloat height = v42;
          double v47 = CGRectGetWidth(v91);
          __int16 v48 = AXLogAudiogram();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            v92.origin.CGFloat x = v36;
            v92.origin.CGFloat y = v38;
            v92.size.CGFloat width = v40;
            v92.size.CGFloat height = v42;
            double v49 = NSStringFromCGRect(v92);
            *(_DWORD *)buf = 138412290;
            id v83 = v49;
            _os_log_impl(&dword_23F0D7000, v48, OS_LOG_TYPE_INFO, "RectB %@", buf, 0xCu);
          }
          if (Width >= v47) {
            double v47 = Width;
          }
          soft_AX_CGPointGetDistanceToPoint(v75, v74, v44, v46);
          if (v50 < v47 * v19)
          {
            v93.origin.CGFloat y = v71;
            v93.origin.CGFloat x = v72;
            v93.size.CGFloat height = v69;
            v93.size.CGFloat width = v70;
            v98.origin.CGFloat x = v36;
            v98.origin.CGFloat y = v38;
            v98.size.CGFloat width = v40;
            v98.size.CGFloat height = v42;
            CGRect v94 = CGRectUnion(v93, v98);
            CGFloat x = v94.origin.x;
            CGFloat y = v94.origin.y;
            CGFloat v53 = v94.size.width;
            CGFloat height = v94.size.height;
            objc_msgSend(v20, "setSymbolsRect:");
            [v16 removeObjectAtIndex:v33];
            v55 = AXLogAudiogram();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              v95.origin.CGFloat y = v71;
              v95.origin.CGFloat x = v72;
              v95.size.CGFloat height = v69;
              v95.size.CGFloat width = v70;
              __int16 v56 = NSStringFromCGRect(v95);
              v96.origin.CGFloat x = v36;
              v96.origin.CGFloat y = v38;
              v96.size.CGFloat width = v40;
              v96.size.CGFloat height = v42;
              int v57 = NSStringFromCGRect(v96);
              v97.origin.CGFloat x = x;
              v97.origin.CGFloat y = y;
              v97.size.CGFloat width = v53;
              v97.size.CGFloat height = height;
              __int16 v58 = NSStringFromCGRect(v97);
              *(_DWORD *)buf = 138412802;
              id v83 = v56;
              __int16 v84 = 2112;
              v85 = v57;
              __int16 v86 = 2112;
              id v87 = v58;
              _os_log_impl(&dword_23F0D7000, v55, OS_LOG_TYPE_INFO, "Combining two symbol rects into one %@ + %@ = %@", buf, 0x20u);
            }
            --v33;

            double v19 = 0.5;
          }
          ++v33;
        }
        while (v33 < [v16 count]);
      }

      unint64_t v18 = v68;
    }
    while ([v16 count] > v68);
  }
  v59 = AXLogAudiogram();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v83 = v16;
    _os_log_impl(&dword_23F0D7000, v59, OS_LOG_TYPE_INFO, "All symbol rects %@", buf, 0xCu);
  }

  uint64_t v60 = v77;
  id v61 = v16;

  return v61;
}

uint64_t __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 labels];
  BOOL v5 = [v4 firstObject];
  [v5 confidence];
  float v7 = v6;
  [*(id *)(a1 + 32) modelLabelConfidenceThreshold];
  if (v7 <= v8)
  {
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v9 = [v3 labels];
    uint64_t v10 = [v9 firstObject];
    uint64_t v11 = [v10 identifier];
    CGFloat v12 = [*(id *)(a1 + 32) modelLabelLeftEarSymbol];
    uint64_t v13 = [v11 isEqualToString:v12] ^ 1;
  }
  return v13;
}

uint64_t __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 labels];
  BOOL v5 = [v4 firstObject];
  [v5 confidence];
  float v7 = v6;
  [*(id *)(a1 + 32) modelLabelConfidenceThreshold];
  if (v7 <= v8)
  {
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v9 = [v3 labels];
    uint64_t v10 = [v9 firstObject];
    uint64_t v11 = [v10 identifier];
    CGFloat v12 = [*(id *)(a1 + 32) modelLabelRightEarSymbol];
    uint64_t v13 = [v11 isEqualToString:v12] ^ 1;
  }
  return v13;
}

void __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = objc_opt_new();
    BOOL v5 = objc_opt_new();
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_4;
    v42[3] = &unk_2650588C8;
    id v6 = v4;
    id v43 = v6;
    id v7 = v5;
    id v44 = v7;
    [v3 enumerateObjectsUsingBlock:v42];
    [*(id *)(a1 + 32) _stddevFromNumbers:v6];
    uint64_t v9 = v8;
    [*(id *)(a1 + 32) _stddevFromNumbers:v7];
    uint64_t v11 = v10;
    [*(id *)(a1 + 32) _meanFromNumbers:v6];
    uint64_t v13 = v12;
    [*(id *)(a1 + 32) _meanFromNumbers:v7];
    uint64_t v15 = v14;
    id v16 = AXLogAudiogram();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F0D7000, v16, OS_LOG_TYPE_INFO, "Unfiltered ear object data:", buf, 2u);
    }

    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_200;
    v41[3] = &unk_2650588F0;
    v41[4] = *(void *)(a1 + 32);
    v41[5] = v13;
    v41[6] = v9;
    v41[7] = v15;
    v41[8] = v11;
    objc_msgSend(v3, "ax_removeObjectsFromArrayUsingBlock:", v41);
    if ([v3 count])
    {
      *(void *)buf = 0;
      double v38 = buf;
      uint64_t v39 = 0x2020000000;
      uint64_t v40 = 0x4000000000000000;
      uint64_t v33 = 0;
      double v34 = (double *)&v33;
      uint64_t v35 = 0x2020000000;
      unint64_t v36 = 0xBFF0000000000000;
      uint64_t v29 = 0;
      double v30 = (double *)&v29;
      uint64_t v31 = 0x2020000000;
      uint64_t v32 = 0x4000000000000000;
      uint64_t v25 = 0;
      CGFloat v26 = (double *)&v25;
      uint64_t v27 = 0x2020000000;
      unint64_t v28 = 0xBFF0000000000000;
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_201;
      v24[3] = &unk_265058918;
      v24[4] = buf;
      v24[5] = &v29;
      v24[6] = &v33;
      v24[7] = &v25;
      [v3 enumerateObjectsUsingBlock:v24];
      double v17 = *((double *)v38 + 3);
      double v18 = v30[3];
      double v20 = *(double *)(a1 + 48);
      double v19 = *(double *)(a1 + 56);
      double v21 = v34[3];
      double v22 = v26[3];
      double v23 = objc_opt_new();
      objc_msgSend(v23, "setSymbolsRect:", v17 * v20, v18 * v19, v20 * (v21 - v17), v19 * (v22 - v18));
      [*(id *)(a1 + 40) addObject:v23];

      _Block_object_dispose(&v25, 8);
      _Block_object_dispose(&v29, 8);
      _Block_object_dispose(&v33, 8);
      _Block_object_dispose(buf, 8);
    }
  }
}

void __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = NSNumber;
  id v5 = a2;
  [v5 boundingBox];
  id v6 = [v4 numberWithDouble:CGRectGetMidX(v19)];
  [v3 addObject:v6];

  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = NSNumber;
  [v5 boundingBox];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v20.origin.CGFloat x = v10;
  v20.origin.CGFloat y = v12;
  v20.size.CGFloat width = v14;
  v20.size.CGFloat height = v16;
  id v17 = [v8 numberWithDouble:CGRectGetMidY(v20)];
  [v7 addObject:v17];
}

uint64_t __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_200(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  [v3 boundingBox];
  [v4 _zScoreFromNumber:CGRectGetMidX(v33) mean:*(double *)(a1 + 40) stddev:*(double *)(a1 + 48)];
  double v6 = v5;
  id v7 = *(void **)(a1 + 32);
  [v3 boundingBox];
  [v7 _zScoreFromNumber:CGRectGetMidY(v34) mean:*(double *)(a1 + 56) stddev:*(double *)(a1 + 64)];
  double v9 = v8;
  CGFloat v10 = AXLogAudiogram();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    double v11 = [v3 labels];
    CGFloat v12 = [v11 firstObject];
    double v13 = [v12 identifier];
    CGFloat v14 = [v3 labels];
    double v15 = [v14 firstObject];
    [v15 confidence];
    double v17 = v16;
    [v3 boundingBox];
    double v18 = NSStringFromCGRect(v35);
    int v22 = 138413314;
    double v23 = v13;
    __int16 v24 = 2048;
    double v25 = v17;
    __int16 v26 = 2048;
    double v27 = v6;
    __int16 v28 = 2048;
    double v29 = v9;
    __int16 v30 = 2112;
    uint64_t v31 = v18;
    _os_log_impl(&dword_23F0D7000, v10, OS_LOG_TYPE_INFO, "Ear %@ %0.3f z-score=%0.3f,%0.3f %@", (uint8_t *)&v22, 0x34u);
  }
  BOOL v19 = fabs(v6) > 1.75;
  uint64_t v20 = fabs(v9) > 1.75 || v19;

  return v20;
}

void __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_201(void *a1, void *a2)
{
  id v3 = a2;
  [v3 boundingBox];
  double MinX = CGRectGetMinX(v23);
  [v3 boundingBox];
  double MaxX = CGRectGetMaxX(v24);
  [v3 boundingBox];
  double v6 = 1.0 - CGRectGetMaxY(v25);
  [v3 boundingBox];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v26.origin.CGFloat x = v8;
  v26.origin.CGFloat y = v10;
  v26.size.CGFloat width = v12;
  v26.size.CGFloat height = v14;
  double v15 = 1.0 - CGRectGetMinY(v26);
  uint64_t v16 = *(void *)(a1[4] + 8);
  double v17 = *(double *)(v16 + 24);
  if (v17 >= MinX) {
    double v17 = MinX;
  }
  *(double *)(v16 + 24) = v17;
  uint64_t v18 = *(void *)(a1[5] + 8);
  double v19 = *(double *)(v18 + 24);
  if (v19 >= v6) {
    double v19 = v6;
  }
  *(double *)(v18 + 24) = v19;
  uint64_t v20 = *(void *)(a1[6] + 8);
  double v21 = *(double *)(v20 + 24);
  if (v21 < MaxX) {
    double v21 = MaxX;
  }
  *(double *)(v20 + 24) = v21;
  uint64_t v22 = *(void *)(a1[7] + 8);
  if (*(double *)(v22 + 24) >= v15) {
    double v15 = *(double *)(v22 + 24);
  }
  *(double *)(v22 + 24) = v15;
}

- (id)_rectsOfGraphFromImage:(id)a3 objectData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 extent];
  CGFloat Width = CGRectGetWidth(v27);
  [v7 extent];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v28.origin.CGFloat x = v10;
  v28.origin.CGFloat y = v12;
  v28.size.CGFloat width = v14;
  v28.size.CGFloat height = v16;
  CGFloat Height = CGRectGetHeight(v28);
  uint64_t v18 = objc_opt_new();
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __64__AIAudiogramIngestionEngine__rectsOfGraphFromImage_objectData___block_invoke;
  v23[3] = &unk_265058968;
  v23[4] = self;
  CGFloat v25 = Width;
  CGFloat v26 = Height;
  id v19 = v18;
  id v24 = v19;
  [v6 enumerateObjectsUsingBlock:v23];

  uint64_t v20 = v24;
  id v21 = v19;

  return v21;
}

void __64__AIAudiogramIngestionEngine__rectsOfGraphFromImage_objectData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 labels];
  double v5 = [v4 firstObject];
  [v5 confidence];
  float v7 = v6;
  [*(id *)(a1 + 32) modelLabelConfidenceThreshold];
  if (v7 <= v8)
  {

LABEL_7:
    goto LABEL_8;
  }
  double v9 = [v3 labels];
  CGFloat v10 = [v9 firstObject];
  double v11 = [v10 identifier];
  CGFloat v12 = [*(id *)(a1 + 32) modelLabelGraph];
  int v13 = [v11 isEqualToString:v12];

  if (v13)
  {
    [v3 boundingBox];
    double v15 = *(double *)(a1 + 48) * v14;
    [v3 boundingBox];
    double v16 = (1.0 - CGRectGetMaxY(v26)) * *(double *)(a1 + 56);
    [v3 boundingBox];
    double v18 = *(double *)(a1 + 48) * v17;
    [v3 boundingBox];
    double v20 = *(double *)(a1 + 56) * v19;
    id v21 = AXLogAudiogram();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v27.origin.CGFloat x = v15;
      v27.origin.CGFloat y = v16;
      v27.size.CGFloat width = v18;
      v27.size.CGFloat height = v20;
      uint64_t v22 = NSStringFromCGRect(v27);
      int v23 = 138412290;
      id v24 = v22;
      _os_log_impl(&dword_23F0D7000, v21, OS_LOG_TYPE_INFO, "Found graph %@", (uint8_t *)&v23, 0xCu);
    }
    id v4 = objc_opt_new();
    objc_msgSend(v4, "setGraphRect:", v15, v16, v18, v20);
    [*(id *)(a1 + 40) addObject:v4];
    goto LABEL_7;
  }
LABEL_8:
}

- (id)_cropResultsFromImage:(id)a3 observations:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  float v8 = [(AIAudiogramIngestionEngine *)self _rectsOfGraphFromImage:v6 objectData:v7];
  double v9 = [(AIAudiogramIngestionEngine *)self _rectsOfSymbolsFromImage:v6 objectData:v7];

  CGFloat v10 = objc_opt_new();
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __65__AIAudiogramIngestionEngine__cropResultsFromImage_observations___block_invoke;
  v21[3] = &unk_2650589B8;
  id v11 = v9;
  id v22 = v11;
  id v12 = v10;
  id v23 = v12;
  [v8 enumerateObjectsUsingBlock:v21];
  [v12 addObjectsFromArray:v11];
  int v13 = AXLogAudiogram();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v12;
    _os_log_impl(&dword_23F0D7000, v13, OS_LOG_TYPE_INFO, "Crop rects %@", buf, 0xCu);
  }

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __65__AIAudiogramIngestionEngine__cropResultsFromImage_observations___block_invoke_206;
  v19[3] = &unk_2650589B8;
  v19[4] = self;
  id v20 = v6;
  id v14 = v6;
  [v12 enumerateObjectsUsingBlock:v19];
  double v15 = AXLogAudiogram();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[AIAudiogramIngestionEngine _cropResultsFromImage:observations:]();
  }

  double v16 = v20;
  id v17 = v12;

  return v17;
}

void __65__AIAudiogramIngestionEngine__cropResultsFromImage_observations___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 graphRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  soft_AX_CGRectGetCenter(v4, v6, v8, v10);
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__2;
  id v23 = __Block_byref_object_dispose__2;
  id v24 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  id v12 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __65__AIAudiogramIngestionEngine__cropResultsFromImage_observations___block_invoke_204;
  v17[3] = &unk_265058990;
  *(double *)&v17[6] = v5;
  *(double *)&v17[7] = v7;
  *(double *)&v17[8] = v9;
  *(double *)&v17[9] = v11;
  v17[10] = v13;
  v17[11] = v14;
  v17[4] = &v19;
  v17[5] = v18;
  [v12 enumerateObjectsUsingBlock:v17];
  double v15 = objc_opt_new();
  objc_msgSend(v15, "setGraphRect:", v5, v7, v9, v11);
  double v16 = (void *)v20[5];
  if (v16)
  {
    [v16 symbolsRect];
    objc_msgSend(v15, "setSymbolsRect:");
    [*(id *)(a1 + 32) removeObject:v20[5]];
  }
  [*(id *)(a1 + 40) addObject:v15];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);
}

void __65__AIAudiogramIngestionEngine__cropResultsFromImage_observations___block_invoke_204(uint64_t a1, void *a2)
{
  id v17 = a2;
  [v17 symbolsRect];
  soft_AX_CGRectGetCenter(v4, v5, v6, v7);
  double v9 = v8;
  double v11 = v10;
  v19.CGFloat x = v8;
  v19.CGFloat y = v10;
  if (CGRectContainsPoint(*(CGRect *)(a1 + 48), v19))
  {
    soft_AX_CGPointGetDistanceToPoint(v9, v11, *(double *)(a1 + 80), *(double *)(a1 + 88));
    double v13 = v12;
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v16 = *(void *)(v14 + 40);
    double v15 = (id *)(v14 + 40);
    if (!v16 || v12 < *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      objc_storeStrong(v15, a2);
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v13;
    }
  }
}

void __65__AIAudiogramIngestionEngine__cropResultsFromImage_observations___block_invoke_206(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [v3 graphRect];
  if (CGRectIsEmpty(v51))
  {
    [v3 symbolsRect];
    if (!CGRectIsEmpty(v52))
    {
      double v4 = *(void **)(a1 + 32);
      [v3 symbolsRect];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      [v3 symbolsRect];
      CGFloat v13 = CGRectGetHeight(v53) * -1.5;
      [v3 symbolsRect];
      CGFloat v14 = CGRectGetWidth(v54) * -1.5;
      [*(id *)(a1 + 40) extent];
      objc_msgSend(v4, "_shrinkRect:width:height:insideBounds:", v6, v8, v10, v12, v13, v14, v15, v16);
      objc_msgSend(v3, "setGraphRect:");
      id v17 = AXLogAudiogram();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        [v3 symbolsRect];
        double v18 = NSStringFromCGRect(v55);
        [v3 graphRect];
        CGPoint v19 = NSStringFromCGRect(v56);
        int v46 = 138412546;
        double v47 = v18;
        __int16 v48 = 2112;
        double v49 = v19;
        _os_log_impl(&dword_23F0D7000, v17, OS_LOG_TYPE_INFO, "No graph rect found. Building from symbols rect: %@ -> %@", (uint8_t *)&v46, 0x16u);
      }
    }
  }
  [v3 graphRect];
  if (!CGRectIsEmpty(v57))
  {
    id v20 = *(void **)(a1 + 32);
    [v3 graphRect];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    [v3 graphRect];
    CGFloat v29 = CGRectGetWidth(v58) * -0.75;
    [v3 graphRect];
    CGFloat v30 = CGRectGetHeight(v59) * -0.75;
    [*(id *)(a1 + 40) extent];
    objc_msgSend(v20, "_shrinkRect:width:height:insideBounds:", v22, v24, v26, v28, v29, v30, v31, v32);
    objc_msgSend(v3, "setGraphRect:");
  }
  [v3 symbolsRect];
  if (!CGRectIsEmpty(v60))
  {
    CGRect v33 = *(void **)(a1 + 32);
    [v3 symbolsRect];
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    [v3 symbolsRect];
    CGFloat v42 = CGRectGetWidth(v61) * 0.1;
    [v3 symbolsRect];
    CGFloat v43 = CGRectGetHeight(v62) * 0.1;
    [*(id *)(a1 + 40) extent];
    objc_msgSend(v33, "_shrinkRect:width:height:insideBounds:", v35, v37, v39, v41, v42, v43, v44, v45);
    objc_msgSend(v3, "setSymbolsRect:");
  }
}

- (CGRect)_shrinkRect:(CGRect)a3 width:(double)a4 height:(double)a5 insideBounds:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  CGRect v18 = CGRectInset(a3, a4 * 0.5, a5 * 0.5);
  double x = v18.origin.x;
  double y = v18.origin.y;
  double v12 = v18.size.width;
  double v13 = v18.size.height;
  if (a4 < 0.0)
  {
    if (CGRectGetMinX(v18) < 0.0) {
      double x = 0.0;
    }
    v19.origin.double x = x;
    v19.origin.double y = y;
    v19.size.double width = v12;
    v19.size.double height = v13;
    if (CGRectGetMaxX(v19) > width)
    {
      v20.origin.double x = x;
      v20.origin.double y = y;
      v20.size.double width = v12;
      v20.size.double height = v13;
      double v12 = width - CGRectGetMinX(v20);
    }
  }
  if (a5 < 0.0)
  {
    v21.origin.double x = x;
    v21.origin.double y = y;
    v21.size.double width = v12;
    v21.size.double height = v13;
    if (CGRectGetMinY(v21) < 0.0) {
      double y = 0.0;
    }
    v22.origin.double x = x;
    v22.origin.double y = y;
    v22.size.double width = v12;
    v22.size.double height = v13;
    if (CGRectGetMaxY(v22) > height)
    {
      v23.origin.double x = x;
      v23.origin.double y = y;
      v23.size.double width = v12;
      v23.size.double height = v13;
      double v13 = height - CGRectGetMinY(v23);
    }
  }
  double v14 = x;
  double v15 = y;
  double v16 = v12;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (id)_audiogramMapFromRecognizedText:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  double v4 = [(AIAudiogramIngestionEngine *)self _formatNumbersFromRecognizedText:a3];
  double v5 = [(AIAudiogramIngestionEngine *)self _groupNumbersByAxisFromRecognizedText:v4];
  uint64_t v20 = 0;
  CGRect v21 = &v20;
  uint64_t v22 = 0x3032000000;
  CGRect v23 = __Block_byref_object_copy__2;
  double v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000;
  double v17 = __Block_byref_object_copy__2;
  CGRect v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__AIAudiogramIngestionEngine__audiogramMapFromRecognizedText___block_invoke;
  v13[3] = &unk_2650589E0;
  v13[4] = &v20;
  v13[5] = &v14;
  [v5 enumerateObjectsUsingBlock:v13];
  double v6 = AXLogAudiogram();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v21[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v7;
    _os_log_impl(&dword_23F0D7000, v6, OS_LOG_TYPE_DEFAULT, "Found X Axis Group: %@", buf, 0xCu);
  }

  double v8 = AXLogAudiogram();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v15[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v9;
    _os_log_impl(&dword_23F0D7000, v8, OS_LOG_TYPE_DEFAULT, "Found Y Axis Group: %@", buf, 0xCu);
  }

  if (v21[5] && v15[5])
  {
    double v10 = [AIAudiogramMap alloc];
    double v11 = [(AIAudiogramMap *)v10 initWithFrequencies:v21[5] hearingLevels:v15[5]];
  }
  else
  {
    double v11 = 0;
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __62__AIAudiogramIngestionEngine__audiogramMapFromRecognizedText___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 axis]) {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(void *)(v4 + 8);
  double v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (id)_formatNumbersFromRecognizedText:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  uint64_t v5 = [v3 characterSetWithCharactersInString:@"0123456789,.-"];
  double v6 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"kK"];
  uint64_t v7 = objc_opt_new();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__AIAudiogramIngestionEngine__formatNumbersFromRecognizedText___block_invoke;
  v14[3] = &unk_265058A08;
  id v15 = v5;
  id v16 = v6;
  id v8 = v7;
  id v17 = v8;
  id v9 = v6;
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v14];

  double v11 = v17;
  id v12 = v8;

  return v12;
}

void __63__AIAudiogramIngestionEngine__formatNumbersFromRecognizedText___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F08B08];
  uint64_t v5 = [v3 string];
  double v6 = [v4 localizedScannerWithString:v5];

  uint64_t v7 = *(void *)(a1 + 32);
  id v57 = 0;
  [v6 scanUpToCharactersFromSet:v7 intoString:&v57];
  id v8 = v57;
  int v9 = [v8 length];
  uint64_t v10 = *(void *)(a1 + 32);
  id v56 = 0;
  [v6 scanCharactersFromSet:v10 intoString:&v56];
  id v11 = v56;
  int v12 = [v11 length];
  uint64_t v13 = *(void *)(a1 + 40);
  id v55 = 0;
  [v6 scanCharactersFromSet:v13 intoString:&v55];
  id v14 = v55;
  int v15 = [v14 length] + v12;
  if (v15)
  {
    id v16 = [v3 string];
    char v17 = [v16 containsString:@"d8"];

    if ((v17 & 1) == 0)
    {
      int v19 = [v11 hasPrefix:@"-"];
      CGRect v18 = [v11 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26F2D3B98];

      if (![v18 length]) {
        goto LABEL_32;
      }
      if (v19)
      {
        uint64_t v20 = [@"-" stringByAppendingString:v18];

        CGRect v18 = (void *)v20;
      }
      if ([v18 containsString:@","]
        && (uint64_t v21 = [v18 rangeOfString:@","],
            (unint64_t)([v18 length] - v21) >= 3))
      {
        int v22 = v9;
        uint64_t v23 = [v18 stringByReplacingOccurrencesOfString:@"," withString:&stru_26F2D3B98];

        CGRect v18 = (void *)v23;
      }
      else
      {
        int v22 = v9;
      }
      uint64_t v53 = [v18 integerValue];
      double v24 = [v14 lowercaseString];
      int v25 = [v24 isEqualToString:@"k"];

      if (v25)
      {
        if ([v18 containsString:@"."])
        {
          [v18 floatValue];
          uint64_t v53 = (uint64_t)(float)(v26 * 1000.0);
        }
        else
        {
          v53 *= 1000;
        }
      }
      [v18 floatValue];
      if (v27 <= 0.0)
      {
        int v28 = v22;
      }
      else
      {
        int v28 = v22;
        if (v53 <= 9 && v53 != 5 && ![v8 length] && !objc_msgSend(v14, "length"))
        {
          [v18 floatValue];
          uint64_t v53 = (uint64_t)(float)(v29 * 1000.0);
        }
      }
      if (v28
        || ([v3 string],
            CGFloat v30 = objc_claimAutoreleasedReturnValue(),
            uint64_t v31 = [v30 length],
            v30,
            int v28 = 0,
            v15 != v31))
      {
        id v54 = 0;
        objc_msgSend(v3, "boundingBoxForRange:error:", v28, v15, &v54);
        CGFloat v39 = v38;
        CGFloat v41 = v40;
        CGFloat v43 = v42;
        CGFloat v45 = v44;
        int v46 = (AIRecognizedText *)v54;
        if (v46)
        {
          double v47 = v46;
          __int16 v48 = AXLogAudiogram();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            __63__AIAudiogramIngestionEngine__formatNumbersFromRecognizedText___block_invoke_cold_1();
          }

          goto LABEL_31;
        }
        v58.origin.double x = v39;
        v58.origin.double y = v41;
        v58.size.double width = v43;
        v58.size.double height = v45;
        double MidX = CGRectGetMidX(v58);
        [v3 center];
        double v37 = v49;
        v59.origin.double x = v39;
        v59.origin.double y = v41;
        v59.size.double width = v43;
        v59.size.double height = v45;
        double Width = CGRectGetWidth(v59);
      }
      else
      {
        [v3 width];
        double Width = v32;
        [v3 center];
        double MidX = v34;
        double v37 = v36;
      }
      uint64_t v50 = [AIRecognizedText alloc];
      CGRect v51 = [v3 string];
      CGRect v52 = [NSNumber numberWithInteger:v53];
      double v47 = -[AIRecognizedText initWithString:center:width:numericalValue:](v50, "initWithString:center:width:numericalValue:", v51, v52, MidX, v37, Width);

      [*(id *)(a1 + 48) addObject:v47];
LABEL_31:

      goto LABEL_32;
    }
  }
  CGRect v18 = v11;
LABEL_32:
}

- (id)_groupNumbersByAxisFromRecognizedText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_0);
  double v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_2;
  v32[3] = &unk_265058A08;
  id v8 = v5;
  id v33 = v8;
  id v34 = v6;
  id v35 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateObjectsUsingBlock:v32];
  id v11 = [(AIAudiogramIngestionEngine *)self _removeDuplicateSetsFromTextSets:v10];

  int v12 = [(AIAudiogramIngestionEngine *)self _removeDuplicateSetsFromTextSets:v9];

  uint64_t v26 = 0;
  float v27 = &v26;
  uint64_t v28 = 0x3032000000;
  float v29 = __Block_byref_object_copy__2;
  CGFloat v30 = __Block_byref_object_dispose__2;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__2;
  double v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_4;
  v17[3] = &unk_265058AA0;
  v17[4] = self;
  v17[5] = v19;
  v17[6] = &v26;
  [v11 enumerateObjectsUsingBlock:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_239;
  v16[3] = &unk_265058AA0;
  v16[4] = self;
  v16[5] = v18;
  v16[6] = &v20;
  [v12 enumerateObjectsUsingBlock:v16];
  uint64_t v13 = objc_opt_new();
  id v14 = v13;
  if (v27[5]) {
    objc_msgSend(v13, "addObject:");
  }
  if (v21[5]) {
    objc_msgSend(v14, "addObject:");
  }
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v14;
}

BOOL __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 numericalValue];
  BOOL v3 = v2 != 0;

  return v3;
}

void __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  double v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  id v8 = *(void **)(a1 + 32);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_3;
  int v15 = &unk_265058A50;
  uint64_t v19 = a3;
  id v9 = v5;
  id v16 = v9;
  id v10 = v6;
  id v17 = v10;
  id v11 = v7;
  id v18 = v11;
  [v8 enumerateObjectsUsingBlock:&v12];
  if (objc_msgSend(v10, "count", v12, v13, v14, v15))
  {
    [v10 addObject:v9];
    [*(id *)(a1 + 40) addObject:v10];
  }
  if ([v11 count])
  {
    [v11 addObject:v9];
    [*(id *)(a1 + 48) addObject:v11];
  }
}

uint64_t __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (*(void *)(a1 + 56) != a3)
  {
    uint64_t v26 = v5;
    [*(id *)(a1 + 32) center];
    double v8 = v7;
    [v26 center];
    if (vabdd_f64(v8, v9) < 0.1)
    {
      id v10 = [v26 numericalValue];
      id v11 = [*(id *)(a1 + 32) numericalValue];
      if ([v10 compare:v11] == -1)
      {
      }
      else
      {
        [*(id *)(a1 + 32) center];
        double v13 = v12;
        [v26 center];
        double v15 = v14;

        if (v13 < v15) {
          [*(id *)(a1 + 40) addObject:v26];
        }
      }
    }
    [*(id *)(a1 + 32) center];
    double v17 = v16;
    id v5 = (id)[v26 center];
    id v6 = v26;
    if (vabdd_f64(v17, v18) < 0.1)
    {
      uint64_t v19 = [v26 numericalValue];
      uint64_t v20 = [*(id *)(a1 + 32) numericalValue];
      if ([v19 compare:v20] == -1)
      {
      }
      else
      {
        [*(id *)(a1 + 32) center];
        double v22 = v21;
        [v26 center];
        double v24 = v23;

        id v6 = v26;
        if (v22 <= v24) {
          goto LABEL_13;
        }
        id v5 = (id)[*(id *)(a1 + 48) addObject:v26];
      }
      id v6 = v26;
    }
  }
LABEL_13:
  return MEMORY[0x270F9A758](v5, v6);
}

void __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ((unint64_t)[v3 count] > *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v4 = AXLogAudiogram();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_23F0D7000, v4, OS_LOG_TYPE_INFO, "Starting validation for X axis with matches %@", (uint8_t *)&buf, 0xCu);
    }

    id v5 = [*(id *)(a1 + 32) _sortAndRemoveInvalidAxisValues:v3 forAxis:0 error:0];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    id v6 = [(id)AIAudiogramValidFrequencies firstObject];
    uint64_t v7 = [v6 integerValue];

    double v8 = [(id)AIAudiogramValidFrequencies lastObject];
    uint64_t v9 = [v8 integerValue];

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_237;
    v15[3] = &unk_265058A78;
    v15[5] = v7;
    v15[6] = v9;
    v15[4] = &buf;
    [v5 enumerateObjectsUsingBlock:v15];
    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      unint64_t v10 = [v5 count];
      if (v10 > *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        id v11 = AXLogAudiogram();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)double v16 = 138412290;
          double v17 = v5;
          _os_log_impl(&dword_23F0D7000, v11, OS_LOG_TYPE_INFO, "Matches are now the largest X axis group: %@", v16, 0xCu);
        }

        double v12 = [[AIAudiogramAxis alloc] initWithAxis:0 values:v5];
        uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
        double v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;

        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
      }
    }
    _Block_object_dispose(&buf, 8);
  }
}

void __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_237(void *a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 numericalValue];
  if ([v3 integerValue] <= a1[5])
  {

    uint64_t v7 = v8;
  }
  else
  {
    id v4 = [v8 numericalValue];
    uint64_t v5 = [v4 integerValue];
    uint64_t v6 = a1[6];

    uint64_t v7 = v8;
    if (v5 < v6) {
      *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
    }
  }
}

void __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_239(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ((unint64_t)[v3 count] > *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v4 = AXLogAudiogram();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_23F0D7000, v4, OS_LOG_TYPE_INFO, "Starting validation for Y axis with matches %@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v5 = [*(id *)(a1 + 32) _sortAndRemoveInvalidAxisValues:v3 forAxis:1 error:0];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_240;
    v11[3] = &unk_265058AC8;
    v11[4] = &buf;
    [v5 enumerateObjectsUsingBlock:v11];
    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      unint64_t v6 = [v5 count];
      if (v6 > *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        uint64_t v7 = AXLogAudiogram();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)double v12 = 138412290;
          uint64_t v13 = v5;
          _os_log_impl(&dword_23F0D7000, v7, OS_LOG_TYPE_INFO, "Matches are now the largest Y axis group: %@", v12, 0xCu);
        }

        id v8 = [[AIAudiogramAxis alloc] initWithAxis:1 values:v5];
        uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
        unint64_t v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
      }
    }
    _Block_object_dispose(&buf, 8);
  }
}

void __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_240(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 numericalValue];
  double v4 = (double)[v3 integerValue];
  if (v4 <= -20.0)
  {

    uint64_t v7 = v8;
  }
  else
  {
    uint64_t v5 = objc_msgSend(v8, "numericalValue", v4, -20.0);
    double v6 = (double)[v5 integerValue];

    uint64_t v7 = v8;
    if (v6 < 120.0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
}

- (id)_removeDuplicateSetsFromTextSets:(id)a3
{
  id v3 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__AIAudiogramIngestionEngine__removeDuplicateSetsFromTextSets___block_invoke;
  v6[3] = &unk_265058B40;
  id v4 = v3;
  id v7 = v4;
  objc_msgSend(v4, "ax_removeObjectsFromArrayUsingBlock:", v6);

  return v4;
}

uint64_t __63__AIAudiogramIngestionEngine__removeDuplicateSetsFromTextSets___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  double v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__AIAudiogramIngestionEngine__removeDuplicateSetsFromTextSets___block_invoke_2;
  v10[3] = &unk_265058B18;
  uint64_t v13 = a3;
  id v7 = v5;
  id v11 = v7;
  double v12 = &v14;
  [v6 enumerateObjectsUsingBlock:v10];
  uint64_t v8 = *((unsigned __int8 *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __63__AIAudiogramIngestionEngine__removeDuplicateSetsFromTextSets___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (a1[6] != a3)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 1;
    uint64_t v9 = (void *)a1[4];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __63__AIAudiogramIngestionEngine__removeDuplicateSetsFromTextSets___block_invoke_3;
    v10[3] = &unk_265058AF0;
    id v11 = v7;
    double v12 = &v13;
    [v9 enumerateObjectsUsingBlock:v10];
    if (*((unsigned char *)v14 + 24))
    {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      *a4 = 1;
    }

    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __63__AIAudiogramIngestionEngine__removeDuplicateSetsFromTextSets___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if ((result & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (void)audiogramFromImages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AIAudiogramIngestionEngine *)self analysisQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__AIAudiogramIngestionEngine_audiogramFromImages_completion___block_invoke;
  block[3] = &unk_265058B68;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __61__AIAudiogramIngestionEngine_audiogramFromImages_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) audiogramFromImages:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    uint64_t v5 = v2;
    uint64_t v3 = (*(uint64_t (**)(void))(v3 + 16))();
    uint64_t v2 = v5;
  }
  return MEMORY[0x270F9A758](v3, v2);
}

- (id)audiogramFromImage:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v9 count:1];

  id v7 = -[AIAudiogramIngestionEngine audiogramFromImages:](self, "audiogramFromImages:", v6, v9, v10);

  return v7;
}

- (id)audiogramFromImages:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [(AIAudiogramIngestionEngine *)self _audiogramFromImagesV2:v4];
  }
  else
  {
    id v6 = objc_opt_new();
    if ([v4 count])
    {
      uint64_t v10 = MEMORY[0x263EF8330];
      uint64_t v11 = 3221225472;
      id v12 = __50__AIAudiogramIngestionEngine_audiogramFromImages___block_invoke;
      id v13 = &unk_265058BE0;
      uint64_t v14 = self;
      id v7 = v6;
      id v15 = v7;
      [v4 enumerateObjectsUsingBlock:&v10];
      id v5 = -[AIAudiogramIngestionEngine _combineAudiograms:](self, "_combineAudiograms:", v7, v10, v11, v12, v13, v14);
      if (!v5)
      {
        uint64_t v8 = AXLogAudiogram();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[AIAudiogramIngestionEngine audiogramFromImages:]();
        }
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

void __50__AIAudiogramIngestionEngine_audiogramFromImages___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = AXLogAudiogram();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_23F0D7000, v4, OS_LOG_TYPE_DEFAULT, "Starting next image!", buf, 2u);
  }

  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_propertyOrientationFromOrientation:", objc_msgSend(v3, "imageOrientation"));
  id v6 = AXLogAudiogram();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [v3 imageOrientation];
    *(_DWORD *)long long buf = 134218240;
    uint64_t v30 = v7;
    __int16 v31 = 1024;
    int v32 = v5;
    _os_log_impl(&dword_23F0D7000, v6, OS_LOG_TYPE_INFO, "Orienting image %ld -> %d", buf, 0x12u);
  }

  id v8 = objc_alloc(MEMORY[0x263F00650]);
  id v9 = v3;
  uint64_t v10 = objc_msgSend(v8, "initWithCGImage:options:", objc_msgSend(v9, "CGImage"), 0);
  uint64_t v11 = [v10 imageByApplyingCGOrientation:v5];

  id v12 = [*(id *)(a1 + 32) _observationsFromCIImage:v11];
  if ([v12 count])
  {
    id v13 = [*(id *)(a1 + 32) _cropResultsFromImage:v11 observations:v12];
    uint64_t v14 = objc_opt_new();
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    double v23 = __50__AIAudiogramIngestionEngine_audiogramFromImages___block_invoke_244;
    double v24 = &unk_265058BB8;
    uint64_t v25 = *(void *)(a1 + 32);
    id v15 = v11;
    id v26 = v15;
    id v16 = v12;
    id v27 = v16;
    id v17 = v14;
    id v28 = v17;
    [v13 enumerateObjectsUsingBlock:&v21];
    if (objc_msgSend(v17, "count", v21, v22, v23, v24, v25))
    {
      [*(id *)(a1 + 40) addObjectsFromArray:v17];
    }
    else
    {
      double v18 = AXLogAudiogram();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_23F0D7000, v18, OS_LOG_TYPE_INFO, "Attempting find audiogram text without cropping", buf, 2u);
      }

      uint64_t v19 = objc_msgSend(*(id *)(a1 + 32), "_textFromAudiogramImage:regionOfInterest:", v15, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      char v20 = [*(id *)(a1 + 32) _audiogramFromSymbols:v16 recognizedText:v19];
      if (v20) {
        [*(id *)(a1 + 40) addObject:v20];
      }
    }
  }
  else
  {
    id v13 = AXLogAudiogram();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_23F0D7000, v13, OS_LOG_TYPE_INFO, "No observations for audiogram image", buf, 2u);
    }
  }
}

void __50__AIAudiogramIngestionEngine_audiogramFromImages___block_invoke_244(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 graphRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 symbolsRect];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  v38.origin.double x = v5;
  v38.origin.double y = v7;
  v38.size.double width = v9;
  v38.size.double height = v11;
  if (!CGRectIsEmpty(v38))
  {
    v39.origin.double x = v13;
    v39.origin.double y = v15;
    v39.size.double width = v17;
    v39.size.double height = v19;
    if (!CGRectIsEmpty(v39))
    {
      char v20 = AXLogAudiogram();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_23F0D7000, v20, OS_LOG_TYPE_INFO, "Attempting to crop graph edges for audiogram text", buf, 2u);
      }

      uint64_t v21 = objc_opt_new();
      uint64_t v22 = objc_msgSend(*(id *)(a1 + 32), "_cropEdgesFromImage:graphRect:symbolsRect:", *(void *)(a1 + 40), v5, v7, v9, v11, v13, v15, v17, v19);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __50__AIAudiogramIngestionEngine_audiogramFromImages___block_invoke_245;
      v34[3] = &unk_265058B90;
      double v23 = *(void **)(a1 + 40);
      v34[4] = *(void *)(a1 + 32);
      id v35 = v23;
      id v36 = v21;
      id v24 = v21;
      [v22 enumerateObjectsUsingBlock:v34];
      uint64_t v25 = [*(id *)(a1 + 32) _audiogramFromSymbols:*(void *)(a1 + 48) recognizedText:v24];

      if (v25) {
        goto LABEL_10;
      }
    }
  }
  v40.origin.double x = v5;
  v40.origin.double y = v7;
  v40.size.double width = v9;
  v40.size.double height = v11;
  if (CGRectIsEmpty(v40)) {
    goto LABEL_11;
  }
  id v26 = AXLogAudiogram();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_23F0D7000, v26, OS_LOG_TYPE_INFO, "Attempting to crop graph for audiogram text", buf, 2u);
  }

  id v27 = objc_msgSend(*(id *)(a1 + 40), "imageByCroppingToRect:", v5, v7, v9, v11);
  [*(id *)(a1 + 40) extent];
  double Width = CGRectGetWidth(v41);
  [*(id *)(a1 + 40) extent];
  double Height = CGRectGetHeight(v42);
  v43.origin.double x = v5;
  v43.origin.double y = v7;
  v43.size.double width = v9;
  v43.size.double height = v11;
  CGFloat v30 = CGRectGetMinX(v43) / Width;
  v44.origin.double x = v5;
  v44.origin.double y = v7;
  v44.size.double width = v9;
  v44.size.double height = v11;
  CGFloat v31 = CGRectGetMinY(v44) / Height;
  v45.origin.double x = v5;
  v45.origin.double y = v7;
  v45.size.double width = v9;
  v45.size.double height = v11;
  CGFloat v32 = CGRectGetWidth(v45) / Width;
  v46.origin.double x = v5;
  v46.origin.double y = v7;
  v46.size.double width = v9;
  v46.size.double height = v11;
  uint64_t v33 = objc_msgSend(*(id *)(a1 + 32), "_textFromAudiogramImage:regionOfInterest:", v27, v30, v31, v32, CGRectGetHeight(v46) / Height);
  uint64_t v25 = [*(id *)(a1 + 32) _audiogramFromSymbols:*(void *)(a1 + 48) recognizedText:v33];

  if (!v25)
  {
LABEL_11:
    uint64_t v25 = AXLogAudiogram();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      __50__AIAudiogramIngestionEngine_audiogramFromImages___block_invoke_244_cold_1();
    }
  }
  else
  {
LABEL_10:
    [*(id *)(a1 + 56) addObject:v25];
  }
}

void __50__AIAudiogramIngestionEngine_audiogramFromImages___block_invoke_245(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [a2 CGRectValue];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "_textFromAudiogramImage:regionOfInterest:", *(void *)(a1 + 40));
  [*(id *)(a1 + 48) addObjectsFromArray:v3];
  double v4 = AXLogAudiogram();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    double v6 = v3;
    _os_log_impl(&dword_23F0D7000, v4, OS_LOG_TYPE_INFO, "Found text from edge crop: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (id)_audiogramFromSymbols:(id)a3 recognizedText:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(AIAudiogramIngestionEngine *)self _audiogramMapFromRecognizedText:a4];
  double v8 = [(AIAudiogramIngestionEngine *)self _audiogramFromSymbols:v6 onAudiogramMap:v7];

  return v8;
}

- (id)_audiogramFromSymbols:(id)a3 onAudiogramMap:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  double v9 = 0;
  if (v7 && v8)
  {
    id v40 = objc_alloc_init(MEMORY[0x263EFF980]);
    double v10 = [getHKUnitClass_1() hertzUnit];
    double v11 = [getHKUnitClass_1() decibelHearingLevelUnit];
    double v12 = objc_opt_new();
    CGRect v44 = v6;
    double v13 = objc_opt_new();
    double v14 = objc_opt_new();
    double v15 = objc_opt_new();
    double v16 = objc_opt_new();
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke;
    v50[3] = &unk_265058C30;
    v50[4] = self;
    id v51 = v7;
    id v43 = v15;
    id v52 = v43;
    id v17 = v11;
    id v53 = v17;
    id v18 = v13;
    id v6 = v44;
    id v19 = v18;
    id v54 = v18;
    id v20 = v12;
    id v55 = v20;
    id v42 = v16;
    id v56 = v42;
    id v21 = v14;
    id v57 = v21;
    [v44 enumerateObjectsUsingBlock:v50];
    uint64_t v22 = AXLogAudiogram();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v60 = v19;
      _os_log_impl(&dword_23F0D7000, v22, OS_LOG_TYPE_INFO, "Unsorted results (left): %@", buf, 0xCu);
    }

    double v23 = AXLogAudiogram();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v60 = v21;
      _os_log_impl(&dword_23F0D7000, v23, OS_LOG_TYPE_INFO, "Unsorted results (right): %@", buf, 0xCu);
    }

    id v24 = [MEMORY[0x263F08B30] sortDescriptorWithKey:&stru_26F2D3B98 ascending:1];
    CGRect v58 = v24;
    uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
    [v20 sortUsingDescriptors:v25];

    id v26 = AXLogAudiogram();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v60 = v20;
      _os_log_impl(&dword_23F0D7000, v26, OS_LOG_TYPE_INFO, "Sorted frequencies: %@", buf, 0xCu);
    }

    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_253;
    v45[3] = &unk_265058C58;
    id v27 = v19;
    id v46 = v27;
    id v28 = v21;
    id v47 = v28;
    id v29 = v10;
    id v48 = v29;
    id v30 = v40;
    id v49 = v30;
    [v20 enumerateObjectsUsingBlock:v45];
    if ([v30 count])
    {
      id HKAudiogramSampleClass = getHKAudiogramSampleClass();
      id v32 = v27;
      [MEMORY[0x263EFF910] date];
      id v41 = v28;
      id v33 = v20;
      id v34 = v7;
      id v36 = v35 = v17;
      double v37 = [MEMORY[0x263EFF910] date];
      CGRect v38 = metadataForHKAudiogramSample();
      double v9 = [HKAudiogramSampleClass audiogramSampleWithSensitivityPoints:v30 startDate:v36 endDate:v37 metadata:v38];

      id v27 = v32;
      id v6 = v44;

      id v17 = v35;
      id v7 = v34;
      id v20 = v33;
      id v28 = v41;
    }
    else
    {
      double v9 = 0;
    }
  }
  return v9;
}

void __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke(id *a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a2;
  double v4 = [v3 labels];
  int v5 = [v4 firstObject];
  id v6 = [v5 identifier];
  id v7 = [a1[4] modelLabelLeftEarSymbol];
  if ([v6 isEqualToString:v7])
  {
  }
  else
  {
    uint64_t v8 = [v3 labels];
    double v9 = [v8 firstObject];
    [v9 identifier];
    double v11 = v10 = v3;
    double v12 = [a1[4] modelLabelRightEarSymbol];
    char v31 = [v11 isEqualToString:v12];

    id v3 = v10;
    if ((v31 & 1) == 0) {
      goto LABEL_9;
    }
  }
  [v3 boundingBox];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  double v21 = v13 + v17 * 0.5;
  double v22 = v15 + v19 * 0.5;
  double v23 = AXLogAudiogram();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    id v24 = [v3 labels];
    uint64_t v25 = [v24 firstObject];
    id v26 = [v25 identifier];
    v51.double x = v21;
    v51.double y = v22;
    id v27 = NSStringFromCGPoint(v51);
    v52.origin.double x = v14;
    v52.origin.double y = v16;
    v52.size.double width = v18;
    v52.size.double height = v20;
    id v28 = NSStringFromCGRect(v52);
    *(_DWORD *)long long buf = 138412802;
    CGRect v45 = v26;
    __int16 v46 = 2112;
    id v47 = v27;
    __int16 v48 = 2112;
    id v49 = v28;
    _os_log_impl(&dword_23F0D7000, v23, OS_LOG_TYPE_INFO, "Got %@ center %@ from box %@", buf, 0x20u);
  }
  id v29 = objc_msgSend(a1[5], "frequencyAtPoint:", v21, v22);
  if ([(id)AIAudiogramValidFrequencies containsObject:v29])
  {
    id v30 = [v3 labels];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_250;
    v32[3] = &unk_265058C08;
    void v32[4] = a1[4];
    id v33 = a1[6];
    id v34 = v29;
    id v35 = a1[5];
    double v42 = v21;
    double v43 = v22;
    id v36 = a1[7];
    id v37 = a1[8];
    id v38 = v3;
    id v39 = a1[9];
    id v40 = a1[10];
    id v41 = a1[11];
    [v30 enumerateObjectsUsingBlock:v32];
  }
LABEL_9:
}

void __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_250(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a2;
  [v6 confidence];
  float v8 = v7;
  [*(id *)(a1 + 32) modelLabelConfidenceThreshold];
  if (v8 >= v9)
  {
    CGFloat v18 = [v6 identifier];
    double v19 = [*(id *)(a1 + 32) modelLabelLeftEarSymbol];
    int v20 = [v18 isEqualToString:v19];

    if (v20)
    {
      double v21 = [*(id *)(a1 + 40) objectForKey:*(void *)(a1 + 48)];
      [v21 floatValue];
      float v23 = v22;

      if (v23 != 0.0 && v8 <= v23) {
        goto LABEL_20;
      }
      uint64_t v25 = objc_msgSend(*(id *)(a1 + 56), "hearingLevelAtPoint:", *(double *)(a1 + 112), *(double *)(a1 + 120));
      [v25 doubleValue];
      double v27 = v26;

      id v28 = [getHKQuantityClass_0() quantityWithUnit:*(void *)(a1 + 64) doubleValue:v27];
      id v29 = AXLogAudiogram();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v43 = *(void *)(a1 + 48);
        CGRect v44 = [*(id *)(a1 + 72) objectForKey:v43];
        CGRect v45 = [*(id *)(a1 + 80) labels];
        __int16 v46 = [v45 firstObject];
        [v46 confidence];
        int v53 = 138413058;
        uint64_t v54 = v43;
        __int16 v55 = 2112;
        id v56 = v44;
        __int16 v57 = 2112;
        CGRect v58 = v28;
        __int16 v59 = 2048;
        double v60 = v47;
        _os_log_debug_impl(&dword_23F0D7000, v29, OS_LOG_TYPE_DEBUG, "New most confident result: %@ Hz left %@ -> %@, confidence %f", (uint8_t *)&v53, 0x2Au);
      }
      [*(id *)(a1 + 72) setObject:v28 forKey:*(void *)(a1 + 48)];
      [*(id *)(a1 + 88) addObject:*(void *)(a1 + 48)];
      char v31 = *(void **)(a1 + 40);
    }
    else
    {
      id v32 = [v6 identifier];
      id v33 = [*(id *)(a1 + 32) modelLabelRightEarSymbol];
      int v34 = [v32 isEqualToString:v33];

      if (!v34) {
        goto LABEL_20;
      }
      id v35 = [*(id *)(a1 + 96) objectForKey:*(void *)(a1 + 48)];
      [v35 floatValue];
      float v37 = v36;

      if (v37 != 0.0 && v8 <= v37) {
        goto LABEL_20;
      }
      id v38 = objc_msgSend(*(id *)(a1 + 56), "hearingLevelAtPoint:", *(double *)(a1 + 112), *(double *)(a1 + 120));
      [v38 doubleValue];
      double v40 = v39;

      id v28 = [getHKQuantityClass_0() quantityWithUnit:*(void *)(a1 + 64) doubleValue:v40];
      id v41 = AXLogAudiogram();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v48 = *(void *)(a1 + 48);
        id v49 = [*(id *)(a1 + 104) objectForKey:v48];
        uint64_t v50 = [*(id *)(a1 + 80) labels];
        CGPoint v51 = [v50 firstObject];
        [v51 confidence];
        int v53 = 138413058;
        uint64_t v54 = v48;
        __int16 v55 = 2112;
        id v56 = v49;
        __int16 v57 = 2112;
        CGRect v58 = v28;
        __int16 v59 = 2048;
        double v60 = v52;
        _os_log_debug_impl(&dword_23F0D7000, v41, OS_LOG_TYPE_DEBUG, "New most confident result: %@ Hz right %@ -> %@, confidence %f", (uint8_t *)&v53, 0x2Au);
      }
      [*(id *)(a1 + 104) setObject:v28 forKey:*(void *)(a1 + 48)];
      [*(id *)(a1 + 88) addObject:*(void *)(a1 + 48)];
      char v31 = *(void **)(a1 + 96);
    }
    *(float *)&double v30 = v8;
    double v42 = [NSNumber numberWithFloat:v30];
    [v31 setObject:v42 forKey:*(void *)(a1 + 48)];

    goto LABEL_20;
  }
  id v10 = AXLogAudiogram();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_250_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

  *a4 = 1;
LABEL_20:
}

void __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_253(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 objectForKey:v4];
  id v6 = [*(id *)(a1 + 40) objectForKey:v4];
  id HKQuantityClass_0 = getHKQuantityClass_0();
  uint64_t v8 = *(void *)(a1 + 48);
  [v4 doubleValue];
  double v10 = v9;

  uint64_t v11 = [HKQuantityClass_0 quantityWithUnit:v8 doubleValue:v10];
  id v15 = 0;
  uint64_t v12 = [getHKAudiogramSensitivityPointClass() sensitivityPointWithFrequency:v11 leftEarSensitivity:v5 rightEarSensitivity:v6 error:&v15];
  id v13 = v15;
  if (v13)
  {
    uint64_t v14 = AXLogAudiogram();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_253_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 56) addObject:v12];
  }
}

- (id)_combineAudiograms:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4 == 1)
  {
    uint64_t v8 = AXLogAudiogram();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_23F0D7000, v8, OS_LOG_TYPE_INFO, "Only one audiogram. No need to combine", buf, 2u);
    }

    float v7 = [v3 firstObject];
  }
  else
  {
    int v5 = v4;
    if (v4)
    {
      double v9 = AXLogAudiogram();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109120;
        int v37 = v5;
        _os_log_impl(&dword_23F0D7000, v9, OS_LOG_TYPE_INFO, "%i audiograms to combine", buf, 8u);
      }

      double v10 = objc_opt_new();
      uint64_t v11 = objc_opt_new();
      uint64_t v12 = objc_opt_new();
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __49__AIAudiogramIngestionEngine__combineAudiograms___block_invoke;
      v31[3] = &unk_265058CA8;
      id v13 = v10;
      id v32 = v13;
      id v14 = v11;
      id v33 = v14;
      id v15 = v12;
      id v34 = v15;
      [v3 enumerateObjectsUsingBlock:v31];
      uint64_t v16 = [MEMORY[0x263F08B30] sortDescriptorWithKey:&stru_26F2D3B98 ascending:1];
      id v35 = v16;
      uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
      [v13 sortUsingDescriptors:v17];

      id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __49__AIAudiogramIngestionEngine__combineAudiograms___block_invoke_259;
      v27[3] = &unk_265058CD0;
      id v19 = v14;
      id v28 = v19;
      id v20 = v15;
      id v29 = v20;
      id v21 = v18;
      id v30 = v21;
      [v13 enumerateObjectsUsingBlock:v27];
      if ([v21 count])
      {
        id HKAudiogramSampleClass = getHKAudiogramSampleClass();
        float v23 = [MEMORY[0x263EFF910] date];
        id v24 = [MEMORY[0x263EFF910] date];
        uint64_t v25 = metadataForHKAudiogramSample();
        float v7 = [HKAudiogramSampleClass audiogramSampleWithSensitivityPoints:v21 startDate:v23 endDate:v24 metadata:v25];
      }
      else
      {
        float v7 = 0;
      }
    }
    else
    {
      id v6 = AXLogAudiogram();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_23F0D7000, v6, OS_LOG_TYPE_INFO, "No audiogram to combine", buf, 2u);
      }

      float v7 = 0;
    }
  }

  return v7;
}

void __49__AIAudiogramIngestionEngine__combineAudiograms___block_invoke(id *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = AXLogAudiogram();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_23F0D7000, v4, OS_LOG_TYPE_INFO, "Combining audiogram %@", buf, 0xCu);
  }

  int v5 = [v3 sensitivityPoints];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__AIAudiogramIngestionEngine__combineAudiograms___block_invoke_256;
  v6[3] = &unk_265058C80;
  id v7 = a1[4];
  id v8 = a1[5];
  id v9 = a1[6];
  [v5 enumerateObjectsUsingBlock:v6];
}

void __49__AIAudiogramIngestionEngine__combineAudiograms___block_invoke_256(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  int v5 = [v3 frequency];
  [v4 addObject:v5];

  id v6 = [v3 leftEarSensitivity];

  if (v6)
  {
    id v7 = (void *)a1[5];
    id v8 = [v3 leftEarSensitivity];
    id v9 = [v3 frequency];
    [v7 setObject:v8 forKey:v9];
  }
  double v10 = [v3 rightEarSensitivity];

  if (v10)
  {
    id v11 = (void *)a1[6];
    uint64_t v12 = [v3 rightEarSensitivity];
    id v13 = [v3 frequency];
    [v11 setObject:v12 forKey:v13];
  }
  id v14 = AXLogAudiogram();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = a1[4];
    int v20 = 138412290;
    uint64_t v21 = v15;
    _os_log_impl(&dword_23F0D7000, v14, OS_LOG_TYPE_INFO, "Frequencies: %@", (uint8_t *)&v20, 0xCu);
  }

  uint64_t v16 = AXLogAudiogram();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = a1[5];
    int v20 = 138412290;
    uint64_t v21 = v17;
    _os_log_impl(&dword_23F0D7000, v16, OS_LOG_TYPE_INFO, "leftEarSensitivities: %@", (uint8_t *)&v20, 0xCu);
  }

  id v18 = AXLogAudiogram();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = a1[6];
    int v20 = 138412290;
    uint64_t v21 = v19;
    _os_log_impl(&dword_23F0D7000, v18, OS_LOG_TYPE_INFO, "rightEarSensitivities: %@", (uint8_t *)&v20, 0xCu);
  }
}

void __49__AIAudiogramIngestionEngine__combineAudiograms___block_invoke_259(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 objectForKey:v4];
  id v6 = [*(id *)(a1 + 40) objectForKey:v4];
  id v10 = 0;
  id v7 = [getHKAudiogramSensitivityPointClass() sensitivityPointWithFrequency:v4 leftEarSensitivity:v5 rightEarSensitivity:v6 error:&v10];

  id v8 = v10;
  if (v8)
  {
    id v9 = AXLogAudiogram();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_253_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 48) addObject:v7];
  }
}

- (id)_audiogramFromImagesV2:(id)a3
{
  id v4 = a3;
  [(AIAudiogramIngestionEngine *)self setFailureMode:0];
  int v5 = [(AIAudiogramIngestionEngine *)self audiogramPointsFromImages:v4];

  id v6 = [(AIAudiogramIngestionEngine *)self _audiogramFromAudiogramPoints:v5];

  return v6;
}

- (id)audiogramPointsFromImages:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    int v5 = objc_opt_new();
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    id v13 = __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke;
    id v14 = &unk_265058BE0;
    uint64_t v15 = self;
    id v6 = v5;
    id v16 = v6;
    [v4 enumerateObjectsUsingBlock:&v11];
    if (!objc_msgSend(v6, "count", v11, v12, v13, v14, v15))
    {
      id v7 = AXLogAudiogram();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[AIAudiogramIngestionEngine audiogramPointsFromImages:]();
      }
    }
    id v8 = v16;
    id v9 = v6;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = AXLogAudiogram();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_23F0D7000, v4, OS_LOG_TYPE_DEFAULT, "v2: Starting next image!", buf, 2u);
  }

  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_propertyOrientationFromOrientation:", objc_msgSend(v3, "imageOrientation"));
  id v6 = objc_alloc(MEMORY[0x263F00650]);
  id v7 = v3;
  id v8 = objc_msgSend(v6, "initWithCGImage:options:", objc_msgSend(v7, "CGImage"), 0);
  id v9 = [v8 imageByApplyingCGOrientation:v5];

  id v10 = AXLogAudiogram();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [v7 imageOrientation];
    *(_DWORD *)long long buf = 134218240;
    uint64_t v21 = v11;
    __int16 v22 = 1024;
    int v23 = v5;
    _os_log_impl(&dword_23F0D7000, v10, OS_LOG_TYPE_INFO, "v2: Orienting image %ld -> %d", buf, 0x12u);
  }

  uint64_t v12 = [*(id *)(a1 + 32) audiogramDetectorResultsFromImage:v7];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke_261;
  v16[3] = &unk_265058D20;
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = *(void **)(a1 + 40);
  id v17 = v9;
  uint64_t v18 = v13;
  id v19 = v14;
  id v15 = v9;
  [v12 enumerateObjectsUsingBlock:v16];
}

void __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke_261(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 graph];
  [a1[4] extent];
  objc_msgSend(v4, "scaledBoxWithSize:", v5, v6);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  uint64_t v89 = 0;
  CGRect v90 = (CGRect *)&v89;
  uint64_t v91 = 0x4010000000;
  CGRect v92 = "";
  id v15 = (double *)MEMORY[0x263F001A8];
  long long v16 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v93 = *MEMORY[0x263F001A8];
  long long v94 = v16;
  id v17 = [v3 symbols];
  v88[0] = MEMORY[0x263EF8330];
  v88[1] = 3221225472;
  v88[2] = __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke_2;
  v88[3] = &unk_265058CF8;
  *(double *)&void v88[5] = v8;
  *(double *)&v88[6] = v10;
  *(double *)&v88[7] = v12;
  *(double *)&v88[8] = v14;
  v88[4] = &v89;
  [v17 enumerateObjectsUsingBlock:v88];

  uint64_t v18 = objc_opt_new();
  objc_msgSend(a1[5], "_adjustedRectForVisionCoordinateSpace:inImage:", a1[4], v8, v10, v12, v14);
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  objc_msgSend(a1[5], "_adjustedRectForVisionCoordinateSpace:inImage:", a1[4], v90[1].origin.x, v90[1].origin.y, v90[1].size.width, v90[1].size.height);
  p_CGFloat x = (void *)&v90->origin.x;
  v90[1].origin.CGFloat x = v28;
  p_x[5] = v29;
  p_x[6] = v30;
  p_x[7] = v31;
  v95.origin.CGFloat x = v20;
  v95.origin.CGFloat y = v22;
  v95.size.double width = v24;
  v95.size.CGFloat height = v26;
  double Width = CGRectGetWidth(v95);
  v96.origin.CGFloat x = v20;
  v96.origin.CGFloat y = v22;
  v96.size.double width = v24;
  v96.size.CGFloat height = v26;
  CGFloat v33 = CGRectGetHeight(v96) * -0.05;
  v97.origin.CGFloat x = v20;
  v97.origin.CGFloat y = v22;
  v97.size.double width = v24;
  v97.size.CGFloat height = v26;
  CGRect v98 = CGRectInset(v97, Width * -0.05, v33);
  CGFloat x = v98.origin.x;
  CGFloat y = v98.origin.y;
  CGFloat v36 = v98.size.width;
  CGFloat height = v98.size.height;
  double MinX = CGRectGetMinX(v98);
  v99.origin.CGFloat x = x;
  v99.origin.CGFloat y = y;
  v99.size.double width = v36;
  v99.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v99);
  [a1[4] extent];
  double v39 = CGRectGetWidth(v100);
  v101.origin.CGFloat x = x;
  v101.origin.CGFloat y = y;
  v101.size.double width = v36;
  v101.size.CGFloat height = height;
  double v40 = CGRectGetWidth(v101);
  [a1[4] extent];
  double v41 = CGRectGetHeight(v102);
  v103.origin.CGFloat x = x;
  v103.origin.CGFloat y = y;
  v103.size.double width = v36;
  v103.size.CGFloat height = height;
  double v42 = CGRectGetHeight(v103);
  uint64_t v43 = v90;
  double v44 = CGRectGetWidth(v90[1]);
  CGFloat v45 = CGRectGetHeight(v90[1]) * 0.1;
  CGRect v104 = CGRectInset(v43[1], v44 * 0.1, v45);
  double v46 = fmax(MinX, 0.0);
  double v47 = fmax(MinY, 0.0);
  double v48 = fmin(v39 - v46, v40);
  v90[1] = v104;
  double v49 = fmin(v41 - v47, v42);
  v104.origin.CGFloat x = v46;
  v104.origin.CGFloat y = v47;
  v104.size.double width = v48;
  v104.size.CGFloat height = v49;
  if (!CGRectIsEmpty(v104) && !CGRectIsEmpty(v90[1]))
  {
    uint64_t v50 = AXLogAudiogram();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_23F0D7000, v50, OS_LOG_TYPE_INFO, "v2: Attempting to crop graph edges for audiogram text", buf, 2u);
    }

    CGPoint v51 = objc_opt_new();
    float v52 = objc_msgSend(a1[5], "_cropEdgesFromImage:graphRect:symbolsRect:", a1[4], v46, v47, v48, v49, v90[1].origin.x, v90[1].origin.y, v90[1].size.width, v90[1].size.height);
    v84[0] = MEMORY[0x263EF8330];
    v84[1] = 3221225472;
    v84[2] = __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke_264;
    v84[3] = &unk_265058B90;
    int8x16_t v82 = *((int8x16_t *)a1 + 2);
    id v53 = (id)v82.i64[0];
    int8x16_t v85 = vextq_s8(v82, v82, 8uLL);
    id v54 = v51;
    id v86 = v54;
    [v52 enumerateObjectsUsingBlock:v84];
    [a1[4] extent];
    v82.i64[0] = CGRectGetWidth(v105);
    [a1[4] extent];
    double v55 = CGRectGetHeight(v106);
    v107.origin.CGFloat x = v46;
    v107.origin.CGFloat y = v47;
    v107.size.double width = v48;
    v107.size.CGFloat height = v49;
    double v56 = CGRectGetMinX(v107);
    v108.origin.CGFloat x = v46;
    v108.origin.CGFloat y = v47;
    v108.size.double width = v48;
    v108.size.CGFloat height = v49;
    double v57 = CGRectGetMinY(v108);
    v109.origin.CGFloat x = v46;
    v109.origin.CGFloat y = v47;
    v109.size.double width = v48;
    v109.size.CGFloat height = v49;
    double v58 = CGRectGetWidth(v109);
    v110.origin.CGFloat x = v46;
    v110.origin.CGFloat y = v47;
    v110.size.double width = v48;
    v110.size.CGFloat height = v49;
    __int16 v59 = objc_msgSend(a1[5], "_textFromAudiogramImage:regionOfInterest:", a1[4], v56 / *(double *)v82.i64, v57 / v55, v58 / *(double *)v82.i64, CGRectGetHeight(v110) / v55);
    [v54 addObjectsFromArray:v59];
    id v60 = a1[5];
    uint64_t v61 = [v3 symbols];
    CGRect v62 = [v3 graph];
    [v62 box];
    uint64_t v63 = objc_msgSend(v60, "_audiogramPointsFromSymbolsV2:inGraphRect:recognizedText:", v61, v54);

    uint64_t v18 = (void *)v63;
  }
  if (![v18 count])
  {
    v111.origin.CGFloat x = v46;
    v111.origin.CGFloat y = v47;
    v111.size.double width = v48;
    v111.size.CGFloat height = v49;
    if (!CGRectIsEmpty(v111))
    {
      CGRect v64 = AXLogAudiogram();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_23F0D7000, v64, OS_LOG_TYPE_INFO, "v2: Attempting to crop graph for audiogram text", buf, 2u);
      }

      [a1[4] extent];
      double v83 = CGRectGetWidth(v112);
      [a1[4] extent];
      double v65 = CGRectGetHeight(v113);
      v114.origin.CGFloat x = v46;
      v114.origin.CGFloat y = v47;
      v114.size.double width = v48;
      v114.size.CGFloat height = v49;
      double v66 = CGRectGetMinX(v114);
      v115.origin.CGFloat x = v46;
      v115.origin.CGFloat y = v47;
      v115.size.double width = v48;
      v115.size.CGFloat height = v49;
      double v67 = CGRectGetMinY(v115);
      v116.origin.CGFloat x = v46;
      v116.origin.CGFloat y = v47;
      v116.size.double width = v48;
      v116.size.CGFloat height = v49;
      double v68 = CGRectGetWidth(v116);
      v117.origin.CGFloat x = v46;
      v117.origin.CGFloat y = v47;
      v117.size.double width = v48;
      v117.size.CGFloat height = v49;
      CGFloat v69 = objc_msgSend(a1[5], "_textFromAudiogramImage:regionOfInterest:", a1[4], v66 / v83, v67 / v65, v68 / v83, CGRectGetHeight(v117) / v65);
      id v70 = a1[5];
      CGFloat v71 = [v3 symbols];
      CGFloat v72 = [v3 graph];
      [v72 box];
      uint64_t v73 = objc_msgSend(v70, "_audiogramPointsFromSymbolsV2:inGraphRect:recognizedText:", v71, v69);

      uint64_t v18 = (void *)v73;
    }
  }
  if (![v18 count])
  {
    double v74 = AXLogAudiogram();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_23F0D7000, v74, OS_LOG_TYPE_INFO, "v2: Attempting find audiogram text without cropping", buf, 2u);
    }

    double v75 = objc_msgSend(a1[5], "_textFromAudiogramImage:regionOfInterest:", a1[4], *v15, v15[1], v15[2], v15[3]);
    id v76 = a1[5];
    id v77 = [v3 symbols];
    uint64_t v78 = [v3 graph];
    [v78 box];
    uint64_t v79 = objc_msgSend(v76, "_audiogramPointsFromSymbolsV2:inGraphRect:recognizedText:", v77, v75);

    uint64_t v18 = (void *)v79;
  }
  if ([v18 count])
  {
    [a1[6] addObjectsFromArray:v18];
  }
  else
  {
    CGRect v80 = AXLogAudiogram();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
      __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke_261_cold_1();
    }
  }
  _Block_object_dispose(&v89, 8);
}

void __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  objc_msgSend(a2, "scaledBoxWithSize:offset:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 40), *(double *)(a1 + 48));
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  if (a3)
  {
    *(CGRect *)&uint64_t v5 = CGRectUnion(*(CGRect *)(v13 + 32), *(CGRect *)&v6);
    uint64_t v8 = v14;
    uint64_t v10 = v15;
    uint64_t v12 = v16;
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(void *)(v13 + 32) = v5;
  *(void *)(v13 + 40) = v8;
  *(void *)(v13 + 48) = v10;
  *(void *)(v13 + 56) = v12;
}

void __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke_264(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [a2 CGRectValue];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "_textFromAudiogramImage:regionOfInterest:", *(void *)(a1 + 40));
  [*(id *)(a1 + 48) addObjectsFromArray:v3];
  id v4 = AXLogAudiogram();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_23F0D7000, v4, OS_LOG_TYPE_INFO, "v2: Found text from edge crop: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (id)audiogramDetectorResultsFromImage:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = objc_opt_new();
  uint64_t v6 = -[AIAudiogramIngestionEngine _propertyOrientationFromOrientation:](self, "_propertyOrientationFromOrientation:", [v4 imageOrientation]);
  uint64_t v7 = [(AIAudiogramIngestionEngine *)self graphModel];
  id v8 = v4;
  uint64_t v9 = objc_msgSend(v7, "getGraphDetectorResult:orientation:", objc_msgSend(v8, "CGImage"), v6);

  uint64_t v10 = AXLogAudiogram();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    uint64_t v25 = [v9 count];
    __int16 v26 = 2112;
    double v27 = v9;
    _os_log_impl(&dword_23F0D7000, v10, OS_LOG_TYPE_DEFAULT, "Found %lu graphs for audiogram image: %@", buf, 0x16u);
  }

  if (![v9 count])
  {
    [(AIAudiogramIngestionEngine *)self setFailureMode:1];
    uint64_t v11 = AXLogAudiogram();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_23F0D7000, v11, OS_LOG_TYPE_INFO, "Adding full-size pseudo-graph to proceed with symbol detection", buf, 2u);
    }

    uint64_t v12 = +[AudiogramGraphDetectorResult defaultResult];
    double v23 = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];

    uint64_t v9 = (void *)v13;
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __64__AIAudiogramIngestionEngine_audiogramDetectorResultsFromImage___block_invoke;
  v19[3] = &unk_265058D48;
  void v19[4] = self;
  id v20 = v8;
  int v22 = v6;
  id v14 = v5;
  id v21 = v14;
  id v15 = v8;
  [v9 enumerateObjectsUsingBlock:v19];
  uint64_t v16 = v21;
  id v17 = v14;

  return v17;
}

void __64__AIAudiogramIngestionEngine_audiogramDetectorResultsFromImage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) symbolModel];
  uint64_t v7 = objc_msgSend(v6, "getSymbolDetectorResult:orientation:in:", objc_msgSend(*(id *)(a1 + 40), "CGImage"), *(unsigned int *)(a1 + 56), v5);

  if ((unint64_t)[v7 count] <= 3) {
    [*(id *)(a1 + 32) setFailureMode:2];
  }
  id v8 = AXLogAudiogram();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218498;
    uint64_t v12 = [v7 count];
    __int16 v13 = 2048;
    uint64_t v14 = a3;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_23F0D7000, v8, OS_LOG_TYPE_DEFAULT, "Found %lu symbols for audiogram graph %lu: %@", (uint8_t *)&v11, 0x20u);
  }

  uint64_t v9 = *(void **)(a1 + 48);
  uint64_t v10 = [[_TtC18AudiogramIngestion23AudiogramDetectorResult alloc] initWithGraph:v5 symbols:v7];
  [v9 addObject:v10];
}

- (CGRect)_adjustedRectForVisionCoordinateSpace:(CGRect)a3 inImage:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [a4 extent];
  double v8 = CGRectGetHeight(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double v10 = v8 - CGRectGetMaxY(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat v11 = CGRectGetWidth(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double v12 = CGRectGetHeight(v20);
  double v13 = MinX;
  double v14 = v10;
  double v15 = v11;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (id)_audiogramPointsFromSymbolsV2:(id)a3 inGraphRect:(CGRect)a4 recognizedText:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  double v12 = [(AIAudiogramIngestionEngine *)self _audiogramMapFromRecognizedText:a5];
  double v13 = -[AIAudiogramIngestionEngine _audiogramPointsFromSymbolsV2:inGraphRect:onAudiogramMap:](self, "_audiogramPointsFromSymbolsV2:inGraphRect:onAudiogramMap:", v11, v12, x, y, width, height);

  return v13;
}

- (id)_audiogramPointsFromSymbolsV2:(id)a3 inGraphRect:(CGRect)a4 onAudiogramMap:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = [v11 count];
  if (!v12 || !v13)
  {
    if (v12) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = 3;
    }
    [(AIAudiogramIngestionEngine *)self setFailureMode:v19];
    id v20 = 0;
    goto LABEL_20;
  }
  double v14 = [v12 frequencies];
  double v15 = [v14 values];
  if ((unint64_t)[v15 count] <= 3)
  {

    goto LABEL_11;
  }
  CGRect v16 = [v12 hearingLevels];
  CGRect v17 = [v16 values];
  unint64_t v18 = [v17 count];

  if (v18 <= 3) {
LABEL_11:
  }
    [(AIAudiogramIngestionEngine *)self setFailureMode:3];
  id v21 = [v12 hearingLevelSlope];
  [v21 doubleValue];
  if (fabs(v22) < 10.0)
  {
  }
  else
  {
    double v23 = [v12 frequencySlope];
    [v23 doubleValue];
    double v25 = fabs(v24);

    if (v25 <= 0.1) {
      goto LABEL_17;
    }
  }
  [(AIAudiogramIngestionEngine *)self setFailureMode:4];
LABEL_17:
  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v32 = MEMORY[0x263EF8330];
  uint64_t v33 = 3221225472;
  id v34 = __87__AIAudiogramIngestionEngine__audiogramPointsFromSymbolsV2_inGraphRect_onAudiogramMap___block_invoke;
  id v35 = &unk_265058D70;
  CGFloat v38 = x;
  CGFloat v39 = y;
  CGFloat v40 = width;
  CGFloat v41 = height;
  id v36 = v12;
  id v27 = v26;
  id v37 = v27;
  [v11 enumerateObjectsUsingBlock:&v32];
  uint64_t v28 = AXLogAudiogram();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = objc_msgSend(v27, "count", v32, v33, v34, v35, v36);
    *(_DWORD *)long long buf = 134217984;
    uint64_t v43 = v29;
    _os_log_impl(&dword_23F0D7000, v28, OS_LOG_TYPE_DEFAULT, "Found db + frequency values for %lu points", buf, 0xCu);
  }

  uint64_t v30 = v37;
  id v20 = v27;

LABEL_20:
  return v20;
}

void __87__AIAudiogramIngestionEngine__audiogramPointsFromSymbolsV2_inGraphRect_onAudiogramMap___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_msgSend(v3, "scaledBoxWithSize:offset:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 48), *(double *)(a1 + 56));
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = v4 + v8 * 0.5;
  double v13 = 1.0 - (v6 + v10 * 0.5);
  double v14 = AXLogAudiogram();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    double v15 = [v3 labelName];
    v38.CGFloat x = v12;
    v38.CGFloat y = v13;
    CGRect v16 = NSStringFromCGPoint(v38);
    v39.origin.CGFloat x = v5;
    v39.origin.CGFloat y = v7;
    v39.size.CGFloat width = v9;
    v39.size.CGFloat height = v11;
    CGRect v17 = NSStringFromCGRect(v39);
    int v31 = 138412802;
    uint64_t v32 = v15;
    __int16 v33 = 2112;
    id v34 = v16;
    __int16 v35 = 2112;
    id v36 = v17;
    _os_log_impl(&dword_23F0D7000, v14, OS_LOG_TYPE_INFO, "Got %@ center %@ from box %@", (uint8_t *)&v31, 0x20u);
  }
  unint64_t v18 = objc_msgSend(*(id *)(a1 + 32), "frequencyAtPoint:", v12, v13);
  if ([(id)AIAudiogramValidFrequencies containsObject:v18])
  {
    uint64_t v19 = objc_msgSend(*(id *)(a1 + 32), "hearingLevelAtPoint:", v12, v13);
    [v19 doubleValue];
    if (v20 <= 120.0)
    {
      [v19 doubleValue];
      if (v21 >= -20.0)
      {
        [v3 confidence];
        double v23 = v22;
        double v24 = *(void **)(a1 + 40);
        double v25 = [AIAudiogramPoint alloc];
        id v26 = [v3 labelName];
        [v18 doubleValue];
        double v28 = v27;
        [v19 doubleValue];
        uint64_t v30 = [(AIAudiogramPoint *)v25 initWithSymbolName:v26 frequency:v28 dbValue:v29 confidence:v23];
        [v24 addObject:v30];
      }
    }
  }
}

- (id)_audiogramFromAudiogramPoints:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  double v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v37 = objc_alloc_init(v4);
  CGPoint v38 = [getHKUnitClass_1() hertzUnit];
  double v6 = [getHKUnitClass_1() decibelHearingLevelUnit];
  CGFloat v7 = objc_opt_new();
  double v8 = objc_opt_new();
  CGFloat v9 = objc_opt_new();
  double v10 = objc_opt_new();
  CGFloat v11 = objc_opt_new();
  double v12 = objc_opt_new();
  double v13 = objc_opt_new();
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __60__AIAudiogramIngestionEngine__audiogramFromAudiogramPoints___block_invoke;
  v46[3] = &unk_265058D98;
  v46[4] = self;
  id v14 = v10;
  id v47 = v14;
  id v36 = v6;
  id v48 = v36;
  id v15 = v8;
  id v49 = v15;
  id v16 = v7;
  id v50 = v16;
  id v17 = v12;
  id v51 = v17;
  id v18 = v11;
  id v52 = v18;
  id v19 = v9;
  id v53 = v19;
  id v20 = v13;
  id v54 = v20;
  [v5 enumerateObjectsUsingBlock:v46];

  double v21 = AXLogAudiogram();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v57 = (uint64_t)v15;
    _os_log_impl(&dword_23F0D7000, v21, OS_LOG_TYPE_INFO, "Unsorted results (left): %@", buf, 0xCu);
  }

  double v22 = AXLogAudiogram();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v57 = (uint64_t)v19;
    _os_log_impl(&dword_23F0D7000, v22, OS_LOG_TYPE_INFO, "Unsorted results (right): %@", buf, 0xCu);
  }

  double v23 = [MEMORY[0x263F08B30] sortDescriptorWithKey:&stru_26F2D3B98 ascending:1];
  double v55 = v23;
  double v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
  [v16 sortUsingDescriptors:v24];

  double v25 = AXLogAudiogram();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v57 = (uint64_t)v16;
    _os_log_impl(&dword_23F0D7000, v25, OS_LOG_TYPE_INFO, "Sorted frequencies: %@", buf, 0xCu);
  }

  if ([v16 containsObject:&unk_26F2DB1D8])
  {
    id v26 = v37;
    if ([v16 containsObject:&unk_26F2DB1F0]
      && [v16 containsObject:&unk_26F2DB208]
      && [v16 containsObject:&unk_26F2DB220])
    {
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __60__AIAudiogramIngestionEngine__audiogramFromAudiogramPoints___block_invoke_279;
      v39[3] = &unk_265058DC0;
      id v40 = v15;
      id v41 = v19;
      id v42 = v38;
      id v43 = v17;
      id v44 = v20;
      id v27 = v37;
      id v45 = v27;
      [v16 enumerateObjectsUsingBlock:v39];
      if ([v27 count])
      {
        double v28 = AXLogAudiogram();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = [v27 count];
          *(_DWORD *)long long buf = 134217984;
          uint64_t v57 = v29;
          _os_log_impl(&dword_23F0D7000, v28, OS_LOG_TYPE_DEFAULT, "Writing %lu points to new audiogram sample", buf, 0xCu);
        }

        id HKAudiogramSampleClass = getHKAudiogramSampleClass();
        __int16 v35 = [MEMORY[0x263EFF910] date];
        __int16 v33 = [MEMORY[0x263EFF910] date];
        uint64_t v30 = metadataForHKAudiogramSample();
        int v31 = [HKAudiogramSampleClass audiogramSampleWithSensitivityPoints:v27 startDate:v35 endDate:v33 metadata:v30];
      }
      else
      {
        int v31 = 0;
      }
    }
    else
    {
      int v31 = 0;
    }
  }
  else
  {
    int v31 = 0;
    id v26 = v37;
  }

  return v31;
}

void __60__AIAudiogramIngestionEngine__audiogramFromAudiogramPoints___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a2;
  double v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = [*(id *)(a1 + 32) leftEarAirConductionUnmaskedSymbol];
  double v6 = [*(id *)(a1 + 32) leftEarAirConductionMaskedSymbol];
  CGFloat v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, 0);

  double v8 = (void *)MEMORY[0x263EFFA08];
  CGFloat v9 = [*(id *)(a1 + 32) rightEarAirConductionUnmaskedSymbol];
  double v10 = [*(id *)(a1 + 32) rightEarAirConductionMaskedSymbol];
  CGFloat v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, 0);

  double v12 = [v3 symbolName];
  if ([v7 containsObject:v12])
  {

    goto LABEL_4;
  }
  double v13 = [v3 symbolName];
  int v14 = [v11 containsObject:v13];

  if (v14)
  {
LABEL_4:
    id v15 = NSNumber;
    [v3 frequency];
    id v16 = objc_msgSend(v15, "numberWithDouble:");
    [v3 dbValue];
    double v18 = v17;
    [v3 confidence];
    double v20 = v19;
    double v21 = [v3 symbolName];
    int v22 = [v7 containsObject:v21];

    if (v22)
    {
      double v23 = [*(id *)(a1 + 40) objectForKey:v16];
      [v23 doubleValue];
      double v25 = v24;

      if (v25 != 0.0 && v20 <= v25) {
        goto LABEL_17;
      }
      id v26 = [getHKQuantityClass_0() quantityWithUnit:*(void *)(a1 + 48) doubleValue:v18];
      id v27 = AXLogAudiogram();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        id v45 = [*(id *)(a1 + 56) objectForKey:v16];
        *(_DWORD *)long long buf = 138413058;
        id v48 = v16;
        __int16 v49 = 2112;
        id v50 = v45;
        __int16 v51 = 2112;
        id v52 = v26;
        __int16 v53 = 2048;
        double v54 = v20;
        _os_log_debug_impl(&dword_23F0D7000, v27, OS_LOG_TYPE_DEBUG, "New most confident result: %@ Hz left %@ -> %@, confidence %f", buf, 0x2Au);
      }
      [*(id *)(a1 + 56) setObject:v26 forKey:v16];
      [*(id *)(a1 + 64) addObject:v16];
      double v28 = *(void **)(a1 + 40);
      uint64_t v29 = [NSNumber numberWithDouble:v20];
      [v28 setObject:v29 forKey:v16];

      uint64_t v30 = [v3 symbolName];
      int v31 = [*(id *)(a1 + 32) leftEarAirConductionMaskedSymbol];
      uint64_t v32 = [v30 isEqualToString:v31];

      __int16 v33 = *(void **)(a1 + 72);
    }
    else
    {
      id v34 = [v3 symbolName];
      int v35 = [v11 containsObject:v34];

      if (!v35) {
        goto LABEL_17;
      }
      id v36 = [*(id *)(a1 + 80) objectForKey:v16];
      [v36 doubleValue];
      double v38 = v37;

      if (v38 != 0.0 && v20 <= v38) {
        goto LABEL_17;
      }
      id v26 = [getHKQuantityClass_0() quantityWithUnit:*(void *)(a1 + 48) doubleValue:v18];
      CGRect v39 = AXLogAudiogram();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        double v46 = [*(id *)(a1 + 88) objectForKey:v16];
        *(_DWORD *)long long buf = 138413058;
        id v48 = v16;
        __int16 v49 = 2112;
        id v50 = v46;
        __int16 v51 = 2112;
        id v52 = v26;
        __int16 v53 = 2048;
        double v54 = v20;
        _os_log_debug_impl(&dword_23F0D7000, v39, OS_LOG_TYPE_DEBUG, "New most confident result: %@ Hz right %@ -> %@, confidence %f", buf, 0x2Au);
      }
      [*(id *)(a1 + 88) setObject:v26 forKey:v16];
      [*(id *)(a1 + 64) addObject:v16];
      id v40 = *(void **)(a1 + 80);
      id v41 = [NSNumber numberWithDouble:v20];
      [v40 setObject:v41 forKey:v16];

      id v42 = [v3 symbolName];
      id v43 = [*(id *)(a1 + 32) rightEarAirConductionMaskedSymbol];
      uint64_t v32 = [v42 isEqualToString:v43];

      __int16 v33 = *(void **)(a1 + 96);
    }
    id v44 = [NSNumber numberWithBool:v32];
    [v33 setObject:v44 forKey:v16];

LABEL_17:
  }
}

void __60__AIAudiogramIngestionEngine__audiogramFromAudiogramPoints___block_invoke_279(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKey:v4];
  double v6 = [*(id *)(a1 + 40) objectForKey:v4];
  id HKQuantityClass_0 = getHKQuantityClass_0();
  uint64_t v8 = *(void *)(a1 + 48);
  [v4 doubleValue];
  CGFloat v9 = objc_msgSend(HKQuantityClass_0, "quantityWithUnit:doubleValue:", v8);
  double v10 = [*(id *)(a1 + 56) objectForKey:v4];
  uint64_t v11 = [v10 BOOLValue];

  double v12 = [*(id *)(a1 + 64) objectForKey:v4];

  uint64_t v13 = [v12 BOOLValue];
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v22 = v14;
  if (!v5)
  {
    id v24 = 0;
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v32 = 0;
  double v23 = objc_msgSend(objc_alloc((Class)getHKAudiogramSensitivityTestClass_0((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21)), "initWithSensitivity:type:masked:side:clampingRange:error:", v5, 0, v11, 0, 0, &v32);
  id v24 = v32;
  [v22 addObject:v23];

  if (v6)
  {
LABEL_3:
    id v31 = v24;
    double v25 = objc_msgSend(objc_alloc((Class)getHKAudiogramSensitivityTestClass_0((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21)), "initWithSensitivity:type:masked:side:clampingRange:error:", v6, 0, v13, 1, 0, &v31);
    id v26 = v31;

    [v22 addObject:v25];
    id v24 = v26;
  }
LABEL_4:
  id v30 = v24;
  id v27 = [getHKAudiogramSensitivityPointClass() sensitivityPointWithFrequency:v9 tests:v22 error:&v30];
  id v28 = v30;

  if (v28 || !v27)
  {
    uint64_t v29 = AXLogAudiogram();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_253_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 72) addObject:v27];
  }
}

- (void)_setAudiogramAxisError:(unint64_t)a3 onError:(id *)a4
{
  v11[2] = *MEMORY[0x263EF8340];
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown error: %d", a4, a3);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = off_265058EE8[a3];
    if (a4)
    {
      double v6 = (void *)MEMORY[0x263F087E8];
      v10[0] = *MEMORY[0x263F08320];
      v10[1] = @"AIAudiogramAxisErrorKey";
      v11[0] = v5;
      CGFloat v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      v11[1] = v7;
      uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
      *a4 = [v6 errorWithDomain:@"AudiogramIngestion" code:0 userInfo:v8];
    }
    else
    {
      CGFloat v9 = AXLogAudiogram();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AIAudiogramIngestionEngine _setAudiogramAxisError:onError:]();
      }
    }
  }
}

- (id)_sortAndRemoveInvalidAxisValues:(id)a3 forAxis:(unint64_t)a4 error:(id *)a5
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [v6 count];
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke;
  v71[3] = &__block_descriptor_40_e47_q24__0__AIRecognizedText_8__AIRecognizedText_16l;
  v71[4] = a4;
  uint64_t v8 = [v6 sortedArrayUsingComparator:v71];

  CGFloat v9 = AXLogAudiogram();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AIAudiogramIngestionEngine _sortAndRemoveInvalidAxisValues:forAxis:error:].cold.4();
  }

  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_299;
  v68[3] = &unk_265058E08;
  int v70 = v7;
  id v69 = v8;
  double v10 = objc_msgSend(v8, "ax_filteredArrayUsingBlock:", v68);
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_2;
  v67[3] = &__block_descriptor_40_e33_B32__0__AIRecognizedText_8Q16_B24l;
  v67[4] = a4;
  uint64_t v11 = objc_msgSend(v10, "ax_filteredArrayUsingBlock:", v67);

  double v12 = AXLogAudiogram();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[AIAudiogramIngestionEngine _sortAndRemoveInvalidAxisValues:forAxis:error:]();
  }

  if ((unint64_t)[v11 count] > 2)
  {
    id v14 = [(AIAudiogramIngestionEngine *)self _valueDifferencesForValues:v11 stepDistance:a4 forAxis:0.1];
    uint64_t v15 = AXLogAudiogram();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[AIAudiogramIngestionEngine _sortAndRemoveInvalidAxisValues:forAxis:error:]();
    }

    uint64_t v64 = 0;
    v65[0] = &v64;
    v65[1] = 0x3032000000;
    v65[2] = __Block_byref_object_copy__2;
    v65[3] = __Block_byref_object_dispose__2;
    id v66 = 0;
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_301;
    v60[3] = &unk_265058E78;
    id v16 = v14;
    CGRect v62 = &v64;
    uint64_t v63 = 0x3FC999999999999ALL;
    id v61 = v16;
    [v16 enumerateObjectsUsingBlock:v60];
    double v54 = v16;
    uint64_t v17 = AXLogAudiogram();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[AIAudiogramIngestionEngine _sortAndRemoveInvalidAxisValues:forAxis:error:]((uint64_t)v65, v17, v18, v19, v20, v21, v22, v23);
    }

    [(AIAudiogramIngestionEngine *)self _meanFromNumbers:*(void *)(v65[0] + 40)];
    double v25 = v24;
    if ((a4 != 1 || v24 >= 0.0) && (a4 || v24 >= 1.0))
    {
      id v27 = 0;
      int v28 = 4;
      do
      {
        uint64_t v29 = -[AIAudiogramIngestionEngine _validMapForPointPairs:stepDistance:forValueDifference:forAxis:](self, "_validMapForPointPairs:stepDistance:forValueDifference:forAxis:", v11, a4, 0.1, v25, v54);
        id v30 = AXLogAudiogram();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)uint64_t v73 = v11;
          _os_log_impl(&dword_23F0D7000, v30, OS_LOG_TYPE_INFO, "Pre-clean values: %@", buf, 0xCu);
        }

        id v31 = AXLogAudiogram();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)uint64_t v73 = v29;
          _os_log_impl(&dword_23F0D7000, v31, OS_LOG_TYPE_INFO, "Pre-clean valid point map: %@", buf, 0xCu);
        }

        id v32 = [(AIAudiogramIngestionEngine *)self _validPointsFromMap:v29 forValues:v11];

        __int16 v33 = [(AIAudiogramIngestionEngine *)self _validMapForPointPairs:v32 stepDistance:a4 forValueDifference:0.1 forAxis:v25];

        id v34 = AXLogAudiogram();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)uint64_t v73 = v32;
          _os_log_impl(&dword_23F0D7000, v34, OS_LOG_TYPE_INFO, "Post-clean values: %@", buf, 0xCu);
        }

        int v35 = AXLogAudiogram();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)uint64_t v73 = v33;
          _os_log_impl(&dword_23F0D7000, v35, OS_LOG_TYPE_INFO, "Post-clean valid point map: %@", buf, 0xCu);
        }

        int v36 = [v29 isEqualToArray:v33];
        if (v28) {
          int v37 = v36;
        }
        else {
          int v37 = 1;
        }
        --v28;
        uint64_t v11 = v32;
        id v27 = v33;
      }
      while (v37 != 1);
      if (objc_msgSend(v33, "ax_containsObjectUsingBlock:", &__block_literal_global_306))
      {
        double v38 = AXLogAudiogram();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_23F0D7000, v38, OS_LOG_TYPE_INFO, "Could not validate all values after multiple tries. Group is not valid, searching for largest valid section..", buf, 2u);
        }

        unint64_t v39 = 0;
        int v40 = -1;
        int v41 = -1;
        int v42 = -1;
        int v43 = -1;
        while ([v33 count] > v39)
        {
          id v44 = [v33 objectAtIndexedSubscript:v39];
          BOOL v45 = [v44 integerValue] == 1;

          if (v43 - v42 <= v41 - v40) {
            int v46 = v40;
          }
          else {
            int v46 = v42;
          }
          if (v43 - v42 <= v41 - v40) {
            int v47 = v41;
          }
          else {
            int v47 = v43;
          }
          if (v42 == -1) {
            int v48 = v39;
          }
          else {
            int v48 = v42;
          }
          if (v45)
          {
            int v42 = v48;
          }
          else
          {
            int v40 = v46;
            int v41 = v47;
            int v42 = -1;
          }
          if (v45) {
            int v43 = v39;
          }
          else {
            int v43 = -1;
          }
          ++v39;
        }
        if (v43 - v42 <= v41 - v40) {
          int v49 = v40;
        }
        else {
          int v49 = v42;
        }
        if (v43 - v42 <= v41 - v40) {
          int v50 = v41;
        }
        else {
          int v50 = v43;
        }
        __int16 v51 = AXLogAudiogram();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 67109376;
          *(_DWORD *)uint64_t v73 = v49;
          *(_WORD *)&v73[4] = 1024;
          *(_DWORD *)&v73[6] = v50;
          _os_log_impl(&dword_23F0D7000, v51, OS_LOG_TYPE_INFO, "Largest valid section is from %i to %i", buf, 0xEu);
        }

        v57[0] = MEMORY[0x263EF8330];
        v57[1] = 3221225472;
        v57[2] = __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_307;
        v57[3] = &__block_descriptor_40_e33_B32__0__AIRecognizedText_8Q16_B24l;
        int v58 = v49;
        int v59 = v50;
        uint64_t v11 = objc_msgSend(v32, "ax_filteredArrayUsingBlock:", v57);
      }
      else
      {
        uint64_t v11 = v32;
      }
      if ((unint64_t)[v11 count] > 1)
      {
        id v13 = v11;
      }
      else
      {
        id v52 = AXLogAudiogram();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_23F0D7000, v52, OS_LOG_TYPE_INFO, "Could not validate enough values. Group is not valid", buf, 2u);
        }

        [(AIAudiogramIngestionEngine *)self _setAudiogramAxisError:2 onError:a5];
        id v13 = 0;
      }
    }
    else
    {
      id v26 = AXLogAudiogram();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)uint64_t v73 = v11;
        _os_log_impl(&dword_23F0D7000, v26, OS_LOG_TYPE_INFO, "Most frequently occuring value was less than 0 or 1 indicating the set is not increasing and not valid: %@", buf, 0xCu);
      }

      -[AIAudiogramIngestionEngine _setAudiogramAxisError:onError:](self, "_setAudiogramAxisError:onError:", 1, a5, v54);
      id v13 = 0;
    }

    _Block_object_dispose(&v64, 8);
  }
  else
  {
    [(AIAudiogramIngestionEngine *)self _setAudiogramAxisError:0 onError:a5];
    id v13 = 0;
  }

  return v13;
}

BOOL __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  [a2 center];
  double v7 = v6;
  double v9 = v8;
  [v5 center];
  double v11 = v10;
  double v13 = v12;

  if (v4) {
    return v9 < v13;
  }
  else {
    return v7 > v11;
  }
}

BOOL __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_299(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if (*(int *)(a1 + 40) - 1 <= a3)
  {
    BOOL v16 = 1;
  }
  else
  {
    double v6 = [*(id *)(a1 + 32) objectAtIndex:a3 + 1];
    double v7 = [v5 numericalValue];
    double v8 = [v6 numericalValue];
    if ([v7 isEqualToNumber:v8]
      && ([v5 center], double v10 = v9, objc_msgSend(v6, "center"), vabdd_f64(v10, v11) < 0.02))
    {
      [v5 center];
      double v13 = v12;
      [v6 center];
      double v15 = vabdd_f64(v13, v14);

      BOOL v16 = v15 >= 0.02;
    }
    else
    {

      BOOL v16 = 1;
    }
  }
  return v16;
}

uint64_t __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 numericalValue];
  [v3 doubleValue];
  double v5 = v4;

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6 == 1)
  {
    if (v5 >= -20.0 && v5 <= 120.0) {
      return 1;
    }
  }
  else
  {
    if (v6) {
      return 1;
    }
    uint64_t v7 = AIAudiogramValidFrequencies;
    double v8 = [NSNumber numberWithDouble:v5];
    LOBYTE(v7) = [(id)v7 containsObject:v8];

    if (v7) {
      return 1;
    }
  }
  return 0;
}

void __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_301(void *a1, void *a2, uint64_t a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  v20[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  uint64_t v7 = (void *)[v6 mutableCopy];

  double v8 = (void *)a1[4];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  double v14 = __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_2_302;
  double v15 = &unk_265058E50;
  uint64_t v18 = a3;
  id v9 = v5;
  id v16 = v9;
  uint64_t v19 = a1[6];
  id v10 = v7;
  id v17 = v10;
  [v8 enumerateObjectsUsingBlock:&v12];
  unint64_t v11 = objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "count", v12, v13, v14, v15);
  if (v11 < [v10 count]) {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v7);
  }
}

uint64_t __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_2_302(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (*(void *)(a1 + 48) != a3)
  {
    uint64_t v13 = v5;
    [*(id *)(a1 + 32) doubleValue];
    double v8 = v7;
    [v13 doubleValue];
    double v10 = vabdd_f64(v8, v9);
    id v5 = (id)[*(id *)(a1 + 32) doubleValue];
    id v6 = v13;
    if (v10 < v11 * *(double *)(a1 + 56))
    {
      id v5 = (id)[*(id *)(a1 + 40) addObject:v13];
      id v6 = v13;
    }
  }
  return MEMORY[0x270F9A758](v5, v6);
}

BOOL __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_303(uint64_t a1, void *a2)
{
  return [a2 integerValue] == 0;
}

BOOL __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_307(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return *(int *)(a1 + 32) <= a3 && *(int *)(a1 + 36) + 1 >= a3;
}

- (id)_valueDifferencesForValues:(id)a3 stepDistance:(double)a4 forAxis:(unint64_t)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = [v7 count];
  double v9 = objc_opt_new();
  uint64_t v11 = (v8 << 32) - 0x100000000;
  if (v11 >= 1)
  {
    uint64_t v12 = 0;
    uint64_t v13 = HIDWORD(v11);
    if (v13 <= 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v13;
    }
    *(void *)&long long v10 = 138413058;
    long long v36 = v10;
    do
    {
      double v15 = objc_msgSend(v7, "objectAtIndex:", v12, v36);
      id v16 = [v7 objectAtIndex:++v12];
      id v17 = [v16 numericalValue];
      uint64_t v18 = v17;
      if (a5 == 1)
      {
        uint64_t v19 = [v17 integerValue];
        uint64_t v20 = [v15 numericalValue];
        double v21 = (double)(v19 - [v20 integerValue]);

        [v15 center];
        double v23 = v22;
        [v16 center];
        double v25 = v23 - v24;
      }
      else
      {
        [v17 doubleValue];
        double v27 = v26;
        int v28 = [v15 numericalValue];
        [v28 doubleValue];
        double v21 = v27 / v29;

        [v16 center];
        double v31 = v30;
        [v15 center];
        double v25 = v31 - v32;
      }
      __int16 v33 = [NSNumber numberWithDouble:v21 / (v25 / a4)];
      id v34 = AXLogAudiogram();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = v36;
        double v38 = v33;
        __int16 v39 = 2048;
        double v40 = v25;
        __int16 v41 = 2048;
        double v42 = v25 / a4;
        __int16 v43 = 2048;
        double v44 = v21;
        _os_log_debug_impl(&dword_23F0D7000, v34, OS_LOG_TYPE_DEBUG, "Step value difference: %@ distance: %f distance factor: %f original val diff: %f", buf, 0x2Au);
      }

      [v9 addObject:v33];
    }
    while (v14 != v12);
  }

  return v9;
}

- (id)_validMapForPointPairs:(id)a3 stepDistance:(double)a4 forValueDifference:(double)a5 forAxis:(unint64_t)a6
{
  id v10 = a3;
  uint64_t v11 = [v10 count];
  uint64_t v12 = objc_opt_new();
  uint64_t v13 = (v11 << 32) - 0x100000000;
  if (v13 >= 1)
  {
    uint64_t v14 = 0;
    uint64_t v15 = HIDWORD(v13);
    if (v15 <= 1) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = v15;
    }
    do
    {
      id v17 = [v10 objectAtIndex:v14];
      uint64_t v18 = [v10 objectAtIndex:++v14];
      BOOL v19 = [(AIAudiogramIngestionEngine *)self _isValidObject:v17 toObject:v18 withValueDifference:a6 stepDistance:a5 forAxis:a4];
      uint64_t v20 = [NSNumber numberWithBool:v19];
      [v12 addObject:v20];
    }
    while (v16 != v14);
  }

  return v12;
}

- (id)_validPointsFromMap:(id)a3 forValues:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  uint64_t v8 = [v5 count];
  if (v8 << 32 >= 1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = ((v8 << 32) - 0x100000000) >> 32;
    if (v8 <= 1uLL) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v8;
    }
    *(void *)&long long v9 = 138412546;
    long long v26 = v9;
    double v27 = v7;
    do
    {
      uint64_t v13 = objc_msgSend(v5, "objectAtIndex:", v10, v26);
      int v14 = [v13 BOOLValue];

      if (v11 == v10)
      {
        if (v14)
        {
          uint64_t v15 = [v6 objectAtIndex:v11 + 1];
          [v7 addObject:v15];
          uint64_t v16 = AXLogAudiogram();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
            goto LABEL_25;
          }
          id v17 = [v15 numericalValue];
          *(_DWORD *)long long buf = 138412290;
          double v29 = v17;
          _os_log_impl(&dword_23F0D7000, v16, OS_LOG_TYPE_INFO, "pairA valid. Add %@", buf, 0xCu);
LABEL_17:

          goto LABEL_25;
        }
      }
      else
      {
        uint64_t v18 = [v5 objectAtIndex:v10 + 1];
        int v19 = [v18 BOOLValue];

        if (v10)
        {
          if (v19)
          {
            uint64_t v15 = [v6 objectAtIndex:v10 + 1];
            [v7 addObject:v15];
            uint64_t v16 = AXLogAudiogram();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
              goto LABEL_25;
            }
LABEL_23:
            double v22 = [v15 numericalValue];
            *(_DWORD *)long long buf = 138412290;
            double v29 = v22;
            double v23 = v16;
            double v24 = "pairB valid. Add %@";
LABEL_24:
            _os_log_impl(&dword_23F0D7000, v23, OS_LOG_TYPE_INFO, v24, buf, 0xCu);

            id v7 = v27;
            goto LABEL_25;
          }
          if (v14)
          {
            uint64_t v15 = [v6 objectAtIndex:v10 + 1];
            [v7 addObject:v15];
            uint64_t v16 = AXLogAudiogram();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
              goto LABEL_25;
            }
            double v22 = [v15 numericalValue];
            *(_DWORD *)long long buf = 138412290;
            double v29 = v22;
            double v23 = v16;
            double v24 = "pairA valid. Add %@";
            goto LABEL_24;
          }
        }
        else
        {
          if (v14)
          {
            uint64_t v15 = [v6 objectAtIndex:0];
            uint64_t v16 = [v6 objectAtIndex:1];
            [v7 addObject:v15];
            [v7 addObject:v16];
            id v17 = AXLogAudiogram();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              uint64_t v20 = [v15 numericalValue];
              double v21 = [v16 numericalValue];
              *(_DWORD *)long long buf = v26;
              double v29 = v20;
              __int16 v30 = 2112;
              double v31 = v21;
              _os_log_impl(&dword_23F0D7000, v17, OS_LOG_TYPE_INFO, "pairA valid. Add %@, %@", buf, 0x16u);

              id v7 = v27;
            }
            goto LABEL_17;
          }
          if (v19)
          {
            uint64_t v15 = [v6 objectAtIndex:1];
            [v7 addObject:v15];
            uint64_t v16 = AXLogAudiogram();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
              goto LABEL_23;
            }
LABEL_25:
          }
        }
      }
      ++v10;
    }
    while (v12 != v10);
  }

  return v7;
}

- (BOOL)_isValidObject:(id)a3 toObject:(id)a4 withValueDifference:(double)a5 stepDistance:(double)a6 forAxis:(unint64_t)a7
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = v12;
  if (a7 == 1)
  {
    [v11 center];
    double v15 = v14;
    [v13 center];
    double v17 = v15 - v16;
  }
  else
  {
    [v12 center];
    double v19 = v18;
    [v11 center];
    double v17 = v19 - v20;
  }
  double v21 = v17 / a6;
  double v22 = v21 * a5;
  double v23 = AXLogAudiogram();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    double v56 = [v11 numericalValue];
    uint64_t v57 = [v13 numericalValue];
    int v58 = 138413314;
    int v59 = v56;
    __int16 v60 = 2112;
    id v61 = v57;
    __int16 v62 = 2048;
    double v63 = v17;
    __int16 v64 = 2048;
    double v65 = v21;
    __int16 v66 = 2048;
    double v67 = v22;
    _os_log_debug_impl(&dword_23F0D7000, v23, OS_LOG_TYPE_DEBUG, "Pair (%@, %@), distance: %f distance factor: %f adjusted target value difference: %f", (uint8_t *)&v58, 0x34u);
  }
  double v24 = [v13 numericalValue];
  double v25 = v24;
  if (a7 == 1)
  {
    uint64_t v26 = [v24 integerValue];
    double v27 = [v11 numericalValue];
    double v28 = (double)(v26 - [v27 integerValue]);

    double v29 = v28 / v22;
    __int16 v30 = AXLogAudiogram();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[AIAudiogramIngestionEngine _isValidObject:toObject:withValueDifference:stepDistance:forAxis:](v30, v31, v32, v33, v34, v35, v36, v37);
    }

    BOOL v38 = v29 > 0.5;
    double v39 = 1.5;
  }
  else
  {
    [v24 doubleValue];
    double v41 = v40;
    double v42 = [v11 numericalValue];
    [v42 doubleValue];
    double v44 = v41 / v43;

    if (v44 <= 1.0)
    {
      BOOL v45 = 0;
      goto LABEL_18;
    }
    double v46 = log(v44);
    double v29 = fabs(v46 / log(v22));
    int v47 = AXLogAudiogram();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
      -[AIAudiogramIngestionEngine _isValidObject:toObject:withValueDifference:stepDistance:forAxis:](v47, v48, v49, v50, v51, v52, v53, v54);
    }

    BOOL v38 = v29 > 0.1;
    double v39 = 8.0;
  }
  BOOL v45 = v29 < v39 && v38;
LABEL_18:

  return v45;
}

- (double)_stddevFromNumbers:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F087F0];
  double v4 = [MEMORY[0x263F087F0] expressionForConstantValue:a3];
  v11[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v6 = [v3 expressionForFunction:@"stddev:" arguments:v5];

  id v7 = [v6 expressionValueWithObject:0 context:0];
  [v7 doubleValue];
  double v9 = v8;

  return v9;
}

- (double)_meanFromNumbers:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F087F0];
  double v4 = [MEMORY[0x263F087F0] expressionForConstantValue:a3];
  v11[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v6 = [v3 expressionForFunction:@"average:" arguments:v5];

  id v7 = [v6 expressionValueWithObject:0 context:0];
  [v7 doubleValue];
  double v9 = v8;

  return v9;
}

- (double)_zScoreFromNumber:(double)a3 mean:(double)a4 stddev:(double)a5
{
  double result = 0.0;
  if (a5 != 0.0) {
    return (a3 - a4) / a5;
  }
  return result;
}

- (unsigned)_propertyOrientationFromOrientation:(int64_t)a3
{
  if ((unint64_t)a3 < 8) {
    return dword_23F124630[a3];
  }
  double v4 = AXLogAudiogram();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[AIAudiogramIngestionEngine _propertyOrientationFromOrientation:]();
  }

  return 1;
}

- (unint64_t)failureMode
{
  return self->_failureMode;
}

- (void)setFailureMode:(unint64_t)a3
{
  self->_failureMode = a3;
}

- (NSDictionary)assetProperties
{
  return self->_assetProperties;
}

- (void)setAssetProperties:(id)a3
{
}

- (AIAudiogramIngestionEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AIAudiogramIngestionEngineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VNCoreMLModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (AIAudiogramAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (BOOL)isRetrievingLatestModel
{
  return self->_isRetrievingLatestModel;
}

- (void)setIsRetrievingLatestModel:(BOOL)a3
{
  self->_isRetrievingLatestModel = a3;
}

- (BOOL)isRetrievingLatestModelSilently
{
  return self->_isRetrievingLatestModelSilently;
}

- (void)setIsRetrievingLatestModelSilently:(BOOL)a3
{
  self->_isRetrievingLatestModelSilentlCGFloat y = a3;
}

- (NSString)modelLabelLeftEarSymbol
{
  return self->_modelLabelLeftEarSymbol;
}

- (void)setModelLabelLeftEarSymbol:(id)a3
{
}

- (NSString)modelLabelRightEarSymbol
{
  return self->_modelLabelRightEarSymbol;
}

- (void)setModelLabelRightEarSymbol:(id)a3
{
}

- (NSString)modelLabelGraph
{
  return self->_modelLabelGraph;
}

- (void)setModelLabelGraph:(id)a3
{
}

- (float)modelLabelConfidenceThreshold
{
  return self->_modelLabelConfidenceThreshold;
}

- (void)setModelLabelConfidenceThreshold:(float)a3
{
  self->_modelLabelConfidenceThreshold = a3;
}

- (OS_dispatch_queue)analysisQueue
{
  return self->_analysisQueue;
}

- (void)setAnalysisQueue:(id)a3
{
}

- (_TtC18AudiogramIngestion28AudiogramSymbolDetectorModel)symbolModel
{
  return self->_symbolModel;
}

- (void)setSymbolModel:(id)a3
{
}

- (_TtC18AudiogramIngestion27AudiogramGraphDetectorModel)graphModel
{
  return self->_graphModel;
}

- (void)setGraphModel:(id)a3
{
}

- (NSString)leftEarAirConductionUnmaskedSymbol
{
  return self->_leftEarAirConductionUnmaskedSymbol;
}

- (void)setLeftEarAirConductionUnmaskedSymbol:(id)a3
{
}

- (NSString)leftEarAirConductionMaskedSymbol
{
  return self->_leftEarAirConductionMaskedSymbol;
}

- (void)setLeftEarAirConductionMaskedSymbol:(id)a3
{
}

- (NSString)rightEarAirConductionUnmaskedSymbol
{
  return self->_rightEarAirConductionUnmaskedSymbol;
}

- (void)setRightEarAirConductionUnmaskedSymbol:(id)a3
{
}

- (NSString)rightEarAirConductionMaskedSymbol
{
  return self->_rightEarAirConductionMaskedSymbol;
}

- (void)setRightEarAirConductionMaskedSymbol:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEarAirConductionMaskedSymbol, 0);
  objc_storeStrong((id *)&self->_rightEarAirConductionUnmaskedSymbol, 0);
  objc_storeStrong((id *)&self->_leftEarAirConductionMaskedSymbol, 0);
  objc_storeStrong((id *)&self->_leftEarAirConductionUnmaskedSymbol, 0);
  objc_storeStrong((id *)&self->_graphModel, 0);
  objc_storeStrong((id *)&self->_symbolModel, 0);
  objc_storeStrong((id *)&self->_analysisQueue, 0);
  objc_storeStrong((id *)&self->_modelLabelGraph, 0);
  objc_storeStrong((id *)&self->_modelLabelRightEarSymbol, 0);
  objc_storeStrong((id *)&self->_modelLabelLeftEarSymbol, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetProperties, 0);
}

- (void)_loadModelFromAssetPath:assetProperties:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F0D7000, v0, v1, "Failed to create vn core ml model: %@", v2, v3, v4, v5, v6);
}

- (void)_loadModelFromAssetPath:assetProperties:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F0D7000, v0, v1, "Failed to create ml model: %@", v2, v3, v4, v5, v6);
}

- (void)_loadModelFromAssetPath:assetProperties:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F0D7000, v0, v1, "Failed to compile ml model: %@", v2, v3, v4, v5, v6);
}

- (void)_loadV2ModelFromAssetPath:assetProperties:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F0D7000, v0, v1, "Failed to compile symbol model: %@", v2, v3, v4, v5, v6);
}

- (void)_loadV2ModelFromAssetPath:assetProperties:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F0D7000, v0, v1, "Failed to compile graph model: %@", v2, v3, v4, v5, v6);
}

- (void)modelDidUpdate:assetProperties:assetVersion:withError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F0D7000, v0, v1, "AIAudiogramIngestionEngine received a model update with no error and no completion url", v2, v3, v4, v5, v6);
}

- (void)_textFromAudiogramImage:regionOfInterest:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F0D7000, v0, v1, "Error handling VNRecognizeTextRequest %@", v2, v3, v4, v5, v6);
}

void __71__AIAudiogramIngestionEngine__textFromAudiogramImage_regionOfInterest___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_23F0D7000, v0, v1, "Found text: %@", v2, v3, v4, v5, v6);
}

- (void)_observationsFromCIImage:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F0D7000, v0, v1, "Attempted to make object observation without a model", v2, v3, v4, v5, v6);
}

- (void)_observationsFromCIImage:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F0D7000, v0, v1, "Error handling VNCoreMLRequest %@", v2, v3, v4, v5, v6);
}

- (void)_cropResultsFromImage:observations:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_23F0D7000, v0, v1, "Crop rects adjusted %@", v2, v3, v4, v5, v6);
}

void __63__AIAudiogramIngestionEngine__formatNumbersFromRecognizedText___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F0D7000, v0, v1, "Error getting bounding box: %@", v2, v3, v4, v5, v6);
}

- (void)audiogramFromImages:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F0D7000, v0, v1, "Could not ingest audiogram from image", v2, v3, v4, v5, v6);
}

void __50__AIAudiogramIngestionEngine_audiogramFromImages___block_invoke_244_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F0D7000, v0, v1, "Could not ingest audiogram from image crop", v2, v3, v4, v5, v6);
}

double __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_250_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_23F0D7000, a1, a3, "Confidence %f too low", a5, a6, a7, a8, 0);
  return result;
}

void __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_253_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F0D7000, v0, v1, "Error creating sensitivity point: %@", v2, v3, v4, v5, v6);
}

- (void)audiogramPointsFromImages:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F0D7000, v0, v1, "v2: Could not ingest audiogram from image", v2, v3, v4, v5, v6);
}

void __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke_261_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F0D7000, v0, v1, "v2: Could not ingest audiogram from image crop", v2, v3, v4, v5, v6);
}

- (void)_setAudiogramAxisError:onError:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F0D7000, v0, v1, "Audiogram axis: %@", v2, v3, v4, v5, v6);
}

- (void)_sortAndRemoveInvalidAxisValues:(uint64_t)a3 forAxis:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_sortAndRemoveInvalidAxisValues:forAxis:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_23F0D7000, v0, v1, "Possible differences in values: %@", v2, v3, v4, v5, v6);
}

- (void)_sortAndRemoveInvalidAxisValues:forAxis:error:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_23F0D7000, v0, v1, "Filtered values: %@", v2, v3, v4, v5, v6);
}

- (void)_sortAndRemoveInvalidAxisValues:forAxis:error:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_23F0D7000, v0, v1, "Sorted values: %@", v2, v3, v4, v5, v6);
}

- (void)_isValidObject:(uint64_t)a3 toObject:(uint64_t)a4 withValueDifference:(uint64_t)a5 stepDistance:(uint64_t)a6 forAxis:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_isValidObject:(uint64_t)a3 toObject:(uint64_t)a4 withValueDifference:(uint64_t)a5 stepDistance:(uint64_t)a6 forAxis:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_propertyOrientationFromOrientation:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_23F0D7000, v0, OS_LOG_TYPE_FAULT, "Unable to handle unknown UIImageOrientation (%ld)", v1, 0xCu);
}

@end