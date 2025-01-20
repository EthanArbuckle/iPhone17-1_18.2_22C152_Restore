@interface VNFaceAnalyzerCompoundRequestConfigurationGroups
- (VNFaceAnalyzerCompoundRequestConfigurationGroups)init;
- (id)allConfigurations;
- (id)configurationForRequest:(id)a3 withObservationGroup:(id)a4 compoundRequestRevision:(unint64_t)a5;
- (unint64_t)count;
@end

@implementation VNFaceAnalyzerCompoundRequestConfigurationGroups

- (id)allConfigurations
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(NSMutableDictionary *)self->_generalConfigurations allValues];
  [v3 addObjectsFromArray:v4];

  v5 = [(NSMutableDictionary *)self->_observationGroupConfigurations allValues];
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (VNFaceAnalyzerCompoundRequestConfigurationGroups)init
{
  v8.receiver = self;
  v8.super_class = (Class)VNFaceAnalyzerCompoundRequestConfigurationGroups;
  v2 = [(VNFaceAnalyzerCompoundRequestConfigurationGroups *)&v8 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    generalConfigurations = v2->_generalConfigurations;
    v2->_generalConfigurations = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observationGroupConfigurations = v2->_observationGroupConfigurations;
    v2->_observationGroupConfigurations = v5;
  }
  return v2;
}

- (id)configurationForRequest:(id)a3 withObservationGroup:(id)a4 compoundRequestRevision:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 detectionLevel];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v11 = [v8 forceFaceprintCreation];
  }
  else {
    unsigned int v11 = 0;
  }
  objc_opt_class();
  +[VNError VNAssert:objc_opt_isKindOfClass() & 1 log:@"Request object must be of type VNImageBasedRequest"];
  [v8 regionOfInterest];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  if (v9 && [v9 count])
  {
    id v20 = [NSString alloc];
    v21 = [v9 description];
    v22 = (void *)[v20 initWithFormat:@"%@:%u:%u:%lu", v21, v10, v11, a5];

    v23 = [(NSMutableDictionary *)self->_observationGroupConfigurations objectForKeyedSubscript:v22];
    if (!v23)
    {
      v23 = [[VNFaceAnalyzerCompoundRequestConfiguration alloc] initWithRequestClass:objc_opt_class()];
      [(NSMutableDictionary *)self->_observationGroupConfigurations setObject:v23 forKeyedSubscript:v22];
    }
  }
  else
  {
    v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"%f,%f,%f,%f:%u:%u:%lu", v13, v15, v17, v19, v10, v11, a5);
    v23 = [(NSMutableDictionary *)self->_generalConfigurations objectForKeyedSubscript:v22];
    if (!v23)
    {
      v23 = [[VNFaceAnalyzerCompoundRequestConfiguration alloc] initWithRequestClass:objc_opt_class()];
      [(NSMutableDictionary *)self->_generalConfigurations setObject:v23 forKeyedSubscript:v22];
    }
  }

  v24 = [(VNFaceAnalyzerCompoundRequestConfiguration *)v23 originalRequests];
  [v24 addObject:v8];

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationGroupConfigurations, 0);

  objc_storeStrong((id *)&self->_generalConfigurations, 0);
}

- (unint64_t)count
{
  uint64_t v3 = [(NSMutableDictionary *)self->_generalConfigurations count];
  return [(NSMutableDictionary *)self->_observationGroupConfigurations count] + v3;
}

@end