@interface AXPointerControlColorController
+ (id)localizedNameForColor:(int)a3;
+ (id)strokeColorOptions;
- (id)pointerStrokeWidth:(id)a3;
- (id)specifiers;
- (void)setPointerStrokeWidth:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation AXPointerControlColorController

+ (id)localizedNameForColor:(int)a3
{
  if (a3 > 6)
  {
    v4 = 0;
  }
  else
  {
    v4 = settingsLocString(*(&off_20BCD0 + a3), @"Accessibility-hello");
  }
  return v4;
}

+ (id)strokeColorOptions
{
  return &off_22C308;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)AXPointerControlColorController;
  [(AXPointerControlColorController *)&v8 viewDidLoad];
  objc_initWeak(&location, self);
  uint64_t v9 = objc_opt_class();
  uint64_t v3 = +[NSArray arrayWithObjects:&v9 count:1];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __46__AXPointerControlColorController_viewDidLoad__block_invoke;
  v5[3] = &unk_208A18;
  objc_copyWeak(&v6, &location);
  id v4 = [(AXPointerControlColorController *)self registerForTraitChanges:v3 withHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __46__AXPointerControlColorController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _traitCollectionDidChange:v4];
}

- (id)specifiers
{
  v2 = self;
  uint64_t v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v29 = OBJC_IVAR___PSListController__specifiers;
    v33 = +[NSMutableArray array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = [(id)objc_opt_class() strokeColorOptions];
    id v4 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v32 = *(void *)v35;
      uint64_t v31 = PSCellClassKey;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v35 != v32) {
            objc_enumerationMutation(obj);
          }
          v7 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          objc_super v8 = objc_msgSend((id)objc_opt_class(), "localizedNameForColor:", objc_msgSend(v7, "intValue"));
          uint64_t v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:0 set:0 get:0 detail:0 cell:3 edit:0];
          [v9 setProperty:objc_opt_class() forKey:v31];
          [v9 setProperty:v7 forKey:@"ColorKey"];
          if (_AXSPointerStrokeColorValues())
          {
            LODWORD(v10) = 0;
            v11 = +[NSNumber numberWithFloat:v10];
            v38[0] = v11;
            LODWORD(v12) = 0;
            v13 = +[NSNumber numberWithFloat:v12];
            v38[1] = v13;
            LODWORD(v14) = 0;
            v15 = +[NSNumber numberWithFloat:v14];
            v38[2] = v15;
            LODWORD(v16) = 0;
            +[NSNumber numberWithFloat:v16];
            v18 = v17 = v2;
            v38[3] = v18;
            v19 = +[NSArray arrayWithObjects:v38 count:4];
            [v9 setProperty:v19 forKey:@"rgb"];

            v2 = v17;
          }
          [v33 addObject:v9];
        }
        id v5 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v5);
    }

    v20 = settingsLocString(@"PointerStrokeWidth", @"Accessibility-hello");
    v21 = +[PSSpecifier groupSpecifierWithName:v20];

    [v33 addObject:v21];
    v22 = +[PSSpecifier preferenceSpecifierNamed:0 target:v2 set:"setPointerStrokeWidth:specifier:" get:"pointerStrokeWidth:" detail:0 cell:5 edit:0];
    [v22 setProperty:&__kCFBooleanFalse forKey:PSSliderIsSegmented];
    [v22 setProperty:&__kCFBooleanTrue forKey:PSSliderIsContinuous];
    LODWORD(v23) = kAXSPointerStrokeColorWidthMinimum;
    v24 = +[NSNumber numberWithFloat:v23];
    [v22 setProperty:v24 forKey:PSControlMinimumKey];

    LODWORD(v25) = kAXSPointerStrokeColorWidthMaximum;
    v26 = +[NSNumber numberWithFloat:v25];
    [v22 setProperty:v26 forKey:PSControlMaximumKey];

    [v22 setProperty:@"PointerStrokeWidth" forKey:PSIDKey];
    [v33 addObject:v22];
    v27 = *(void **)&v2->AXUISettingsBaseListController_opaque[v29];
    *(void *)&v2->AXUISettingsBaseListController_opaque[v29] = v33;

    uint64_t v3 = *(void **)&v2->AXUISettingsBaseListController_opaque[v29];
  }

  return v3;
}

- (id)pointerStrokeWidth:(id)a3
{
  _AXSPointerStrokeColorWidth();

  return +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
}

- (void)setPointerStrokeWidth:(id)a3 specifier:(id)a4
{
  id v4 = [a3 floatValue];

  __AXSPointerSetStrokeColorWidth(v4);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  objc_super v8 = [(AXPointerControlColorController *)self specifierForIndexPath:a5];
  uint64_t v9 = [v8 propertyForKey:@"ColorKey"];
  if (v9)
  {
    id v10 = v7;
    unsigned int v11 = [v9 intValue];
    [v10 setChecked:v11 == _AXSPointerStrokeColor()];
    int v12 = _AXSPointerStrokeColorValues();
    v13 = [(AXPointerControlColorController *)self traitCollection];
    double v14 = (char *)[v13 userInterfaceStyle];

    if (v12) {
      BOOL v15 = v11 == 1;
    }
    else {
      BOOL v15 = 1;
    }
    unsigned int v16 = !v15;
    if (v14 == (unsigned char *)&dword_0 + 2) {
      uint64_t v17 = v12 != 0;
    }
    else {
      uint64_t v17 = v16;
    }
    [v10 setFillCircle:v17];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)AXPointerControlColorController;
  [(AXPointerControlColorController *)&v26 tableView:v6 didSelectRowAtIndexPath:v7];
  objc_super v8 = [(AXPointerControlColorController *)self specifierForIndexPath:v7];
  uint64_t v9 = [v8 propertyForKey:@"ColorKey"];
  id v10 = v9;
  if (v9)
  {
    id v20 = v7;
    [v9 intValue];
    _AXSPointerSetStrokeColor();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v21 = v6;
    unsigned int v11 = [v6 visibleCells];
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          unsigned int v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v17 = [v16 specifier];
          v18 = [v17 propertyForKey:@"ColorKey"];
          v19 = v18;
          if (v18) {
            objc_msgSend(v16, "setChecked:", objc_msgSend(v18, "intValue") == _AXSPointerStrokeColor());
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v13);
    }

    id v7 = v20;
    id v6 = v21;
  }
}

@end