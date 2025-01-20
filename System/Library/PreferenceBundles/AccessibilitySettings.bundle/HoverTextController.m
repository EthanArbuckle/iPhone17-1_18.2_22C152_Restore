@interface HoverTextController
- (BOOL)_isLargeTextTypingController;
- (HoverTextController)init;
- (id)_colorPickerConfigurationForIdentifier:(id)a3;
- (id)_selectedColorForIdentifier:(id)a3;
- (id)hoverTextActivationLock:(id)a3;
- (id)hoverTextActivationModifier:(id)a3;
- (id)hoverTextColorForSpecifier:(id)a3;
- (id)hoverTextContentSizeForSpecifier:(id)a3;
- (id)hoverTextDisplayMode:(id)a3;
- (id)hoverTextEnabled:(id)a3;
- (id)hoverTextFont:(id)a3;
- (id)hoverTextScrollSpeed:(id)a3;
- (id)hoverTextTypingDisplayMode:(id)a3;
- (id)hoverTextTypingEnabled;
- (id)hoverTextTypingEnabled:(id)a3;
- (id)hoverTextTypingTextStyle:(id)a3;
- (id)largerTextEnabled:(id)a3;
- (id)specifiers;
- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5;
- (void)resetHoverTypingSettings;
- (void)setHoverTextActivationLock:(id)a3 specifier:(id)a4;
- (void)setHoverTextContentSize:(id)a3 forSpecifier:(id)a4;
- (void)setHoverTextEnabled:(id)a3 specifier:(id)a4;
- (void)setHoverTextTypingEnabled:(id)a3;
- (void)showResetActionSheet;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation HoverTextController

- (HoverTextController)init
{
  v28.receiver = self;
  v28.super_class = (Class)HoverTextController;
  v2 = [(HoverTextController *)&v28 init];
  if (v2)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v29[0] = kAXSHoverTextEnabledNotification;
    v29[1] = kAXSHoverTextFontSizeChangedNotification;
    v29[2] = kAXSHoverTextContentSizeChangedNotification;
    v29[3] = kAXSHoverTextBackgroundOpacityChangedNotification;
    v29[4] = kAXSHoverTextDisplayModeChangedNotification;
    v29[5] = kAXSHoverTextFontNameChangedNotification;
    v29[6] = kAXSHoverTextTextColorDataChangedNotification;
    v29[7] = kAXSHoverTextInsertionPointColorDataChangedNotification;
    v29[8] = kAXSHoverTextBackgroundColorDataChangedNotification;
    v29[9] = kAXSHoverTextBorderColorDataChangedNotification;
    v29[10] = kAXSHoverTextTypingEnabledNotification;
    v29[11] = kAXSHoverTextTypingDisplayModeChangedNotification;
    v29[12] = kAXSHoverTextTypingFontNameChangedNotification;
    v29[13] = kAXSHoverTextTypingTextColorDataChangedNotification;
    v29[14] = kAXSHoverTextTypingInsertionPointColorDataChangedNotification;
    v29[15] = kAXSHoverTextTypingBackgroundColorDataChangedNotification;
    v29[16] = kAXSHoverTextTypingBorderColorDataChangedNotification;
    v3 = +[NSArray arrayWithObjects:v29 count:17];
    id v4 = [v3 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v25;
      do
      {
        v6 = 0;
        do
        {
          if (*(void *)v25 != v5) {
            objc_enumerationMutation(v3);
          }
          CFStringRef v7 = *(const __CFString **)(*((void *)&v24 + 1) + 8 * (void)v6);
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_reloadSpecs, v7, 0, (CFNotificationSuspensionBehavior)1028);
          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [v3 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v4);
    }

    objc_initWeak(&location, v2);
    v9 = +[AXSettings sharedInstance];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __27__HoverTextController_init__block_invoke;
    v21[3] = &unk_208798;
    objc_copyWeak(&v22, &location);
    [v9 registerUpdateBlock:v21 forRetrieveSelector:"hoverTextActivationLockEnabled" withListener:v2];

    objc_destroyWeak(&v22);
    v10 = +[AXSettings sharedInstance];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __27__HoverTextController_init__block_invoke_2;
    v19[3] = &unk_208798;
    objc_copyWeak(&v20, &location);
    [v10 registerUpdateBlock:v19 forRetrieveSelector:"hoverTextPreferredActivatorKey" withListener:v2];

    objc_destroyWeak(&v20);
    v11 = +[AXSettings sharedInstance];
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = __27__HoverTextController_init__block_invoke_3;
    v17 = &unk_208798;
    objc_copyWeak(&v18, &location);
    [v11 registerUpdateBlock:&v14 forRetrieveSelector:"hoverTextScrollingSpeed" withListener:v2];

    objc_destroyWeak(&v18);
    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v2 selector:"_reloadSpecs" name:_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification object:0];

    objc_destroyWeak(&location);
  }
  return v2;
}

void __27__HoverTextController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadSpecs];
}

