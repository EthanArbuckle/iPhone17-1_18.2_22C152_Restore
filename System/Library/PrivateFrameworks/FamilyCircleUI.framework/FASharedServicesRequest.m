@interface FASharedServicesRequest
+ (Class)responseClass;
- (FASharedServicesRequest)initWithAppleAccount:(id)a3 urlString:(id)a4;
- (id)urlRequest;
@end

@implementation FASharedServicesRequest

- (FASharedServicesRequest)initWithAppleAccount:(id)a3 urlString:(id)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FASharedServicesRequest;
  v8 = [(AARequest *)&v13 initWithURLString:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appleAccount, a3);
    uint64_t v10 = [objc_alloc(MEMORY[0x263F3BFA8]) initWithAccount:v9->_appleAccount];
    requestConfigurator = v9->_requestConfigurator;
    v9->_requestConfigurator = (FARequestConfigurator *)v10;
  }
  return v9;
}

- (id)urlRequest
{
  v6.receiver = self;
  v6.super_class = (Class)FASharedServicesRequest;
  v3 = [(AARequest *)&v6 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  [(FARequestConfigurator *)self->_requestConfigurator setAttachSetupHeader:0];
  [(FARequestConfigurator *)self->_requestConfigurator addFresnoHeadersToRequest:v4];
  [(FARequestConfigurator *)self->_requestConfigurator addFresnoPayloadToRequest:v4 additionalPayload:0];
  return v4;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_requestConfigurator, 0);
}

@end