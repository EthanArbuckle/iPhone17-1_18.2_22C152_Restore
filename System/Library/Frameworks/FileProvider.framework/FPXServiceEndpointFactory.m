@interface FPXServiceEndpointFactory
- (FPXServiceEndpointFactory)initWithServiceSources:(id)a3 domainContext:(id)a4;
- (void)getListenerEndpointForServiceName:(id)a3 completionHandler:(id)a4;
@end

@implementation FPXServiceEndpointFactory

- (FPXServiceEndpointFactory)initWithServiceSources:(id)a3 domainContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FPXServiceEndpointFactory;
  v8 = [(FPXServiceEndpointFactory *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    serviceSources = v8->_serviceSources;
    v8->_serviceSources = (NSDictionary *)v9;

    objc_storeStrong((id *)&v8->_domainContext, a4);
  }

  return v8;
}

- (void)getListenerEndpointForServiceName:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void *, void *))a4;
  id v7 = [(NSDictionary *)self->_serviceSources objectForKeyedSubscript:a3];
  id v11 = 0;
  v8 = [v7 makeListenerEndpointAndReturnError:&v11];
  id v9 = v11;

  if (v9)
  {
    v10 = [(FPXDomainContext *)self->_domainContext internalErrorFromVendorError:v9 callerDescription:@"getListenerEndpointForServiceName"];
  }
  else
  {
    v10 = 0;
  }
  v6[2](v6, v8, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainContext, 0);

  objc_storeStrong((id *)&self->_serviceSources, 0);
}

@end