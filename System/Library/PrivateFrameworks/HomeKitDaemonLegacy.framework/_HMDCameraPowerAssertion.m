@interface _HMDCameraPowerAssertion
- (HMDCameraPowerAssertionHandler)assertionHandler;
- (HMDCameraSessionID)remoteRequestHandlerSessionID;
- (_HMDCameraPowerAssertion)initWithPowerAssertionHandler:(id)a3 remoteRequestHandlerSessionID:(id)a4;
- (void)dealloc;
@end

@implementation _HMDCameraPowerAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteRequestHandlerSessionID, 0);
  objc_destroyWeak((id *)&self->_assertionHandler);
}

- (HMDCameraSessionID)remoteRequestHandlerSessionID
{
  return self->_remoteRequestHandlerSessionID;
}

- (HMDCameraPowerAssertionHandler)assertionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assertionHandler);
  return (HMDCameraPowerAssertionHandler *)WeakRetained;
}

- (void)dealloc
{
  v3 = [(_HMDCameraPowerAssertion *)self assertionHandler];
  v4 = [(_HMDCameraPowerAssertion *)self remoteRequestHandlerSessionID];
  [v3 deregisterRemoteRequestHandler:v4];

  v5.receiver = self;
  v5.super_class = (Class)_HMDCameraPowerAssertion;
  [(_HMDCameraPowerAssertion *)&v5 dealloc];
}

- (_HMDCameraPowerAssertion)initWithPowerAssertionHandler:(id)a3 remoteRequestHandlerSessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_HMDCameraPowerAssertion;
  v8 = [(_HMDCameraPowerAssertion *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_assertionHandler, v6);
    objc_storeStrong((id *)&v9->_remoteRequestHandlerSessionID, a4);
  }

  return v9;
}

@end