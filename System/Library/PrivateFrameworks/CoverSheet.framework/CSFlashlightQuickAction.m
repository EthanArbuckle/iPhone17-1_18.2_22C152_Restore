@interface CSFlashlightQuickAction
- (BOOL)_isFlashlightOn;
- (BOOL)allowsInteraction;
- (BOOL)showsButton;
- (BOOL)supportsSelection;
- (CSFlashlightQuickAction)init;
- (CSFlashlightQuickAction)initWithFlashlightController:(id)a3;
- (SBUIFlashlightController)flashlightController;
- (id)accessibilityIdentifier;
- (id)accessoryTitleKey;
- (id)actionIdentifier;
- (id)selectedSymbolName;
- (id)statisticsIdentifier;
- (id)symbolName;
- (id)symbolOnColor;
- (id)unavailableSymbolName;
- (int64_t)appearance;
- (void)fireAction;
- (void)flashlightAvailabilityDidChange:(BOOL)a3;
- (void)flashlightLevelDidChange:(unint64_t)a3;
- (void)setFlashlightController:(id)a3;
- (void)tearDown;
- (void)touchBegan;
- (void)touchEnded;
@end

@implementation CSFlashlightQuickAction

- (void)flashlightAvailabilityDidChange:(BOOL)a3
{
  id v4 = [(CSQuickAction *)self delegate];
  [v4 allowsInteractionDidChangeForAction:self];
}

- (int64_t)appearance
{
  if ([(SBUIFlashlightController *)self->_flashlightController isOverheated]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (BOOL)allowsInteraction
{
  return [(SBUIFlashlightController *)self->_flashlightController isAvailable];
}

- (CSFlashlightQuickAction)init
{
  v3 = [MEMORY[0x1E4FA79B8] sharedInstance];
  id v4 = [(CSFlashlightQuickAction *)self initWithFlashlightController:v3];

  return v4;
}

- (CSFlashlightQuickAction)initWithFlashlightController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSFlashlightQuickAction;
  v6 = [(CSFlashlightQuickAction *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_flashlightController, a3);
    [(SBUIFlashlightController *)v7->_flashlightController addObserver:v7];
  }

  return v7;
}

- (id)actionIdentifier
{
  return @"CSFlashlightQuickAction";
}

- (id)accessibilityIdentifier
{
  return @"flashlight-orb-button";
}

- (id)statisticsIdentifier
{
  return @"flashlight";
}

- (id)accessoryTitleKey
{
  return @"FLASHLIGHT_HINT_TEXT";
}

- (id)symbolName
{
  return @"flashlight.off.fill";
}

- (id)symbolOnColor
{
  return (id)[MEMORY[0x1E4F428B8] systemIndigoColor];
}

- (BOOL)supportsSelection
{
  return 1;
}

- (id)selectedSymbolName
{
  return @"flashlight.on.fill";
}

- (BOOL)showsButton
{
  return [MEMORY[0x1E4FA79B8] deviceSupportsFlashlight];
}

- (id)unavailableSymbolName
{
  return @"flashlight.slash";
}

- (void)touchBegan
{
}

- (void)fireAction
{
  BOOL v3 = [(CSFlashlightQuickAction *)self _isFlashlightOn];
  flashlightController = self->_flashlightController;
  if (v3)
  {
    [(SBUIFlashlightController *)flashlightController turnFlashlightOffForReason:@"Lock Screen Buttons"];
  }
  else
  {
    [(SBUIFlashlightController *)flashlightController turnFlashlightOnForReason:@"Lock Screen Buttons"];
  }
}

- (void)touchEnded
{
  if (![(CSFlashlightQuickAction *)self _isFlashlightOn])
  {
    flashlightController = self->_flashlightController;
    [(SBUIFlashlightController *)flashlightController coolDown];
  }
}

- (void)tearDown
{
  if (![(CSFlashlightQuickAction *)self _isFlashlightOn])
  {
    flashlightController = self->_flashlightController;
    [(SBUIFlashlightController *)flashlightController coolDown];
  }
}

- (BOOL)_isFlashlightOn
{
  return [(SBUIFlashlightController *)self->_flashlightController level] != 0;
}

- (void)flashlightLevelDidChange:(unint64_t)a3
{
  id v4 = [(CSQuickAction *)self delegate];
  [v4 isSelectedDidChangeForAction:self];
}

- (SBUIFlashlightController)flashlightController
{
  return self->_flashlightController;
}

- (void)setFlashlightController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end