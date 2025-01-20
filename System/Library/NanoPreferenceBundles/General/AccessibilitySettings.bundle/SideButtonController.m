@interface SideButtonController
- (NSIndexPath)selectedIndexPath;
- (NSTimer)flashTimer;
- (NSTimer)vibrationTimer;
- (double)_sideButtonDoubleTapInterval;
- (double)_sideClickSpeedFromSpecifierKey:(id)a3;
- (id)_vibrationPattern;
- (id)specifiers;
- (int64_t)flashCount;
- (void)_flashSelectedRow;
- (void)_updateCheckedStatusForCell:(id)a3;
- (void)_vibrateSelectedRow;
- (void)setFlashCount:(int64_t)a3;
- (void)setFlashTimer:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setVibrationTimer:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation SideButtonController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa + v3))
  {
    v4 = [(SideButtonController *)self loadSpecifiersFromPlistName:@"SideButtonSettings" target:self];
    v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v4;

    if (AXActivePairedDeviceIsLighthouseOrLater())
    {
      v6 = settingsLocString(@"BUTTON_CLICK_TITLE", @"SideButtonSettings");
      [(SideButtonController *)self setTitle:v6];

      v7 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v3) specifierForID:@"CLICK_SPEED_GROUP_CELL"];
      v8 = settingsLocString(@"BUTTON_CLICK_INSTRUCTIONS", @"SideButtonSettings");
      [v7 setProperty:v8 forKey:*MEMORY[0x263F600F8]];
    }
  }
  v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)SideButtonController;
  [(SideButtonController *)&v28 tableView:v6 didSelectRowAtIndexPath:v7];
  v27.receiver = self;
  v27.super_class = (Class)SideButtonController;
  v8 = [(SideButtonController *)&v27 tableView:v6 cellForRowAtIndexPath:v7];
  v9 = [v8 specifier];
  v10 = [v9 propertyForKey:*MEMORY[0x263F60170]];
  [(SideButtonController *)self _sideClickSpeedFromSpecifierKey:v10];
  double v12 = v11;

  v13 = [NSNumber numberWithDouble:v12];
  [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v13 forKey:@"SideButtonDoubleTapInterval"];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v14 = objc_msgSend(v6, "visibleCells", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        [(SideButtonController *)self _updateCheckedStatusForCell:*(void *)(*((void *)&v23 + 1) + 8 * v18++)];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v16);
  }

  [v8 setChecked:1];
  [(SideButtonController *)self setSelectedIndexPath:v7];
  AudioServicesStopSystemSound();
  v19 = [(SideButtonController *)self vibrationTimer];
  [v19 invalidate];

  v20 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__vibrateSelectedRow selector:0 userInfo:0 repeats:0.649999976];
  [(SideButtonController *)self setVibrationTimer:v20];

  [(SideButtonController *)self setFlashCount:0];
  v21 = [(SideButtonController *)self flashTimer];
  [v21 invalidate];

  v22 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__flashSelectedRow selector:0 userInfo:0 repeats:0.699999988];
  [(SideButtonController *)self setFlashTimer:v22];
}

- (void)_updateCheckedStatusForCell:(id)a3
{
  id v9 = a3;
  v4 = [v9 specifier];
  v5 = [v4 propertyForKey:*MEMORY[0x263F60170]];
  [(SideButtonController *)self _sideClickSpeedFromSpecifierKey:v5];
  float v7 = v6;

  [(SideButtonController *)self _sideButtonDoubleTapInterval];
  objc_msgSend(v9, "setChecked:", vabdd_f64(v7, v8) < 0.00999999978);
}

- (double)_sideButtonDoubleTapInterval
{
  v2 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  [v2 doubleForKey:@"SideButtonDoubleTapInterval"];
  double v4 = v3;

  double result = *MEMORY[0x263F212B8];
  if (v4 >= *MEMORY[0x263F212B8]) {
    return v4;
  }
  return result;
}

- (double)_sideClickSpeedFromSpecifierKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"sideClickSpeedSlowest"])
  {
    double v4 = (double *)MEMORY[0x263F212C8];
  }
  else if ([v3 isEqualToString:@"sideClickSpeedSlow"])
  {
    double v4 = (double *)MEMORY[0x263F212C0];
  }
  else
  {
    if (([v3 isEqualToString:@"sideClickSpeedDefault"] & 1) == 0) {
      _AXAssert();
    }
    double v4 = (double *)MEMORY[0x263F212B8];
  }
  double v5 = *v4;

  return v5;
}

- (id)_vibrationPattern
{
  v14[2] = *MEMORY[0x263EF8340];
  v2 = NSNumber;
  [(SideButtonController *)self _sideButtonDoubleTapInterval];
  id v3 = (double *)MEMORY[0x263F212B8];
  double v5 = (v4 - *MEMORY[0x263F212B8] * 0.5) * 1000.0;
  *(float *)&double v5 = v5;
  double v6 = [v2 numberWithFloat:v5];
  double v7 = *v3 * 1000.0 * 0.5;
  *(float *)&double v7 = v7;
  double v8 = [NSNumber numberWithFloat:v7];
  v13[0] = @"Intensity";
  v13[1] = @"VibePattern";
  v14[0] = &unk_26FB00508;
  v12[0] = MEMORY[0x263EFFA88];
  v12[1] = v8;
  v12[2] = MEMORY[0x263EFFA80];
  v12[3] = v6;
  v12[4] = MEMORY[0x263EFFA88];
  v12[5] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:6];
  v14[1] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v10;
}

- (void)_flashSelectedRow
{
  id v7 = [(SideButtonController *)self table];
  id v3 = [(SideButtonController *)self selectedIndexPath];
  [v7 selectRowAtIndexPath:v3 animated:0 scrollPosition:0];
  [v7 deselectRowAtIndexPath:v3 animated:0];
  [(SideButtonController *)self setFlashCount:[(SideButtonController *)self flashCount] + 1];
  double v4 = [(SideButtonController *)self flashTimer];
  [v4 invalidate];

  if ([(SideButtonController *)self flashCount] > 1)
  {
    [(SideButtonController *)self setFlashTimer:0];
  }
  else
  {
    double v5 = (void *)MEMORY[0x263EFFA20];
    [(SideButtonController *)self _sideButtonDoubleTapInterval];
    double v6 = objc_msgSend(v5, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__flashSelectedRow, 0, 0);
    [(SideButtonController *)self setFlashTimer:v6];
  }
}

- (void)_vibrateSelectedRow
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263EFC110];
  v2 = [(SideButtonController *)self _vibrationPattern];
  v4[0] = v2;
  [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  AudioServicesPlaySystemSoundWithOptions();
}

- (int64_t)flashCount
{
  return self->_flashCount;
}

- (void)setFlashCount:(int64_t)a3
{
  self->_flashCount = a3;
}

- (NSTimer)flashTimer
{
  return self->_flashTimer;
}

- (void)setFlashTimer:(id)a3
{
}

- (NSTimer)vibrationTimer
{
  return self->_vibrationTimer;
}

- (void)setVibrationTimer:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_vibrationTimer, 0);

  objc_storeStrong((id *)&self->_flashTimer, 0);
}

@end