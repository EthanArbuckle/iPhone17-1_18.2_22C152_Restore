@interface CCUIWalletModule
- (CCUIWalletModule)initWithSystemAgent:(id)a3;
- (void)handleTapWithTouchType:(int64_t)a3;
@end

@implementation CCUIWalletModule

- (CCUIWalletModule)initWithSystemAgent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCUIWalletModule;
  v6 = [(CCUIAppLauncherModule *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_systemAgent, a3);
  }

  return v7;
}

- (void)handleTapWithTouchType:(int64_t)a3
{
  uint64_t v5 = [(CCUIControlCenterSystemAgent *)self->_systemAgent isUILocked];
  if ([MEMORY[0x263F5BF80] contactlessInterfaceCanBePresentedFromSource:2 deviceUILocked:v5])
  {
    id v7 = [MEMORY[0x263F5BF80] sharedInstance];
    v6 = [(CCUIAppLauncherModule *)self contentModuleContext];
    [v6 dismissControlCenter];
    [v7 presentContactlessInterfaceForDefaultPassFromSource:2 completion:0];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CCUIWalletModule;
    [(CCUIAppLauncherModule *)&v8 handleTapWithTouchType:a3];
  }
}

- (void).cxx_destruct
{
}

@end