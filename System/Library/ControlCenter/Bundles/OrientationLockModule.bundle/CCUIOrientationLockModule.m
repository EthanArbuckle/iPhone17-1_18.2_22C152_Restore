@interface CCUIOrientationLockModule
- (BOOL)isSelected;
- (CCUIOrientationLockModule)initWithSystemAgent:(id)a3;
- (id)glyphPackageDescription;
- (id)glyphState;
- (id)selectedValueText;
- (id)title;
- (id)valueText;
- (void)_observeSystemNotifications;
- (void)_unobserveSystemNotifications;
- (void)_updateForDarkerSystemColorsChange;
- (void)_updateState;
- (void)dealloc;
- (void)setSelected:(BOOL)a3;
@end

@implementation CCUIOrientationLockModule

- (BOOL)isSelected
{
  return MEMORY[0x270F9A6D0](self->_systemAgent, sel_isOrientationLocked);
}

- (CCUIOrientationLockModule)initWithSystemAgent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCUIOrientationLockModule;
  v6 = [(CCUIOrientationLockModule *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_systemAgent, a3);
    [(CCUIOrientationLockModule *)v7 _observeSystemNotifications];
  }

  return v7;
}

- (void)dealloc
{
  [(CCUIOrientationLockModule *)self _unobserveSystemNotifications];
  v3.receiver = self;
  v3.super_class = (Class)CCUIOrientationLockModule;
  [(CCUIOrientationLockModule *)&v3 dealloc];
}

- (id)title
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v3 = [v2 localizedStringForKey:@"ORIENTATION_LOCK_ORIENTATION" value:&stru_26F4CE840 table:0];

  return v3;
}

- (id)valueText
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v3 = [v2 localizedStringForKey:@"ORIENTATION_LOCK_UNLOCKED" value:&stru_26F4CE840 table:0];

  return v3;
}

- (id)selectedValueText
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v3 = [v2 localizedStringForKey:@"ORIENTATION_LOCK_LOCKED" value:&stru_26F4CE840 table:0];

  return v3;
}

- (id)glyphPackageDescription
{
  BOOL v2 = UIAccessibilityDarkerSystemColorsEnabled();
  objc_super v3 = @"OrientationLock";
  if (v2) {
    objc_super v3 = @"OrientationLock_IC";
  }
  v4 = (void *)MEMORY[0x263F33C68];
  id v5 = (void *)MEMORY[0x263F086E0];
  v6 = v3;
  v7 = [v5 bundleForClass:objc_opt_class()];
  v8 = [v4 descriptionForPackageNamed:v6 inBundle:v7];

  return v8;
}

- (id)glyphState
{
  if ([(CCUIToggleModule *)self appearsSelected]) {
    return @"locked";
  }
  else {
    return @"unlocked";
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CCUIOrientationLockModule *)self isSelected] != a3)
  {
    systemAgent = self->_systemAgent;
    if (v3)
    {
      [(CCUIControlCenterSystemAgent *)systemAgent lockOrientation];
      v6 = [MEMORY[0x263F1C5C0] currentDevice];
      uint64_t v7 = [v6 userInterfaceIdiom];

      if (v7 == 1) {
        v8 = @"CONTROL_CENTER_STATUS_ORIENTATION_LOCK_ON";
      }
      else {
        v8 = @"CONTROL_CENTER_STATUS_PORTAIT_ORIENTATION_LOCK_ON";
      }
      uint64_t v9 = 1;
    }
    else
    {
      [(CCUIControlCenterSystemAgent *)systemAgent unlockOrientation];
      v10 = [MEMORY[0x263F1C5C0] currentDevice];
      uint64_t v11 = [v10 userInterfaceIdiom];

      if (v11 == 1) {
        v8 = @"CONTROL_CENTER_STATUS_ORIENTATION_LOCK_OFF";
      }
      else {
        v8 = @"CONTROL_CENTER_STATUS_PORTAIT_ORIENTATION_LOCK_OFF";
      }
      uint64_t v9 = 2;
    }
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v15 = [v12 localizedStringForKey:v8 value:&stru_26F4CE840 table:0];

    v13 = [(CCUIToggleModule *)self contentModuleContext];
    v14 = [MEMORY[0x263F33CD8] statusUpdateWithMessage:v15 type:v9];
    [v13 enqueueStatusUpdate:v14];
  }
}

- (void)_observeSystemNotifications
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__updateState name:*MEMORY[0x263F796E8] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__updateForDarkerSystemColorsChange name:*MEMORY[0x263F1CDF0] object:0];
}

- (void)_unobserveSystemNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];
}

- (void)_updateForDarkerSystemColorsChange
{
}

- (void)_updateState
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_240697188;
  block[3] = &unk_2650CE4A8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void).cxx_destruct
{
}

@end