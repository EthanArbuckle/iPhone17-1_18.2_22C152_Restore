@interface VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration
- (VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration)initWithMainStageComputeDevice:(id)a3;
- (id)_addFeatureConfigurationOfClass:(void *)a3 forOriginalRequest:(void *)a4 storedInOptionsKey:;
- (id)addCityNatureConfigurationForOriginalRequest:(id)a3;
- (id)addEntityNetClassificationConfigurationForOriginalRequest:(id)a3;
- (id)addImageAestheticsConfigurationForOriginalRequest:(id)a3;
- (id)addImageClassificationConfigurationForOriginalRequest:(id)a3;
- (id)addImageFingerprintsConfigurationForOriginalRequest:(id)a3;
- (id)addImageSaliencyAConfigurationForOriginalRequest:(id)a3;
- (id)addImageSaliencyOConfigurationForOriginalRequest:(id)a3;
- (id)addJunkConfigurationForOriginalRequest:(id)a3;
- (id)addRecognizeObjectsConfigurationForOriginalRequest:(id)a3;
- (id)addSceneprintConfigurationForOriginalRequest:(id)a3;
- (id)addSignificantEventConfigurationForOriginalRequest:(id)a3;
- (id)addVN5kJNH3eYuyaLxNpZr5Z7ziConfigurationForOriginalRequest:(id)a3;
- (id)detectorConfigurationOptions;
- (id)mainStageComputeDevice;
- (id)originalRequests;
- (void)addOriginalRequest:(id)a3;
- (void)cacheResultsInRequestPerformingContext:(id)a3;
- (void)setDetectorConfigurationOption:(id)a3 value:(id)a4;
@end

@implementation VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorConfigurationOptions, 0);
  objc_storeStrong((id *)&self->_originalRequests, 0);

  objc_storeStrong((id *)&self->_mainStageComputeDevice, 0);
}

- (void)cacheResultsInRequestPerformingContext:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration_cacheResultsInRequestPerformingContext___block_invoke;
  aBlock[3] = &unk_1E5B1F6B0;
  id v5 = v4;
  id v20 = v5;
  v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  v7 = [(NSMutableDictionary *)self->_detectorConfigurationOptions objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_SceneprintConfigurations"];
  v6[2](v6, v7);

  v8 = [(NSMutableDictionary *)self->_detectorConfigurationOptions objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"];
  v6[2](v6, v8);

  v9 = [(NSMutableDictionary *)self->_detectorConfigurationOptions objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations"];
  v6[2](v6, v9);

  v10 = [(NSMutableDictionary *)self->_detectorConfigurationOptions objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageAestheticsConfigurations"];
  v6[2](v6, v10);

  v11 = [(NSMutableDictionary *)self->_detectorConfigurationOptions objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyAConfigurations"];
  v6[2](v6, v11);

  v12 = [(NSMutableDictionary *)self->_detectorConfigurationOptions objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyOConfigurations"];
  v6[2](v6, v12);

  v13 = [(NSMutableDictionary *)self->_detectorConfigurationOptions objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_RecognizeObjectsConfigurations"];
  v6[2](v6, v13);

  v14 = [(NSMutableDictionary *)self->_detectorConfigurationOptions objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageFingerprintsConfigurations"];
  v6[2](v6, v14);

  v15 = [(NSMutableDictionary *)self->_detectorConfigurationOptions objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_JunkConfigurations"];
  v6[2](v6, v15);

  v16 = [(NSMutableDictionary *)self->_detectorConfigurationOptions objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_5kJNH3eYuyaLxNpZr5Z7ziConfigurations"];
  v6[2](v6, v16);

  v17 = [(NSMutableDictionary *)self->_detectorConfigurationOptions objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_SignificantEventConfigurations"];
  v6[2](v6, v17);

  v18 = [(NSMutableDictionary *)self->_detectorConfigurationOptions objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_CityNatureGatingConfigurations"];
  v6[2](v6, v18);
}

void __103__VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration_cacheResultsInRequestPerformingContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "observationsRecipient", (void)v8);
        [*(id *)(a1 + 32) cacheObservationsOfRequest:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)originalRequests
{
  return self->_originalRequests;
}

- (id)detectorConfigurationOptions
{
  return self->_detectorConfigurationOptions;
}

- (id)mainStageComputeDevice
{
  return self->_mainStageComputeDevice;
}

- (void)addOriginalRequest:(id)a3
{
}

- (void)setDetectorConfigurationOption:(id)a3 value:(id)a4
{
}

- (id)addCityNatureConfigurationForOriginalRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, @"VNCoreSceneUnderstandingDetectorProcessingOption_CityNatureGatingConfigurations");

  return v6;
}

- (id)_addFeatureConfigurationOfClass:(void *)a3 forOriginalRequest:(void *)a4 storedInOptionsKey:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    id v9 = [a1[3] objectForKey:v8];
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [a1[3] setObject:v9 forKey:v8];
    }
    a1 = (id *)[[a2 alloc] initWithObservationsRecipient:v7];
    [v9 addObject:a1];
  }

  return a1;
}

- (id)addSignificantEventConfigurationForOriginalRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, @"VNCoreSceneUnderstandingDetectorProcessingOption_SignificantEventConfigurations");

  return v6;
}

- (id)addVN5kJNH3eYuyaLxNpZr5Z7ziConfigurationForOriginalRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, @"VNCoreSceneUnderstandingDetectorProcessingOption_5kJNH3eYuyaLxNpZr5Z7ziConfigurations");

  return v6;
}

- (id)addJunkConfigurationForOriginalRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, @"VNCoreSceneUnderstandingDetectorProcessingOption_JunkConfigurations");

  return v6;
}

- (id)addImageFingerprintsConfigurationForOriginalRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, @"VNCoreSceneUnderstandingDetectorProcessingOption_ImageFingerprintsConfigurations");

  return v6;
}

- (id)addRecognizeObjectsConfigurationForOriginalRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, @"VNCoreSceneUnderstandingDetectorProcessingOption_RecognizeObjectsConfigurations");

  return v6;
}

- (id)addImageSaliencyOConfigurationForOriginalRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, @"VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyOConfigurations");

  return v6;
}

- (id)addImageSaliencyAConfigurationForOriginalRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, @"VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyAConfigurations");

  return v6;
}

- (id)addImageAestheticsConfigurationForOriginalRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, @"VNCoreSceneUnderstandingDetectorProcessingOption_ImageAestheticsConfigurations");

  return v6;
}

- (id)addEntityNetClassificationConfigurationForOriginalRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, @"VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations");

  return v6;
}

- (id)addImageClassificationConfigurationForOriginalRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, @"VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations");

  return v6;
}

- (id)addSceneprintConfigurationForOriginalRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, @"VNCoreSceneUnderstandingDetectorProcessingOption_SceneprintConfigurations");

  return v6;
}

- (VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration)initWithMainStageComputeDevice:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration;
  uint64_t v6 = [(VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mainStageComputeDevice, a3);
    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    originalRequests = v7->_originalRequests;
    v7->_originalRequests = v8;

    long long v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    detectorConfigurationOptions = v7->_detectorConfigurationOptions;
    v7->_detectorConfigurationOptions = v10;

    [(NSMutableDictionary *)v7->_detectorConfigurationOptions setObject:&unk_1EF7A7850 forKeyedSubscript:@"VNDetectorProcessOption_ImageCropAndScaleOption"];
  }

  return v7;
}

@end