void __27__HoverTextController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadSpecs];
}

void __27__HoverTextController_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadSpecs];
}

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v84 = OBJC_IVAR___PSListController__specifiers;
    val = self;
    v86 = +[NSMutableArray array];
    v85 = +[PSSpecifier emptyGroupSpecifier];
    if ([(HoverTextController *)val _isLargeTextTypingController])
    {
      id v4 = settingsLocString(@"HOVERTYPING_TITLE", @"AccessibilityTitles");
      uint64_t v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:val set:"setHoverTextTypingEnabled:" get:"hoverTextTypingEnabled" detail:0 cell:6 edit:0];

      uint64_t v6 = PSIDKey;
      [v5 setProperty:@"HoverTextTypingEnabled" forKey:PSIDKey];
      [v86 addObject:v5];
    }
    else
    {
      if (AXDeviceSupportsPencilHover()) {
        CFStringRef v7 = @"HOVERTEXT_INTRO_PENCIL";
      }
      else {
        CFStringRef v7 = @"HOVERTEXT_INTRO";
      }
      settingsLocString(v7, @"Accessibility");
      v81 = (id *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      [v85 setProperty:v9 forKey:PSFooterCellClassGroupKey];

      v10 = +[NSBundle bundleForClass:objc_opt_class()];
      v11 = [v10 bundlePath];
      [v85 setProperty:v11 forKey:@"bundlePath"];

      [v85 setProperty:@"Accessibility" forKey:@"table"];
      v107[0] = @"contentLabel";
      v107[1] = @"alreadyLocalized";
      v108[0] = v81;
      v108[1] = &__kCFBooleanTrue;
      v12 = +[NSDictionary dictionaryWithObjects:v108 forKeys:v107 count:2];
      v109 = v12;
      v13 = +[NSArray arrayWithObjects:&v109 count:1];
      v82 = (id *)[v13 mutableCopy];

      uint64_t v14 = AXTeachableFeatureHoverText;
      v83 = +[AXTeachableMomentsManager teachableItemsForFeature:AXTeachableFeatureHoverText];
      if ([v83 count])
      {
        v105[0] = @"moreLabel";
        uint64_t v15 = settingsLocString(@"HoverTextWhatsNewLink", @"Accessibility");
        v106[0] = v15;
        v105[1] = @"additionalTitleLabel";
        v16 = settingsLocString(@"HOVERTEXT_TITLE", @"Accessibility");
        v106[1] = v16;
        v105[2] = @"alreadyLocalized";
        v105[3] = @"symbolName";
        v106[2] = &__kCFBooleanTrue;
        v106[3] = @"character.magnify";
        v17 = +[NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:4];
        id v80 = [v17 mutableCopy];

        id v18 = objc_opt_new();
        v103[0] = @"sectionLabel";
        v19 = +[AXTeachableMomentsManager notificationTitleForFeature:v14];
        v103[1] = @"alreadyLocalized";
        v104[0] = v19;
        v104[1] = &__kCFBooleanTrue;
        id v20 = +[NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:2];
        [v18 addObject:v20];

        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        v21 = v83;
        id v22 = [v21 countByEnumeratingWithState:&v96 objects:v102 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v97;
          do
          {
            for (i = 0; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v97 != v23) {
                objc_enumerationMutation(v21);
              }
              long long v25 = *(void **)(*((void *)&v96 + 1) + 8 * i);
              v100[0] = @"headerLabel";
              long long v26 = [v25 itemTitle];
              v101[0] = v26;
              v100[1] = @"contentLabel";
              long long v27 = [v25 itemDescription];
              v100[2] = @"alreadyLocalized";
              v101[1] = v27;
              v101[2] = &__kCFBooleanTrue;
              objc_super v28 = +[NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:3];
              [v18 addObject:v28];
            }
            id v22 = [v21 countByEnumeratingWithState:&v96 objects:v102 count:16];
          }
          while (v22);
        }

        [v80 setObject:v18 forKey:@"additionalContent"];
        [v82 addObject:v80];
      }
      [v85 setProperty:v82 forKey:@"content"];
      [v86 addObject:v85];
      v29 = settingsLocString(@"HOVERTEXT_TITLE", @"AccessibilityTitles");
      uint64_t v5 = +[PSSpecifier preferenceSpecifierNamed:v29 target:val set:"setHoverTextEnabled:specifier:" get:"hoverTextEnabled:" detail:0 cell:6 edit:0];

      uint64_t v6 = PSIDKey;
      [v5 setProperty:@"HoverTextEnabled" forKey:PSIDKey];
      [v86 addObject:v5];
    }
    v30 = settingsLocString(@"HOVER_TEXT_TEXT_OPTIONS", @"Accessibility");
    v31 = +[PSSpecifier groupSpecifierWithName:v30];

    [v86 addObject:v31];
    unsigned int v32 = [(HoverTextController *)val _isLargeTextTypingController];
    v33 = settingsLocString(@"AXHoverTextDisplayModeTitle", @"Accessibility");
    if (v32)
    {
      v34 = +[PSSpecifier preferenceSpecifierNamed:v33 target:val set:0 get:"hoverTextTypingDisplayMode:" detail:objc_opt_class() cell:2 edit:0];

      [v34 setProperty:@"HoverTextTypingDisplayMode" forKey:v6];
    }
    else
    {
      v34 = +[PSSpecifier preferenceSpecifierNamed:v33 target:val set:0 get:"hoverTextDisplayMode:" detail:objc_opt_class() cell:2 edit:0];

      [v34 setProperty:@"HoverTextDisplayMode" forKey:v6];
    }
    [v86 addObject:v34];
    if ([(HoverTextController *)val _isLargeTextTypingController])
    {
      v35 = v34;
    }
    else
    {
      v36 = settingsLocString(@"AXHoverTextScrollingSpeedTitle", @"Accessibility");
      v35 = +[PSSpecifier preferenceSpecifierNamed:v36 target:val set:0 get:"hoverTextScrollSpeed:" detail:objc_opt_class() cell:2 edit:0];

      [v35 setProperty:@"HoverTextScrollSpeed" forKey:v6];
      [v86 addObject:v35];
    }
    v37 = settingsLocString(@"HOVER_TEXT_TEXT_STYLE", @"Accessibility");
    v38 = +[PSSpecifier preferenceSpecifierNamed:v37 target:val set:0 get:"hoverTextFont:" detail:objc_opt_class() cell:2 edit:0];

    if ([(HoverTextController *)val _isLargeTextTypingController]) {
      CFStringRef v39 = @"HoverTypingStyle";
    }
    else {
      CFStringRef v39 = @"HoverTextStyle";
    }
    [v38 setProperty:v39 forKey:v6];
    [v86 addObject:v38];
    v40 = settingsLocString(@"HOVER_TEXT_TEXT_SIZE", @"Accessibility");
    v41 = +[PSSpecifier preferenceSpecifierNamed:v40 target:val set:0 get:"largerTextEnabled:" detail:objc_opt_class() cell:2 edit:0];

    [v41 setProperty:AXUIServerProcessName forKey:@"BundleIdentifier"];
    if ([(HoverTextController *)val _isLargeTextTypingController]) {
      v42 = @"HOVER_TYPING_TEXT_SIZE_DESCRIPTION";
    }
    else {
      v42 = @"HOVER_TEXT_TEXT_SIZE_DESCRIPTION";
    }
    v43 = settingsLocString(v42, @"Accessibility");
    [v41 setProperty:v43 forKey:@"exampleText"];
    objc_initWeak(&location, v41);
    objc_initWeak(&from, val);
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472;
    v91[2] = __33__HoverTextController_specifiers__block_invoke;
    v91[3] = &unk_20C2C0;
    objc_copyWeak(&v92, &from);
    objc_copyWeak(&v93, &location);
    v44 = objc_retainBlock(v91);
    [v41 setProperty:v44 forKey:@"setSizeCategory"];

    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472;
    v88[2] = __33__HoverTextController_specifiers__block_invoke_2;
    v88[3] = &unk_20C2E8;
    objc_copyWeak(&v89, &from);
    objc_copyWeak(&v90, &location);
    v45 = objc_retainBlock(v88);
    [v41 setProperty:v45 forKey:@"getSizeCategory"];

    [v41 setProperty:@"HoverTextSize" forKey:v6];
    [v86 addObject:v41];
    if ([(HoverTextController *)val _isLargeTextTypingController]) {
      settingsLocString(@"HOVER_TYPING_DISPLAY_COLOR_OPTIONS", @"Accessibility");
    }
    else {
    v46 = settingsLocString(@"HOVER_TEXT_COLOR_OPTIONS", @"Accessibility");
    }
    v47 = +[PSSpecifier groupSpecifierWithName:v46];

    [v86 addObject:v47];
    v48 = settingsLocString(@"HOVER_TEXT_TEXT_COLOR", @"Accessibility");
    v49 = +[PSSpecifier preferenceSpecifierNamed:v48 target:val set:0 get:"hoverTextColorForSpecifier:" detail:0 cell:-1 edit:0];

    [v49 setIdentifier:@"HOVER_TEXT_TEXT_COLOR_ID"];
    uint64_t v50 = objc_opt_class();
    uint64_t v51 = PSCellClassKey;
    [v49 setProperty:v50 forKey:PSCellClassKey];
    uint64_t v52 = PSEnabledKey;
    [v49 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    [v86 addObject:v49];
    v53 = settingsLocString(@"HOVER_TEXT_INSERTION_POINT_COLOR", @"Accessibility");
    v54 = +[PSSpecifier preferenceSpecifierNamed:v53 target:val set:0 get:"hoverTextColorForSpecifier:" detail:0 cell:-1 edit:0];

    [v54 setIdentifier:@"HOVER_TEXT_INSERTION_POINT_COLOR_ID"];
    [v54 setProperty:objc_opt_class() forKey:v51];
    [v54 setProperty:&__kCFBooleanTrue forKey:v52];
    [v86 addObject:v54];
    v55 = settingsLocString(@"HOVER_TEXT_BACKGROUND_COLOR", @"Accessibility");
    v56 = +[PSSpecifier preferenceSpecifierNamed:v55 target:val set:0 get:"hoverTextColorForSpecifier:" detail:0 cell:-1 edit:0];

    [v56 setIdentifier:@"HOVER_TEXT_BACKGROUND_COLOR_ID"];
    [v56 setProperty:objc_opt_class() forKey:v51];
    [v56 setProperty:&__kCFBooleanTrue forKey:v52];
    [v86 addObject:v56];
    v57 = settingsLocString(@"HOVER_TEXT_BORDER_COLOR", @"Accessibility");
    v58 = +[PSSpecifier preferenceSpecifierNamed:v57 target:val set:0 get:"hoverTextColorForSpecifier:" detail:0 cell:-1 edit:0];

    [v58 setIdentifier:@"HOVER_TEXT_BORDER_COLOR_ID"];
    [v58 setProperty:objc_opt_class() forKey:v51];
    [v58 setProperty:&__kCFBooleanTrue forKey:v52];
    [v86 addObject:v58];
    if ([(HoverTextController *)val _isLargeTextTypingController])
    {
      v59 = settingsLocString(@"HOVER_TYPING_COLOR_OPTIONS", @"Accessibility");
      v60 = +[PSSpecifier groupSpecifierWithName:v59];

      [v86 addObject:v60];
      v61 = settingsLocString(@"HOVER_TYPING_MISSPELLED_WORD_COLOR", @"Accessibility");
      v62 = +[PSSpecifier preferenceSpecifierNamed:v61 target:val set:0 get:"hoverTextColorForSpecifier:" detail:0 cell:-1 edit:0];

      [v62 setProperty:objc_opt_class() forKey:v51];
      [v62 setIdentifier:@"HOVER_TYPING_MISSPELLED_WORD_COLOR_ID"];
      [v62 setProperty:&__kCFBooleanTrue forKey:v52];
      [v86 addObject:v62];
      v63 = settingsLocString(@"HOVER_TYPING_AUTOCORRECTED_WORD_COLOR", @"Accessibility");
      v58 = +[PSSpecifier preferenceSpecifierNamed:v63 target:val set:0 get:"hoverTextColorForSpecifier:" detail:0 cell:-1 edit:0];

      [v58 setIdentifier:@"HOVER_TYPING_AUTOCORRECTED_WORD_COLOR_ID"];
      [v58 setProperty:objc_opt_class() forKey:v51];
      [v58 setProperty:&__kCFBooleanTrue forKey:v52];
      [v86 addObject:v58];
    }
    if (AXIsInternalInstall()
      && [(HoverTextController *)val _isLargeTextTypingController])
    {
      v64 = settingsLocString(@"HOVER_TYPING_INTERNAL_HEADER", @"Accessibility");
      v65 = +[PSSpecifier groupSpecifierWithName:v64];

      [v86 addObject:v65];
      v66 = settingsLocString(@"HOVER_TYPING_TEXT_STYLE", @"Accessibility");
      v58 = +[PSSpecifier preferenceSpecifierNamed:v66 target:val set:0 get:"hoverTextTypingTextStyle:" detail:objc_opt_class() cell:2 edit:0];

      [v58 setProperty:@"HoverTypingTextStyle" forKey:v6];
      [v86 addObject:v58];
    }
    if ((AXDeviceIsPhone() & 1) == 0
      && ![(HoverTextController *)val _isLargeTextTypingController])
    {
      v67 = settingsLocString(@"HOVER_TEXT_CONTROL_OPTIONS", @"Accessibility");
      v68 = +[PSSpecifier groupSpecifierWithName:v67];

      v69 = settingsLocString(@"HOVER_TEXT_CONTROL_OPTIONS_FOOTER", @"Accessibility");
      [v68 setProperty:v69 forKey:PSFooterTextGroupKey];

      [v86 addObject:v68];
      v70 = settingsLocString(@"HOVER_TEXT_ACTIVATION_MODIFIER", @"Accessibility");
      v71 = +[PSSpecifier preferenceSpecifierNamed:v70 target:val set:0 get:"hoverTextActivationModifier:" detail:objc_opt_class() cell:2 edit:0];

      [v71 setProperty:@"HoverTextActivationModifier" forKey:v6];
      [v86 addObject:v71];
      v72 = settingsLocString(@"HOVER_TEXT_ACTIVATION_LOCK", @"Accessibility");
      v58 = +[PSSpecifier preferenceSpecifierNamed:v72 target:val set:"setHoverTextActivationLock:specifier:" get:"hoverTextActivationLock:" detail:0 cell:6 edit:0];

      [v86 addObject:v58];
    }
    if ([(HoverTextController *)val _isLargeTextTypingController])
    {
      v73 = +[PSSpecifier emptyGroupSpecifier];

      [v86 addObject:v73];
      v74 = settingsLocString(@"HOVER_TYPING_RESET_BUTTON_TITLE", @"Accessibility");
      v58 = +[PSSpecifier preferenceSpecifierNamed:v74 target:val set:0 get:0 detail:0 cell:13 edit:0];

      [v58 setButtonAction:"showResetActionSheet"];
      [v58 setProperty:@"HOVER_TYPING_RESET_BUTTON" forKey:v6];
      [v86 addObject:v58];
    }
    else if (AXHasCapability())
    {
      v75 = +[PSSpecifier emptyGroupSpecifier];

      v76 = settingsLocString(@"HOVER_TYPING_FOOTER", @"Accessibility");
      [v75 setProperty:v76 forKey:PSFooterTextGroupKey];

      [v86 addObject:v75];
      v77 = settingsLocString(@"HOVER_TYPING", @"Accessibility");
      v58 = +[PSSpecifier preferenceSpecifierNamed:v77 target:val set:0 get:"hoverTextTypingEnabled:" detail:objc_opt_class() cell:2 edit:0];

      [v58 setProperty:@"HOVER_TYPING" forKey:v6];
      [v86 addObject:v58];
    }
    v78 = *(void **)&val->AXUISettingsBaseListController_opaque[v84];
    *(void *)&val->AXUISettingsBaseListController_opaque[v84] = v86;

    objc_destroyWeak(&v90);
    objc_destroyWeak(&v89);
    objc_destroyWeak(&v93);
    objc_destroyWeak(&v92);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    v3 = *(void **)&val->AXUISettingsBaseListController_opaque[v84];
  }

  return v3;
}

