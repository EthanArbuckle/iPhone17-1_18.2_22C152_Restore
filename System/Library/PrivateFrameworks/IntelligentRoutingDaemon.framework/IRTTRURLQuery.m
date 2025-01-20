@interface IRTTRURLQuery
- (IRTTRURLQuery)init;
- (NSArray)extensionIdentifiers;
- (NSArray)remoteDeviceSelections;
- (NSString)classification;
- (NSString)componentID;
- (NSString)componentName;
- (NSString)componentVersion;
- (NSString)radarDescription;
- (NSString)reproducibility;
- (NSString)title;
- (id)build;
- (void)setExtensionIdentifiers:(id)a3;
- (void)setRadarDescription:(id)a3;
- (void)setRemoteDeviceSelections:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation IRTTRURLQuery

- (IRTTRURLQuery)init
{
  v11.receiver = self;
  v11.super_class = (Class)IRTTRURLQuery;
  v2 = [(IRTTRURLQuery *)&v11 init];
  v3 = v2;
  if (v2)
  {
    classification = v2->_classification;
    v2->_classification = (NSString *)@"UI/Usability";

    componentName = v3->_componentName;
    v3->_componentName = (NSString *)@"Coriander LiveOn";

    componentVersion = v3->_componentVersion;
    v3->_componentVersion = (NSString *)@"All";

    componentID = v3->_componentID;
    v3->_componentID = (NSString *)@"1609607";

    reproducibility = v3->_reproducibility;
    v3->_reproducibility = (NSString *)@"I Didn't Try";

    v9 = v3;
  }

  return v3;
}

- (id)build
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  v4 = (void *)[@"tap-to-radar://new" mutableCopy];
  v5 = [(NSString *)self->_title stringByAddingPercentEncodingWithAllowedCharacters:v3];
  [v4 appendFormat:@"?Title=%@", v5];

  v6 = [(NSString *)self->_classification stringByAddingPercentEncodingWithAllowedCharacters:v3];
  [v4 appendFormat:@"&Classification=%@", v6];

  v7 = [(NSString *)self->_componentName stringByAddingPercentEncodingWithAllowedCharacters:v3];
  [v4 appendFormat:@"&ComponentName=%@", v7];

  v8 = [(NSString *)self->_componentVersion stringByAddingPercentEncodingWithAllowedCharacters:v3];
  [v4 appendFormat:@"&ComponentVersion=%@", v8];

  v9 = [(NSString *)self->_componentID stringByAddingPercentEncodingWithAllowedCharacters:v3];
  [v4 appendFormat:@"&ComponentID=%@", v9];

  v10 = [(NSString *)self->_reproducibility stringByAddingPercentEncodingWithAllowedCharacters:v3];
  [v4 appendFormat:@"&Reproducibility=%@", v10];

  objc_super v11 = [(NSArray *)self->_extensionIdentifiers componentsJoinedByString:@","];
  v12 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v3];
  [v4 appendFormat:@"&ExtensionIdentifiers=%@", v12];

  v13 = [(NSArray *)self->_remoteDeviceSelections componentsJoinedByString:@","];
  v14 = [v13 stringByAddingPercentEncodingWithAllowedCharacters:v3];
  [v4 appendFormat:@"&RemoteDeviceSelections=%@", v14];

  v15 = [(NSString *)self->_radarDescription stringByAddingPercentEncodingWithAllowedCharacters:v3];
  [v4 appendFormat:@"&Description=%@", v15];

  v16 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_25418E000, v16, OS_LOG_TYPE_INFO, "#ttr, URL: %@", buf, 0xCu);
  }
  v17 = [NSURL URLWithString:v4];

  return v17;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)classification
{
  return self->_classification;
}

- (NSString)componentName
{
  return self->_componentName;
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (NSString)componentID
{
  return self->_componentID;
}

- (NSString)reproducibility
{
  return self->_reproducibility;
}

- (NSArray)extensionIdentifiers
{
  return self->_extensionIdentifiers;
}

- (void)setExtensionIdentifiers:(id)a3
{
}

- (NSArray)remoteDeviceSelections
{
  return self->_remoteDeviceSelections;
}

- (void)setRemoteDeviceSelections:(id)a3
{
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setRadarDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_remoteDeviceSelections, 0);
  objc_storeStrong((id *)&self->_extensionIdentifiers, 0);
  objc_storeStrong((id *)&self->_reproducibility, 0);
  objc_storeStrong((id *)&self->_componentID, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_classification, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end