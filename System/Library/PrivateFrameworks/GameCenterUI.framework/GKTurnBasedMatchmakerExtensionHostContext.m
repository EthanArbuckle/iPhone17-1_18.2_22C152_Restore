@interface GKTurnBasedMatchmakerExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation GKTurnBasedMatchmakerExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[GKViewServiceInterface turnBasedServiceViewControllerInterface];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[GKViewServiceInterface turnBasedHostViewControllerInterface];
}

@end