void __33__HoverTextController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setHoverTextContentSize:v4 forSpecifier:v5];
}

id __33__HoverTextController_specifiers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained hoverTextContentSizeForSpecifier:v3];

  return v4;
}

- (void)showResetActionSheet
{
  id v3 = settingsLocString(@"HOVER_TYPING_RESET_ALERT_TITLE", @"Accessibility");
  id v4 = settingsLocString(@"HOVER_TYPING_RESET_ALERT_DESCRIPTION", @"Accessibility");
  id v5 = +[UIAlertController alertControllerWithTitle:v3 message:v4 preferredStyle:0];

  uint64_t v6 = settingsLocString(@"HOVER_TYPING_RESET", @"Accessibility");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __43__HoverTextController_showResetActionSheet__block_invoke;
  v10[3] = &unk_208B68;
  v10[4] = self;
  CFStringRef v7 = +[UIAlertAction actionWithTitle:v6 style:2 handler:v10];
  [v5 addAction:v7];

  v8 = settingsLocString(@"HOVER_TYPING_CANCEL", @"Accessibility");
  v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:&__block_literal_global_71];
  [v5 addAction:v9];

  [(HoverTextController *)self presentViewController:v5 animated:1 completion:0];
}

id __43__HoverTextController_showResetActionSheet__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetHoverTypingSettings];
}

