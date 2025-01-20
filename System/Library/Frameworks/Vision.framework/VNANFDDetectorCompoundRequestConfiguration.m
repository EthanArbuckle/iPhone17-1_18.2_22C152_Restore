@interface VNANFDDetectorCompoundRequestConfiguration
- (NSDictionary)detectorConfigurationOptions;
- (NSMutableArray)originalRequests;
- (NSString)detectorType;
- (VNANFDDetectorCompoundRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDetectorConfigurationOption:(id)a3 value:(id)a4;
- (void)setDetectorConfigurationOptions:(id)a3;
- (void)setDetectorType:(id)a3;
@end

@implementation VNANFDDetectorCompoundRequestConfiguration

- (NSMutableArray)originalRequests
{
  return self->_originalRequests;
}

- (VNANFDDetectorCompoundRequestConfiguration)initWithRequestClass:(Class)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VNANFDDetectorCompoundRequestConfiguration;
  v3 = [(VNRequestConfiguration *)&v10 initWithRequestClass:a3];
  if (v3)
  {
    v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    detectorConfigurationOptions = v3->_detectorConfigurationOptions;
    v3->_detectorConfigurationOptions = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    originalRequests = v3->_originalRequests;
    v3->_originalRequests = v6;

    objc_storeStrong((id *)&v3->_detectorType, @"VNANFDMultiDetectorType");
    v8 = v3;
  }

  return v3;
}

- (void)setDetectorType:(id)a3
{
}

- (void)setDetectorConfigurationOptions:(id)a3
{
  id v4 = a3;
  v5 = (NSDictionary *)[v4 mutableCopy];
  detectorConfigurationOptions = self->_detectorConfigurationOptions;
  self->_detectorConfigurationOptions = v5;

  v7 = [v4 objectForKey:@"VNDetectorOption_OriginatingRequestSpecifier"];
  if (v7
    && objc_msgSend(v7, "specifiesRequestClass:", -[VNRequestConfiguration requestClass](self, "requestClass")))
  {
    v8.receiver = self;
    v8.super_class = (Class)VNANFDDetectorCompoundRequestConfiguration;
    -[VNRequestConfiguration setResolvedRevision:](&v8, sel_setResolvedRevision_, [v7 requestRevision]);
  }
}

- (void)setDetectorConfigurationOption:(id)a3 value:(id)a4
{
}

- (NSString)detectorType
{
  return self->_detectorType;
}

- (NSDictionary)detectorConfigurationOptions
{
  return self->_detectorConfigurationOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorType, 0);
  objc_storeStrong((id *)&self->_originalRequests, 0);

  objc_storeStrong((id *)&self->_detectorConfigurationOptions, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)VNANFDDetectorCompoundRequestConfiguration;
  id v4 = [(VNRequestConfiguration *)&v13 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(NSDictionary *)self->_detectorConfigurationOptions mutableCopy];
    v6 = (void *)v4[12];
    v4[12] = v5;

    uint64_t v7 = [(NSMutableArray *)self->_originalRequests mutableCopy];
    objc_super v8 = (void *)v4[13];
    v4[13] = v7;

    uint64_t v9 = [(NSString *)self->_detectorType copy];
    objc_super v10 = (void *)v4[14];
    v4[14] = v9;

    v11 = v4;
  }

  return v4;
}

@end