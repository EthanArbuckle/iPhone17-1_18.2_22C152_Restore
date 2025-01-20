@interface VNFaceAnalyzerCompoundRequestConfiguration
- (NSMutableArray)originalRequests;
- (NSString)detectorType;
- (VNFaceAnalyzerCompoundRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)detectorConfigurationOptions;
- (void)setDetectorConfigurationOption:(id)a3 value:(id)a4;
- (void)setDetectorConfigurationOptions:(id)a3;
- (void)setDetectorType:(id)a3;
- (void)setResolvedRevision:(unint64_t)a3;
@end

@implementation VNFaceAnalyzerCompoundRequestConfiguration

- (VNFaceAnalyzerCompoundRequestConfiguration)initWithRequestClass:(Class)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VNFaceAnalyzerCompoundRequestConfiguration;
  v4 = -[VNRequestConfiguration initWithRequestClass:](&v11, sel_initWithRequestClass_);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    detectorConfigurationOptions = v4->_detectorConfigurationOptions;
    v4->_detectorConfigurationOptions = v5;

    v7 = +[VNRequestSpecifier specifierForRequestClass:[(objc_class *)a3 frameworkClass] revision:[(objc_class *)a3 defaultRevision] error:0];
    [(NSMutableDictionary *)v4->_detectorConfigurationOptions setObject:v7 forKeyedSubscript:@"VNDetectorOption_OriginatingRequestSpecifier"];

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    originalRequests = v4->_originalRequests;
    v4->_originalRequests = v8;

    objc_storeStrong((id *)&v4->_detectorType, @"VNFaceAnalyzerMultiDetectorType");
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorType, 0);
  objc_storeStrong((id *)&self->_originalRequests, 0);

  objc_storeStrong((id *)&self->_detectorConfigurationOptions, 0);
}

- (void)setDetectorConfigurationOption:(id)a3 value:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(NSMutableDictionary *)self->_detectorConfigurationOptions setValue:v6 forKey:v8];
  if ([v8 isEqualToString:@"VNDetectorOption_OriginatingRequestSpecifier"])
  {
    id v7 = v6;
    -[VNFaceAnalyzerCompoundRequestConfiguration setResolvedRevision:](self, "setResolvedRevision:", [v7 requestRevision]);
  }
}

- (void)setResolvedRevision:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VNFaceAnalyzerCompoundRequestConfiguration;
  -[VNRequestConfiguration setResolvedRevision:](&v6, sel_setResolvedRevision_);
  v5 = +[VNRequestSpecifier specifierForRequestClass:[(objc_class *)[(VNRequestConfiguration *)self requestClass] frameworkClass] revision:a3 error:0];
  [(NSMutableDictionary *)self->_detectorConfigurationOptions setObject:v5 forKeyedSubscript:@"VNDetectorOption_OriginatingRequestSpecifier"];
}

- (NSMutableArray)originalRequests
{
  return self->_originalRequests;
}

- (void)setDetectorType:(id)a3
{
}

- (void)setDetectorConfigurationOptions:(id)a3
{
  id v4 = a3;
  v5 = (NSMutableDictionary *)[v4 mutableCopy];
  detectorConfigurationOptions = self->_detectorConfigurationOptions;
  self->_detectorConfigurationOptions = v5;

  id v7 = [(NSMutableDictionary *)self->_detectorConfigurationOptions objectForKeyedSubscript:@"VNDetectorOption_OriginatingRequestSpecifier"];
  id v8 = v7;
  if (v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)VNFaceAnalyzerCompoundRequestConfiguration;
    -[VNRequestConfiguration setResolvedRevision:](&v9, sel_setResolvedRevision_, [v7 requestRevision]);
  }
}

- (id)detectorConfigurationOptions
{
  return self->_detectorConfigurationOptions;
}

- (NSString)detectorType
{
  return self->_detectorType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)VNFaceAnalyzerCompoundRequestConfiguration;
  id v4 = [(VNRequestConfiguration *)&v12 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_detectorConfigurationOptions mutableCopy];
    objc_super v6 = (void *)v4[12];
    v4[12] = v5;

    uint64_t v7 = [(NSMutableArray *)self->_originalRequests mutableCopy];
    id v8 = (void *)v4[13];
    v4[13] = v7;

    uint64_t v9 = [(NSString *)self->_detectorType copy];
    v10 = (void *)v4[14];
    v4[14] = v9;
  }
  return v4;
}

@end