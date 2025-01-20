@interface AXDisplayTextMotionSpecifiersHelper
- (AXUIClient)displayFilterUIClient;
- (AccessibilitySettingsBaseController)settingsController;
- (BOOL)_reduceMotionAvailable;
- (NSString)appID;
- (PSSpecifier)motionCuesInVehicleActivationFooterSpecifier;
- (PSSpecifier)motionCuesInVehicleActivationSpecifier;
- (PSSpecifier)reduceMotionReduceSlideTransitionsFooterSpecifier;
- (PSSpecifier)reduceMotionReduceSlideTransitionsSpecifier;
- (__CFString)_cfAppID;
- (id)_accessibilitySettingsBaseController;
- (id)_generateSpecifierForName:(id)a3 set:(SEL)a4 get:(SEL)a5 inBuddy:(BOOL)a6;
- (id)autoplayAnimatedImages:(id)a3;
- (id)autoplayMessagesEffects:(id)a3;
- (id)autoplayVideoPreviews:(id)a3;
- (id)boldTextEnabled:(id)a3;
- (id)buttonShapesEnabled:(id)a3;
- (id)darkenColorsEnabled:(id)a3;
- (id)differentiateWithoutColor:(id)a3;
- (id)displayTextSpecifiersIncludingSmartInvert:(BOOL)a3 isPerApp:(BOOL)a4;
- (id)largerTextEnabled:(id)a3;
- (id)motionCuesEnabled:(id)a3;
- (id)motionSpecifiers;
- (id)onOffLabelsEnabled:(id)a3;
- (id)preferHorizontalText:(id)a3;
- (id)preferNonBlinkingCursor:(id)a3;
- (id)preferenceValue:(id)a3;
- (id)reduceMotionEnabled:(id)a3;
- (id)reduceMotionReduceSlideTransitionsEnabled:(id)a3;
- (id)reduceTransparencyEnabled:(id)a3;
- (id)refreshRateEnabled:(id)a3;
- (id)smartInvertEnabled:(id)a3;
- (int)largerTextPerAppValue;
- (void)_motionCuesLearnMoreLinkTapped:(id)a3;
- (void)_setupSpecifierIfNeeded:(id)a3 setBlock:(id)a4 getBlock:(id)a5;
- (void)_updateReduceSlideTransitionsSpecifiersAnimated:(BOOL)a3;
- (void)_updateSpecifierState:(id)a3;
- (void)handleGlobalSmartInvertEnabled:(BOOL)a3;
- (void)setAppID:(id)a3;
- (void)setAutoplayAnimatedImages:(id)a3 specifier:(id)a4;
- (void)setAutoplayMessagesEffects:(id)a3 specifier:(id)a4;
- (void)setAutoplayVideoPreviews:(id)a3 specifier:(id)a4;
- (void)setBoldTextEnabled:(id)a3 specifier:(id)a4;
- (void)setButtonShapesEnabled:(id)a3 specifier:(id)a4;
- (void)setDarkenColorsEnabled:(id)a3 specifier:(id)a4;
- (void)setDifferentiateWithoutColorEnabled:(id)a3 specifier:(id)a4;
- (void)setDisplayFilterUIClient:(id)a3;
- (void)setMotionCuesInVehicleActivationFooterSpecifier:(id)a3;
- (void)setMotionCuesInVehicleActivationSpecifier:(id)a3;
- (void)setOnOffLabelsEnabled:(id)a3 specifier:(id)a4;
- (void)setPreferHorizontalText:(id)a3 specifier:(id)a4;
- (void)setPreferNonBlinkingCursor:(id)a3 specifier:(id)a4;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setReduceMotionEnabled:(id)a3 specifier:(id)a4;
- (void)setReduceMotionReduceSlideTransitionsEnabled:(id)a3 specifier:(id)a4;
- (void)setReduceMotionReduceSlideTransitionsFooterSpecifier:(id)a3;
- (void)setReduceMotionReduceSlideTransitionsSpecifier:(id)a3;
- (void)setReduceTransparencyEnabled:(id)a3 specifier:(id)a4;
- (void)setRefreshRateEnabled:(id)a3 specifier:(id)a4;
- (void)setSettingsController:(id)a3;
- (void)setSmartInvertEnabled:(id)a3 specifier:(id)a4;
@end

@implementation AXDisplayTextMotionSpecifiersHelper

