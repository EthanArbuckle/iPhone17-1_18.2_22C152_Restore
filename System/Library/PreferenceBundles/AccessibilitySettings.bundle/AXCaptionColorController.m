@interface AXCaptionColorController
- (id)_videoOverrideText;
- (id)_videoOverridesStyle:(id)a3;
- (id)specifiers;
- (int)colorType;
- (void)_setVideoOverridesStyle:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AXCaptionColorController

- (int)colorType
{
  v2 = [(AXCaptionColorController *)self specifier];
  v3 = [v2 propertyForKey:@"colorType"];

  if ([v3 isEqualToString:@"textColor"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"windowColor"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"backgroundColor"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (id)specifiers
{
  v3 = *(void **)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v21 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = [(AXCaptionStyleChooserController *)self captionPreviewSpecifiers];
    v24 = v4;
    [v4 addObjectsFromArray:v5];

    v23 = AXCaptionColorDefault([(AXCaptionColorController *)self colorType]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    AXCaptionColors([(AXCaptionColorController *)self colorType]);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v26;
      uint64_t v9 = PSCellClassKey;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v12 = [v11 objectForKeyedSubscript:@"name"];
          v13 = settingsLocString(v12, @"CaptioningStyle");
          v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:3 edit:0];

          [v14 setProperty:objc_opt_class() forKey:v9];
          v15 = [v11 objectForKeyedSubscript:@"rgb"];
          [v14 setProperty:v15 forKey:@"rgb"];

          v16 = +[NSNumber numberWithUnsignedInt:[(AXCaptionColorController *)self colorType]];
          [v14 setProperty:v16 forKey:@"colorType"];

          v17 = [v11 objectForKeyedSubscript:@"rgb"];
          LODWORD(v16) = [v23 isEqualToArray:v17];

          if (v16) {
            [v14 setProperty:&__kCFBooleanTrue forKey:@"isDefault"];
          }
          [v14 setCellType:3];
          [v24 addObject:v14];
        }
        id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v7);
    }

    v18 = [(AXCaptionStyleChooserController *)self videoOverrideSpecifiers];
    [v24 addObjectsFromArray:v18];

    v19 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v21];
    *(void *)&self->super.AXUISettingsBaseListController_opaque[v21] = v24;

    v3 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v21];
  }

  return v3;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AXCaptionColorController;
  [(AXCaptionStyleChooserController *)&v15 tableView:a3 willDisplayCell:v8 forRowAtIndexPath:v9];
  if ([v9 row] || objc_msgSend(v9, "section"))
  {
    id v10 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [(AXCaptionColorController *)self colorType];
      v12 = [v10 specifier];
      v13 = [v12 propertyForKey:@"rgb"];
      BOOL v14 = [(AXCaptionStyleChooserController *)self isStoredColorType:v11 equalWithColors:v13];

      [v10 setChecked:v14];
    }
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)AXCaptionColorController;
  id v6 = a4;
  id v7 = a3;
  [(AXCaptionColorController *)&v21 tableView:v7 didSelectRowAtIndexPath:v6];
  id v8 = [v7 cellForRowAtIndexPath:v6];

  id v9 = [v8 specifier];

  id v10 = [v9 propertyForKey:@"rgb"];
  uint64_t v11 = [v10 objectAtIndexedSubscript:0];
  [v11 floatValue];
  double v13 = v12;
  BOOL v14 = [v10 objectAtIndexedSubscript:1];
  [v14 floatValue];
  double v16 = v15;
  v17 = [v10 objectAtIndexedSubscript:2];
  [v17 floatValue];
  v19 = +[UIColor colorWithRed:v13 green:v16 blue:v18 alpha:1.0];

  [(AXCaptionColorController *)self colorType];
  id v20 = v19;
  AXPerformBlockOnMainThreadAfterDelay();
  [(AXCaptionStyleChooserController *)self updateTableCheckedSelection:v6];
}

uint64_t __62__AXCaptionColorController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(_DWORD *)(result + 48);
  switch(v2)
  {
    case 1:
      id v5 = [*(id *)(result + 32) profileId];
      id v6 = [*(id *)(v1 + 40) CGColor];
      return _MACaptionAppearancePrefSetForegroundColor(v5, v6);
    case 3:
      id v7 = [*(id *)(result + 32) profileId];
      id v8 = [*(id *)(v1 + 40) CGColor];
      return _MACaptionAppearancePrefSetWindowColor(v7, v8);
    case 2:
      id v3 = [*(id *)(result + 32) profileId];
      id v4 = [*(id *)(v1 + 40) CGColor];
      return _MACaptionAppearancePrefSetBackgroundColor(v3, v4);
  }
  return result;
}

- (id)_videoOverridesStyle:(id)a3
{
  unsigned int v4 = [(AXCaptionColorController *)self colorType];
  switch(v4)
  {
    case 1u:
      [(AXCaptionStyleChooserController *)self profileId];
      id v5 = (void *)MACaptionAppearancePrefCopyVideoOverrideForegroundColor();
      break;
    case 3u:
      [(AXCaptionStyleChooserController *)self profileId];
      id v5 = (void *)MACaptionAppearancePrefCopyVideoOverrideWindowColor();
      break;
    case 2u:
      [(AXCaptionStyleChooserController *)self profileId];
      id v5 = (void *)MACaptionAppearancePrefCopyVideoOverrideBackgroundColor();
      break;
    default:
      id v5 = 0;
      break;
  }

  return v5;
}

- (void)_setVideoOverridesStyle:(id)a3 specifier:(id)a4
{
  id v8 = a3;
  unsigned int v5 = [(AXCaptionColorController *)self colorType];
  if (v5 == 1)
  {
    [(AXCaptionStyleChooserController *)self profileId];
    [v8 BOOLValue];
    MACaptionAppearancePrefSetVideoOverrideForegroundColor();
    goto LABEL_8;
  }
  if (v5 == 3)
  {
    [(AXCaptionStyleChooserController *)self profileId];
    [v8 BOOLValue];
    MACaptionAppearancePrefSetVideoOverrideWindowColor();
    goto LABEL_8;
  }
  BOOL v6 = v5 == 2;
  id v7 = v8;
  if (v6)
  {
    [(AXCaptionStyleChooserController *)self profileId];
    [v8 BOOLValue];
    MACaptionAppearancePrefSetVideoOverrideBackgroundColor();
LABEL_8:
    id v7 = v8;
  }
}

- (id)_videoOverrideText
{
  return settingsLocString(@"VIDEO_OVERRIDE_COLOR", @"CaptioningStyle");
}

@end