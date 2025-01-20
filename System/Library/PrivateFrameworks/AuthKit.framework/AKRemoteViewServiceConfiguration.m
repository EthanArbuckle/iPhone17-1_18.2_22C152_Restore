@interface AKRemoteViewServiceConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)configurationForHostWithBundleID:(id)a3 sceneID:(id)a4;
+ (id)defaultConfiguration;
- (AKRemoteViewServiceConfiguration)initWithCoder:(id)a3;
- (NSString)hostBundleID;
- (NSString)hostSceneID;
- (void)encodeWithCoder:(id)a3;
- (void)setHostBundleID:(id)a3;
- (void)setHostSceneID:(id)a3;
@end

@implementation AKRemoteViewServiceConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  hostBundleID = self->_hostBundleID;
  id v7 = v4;
  if (hostBundleID)
  {
    [v4 encodeObject:hostBundleID forKey:@"_hostBundleID"];
    id v4 = v7;
  }
  hostSceneID = self->_hostSceneID;
  if (hostSceneID)
  {
    [v7 encodeObject:hostSceneID forKey:@"_hostSceneID"];
    id v4 = v7;
  }
}

- (AKRemoteViewServiceConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKRemoteViewServiceConfiguration;
  v5 = [(AKRemoteViewServiceConfiguration *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hostBundleID"];
    hostBundleID = v5->_hostBundleID;
    v5->_hostBundleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hostSceneID"];
    hostSceneID = v5->_hostSceneID;
    v5->_hostSceneID = (NSString *)v8;
  }
  return v5;
}

+ (id)configurationForHostWithBundleID:(id)a3 sceneID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[AKRemoteViewServiceConfiguration defaultConfiguration];
  [v7 setHostBundleID:v6];

  [v7 setHostSceneID:v5];

  return v7;
}

+ (id)defaultConfiguration
{
  v2 = objc_alloc_init(AKRemoteViewServiceConfiguration);

  return v2;
}

- (NSString)hostBundleID
{
  return self->_hostBundleID;
}

- (void)setHostBundleID:(id)a3
{
}

- (NSString)hostSceneID
{
  return self->_hostSceneID;
}

- (void)setHostSceneID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostSceneID, 0);

  objc_storeStrong((id *)&self->_hostBundleID, 0);
}

@end