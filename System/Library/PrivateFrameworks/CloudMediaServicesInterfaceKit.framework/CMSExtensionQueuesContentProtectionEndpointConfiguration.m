@interface CMSExtensionQueuesContentProtectionEndpointConfiguration
- (CMSExtensionQueuesContentProtectionEndpointConfiguration)init;
- (CMSExtensionQueuesContentProtectionEndpointConfiguration)initWithDictionary:(id)a3 endpoint:(id)a4 baseURL:(id)a5 groupHeaders:(id)a6;
- (NSString)keySystemIdentifier;
- (NSURL)fairPlayKeySystemCertificateUrl;
- (id)description;
- (void)setFairPlayKeySystemCertificateUrl:(id)a3;
- (void)setKeySystemIdentifier:(id)a3;
@end

@implementation CMSExtensionQueuesContentProtectionEndpointConfiguration

- (id)description
{
  v3 = NSString;
  v4 = [(CMSExtensionEndpointConfiguration *)self endpointURL];
  v5 = [(CMSExtensionEndpointConfiguration *)self groupHeaders];
  v6 = [(CMSExtensionEndpointConfiguration *)self headers];
  v7 = [v3 stringWithFormat:@"<CMSExtensionQueuesContentProtectionEndpointConfiguration: endpointURL:%@ groupHeaders:%@ headers:%@ keySystem:%@ certURL:%@>", v4, v5, v6, self->_keySystemIdentifier, self->_fairPlayKeySystemCertificateUrl];

  return v7;
}

- (CMSExtensionQueuesContentProtectionEndpointConfiguration)init
{
  v3 = [NSURL URLWithString:&stru_26DE5AB78];
  v4 = [(CMSExtensionQueuesContentProtectionEndpointConfiguration *)self initWithDictionary:MEMORY[0x263EFFA78] endpoint:&stru_26DE5AB78 baseURL:v3 groupHeaders:MEMORY[0x263EFFA78]];

  return v4;
}

- (CMSExtensionQueuesContentProtectionEndpointConfiguration)initWithDictionary:(id)a3 endpoint:(id)a4 baseURL:(id)a5 groupHeaders:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CMSExtensionQueuesContentProtectionEndpointConfiguration;
  v13 = [(CMSExtensionEndpointConfiguration *)&v24 initWithDictionary:v10 endpoint:v11 baseURL:v12 groupHeaders:a6];
  if (!v13) {
    goto LABEL_7;
  }
  v14 = [v10 cmsOptionalDictionaryForKey:@"cks"];
  if (!v14)
  {
    v15 = _CMSILogingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CMSExtensionQueuesContentProtectionEndpointConfiguration initWithDictionary:endpoint:baseURL:groupHeaders:]();
    }
    goto LABEL_13;
  }
  v15 = v14;
  v16 = [v14 cmsOptionalStringForKey:@"keySystem"];
  v17 = v16;
  if (!v16 || ([v16 isEqualToString:@"ContentKeySystemFairPlayStreaming"] & 1) == 0)
  {
    v18 = _CMSILogingFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CMSExtensionQueuesContentProtectionEndpointConfiguration initWithDictionary:endpoint:baseURL:groupHeaders:]();
    }
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v13->_keySystemIdentifier, (id)*MEMORY[0x263EF97F8]);
  v18 = [v15 cmsOptionalStringForKey:@"certUrl"];
  if (![v18 length])
  {
    v23 = _CMSILogingFacility();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[CMSExtensionQueuesContentProtectionEndpointConfiguration initWithDictionary:endpoint:baseURL:groupHeaders:]();
    }

LABEL_10:
LABEL_13:

    v21 = 0;
    goto LABEL_14;
  }
  uint64_t v19 = [NSURL URLWithString:v18 relativeToURL:v12];
  fairPlayKeySystemCertificateUrl = v13->_fairPlayKeySystemCertificateUrl;
  v13->_fairPlayKeySystemCertificateUrl = (NSURL *)v19;

LABEL_7:
  v21 = v13;
LABEL_14:

  return v21;
}

- (NSString)keySystemIdentifier
{
  return self->_keySystemIdentifier;
}

- (void)setKeySystemIdentifier:(id)a3
{
}

- (NSURL)fairPlayKeySystemCertificateUrl
{
  return self->_fairPlayKeySystemCertificateUrl;
}

- (void)setFairPlayKeySystemCertificateUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fairPlayKeySystemCertificateUrl, 0);
  objc_storeStrong((id *)&self->_keySystemIdentifier, 0);
}

- (void)initWithDictionary:endpoint:baseURL:groupHeaders:.cold.1()
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithDictionary:endpoint:baseURL:groupHeaders:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
}

- (void)initWithDictionary:endpoint:baseURL:groupHeaders:.cold.3()
{
  OUTLINED_FUNCTION_1();
}

@end