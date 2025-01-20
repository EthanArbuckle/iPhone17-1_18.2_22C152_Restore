@interface RPBroadcastActivityExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)extensionObjectProxy;
@end

@implementation RPBroadcastActivityExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPBroadcastActivityCommunicationProtocol];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPBroadcastActivityCommunicationHostProtocol];
}

- (id)extensionObjectProxy
{
  v2 = [(RPBroadcastActivityExtensionContext *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&stru_10000C720];

  return v3;
}

@end