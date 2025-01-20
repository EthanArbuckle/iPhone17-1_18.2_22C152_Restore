@interface CMSSessionContextModel
+ (BOOL)supportsSecureCoding;
- (BOOL)homeKitAllowExplicitContentSetting;
- (BOOL)homeKitUpdateListeningHistorySetting;
- (BOOL)serviceUpdateListeningHistory;
- (CMSSessionContextModel)initWithCoder:(id)a3;
- (NSString)homeUserID;
- (NSString)serverEnvironmentOverride;
- (NSString)serviceID;
- (NSString)sessionAuthHeaderOverride;
- (NSURL)serverOverrideURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setHomeKitAllowExplicitContentSetting:(BOOL)a3;
- (void)setHomeKitUpdateListeningHistorySetting:(BOOL)a3;
- (void)setHomeUserID:(id)a3;
- (void)setServerEnvironmentOverride:(id)a3;
- (void)setServerOverrideURL:(id)a3;
- (void)setServiceID:(id)a3;
- (void)setServiceUpdateListeningHistory:(BOOL)a3;
- (void)setSessionAuthHeaderOverride:(id)a3;
@end

@implementation CMSSessionContextModel

- (id)description
{
  v3 = NSString;
  v4 = [(CMSSessionContextModel *)self serverOverrideURL];
  v5 = [(CMSSessionContextModel *)self serverEnvironmentOverride];
  v6 = [(CMSSessionContextModel *)self sessionAuthHeaderOverride];
  BOOL v7 = [(CMSSessionContextModel *)self homeKitAllowExplicitContentSetting];
  BOOL v8 = [(CMSSessionContextModel *)self homeKitUpdateListeningHistorySetting];
  v9 = [(CMSSessionContextModel *)self serviceID];
  v10 = [(CMSSessionContextModel *)self homeUserID];
  v11 = [v3 stringWithFormat:@"<CMSSessionContextModel: serverOverrideURL: %@,\n serverEnvironmentOverride: %@,\n sessionAuthHeaderOverride: %@,\n homeKitAllowExplicitContentSetting: %d,\n homeKitUpdateListeningHistorySetting: %d,\n serviceID: %@,\n homeUserID:%@,\n userConfiguredServiceUpdateListeningHistory: %d,\n>", v4, v5, v6, v7, v8, v9, v10, -[CMSSessionContextModel serviceUpdateListeningHistory](self, "serviceUpdateListeningHistory")];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSSessionContextModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CMSSessionContextModel;
  v5 = [(CMSSessionContextModel *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMSServerOverrideURLEncodedKey"];
    serverOverrideURL = v5->_serverOverrideURL;
    v5->_serverOverrideURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMSServerEnvironmentOverrideEncodedKey"];
    serverEnvironmentOverride = v5->_serverEnvironmentOverride;
    v5->_serverEnvironmentOverride = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMSServiceIDEncodedKey"];
    serviceID = v5->_serviceID;
    v5->_serviceID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMSHomeUserIDEncodedKey"];
    homeUserID = v5->_homeUserID;
    v5->_homeUserID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMSSessionAuthHeaderOverrideEncodedKey"];
    sessionAuthHeaderOverride = v5->_sessionAuthHeaderOverride;
    v5->_sessionAuthHeaderOverride = (NSString *)v14;

    v5->_serviceUpdateListeningHistory = [v4 decodeBoolForKey:@"CMSServiceUpdateListeningHistoryEncodedKey"];
    v5->_homeKitUpdateListeningHistorySetting = [v4 decodeBoolForKey:@"CMSHomeKitUpdateListeningHistorySettingEncodedKey"];
    v5->_homeKitAllowExplicitContentSetting = [v4 decodeBoolForKey:@"CMSHomeKitAllowExplicitContentSettingEncodedKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  serverOverrideURL = self->_serverOverrideURL;
  id v5 = a3;
  [v5 encodeObject:serverOverrideURL forKey:@"CMSServerOverrideURLEncodedKey"];
  [v5 encodeObject:self->_sessionAuthHeaderOverride forKey:@"CMSSessionAuthHeaderOverrideEncodedKey"];
  [v5 encodeObject:self->_serverEnvironmentOverride forKey:@"CMSServerEnvironmentOverrideEncodedKey"];
  [v5 encodeObject:self->_serviceID forKey:@"CMSServiceIDEncodedKey"];
  [v5 encodeObject:self->_homeUserID forKey:@"CMSHomeUserIDEncodedKey"];
  [v5 encodeBool:self->_serviceUpdateListeningHistory forKey:@"CMSServiceUpdateListeningHistoryEncodedKey"];
  [v5 encodeBool:self->_homeKitUpdateListeningHistorySetting forKey:@"CMSHomeKitUpdateListeningHistorySettingEncodedKey"];
  [v5 encodeBool:self->_homeKitAllowExplicitContentSetting forKey:@"CMSHomeKitAllowExplicitContentSettingEncodedKey"];
}

- (NSURL)serverOverrideURL
{
  return self->_serverOverrideURL;
}

- (void)setServerOverrideURL:(id)a3
{
}

- (NSString)serverEnvironmentOverride
{
  return self->_serverEnvironmentOverride;
}

- (void)setServerEnvironmentOverride:(id)a3
{
}

- (NSString)sessionAuthHeaderOverride
{
  return self->_sessionAuthHeaderOverride;
}

- (void)setSessionAuthHeaderOverride:(id)a3
{
}

- (BOOL)homeKitAllowExplicitContentSetting
{
  return self->_homeKitAllowExplicitContentSetting;
}

- (void)setHomeKitAllowExplicitContentSetting:(BOOL)a3
{
  self->_homeKitAllowExplicitContentSetting = a3;
}

- (BOOL)homeKitUpdateListeningHistorySetting
{
  return self->_homeKitUpdateListeningHistorySetting;
}

- (void)setHomeKitUpdateListeningHistorySetting:(BOOL)a3
{
  self->_homeKitUpdateListeningHistorySetting = a3;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
}

- (NSString)homeUserID
{
  return self->_homeUserID;
}

- (void)setHomeUserID:(id)a3
{
}

- (BOOL)serviceUpdateListeningHistory
{
  return self->_serviceUpdateListeningHistory;
}

- (void)setServiceUpdateListeningHistory:(BOOL)a3
{
  self->_serviceUpdateListeningHistory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUserID, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_sessionAuthHeaderOverride, 0);
  objc_storeStrong((id *)&self->_serverEnvironmentOverride, 0);
  objc_storeStrong((id *)&self->_serverOverrideURL, 0);
}

@end