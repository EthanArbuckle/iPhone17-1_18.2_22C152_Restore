@interface ASOHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)serviceContext;
- (void)dismissOverlayWithReply:(id)a3;
- (void)presentOverlayWithConfiguration:(id)a3 delegate:(id)a4 reply:(id)a5;
@end

@implementation ASOHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (qword_10002CAB0 != -1) {
    dispatch_once(&qword_10002CAB0, &stru_100024D10);
  }
  v2 = (void *)qword_10002CAB8;

  return v2;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_10002CAC0 != -1) {
    dispatch_once(&qword_10002CAC0, &stru_100024D30);
  }
  v2 = (void *)qword_10002CAC8;

  return v2;
}

- (id)serviceContext
{
  v2 = [(ASOHostContext *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxy];

  return v3;
}

- (void)presentOverlayWithConfiguration:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ASOHostContext *)self serviceContext];
  [v11 presentOverlayWithConfiguration:v10 delegate:v9 reply:v8];
}

- (void)dismissOverlayWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(ASOHostContext *)self serviceContext];
  [v5 dismissOverlayWithReply:v4];
}

@end