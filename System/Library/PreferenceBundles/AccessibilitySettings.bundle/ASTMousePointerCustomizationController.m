@interface ASTMousePointerCustomizationController
- (BOOL)cursorColorSelectionController:(id)a3 allowsCursorColor:(int64_t)a4;
- (id)assistiveTouchMousePointerSizeMultiplier:(id)a3;
- (id)mousePointerColorDescription:(id)a3;
- (id)mousePointerTimeoutDescription:(id)a3;
- (id)selectSpecifier:(id)a3;
- (id)specifiers;
- (int64_t)selectedColorForSelectionController:(id)a3;
- (void)cursorColorSelectionController:(id)a3 selectedCursorColor:(int64_t)a4;
- (void)setAssistiveTouchMousePointerSizeMultiplier:(id)a3 specifier:(id)a4;
@end

@implementation ASTMousePointerCustomizationController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v25 = objc_alloc_init((Class)NSMutableArray);
    objc_initWeak(location, self);
    v5 = settingsLocString(@"MOUSE_POINTER_SIZE_TITLE", @"HandSettings");
    v6 = +[PSSpecifier groupSpecifierWithName:v5];

    uint64_t v7 = PSIDKey;
    [v6 setProperty:@"MOUSE_POINTER_SIZE_TITLE" forKey:PSIDKey];
    [v25 addObject:v6];
    v8 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setAssistiveTouchMousePointerSizeMultiplier:specifier:" get:"assistiveTouchMousePointerSizeMultiplier:" detail:0 cell:5 edit:0];
    [v8 setProperty:&__kCFBooleanTrue forKey:PSSliderIsSegmented];
    [v8 setProperty:&__kCFBooleanTrue forKey:PSSliderLocksToSegment];
    [v8 setProperty:&__kCFBooleanTrue forKey:PSSliderSnapsToSegment];
    v9 = +[NSNumber numberWithDouble:kAXSAssistiveTouchMousePointerSizeMultiplierMin];
    [v8 setProperty:v9 forKey:PSControlMinimumKey];

    v10 = +[NSNumber numberWithDouble:kAXSAssistiveTouchMousePointerSizeMultiplierMax];
    [v8 setProperty:v10 forKey:PSControlMaximumKey];

    [v8 setProperty:&off_22A1E8 forKey:PSSliderSegmentCount];
    [v25 addObject:v8];
    v11 = settingsLocString(@"MOUSE_POINTER_VISUAL_APPEARANCE", @"HandSettings");
    v12 = +[PSSpecifier groupSpecifierWithName:v11];

    [v12 setProperty:@"MOUSE_POINTER_VISUAL_APPEARANCE" forKey:v7];
    [v25 addObject:v12];
    v13 = settingsLocString(@"MOUSE_POINTER_COLOR", @"HandSettings");
    v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:"mousePointerColorDescription:" detail:objc_opt_class() cell:2 edit:0];

    [v14 setProperty:&stru_20F6B8 forKey:PSSpecifierSearchPlistKey];
    [v14 setProperty:@"MOUSE_POINTER_COLOR" forKey:v7];
    [v25 addObject:v14];
    v15 = +[AXSettings sharedInstance];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = __52__ASTMousePointerCustomizationController_specifiers__block_invoke;
    v32[3] = &unk_208BB8;
    objc_copyWeak(&v34, location);
    id v16 = v14;
    id v33 = v16;
    [v15 registerUpdateBlock:v32 forRetrieveSelector:"assistiveTouchMousePointerColor" withListener:self];

    objc_destroyWeak(&v34);
    v17 = settingsLocString(@"MOUSE_POINTER_TIMEOUT", @"HandSettings");
    v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:0 get:"mousePointerTimeoutDescription:" detail:objc_opt_class() cell:2 edit:0];

    [v18 setProperty:@"MOUSE_POINTER_TIMEOUT" forKey:v7];
    v19 = +[AXSettings sharedInstance];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __52__ASTMousePointerCustomizationController_specifiers__block_invoke_2;
    v29[3] = &unk_208BB8;
    objc_copyWeak(&v31, location);
    id v20 = v18;
    id v30 = v20;
    [v19 registerUpdateBlock:v29 forRetrieveSelector:"assistiveTouchMousePointerTimeout" withListener:self];

    objc_destroyWeak(&v31);
    v21 = +[AXSettings sharedInstance];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __52__ASTMousePointerCustomizationController_specifiers__block_invoke_3;
    v26[3] = &unk_208BB8;
    objc_copyWeak(&v28, location);
    id v22 = v20;
    id v27 = v22;
    [v21 registerUpdateBlock:v26 forRetrieveSelector:"assistiveTouchMousePointerTimeoutEnabled" withListener:self];

    objc_destroyWeak(&v28);
    [v25 addObject:v22];
    v23 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v25;

    objc_destroyWeak(location);
    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

void __52__ASTMousePointerCustomizationController_specifiers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32) animated:0];
}

void __52__ASTMousePointerCustomizationController_specifiers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32) animated:0];
}

void __52__ASTMousePointerCustomizationController_specifiers__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32) animated:0];
}

- (id)selectSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASTMousePointerCustomizationController;
  v4 = [(ASTMousePointerCustomizationController *)&v6 selectSpecifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setDelegate:self];
  }

  return v4;
}

- (id)assistiveTouchMousePointerSizeMultiplier:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  [v3 assistiveTouchMousePointerSizeMultiplier];
  v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return v4;
}

- (void)setAssistiveTouchMousePointerSizeMultiplier:(id)a3 specifier:(id)a4
{
  [a3 floatValue];
  double v5 = v4;
  id v6 = +[AXSettings sharedInstance];
  [v6 setAssistiveTouchMousePointerSizeMultiplier:v5];
}

- (id)mousePointerColorDescription:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  [v3 assistiveTouchMousePointerColor];
  float v4 = AXAssistiveTouchScannerColorDescription();

  return v4;
}

- (id)mousePointerTimeoutDescription:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 assistiveTouchMousePointerTimeoutEnabled];

  if (v4)
  {
    double v5 = +[AXSettings sharedInstance];
    [v5 assistiveTouchMousePointerTimeout];
    id v6 = AXLocalizedTimeSummary();
  }
  else
  {
    id v6 = settingsLocString(@"MOUSE_POINTER_TIMEOUT_DISABLED", @"HandSettings");
  }

  return v6;
}

- (void)cursorColorSelectionController:(id)a3 selectedCursorColor:(int64_t)a4
{
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchMousePointerColor:a4];
}

- (int64_t)selectedColorForSelectionController:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = [v3 assistiveTouchMousePointerColor];

  return (int64_t)v4;
}

- (BOOL)cursorColorSelectionController:(id)a3 allowsCursorColor:(int64_t)a4
{
  return a4 != 0;
}

@end