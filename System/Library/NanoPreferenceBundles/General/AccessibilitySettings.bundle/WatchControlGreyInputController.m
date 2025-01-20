@interface WatchControlGreyInputController
- (BOOL)canShowAction:(unint64_t)a3 forDetailController:(id)a4;
- (BOOL)canShowActionGroup:(unint64_t)a3 forDetailController:(id)a4;
- (id)_actionValueForSpecifier:(id)a3;
- (id)activationGestureTitle;
- (id)greyQuickActionsEnabled;
- (id)inputSourceCustomizationSpecifiers;
- (id)selectedCustomActionIdentifierForCustomActionType:(int64_t)a3 forDetailController:(id)a4;
- (id)showDetectedGestureBanner;
- (unint64_t)selectedActionForDetailController:(id)a3;
- (void)_didTapLearnMore;
- (void)customizeEnableInputSourceGroupSpecifier:(id)a3;
- (void)resetGreyCustomizations;
- (void)setAction:(unint64_t)a3 forDetailController:(id)a4;
- (void)setCustomActionType:(int64_t)a3 withCustomActionIdentifier:(id)a4 forDetailController:(id)a5;
- (void)setShowDetectedGestureBanner:(id)a3;
@end

@implementation WatchControlGreyInputController

- (id)inputSourceCustomizationSpecifiers
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = (void *)MEMORY[0x263F5FC40];
  v5 = settingsLocString(@"GREY_CUSTOMIZATIONS_TITLE", @"AccessibilitySettings-watchcontrol");
  v6 = [v4 groupSpecifierWithName:v5];
  [v3 addObject:v6];

  v7 = [MEMORY[0x263F85B10] sharedInstance];
  v40 = [v7 greyEventActionCustomizations];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  WCAvailableGreyEvents();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = [*(id *)(*((void *)&v41 + 1) + 8 * i) unsignedIntegerValue];
        v13 = [NSNumber numberWithInteger:v12];
        v14 = [v40 objectForKeyedSubscript:v13];
        uint64_t v15 = [v14 unsignedIntegerValue];

        v16 = (void *)MEMORY[0x263F5FC40];
        v17 = WCNameForGreyEvent();
        v18 = [v16 preferenceSpecifierNamed:v17 target:self set:0 get:sel__actionValueForSpecifier_ detail:objc_opt_class() cell:2 edit:0];

        v45[0] = @"GreyEvent";
        v19 = [NSNumber numberWithInteger:v12];
        v46[0] = v19;
        v45[1] = @"Action";
        v20 = [NSNumber numberWithUnsignedInteger:v15];
        v45[2] = @"ActionDetailDelegate";
        v46[1] = v20;
        v46[2] = self;
        v21 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];
        [v18 setUserInfo:v21];

        [v3 addObject:v18];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v9);
  }

  v22 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  [v3 addObject:v22];

  v23 = (void *)MEMORY[0x263F5FC40];
  v24 = settingsLocString(@"GREY_RESET_CUSTOMIZATIONS_TITLE", @"AccessibilitySettings-watchcontrol");
  v25 = [v23 preferenceSpecifierNamed:v24 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v25 setButtonAction:sel_resetGreyCustomizations];
  [v3 addObject:v25];
  v26 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  v27 = settingsLocString(@"GREY_GESTURE_TO_START_FOOTER", @"AccessibilitySettings-watchcontrol");
  [v26 setProperty:v27 forKey:*MEMORY[0x263F600F8]];

  [v3 addObject:v26];
  v28 = (void *)MEMORY[0x263F5FC40];
  v29 = settingsLocString(@"GREY_GESTURE_TO_START_TITLE", @"AccessibilitySettings-watchcontrol");
  v30 = [v28 preferenceSpecifierNamed:v29 target:self set:0 get:sel_activationGestureTitle detail:objc_opt_class() cell:2 edit:0];
  [v3 addObject:v30];

  v31 = AXGetActivePairedDevice();
  v32 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"93EA0155-DFC4-4F9D-B8F0-DECC5B9C0C1D"];
  char v33 = [v31 supportsCapability:v32];

  if ((v33 & 1) == 0)
  {
    v34 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v3 addObject:v34];

    v35 = (void *)MEMORY[0x263F5FC40];
    v36 = settingsLocString(@"GREY_QUICK_ACTIONS_SWITCH", @"AccessibilitySettings-watchcontrol");
    v37 = [v35 preferenceSpecifierNamed:v36 target:self set:0 get:sel_greyQuickActionsEnabled detail:objc_opt_class() cell:2 edit:0];
    [v3 addObject:v37];
  }

  return v3;
}

