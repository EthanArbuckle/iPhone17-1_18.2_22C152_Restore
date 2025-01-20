@interface VNImageAnalyzerCompoundRequestGroupingConfiguration
- (id)addSceneConfigurationForOriginalRequest:(id)a3;
- (id)addSceneprintConfigurationForOriginalRequest:(id)a3;
- (id)computeStageDeviceAssignments;
- (id)detectorConfigurationOptions;
- (id)originalRequests;
- (void)addOriginalRequest:(id)a3 forKind:(unint64_t)a4;
- (void)addTilingWarningRecorder:(id)a3;
- (void)enumerateOriginalRequestsByKindUsingBlock:(id)a3;
- (void)setDetectorConfigurationOption:(id)a3 value:(id)a4;
@end

@implementation VNImageAnalyzerCompoundRequestGroupingConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeStageDeviceAssignments, 0);
  objc_storeStrong((id *)&self->_detectorConfigurationOptions, 0);
  objc_storeStrong((id *)&self->_kindToOriginalRequestsMapping, 0);

  objc_storeStrong((id *)&self->_originalRequests, 0);
}

- (id)computeStageDeviceAssignments
{
  v2 = (void *)[(NSMutableDictionary *)self->_computeStageDeviceAssignments copy];

  return v2;
}

- (void)enumerateOriginalRequestsByKindUsingBlock:(id)a3
{
  id v4 = a3;
  kindToOriginalRequestsMapping = self->_kindToOriginalRequestsMapping;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__VNImageAnalyzerCompoundRequestGroupingConfiguration_enumerateOriginalRequestsByKindUsingBlock___block_invoke;
  v7[3] = &unk_1E5B1C300;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)kindToOriginalRequestsMapping enumerateKeysAndObjectsUsingBlock:v7];
}

void __97__VNImageAnalyzerCompoundRequestGroupingConfiguration_enumerateOriginalRequestsByKindUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v11 = a2;
  id v7 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = [v11 unsignedIntegerValue];
  v10 = (void *)[v7 copy];
  (*(void (**)(uint64_t, uint64_t, void *, uint64_t))(v8 + 16))(v8, v9, v10, a4);
}

- (id)originalRequests
{
  return self->_originalRequests;
}

- (id)detectorConfigurationOptions
{
  return self->_detectorConfigurationOptions;
}

- (void)addTilingWarningRecorder:(id)a3
{
  id v5 = a3;
  id v4 = [(NSMutableDictionary *)self->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorProcessingOption_TilingWarningRecorders"];
  if (!v4)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_detectorConfigurationOptions, "setObject:forKeyedSubscript:");
  }
  if ([v4 indexOfObjectIdenticalTo:v5] == 0x7FFFFFFFFFFFFFFFLL) {
    [v4 addObject:v5];
  }
}

- (void)addOriginalRequest:(id)a3 forKind:(unint64_t)a4
{
  id v8 = a3;
  id v6 = [NSNumber numberWithUnsignedInteger:a4];
  id v7 = [(NSMutableDictionary *)self->_kindToOriginalRequestsMapping objectForKey:v6];
  if (!v7)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    -[NSMutableDictionary setObject:forKey:](self->_kindToOriginalRequestsMapping, "setObject:forKey:");
  }
  [v7 addObject:v8];
  [(NSMutableArray *)self->_originalRequests addObject:v8];
}

- (void)setDetectorConfigurationOption:(id)a3 value:(id)a4
{
}

- (id)addSceneprintConfigurationForOriginalRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SceneprintConfigurations"];
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMutableDictionary *)self->_detectorConfigurationOptions setObject:v5 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SceneprintConfigurations"];
  }
  id v6 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorSceneprintConfiguration alloc] initWithObservationsRecipient:v4];
  [v5 addObject:v6];

  return v6;
}

- (id)addSceneConfigurationForOriginalRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SceneConfigurations"];
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMutableDictionary *)self->_detectorConfigurationOptions setObject:v5 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SceneConfigurations"];
  }
  id v6 = [[VNImageAnalyzerMultiDetectorSceneClassificationConfiguration alloc] initWithObservationsRecipient:v4];
  [v5 addObject:v6];

  return v6;
}

@end