- (id)displayTextSpecifiersIncludingSmartInvert:(BOOL)a3 isPerApp:(BOOL)a4
{
  BOOL v4 = a3;
  id v6 = [objc_allocWithZone((Class)NSMutableArray) init];
  objc_initWeak(location, self);
  self->_isService = [(NSString *)self->_appID isEqualToString:AX_LiveTranscriptionBundleName];
  appID = self->_appID;
  if (appID)
  {
    v8 = settingsLocString(@"DISPLAY_AND_TEXT", @"AccessibilityTitles");
  }
  else
  {
    v8 = 0;
  }
  v9 = +[PSSpecifier groupSpecifierWithName:v8];
  if (appID) {

  }
  uint64_t v10 = AXInBuddySetupKey;
  [v9 setProperty:&__kCFBooleanTrue forKey:AXInBuddySetupKey];
  [v6 addObject:v9];
  v11 = [(AXDisplayTextMotionSpecifiersHelper *)self _generateSpecifierForName:@"ENHANCE_TEXT_LEGIBILITY" set:"setBoldTextEnabled:specifier:" get:"boldTextEnabled:" inBuddy:1];

  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke;
  v82[3] = &unk_20B630;
  objc_copyWeak(&v84, location);
  id v12 = v11;
  id v83 = v12;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_2;
  v80[3] = &unk_2091B8;
  objc_copyWeak(&v81, location);
  [(AXDisplayTextMotionSpecifiersHelper *)self _setupSpecifierIfNeeded:v12 setBlock:v82 getBlock:v80];
  [v6 addObject:v12];
  v13 = settingsLocString(@"LARGER_TEXT", @"Accessibility");
  v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:"largerTextEnabled:" detail:objc_opt_class() cell:2 edit:0];

  [v14 setProperty:&__kCFBooleanTrue forKey:v10];
  [v14 setProperty:@"LARGER_TEXT" forKey:PSIDKey];
  [v14 setProperty:self->_appID forKey:@"BundleIdentifier"];
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_3;
  v77[3] = &unk_20B630;
  objc_copyWeak(&v79, location);
  id v15 = v14;
  id v78 = v15;
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_4;
  v76[3] = &unk_20B658;
  v76[4] = self;
  [(AXDisplayTextMotionSpecifiersHelper *)self _setupSpecifierIfNeeded:v15 setBlock:v77 getBlock:v76];
  [v6 addObject:v15];

  objc_destroyWeak(&v79);
  if (!self->_isService)
  {
    v16 = [(AXDisplayTextMotionSpecifiersHelper *)self _generateSpecifierForName:@"BUTTON_SHAPES" set:"setButtonShapesEnabled:specifier:" get:"buttonShapesEnabled:" inBuddy:0];

    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_5;
    v73[3] = &unk_20B630;
    objc_copyWeak(&v75, location);
    id v17 = v16;
    id v74 = v17;
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_6;
    v71[3] = &unk_2091B8;
    objc_copyWeak(&v72, location);
    [(AXDisplayTextMotionSpecifiersHelper *)self _setupSpecifierIfNeeded:v17 setBlock:v73 getBlock:v71];
    [v6 addObject:v17];
    v18 = [(AXDisplayTextMotionSpecifiersHelper *)self _generateSpecifierForName:@"ON_OFF_LABELS" set:"setOnOffLabelsEnabled:specifier:" get:"onOffLabelsEnabled:" inBuddy:0];

    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_7;
    v68[3] = &unk_20B630;
    objc_copyWeak(&v70, location);
    id v19 = v18;
    id v69 = v19;
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_8;
    v66[3] = &unk_2091B8;
    objc_copyWeak(&v67, location);
    [(AXDisplayTextMotionSpecifiersHelper *)self _setupSpecifierIfNeeded:v19 setBlock:v68 getBlock:v66];
    [v19 setProperty:@"OnOffLabels" forKey:PSKeyNameKey];
    [v6 addObject:v19];
    v20 = +[PSSpecifier emptyGroupSpecifier];

    v21 = settingsLocString(@"ReduceTransparencyFooterText", @"Accessibility");
    uint64_t v22 = PSFooterTextGroupKey;
    [v20 setProperty:v21 forKey:PSFooterTextGroupKey];

    [v20 setProperty:&__kCFBooleanTrue forKey:v10];
    [v6 addObject:v20];
    v23 = [(AXDisplayTextMotionSpecifiersHelper *)self _generateSpecifierForName:@"REDUCE_TRANSPARENCY" set:"setReduceTransparencyEnabled:specifier:" get:"reduceTransparencyEnabled:" inBuddy:1];

    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_9;
    v63[3] = &unk_20B630;
    objc_copyWeak(&v65, location);
    id v24 = v23;
    id v64 = v24;
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_10;
    v61[3] = &unk_2091B8;
    objc_copyWeak(&v62, location);
    [(AXDisplayTextMotionSpecifiersHelper *)self _setupSpecifierIfNeeded:v24 setBlock:v63 getBlock:v61];
    [v6 addObject:v24];
    objc_destroyWeak(&v62);

    objc_destroyWeak(&v65);
    v25 = +[PSSpecifier emptyGroupSpecifier];

    v26 = settingsLocString(@"TEXT_COLORS_DARKEN_FOOTER", @"Accessibility");
    [v25 setProperty:v26 forKey:v22];

    [v25 setProperty:&__kCFBooleanTrue forKey:v10];
    [v6 addObject:v25];
    v27 = [(AXDisplayTextMotionSpecifiersHelper *)self _generateSpecifierForName:@"TEXT_COLORS_DARKEN" set:"setDarkenColorsEnabled:specifier:" get:"darkenColorsEnabled:" inBuddy:1];

    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_11;
    v58[3] = &unk_20B630;
    objc_copyWeak(&v60, location);
    id v28 = v27;
    id v59 = v28;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_12;
    v56[3] = &unk_2091B8;
    objc_copyWeak(&v57, location);
    [(AXDisplayTextMotionSpecifiersHelper *)self _setupSpecifierIfNeeded:v28 setBlock:v58 getBlock:v56];
    [v6 addObject:v28];
    v29 = +[PSSpecifier emptyGroupSpecifier];

    v30 = settingsLocString(@"DIFFERENTIATE_WITHOUT_COLOR_FOOTER", @"Accessibility");
    [v29 setProperty:v30 forKey:v22];

    [v29 setProperty:&__kCFBooleanTrue forKey:v10];
    [v6 addObject:v29];
    v31 = [(AXDisplayTextMotionSpecifiersHelper *)self _generateSpecifierForName:@"DIFFERENTIATE_WITHOUT_COLOR" set:"setDifferentiateWithoutColorEnabled:specifier:" get:"differentiateWithoutColor:" inBuddy:1];

    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_13;
    v53[3] = &unk_20B630;
    objc_copyWeak(&v55, location);
    id v32 = v31;
    id v54 = v32;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_14;
    v51[3] = &unk_2091B8;
    objc_copyWeak(&v52, location);
    [(AXDisplayTextMotionSpecifiersHelper *)self _setupSpecifierIfNeeded:v32 setBlock:v53 getBlock:v51];
    [v6 addObject:v32];
    v33 = +[PSSpecifier emptyGroupSpecifier];

    v34 = settingsLocString(@"PREFER_HORIZONTAL_TEXT_FOOTER", @"Accessibility");
    [v33 setProperty:v34 forKey:v22];

    [v33 setProperty:&__kCFBooleanTrue forKey:v10];
    [v6 addObject:v33];
    v35 = [(AXDisplayTextMotionSpecifiersHelper *)self _generateSpecifierForName:@"PREFER_HORIZONTAL_TEXT" set:"setPreferHorizontalText:specifier:" get:"preferHorizontalText:" inBuddy:1];

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_15;
    v48[3] = &unk_20B630;
    objc_copyWeak(&v50, location);
    id v15 = v35;
    id v49 = v15;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_16;
    v46[3] = &unk_2091B8;
    objc_copyWeak(&v47, location);
    [(AXDisplayTextMotionSpecifiersHelper *)self _setupSpecifierIfNeeded:v15 setBlock:v48 getBlock:v46];
    [v6 addObject:v15];
    if (v4)
    {
      v36 = +[PSSpecifier emptyGroupSpecifier];

      v37 = settingsLocString(@"SmartInvertColorsFooter", @"Accessibility");
      [v36 setProperty:v37 forKey:v22];

      [v36 setProperty:&__kCFBooleanTrue forKey:v10];
      [v6 addObject:v36];
      v38 = [(AXDisplayTextMotionSpecifiersHelper *)self _generateSpecifierForName:@"SMART_INVERT" set:"setSmartInvertEnabled:specifier:" get:"smartInvertEnabled:" inBuddy:1];

      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_17;
      v43[3] = &unk_20B630;
      objc_copyWeak(&v45, location);
      id v15 = v38;
      id v44 = v15;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_18;
      v41[3] = &unk_2091B8;
      objc_copyWeak(&v42, location);
      [(AXDisplayTextMotionSpecifiersHelper *)self _setupSpecifierIfNeeded:v15 setBlock:v43 getBlock:v41];
      [v6 addObject:v15];
      objc_destroyWeak(&v42);

      objc_destroyWeak(&v45);
    }
    objc_destroyWeak(&v47);

    objc_destroyWeak(&v50);
    objc_destroyWeak(&v52);

    objc_destroyWeak(&v55);
    objc_destroyWeak(&v57);

    objc_destroyWeak(&v60);
    objc_destroyWeak(&v67);

    objc_destroyWeak(&v70);
    objc_destroyWeak(&v72);

    objc_destroyWeak(&v75);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
  [WeakRetained setupLongTitleSpecifiers:v6];

  objc_destroyWeak(&v81);
  objc_destroyWeak(&v84);
  objc_destroyWeak(location);

  return v6;
}

void __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setBoldTextEnabled:v4 specifier:*(void *)(a1 + 32)];
}

id __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained boldTextEnabled:0];

  return v2;
}

void __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateSpecifierState:*(void *)(a1 + 32)];
}

NSNumber *__90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) largerTextPerAppValue];

  return +[NSNumber numberWithInt:v1];
}

void __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_5(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setButtonShapesEnabled:v4 specifier:*(void *)(a1 + 32)];
}