- (void)customizeEnableInputSourceGroupSpecifier:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 setProperty:v6 forKey:*MEMORY[0x263F600C0]];

  settingsLocString(@"GREY_GESTURE_EDUCATION_ACTION", @"AccessibilitySettings-watchcontrol");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  NSUInteger v7 = [v13 rangeOfString:v13];
  NSUInteger v9 = v8;
  [v4 setProperty:v13 forKey:*MEMORY[0x263F600E8]];
  v15.location = v7;
  v15.length = v9;
  uint64_t v10 = NSStringFromRange(v15);
  [v4 setProperty:v10 forKey:*MEMORY[0x263F600D0]];

  v11 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [v4 setProperty:v11 forKey:*MEMORY[0x263F600E0]];

  uint64_t v12 = NSStringFromSelector(sel__didTapLearnMore);
  [v4 setProperty:v12 forKey:*MEMORY[0x263F600C8]];
}

- (void)_didTapLearnMore
{
}

- (id)_actionValueForSpecifier:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"GreyEvent"];

  v6 = [v3 userInfo];

  NSUInteger v7 = [v6 objectForKeyedSubscript:@"Action"];

  NSUInteger v8 = 0;
  if (v5 && v7)
  {
    if ([v7 unsignedIntegerValue] == 10020)
    {
      NSUInteger v9 = [MEMORY[0x263F85B10] sharedInstance];
      uint64_t v10 = [v9 greyEventCustomActionCustomizations];
      v11 = [v10 objectForKey:v5];

      WCRetrieveCustomActionFromPayload();
      NSUInteger v8 = 0;
    }
    else
    {
      NSUInteger v8 = WCNameForAction();
    }
  }

  return v8;
}

- (void)resetGreyCustomizations
{
  id v3 = [MEMORY[0x263F85B10] sharedInstance];
  [v3 resetGreyEventActionCustomizations];

  [(WatchControlGreyInputController *)self reloadSpecifiers];
}

- (id)activationGestureTitle
{
  v2 = [MEMORY[0x263F85B10] sharedInstance];
  [v2 greyActivationGesture];
  id v3 = WCNameForGreyEvent();

  return v3;
}

- (id)greyQuickActionsEnabled
{
  v2 = [MEMORY[0x263F85B10] sharedInstance];
  int v3 = [v2 greyQuickActionsEnabled];

  if (v3) {
    id v4 = @"ON";
  }
  else {
    id v4 = @"OFF";
  }
  v5 = settingsLocString(v4, @"AccessibilitySettings");

  return v5;
}

- (id)showDetectedGestureBanner
{
  v2 = NSNumber;
  int v3 = [MEMORY[0x263F85B10] sharedInstance];
  id v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "showDetectedGestureBanner"));

  return v4;
}

- (void)setShowDetectedGestureBanner:(id)a3
{
  int v3 = (void *)MEMORY[0x263F85B10];
  id v4 = a3;
  id v6 = [v3 sharedInstance];
  uint64_t v5 = [v4 BOOLValue];

  [v6 setShowDetectedGestureBanner:v5];
}

- (unint64_t)selectedActionForDetailController:(id)a3
{
  uint64_t v3 = [a3 greyEvent];
  id v4 = [MEMORY[0x263F85B10] sharedInstance];
  uint64_t v5 = [v4 greyEventActionCustomizations];
  id v6 = [NSNumber numberWithInteger:v3];
  NSUInteger v7 = [v5 objectForKey:v6];
  unint64_t v8 = [v7 unsignedIntegerValue];

  return v8;
}

- (BOOL)canShowAction:(unint64_t)a3 forDetailController:(id)a4
{
  return 1;
}

- (BOOL)canShowActionGroup:(unint64_t)a3 forDetailController:(id)a4
{
  if (a3 != 10002) {
    return 1;
  }
  id v4 = AXGetActivePairedDevice();
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"A334D6D2-9BEC-414E-BD6C-8AC1E5FB8CA3"];
  char v6 = [v4 supportsCapability:v5];

  return v6;
}

- (void)setAction:(unint64_t)a3 forDetailController:(id)a4
{
  uint64_t v5 = [a4 greyEvent];
  id v6 = [MEMORY[0x263F85B10] sharedInstance];
  [v6 setAction:a3 forGreyEvent:v5];
}

- (id)selectedCustomActionIdentifierForCustomActionType:(int64_t)a3 forDetailController:(id)a4
{
  uint64_t v5 = [a4 greyEvent];
  id v6 = [MEMORY[0x263F85B10] sharedInstance];
  NSUInteger v7 = [v6 greyEventCustomActionCustomizations];
  unint64_t v8 = [NSNumber numberWithInteger:v5];
  NSUInteger v9 = [v7 objectForKey:v8];

  if (v9)
  {
    int v10 = WCRetrieveCustomActionFromPayload();
    id v11 = 0;
    uint64_t v12 = v11;
    if (v10) {
      BOOL v13 = a3 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13) {
      goto LABEL_8;
    }
  }
  uint64_t v12 = 0;
LABEL_8:

  return v12;
}

- (void)setCustomActionType:(int64_t)a3 withCustomActionIdentifier:(id)a4 forDetailController:(id)a5
{
  id v7 = a4;
  uint64_t v8 = [a5 greyEvent];
  id v9 = [MEMORY[0x263F85B10] sharedInstance];
  [v9 setCustomActionType:a3 withCustomActionIdentifier:v7 forGreyEvent:v8];
}

@end