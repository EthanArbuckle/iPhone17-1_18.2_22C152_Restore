@interface TKTokenDriverHostContext
+ (id)_allowedItemPayloadClasses;
- (NSError)error;
- (TKHostTokenDriver)driver;
- (TKHostTokenRegistry)registry;
- (TKTokenDriverProtocol)tokenDriverProtocol;
- (void)getTokenConfigurationEndpointWithReply:(id)a3;
- (void)setDriver:(id)a3;
- (void)setError:(id)a3;
- (void)setRegistry:(id)a3;
@end

@implementation TKTokenDriverHostContext

+ (id)_allowedItemPayloadClasses
{
  if (qword_1000280A0 != -1) {
    dispatch_once(&qword_1000280A0, &stru_1000209B8);
  }
  v2 = (void *)qword_100028098;

  return v2;
}

- (void)getTokenConfigurationEndpointWithReply:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  v6 = [(TKTokenDriverHostContext *)self registry];
  id v10 = v6;
  if (!v6)
  {
    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"TKHostTokenDriver.m" lineNumber:38 description:@"Driver context does not have registry set"];

    v6 = 0;
  }
  v7 = [v6 listener];
  v8 = [v7 endpoint];
  v5[2](v5, v8);
}

- (TKTokenDriverProtocol)tokenDriverProtocol
{
  [(TKTokenDriverHostContext *)self setError:0];
  v3 = [(TKTokenDriverHostContext *)self _auxiliaryConnection];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000112C0;
  v6[3] = &unk_1000208A8;
  v6[4] = self;
  v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v6];

  return (TKTokenDriverProtocol *)v4;
}

- (TKHostTokenDriver)driver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_driver);

  return (TKHostTokenDriver *)WeakRetained;
}

- (void)setDriver:(id)a3
{
}

- (TKHostTokenRegistry)registry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);

  return (TKHostTokenRegistry *)WeakRetained;
}

- (void)setRegistry:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_registry);

  objc_destroyWeak((id *)&self->_driver);
}

@end