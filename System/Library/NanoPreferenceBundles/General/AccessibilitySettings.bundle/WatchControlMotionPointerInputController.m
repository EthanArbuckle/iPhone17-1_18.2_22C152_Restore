@interface WatchControlMotionPointerInputController
- (BOOL)canShowAction:(unint64_t)a3 forDetailController:(id)a4;
- (BOOL)canShowActionGroup:(unint64_t)a3 forDetailController:(id)a4;
- (double)maximumValueForSpecifier:(id)a3;
- (double)minimumValueForSpecifier:(id)a3;
- (double)stepValueForSpecifier:(id)a3;
- (double)valueForSpecifier:(id)a3;
- (id)_actionValueForSpecifier:(id)a3;
- (id)enableInputSourceSpecifiers;
- (id)inputSourceCustomizationSpecifiers;
- (id)motionPointerSensitivity;
- (id)stringValueForSpecifier:(id)a3;
- (unint64_t)selectedActionForDetailController:(id)a3;
- (void)resetMotionPointerEdgeCustomizations;
- (void)setAction:(unint64_t)a3 forDetailController:(id)a4;
- (void)setMotionPointerSensitivity:(id)a3;
- (void)specifier:(id)a3 setValue:(double)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation WatchControlMotionPointerInputController

- (id)enableInputSourceSpecifiers
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)inputSourceCustomizationSpecifiers
{
  v75[4] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  unint64_t v4 = 0x263F5F000uLL;
  v5 = (void *)MEMORY[0x263F5FC40];
  v6 = settingsLocString(@"WATCH_CONTROL_MOTION_POINTER_SENSITIVITY", @"AccessibilitySettings-watchcontrol");
  v7 = [v5 groupSpecifierWithName:v6];
  [v3 addObject:v7];

  v8 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:sel_setMotionPointerSensitivity_ get:sel_motionPointerSensitivity detail:0 cell:5 edit:0];
  uint64_t v9 = MEMORY[0x263EFFA88];
  [v8 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60238]];
  v10 = NSNumber;
  v11 = [MEMORY[0x263F85B10] sharedInstance];
  [v11 motionPointerSensitivityMin];
  v12 = objc_msgSend(v10, "numberWithFloat:");
  [v8 setProperty:v12 forKey:*MEMORY[0x263F60038]];

  v13 = NSNumber;
  v14 = [MEMORY[0x263F85B10] sharedInstance];
  [v14 motionPointerSensitivityMax];
  v15 = objc_msgSend(v13, "numberWithFloat:");
  [v8 setProperty:v15 forKey:*MEMORY[0x263F60030]];

  v16 = AXTortoiseImage();
  [v8 setProperty:v16 forKey:*MEMORY[0x263F60240]];

  v17 = AXHareImage();
  [v8 setProperty:v17 forKey:*MEMORY[0x263F60250]];

  v69 = v8;
  [v3 addObject:v8];
  v18 = (void *)MEMORY[0x263F5FC40];
  v19 = settingsLocString(@"WATCH_CONTROL_MOTION_POINTER_ACTIVATION_DURATION", @"AccessibilitySettings-watchcontrol");
  v20 = [v18 groupSpecifierWithName:v19];
  [v3 addObject:v20];

  v21 = objc_msgSend(MEMORY[0x263F5FC40], "ax_stepperSpecifierWithDelegate:", self);
  [v21 setIdentifier:@"ActivationDurationSpecifier"];
  v68 = v21;
  [v3 addObject:v21];
  v22 = (void *)MEMORY[0x263F5FC40];
  v23 = settingsLocString(@"WATCH_CONTROL_MOTION_POINTER_MOVEMENT_TOLERANCE", @"AccessibilitySettings-watchcontrol");
  v24 = [v22 groupSpecifierWithName:v23];

  uint64_t v25 = v9;
  v26 = v3;
  [v24 setProperty:v25 forKey:*MEMORY[0x263F60168]];
  v70 = v24;
  [v3 addObject:v24];
  v27 = [MEMORY[0x263F85B10] sharedInstance];
  uint64_t v28 = [v27 motionPointerMovementTolerance];

  v29 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = *MEMORY[0x263F60308];
  do
  {
    v32 = (void *)MEMORY[0x263F5FC40];
    v33 = WCNameForMotionPointerMovementTolerance();
    v34 = [v32 preferenceSpecifierNamed:v33 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    v35 = [NSNumber numberWithUnsignedInteger:v30];
    [v34 setProperty:v35 forKey:v31];

    [v26 addObject:v34];
    if (v28 == v30)
    {
      id v36 = v34;

      v29 = v36;
    }

    ++v30;
  }
  while (v30 != 3);
  v67 = v29;
  [v70 setProperty:v29 forKey:*MEMORY[0x263F60200]];
  v37 = (void *)MEMORY[0x263F5FC40];
  v38 = settingsLocString(@"WATCH_CONTROL_MOTION_POINTER_EDGE_BEHAVIOR_TITLE", @"AccessibilitySettings-watchcontrol");
  v39 = [v37 preferenceSpecifierNamed:v38 target:self set:0 get:0 detail:0 cell:0 edit:0];
  [v26 addObject:v39];

  v40 = [MEMORY[0x263F85B10] sharedInstance];
  v72 = [v40 motionPointerEdgeActionCustomizations];

  uint64_t v41 = 0;
  uint64_t v71 = v31;
  do
  {
    v42 = [NSNumber numberWithInteger:v41];
    v43 = [v72 objectForKeyedSubscript:v42];
    uint64_t v44 = [v43 unsignedIntegerValue];

    v45 = *(void **)(v4 + 3136);
    v46 = WCNameForMotionPointerEdge();
    v47 = [v45 preferenceSpecifierNamed:v46 target:self set:0 get:sel__actionValueForSpecifier_ detail:objc_opt_class() cell:2 edit:0];

    v48 = WCNameForAction();
    [v47 setProperty:v48 forKey:v71];

    v74[0] = @"MotionPointerEdge";
    v49 = [NSNumber numberWithInteger:v41];
    v75[0] = v49;
    v74[1] = @"Action";
    v50 = [NSNumber numberWithUnsignedInteger:v44];
    v75[1] = v50;
    v75[2] = self;
    v74[2] = @"ActionDetailDelegate";
    v74[3] = @"AdditionalActions";
    unint64_t v51 = v4;
    v52 = self;
    v53 = v26;
    v54 = [NSNumber numberWithUnsignedInteger:WCDefaultActionForMotionPointerEdge()];
    v73 = v54;
    v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v73 count:1];
    v75[3] = v55;
    v56 = [NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:4];
    [v47 setUserInfo:v56];

    v26 = v53;
    self = v52;
    unint64_t v4 = v51;

    [v26 addObject:v47];
    ++v41;
  }
  while (v41 != 4);
  v57 = [*(id *)(v51 + 3136) emptyGroupSpecifier];
  [v26 addObject:v57];

  v58 = *(void **)(v51 + 3136);
  v59 = settingsLocString(@"WATCH_CONTROL_MOTION_POINTER_EDGE_RESET_CUSTOMIZATIONS", @"AccessibilitySettings-watchcontrol");
  v60 = [v58 preferenceSpecifierNamed:v59 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v60 setButtonAction:sel_resetMotionPointerEdgeCustomizations];
  [v26 addObject:v60];
  v61 = [*(id *)(v4 + 3136) emptyGroupSpecifier];
  [v26 addObject:v61];

  v62 = *(void **)(v4 + 3136);
  v63 = settingsLocString(@"WATCH_CONTROL_DWELL_CONTROL_TITLE", @"AccessibilitySettings-watchcontrol");
  v64 = [v62 preferenceSpecifierNamed:v63 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
  [v26 addObject:v64];

  id v65 = v26;
  return v65;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)WatchControlMotionPointerInputController;
  id v6 = a4;
  [(WatchControlMotionPointerInputController *)&v16 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[WatchControlMotionPointerInputController indexForIndexPath:](self, "indexForIndexPath:", v6, v16.receiver, v16.super_class);
  v8 = [(WatchControlInputSourceController *)self specifiers];
  uint64_t v9 = [v8 objectAtIndex:v7];

  uint64_t v10 = [v6 section];
  v11 = [(WatchControlMotionPointerInputController *)self specifierAtIndex:[(WatchControlMotionPointerInputController *)self indexOfGroup:v10]];
  v12 = [v11 propertyForKey:*MEMORY[0x263F60168]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    v14 = [v9 propertyForKey:*MEMORY[0x263F60308]];
    if (v14)
    {
      v15 = [MEMORY[0x263F85B10] sharedInstance];
      objc_msgSend(v15, "setMotionPointerMovementTolerance:", objc_msgSend(v14, "unsignedIntegerValue"));

      [(WatchControlMotionPointerInputController *)self reloadSpecifiers];
    }
  }
}

