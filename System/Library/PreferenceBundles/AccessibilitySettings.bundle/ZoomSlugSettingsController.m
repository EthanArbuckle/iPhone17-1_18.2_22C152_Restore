@interface ZoomSlugSettingsController
- (id)specifiers;
- (id)zoomControllerColorSummary:(id)a3;
- (id)zoomIdleSlugOpacitySummary:(id)a3;
- (id)zoomShouldShowSlug:(id)a3;
- (id)zoomSlugDoubleTapActionSummary:(id)a3;
- (id)zoomSlugSingleTapActionSummary:(id)a3;
- (id)zoomSlugTripleTapActionSummary:(id)a3;
- (id)zoomTapAndSlideToAdjustZoomLevel:(id)a3;
- (int64_t)zoomConrtollerColor:(id)a3;
- (void)setZoomShouldShowSlug:(id)a3 specifier:(id)a4;
- (void)setZoomTapAndSlideToAdjustZoomLevel:(id)a3 specifier:(id)a4;
- (void)viewDidLoad;
@end

@implementation ZoomSlugSettingsController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = [(ZoomSlugSettingsController *)self loadSpecifiersFromPlistName:@"ZoomSlugSettings" target:self];
    v7 = settingsLocString(@"ZOOM_SHOW_CONTROLLER_FOOTER_TEXT", @"ZoomSlugSettings");
    if (AXForceTouchAvailableAndEnabled())
    {
      v8 = settingsLocString(@"FORCE_TOUCH_ZOOM_INSTRUCTIONS", @"Accessibility");
      uint64_t v9 = [v7 stringByAppendingString:v8];

      v7 = (void *)v9;
    }
    v10 = +[PSSpecifier groupSpecifierWithName:0];
    [v10 setProperty:v7 forKey:PSFooterTextGroupKey];
    [v5 addObject:v10];
    [v5 addObjectsFromArray:v6];
    v11 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)ZoomSlugSettingsController;
  [(ZoomSlugSettingsController *)&v22 viewDidLoad];
  objc_initWeak(&location, self);
  uint64_t v3 = +[AXSettings sharedInstance];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __41__ZoomSlugSettingsController_viewDidLoad__block_invoke;
  v19[3] = &unk_208798;
  objc_copyWeak(&v20, &location);
  [v3 registerUpdateBlock:v19 forRetrieveSelector:"zoomSlugSingleTapAction" withListener:self];

  objc_destroyWeak(&v20);
  v4 = +[AXSettings sharedInstance];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __41__ZoomSlugSettingsController_viewDidLoad__block_invoke_2;
  v17[3] = &unk_208798;
  objc_copyWeak(&v18, &location);
  [v4 registerUpdateBlock:v17 forRetrieveSelector:"zoomSlugDoubleTapAction" withListener:self];

  objc_destroyWeak(&v18);
  id v5 = +[AXSettings sharedInstance];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __41__ZoomSlugSettingsController_viewDidLoad__block_invoke_3;
  v15[3] = &unk_208798;
  objc_copyWeak(&v16, &location);
  [v5 registerUpdateBlock:v15 forRetrieveSelector:"zoomSlugTripleTapAction" withListener:self];

  objc_destroyWeak(&v16);
  v6 = +[AXSettings sharedInstance];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __41__ZoomSlugSettingsController_viewDidLoad__block_invoke_4;
  v13[3] = &unk_208798;
  objc_copyWeak(&v14, &location);
  [v6 registerUpdateBlock:v13 forRetrieveSelector:"zoomIdleSlugOpacity" withListener:self];

  objc_destroyWeak(&v14);
  v7 = +[AXSettings sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __41__ZoomSlugSettingsController_viewDidLoad__block_invoke_5;
  v11[3] = &unk_208798;
  objc_copyWeak(&v12, &location);
  [v7 registerUpdateBlock:v11 forRetrieveSelector:"zoomShouldShowSlug" withListener:self];

  objc_destroyWeak(&v12);
  v8 = +[AXSettings sharedInstance];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __41__ZoomSlugSettingsController_viewDidLoad__block_invoke_6;
  v9[3] = &unk_208798;
  objc_copyWeak(&v10, &location);
  [v8 registerUpdateBlock:v9 forRetrieveSelector:"zoomControllerColor" withListener:self];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __41__ZoomSlugSettingsController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __41__ZoomSlugSettingsController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __41__ZoomSlugSettingsController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __41__ZoomSlugSettingsController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __41__ZoomSlugSettingsController_viewDidLoad__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __41__ZoomSlugSettingsController_viewDidLoad__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (id)zoomShouldShowSlug:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 zoomShouldShowSlug]);

  return v4;
}

- (void)setZoomShouldShowSlug:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setZoomShouldShowSlug:v4];
}

- (id)zoomTapAndSlideToAdjustZoomLevel:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 zoomSlugTapAndSlideToAdjustZoomLevelEnabled]);

  return v4;
}

- (void)setZoomTapAndSlideToAdjustZoomLevel:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setZoomSlugTapAndSlideToAdjustZoomLevelEnabled:v4];
}

- (int64_t)zoomConrtollerColor:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = [v3 zoomControllerColor];

  return (int64_t)v4;
}

- (id)zoomControllerColorSummary:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = AXLocalizedTitleForColor((uint64_t)[v3 zoomControllerColor]);

  return v4;
}

- (id)zoomIdleSlugOpacitySummary:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  [v3 zoomIdleSlugOpacity];
  id v4 = AXFormatFloatWithPercentage();

  return v4;
}

- (id)zoomSlugSingleTapActionSummary:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = AXLocalizedTitleForSlugAction((unint64_t)[v3 zoomSlugSingleTapAction]);

  return v4;
}

- (id)zoomSlugDoubleTapActionSummary:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = AXLocalizedTitleForSlugAction((unint64_t)[v3 zoomSlugDoubleTapAction]);

  return v4;
}

- (id)zoomSlugTripleTapActionSummary:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = AXLocalizedTitleForSlugAction((unint64_t)[v3 zoomSlugTripleTapAction]);

  return v4;
}

@end