@interface AXCaptionTextMetaFontController
- (id)_fontForCategory:(id)a3;
- (id)specifiers;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXCaptionTextMetaFontController

- (id)specifiers
{
  v2 = self;
  v3 = *(void **)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v25 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = [(AXCaptionStyleChooserController *)v2 captionPreviewSpecifiers];
    [v4 addObjectsFromArray:v5];

    v30 = v4;
    v6 = [v4 lastObject];
    v7 = settingsLocString(@"FONT_CATEGORY_FOOTER_TEXT", @"CaptioningStyle");
    v24 = v6;
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    AXCaptionFonts();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v32;
      uint64_t v29 = PSCellClassKey;
      uint64_t v27 = PSTitleKey;
      uint64_t v28 = PSIDKey;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v13 = [v12 objectForKeyedSubscript:@"category"];
          unsigned int v14 = [v13 intValue];

          if (v14)
          {
            v15 = [v12 objectForKeyedSubscript:@"category"];
            v16 = AXCaptionFontCategoryName((int)[v15 intValue]);

            v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:v2 set:0 get:"_fontForCategory:" detail:objc_opt_class() cell:1 edit:0];
            [v17 setProperty:objc_opt_class() forKey:v29];
            [v12 objectForKeyedSubscript:@"category"];
            v19 = v18 = v2;
            [v17 setProperty:v19 forKey:@"category"];

            v20 = [v12 objectForKeyedSubscript:@"name"];
            [v17 setProperty:v20 forKey:v28];

            v2 = v18;
            v21 = [v12 objectForKeyedSubscript:@"isBold"];
            [v17 setProperty:v21 forKey:@"isBold"];

            [v17 setProperty:v16 forKey:v27];
            [v17 setCellType:2];
            [v30 addObject:v17];
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v9);
    }

    v22 = *(void **)&v2->super.AXUISettingsBaseListController_opaque[v25];
    *(void *)&v2->super.AXUISettingsBaseListController_opaque[v25] = v30;

    v3 = *(void **)&v2->super.AXUISettingsBaseListController_opaque[v25];
  }

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXCaptionTextMetaFontController;
  [(AXCaptionTextMetaFontController *)&v4 viewWillAppear:a3];
  [(AXCaptionTextMetaFontController *)self reloadSpecifiers];
}

- (id)_fontForCategory:(id)a3
{
  id v4 = a3;
  v5 = [v4 propertyForKey:@"category"];
  uint64_t v6 = (int)[v5 intValue];

  uint64_t v27 = -1;
  [(AXCaptionStyleChooserController *)self profileId];
  MACaptionAppearancePrefIsSystemFont();
  [(AXCaptionStyleChooserController *)self profileId];
  v7 = (CGFont *)MACaptionAppearancePrefCopyFontForStyle();
  if (!v7)
  {
    id v9 = AXCaptionDefaultFontForCategory(v6);
    v13 = [v9 objectForKeyedSubscript:@"displayName"];
    goto LABEL_17;
  }
  id v8 = v7;
  id v9 = (void *)CGFontCopyPostScriptName(v7);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = AXCaptionFonts();
  id v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    v21 = v8;
    id v22 = v4;
    v13 = 0;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "objectForKeyedSubscript:", @"name", v21, v22, (void)v23);
        unsigned int v18 = [v17 isEqualToString:v9];

        if (v18)
        {
          uint64_t v19 = [v16 objectForKeyedSubscript:@"displayName"];

          v13 = (void *)v19;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v12);

    id v8 = v21;
    id v4 = v22;
    if (v13) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  v13 = (void *)CGFontCopyFullName(v8);
LABEL_16:
  CFRelease(v8);
LABEL_17:

  return v13;
}

@end