id __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained buttonShapesEnabled:0];

  return v2;
}

void __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_7(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setOnOffLabelsEnabled:v4 specifier:*(void *)(a1 + 32)];
}

id __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained onOffLabelsEnabled:0];

  return v2;
}

void __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_9(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setReduceTransparencyEnabled:v4 specifier:*(void *)(a1 + 32)];
}

id __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained reduceTransparencyEnabled:0];

  return v2;
}

void __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_11(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setDarkenColorsEnabled:v4 specifier:*(void *)(a1 + 32)];
}

id __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_12(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained darkenColorsEnabled:0];

  return v2;
}

void __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_13(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setDifferentiateWithoutColorEnabled:v4 specifier:*(void *)(a1 + 32)];
}

id __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained differentiateWithoutColor:0];

  return v2;
}

void __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_15(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setPreferHorizontalText:v4 specifier:*(void *)(a1 + 32)];
}

id __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_16(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained preferHorizontalText:0];

  return v2;
}

void __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_17(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setSmartInvertEnabled:v4 specifier:*(void *)(a1 + 32)];
}

id __90__AXDisplayTextMotionSpecifiersHelper_displayTextSpecifiersIncludingSmartInvert_isPerApp___block_invoke_18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained smartInvertEnabled:0];

  return v2;
}

