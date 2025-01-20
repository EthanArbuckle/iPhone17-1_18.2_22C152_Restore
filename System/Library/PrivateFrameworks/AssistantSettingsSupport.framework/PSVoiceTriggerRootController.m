@interface PSVoiceTriggerRootController
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation PSVoiceTriggerRootController

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  if (objc_msgSend(v2, "sf_isiPad")) {
    unint64_t v3 = 30;
  }
  else {
    unint64_t v3 = 2;
  }

  return v3;
}

@end