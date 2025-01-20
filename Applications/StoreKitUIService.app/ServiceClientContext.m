@interface ServiceClientContext
- (NSString)hostApplicationIdentifier;
- (ServiceClientContext)initWithConfigurationDictionary:(id)a3;
- (void)getDefaultMetricsControllerWithCompletionBlock:(id)a3;
- (void)setHostApplicationIdentifier:(id)a3;
@end

@implementation ServiceClientContext

- (ServiceClientContext)initWithConfigurationDictionary:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ServiceClientContext;
  v3 = [(ServiceClientContext *)&v8 initWithConfigurationDictionary:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(ServiceClientContext *)v3 clientInterface];
    [v5 setClientIdentifier:@"StoreKitUIService"];
    v6 = +[SUWebViewManager defaultLocalStoragePath];
    [v5 setLocalStoragePath:v6];
  }
  return v4;
}

- (void)getDefaultMetricsControllerWithCompletionBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F898;
  v5[3] = &unk_10004D3C8;
  v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)ServiceClientContext;
  id v3 = v7;
  [(ServiceClientContext *)&v4 getDefaultMetricsControllerWithCompletionBlock:v5];
}

- (NSString)hostApplicationIdentifier
{
  return self->_hostApplicationIdentifier;
}

- (void)setHostApplicationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end