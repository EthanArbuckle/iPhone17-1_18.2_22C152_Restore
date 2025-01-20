@interface _VNImageAnalyzerMultiDetectorSceneOperationPointsCache
- (_VNImageAnalyzerMultiDetectorSceneOperationPointsCache)initWithInferenceNetworkDescriptor:(id)a3;
- (id)sceneLabelOperationPointsForOriginatingRequestSpecifier:(id)a3 error:(id *)a4;
@end

@implementation _VNImageAnalyzerMultiDetectorSceneOperationPointsCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingRequestSpecifierToOperationPoints, 0);

  objc_storeStrong((id *)&self->_inferenceNetworkDescriptor, 0);
}

- (id)sceneLabelOperationPointsForOriginatingRequestSpecifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(NSMutableDictionary *)self->_originatingRequestSpecifierToOperationPoints objectForKeyedSubscript:v6];
  if (!v7)
  {
    int v8 = [v6 specifiesRequestClass:objc_opt_class() revision:3737841667];
    inferenceNetworkDescriptor = self->_inferenceNetworkDescriptor;
    if (v8) {
      [(VisionCoreSceneNetInferenceNetworkDescriptor *)inferenceNetworkDescriptor entityNetOperatingPointsFileURL];
    }
    else {
    v10 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)inferenceNetworkDescriptor sceneOperatingPointsFileURL];
    }
    if (v10)
    {
      v7 = +[VNSceneTaxonomyOperationPoints loadFromURL:v10 error:a4];
      if (!v7) {
        goto LABEL_10;
      }
    }
    else
    {
      v7 = +[VNOperationPoints unspecifiedOperationPoints];
    }
    [(NSMutableDictionary *)self->_originatingRequestSpecifierToOperationPoints setObject:v7 forKeyedSubscript:v6];
LABEL_10:
  }

  return v7;
}

- (_VNImageAnalyzerMultiDetectorSceneOperationPointsCache)initWithInferenceNetworkDescriptor:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_VNImageAnalyzerMultiDetectorSceneOperationPointsCache;
  id v6 = [(_VNImageAnalyzerMultiDetectorSceneOperationPointsCache *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inferenceNetworkDescriptor, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    originatingRequestSpecifierToOperationPoints = v7->_originatingRequestSpecifierToOperationPoints;
    v7->_originatingRequestSpecifierToOperationPoints = (NSMutableDictionary *)v8;
  }
  return v7;
}

@end