- (void)setHoverTextEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSHoverTextSetEnabled(v4);
}

- (id)hoverTextEnabled:(id)a3
{
  uint64_t v3 = _AXSHoverTextEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (id)hoverTextFont:(id)a3
{
  unsigned int v3 = [(HoverTextController *)self _isLargeTextTypingController];
  id v4 = +[AXSettings sharedInstance];
  id v5 = v4;
  if (v3) {
    [v4 hoverTextTypingFontName];
  }
  else {
  uint64_t v6 = [v4 hoverTextFontName];
  }

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    settingsLocString(@"DEFAULT", @"Accessibility");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)hoverTextColorForSpecifier:(id)a3
{
  id v4 = [a3 identifier];
  id v5 = [(HoverTextController *)self _selectedColorForIdentifier:v4];

  return v5;
}

- (void)setHoverTextActivationLock:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[AXSettings sharedInstance];
  id v5 = [v4 BOOLValue];

  [v6 setHoverTextActivationLockEnabled:v5];
}

- (id)hoverTextActivationLock:(id)a3
{
  unsigned int v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 hoverTextActivationLockEnabled]);

  return v4;
}

- (id)hoverTextActivationModifier:(id)a3
{
  unsigned int v3 = +[AXSettings sharedInstance];
  id v4 = hoverTextActivationKeyLocString((uint64_t)[v3 hoverTextPreferredActivatorKey]);

  return v4;
}

