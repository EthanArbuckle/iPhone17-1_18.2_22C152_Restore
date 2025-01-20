@interface GKAuthenticateExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation GKAuthenticateExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[GKViewServiceInterface signInServiceViewControllerInterface];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[GKViewServiceInterface remoteSignInViewControllerInterface];
}

@end