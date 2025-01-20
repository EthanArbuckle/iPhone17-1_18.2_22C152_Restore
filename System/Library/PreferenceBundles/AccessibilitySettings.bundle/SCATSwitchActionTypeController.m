@interface SCATSwitchActionTypeController
- (AXSwitch)storedSwitch;
- (SCATSwitchActionTypeController)initWithSwitch:(id)a3;
- (id)actionStringForLongPress:(BOOL)a3;
- (id)controllerForLongPress:(BOOL)a3;
- (void)setStoredSwitch:(id)a3;
@end

@implementation SCATSwitchActionTypeController

- (SCATSwitchActionTypeController)initWithSwitch:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SCATSwitchActionTypeController;
  v5 = [(SCATSwitchActionTypeController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SCATSwitchActionTypeController *)v5 setStoredSwitch:v4];
  }

  return v6;
}

- (id)actionStringForLongPress:(BOOL)a3
{
  id v4 = [(SCATSwitchActionTypeController *)self storedSwitch];
  v5 = v4;
  if (a3) {
    id v6 = [v4 longPressAction];
  }
  else {
    id v6 = [v4 action];
  }
  id v7 = v6;

  if (v7) {
    SCATLocStringForAction();
  }
  else {
  objc_super v8 = AXParameterizedLocalizedString();
  }

  return v8;
}

- (id)controllerForLongPress:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [SCATSwitchActionsController alloc];
  id v6 = [(SCATSwitchActionTypeController *)self storedSwitch];
  id v7 = [(SCATSwitchActionsController *)v5 initWithSwitch:v6];

  [(SCATSwitchActionsController *)v7 setSelectLongPress:v3];

  return v7;
}

- (AXSwitch)storedSwitch
{
  return self->_storedSwitch;
}

- (void)setStoredSwitch:(id)a3
{
}

- (void).cxx_destruct
{
}

@end