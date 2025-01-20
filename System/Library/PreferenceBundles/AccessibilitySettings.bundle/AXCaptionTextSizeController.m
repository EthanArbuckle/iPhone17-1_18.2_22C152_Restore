@interface AXCaptionTextSizeController
- (id)_videoOverrideText;
- (id)_videoOverridesStyle:(id)a3;
- (id)specifiers;
- (void)_setVideoOverridesStyle:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AXCaptionTextSizeController

- (id)specifiers
{
  v3 = *(void **)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v21 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v24 = self;
    v5 = [(AXCaptionStyleChooserController *)self captionPreviewSpecifiers];
    v23 = v4;
    [v4 addObjectsFromArray:v5];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    AXCaptionTextSizes();
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
          v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:v24 set:0 get:0 detail:0 cell:3 edit:0];

          [v14 setProperty:objc_opt_class() forKey:v9];
          v15 = [v11 objectForKeyedSubscript:@"value"];
          [v14 setProperty:v15 forKey:@"value"];

          v16 = [v11 objectForKeyedSubscript:@"fontSize"];
          [v14 setProperty:v16 forKey:@"fontSize"];

          [v14 setCellType:3];
          v17 = [v11 objectForKeyedSubscript:@"default"];
          LODWORD(v16) = [v17 BOOLValue];

          if (v16) {
            [v14 setProperty:&__kCFBooleanTrue forKey:@"isDefault"];
          }
          [v23 addObject:v14];
        }
        id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v7);
    }

    v18 = [(AXCaptionStyleChooserController *)v24 videoOverrideSpecifiers];
    [v23 addObjectsFromArray:v18];

    v19 = *(void **)&v24->super.AXUISettingsBaseListController_opaque[v21];
    *(void *)&v24->super.AXUISettingsBaseListController_opaque[v21] = v23;

    v3 = *(void **)&v24->super.AXUISettingsBaseListController_opaque[v21];
  }

  return v3;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AXCaptionTextSizeController;
  [(AXCaptionStyleChooserController *)&v15 tableView:a3 willDisplayCell:v8 forRowAtIndexPath:a5];
  [(AXCaptionStyleChooserController *)self profileId];
  uint64_t RelativeCharSize = MACaptionAppearancePrefGetRelativeCharSize();
  v10 = AXCaptionTextSizeForRelativeSize(RelativeCharSize);
  if (!v10)
  {
    v10 = AXCaptionDefaultTextSize();
  }
  id v11 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [v11 specifier];
    v13 = [v12 propertyForKey:@"value"];
    id v14 = [v13 isEqual:v10];

    [v11 setChecked:v14];
  }
  [v11 layoutSubviews];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)AXCaptionTextSizeController;
  id v6 = a4;
  id v7 = a3;
  [(AXCaptionTextSizeController *)&v12 tableView:v7 didSelectRowAtIndexPath:v6];
  id v8 = [v7 cellForRowAtIndexPath:v6];

  uint64_t v9 = [v8 specifier];

  id v11 = [v9 propertyForKey:@"value"];
  id v10 = v11;
  AXPerformBlockOnMainThreadAfterDelay();
  -[AXCaptionStyleChooserController updateTableCheckedSelection:](self, "updateTableCheckedSelection:", v6, _NSConcreteStackBlock, 3221225472, __65__AXCaptionTextSizeController_tableView_didSelectRowAtIndexPath___block_invoke, &unk_208948, self);
}

uint64_t __65__AXCaptionTextSizeController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) profileId];
  id v3 = AXCaptionRelativeTextSizeForSize(*(void **)(a1 + 40));

  return _MACaptionAppearancePrefSetRelativeCharSize(v2, v3);
}

- (id)_videoOverridesStyle:(id)a3
{
  [(AXCaptionStyleChooserController *)self profileId];
  id v3 = (void *)MACaptionAppearancePrefCopyVideoOverrideRelativeCharSize();

  return v3;
}

- (void)_setVideoOverridesStyle:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  [(AXCaptionStyleChooserController *)self profileId];
  [v5 BOOLValue];

  MACaptionAppearancePrefSetVideoOverrideRelativeCharSize();
}

- (id)_videoOverrideText
{
  return settingsLocString(@"VIDEO_OVERRIDE_SIZE", @"CaptioningStyle");
}

@end