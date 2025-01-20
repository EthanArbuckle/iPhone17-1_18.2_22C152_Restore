@interface CMSExtensionIntentEndpointConfiguration
- (CMSExtensionIntentEndpointConfiguration)init;
- (CMSExtensionIntentEndpointConfiguration)initWithDictionary:(id)a3 endpoint:(id)a4 baseURL:(id)a5 groupHeaders:(id)a6;
- (NSMutableSet)optionalMethods;
- (id)description;
- (void)setOptionalMethods:(id)a3;
@end

@implementation CMSExtensionIntentEndpointConfiguration

- (id)description
{
  v3 = NSString;
  v4 = [(CMSExtensionEndpointConfiguration *)self endpointURL];
  v5 = [(CMSExtensionEndpointConfiguration *)self groupHeaders];
  v6 = [(CMSExtensionEndpointConfiguration *)self headers];
  v7 = [v3 stringWithFormat:@"<CMSExtensionIntentEndpointConfiguration: endpointURL:%@ groupHeaders:%@ headers:%@ optionalMethods:%@>", v4, v5, v6, self->_optionalMethods];

  return v7;
}

- (CMSExtensionIntentEndpointConfiguration)init
{
  v3 = [NSURL URLWithString:&stru_26DE5AB78];
  v4 = [(CMSExtensionIntentEndpointConfiguration *)self initWithDictionary:MEMORY[0x263EFFA78] endpoint:@"/" baseURL:v3 groupHeaders:MEMORY[0x263EFFA78]];

  return v4;
}

- (CMSExtensionIntentEndpointConfiguration)initWithDictionary:(id)a3 endpoint:(id)a4 baseURL:(id)a5 groupHeaders:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v36.receiver = self;
  v36.super_class = (Class)CMSExtensionIntentEndpointConfiguration;
  v12 = [(CMSExtensionEndpointConfiguration *)&v36 initWithDictionary:v10 endpoint:v11 baseURL:a5 groupHeaders:a6];
  if (v12)
  {
    v13 = [v10 cmsOptionalArrayOfClass:objc_opt_class() forKey:@"opt"];
    v31 = [MEMORY[0x263EFF9C0] set];
    if (v13)
    {
      v29 = v12;
      id v30 = v10;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v28 = v13;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v33;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v33 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * v18);
            v20 = NSString;
            v21 = CMSProtocolNameForExtensionEndpoint(v11);
            v22 = [v20 stringWithFormat:@"%@.%@", v21, v19];

            v23 = CMSExtensionEndpointForProtocolMethodName(v22);
            LODWORD(v21) = [v23 isEqual:v11];

            if (v21)
            {
              [v31 addObject:v22];
            }
            else
            {
              v24 = _CMSILogingFacility();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                uint64_t v38 = v19;
                __int16 v39 = 2114;
                id v40 = v11;
              }
            }
            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
        }
        while (v16);
      }

      v12 = v29;
      id v10 = v30;
      v13 = v28;
    }
    uint64_t v25 = [v31 copy];
    optionalMethods = v12->_optionalMethods;
    v12->_optionalMethods = (NSMutableSet *)v25;
  }
  return v12;
}

- (NSMutableSet)optionalMethods
{
  return self->_optionalMethods;
}

- (void)setOptionalMethods:(id)a3
{
}

- (void).cxx_destruct
{
}

@end