@interface AXCaptionTransparencyController
- (id)_videoOverrideText;
- (id)_videoOverridesStyle:(id)a3;
- (id)specifiers;
- (int)transparencyType;
- (void)_setVideoOverridesStyle:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AXCaptionTransparencyController

- (int)transparencyType
{
  v2 = [(AXCaptionTransparencyController *)self specifier];
  v3 = [v2 propertyForKey:@"transparencyType"];

  if ([v3 isEqualToString:@"text"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"window"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"background"])
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
    uint64_t v20 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = [(AXCaptionStyleChooserController *)self captionPreviewSpecifiers];
    v24 = v4;
    [v4 addObjectsFromArray:v5];

    v23 = AXCaptionTransparencyDefault([(AXCaptionTransparencyController *)self transparencyType]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    AXCaptionTransparency([(AXCaptionTransparencyController *)self transparencyType]);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v22 = *(void *)v26;
      uint64_t v8 = PSCellClassKey;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v11 = [v10 objectForKeyedSubscript:@"name"];
          v12 = settingsLocString(v11, @"CaptioningStyle");
          v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:3 edit:0];

          [v13 setProperty:objc_opt_class() forKey:v8];
          v14 = [v10 objectForKeyedSubscript:@"alpha"];
          [v13 setProperty:v14 forKey:@"alpha"];

          v15 = [v10 objectForKeyedSubscript:@"rgb"];
          [v13 setProperty:v15 forKey:@"rgb"];

          v16 = +[NSNumber numberWithUnsignedInt:[(AXCaptionTransparencyController *)self transparencyType]];
          [v13 setProperty:v16 forKey:@"transparencyType"];

          if ([v10 isEqualToDictionary:v23]) {
            [v13 setProperty:&__kCFBooleanTrue forKey:@"isDefault"];
          }
          [v13 setCellType:3];
          [v24 addObject:v13];
        }
        id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v7);
    }

    v17 = [(AXCaptionStyleChooserController *)self videoOverrideSpecifiers];
    [v24 addObjectsFromArray:v17];

    v18 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v20];
    *(void *)&self->super.AXUISettingsBaseListController_opaque[v20] = v24;

    v3 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v20];
  }

  return v3;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AXCaptionTransparencyController;
  [(AXCaptionStyleChooserController *)&v14 tableView:a3 willDisplayCell:v8 forRowAtIndexPath:a5];
  id v9 = v8;
  uint64_t v10 = [(AXCaptionTransparencyController *)self transparencyType];
  v11 = [v9 specifier];
  v12 = [v11 propertyForKey:@"alpha"];
  BOOL v13 = [(AXCaptionStyleChooserController *)self isStoredTransparencyType:v10 equalWithTransparency:v12];

  [v9 setChecked:v13];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)AXCaptionTransparencyController;
  id v6 = a4;
  id v7 = a3;
  [(AXCaptionTransparencyController *)&v13 tableView:v7 didSelectRowAtIndexPath:v6];
  id v8 = [v7 cellForRowAtIndexPath:v6];

  id v9 = [v8 specifier];

  uint64_t v10 = [v9 propertyForKey:@"alpha"];
  [(AXCaptionTransparencyController *)self transparencyType];
  v12 = v10;
  id v11 = v10;
  AXPerformBlockOnMainThreadAfterDelay();
  [(AXCaptionStyleChooserController *)self updateTableCheckedSelection:v6];
}

uint64_t __69__AXCaptionTransparencyController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(_DWORD *)(result + 48);
  switch(v2)
  {
    case 1:
      id v5 = [*(id *)(result + 32) profileId];
      uint64_t v6 = *(void *)(v1 + 40);
      return _MACaptionAppearancePrefSetForegroundOpacity(v5, v6);
    case 3:
      id v7 = [*(id *)(result + 32) profileId];
      uint64_t v8 = *(void *)(v1 + 40);
      return _MACaptionAppearancePrefSetWindowOpacity(v7, v8);
    case 2:
      id v3 = [*(id *)(result + 32) profileId];
      uint64_t v4 = *(void *)(v1 + 40);
      return _MACaptionAppearancePrefSetBackgroundOpacity(v3, v4);
  }
  return result;
}

- (id)_videoOverridesStyle:(id)a3
{
  unsigned int v4 = [(AXCaptionTransparencyController *)self transparencyType];
  switch(v4)
  {
    case 1u:
      [(AXCaptionStyleChooserController *)self profileId];
      id v5 = (void *)MACaptionAppearancePrefCopyVideoOverrideForegroundOpacity();
      break;
    case 3u:
      [(AXCaptionStyleChooserController *)self profileId];
      id v5 = (void *)MACaptionAppearancePrefCopyVideoOverrideWindowOpacity();
      break;
    case 2u:
      [(AXCaptionStyleChooserController *)self profileId];
      id v5 = (void *)MACaptionAppearancePrefCopyVideoOverrideBackgroundOpacity();
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
  unsigned int v5 = [(AXCaptionTransparencyController *)self transparencyType];
  if (v5 == 1)
  {
    [(AXCaptionStyleChooserController *)self profileId];
    [v8 BOOLValue];
    MACaptionAppearancePrefSetVideoOverrideForegroundOpacity();
    goto LABEL_8;
  }
  if (v5 == 3)
  {
    [(AXCaptionStyleChooserController *)self profileId];
    [v8 BOOLValue];
    MACaptionAppearancePrefSetVideoOverrideWindowOpacity();
    goto LABEL_8;
  }
  BOOL v6 = v5 == 2;
  id v7 = v8;
  if (v6)
  {
    [(AXCaptionStyleChooserController *)self profileId];
    [v8 BOOLValue];
    MACaptionAppearancePrefSetVideoOverrideBackgroundOpacity();
LABEL_8:
    id v7 = v8;
  }
}

- (id)_videoOverrideText
{
  return settingsLocString(@"VIDEO_OVERRIDE_OPACITY", @"CaptioningStyle");
}

@end