- (id)motionSpecifiers
{
  id v3 = [objc_allocWithZone((Class)NSMutableArray) init];
  objc_initWeak(&location, self);
  appID = self->_appID;
  if (appID)
  {
    v5 = settingsLocString(@"MOTION_TITLE", @"AccessibilityTitles");
  }
  else
  {
    v5 = 0;
  }
  id v6 = +[PSSpecifier groupSpecifierWithName:v5];
  if (appID) {

  }
  uint64_t v7 = AXInBuddySetupKey;
  [v6 setProperty:&__kCFBooleanTrue forKey:AXInBuddySetupKey];
  uint64_t v65 = PSIDKey;
  objc_msgSend(v6, "setProperty:forKey:", @"EmptyGroup");
  [v3 addObject:v6];
  v8 = settingsLocString(@"ReduceMotionFooterText", @"Accessibility");
  if (AXPSIsBatterySaverMode())
  {
    v9 = settingsLocString(@"ReduceMotionFooterText_BatteryMode", @"Accessibility");
    uint64_t v10 = [v8 stringByAppendingFormat:@"\n\n%@", v9];

    v8 = (void *)v10;
  }
  [v6 setProperty:&__kCFBooleanTrue forKey:v7];
  uint64_t v64 = PSFooterTextGroupKey;
  objc_msgSend(v6, "setProperty:forKey:", v8);
  v11 = [(AXDisplayTextMotionSpecifiersHelper *)self _generateSpecifierForName:@"REDUCE_MOTION" set:"setReduceMotionEnabled:specifier:" get:"reduceMotionEnabled:" inBuddy:1];
  id v59 = v8;

  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = __55__AXDisplayTextMotionSpecifiersHelper_motionSpecifiers__block_invoke;
  v82[3] = &unk_20B630;
  id v60 = &v84;
  objc_copyWeak(&v84, &location);
  id v12 = v11;
  id v83 = v12;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = __55__AXDisplayTextMotionSpecifiersHelper_motionSpecifiers__block_invoke_2;
  v80[3] = &unk_2091B8;
  id v62 = &v81;
  objc_copyWeak(&v81, &location);
  [(AXDisplayTextMotionSpecifiersHelper *)self _setupSpecifierIfNeeded:v12 setBlock:v82 getBlock:v80];
  [v3 addObject:v12];
  v13 = [(AXDisplayTextMotionSpecifiersHelper *)self _generateSpecifierForName:@"REDUCE_MOTION_REDUCE_SLIDE_ANIMATIONS" set:"setReduceMotionReduceSlideTransitionsEnabled:specifier:" get:"reduceMotionReduceSlideTransitionsEnabled:" inBuddy:1];
  [(AXDisplayTextMotionSpecifiersHelper *)self setReduceMotionReduceSlideTransitionsSpecifier:v13];

  v14 = [(AXDisplayTextMotionSpecifiersHelper *)self reduceMotionReduceSlideTransitionsSpecifier];
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = __55__AXDisplayTextMotionSpecifiersHelper_motionSpecifiers__block_invoke_3;
  v78[3] = &unk_209168;
  v61 = &v79;
  objc_copyWeak(&v79, &location);
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = __55__AXDisplayTextMotionSpecifiersHelper_motionSpecifiers__block_invoke_4;
  v76[3] = &unk_2091B8;
  v63 = &v77;
  objc_copyWeak(&v77, &location);
  [(AXDisplayTextMotionSpecifiersHelper *)self _setupSpecifierIfNeeded:v14 setBlock:v78 getBlock:v76];

  id v15 = +[PSSpecifier emptyGroupSpecifier];
  [(AXDisplayTextMotionSpecifiersHelper *)self setReduceMotionReduceSlideTransitionsFooterSpecifier:v15];

  v16 = [(AXDisplayTextMotionSpecifiersHelper *)self reduceMotionReduceSlideTransitionsFooterSpecifier];
  id v17 = settingsLocString(@"REDUCE_MOTION_REDUCE_SLIDE_ANIMATIONS_FOOTER", @"Accessibility");
  [v16 setProperty:v17 forKey:v64];

  v18 = [(AXDisplayTextMotionSpecifiersHelper *)self reduceMotionReduceSlideTransitionsFooterSpecifier];
  [v18 setProperty:&__kCFBooleanTrue forKey:v7];

  id v19 = [(AXDisplayTextMotionSpecifiersHelper *)self reduceMotionReduceSlideTransitionsFooterSpecifier];
  [v19 setProperty:@"ReduceMotionReduceSlideAnimationsFooter" forKey:v65];

  if ([(AXDisplayTextMotionSpecifiersHelper *)self _reduceMotionAvailable])
  {
    v20 = [(AXDisplayTextMotionSpecifiersHelper *)self reduceMotionReduceSlideTransitionsFooterSpecifier];
    v86[0] = v20;
    v21 = [(AXDisplayTextMotionSpecifiersHelper *)self reduceMotionReduceSlideTransitionsSpecifier];
    v86[1] = v21;
    uint64_t v22 = +[NSArray arrayWithObjects:v86 count:2];
    [v3 addObjectsFromArray:v22];
  }
  if (AXDeviceSupportsMotionCues() && !self->_appID)
  {
    v23 = +[PSSpecifier emptyGroupSpecifier];

    [v23 setProperty:&__kCFBooleanFalse forKey:v7];
    [v23 setProperty:@"MotionCuesFooterTextGroup" forKey:v65];
    id v24 = settingsLocString(@"MotionCuesLearnMoreText", @"Accessibility-MotionCues");
    id v25 = objc_alloc((Class)NSString);
    v26 = AXLocStringKeyForModel();
    v27 = settingsLocString(v26, @"Accessibility-MotionCues");
    id v28 = objc_msgSend(v25, "initWithFormat:", v27, v24);

    [v23 setProperty:v28 forKey:v64];
    v29 = (objc_class *)objc_opt_class();
    v30 = NSStringFromClass(v29);
    [v23 setProperty:v30 forKey:PSFooterCellClassGroupKey];

    [v23 setProperty:v28 forKey:PSFooterHyperlinkViewTitleKey];
    v88.id location = (NSUInteger)[v28 rangeOfString:v24 options:4];
    v31 = NSStringFromRange(v88);
    [v23 setProperty:v31 forKey:PSFooterHyperlinkViewLinkRangeKey];

    id v32 = +[NSValue valueWithNonretainedObject:self];
    [v23 setProperty:v32 forKey:PSFooterHyperlinkViewTargetKey];

    v33 = NSStringFromSelector("_motionCuesLearnMoreLinkTapped:");
    [v23 setProperty:v33 forKey:PSFooterHyperlinkViewActionKey];

    [v3 addObject:v23];
    v34 = settingsLocString(@"MotionCuesTitle", @"Accessibility-MotionCues");
    id v12 = +[PSSpecifier preferenceSpecifierNamed:v34 target:self set:0 get:"motionCuesEnabled:" detail:objc_opt_class() cell:2 edit:0];

    [v12 setProperty:&__kCFBooleanFalse forKey:v7];
    [v12 setProperty:@"MotionCues" forKey:v65];
    [v3 addObject:v12];
  }
  if (AXDeviceSupportsPhotosensitiveMitigation() && !self->_appID)
  {
    v35 = +[PSSpecifier emptyGroupSpecifier];
    v36 = PSESettingsFooterText();
    [v35 setProperty:v36 forKey:v64];

    [v12 setProperty:&__kCFBooleanTrue forKey:v7];
    [v3 addObject:v35];
    v37 = settingsLocString(@"PHOTOSENSITIVE_MITIGATION_TITLE", @"Accessibility-PSE");
    v38 = +[PSSpecifier preferenceSpecifierNamed:v37 target:self set:"setPreferenceValue:specifier:" get:"preferenceValue:" detail:0 cell:6 edit:0];

    [v38 setProperty:@"PHOTOSENSITIVE_MITIGATION" forKey:v65];
    [v38 setProperty:&__kCFBooleanTrue forKey:v7];
    [v3 addObject:v38];
  }
  v39 = +[PSSpecifier emptyGroupSpecifier];

  [v39 setProperty:&__kCFBooleanFalse forKey:v7];
  [v39 setProperty:@"EmptyGroup" forKey:v65];
  v40 = settingsLocString(@"ReduceMotionFooterText_Autoplay", @"Accessibility-AnimatedImages");
  [v39 setProperty:v40 forKey:v64];

  [v3 addObject:v39];
  v41 = settingsLocString(@"REDUCE_MOTION_AUTOPLAY_ANIMATED_IMAGES", @"Accessibility-AnimatedImages");
  id v42 = +[PSSpecifier preferenceSpecifierNamed:v41 target:self set:"setAutoplayAnimatedImages:specifier:" get:"autoplayAnimatedImages:" detail:0 cell:6 edit:0];

  [v42 setProperty:@"REDUCE_MOTION_AUTOPLAY_ANIMATED_IMAGES" forKey:v65];
  uint64_t v43 = PSAllowMultilineTitleKey;
  [v39 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v39 setProperty:&__kCFBooleanTrue forKey:v7];
  [v3 addObject:v42];
  id v44 = [(AXDisplayTextMotionSpecifiersHelper *)self _generateSpecifierForName:@"REDUCE_MOTION_AUTOPLAY_VIDEO_PREVIEWS" set:"setAutoplayVideoPreviews:specifier:" get:"autoplayVideoPreviews:" inBuddy:0];

  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = __55__AXDisplayTextMotionSpecifiersHelper_motionSpecifiers__block_invoke_5;
  v73[3] = &unk_20B630;
  id v57 = &v75;
  objc_copyWeak(&v75, &location);
  id v45 = v44;
  id v74 = v45;
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = __55__AXDisplayTextMotionSpecifiersHelper_motionSpecifiers__block_invoke_6;
  v71[3] = &unk_2091B8;
  v58 = &v72;
  objc_copyWeak(&v72, &location);
  [(AXDisplayTextMotionSpecifiersHelper *)self _setupSpecifierIfNeeded:v45 setBlock:v73 getBlock:v71];
  [v45 setProperty:&__kCFBooleanTrue forKey:v43];
  [v3 addObject:v45];
  if (self->_appID)
  {
    v46 = v45;
  }
  else
  {
    id v47 = settingsLocString(@"REDUCE_MOTION_AUTOPLAY_MESSAGES_EFFECTS", @"Accessibility");
    v46 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v47, self, "setAutoplayMessagesEffects:specifier:", "autoplayMessagesEffects:", 0, 6, 0, &v75, &v72, v59, &v84, &v79, &v81, &v77);

    [v46 setProperty:&__kCFBooleanFalse forKey:v7];
    [v46 setProperty:@"ReduceMotionAutoplayMessagesEffects" forKey:v65];
    [v3 addObject:v46];
  }
  v48 = +[PSSpecifier emptyGroupSpecifier];

  id v49 = settingsLocString(@"PREFER_NONBLINKING_CURSOR_FOOTER", @"Accessibility");
  [v48 setProperty:v49 forKey:v64];

  [v48 setProperty:&__kCFBooleanTrue forKey:v7];
  [v3 addObject:v48];
  id v50 = [(AXDisplayTextMotionSpecifiersHelper *)self _generateSpecifierForName:@"PREFER_NONBLINKING_CURSOR" set:"setPreferNonBlinkingCursor:specifier:" get:"preferNonBlinkingCursor:" inBuddy:1];

  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = __55__AXDisplayTextMotionSpecifiersHelper_motionSpecifiers__block_invoke_7;
  v68[3] = &unk_20B630;
  objc_copyWeak(&v70, &location);
  id v51 = v50;
  id v69 = v51;
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = __55__AXDisplayTextMotionSpecifiersHelper_motionSpecifiers__block_invoke_8;
  v66[3] = &unk_2091B8;
  objc_copyWeak(&v67, &location);
  [(AXDisplayTextMotionSpecifiersHelper *)self _setupSpecifierIfNeeded:v51 setBlock:v68 getBlock:v66];
  [v3 addObject:v51];
  if (AXHasCapability())
  {
    id v52 = +[PSSpecifier emptyGroupSpecifier];

    v53 = settingsLocString(@"RefreshRateFooterText", @"Accessibility");
    [v52 setProperty:v53 forKey:v64];

    [v52 setProperty:&__kCFBooleanTrue forKey:v7];
    [v3 addObject:v52];
    id v54 = settingsLocString(@"RefreshRateSlider", @"Accessibility");
    id v51 = +[PSSpecifier preferenceSpecifierNamed:v54 target:self set:"setRefreshRateEnabled:specifier:" get:"refreshRateEnabled:" detail:0 cell:6 edit:0];

    [v51 setProperty:@"REFRESH_RATE" forKey:v65];
    [v51 setProperty:&__kCFBooleanTrue forKey:v43];
    [v51 setProperty:&__kCFBooleanTrue forKey:v7];
    [v3 addObject:v51];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
  [WeakRetained setupLongTitleSpecifiers:v3];

  objc_destroyWeak(&v67);
  objc_destroyWeak(&v70);
  objc_destroyWeak(v58);

  objc_destroyWeak(v57);
  objc_destroyWeak(v63);
  objc_destroyWeak(v61);
  objc_destroyWeak(v62);

  objc_destroyWeak(v60);
  objc_destroyWeak(&location);

  return v3;
}

