@interface GCConfigurationAssetXPCProxy
+ (BOOL)supportsSecureCoding;
- (GCConfigurationAssetXPCProxy)init;
- (GCConfigurationAssetXPCProxy)initWithAsset:(id)a3;
- (GCConfigurationAssetXPCProxy)initWithCoder:(id)a3;
- (GCVersion)compatibilityVersion;
- (GCVersion)contentVersion;
- (NSString)assetId;
- (NSString)assetState;
- (int64_t)contentRevision;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCConfigurationAssetXPCProxy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCConfigurationAssetXPCProxy)initWithAsset:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v19 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GCConfigurationAssetManagementServiceXPCProxy.m", 37, @"Invalid parameter not satisfying: %s", "asset != nil");
  }
  v20.receiver = self;
  v20.super_class = (Class)GCConfigurationAssetXPCProxy;
  v6 = [(GCConfigurationAssetXPCProxy *)&v20 init];
  v7 = [v5 assetId];
  uint64_t v8 = [v7 copy];
  assetId = v6->_assetId;
  v6->_assetId = (NSString *)v8;

  v10 = [v5 assetState];
  uint64_t v11 = [v10 copy];
  assetState = v6->_assetState;
  v6->_assetState = (NSString *)v11;

  v13 = [v5 compatibilityVersion];
  uint64_t v14 = [v13 copy];
  compatibilityVersion = v6->_compatibilityVersion;
  v6->_compatibilityVersion = (GCVersion *)v14;

  uint64_t v16 = [v5 contentVersion];
  contentVersion = v6->_contentVersion;
  v6->_contentVersion = (GCVersion *)v16;

  v6->_contentRevision = [v5 contentRevision];
  return v6;
}

- (GCConfigurationAssetXPCProxy)init
{
  return 0;
}

- (GCConfigurationAssetXPCProxy)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)GCConfigurationAssetXPCProxy;
  id v3 = a3;
  v4 = [(GCConfigurationAssetXPCProxy *)&v15 init];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"assetId", v15.receiver, v15.super_class);
  assetId = v4->_assetId;
  v4->_assetId = (NSString *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"assetState"];
  assetState = v4->_assetState;
  v4->_assetState = (NSString *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"compatibilityVersion"];
  compatibilityVersion = v4->_compatibilityVersion;
  v4->_compatibilityVersion = (GCVersion *)v9;

  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"contentVersion"];
  contentVersion = v4->_contentVersion;
  v4->_contentVersion = (GCVersion *)v11;

  uint64_t v13 = [v3 decodeIntegerForKey:@"contentRevision"];
  v4->_contentRevision = v13;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(GCConfigurationAssetXPCProxy *)self assetId];
  [v8 encodeObject:v4 forKey:@"assetId"];

  uint64_t v5 = [(GCConfigurationAssetXPCProxy *)self assetState];
  [v8 encodeObject:v5 forKey:@"assetState"];

  v6 = [(GCConfigurationAssetXPCProxy *)self compatibilityVersion];
  [v8 encodeObject:v6 forKey:@"compatibilityVersion"];

  uint64_t v7 = [(GCConfigurationAssetXPCProxy *)self contentVersion];
  [v8 encodeObject:v7 forKey:@"contentVersion"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[GCConfigurationAssetXPCProxy contentRevision](self, "contentRevision"), @"contentRevision");
}

- (NSString)assetId
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)assetState
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (GCVersion)compatibilityVersion
{
  return (GCVersion *)objc_getProperty(self, a2, 24, 1);
}

- (GCVersion)contentVersion
{
  return (GCVersion *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)contentRevision
{
  return self->_contentRevision;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentVersion, 0);
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
  objc_storeStrong((id *)&self->_assetState, 0);

  objc_storeStrong((id *)&self->_assetId, 0);
}

@end