@interface ASTVirtualTrackpadColorController
+ (id)localizedNameForColor:(int)a3;
+ (id)trackpadColorOptions;
- (id)specifiers;
- (id)trackpadOpacity;
@end

@implementation ASTVirtualTrackpadColorController

+ (id)localizedNameForColor:(int)a3
{
  if (a3 > 6)
  {
    v4 = 0;
  }
  else
  {
    v4 = settingsLocString(*(&off_2097D8 + a3), @"Accessibility-hello");
  }
  return v4;
}

+ (id)trackpadColorOptions
{
  return &off_22BD38;
}

- (id)specifiers
{
  uint64_t v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v26 = OBJC_IVAR___PSListController__specifiers;
    v4 = +[NSMutableArray array];
    v5 = settingsLocString(@"ASTVirtualTrackpadColorTitle", @"Accessibility-hello");
    v6 = +[PSSpecifier groupSpecifierWithName:v5];

    uint64_t v25 = PSIDKey;
    objc_msgSend(v6, "setProperty:forKey:", @"COLOR");
    v30 = v4;
    [v4 addObject:v6];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = [(id)objc_opt_class() trackpadColorOptions];
    id v31 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v31)
    {
      uint64_t v29 = *(void *)v33;
      uint64_t v28 = PSCellClassKey;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v33 != v29) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v9 = objc_msgSend((id)objc_opt_class(), "localizedNameForColor:", objc_msgSend(v8, "intValue"));
          v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:0 set:0 get:0 detail:0 cell:3 edit:0];
          [v10 setProperty:objc_opt_class() forKey:v28];
          [v10 setProperty:v8 forKey:@"ColorKey"];
          if (_ASTVirtualTrackpadColorValues())
          {
            LODWORD(v11) = 0;
            v12 = +[NSNumber numberWithFloat:v11];
            v36[0] = v12;
            LODWORD(v13) = 0;
            v14 = +[NSNumber numberWithFloat:v13];
            v36[1] = v14;
            LODWORD(v15) = 0;
            v16 = +[NSNumber numberWithFloat:v15];
            v36[2] = v16;
            LODWORD(v17) = 0;
            v18 = +[NSNumber numberWithFloat:v17];
            v36[3] = v18;
            v19 = +[NSArray arrayWithObjects:v36 count:4];
            [v10 setProperty:v19 forKey:@"rgb"];
          }
          [v30 addObject:v10];
        }
        id v31 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v31);
    }

    v20 = settingsLocString(@"ASTVirtualTrackpadOpacityTitle", @"Accessibility-hello");
    v21 = +[PSSpecifier groupSpecifierWithName:v20];

    [v30 addObject:v21];
    v22 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setTrackpadOpacity:" get:"trackpadOpacity" detail:0 cell:5 edit:0];
    [v22 setProperty:&__kCFBooleanFalse forKey:PSSliderIsSegmented];
    [v22 setProperty:&__kCFBooleanTrue forKey:PSSliderIsContinuous];
    [v22 setProperty:@"OPACITY" forKey:v25];
    [v30 addObject:v22];
    v23 = *(void **)&self->AXUISettingsBaseListController_opaque[v26];
    *(void *)&self->AXUISettingsBaseListController_opaque[v26] = v30;

    uint64_t v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v26];
  }

  return v3;
}

- (id)trackpadOpacity
{
  return +[NSNumber numberWithInt:0];
}

@end