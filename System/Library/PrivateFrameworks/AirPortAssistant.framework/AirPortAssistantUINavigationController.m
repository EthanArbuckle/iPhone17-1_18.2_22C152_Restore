@interface AirPortAssistantUINavigationController
- (BOOL)disablesAutomaticKeyboardDismissal;
- (BOOL)shouldAutorotate;
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation AirPortAssistantUINavigationController

- (BOOL)disablesAutomaticKeyboardDismissal
{
  return 0;
}

- (BOOL)shouldAutorotate
{
  v4 = objc_msgSend_currentDevice(MEMORY[0x263F1C5C0], a2, v2);
  return objc_msgSend_userInterfaceIdiom(v4, v5, v6) == 1 && sub_22690522C(self, v7, v8) == 2;
}

- (unint64_t)supportedInterfaceOrientations
{
  v4 = objc_msgSend_currentDevice(MEMORY[0x263F1C5C0], a2, v2);
  if (objc_msgSend_userInterfaceIdiom(v4, v5, v6) == 1 && sub_22690522C(self, v7, v8) == 2) {
    return 30;
  }
  else {
    return 2;
  }
}

@end