void __55__AXDisplayTextMotionSpecifiersHelper_motionSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setReduceMotionEnabled:v4 specifier:*(void *)(a1 + 32)];
}

id __55__AXDisplayTextMotionSpecifiersHelper_motionSpecifiers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained reduceMotionEnabled:0];

  return v2;
}

void __55__AXDisplayTextMotionSpecifiersHelper_motionSpecifiers__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id v5 = objc_loadWeakRetained(v2);
  id v4 = [v5 reduceMotionReduceSlideTransitionsSpecifier];
  [v5 setReduceMotionReduceSlideTransitionsEnabled:v3 specifier:v4];
}

id __55__AXDisplayTextMotionSpecifiersHelper_motionSpecifiers__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained reduceMotionReduceSlideTransitionsEnabled:0];

  return v2;
}

void __55__AXDisplayTextMotionSpecifiersHelper_motionSpecifiers__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setAutoplayVideoPreviews:v4 specifier:*(void *)(a1 + 32)];
}

id __55__AXDisplayTextMotionSpecifiersHelper_motionSpecifiers__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained autoplayVideoPreviews:0];

  return v2;
}

void __55__AXDisplayTextMotionSpecifiersHelper_motionSpecifiers__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setPreferNonBlinkingCursor:v4 specifier:*(void *)(a1 + 32)];
}

id __55__AXDisplayTextMotionSpecifiersHelper_motionSpecifiers__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained preferNonBlinkingCursor:0];

  return v2;
}

- (void)_motionCuesLearnMoreLinkTapped:(id)a3
{
  id v4 = a3;
  id v5 = +[AXMotionCuesLearnMoreController learnMoreController];
  objc_initWeak(&location, self);
  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = __70__AXDisplayTextMotionSpecifiersHelper__motionCuesLearnMoreLinkTapped___block_invoke;
  v13 = &unk_208798;
  objc_copyWeak(&v14, &location);
  [v5 setDismissHandler:&v10];
  id v6 = objc_alloc((Class)OBNavigationController);
  uint64_t v7 = (OBNavigationController *)objc_msgSend(v6, "initWithRootViewController:", v5, v10, v11, v12, v13);
  learnMoreNavigationController = self->_learnMoreNavigationController;
  self->_learnMoreNavigationController = v7;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
  [WeakRetained presentViewController:self->_learnMoreNavigationController animated:1 completion:0];

  AnalyticsSendEvent();
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __70__AXDisplayTextMotionSpecifiersHelper__motionCuesLearnMoreLinkTapped___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    id v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

- (id)motionCuesEnabled:(id)a3
{
  if (_AXSMotionCuesEnabled())
  {
    id v3 = @"ON";
    if (!_AXSMotionCuesMode() && !AXDeviceIsPad()) {
      id v3 = @"AUTOMATIC";
    }
  }
  else
  {
    id v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (void)setPreferNonBlinkingCursor:(id)a3 specifier:(id)a4
{
  id v7 = a4;
  if (self->_appID)
  {
    [a3 integerValue];
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    _AXSSetPrefersNonBlinkingCursorIndicatorApp();
    [(AXDisplayTextMotionSpecifiersHelper *)self _updateSpecifierState:v7];
    id v6 = +[AXSettings sharedInstance];
    [v6 aggregatePerAppSettingsStatistics];
  }
  else
  {
    [a3 BOOLValue];
    _AXSSetPrefersNonBlinkingCursorIndicator();
  }
}

- (void)setRefreshRateEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[AXSettings sharedInstance];
  id v5 = [v4 BOOLValue];

  [v6 setShouldLimitDisplayRefreshRate:v5];
}

- (id)refreshRateEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 shouldLimitDisplayRefreshRate]);

  return v4;
}

- (id)preferNonBlinkingCursor:(id)a3
{
  if (self->_appID)
  {
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    id v4 = +[NSNumber numberWithInt:_AXSPrefersNonBlinkingCursorIndicatorApp()];
    id v5 = v4;
    if (a3)
    {
      id v6 = +[AXDefaultOnOffViewController stringValueForNumber:v4];
    }
    else
    {
      id v6 = v4;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = +[NSNumber numberWithUnsignedChar:_AXSPrefersNonBlinkingCursorIndicatorGlobal()];
  }

  return v7;
}

- (void)setPreferHorizontalText:(id)a3 specifier:(id)a4
{
  id v7 = a4;
  if (self->_appID)
  {
    [a3 integerValue];
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    _AXSSetPrefersHorizontalTextLayoutApp();
    [(AXDisplayTextMotionSpecifiersHelper *)self _updateSpecifierState:v7];
    id v6 = +[AXSettings sharedInstance];
    [v6 aggregatePerAppSettingsStatistics];
  }
  else
  {
    [a3 BOOLValue];
    _AXSSetPrefersHorizontalTextLayout();
  }
}

- (id)preferHorizontalText:(id)a3
{
  if (self->_appID)
  {
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    id v4 = +[NSNumber numberWithInt:_AXSPrefersHorizontalTextLayoutApp()];
    id v5 = v4;
    if (a3)
    {
      id v6 = +[AXDefaultOnOffViewController stringValueForNumber:v4];
    }
    else
    {
      id v6 = v4;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = +[NSNumber numberWithUnsignedChar:_AXSPrefersHorizontalTextLayoutGlobal()];
  }

  return v7;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSPhotosensitiveMitigationSetEnabled(v4);
}

- (id)preferenceValue:(id)a3
{
  uint64_t v3 = _AXSPhotosensitiveMitigationEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (id)_generateSpecifierForName:(id)a3 set:(SEL)a4 get:(SEL)a5 inBuddy:(BOOL)a6
{
  BOOL v6 = a6;
  appID = self->_appID;
  id v11 = a3;
  id v12 = settingsLocString(v11, @"Accessibility");
  if (appID)
  {
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:a5 detail:objc_opt_class() cell:2 edit:0];

    [v13 setProperty:objc_opt_class() forKey:PSCellClassKey];
  }
  else
  {
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:a4 get:a5 detail:0 cell:6 edit:0];

    id v14 = +[NSNumber numberWithBool:v6];
    [v13 setProperty:v14 forKey:AXInBuddySetupKey];
  }
  [v13 setProperty:v11 forKey:PSIDKey];

  [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];

  return v13;
}

- (void)_setupSpecifierIfNeeded:(id)a3 setBlock:(id)a4 getBlock:(id)a5
{
  if (self->_appID)
  {
    id v7 = a5;
    id v8 = a3;
    id v9 = objc_retainBlock(a4);
    [v8 setProperty:v9 forKey:@"setValueSelectedBlock"];

    id v10 = objc_retainBlock(v7);
    [v8 setProperty:v10 forKey:@"getValueSelectedBlock"];
  }
}

- (void)_updateSpecifierState:(id)a3
{
  p_settingsController = &self->_settingsController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_settingsController);
  [WeakRetained reloadSpecifier:v4];
}

