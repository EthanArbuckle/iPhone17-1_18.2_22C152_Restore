@interface GKChallengeIssueExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation GKChallengeIssueExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[GKViewServiceInterface challengeIssueServiceViewControllerInterface];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[GKViewServiceInterface challengeIssueHostViewControllerInterface];
}

@end