- (id)hoverTextScrollSpeed:(id)a3
{
  unsigned int v3 = +[AXSettings sharedInstance];
  id v4 = hoverTextScrollingSpeedLocString((unint64_t)[v3 hoverTextScrollingSpeed]);

  return v4;
}

- (id)hoverTextDisplayMode:(id)a3
{
  unsigned int v3 = +[AXSettings sharedInstance];
  id v4 = hoverTextDisplayModeLocString((unint64_t)[v3 hoverTextDisplayMode]);

  return v4;
}

- (void)setHoverTextContentSize:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:UIContentSizeCategoryUnspecified])
  {

    id v5 = 0;
  }
  id v4 = +[AXSettings sharedInstance];
  [v4 setHoverTextContentSize:v5];
}

- (id)hoverTextContentSizeForSpecifier:(id)a3
{
  unsigned int v3 = +[AXSettings sharedInstance];
  id v4 = [v3 hoverTextContentSize];

  return v4;
}

- (id)largerTextEnabled:(id)a3
{
  unsigned int v3 = (void *)_AXSHoverTextCopyContentSize();
  if (v3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  id v5 = +[NSNumber numberWithInt:v4];
  id v6 = +[AXDefaultOnOffViewController stringValueForNumber:v5];

  return v6;
}

- (void)setHoverTextTypingEnabled:(id)a3
{
  id v3 = a3;
  id v5 = +[AXSettings sharedInstance];
  id v4 = [v3 BOOLValue];

  [v5 setHoverTextTypingEnabled:v4];
}

- (id)hoverTextTypingEnabled
{
  v2 = +[AXSettings sharedInstance];
  id v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 hoverTextTypingEnabled]);

  return v3;
}