- (void)_updateReduceSlideTransitionsSpecifiersAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = [(AXDisplayTextMotionSpecifiersHelper *)self _reduceMotionAvailable];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
  id v20 = WeakRetained;
  if (v5)
  {
    id v7 = [WeakRetained specifiers];
    id v8 = [(AXDisplayTextMotionSpecifiersHelper *)self reduceMotionReduceSlideTransitionsSpecifier];
    if ([v7 containsObject:v8])
    {
    }
    else
    {
      id v12 = objc_loadWeakRetained((id *)&self->_settingsController);
      v13 = [v12 specifiers];
      id v14 = [(AXDisplayTextMotionSpecifiersHelper *)self reduceMotionReduceSlideTransitionsFooterSpecifier];
      unsigned __int8 v15 = [v13 containsObject:v14];

      if ((v15 & 1) == 0)
      {
        id v16 = objc_loadWeakRetained((id *)&self->_settingsController);
        id v17 = [(AXDisplayTextMotionSpecifiersHelper *)self reduceMotionReduceSlideTransitionsFooterSpecifier];
        v21[0] = v17;
        v18 = [(AXDisplayTextMotionSpecifiersHelper *)self reduceMotionReduceSlideTransitionsSpecifier];
        v21[1] = v18;
        id v19 = +[NSArray arrayWithObjects:v21 count:2];
        [v16 insertContiguousSpecifiers:v19 afterSpecifierID:@"REDUCE_MOTION" animated:v3];
      }
    }
  }
  else
  {
    id v9 = [(AXDisplayTextMotionSpecifiersHelper *)self reduceMotionReduceSlideTransitionsFooterSpecifier];
    v22[0] = v9;
    id v10 = [(AXDisplayTextMotionSpecifiersHelper *)self reduceMotionReduceSlideTransitionsSpecifier];
    v22[1] = v10;
    id v11 = +[NSArray arrayWithObjects:v22 count:2];
    [v20 removeContiguousSpecifiers:v11 animated:v3];
  }
}

- (__CFString)_cfAppID
{
  return (__CFString *)self->_appID;
}

