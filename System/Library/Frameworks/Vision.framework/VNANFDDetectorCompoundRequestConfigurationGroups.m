@interface VNANFDDetectorCompoundRequestConfigurationGroups
+ (id)createCompoundConfigurationHashKeyForRequest:(id)a3 compoundRequestRevision:(unint64_t)a4;
- (VNANFDDetectorCompoundRequestConfigurationGroups)init;
- (id)allConfigurations;
- (id)configurationForRequest:(id)a3;
- (unint64_t)count;
@end

@implementation VNANFDDetectorCompoundRequestConfigurationGroups

- (void).cxx_destruct
{
}

- (id)configurationForRequest:(id)a3
{
  id v4 = a3;
  int64_t v5 = +[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:v4];
  v6 = [(id)objc_opt_class() createCompoundConfigurationHashKeyForRequest:v4 compoundRequestRevision:v5];
  v7 = [(NSMutableDictionary *)self->_regionOfInterestConfigurations objectForKeyedSubscript:v6];
  if (!v7)
  {
    v8 = [[VNANFDDetectorCompoundRequestConfiguration alloc] initWithRequestClass:objc_opt_class()];
    [(VNRequestConfiguration *)v8 setResolvedRevision:v5];
    v7 = v8;
    [(NSMutableDictionary *)self->_regionOfInterestConfigurations setObject:v8 forKeyedSubscript:v6];
  }
  v9 = [v7 originalRequests];
  [v9 addObject:v4];

  return v7;
}

+ (id)createCompoundConfigurationHashKeyForRequest:(id)a3 compoundRequestRevision:(unint64_t)a4
{
  [a3 regionOfInterest];
  double v9 = v8;
  if (v8 == 0.0) {
    double v9 = 0.0;
  }
  double v10 = v5;
  if (v5 == 0.0) {
    double v10 = 0.0;
  }
  uint64_t v11 = *(void *)&v10 ^ __ROR8__(*(void *)&v9, 51);
  double v12 = v6;
  if (v6 == 0.0) {
    double v12 = 0.0;
  }
  uint64_t v13 = *(void *)&v12 ^ __ROR8__(v11, 51);
  double v14 = v7;
  if (v7 == 0.0) {
    double v14 = 0.0;
  }
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", *(void *)&v14 ^ __ROR8__(v13, 51) ^ __ROR8__(a4, 51));

  return v15;
}

- (VNANFDDetectorCompoundRequestConfigurationGroups)init
{
  v7.receiver = self;
  v7.super_class = (Class)VNANFDDetectorCompoundRequestConfigurationGroups;
  v2 = [(VNANFDDetectorCompoundRequestConfigurationGroups *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    regionOfInterestConfigurations = v2->_regionOfInterestConfigurations;
    v2->_regionOfInterestConfigurations = v3;

    double v5 = v2;
  }

  return v2;
}

- (id)allConfigurations
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(NSMutableDictionary *)self->_regionOfInterestConfigurations allValues];
  [v3 addObjectsFromArray:v4];

  return v3;
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_regionOfInterestConfigurations count];
}

@end