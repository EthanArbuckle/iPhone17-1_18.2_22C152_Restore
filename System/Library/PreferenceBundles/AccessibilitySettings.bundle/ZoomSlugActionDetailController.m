@interface ZoomSlugActionDetailController
- (BOOL)isActionAvailable:(int64_t)a3;
- (id)specifiers;
- (int64_t)actionForSpecifier:(id)a3;
- (int64_t)currentAction;
- (void)_updateSpeakFingerSetting;
- (void)updateCurrentAction:(int64_t)a3;
@end

@implementation ZoomSlugActionDetailController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = settingsLocString(@"ZOOM_CONTROLLER_ACTIONS", @"ZoomSlugSettings");
    v7 = +[PSSpecifier groupSpecifierWithName:v6];

    [v5 addObject:v7];
    v8 = AXLocalizedTitleForSlugAction(0);
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:3 edit:0];

    noneActionSpecifier = self->_noneActionSpecifier;
    self->_noneActionSpecifier = v9;
    v11 = v9;

    uint64_t v12 = PSSpecifierIsSearchableKey;
    [(PSSpecifier *)v11 setProperty:&__kCFBooleanFalse forKey:PSSpecifierIsSearchableKey];
    [v5 addObject:v11];
    v13 = AXLocalizedTitleForSlugAction(1uLL);
    v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:3 edit:0];

    showZoomMenuSpecifier = self->_showZoomMenuSpecifier;
    self->_showZoomMenuSpecifier = v14;
    v16 = v14;

    [(PSSpecifier *)v16 setProperty:&__kCFBooleanFalse forKey:v12];
    [v5 addObject:v16];
    v17 = AXLocalizedTitleForSlugAction(2uLL);
    v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:0 get:0 detail:0 cell:3 edit:0];

    toggleZoomInOutSpecifier = self->_toggleZoomInOutSpecifier;
    self->_toggleZoomInOutSpecifier = v18;
    v20 = v18;

    [(PSSpecifier *)v20 setProperty:&__kCFBooleanFalse forKey:v12];
    [v5 addObject:v20];
    v21 = AXLocalizedTitleForSlugAction(3uLL);
    v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:self set:0 get:0 detail:0 cell:3 edit:0];

    speakContentSpecifier = self->_speakContentSpecifier;
    self->_speakContentSpecifier = v22;
    v24 = v22;

    [(PSSpecifier *)v24 setProperty:&__kCFBooleanFalse forKey:v12];
    [v5 addObject:v24];
    v25 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->super.AXUISettingsBaseListController_opaque[v3] = v5;

    [(AXActionDetailController *)self updateSpecifierStateAndReload:0];
    v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (int64_t)actionForSpecifier:(id)a3
{
  v4 = (PSSpecifier *)a3;
  if (self->_noneActionSpecifier == v4)
  {
    int64_t v5 = 0;
  }
  else if (self->_showZoomMenuSpecifier == v4)
  {
    int64_t v5 = 1;
  }
  else if (self->_toggleZoomInOutSpecifier == v4)
  {
    int64_t v5 = 2;
  }
  else if (self->_speakContentSpecifier == v4)
  {
    int64_t v5 = 3;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isActionAvailable:(int64_t)a3
{
  if (!a3 || [(ZoomSlugActionDetailController *)self currentAction] == a3) {
    return 1;
  }
  int64_t v5 = +[AXSettings sharedInstance];
  if ([v5 zoomSlugSingleTapAction] == (id)a3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v6 = +[AXSettings sharedInstance];
    if ([v6 zoomSlugDoubleTapAction] == (id)a3)
    {
      BOOL v4 = 0;
    }
    else
    {
      v7 = +[AXSettings sharedInstance];
      BOOL v4 = [v7 zoomSlugTripleTapAction] != (id)a3;
    }
  }

  return v4;
}

- (int64_t)currentAction
{
  v2 = [(ZoomSlugActionDetailController *)self specifier];
  uint64_t v3 = [v2 propertyForKey:@"SlugGesture"];

  if ([v3 isEqualToString:@"SingleTap"])
  {
    BOOL v4 = +[AXSettings sharedInstance];
    id v5 = [v4 zoomSlugSingleTapAction];
  }
  else if ([v3 isEqualToString:@"DoubleTap"])
  {
    BOOL v4 = +[AXSettings sharedInstance];
    id v5 = [v4 zoomSlugDoubleTapAction];
  }
  else
  {
    if (![v3 isEqualToString:@"TripleTap"])
    {
      int64_t v6 = 0;
      goto LABEL_8;
    }
    BOOL v4 = +[AXSettings sharedInstance];
    id v5 = [v4 zoomSlugTripleTapAction];
  }
  int64_t v6 = (int64_t)v5;

LABEL_8:
  return v6;
}

- (void)updateCurrentAction:(int64_t)a3
{
  id v5 = [(ZoomSlugActionDetailController *)self specifier];
  id v9 = [v5 propertyForKey:@"SlugGesture"];

  if ([v9 isEqualToString:@"SingleTap"])
  {
    int64_t v6 = +[AXSettings sharedInstance];
    [v6 setZoomSlugSingleTapAction:a3];
  }
  if ([v9 isEqualToString:@"DoubleTap"])
  {
    v7 = +[AXSettings sharedInstance];
    [v7 setZoomSlugDoubleTapAction:a3];
  }
  if ([v9 isEqualToString:@"TripleTap"])
  {
    v8 = +[AXSettings sharedInstance];
    [v8 setZoomSlugTripleTapAction:a3];
  }
  [(ZoomSlugActionDetailController *)self _updateSpeakFingerSetting];
}

- (void)_updateSpeakFingerSetting
{
  v2 = +[AXSettings sharedInstance];
  if ([v2 zoomSlugSingleTapAction] == (char *)&dword_0 + 3)
  {
    int v3 = 1;
  }
  else
  {
    BOOL v4 = +[AXSettings sharedInstance];
    if ([v4 zoomSlugDoubleTapAction] == (char *)&dword_0 + 3)
    {
      int v3 = 1;
    }
    else
    {
      id v5 = +[AXSettings sharedInstance];
      int v3 = [v5 zoomSlugTripleTapAction] == (char *)&dword_0 + 3;
    }
  }

  if (_AXSZoomSpeakUnderFingerEnabled() != v3)
  {
    _AXSZoomSpeakUnderFingerSetEnabled();
    if (v3)
    {
      AXAssetAndDataClient();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      int64_t v6 = +[AXAccessQueue mainAccessQueue];
      [v7 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:11 targetAccessQueue:v6 completion:0];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakContentSpecifier, 0);
  objc_storeStrong((id *)&self->_toggleZoomInOutSpecifier, 0);
  objc_storeStrong((id *)&self->_showZoomMenuSpecifier, 0);

  objc_storeStrong((id *)&self->_noneActionSpecifier, 0);
}

@end