- (id)_accessibilitySettingsBaseController
{
  BOOL v3 = [(AXDisplayTextMotionSpecifiersHelper *)self settingsController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(AXDisplayTextMotionSpecifiersHelper *)self settingsController];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)_reduceMotionAvailable
{
  if (!self->_appID) {
    goto LABEL_5;
  }
  [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
  int v3 = _AXSReduceMotionEnabledApp();
  if (v3 != 1)
  {
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    if (_AXSReduceMotionEnabledApp() != -1)
    {
      LOBYTE(v3) = 0;
      return v3;
    }
LABEL_5:
    LOBYTE(v3) = _AXSReduceMotionEnabledGlobal() != 0;
  }
  return v3;
}

- (id)boldTextEnabled:(id)a3
{
  if (self->_appID)
  {
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    id v4 = +[NSNumber numberWithInt:_AXSEnhanceTextLegibilityEnabledApp()];
    unsigned __int8 v5 = v4;
    if (a3)
    {
      id v6 = +[AXDefaultOnOffViewController stringValueForNumber:v4];
    }
    else
    {
      id v6 = v4;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = +[NSNumber numberWithUnsignedChar:_AXSEnhanceTextLegibilityEnabledGlobal()];
  }

  return v7;
}

- (void)setBoldTextEnabled:(id)a3 specifier:(id)a4
{
  id v7 = a4;
  if (self->_appID)
  {
    [a3 integerValue];
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    _AXSSetEnhanceTextLegibilityEnabledApp();
    [(AXDisplayTextMotionSpecifiersHelper *)self _updateSpecifierState:v7];
    id v6 = +[AXSettings sharedInstance];
    [v6 aggregatePerAppSettingsStatistics];
  }
  else
  {
    [a3 BOOLValue];
    _AXSSetEnhanceTextLegibilityEnabled();
  }
}

- (id)largerTextEnabled:(id)a3
{
  if (self->_appID) {
    uint64_t v3 = [(AXDisplayTextMotionSpecifiersHelper *)self largerTextPerAppValue];
  }
  else {
    uint64_t v3 = _AXSLargeTextUsesExtendedRange() != 0;
  }
  id v4 = +[NSNumber numberWithInt:v3];
  unsigned __int8 v5 = +[AXDefaultOnOffViewController stringValueForNumber:v4];

  return v5;
}

- (int)largerTextPerAppValue
{
  v2 = (void *)_AXSCopyPreferredContentSizeCategoryNameApp();
  if (v2) {
    int v3 = 1;
  }
  else {
    int v3 = -1;
  }

  return v3;
}

- (id)buttonShapesEnabled:(id)a3
{
  if (self->_appID)
  {
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    id v4 = +[NSNumber numberWithInt:_AXSButtonShapesEnabledApp()];
    unsigned __int8 v5 = v4;
    if (a3)
    {
      id v6 = +[AXDefaultOnOffViewController stringValueForNumber:v4];
    }
    else
    {
      id v6 = v4;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = +[NSNumber numberWithUnsignedChar:_AXSButtonShapesEnabledGlobal()];
  }

  return v7;
}

- (void)setButtonShapesEnabled:(id)a3 specifier:(id)a4
{
  id v7 = a4;
  if (self->_appID)
  {
    [a3 integerValue];
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    _AXSSetButtonShapesEnabledApp();
    [(AXDisplayTextMotionSpecifiersHelper *)self _updateSpecifierState:v7];
    id v6 = +[AXSettings sharedInstance];
    [v6 aggregatePerAppSettingsStatistics];
  }
  else
  {
    [a3 BOOLValue];
    _AXSSetButtonShapesEnabled();
  }
}

- (id)onOffLabelsEnabled:(id)a3
{
  if (self->_appID)
  {
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    id v4 = +[NSNumber numberWithInt:_AXSIncreaseButtonLegibilityApp()];
    unsigned __int8 v5 = v4;
    if (a3)
    {
      id v6 = +[AXDefaultOnOffViewController stringValueForNumber:v4];
    }
    else
    {
      id v6 = v4;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = +[NSNumber numberWithUnsignedChar:_AXSIncreaseButtonLegibilityGlobal()];
  }

  return v7;
}

- (void)setOnOffLabelsEnabled:(id)a3 specifier:(id)a4
{
  id v7 = a4;
  if (self->_appID)
  {
    [a3 integerValue];
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    _AXSSetIncreaseButtonLegibilityApp();
    [(AXDisplayTextMotionSpecifiersHelper *)self _updateSpecifierState:v7];
    id v6 = +[AXSettings sharedInstance];
    [v6 aggregatePerAppSettingsStatistics];
  }
  else
  {
    [a3 BOOLValue];
    _AXSSetIncreaseButtonLegibility();
  }
}

- (id)reduceTransparencyEnabled:(id)a3
{
  if (self->_appID)
  {
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    id v4 = +[NSNumber numberWithInt:_AXSEnhanceBackgroundContrastEnabledApp()];
    unsigned __int8 v5 = v4;
    if (a3)
    {
      id v6 = +[AXDefaultOnOffViewController stringValueForNumber:v4];
    }
    else
    {
      id v6 = v4;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = +[NSNumber numberWithUnsignedChar:_AXSEnhanceBackgroundContrastEnabledGlobal()];
  }

  return v7;
}

- (void)setReduceTransparencyEnabled:(id)a3 specifier:(id)a4
{
  id v7 = a4;
  if (self->_appID)
  {
    [a3 integerValue];
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    _AXSSetEnhanceBackgroundContrastEnabledApp();
    [(AXDisplayTextMotionSpecifiersHelper *)self _updateSpecifierState:v7];
    id v6 = +[AXSettings sharedInstance];
    [v6 aggregatePerAppSettingsStatistics];
  }
  else
  {
    [a3 BOOLValue];
    _AXSSetEnhanceBackgroundContrastEnabled();
  }
}

- (id)darkenColorsEnabled:(id)a3
{
  if (self->_appID)
  {
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    id v4 = +[NSNumber numberWithInt:_AXDarkenSystemColorsApp()];
    unsigned __int8 v5 = v4;
    if (a3)
    {
      id v6 = +[AXDefaultOnOffViewController stringValueForNumber:v4];
    }
    else
    {
      id v6 = v4;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = +[NSNumber numberWithUnsignedChar:_AXDarkenSystemColorsGlobal()];
  }

  return v7;
}

- (void)setDarkenColorsEnabled:(id)a3 specifier:(id)a4
{
  id v7 = a4;
  if (self->_appID)
  {
    [a3 integerValue];
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    _AXSSetDarkenSystemColorsApp();
    [(AXDisplayTextMotionSpecifiersHelper *)self _updateSpecifierState:v7];
    id v6 = +[AXSettings sharedInstance];
    [v6 aggregatePerAppSettingsStatistics];
  }
  else
  {
    [a3 BOOLValue];
    _AXSSetDarkenSystemColors();
  }
}

- (id)differentiateWithoutColor:(id)a3
{
  if (self->_appID)
  {
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    id v4 = +[NSNumber numberWithInt:_AXSDifferentiateWithoutColorEnabledApp()];
    unsigned __int8 v5 = v4;
    if (a3)
    {
      id v6 = +[AXDefaultOnOffViewController stringValueForNumber:v4];
    }
    else
    {
      id v6 = v4;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = +[NSNumber numberWithUnsignedChar:_AXSDifferentiateWithoutColorEnabledGlobal()];
  }

  return v7;
}

- (void)setDifferentiateWithoutColorEnabled:(id)a3 specifier:(id)a4
{
  id v7 = a4;
  if (self->_appID)
  {
    [a3 integerValue];
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    _AXSSetDifferentiateWithoutColorEnabledApp();
    [(AXDisplayTextMotionSpecifiersHelper *)self _updateSpecifierState:v7];
    id v6 = +[AXSettings sharedInstance];
    [v6 aggregatePerAppSettingsStatistics];
  }
  else
  {
    [a3 BOOLValue];
    _AXSSetDifferentiateWithoutColorEnabled();
  }
}

- (id)reduceMotionEnabled:(id)a3
{
  if (self->_appID)
  {
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    id v4 = +[NSNumber numberWithInt:_AXSReduceMotionEnabledApp()];
    unsigned __int8 v5 = v4;
    if (a3)
    {
      id v6 = +[AXDefaultOnOffViewController stringValueForNumber:v4];
    }
    else
    {
      id v6 = v4;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = +[NSNumber numberWithUnsignedChar:_AXSReduceMotionEnabledGlobal()];
  }

  return v7;
}

- (void)setReduceMotionEnabled:(id)a3 specifier:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (self->_appID)
  {
    unsigned int v7 = [v15 integerValue];
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    _AXSSetReduceMotionEnabledApp();
    if (v7)
    {
      if (v7 != -1 || [(AXDisplayTextMotionSpecifiersHelper *)self _reduceMotionAvailable]) {
        goto LABEL_13;
      }
      id v8 = &off_22A248;
    }
    else
    {
      id v8 = &off_22A260;
    }
    [(AXDisplayTextMotionSpecifiersHelper *)self setReduceMotionReduceSlideTransitionsEnabled:v8 specifier:0];
LABEL_13:
    [(AXDisplayTextMotionSpecifiersHelper *)self _updateSpecifierState:v6];
    [(AXDisplayTextMotionSpecifiersHelper *)self _updateReduceSlideTransitionsSpecifiersAnimated:0];
    id v12 = +[AXSettings sharedInstance];
    [v12 aggregatePerAppSettingsStatistics];

    goto LABEL_17;
  }
  unsigned int v9 = [v15 BOOLValue];
  _AXSSetReduceMotionEnabled();
  if (v9 && (AXDeviceHasHomeButton() & 1) == 0)
  {
    id v10 = +[AXSettings sharedInstance];
    [v10 setDidResetD22Preferences:1];
  }
  if ([v15 BOOLValue]) {
    BOOL v11 = _AXSReduceMotionAutoplayMessagesEffectsEnabled() != 0;
  }
  else {
    BOOL v11 = 1;
  }
  v13 = [(AXDisplayTextMotionSpecifiersHelper *)self _accessibilitySettingsBaseController];
  id v14 = +[NSNumber numberWithBool:v11];
  [v13 setGizmoPref:v14 forKey:@"ReduceMotionAutoplayMessagesEffectsEnabled" domain:kAXSAccessibilityPreferenceDomain];

  if ((v9 & 1) == 0) {
    [(AXDisplayTextMotionSpecifiersHelper *)self setReduceMotionReduceSlideTransitionsEnabled:v15 specifier:0];
  }
LABEL_17:
}

- (id)smartInvertEnabled:(id)a3
{
  if (self->_appID)
  {
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    id v4 = +[NSNumber numberWithInt:_AXSInvertColorsEnabledApp()];
    unsigned __int8 v5 = v4;
    if (a3)
    {
      id v6 = +[AXDefaultOnOffViewController stringValueForNumber:v4];
    }
    else
    {
      id v6 = v4;
    }
    unsigned int v7 = v6;
  }
  else
  {
    unsigned int v7 = +[NSNumber numberWithBool:_AXSInvertColorsEnabledGlobal() != 0];
  }

  return v7;
}

- (void)setSmartInvertEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_appID)
  {
    [v6 integerValue];
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    _AXSInvertColorsSetEnabledApp();
    [(AXDisplayTextMotionSpecifiersHelper *)self _updateSpecifierState:v7];
    id v8 = +[AXSettings sharedInstance];
    [v8 aggregatePerAppSettingsStatistics];
  }
  else
  {
    unsigned int v9 = [(AXDisplayTextMotionSpecifiersHelper *)self settingsController];
    id v10 = [v9 traitCollection];
    BOOL v11 = (char *)[v10 userInterfaceStyle];

    if (v11 == (unsigned char *)&dword_0 + 2)
    {
      id v12 = [(AXDisplayTextMotionSpecifiersHelper *)self displayFilterUIClient];
      v13 = +[AXAccessQueue mainAccessQueue];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __71__AXDisplayTextMotionSpecifiersHelper_setSmartInvertEnabled_specifier___block_invoke;
      v14[3] = &unk_20A9E0;
      v14[4] = self;
      id v15 = v6;
      [v12 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:1 targetAccessQueue:v13 completion:v14];
    }
    else
    {
      -[AXDisplayTextMotionSpecifiersHelper handleGlobalSmartInvertEnabled:](self, "handleGlobalSmartInvertEnabled:", [v6 BOOLValue]);
    }
  }
}

void __71__AXDisplayTextMotionSpecifiersHelper_setSmartInvertEnabled_specifier___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 objectForKeyedSubscript:@"animationDuration"];
  [v3 doubleValue];

  id v4 = *(id *)(a1 + 40);
  AXPerformBlockOnMainThreadAfterDelay();
}

id __71__AXDisplayTextMotionSpecifiersHelper_setSmartInvertEnabled_specifier___block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) BOOLValue];

  return [v1 handleGlobalSmartInvertEnabled:v2];
}

- (void)handleGlobalSmartInvertEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  _AXSInvertColorsSetEnabled();
  unsigned __int8 v5 = +[AXSettings sharedInstance];
  unsigned int v6 = [v5 classicInvertColors];

  if (v6) {
    BOOL v7 = !v3;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v8 = +[AXSettings sharedInstance];
    [v8 setClassicInvertColors:0];
  }
  if (v3)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    id v10 = +[AXSettings sharedInstance];
    [v10 setLastSmartInvertColorsEnablement:Current];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
  [WeakRetained reloadSpecifierID:@"classInvert"];
}

- (id)reduceMotionReduceSlideTransitionsEnabled:(id)a3
{
  if (self->_appID)
  {
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    id v4 = +[NSNumber numberWithInt:_AXSReduceMotionReduceSlideTransitionsEnabledApp()];
    unsigned __int8 v5 = v4;
    if (a3)
    {
      id v6 = +[AXDefaultOnOffViewController stringValueForNumber:v4];
    }
    else
    {
      id v6 = v4;
    }
    BOOL v7 = v6;
  }
  else
  {
    BOOL v7 = +[NSNumber numberWithUnsignedChar:_AXSReduceMotionReduceSlideTransitionsEnabledGlobal()];
  }

  return v7;
}

- (void)setReduceMotionReduceSlideTransitionsEnabled:(id)a3 specifier:(id)a4
{
  id v7 = a4;
  if (self->_appID)
  {
    [a3 integerValue];
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    _AXSSetReduceMotionReduceSlideTransitionsEnabledApp();
    [(AXDisplayTextMotionSpecifiersHelper *)self _updateSpecifierState:v7];
    id v6 = +[AXSettings sharedInstance];
    [v6 aggregatePerAppSettingsStatistics];
  }
  else
  {
    [a3 BOOLValue];
    _AXSSetReduceMotionReduceSlideTransitionsEnabled();
  }
}

- (id)autoplayMessagesEffects:(id)a3
{
  uint64_t v3 = _AXSReduceMotionAutoplayMessagesEffectsEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setAutoplayMessagesEffects:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  [v5 BOOLValue];
  _AXSSetReduceMotionAutoplayMessagesEffectsEnabled();
  id v6 = [(AXDisplayTextMotionSpecifiersHelper *)self _accessibilitySettingsBaseController];
  [v6 setGizmoPref:v5 forKey:@"ReduceMotionAutoplayMessagesEffectsEnabled" domain:kAXSAccessibilityPreferenceDomain];
}

- (id)autoplayAnimatedImages:(id)a3
{
  uint64_t v3 = _AXSReduceMotionAutoplayAnimatedImagesEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setAutoplayAnimatedImages:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  [v5 BOOLValue];
  _AXSSetReduceMotionAutoplayAnimatedImagesEnabled();
  id v6 = [(AXDisplayTextMotionSpecifiersHelper *)self _accessibilitySettingsBaseController];
  [v6 setGizmoPref:v5 forKey:@"ReduceMotionAutoplayAnimatedImagesEnabled" domain:kAXSAccessibilityPreferenceDomain];
}

- (id)autoplayVideoPreviews:(id)a3
{
  if (self->_appID)
  {
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    id v4 = +[NSNumber numberWithInt:_AXSReduceMotionAutoplayVideoPreviewsEnabledApp()];
    id v5 = v4;
    if (a3)
    {
      id v6 = +[AXDefaultOnOffViewController stringValueForNumber:v4];
    }
    else
    {
      id v6 = v4;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = +[NSNumber numberWithUnsignedChar:_AXSReduceMotionAutoplayVideoPreviewsEnabledGlobal()];
  }

  return v7;
}

- (void)setAutoplayVideoPreviews:(id)a3 specifier:(id)a4
{
  id v7 = a4;
  if (self->_appID)
  {
    [a3 integerValue];
    [(AXDisplayTextMotionSpecifiersHelper *)self _cfAppID];
    _AXSSetReduceMotionAutoplayVideoPreviewsEnabledApp();
    [(AXDisplayTextMotionSpecifiersHelper *)self _updateSpecifierState:v7];
    id v6 = +[AXSettings sharedInstance];
    [v6 aggregatePerAppSettingsStatistics];
  }
  else
  {
    [a3 BOOLValue];
    _AXSSetReduceMotionAutoplayVideoPreviewsEnabled();
  }
}

- (AXUIClient)displayFilterUIClient
{
  displayFilterUIClient = self->_displayFilterUIClient;
  if (!displayFilterUIClient)
  {
    id v4 = objc_alloc((Class)AXUIClient);
    id v5 = (AXUIClient *)[v4 initWithIdentifier:@"HomeClickController" serviceBundleName:AXDisplayFilterUIServiceName];
    id v6 = self->_displayFilterUIClient;
    self->_displayFilterUIClient = v5;

    displayFilterUIClient = self->_displayFilterUIClient;
  }

  return displayFilterUIClient;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (AccessibilitySettingsBaseController)settingsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);

  return (AccessibilitySettingsBaseController *)WeakRetained;
}

- (void)setSettingsController:(id)a3
{
}

- (PSSpecifier)reduceMotionReduceSlideTransitionsSpecifier
{
  return self->_reduceMotionReduceSlideTransitionsSpecifier;
}

- (void)setReduceMotionReduceSlideTransitionsSpecifier:(id)a3
{
}

- (PSSpecifier)reduceMotionReduceSlideTransitionsFooterSpecifier
{
  return self->_reduceMotionReduceSlideTransitionsFooterSpecifier;
}

- (void)setReduceMotionReduceSlideTransitionsFooterSpecifier:(id)a3
{
}

- (PSSpecifier)motionCuesInVehicleActivationSpecifier
{
  return self->_motionCuesInVehicleActivationSpecifier;
}

- (void)setMotionCuesInVehicleActivationSpecifier:(id)a3
{
}

- (PSSpecifier)motionCuesInVehicleActivationFooterSpecifier
{
  return self->_motionCuesInVehicleActivationFooterSpecifier;
}

- (void)setMotionCuesInVehicleActivationFooterSpecifier:(id)a3
{
}

- (void)setDisplayFilterUIClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayFilterUIClient, 0);
  objc_storeStrong((id *)&self->_motionCuesInVehicleActivationFooterSpecifier, 0);
  objc_storeStrong((id *)&self->_motionCuesInVehicleActivationSpecifier, 0);
  objc_storeStrong((id *)&self->_reduceMotionReduceSlideTransitionsFooterSpecifier, 0);
  objc_storeStrong((id *)&self->_reduceMotionReduceSlideTransitionsSpecifier, 0);
  objc_destroyWeak((id *)&self->_settingsController);
  objc_storeStrong((id *)&self->_appID, 0);

  objc_storeStrong((id *)&self->_learnMoreNavigationController, 0);
}

@end