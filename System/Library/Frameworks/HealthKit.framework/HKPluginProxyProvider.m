@interface HKPluginProxyProvider
- (HKPluginProxyProvider)initWithHealthStore:(id)a3 pluginIdentifier:(id)a4 exportedObject:(id)a5;
- (id)proxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 error:(id *)a5;
- (void)fetchProxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 endpointHandler:(id)a5 errorHandler:(id)a6;
@end

@implementation HKPluginProxyProvider

- (HKPluginProxyProvider)initWithHealthStore:(id)a3 pluginIdentifier:(id)a4 exportedObject:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 exportedInterface];
  v12 = [v8 remoteInterface];
  v15.receiver = self;
  v15.super_class = (Class)HKPluginProxyProvider;
  v13 = [(HKProxyProvider *)&v15 initWithSource:v10 serviceIdentifier:v9 exportedObject:v8 exportedInterface:v11 remoteInterface:v12];

  return v13;
}

- (void)fetchProxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 endpointHandler:(id)a5 errorHandler:(id)a6
{
}

- (id)proxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 error:(id *)a5
{
  return (id)[a3 pluginServiceEndpointForIdentifier:a4 error:a5];
}

@end