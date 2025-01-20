@interface AXCaptionTextHighlightController
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_videoOverrideText;
- (id)_videoOverridesStyle:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (void)_setVideoOverridesStyle:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AXCaptionTextHighlightController

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [v4 _scaledValueForValue:20.0];
    float v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AXCaptionTextHighlightController;
    -[AXCaptionTextHighlightController tableView:heightForHeaderInSection:](&v8, "tableView:heightForHeaderInSection:", a3);
  }
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    v4 = settingsLocString(@"CAPTION_COLOR", @"CaptioningStyle");
    double v5 = [v4 uppercaseString];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AXCaptionTextHighlightController;
    double v5 = -[AXCaptionTextHighlightController tableView:titleForHeaderInSection:](&v7, "tableView:titleForHeaderInSection:", a3);
  }

  return v5;
}

- (id)specifiers
{
  v3 = *(void **)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v36 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v43 = self;
    double v5 = [(AXCaptionStyleChooserController *)self captionPreviewSpecifiers];
    [v4 addObjectsFromArray:v5];

    v42 = v4;
    float v6 = [v4 lastObject];
    objc_super v7 = settingsLocString(@"CAPTION_COLOR", @"CaptioningStyle");
    id v37 = v6;
    [v6 setName:v7];

    v41 = AXCaptionColorDefault(2);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    AXCaptionColors(2);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v49;
      uint64_t v11 = PSCellClassKey;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v49 != v10) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v14 = [v13 objectForKeyedSubscript:@"name"];
          v15 = settingsLocString(v14, @"CaptioningStyle");
          v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:v43 set:0 get:0 detail:0 cell:3 edit:0];

          [v16 setProperty:objc_opt_class() forKey:v11];
          v17 = [v13 objectForKeyedSubscript:@"rgb"];
          [v16 setProperty:v17 forKey:@"rgb"];

          [v16 setProperty:&off_22A848 forKey:@"colorType"];
          v18 = [v13 objectForKeyedSubscript:@"rgb"];
          LODWORD(v17) = [v41 isEqualToArray:v18];

          if (v17) {
            [v16 setProperty:&__kCFBooleanTrue forKey:@"isDefault"];
          }
          [v16 setCellType:3];
          [v42 addObject:v16];
        }
        id v9 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v9);
    }

    v19 = settingsLocString(@"CAPTION_TRANSPARENCY", @"CaptioningStyle");
    uint64_t v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:v43 set:0 get:0 detail:0 cell:0 edit:0];

    v35 = (void *)v20;
    [v42 addObject:v20];
    AXCaptionTransparencyDefault(2);
    id obja = (id)objc_claimAutoreleasedReturnValue();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    AXCaptionTransparency(2);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = [v38 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v45;
      uint64_t v24 = PSCellClassKey;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v45 != v23) {
            objc_enumerationMutation(v38);
          }
          v26 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
          v27 = [v26 objectForKeyedSubscript:@"name"];
          v28 = settingsLocString(v27, @"CaptioningStyle");
          v29 = +[PSSpecifier preferenceSpecifierNamed:v28 target:v43 set:0 get:0 detail:0 cell:3 edit:0];

          [v29 setProperty:objc_opt_class() forKey:v24];
          v30 = [v26 objectForKeyedSubscript:@"alpha"];
          [v29 setProperty:v30 forKey:@"alpha"];

          v31 = [v26 objectForKeyedSubscript:@"rgb"];
          [v29 setProperty:v31 forKey:@"rgb"];

          [v29 setProperty:&off_22A848 forKey:@"transparencyType"];
          if ([v26 isEqualToDictionary:obja]) {
            [v29 setProperty:&__kCFBooleanTrue forKey:@"isDefault"];
          }
          [v29 setCellType:3];
          [v42 addObject:v29];
        }
        id v22 = [v38 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v22);
    }

    v32 = [(AXCaptionStyleChooserController *)v43 videoOverrideSpecifiers];
    [v42 addObjectsFromArray:v32];

    v33 = *(void **)&v43->super.AXUISettingsBaseListController_opaque[v36];
    *(void *)&v43->super.AXUISettingsBaseListController_opaque[v36] = v42;

    v3 = *(void **)&v43->super.AXUISettingsBaseListController_opaque[v36];
  }

  return v3;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AXCaptionTextHighlightController;
  [(AXCaptionStyleChooserController *)&v20 tableView:a3 willDisplayCell:v8 forRowAtIndexPath:a5];
  id v9 = v8;
  uint64_t v10 = [v9 specifier];
  uint64_t v11 = [v10 propertyForKey:@"colorType"];
  unsigned int v12 = [v11 intValue];

  if (v12 == 2)
  {
    v13 = [v9 specifier];
    v14 = [v13 propertyForKey:@"rgb"];
    unsigned __int8 v15 = [(AXCaptionStyleChooserController *)self isStoredColorType:2 equalWithColors:v14];
  }
  else
  {
    v16 = [v10 propertyForKey:@"transparencyType"];
    unsigned int v17 = [v16 intValue];

    if (v17 != 2)
    {
LABEL_7:
      uint64_t v19 = 0;
      goto LABEL_8;
    }
    v13 = [v9 specifier];
    v14 = [v13 propertyForKey:@"alpha"];
    unsigned __int8 v15 = [(AXCaptionStyleChooserController *)self isStoredTransparencyType:2 equalWithTransparency:v14];
  }
  unsigned __int8 v18 = v15;

  if ((v18 & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v19 = 1;
LABEL_8:
  [v9 setChecked:v19];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v31.receiver = self;
  v31.super_class = (Class)AXCaptionTextHighlightController;
  id v7 = a3;
  [(AXCaptionTextHighlightController *)&v31 tableView:v7 didSelectRowAtIndexPath:v6];
  id v8 = [v7 cellForRowAtIndexPath:v6];

  id v9 = [v8 specifier];

  uint64_t v10 = [v9 propertyForKey:@"colorType"];
  unsigned int v11 = [v10 intValue];

  if (v11 == 2)
  {
    id v12 = [v9 propertyForKey:@"rgb"];
    v13 = [v12 objectAtIndexedSubscript:0];
    [v13 floatValue];
    double v15 = v14;
    v16 = [v12 objectAtIndexedSubscript:1];
    [v16 floatValue];
    double v18 = v17;
    uint64_t v19 = [v12 objectAtIndexedSubscript:2];
    [v19 floatValue];
    id v21 = +[UIColor colorWithRed:v15 green:v18 blue:v20 alpha:1.0];

    id v22 = v21;
    AXPerformBlockOnMainThreadAfterDelay();

LABEL_5:
    goto LABEL_6;
  }
  uint64_t v23 = [v9 propertyForKey:@"transparencyType"];
  unsigned int v24 = [v23 intValue];

  if (v24 == 2)
  {
    [v9 propertyForKey:@"alpha"];
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    v27 = __70__AXCaptionTextHighlightController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v28 = &unk_208948;
    v30 = v29 = self;
    id v12 = v30;
    AXPerformBlockOnMainThreadAfterDelay();

    goto LABEL_5;
  }
LABEL_6:
  -[AXCaptionStyleChooserController updateTableCheckedSelection:](self, "updateTableCheckedSelection:", v6, v25, v26, v27, v28, v29);
}

uint64_t __70__AXCaptionTextHighlightController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) profileId];
  id v3 = [*(id *)(a1 + 40) CGColor];

  return _MACaptionAppearancePrefSetBackgroundColor(v2, v3);
}

