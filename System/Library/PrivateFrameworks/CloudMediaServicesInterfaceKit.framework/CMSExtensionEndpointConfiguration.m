@interface CMSExtensionEndpointConfiguration
- (CMSExtensionEndpointConfiguration)init;
- (CMSExtensionEndpointConfiguration)initWithDictionary:(id)a3 endpoint:(id)a4 baseURL:(id)a5 groupHeaders:(id)a6;
- (NSDictionary)groupHeaders;
- (NSDictionary)headers;
- (NSMutableURLRequest)request;
- (NSURL)endpointURL;
- (id)description;
- (void)setEndpointURL:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation CMSExtensionEndpointConfiguration

- (id)description
{
  return (id)[NSString stringWithFormat:@"<CMSExtensionEndpointConfiguration: endpointURL:%@ groupHeaders:%@ headers:%@>", self->_endpointURL, self->_groupHeaders, self->_headers];
}

- (CMSExtensionEndpointConfiguration)init
{
  v3 = [NSURL URLWithString:&stru_26DE5AB78];
  v4 = [(CMSExtensionEndpointConfiguration *)self initWithDictionary:MEMORY[0x263EFFA78] endpoint:@"/" baseURL:v3 groupHeaders:MEMORY[0x263EFFA78]];

  return v4;
}

- (CMSExtensionEndpointConfiguration)initWithDictionary:(id)a3 endpoint:(id)a4 baseURL:(id)a5 groupHeaders:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CMSExtensionEndpointConfiguration;
  v14 = [(CMSExtensionEndpointConfiguration *)&v28 init];
  if (v14)
  {
    v15 = [v10 cmsOptionalStringForKey:@"url"];
    v16 = v15;
    if (v15)
    {
      if (![v15 length]) {
        goto LABEL_9;
      }
      uint64_t v17 = [NSURL URLWithString:v16];
      endpointURL = v14->_endpointURL;
      v14->_endpointURL = (NSURL *)v17;

      v19 = v14->_endpointURL;
      if (!v19) {
        goto LABEL_9;
      }
      v20 = [(NSURL *)v19 baseURL];

      if (v20) {
        goto LABEL_9;
      }
      v21 = NSURL;
      id v22 = v16;
    }
    else
    {
      v21 = NSURL;
      id v22 = v11;
    }
    uint64_t v23 = [v21 URLWithString:v22 relativeToURL:v12];
    v24 = v14->_endpointURL;
    v14->_endpointURL = (NSURL *)v23;

LABEL_9:
    objc_storeStrong((id *)&v14->_groupHeaders, a6);
    uint64_t v25 = [v10 cmsOptionalDictionaryForKey:@"hdr"];
    headers = v14->_headers;
    v14->_headers = (NSDictionary *)v25;
  }
  return v14;
}

- (NSMutableURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSURL)endpointURL
{
  return self->_endpointURL;
}

- (void)setEndpointURL:(id)a3
{
}

- (NSDictionary)groupHeaders
{
  return self->_groupHeaders;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_groupHeaders, 0);
  objc_storeStrong((id *)&self->_endpointURL, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end