@interface AXMSceneDetectorNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (NSArray)possibleSceneClassifications;
+ (id)title;
- (AXMSceneDetectorNode)initWithCoder:(id)a3;
- (BOOL)_shouldIncludeSceneLabelForOCRDocumenTypeDetection:(id)a3;
- (BOOL)validateVisionKitSoftLinkSymbols;
- (VNSceneClassificationRequest)_sceneClassificationRequest;
- (unsigned)taxonomyOptions;
- (void)_setSceneClassificationRequest:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)setTaxonomyOptions:(unsigned int)a3;
- (void)validateVisionKitSoftLinkSymbols;
@end

@implementation AXMSceneDetectorNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMSceneDetectorNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXMSceneDetectorNode;
  v5 = [(AXMEvaluationNode *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_taxonomyOptions = [v4 decodeInt32ForKey:@"taxonomyOptions"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXMSceneDetectorNode;
  id v4 = a3;
  [(AXMEvaluationNode *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", self->_taxonomyOptions, @"taxonomyOptions", v5.receiver, v5.super_class);
}

+ (BOOL)isSupported
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  BOOL v3 = (unint64_t)[v2 physicalMemory] > 0x773593FF;

  return v3;
}

+ (id)title
{
  return @"Scene Detector";
}

+ (NSArray)possibleSceneClassifications
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [getVNSceneClassificationRequestClass() knownSceneClassifications];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "identifier", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  if (getVNSceneClassificationRequestClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMSceneDetectorNode;
    return [(AXMVisionEngineNode *)&v5 validateVisionKitSoftLinkSymbols];
  }
  else
  {
    id v4 = AXMediaLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AXMSceneDetectorNode validateVisionKitSoftLinkSymbols](v4);
    }

    return 0;
  }
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v58.receiver = self;
  v58.super_class = (Class)AXMSceneDetectorNode;
  id v8 = [(AXMEvaluationNode *)&v58 evaluate:v6 metrics:v7];
  v9 = (void *)MEMORY[0x1BA9A10B0](v8);
  v10 = [(AXMSceneDetectorNode *)self _sceneClassificationRequest];

  if (!v10)
  {
    id v11 = objc_alloc_init((Class)getVNSceneClassificationRequestClass());
    [(AXMSceneDetectorNode *)self _setSceneClassificationRequest:v11];

    long long v12 = [(AXMSceneDetectorNode *)self _sceneClassificationRequest];
    +[AXMEvaluationNode configureForRunningOnANEIfPossibleWithRequest:v12];
  }
  long long v13 = [(AXMSceneDetectorNode *)self _sceneClassificationRequest];
  v62[0] = v13;
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
  [(AXMEvaluationNode *)self evaluateRequests:v14 withContext:v6 requestHandlerOptions:0 metrics:v7 error:0];

  v45 = v13;
  if ([(AXMSceneDetectorNode *)self taxonomyOptions])
  {
    v44 = v9;
    v15 = [v13 results];
    uint64_t v16 = +[AXMPhotoVisionSupport processSceneClassifications:v15 withOptions:[(AXMSceneDetectorNode *)self taxonomyOptions]];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v54 objects:v61 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v55 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          [v6 size];
          v23 = +[AXMVisionFeature featureWithTaxonomyNode:canvasSize:](AXMVisionFeature, "featureWithTaxonomyNode:canvasSize:", v22);
          [v6 appendFeature:v23];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v54 objects:v61 count:16];
      }
      while (v19);
    }
  }
  else
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v17 = [v13 results];
    uint64_t v24 = [v17 countByEnumeratingWithState:&v50 objects:v60 count:16];
    if (!v24) {
      goto LABEL_20;
    }
    uint64_t v25 = v24;
    v44 = v9;
    uint64_t v26 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v51 != v26) {
          objc_enumerationMutation(v17);
        }
        v28 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        v29 = +[AXMPhotoVisionSupport localizedLabelForClassificationObservation:v28];
        v30 = [v28 identifier];
        [v28 confidence];
        int v32 = v31;
        [v6 size];
        double v34 = v33;
        LODWORD(v33) = v32;
        v36 = +[AXMVisionFeature sceneClassificationWithLabel:localizedValue:confidence:canvasSize:](AXMVisionFeature, "sceneClassificationWithLabel:localizedValue:confidence:canvasSize:", v30, v29, v33, v34, v35);
        [v6 appendFeature:v36];
      }
      uint64_t v25 = [v17 countByEnumeratingWithState:&v50 objects:v60 count:16];
    }
    while (v25);
  }
  v9 = v44;
  long long v13 = v45;
LABEL_20:

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v37 = [v13 results];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v46 objects:v59 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v47 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = *(void **)(*((void *)&v46 + 1) + 8 * k);
        if ([(AXMSceneDetectorNode *)self _shouldIncludeSceneLabelForOCRDocumenTypeDetection:v42])
        {
          v43 = [v42 identifier];
          [v6 addSceneLabelForOCRDocumentTypeDetection:v43];
        }
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v46 objects:v59 count:16];
    }
    while (v39);
  }

  [v6 addEvaluatedFeatureType:9];
}

- (BOOL)_shouldIncludeSceneLabelForOCRDocumenTypeDetection:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];
  double v5 = 0.35;
  if (([v4 isEqualToString:@"diagram"] & 1) == 0
    && ([v4 isEqualToString:@"envelope"] & 1) == 0)
  {
    if (![v4 isEqualToString:@"receipt"])
    {
      BOOL v7 = 0;
      goto LABEL_6;
    }
    double v5 = 0.65;
  }
  [v3 confidence];
  BOOL v7 = v5 < v6;
LABEL_6:

  return v7;
}

- (unsigned)taxonomyOptions
{
  return self->_taxonomyOptions;
}

- (void)setTaxonomyOptions:(unsigned int)a3
{
  self->_taxonomyOptions = a3;
}

- (VNSceneClassificationRequest)_sceneClassificationRequest
{
  return self->__sceneClassificationRequest;
}

- (void)_setSceneClassificationRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)validateVisionKitSoftLinkSymbols
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. VNSceneClassificationRequestSoft was nil", v1, 2u);
}

@end