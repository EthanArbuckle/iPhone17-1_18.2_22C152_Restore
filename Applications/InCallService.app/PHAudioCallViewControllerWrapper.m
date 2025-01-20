@interface PHAudioCallViewControllerWrapper
- (ICSCallDisplayStyleHandler)viewController;
- (PHAudioCallViewControllerWrapper)init;
- (PHAudioCallViewControllerWrapper)initWithCallDisplayStyleManager:(id)a3 callCenter:(id)a4 width:(double)a5 inCallRootViewController:(id)a6;
@end

@implementation PHAudioCallViewControllerWrapper

- (ICSCallDisplayStyleHandler)viewController
{
  id v2 = sub_10017D408();

  return (ICSCallDisplayStyleHandler *)v2;
}

- (PHAudioCallViewControllerWrapper)initWithCallDisplayStyleManager:(id)a3 callCenter:(id)a4 width:(double)a5 inCallRootViewController:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  return (PHAudioCallViewControllerWrapper *)sub_10017D418(v8, v9, a5);
}

- (PHAudioCallViewControllerWrapper)init
{
}

- (void).cxx_destruct
{
}

@end