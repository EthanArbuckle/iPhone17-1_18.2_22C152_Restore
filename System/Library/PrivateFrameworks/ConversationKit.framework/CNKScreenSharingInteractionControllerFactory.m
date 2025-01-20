@interface CNKScreenSharingInteractionControllerFactory
- (CNKScreenSharingInteractionControllerFactory)init;
- (CNKScreenSharingInteractionControllerProtocol)sharedController;
@end

@implementation CNKScreenSharingInteractionControllerFactory

- (CNKScreenSharingInteractionControllerProtocol)sharedController
{
  v2 = self;
  v3 = (void *)static ScreenSharingInteractionController.shared.getter();

  return (CNKScreenSharingInteractionControllerProtocol *)v3;
}

- (CNKScreenSharingInteractionControllerFactory)init
{
  return (CNKScreenSharingInteractionControllerFactory *)CNKScreenSharingInteractionControllerFactory.init()();
}

@end