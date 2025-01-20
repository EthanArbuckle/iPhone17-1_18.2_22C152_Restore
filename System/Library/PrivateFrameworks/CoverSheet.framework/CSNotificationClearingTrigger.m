@interface CSNotificationClearingTrigger
- (BOOL)_shouldArm;
- (BOOL)_shouldFire;
- (BOOL)_wouldArmForDiscreteParameters;
- (BOOL)_wouldArmIfNotForDND;
- (BOOL)_wouldArmIfNotForDNDAndNotificationContent;
- (BOOL)authenticated;
- (BOOL)didDisableCarDNDUntilEndOfDrive;
- (BOOL)hadNotificationContentAtDisappearance;
- (BOOL)screenInactive;
- (BOOL)screenOff;
- (BOOL)triggerArmed;
- (BOOL)uiLocked;
- (CSNotificationClearingTrigger)initWithDelegate:(id)a3;
- (CSNotificationClearingTriggerDelegate)delegate;
- (void)_clearIfNeeded;
- (void)_reset;
- (void)_updateTriggerAndClearIfNeeded;
- (void)setAuthenticated:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDidDisableCarDNDUntilEndOfDrive:(BOOL)a3;
- (void)setHadNotificationContentAtDisappearance:(BOOL)a3;
- (void)setScreenInactive:(BOOL)a3;
- (void)setScreenOff:(BOOL)a3;
- (void)setTriggerArmed:(BOOL)a3;
- (void)setUiLocked:(BOOL)a3;
@end

@implementation CSNotificationClearingTrigger

- (CSNotificationClearingTrigger)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSNotificationClearingTrigger;
  v5 = [(CSNotificationClearingTrigger *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_authenticated = 0;
    v6->_uiLocked = 1;
  }

  return v6;
}

- (void)setAuthenticated:(BOOL)a3
{
  if (self->_authenticated != a3)
  {
    self->_authenticated = a3;
    [(CSNotificationClearingTrigger *)self _updateTriggerAndClearIfNeeded];
  }
}

- (void)setDidDisableCarDNDUntilEndOfDrive:(BOOL)a3
{
  if (self->_didDisableCarDNDUntilEndOfDrive != a3)
  {
    self->_didDisableCarDNDUntilEndOfDrive = a3;
    [(CSNotificationClearingTrigger *)self _updateTriggerAndClearIfNeeded];
  }
}

- (void)setHadNotificationContentAtDisappearance:(BOOL)a3
{
  if (self->_hadNotificationContentAtDisappearance != a3)
  {
    self->_hadNotificationContentAtDisappearance = a3;
    [(CSNotificationClearingTrigger *)self _updateTriggerAndClearIfNeeded];
  }
}

- (void)setUiLocked:(BOOL)a3
{
  if (self->_uiLocked != a3)
  {
    self->_uiLocked = a3;
    [(CSNotificationClearingTrigger *)self _updateTriggerAndClearIfNeeded];
  }
}

- (void)setScreenOff:(BOOL)a3
{
  if (self->_screenOff != a3)
  {
    self->_screenOff = a3;
    [(CSNotificationClearingTrigger *)self _updateTriggerAndClearIfNeeded];
  }
}

- (void)setScreenInactive:(BOOL)a3
{
  if (self->_screenInactive != a3)
  {
    self->_screenInactive = a3;
    [(CSNotificationClearingTrigger *)self _updateTriggerAndClearIfNeeded];
  }
}

- (void)_reset
{
  self->_didDisableCarDNDUntilEndOfDrive = 0;
}

- (void)_updateTriggerAndClearIfNeeded
{
  if ([(CSNotificationClearingTrigger *)self _shouldArm])
  {
    [(CSNotificationClearingTrigger *)self setTriggerArmed:1];
  }
  else if ([(CSNotificationClearingTrigger *)self _wouldArmIfNotForDND] {
         || [(CSNotificationClearingTrigger *)self _wouldArmIfNotForDNDAndNotificationContent])
  }
  {
    self->_didDisableCarDNDUntilEndOfDrive = 0;
  }

  [(CSNotificationClearingTrigger *)self _clearIfNeeded];
}

- (BOOL)_shouldArm
{
  BOOL v3 = [(CSNotificationClearingTrigger *)self _wouldArmForDiscreteParameters];
  if (v3) {
    LOBYTE(v3) = ![(CSNotificationClearingTrigger *)self didDisableCarDNDUntilEndOfDrive];
  }
  return v3;
}

- (BOOL)_wouldArmIfNotForDND
{
  if (![(CSNotificationClearingTrigger *)self _wouldArmForDiscreteParameters]
    || ![(CSNotificationClearingTrigger *)self hadNotificationContentAtDisappearance])
  {
    return 0;
  }

  return [(CSNotificationClearingTrigger *)self didDisableCarDNDUntilEndOfDrive];
}

- (BOOL)_wouldArmIfNotForDNDAndNotificationContent
{
  if (![(CSNotificationClearingTrigger *)self _wouldArmForDiscreteParameters]
    || [(CSNotificationClearingTrigger *)self hadNotificationContentAtDisappearance])
  {
    return 0;
  }

  return [(CSNotificationClearingTrigger *)self didDisableCarDNDUntilEndOfDrive];
}

- (BOOL)_wouldArmForDiscreteParameters
{
  if ([(CSNotificationClearingTrigger *)self screenOff])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    BOOL v3 = [(CSNotificationClearingTrigger *)self authenticated];
    if (v3) {
      LOBYTE(v3) = ![(CSNotificationClearingTrigger *)self uiLocked];
    }
  }
  return v3;
}

- (BOOL)_shouldFire
{
  if ([(CSNotificationClearingTrigger *)self uiLocked]) {
    char v3 = 0;
  }
  else {
    char v3 = ![(CSNotificationClearingTrigger *)self screenInactive];
  }
  if (![(CSNotificationClearingTrigger *)self screenOff] || (v3 & 1) != 0) {
    return 0;
  }

  return [(CSNotificationClearingTrigger *)self triggerArmed];
}

- (void)_clearIfNeeded
{
  if ([(CSNotificationClearingTrigger *)self _shouldFire])
  {
    id v3 = [(CSNotificationClearingTrigger *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v3 coverSheetNotificationClearingTriggerDidFire:self];
    }
    [(CSNotificationClearingTrigger *)self _reset];
  }
}

- (CSNotificationClearingTriggerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSNotificationClearingTriggerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (BOOL)hadNotificationContentAtDisappearance
{
  return self->_hadNotificationContentAtDisappearance;
}

- (BOOL)didDisableCarDNDUntilEndOfDrive
{
  return self->_didDisableCarDNDUntilEndOfDrive;
}

- (BOOL)uiLocked
{
  return self->_uiLocked;
}

- (BOOL)screenOff
{
  return self->_screenOff;
}

- (BOOL)screenInactive
{
  return self->_screenInactive;
}

- (BOOL)triggerArmed
{
  return self->_triggerArmed;
}

- (void)setTriggerArmed:(BOOL)a3
{
  self->_triggerArmed = a3;
}

- (void).cxx_destruct
{
}

@end