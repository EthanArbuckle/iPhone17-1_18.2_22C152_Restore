@interface CDPLocalDeviceSecretHandler
- (CDPContext)context;
- (CDPLocalDeviceSecretHandler)initWithContext:(id)a3 handler:(id)a4;
- (void)userDidCancelWithError:(id)a3;
- (void)userDidEnterValidSecret:(id)a3 type:(unint64_t)a4;
@end

@implementation CDPLocalDeviceSecretHandler

- (CDPLocalDeviceSecretHandler)initWithContext:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(CDPLocalDeviceSecretHandler *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_handlerProxy, a4);
  }

  return v10;
}

- (void)userDidEnterValidSecret:(id)a3 type:(unint64_t)a4
{
}

- (void)userDidCancelWithError:(id)a3
{
}

- (CDPContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_handlerProxy, 0);
}

@end