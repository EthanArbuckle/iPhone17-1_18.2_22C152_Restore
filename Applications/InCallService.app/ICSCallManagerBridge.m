@interface ICSCallManagerBridge
- (BOOL)isInBackground;
- (ICSCallManagerBridge)init;
- (PHAudioCallViewController)audioCallViewController;
- (TUCall)presentedFullScreenedCall;
- (UINavigationController)audioCallNavController;
- (void)cleanUp;
- (void)createAudioCallViewController;
- (void)prioritizeCall:(id)a3;
- (void)setIsInBackground:(BOOL)a3;
- (void)updateWithCall:(id)a3;
@end

@implementation ICSCallManagerBridge

- (TUCall)presentedFullScreenedCall
{
  v2 = self;
  v3 = sub_1001DF6CC();

  return (TUCall *)v3;
}

- (BOOL)isInBackground
{
  v2 = self;
  sub_1001DF848();
  char v4 = v3;

  return v4 & 1;
}

- (void)setIsInBackground:(BOOL)a3
{
  char v3 = self;
  sub_1001DF8E8();
}

- (PHAudioCallViewController)audioCallViewController
{
  v2 = self;
  char v3 = sub_1001DF984();

  return (PHAudioCallViewController *)v3;
}

- (UINavigationController)audioCallNavController
{
  v2 = self;
  char v3 = (void *)sub_1001DFAD4();

  return (UINavigationController *)v3;
}

- (void)updateWithCall:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001DFE9C();
}

- (void)prioritizeCall:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001DFF40();
}

- (void)cleanUp
{
  v2 = self;
  sub_1001DFFFC();
}

- (void)createAudioCallViewController
{
  v2 = self;
  sub_1001E1CB4();
}

- (ICSCallManagerBridge)init
{
}

- (void).cxx_destruct
{
  sub_1001443AC((uint64_t)self + OBJC_IVAR___ICSCallManagerBridge_inCallRootViewController);
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_unknownObjectWeakDestroy();
}

@end