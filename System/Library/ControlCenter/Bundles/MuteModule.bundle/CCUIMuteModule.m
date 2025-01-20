@interface CCUIMuteModule
- (BOOL)isSelected;
- (CCUIMuteModule)initWithSystemAgent:(id)a3;
- (id)glyphPackageDescription;
- (id)glyphState;
- (id)selectedValueText;
- (id)valueText;
- (void)_observeSystemNotifications;
- (void)_unobserveSystemNotifications;
- (void)_updateForDarkerSystemColorsChange;
- (void)_updateState;
- (void)dealloc;
- (void)setSelected:(BOOL)a3;
@end

@implementation CCUIMuteModule

- (CCUIMuteModule)initWithSystemAgent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCUIMuteModule;
  v6 = [(CCUIMuteModule *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_systemAgent, a3);
    [(CCUIMuteModule *)v7 _observeSystemNotifications];
  }

  return v7;
}

- (void)dealloc
{
  [(CCUIMuteModule *)self _unobserveSystemNotifications];
  v3.receiver = self;
  v3.super_class = (Class)CCUIMuteModule;
  [(CCUIMuteModule *)&v3 dealloc];
}

- (id)valueText
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v3 = [v2 localizedStringForKey:@"RING" value:&stru_26F4CE078 table:0];

  return v3;
}

- (id)selectedValueText
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v3 = [v2 localizedStringForKey:@"SILENT" value:&stru_26F4CE078 table:0];

  return v3;
}

- (id)glyphPackageDescription
{
  BOOL v2 = UIAccessibilityDarkerSystemColorsEnabled();
  objc_super v3 = @"Mute";
  if (v2) {
    objc_super v3 = @"Mute_IC";
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
    return @"silent";
  }
  else {
    return @"ringer";
  }
}

- (BOOL)isSelected
{
  return MEMORY[0x270F9A6D0](self->_systemAgent, sel_isRingerMuted);
}

- (void)setSelected:(BOOL)a3
{
  if ([(CCUIMuteModule *)self isSelected] != a3)
  {
    systemAgent = self->_systemAgent;
    MEMORY[0x270F9A6D0](systemAgent, sel_setRingerMuted_reason_);
  }
}

- (void)_updateState
{
  BOOL v3 = [(CCUIMuteModule *)self isSelected];
  if (v3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  if (v3) {
    id v5 = @"CONTROL_CENTER_STATUS_MUTE_ON";
  }
  else {
    id v5 = @"CONTROL_CENTER_STATUS_MUTE_OFF";
  }
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:v5 value:&stru_26F4CE078 table:0];

  v8 = [(CCUIToggleModule *)self contentModuleContext];
  objc_super v9 = [MEMORY[0x263F33CD8] statusUpdateWithMessage:v7 type:v4];
  [v8 enqueueStatusUpdate:v9];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_240693F8C;
  block[3] = &unk_2650CE2F0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)_observeSystemNotifications
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__updateForDarkerSystemColorsChange name:*MEMORY[0x263F1CDF0] object:0];

  objc_initWeak(&location, self);
  systemAgent = self->_systemAgent;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2406940BC;
  v7[3] = &unk_2650CE318;
  objc_copyWeak(&v8, &location);
  id v5 = [(CCUIControlCenterSystemAgent *)systemAgent observeRingerMutedWithBlock:v7];
  observerToken = self->_observerToken;
  self->_observerToken = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_unobserveSystemNotifications
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1CDF0] object:0];

  observerToken = self->_observerToken;

  MEMORY[0x270F9A6D0](observerToken, sel_invalidate);
}

- (void)_updateForDarkerSystemColorsChange
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerToken, 0);

  objc_storeStrong((id *)&self->_systemAgent, 0);
}

@end