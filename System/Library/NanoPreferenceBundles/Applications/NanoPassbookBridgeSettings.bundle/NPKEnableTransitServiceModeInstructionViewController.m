@interface NPKEnableTransitServiceModeInstructionViewController
- (id)_instructionMessage;
- (id)_instructionTitle;
- (id)_unlockRequiredMessage;
- (id)_unlockRequiredTitle;
- (void)handleEnableServiceModeUnlockRequired;
@end

@implementation NPKEnableTransitServiceModeInstructionViewController

- (id)_instructionTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"SERVICE_MODE_INSTRUCTION_ENABLE_TITLE" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];

  return v3;
}

- (id)_instructionMessage
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"SERVICE_MODE_INSTRUCTION_ENABLE_MESSAGE" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];

  return v3;
}

- (void)handleEnableServiceModeUnlockRequired
{
  id v6 = [(NPKEnableTransitServiceModeInstructionViewController *)self _unlockRequiredTitle];
  v3 = [(NPKEnableTransitServiceModeInstructionViewController *)self _unlockRequiredMessage];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"EXPRESS_TRANSIT_ERROR_ACKNOWLEDGE_BUTTON_TITLE" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];
  [(NPKBridgeInstructionViewController *)self handleErrorWithTitle:v6 message:v3 acknowledgeButtonTitle:v5];
}

- (id)_unlockRequiredTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"UNLOCK_REQUIRED_ALERT_TITLE" value:&stru_2D2E8 table:@"NanoPassKit"];

  return v3;
}

- (id)_unlockRequiredMessage
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"UNLOCK_REQUIRED_ALERT_MESSAGE" value:&stru_2D2E8 table:@"NanoPassKit"];

  return v3;
}

@end