uint64_t __70__AXCaptionTextHighlightController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) profileId];
  uint64_t v3 = *(void *)(a1 + 40);

  return _MACaptionAppearancePrefSetBackgroundOpacity(v2, v3);
}

- (id)_videoOverridesStyle:(id)a3
{
  [(AXCaptionStyleChooserController *)self profileId];
  id v4 = (void *)MACaptionAppearancePrefCopyVideoOverrideBackgroundColor();
  [(AXCaptionStyleChooserController *)self profileId];
  double v5 = (void *)MACaptionAppearancePrefCopyVideoOverrideBackgroundOpacity();
  if ([v4 BOOLValue]) {
    id v6 = [v5 BOOLValue];
  }
  else {
    id v6 = 0;
  }
  id v7 = +[NSNumber numberWithInt:v6];

  return v7;
}

- (void)_setVideoOverridesStyle:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  [(AXCaptionStyleChooserController *)self profileId];
  [v5 BOOLValue];
  MACaptionAppearancePrefSetVideoOverrideBackgroundColor();
  [(AXCaptionStyleChooserController *)self profileId];
  [v5 BOOLValue];

  MACaptionAppearancePrefSetVideoOverrideBackgroundOpacity();
}

- (id)_videoOverrideText
{
  return settingsLocString(@"VIDEO_OVERRIDE_HIGHLIGHT_STYLE", @"CaptioningStyle");
}

@end