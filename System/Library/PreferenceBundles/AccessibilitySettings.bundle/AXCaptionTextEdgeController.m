@interface AXCaptionTextEdgeController
- (id)_videoOverrideText;
- (id)_videoOverridesStyle:(id)a3;
- (id)specifiers;
- (void)_setVideoOverridesStyle:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AXCaptionTextEdgeController

- (id)specifiers
{
  v3 = *(void **)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v20 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v24 = self;
    v5 = [(AXCaptionStyleChooserController *)self captionPreviewSpecifiers];
    v23 = v4;
    [v4 addObjectsFromArray:v5];

    v22 = AXCaptionTextEdgeStyleDefault();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    AXCaptionTextEdgeStyles();
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
          v15 = [v11 objectForKeyedSubscript:@"name"];
          [v14 setProperty:v15 forKey:@"name"];

          v16 = [v11 objectForKeyedSubscript:@"edgeKey"];
          [v14 setProperty:v16 forKey:@"edgeKey"];

          if ([v22 isEqualToDictionary:v11]) {
            [v14 setProperty:&__kCFBooleanTrue forKey:@"isDefault"];
          }
          [v14 setCellType:3];
          [v23 addObject:v14];
        }
        id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v7);
    }

    v17 = [(AXCaptionStyleChooserController *)v24 videoOverrideSpecifiers];
    [v23 addObjectsFromArray:v17];

    v18 = *(void **)&v24->super.AXUISettingsBaseListController_opaque[v20];
    *(void *)&v24->super.AXUISettingsBaseListController_opaque[v20] = v23;

    v3 = *(void **)&v24->super.AXUISettingsBaseListController_opaque[v20];
  }

  return v3;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AXCaptionTextEdgeController;
  [(AXCaptionStyleChooserController *)&v14 tableView:a3 willDisplayCell:v8 forRowAtIndexPath:a5];
  [(AXCaptionStyleChooserController *)self profileId];
  uint64_t v9 = (void *)MACaptionAppearancePrefCopyTextEdgeStyle();
  if (!v9)
  {
    v10 = AXCaptionTextEdgeStyleDefault();
    uint64_t v9 = [v10 objectForKey:@"edgeKey"];
  }
  id v11 = v8;
  v12 = [v11 specifier];
  v13 = [v12 propertyForKey:@"edgeKey"];

  objc_msgSend(v11, "setChecked:", objc_msgSend(v13, "isEqual:", v9));
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)AXCaptionTextEdgeController;
  id v6 = a4;
  id v7 = a3;
  [(AXCaptionTextEdgeController *)&v12 tableView:v7 didSelectRowAtIndexPath:v6];
  id v8 = [v7 cellForRowAtIndexPath:v6];

  uint64_t v9 = [v8 specifier];

  id v11 = [v9 propertyForKey:@"edgeKey"];
  id v10 = v11;
  AXPerformBlockOnMainThreadAfterDelay();
  -[AXCaptionStyleChooserController updateTableCheckedSelection:](self, "updateTableCheckedSelection:", v6, _NSConcreteStackBlock, 3221225472, __65__AXCaptionTextEdgeController_tableView_didSelectRowAtIndexPath___block_invoke, &unk_208948, self);
}

uint64_t __65__AXCaptionTextEdgeController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) profileId];
  uint64_t v3 = *(void *)(a1 + 40);

  return _MACaptionAppearancePrefSetTextEdgeStyle(v2, v3);
}

- (id)_videoOverridesStyle:(id)a3
{
  [(AXCaptionStyleChooserController *)self profileId];
  uint64_t v3 = (void *)MACaptionAppearancePrefCopyVideoOverrideTextEdgeStyle();

  return v3;
}

- (void)_setVideoOverridesStyle:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  [(AXCaptionStyleChooserController *)self profileId];
  [v5 BOOLValue];

  MACaptionAppearancePrefSetVideoOverrideTextEdgeStyle();
}

- (id)_videoOverrideText
{
  return settingsLocString(@"VIDEO_OVERRIDE_EDGE_STYLE", @"CaptioningStyle");
}

@end