- (id)hoverTextTypingDisplayMode:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = hoverTextDisplayModeLocString((unint64_t)[v3 hoverTextTypingDisplayMode]);

  return v4;
}

- (id)hoverTextTypingTextStyle:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = [v3 hoverTextTypingTextStyle];
  id v5 = +[HoverTypingTextStyleViewController visualTitleForEnumValue:v4];

  return v5;
}

- (id)hoverTextTypingEnabled:(id)a3
{
  if (_AXSHoverTextTypingEnabled()) {
    id v3 = @"ON";
  }
  else {
    id v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (void)resetHoverTypingSettings
{
  v2 = +[AXSettings sharedInstance];
  [v2 setHoverTextTypingFontName:0];

  id v3 = +[AXSettings sharedInstance];
  [v3 setHoverTextContentSize:0];

  id v4 = +[AXSettings sharedInstance];
  [v4 setHoverTextTypingDisplayMode:2];

  id v5 = +[AXSettings sharedInstance];
  [v5 setHoverTextTypingTextColorData:0];

  id v6 = +[AXSettings sharedInstance];
  [v6 setHoverTextTypingBackgroundColorData:0];

  id v7 = +[AXSettings sharedInstance];
  [v7 setHoverTextTypingBorderColorData:0];

  v8 = +[AXSettings sharedInstance];
  [v8 setHoverTextTypingMisspelledTextColorData:0];

  v9 = +[AXSettings sharedInstance];
  [v9 setHoverTextTypingAutocorrectedTextColorData:0];

  v10 = +[AXSettings sharedInstance];
  [v10 setHoverTextTypingInsertionPointColorData:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v12 = (const __CFString *)kAXSResetHoverTextTypingNotification;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v12, 0, 0, 1u);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HoverTextController;
  [(HoverTextController *)&v18 tableView:v6 didSelectRowAtIndexPath:v7];
  v17.receiver = self;
  v17.super_class = (Class)HoverTextController;
  v8 = [(HoverTextController *)&v17 tableView:v6 cellForRowAtIndexPath:v7];
  v9 = [v8 specifier];
  v10 = [v9 identifier];
  selectedIdentifier = self->_selectedIdentifier;
  self->_selectedIdentifier = v10;

  if (self->_selectedIdentifier)
  {
    CFStringRef v12 = -[HoverTextController _colorPickerConfigurationForIdentifier:](self, "_colorPickerConfigurationForIdentifier:");
    if (v12)
    {
      id v13 = objc_alloc_init((Class)UIColorPickerViewController);
      [v13 setModalPresentationStyle:7];
      uint64_t v14 = [(HoverTextController *)self _selectedColorForIdentifier:self->_selectedIdentifier];
      [v13 setSelectedColor:v14];

      uint64_t v15 = [v13 popoverPresentationController];
      [v15 setPermittedArrowDirections:12];
      objc_msgSend(v15, "setSourceRect:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
      v16 = [v8 control];
      [v15 setSourceView:v16];

      [(HoverTextController *)self presentViewController:v13 animated:1 completion:0];
      [v13 setDelegate:self];
      [v6 deselectRowAtIndexPath:v7 animated:1];
    }
  }
}

- (BOOL)_isLargeTextTypingController
{
  int v3 = AXHasCapability();
  if (v3)
  {
    id v4 = [(HoverTextController *)self specifier];
    id v5 = [v4 propertyForKey:PSIDKey];
    unsigned __int8 v6 = [v5 isEqualToString:@"HOVER_TYPING"];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (id)_colorPickerConfigurationForIdentifier:(id)a3
{
  id v4 = objc_alloc_init((Class)_UIColorPickerViewControllerConfiguration);
  if ([(NSString *)self->_selectedIdentifier isEqualToString:@"HOVER_TEXT_TEXT_COLOR_ID"])
  {
    id v5 = settingsLocString(@"HOVER_TEXT_TEXT_COLOR", @"Accessibility");
    [v4 setTitle:v5];

    unsigned __int8 v6 = +[UIColor blackColor];
    id v20 = v6;
    id v7 = &v20;
LABEL_13:
    id v13 = +[NSArray arrayWithObjects:v7 count:1];
    objc_msgSend(v4, "set_suggestedColors:", v13);

    goto LABEL_14;
  }
  if ([(NSString *)self->_selectedIdentifier isEqualToString:@"HOVER_TEXT_INSERTION_POINT_COLOR_ID"])
  {
    v8 = settingsLocString(@"HOVER_TEXT_INSERTION_POINT_COLOR", @"Accessibility");
    [v4 setTitle:v8];

    unsigned __int8 v6 = +[UIColor blackColor];
    v19 = v6;
    id v7 = &v19;
    goto LABEL_13;
  }
  if ([(NSString *)self->_selectedIdentifier isEqualToString:@"HOVER_TEXT_BACKGROUND_COLOR_ID"])
  {
    v9 = settingsLocString(@"HOVER_TEXT_BACKGROUND_COLOR", @"Accessibility");
    [v4 setTitle:v9];

    unsigned __int8 v6 = +[UIColor blackColor];
    objc_super v18 = v6;
    id v7 = &v18;
    goto LABEL_13;
  }
  if ([(NSString *)self->_selectedIdentifier isEqualToString:@"HOVER_TEXT_BORDER_COLOR_ID"])
  {
    v10 = settingsLocString(@"HOVER_TEXT_BORDER_COLOR", @"Accessibility");
    [v4 setTitle:v10];

    unsigned __int8 v6 = +[UIColor blackColor];
    objc_super v17 = v6;
    id v7 = &v17;
    goto LABEL_13;
  }
  if ([(NSString *)self->_selectedIdentifier isEqualToString:@"HOVER_TYPING_MISSPELLED_WORD_COLOR_ID"])
  {
    v11 = settingsLocString(@"HOVER_TYPING_MISSPELLED_WORD_COLOR", @"Accessibility");
    [v4 setTitle:v11];

    unsigned __int8 v6 = +[UIColor blackColor];
    v16 = v6;
    id v7 = &v16;
    goto LABEL_13;
  }
  if ([(NSString *)self->_selectedIdentifier isEqualToString:@"HOVER_TYPING_AUTOCORRECTED_WORD_COLOR_ID"])
  {
    CFStringRef v12 = settingsLocString(@"HOVER_TYPING_AUTOCORRECTED_WORD_COLOR", @"Accessibility");
    [v4 setTitle:v12];

    unsigned __int8 v6 = +[UIColor blackColor];
    uint64_t v15 = v6;
    id v7 = &v15;
    goto LABEL_13;
  }

  id v4 = 0;
LABEL_14:

  return v4;
}

- (id)_selectedColorForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"HOVER_TEXT_TEXT_COLOR_ID"])
  {
    unsigned __int8 v5 = [(HoverTextController *)self _isLargeTextTypingController];
    unsigned __int8 v6 = +[AXSettings sharedInstance];
    id v7 = v6;
    if (v5) {
      [v6 hoverTextTypingTextColorData];
    }
    else {
      [v6 hoverTextTextColorData];
    }
    uint64_t v15 = LABEL_15:;
    objc_super v17 = (void *)v15;

    uint64_t v18 = +[UIColor whiteColor];
    goto LABEL_21;
  }
  if ([v4 isEqualToString:@"HOVER_TEXT_INSERTION_POINT_COLOR_ID"])
  {
    unsigned __int8 v8 = [(HoverTextController *)self _isLargeTextTypingController];
    v9 = +[AXSettings sharedInstance];
    id v7 = v9;
    if (v8) {
      [v9 hoverTextTypingInsertionPointColorData];
    }
    else {
      [v9 hoverTextInsertionPointColorData];
    }
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"HOVER_TEXT_BACKGROUND_COLOR_ID"])
  {
    unsigned __int8 v10 = [(HoverTextController *)self _isLargeTextTypingController];
    v11 = +[AXSettings sharedInstance];
    CFStringRef v12 = v11;
    if (v10) {
      [v11 hoverTextTypingBackgroundColorData];
    }
    else {
    objc_super v17 = [v11 hoverTextBackgroundColorData];
    }

    uint64_t v18 = +[UIColor blackColor];
  }
  else
  {
    if ([v4 isEqualToString:@"HOVER_TEXT_BORDER_COLOR_ID"])
    {
      unsigned __int8 v13 = [(HoverTextController *)self _isLargeTextTypingController];
      uint64_t v14 = +[AXSettings sharedInstance];
      id v7 = v14;
      if (v13) {
        [v14 hoverTextTypingBorderColorData];
      }
      else {
        [v14 hoverTextBorderColorData];
      }
      goto LABEL_15;
    }
    if ([v4 isEqualToString:@"HOVER_TYPING_MISSPELLED_WORD_COLOR_ID"])
    {
      v16 = +[AXSettings sharedInstance];
      objc_super v17 = [v16 hoverTextTypingMisspelledTextColorData];

      uint64_t v18 = +[UIColor redColor];
    }
    else
    {
      if (![v4 isEqualToString:@"HOVER_TYPING_AUTOCORRECTED_WORD_COLOR_ID"])
      {
        id v19 = 0;
        goto LABEL_30;
      }
      uint64_t v23 = +[AXSettings sharedInstance];
      objc_super v17 = [v23 hoverTextTypingAutocorrectedTextColorData];

      uint64_t v18 = +[UIColor blueColor];
    }
  }
LABEL_21:
  id v19 = (id)v18;
  if (!v17)
  {
LABEL_30:
    id v19 = v19;
    id v20 = v19;
    goto LABEL_31;
  }
  id v25 = 0;
  id v20 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v17 error:&v25];
  id v21 = v25;
  if (v21)
  {
    id v22 = AXLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      [(HoverTextController *)(uint64_t)v4 _selectedColorForIdentifier:v22];
    }
  }