- (id)_actionValueForSpecifier:(id)a3
{
  v3 = [a3 userInfo];
  unint64_t v4 = [v3 objectForKeyedSubscript:@"Action"];

  if (v4)
  {
    [v4 unsignedIntegerValue];
    v5 = WCNameForAction();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)motionPointerSensitivity
{
  v2 = NSNumber;
  v3 = [MEMORY[0x263F85B10] sharedInstance];
  [v3 motionPointerSensitivity];
  unint64_t v4 = objc_msgSend(v2, "numberWithFloat:");

  return v4;
}

- (void)setMotionPointerSensitivity:(id)a3
{
  v3 = (void *)MEMORY[0x263F85B10];
  id v4 = a3;
  id v8 = [v3 sharedInstance];
  [v4 floatValue];
  int v6 = v5;

  LODWORD(v7) = v6;
  [v8 setMotionPointerSensitivity:v7];
}

- (void)resetMotionPointerEdgeCustomizations
{
  id v2 = [MEMORY[0x263F85B10] sharedInstance];
  [v2 resetMotionPointerEdgeActionCustomizations];
}

- (unint64_t)selectedActionForDetailController:(id)a3
{
  uint64_t v3 = [a3 motionPointerEdge];
  id v4 = [MEMORY[0x263F85B10] sharedInstance];
  int v5 = [v4 motionPointerEdgeActionCustomizations];
  int v6 = [NSNumber numberWithInteger:v3];
  double v7 = [v5 objectForKey:v6];
  unint64_t v8 = [v7 unsignedIntegerValue];

  return v8;
}

- (BOOL)canShowAction:(unint64_t)a3 forDetailController:(id)a4
{
  return (a3 > 6) | (0x21u >> a3) & 1;
}

- (BOOL)canShowActionGroup:(unint64_t)a3 forDetailController:(id)a4
{
  return a3 != 10002;
}

- (void)setAction:(unint64_t)a3 forDetailController:(id)a4
{
  uint64_t v5 = [a4 motionPointerEdge];
  id v6 = [MEMORY[0x263F85B10] sharedInstance];
  [v6 setAction:a3 forMotionPointerEdge:v5];
}

- (double)valueForSpecifier:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F85B10], "sharedInstance", a3);
  [v3 motionPointerActivationDuration];
  double v5 = v4;

  return v5;
}

- (void)specifier:(id)a3 setValue:(double)a4
{
  objc_msgSend(MEMORY[0x263F85B10], "sharedInstance", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&double v5 = a4;
  [v6 setMotionPointerActivationDuration:v5];
}

- (double)stepValueForSpecifier:(id)a3
{
  return 0.25;
}

- (double)minimumValueForSpecifier:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F85B10], "sharedInstance", a3);
  [v3 motionPointerActivationDurationMin];
  double v5 = v4;

  return v5;
}

- (double)maximumValueForSpecifier:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F85B10], "sharedInstance", a3);
  [v3 motionPointerActivationDurationMax];
  double v5 = v4;

  return v5;
}

- (id)stringValueForSpecifier:(id)a3
{
  uint64_t v3 = NSNumber;
  [(WatchControlMotionPointerInputController *)self valueForSpecifier:a3];
  float v4 = objc_msgSend(v3, "numberWithDouble:");
  double v5 = AXFormatNumberWithOptions();

  return v5;
}

@end