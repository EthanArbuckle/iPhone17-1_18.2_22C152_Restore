@interface ASTVirtualTrackpadBorderColorController
- (id)specifiers;
- (id)trackpadBorderColor;
- (id)trackpadBorderWidth;
- (id)trackpadOpacity;
- (void)setTrackpadBorderColor:(id)a3;
- (void)setTrackpadBorderWidth:(id)a3;
- (void)setTrackpadOpacity:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation ASTVirtualTrackpadBorderColorController

- (id)specifiers
{
  v14.receiver = self;
  v14.super_class = (Class)ASTVirtualTrackpadBorderColorController;
  v3 = [(ASTVirtualTrackpadColorController *)&v14 specifiers];
  v4 = settingsLocString(@"PointerStrokeWidth", @"Accessibility-hello");
  v5 = +[PSSpecifier groupSpecifierWithName:v4];

  [v3 addObject:v5];
  v6 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setTrackpadBorderWidth:" get:"trackpadBorderWidth" detail:0 cell:5 edit:0];
  [v6 setProperty:&__kCFBooleanFalse forKey:PSSliderIsSegmented];
  [v6 setProperty:&__kCFBooleanTrue forKey:PSSliderIsContinuous];
  if (AXDeviceIsPad())
  {
    v7 = &off_2292B8;
    v8 = &off_2292A0;
LABEL_5:
    [v6 setProperty:v8 forKey:PSControlMinimumKey];
    [v6 setProperty:v7 forKey:PSControlMaximumKey];
    goto LABEL_6;
  }
  if (AXDeviceIsPhone())
  {
    v7 = &off_2292E8;
    v8 = &off_2292D0;
    goto LABEL_5;
  }
LABEL_6:
  [v6 setProperty:@"BORDER_WIDTH" forKey:PSIDKey];
  [v3 addObject:v6];
  uint64_t v9 = OBJC_IVAR___PSListController__specifiers;
  v10 = *(void **)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v11 = v3;

  id v12 = *(id *)&self->super.AXUISettingsBaseListController_opaque[v9];
  return v12;
}

- (id)trackpadOpacity
{
  v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchVirtualTrackpadBorderOpacity];
  *(float *)&double v3 = v3;
  v4 = +[NSNumber numberWithFloat:v3];

  return v4;
}

- (void)setTrackpadOpacity:(id)a3
{
  id v3 = a3;
  id v6 = +[AXSettings sharedInstance];
  [v3 floatValue];
  float v5 = v4;

  [v6 setAssistiveTouchVirtualTrackpadBorderOpacity:v5];
}

- (id)trackpadBorderWidth
{
  v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchVirtualTrackpadBorderWidth];
  *(float *)&double v3 = v3;
  float v4 = +[NSNumber numberWithFloat:v3];

  return v4;
}

- (void)setTrackpadBorderWidth:(id)a3
{
  id v3 = a3;
  id v6 = +[AXSettings sharedInstance];
  [v3 floatValue];
  float v5 = v4;

  [v6 setAssistiveTouchVirtualTrackpadBorderWidth:v5];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  v8 = [(ASTVirtualTrackpadBorderColorController *)self specifierForIndexPath:a5];
  uint64_t v9 = [v8 propertyForKey:@"ColorKey"];
  if (v9)
  {
    id v10 = v7;
    unsigned int v11 = [v9 intValue];
    unsigned int v12 = [v9 intValue];
    v13 = [(ASTVirtualTrackpadBorderColorController *)self trackpadBorderColor];
    objc_msgSend(v10, "setChecked:", v12 == objc_msgSend(v13, "intValue"));

    int v14 = _ASTVirtualTrackpadColorValues();
    v15 = [(ASTVirtualTrackpadBorderColorController *)self traitCollection];
    v16 = (char *)[v15 userInterfaceStyle];

    if (v14) {
      BOOL v17 = v11 == 1;
    }
    else {
      BOOL v17 = 1;
    }
    unsigned int v18 = !v17;
    if (v16 == (unsigned char *)&dword_0 + 2) {
      uint64_t v19 = v14 != 0;
    }
    else {
      uint64_t v19 = v18;
    }
    [v10 setFillCircle:v19];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)ASTVirtualTrackpadBorderColorController;
  [(ASTVirtualTrackpadBorderColorController *)&v30 tableView:v6 didSelectRowAtIndexPath:v7];
  v8 = [(ASTVirtualTrackpadBorderColorController *)self specifierForIndexPath:v7];
  uint64_t v9 = [v8 propertyForKey:@"ColorKey"];
  if (v9)
  {
    v22 = v8;
    id v23 = v7;
    id v10 = self;
    v21 = v9;
    [(ASTVirtualTrackpadBorderColorController *)self setTrackpadBorderColor:v9];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v24 = v6;
    id obj = [v6 visibleCells];
    id v11 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v16 = [v15 specifier];
          BOOL v17 = [v16 propertyForKey:@"ColorKey"];
          unsigned int v18 = v17;
          if (v17)
          {
            unsigned int v19 = [v17 intValue];
            v20 = [(ASTVirtualTrackpadBorderColorController *)v10 trackpadBorderColor];
            objc_msgSend(v15, "setChecked:", v19 == objc_msgSend(v20, "intValue"));
          }
        }
        id v12 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v12);
    }

    id v7 = v23;
    id v6 = v24;
    uint64_t v9 = v21;
    v8 = v22;
  }
}

- (id)trackpadBorderColor
{
  v2 = +[AXSettings sharedInstance];
  id v3 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v2 assistiveTouchVirtualTrackpadBorderColor]);

  return v3;
}

- (void)setTrackpadBorderColor:(id)a3
{
  id v3 = a3;
  id v5 = +[AXSettings sharedInstance];
  id v4 = [v3 integerValue];

  [v5 setAssistiveTouchVirtualTrackpadBorderColor:v4];
}

@end