LABEL_31:

  return v20;
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v23 = 0;
  v9 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v23];
  id v10 = v23;
  if (v10)
  {
    v11 = AXLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[HoverTextController colorPickerViewController:didSelectColor:continuously:]((uint64_t)self, (uint64_t)v10, v11);
    }
  }
  if ([(NSString *)self->_selectedIdentifier isEqualToString:@"HOVER_TEXT_TEXT_COLOR_ID"])
  {
    unsigned int v12 = [(HoverTextController *)self _isLargeTextTypingController];
    unsigned __int8 v13 = +[AXSettings sharedInstance];
    uint64_t v14 = v13;
    if (v12) {
      [v13 setHoverTextTypingTextColorData:v9];
    }
    else {
      [v13 setHoverTextTextColorData:v9];
    }
    goto LABEL_25;
  }
  if ([(NSString *)self->_selectedIdentifier isEqualToString:@"HOVER_TEXT_INSERTION_POINT_COLOR_ID"])
  {
    unsigned int v15 = [(HoverTextController *)self _isLargeTextTypingController];
    v16 = +[AXSettings sharedInstance];
    uint64_t v14 = v16;
    if (v15) {
      [v16 setHoverTextTypingInsertionPointColorData:v9];
    }
    else {
      [v16 setHoverTextInsertionPointColorData:v9];
    }
    goto LABEL_25;
  }
  if ([(NSString *)self->_selectedIdentifier isEqualToString:@"HOVER_TEXT_BACKGROUND_COLOR_ID"])
  {
    unsigned int v17 = [(HoverTextController *)self _isLargeTextTypingController];
    uint64_t v18 = +[AXSettings sharedInstance];
    uint64_t v14 = v18;
    if (v17) {
      [v18 setHoverTextTypingBackgroundColorData:v9];
    }
    else {
      [v18 setHoverTextBackgroundColorData:v9];
    }
    goto LABEL_25;
  }
  if ([(NSString *)self->_selectedIdentifier isEqualToString:@"HOVER_TEXT_BORDER_COLOR_ID"])
  {
    unsigned int v19 = [(HoverTextController *)self _isLargeTextTypingController];
    id v20 = +[AXSettings sharedInstance];
    uint64_t v14 = v20;
    if (v19) {
      [v20 setHoverTextTypingBorderColorData:v9];
    }
    else {
      [v20 setHoverTextBorderColorData:v9];
    }
    goto LABEL_25;
  }
  if ([(NSString *)self->_selectedIdentifier isEqualToString:@"HOVER_TYPING_MISSPELLED_WORD_COLOR_ID"])
  {
    uint64_t v14 = +[AXSettings sharedInstance];
    [v14 setHoverTextTypingMisspelledTextColorData:v9];
LABEL_25:

    goto LABEL_26;
  }
  if ([(NSString *)self->_selectedIdentifier isEqualToString:@"HOVER_TYPING_AUTOCORRECTED_WORD_COLOR_ID"])
  {
    uint64_t v14 = +[AXSettings sharedInstance];
    [v14 setHoverTextTypingAutocorrectedTextColorData:v9];
    goto LABEL_25;
  }
LABEL_26:
  objc_opt_class();
  id v21 = [(HoverTextController *)self cellForSpecifierID:self->_selectedIdentifier];
  id v22 = __UIAccessibilityCastAsClass();

  [v22 setValue:v8];
}

- (void).cxx_destruct
{
}

- (void)_selectedColorForIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_3(&dword_0, a2, a3, "Failed to decode HoverText color for %@. %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

- (void)colorPickerViewController:(uint64_t)a1 didSelectColor:(uint64_t)a2 continuously:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 184);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_3(&dword_0, a2, a3, "Failed to encode HoverText color for %@. %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

@end