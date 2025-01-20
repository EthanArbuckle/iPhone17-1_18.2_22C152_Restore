@interface AXCaptionTextFontController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (CGFont)selectedFont;
- (id)_videoOverrideText;
- (id)_videoOverridesStyle:(id)a3;
- (id)specifiers;
- (int64_t)systemFontType;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)textCategory;
- (void)_donePressed;
- (void)_editPressed:(id)a3;
- (void)_manageEditButton;
- (void)_setVideoOverridesStyle:(id)a3 specifier:(id)a4;
- (void)setSelectedFont:(CGFont *)a3;
- (void)setSystemFontType:(int64_t)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXCaptionTextFontController

- (int64_t)textCategory
{
  v2 = [(AXCaptionTextFontController *)self specifier];
  v3 = [v2 propertyForKey:@"category"];

  int64_t v4 = (int)[v3 intValue];
  return v4;
}

- (void)_editPressed:(id)a3
{
  [(AXCaptionTextFontController *)self setEditing:1 animated:1];
  id v5 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_donePressed"];
  int64_t v4 = [(AXCaptionTextFontController *)self navigationItem];
  [v4 setRightBarButtonItem:v5];
}

- (void)_donePressed
{
  [(AXCaptionTextFontController *)self setEditing:0 animated:1];

  [(AXCaptionTextFontController *)self _manageEditButton];
}

- (void)_manageEditButton
{
  v3 = AXCaptionExtraUserFonts();
  id v4 = [v3 count];

  if (v4)
  {
    id v6 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:2 target:self action:"_editPressed:"];
    id v5 = [(AXCaptionTextFontController *)self navigationItem];
    [v5 setRightBarButtonItem:v6];
  }
  else
  {
    id v6 = [(AXCaptionTextFontController *)self navigationItem];
    [v6 setRightBarButtonItem:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXCaptionTextFontController;
  [(AXCaptionTextFontController *)&v5 viewWillAppear:a3];
  [(AXCaptionStyleChooserController *)self profileId];
  [(AXCaptionTextFontController *)self textCategory];
  id v4 = (const void *)MACaptionAppearancePrefCopyFontForStyle();
  [(AXCaptionTextFontController *)self setSystemFontType:-1];
  [(AXCaptionStyleChooserController *)self profileId];
  [(AXCaptionTextFontController *)self textCategory];
  if (MACaptionAppearancePrefIsSystemFont()) {
    [(AXCaptionTextFontController *)self setSystemFontType:-1];
  }
  [(AXCaptionTextFontController *)self setSelectedFont:v4];
  if (v4) {
    CFRelease(v4);
  }
  [(AXCaptionTextFontController *)self _manageEditButton];
  [(AXCaptionTextFontController *)self reloadSpecifiers];
}

- (id)specifiers
{
  v2 = self;
  v3 = *(void **)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v25 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    objc_super v5 = [(AXCaptionStyleChooserController *)v2 captionPreviewSpecifiers];
    [v4 addObjectsFromArray:v5];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    AXCaptionFonts();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v31 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v31)
    {
      uint64_t v30 = *(void *)v33;
      uint64_t v28 = PSIDKey;
      uint64_t v29 = PSCellClassKey;
      uint64_t v27 = PSTitleKey;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v33 != v30) {
            objc_enumerationMutation(obj);
          }
          v7 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v8 = [v7 objectForKeyedSubscript:@"displayName"];
          if (!v8)
          {
            v8 = [v7 objectForKeyedSubscript:@"name"];
          }
          v9 = [v7 objectForKeyedSubscript:@"name"];
          if (v9)
          {
            +[PSSpecifier preferenceSpecifierNamed:v8 target:v2 set:0 get:0 detail:0 cell:3 edit:0];
            v11 = v10 = v2;
            [v11 setProperty:objc_opt_class() forKey:v29];
            [v11 setProperty:v9 forKey:v28];
            [v7 objectForKeyedSubscript:@"isBold"];
            v13 = v12 = v4;
            [v11 setProperty:v13 forKey:@"isBold"];

            [v11 setProperty:v8 forKey:v27];
            v14 = [v7 objectForKeyedSubscript:@"isUserAddedFont"];
            [v11 setProperty:v14 forKey:@"isUserAddedFont"];

            id v4 = v12;
            [v11 setProperty:&__kCFBooleanTrue forKey:@"isFont"];
            [v11 setCellType:3];
            [v12 addObject:v11];

            v2 = v10;
          }
        }
        id v31 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v31);
    }

    v15 = [(AXCaptionStyleChooserController *)v2 videoOverrideSpecifiers];
    [v4 addObjectsFromArray:v15];

    v16 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
    [v4 addObject:v16];
    v17 = settingsLocString(@"ADD_FONT", @"CaptioningStyle");
    v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

    v19 = +[NSNumber numberWithLong:[(AXCaptionTextFontController *)v2 textCategory]];
    [v18 setProperty:v19 forKey:@"TextCategory"];

    objc_msgSend(v18, "setProperty:forKey:", -[AXCaptionStyleChooserController profileId](v2, "profileId"), @"ProfileId");
    [v4 addObject:v18];
    if (![(AXCaptionTextFontController *)v2 textCategory])
    {
      uint64_t v20 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];

      [v4 addObject:v20];
      v21 = settingsLocString(@"advanced", @"CaptioningStyle");
      v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

      [v4 addObject:v22];
      v16 = (void *)v20;
    }
    v23 = *(void **)&v2->super.AXUISettingsBaseListController_opaque[v25];
    *(void *)&v2->super.AXUISettingsBaseListController_opaque[v25] = v4;

    v3 = *(void **)&v2->super.AXUISettingsBaseListController_opaque[v25];
  }

  return v3;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v4 = [(AXCaptionTextFontController *)self specifierAtIndex:[(AXCaptionTextFontController *)self indexForIndexPath:a4]];
  objc_super v5 = [v4 propertyForKey:@"isFont"];
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v4 = [(AXCaptionTextFontController *)self specifierAtIndex:[(AXCaptionTextFontController *)self indexForIndexPath:a4]];
  objc_super v5 = [v4 propertyForKey:@"isUserAddedFont"];
  unsigned int v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AXCaptionTextFontController *)self specifierAtIndex:[(AXCaptionTextFontController *)self indexForIndexPath:v7]];
  v9 = [v8 propertyForKey:@"isFont"];
  unsigned __int8 v10 = [v9 BOOLValue];

  if (v10)
  {
    BOOL v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)AXCaptionTextFontController;
    BOOL v11 = [(AXCaptionTextFontController *)&v13 tableView:v6 shouldIndentWhileEditingRowAtIndexPath:v7];
  }

  return v11;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a5;
  [(AXCaptionTextFontController *)self beginUpdates];
  id v7 = [(AXCaptionTextFontController *)self indexForIndexPath:v6];

  id v12 = [(AXCaptionTextFontController *)self specifierAtIndex:v7];
  v8 = [v12 propertyForKey:@"isUserAddedFont"];
  LODWORD(v7) = [v8 BOOLValue];

  if (v7)
  {
    v9 = [v12 propertyForKey:PSIDKey];
    AXCaptionRemoveUserAddedFont(v9);

    [(AXCaptionTextFontController *)self removeSpecifier:v12 animated:1];
  }
  [(AXCaptionTextFontController *)self endUpdates];
  unsigned __int8 v10 = AXCaptionExtraUserFonts();
  id v11 = [v10 count];

  if (!v11)
  {
    [(AXCaptionTextFontController *)self setEditing:0 animated:1];
    [(AXCaptionTextFontController *)self _manageEditButton];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AXCaptionTextFontController;
  [(AXCaptionStyleChooserController *)&v19 tableView:a3 willDisplayCell:v8 forRowAtIndexPath:a5];
  int64_t v9 = [(AXCaptionTextFontController *)self systemFontType];
  switch(v9)
  {
    case 2:
      unsigned __int8 v10 = (id *)&MACaptionAppearanceMonoSystemFontIdentifier;
      goto LABEL_7;
    case 1:
      unsigned __int8 v10 = (id *)&MACaptionAppearanceMediumSystemFontIdentifier;
      goto LABEL_7;
    case 0:
      unsigned __int8 v10 = (id *)&MACaptionAppearanceSystemFontIdentifier;
LABEL_7:
      CFStringRef v11 = (CFStringRef)*v10;
LABEL_8:
      id v12 = (void *)v11;
      goto LABEL_9;
  }
  v17 = [(AXCaptionTextFontController *)self selectedFont];
  if (v17)
  {
    CFStringRef v11 = CGFontCopyPostScriptName(v17);
    goto LABEL_8;
  }
  v18 = AXCaptionDefaultFontForCategory([(AXCaptionTextFontController *)self textCategory]);
  id v12 = [v18 objectForKeyedSubscript:@"name"];

LABEL_9:
  id v13 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [v13 specifier];
    v15 = [v14 propertyForKey:PSIDKey];
    id v16 = [v15 isEqualToString:v12];

    [v13 setChecked:v16];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AXCaptionTextFontController;
  [(AXCaptionTextFontController *)&v15 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = [(AXCaptionTextFontController *)self specifierAtIndex:[(AXCaptionTextFontController *)self indexForIndexPath:v6]];
  id v8 = [v7 propertyForKey:@"isFont"];
  unsigned int v9 = [v8 BOOLValue];

  if (v9)
  {
    unsigned __int8 v10 = [v7 propertyForKey:PSIDKey];
    CFStringRef v11 = [v7 propertyForKey:@"isBold"];
    [v11 BOOLValue];

    if ([v10 isEqual:MACaptionAppearanceSystemFontIdentifier])
    {
      uint64_t v12 = 0;
    }
    else if ([v10 isEqual:MACaptionAppearanceMonoSystemFontIdentifier])
    {
      uint64_t v12 = 2;
    }
    else if ([v10 isEqual:MACaptionAppearanceMediumSystemFontIdentifier])
    {
      uint64_t v12 = 1;
    }
    else
    {
      uint64_t v12 = -1;
    }
    [(AXCaptionTextFontController *)self setSystemFontType:v12];
    if ([(AXCaptionTextFontController *)self systemFontType] == -1)
    {
      id v13 = (const __CTFont *)_CTFontCreateWithNameAndSymbolicTraits();
      CGFontRef v14 = CTFontCopyGraphicsFont(v13, 0);
      if (v13) {
        CFRelease(v13);
      }
      if (v14)
      {
        CFRetain(v14);
        AXPerformBlockOnMainThreadAfterDelay();
        [(AXCaptionTextFontController *)self setSelectedFont:v14];
        CFRelease(v14);
      }
    }
    else
    {
      AXPerformBlockOnMainThreadAfterDelay();
    }
    [(AXCaptionStyleChooserController *)self updateTableCheckedSelection:v6];
  }
}

uint64_t __65__AXCaptionTextFontController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) profileId];
  id v3 = [*(id *)(a1 + 32) textCategory];
  id v4 = [*(id *)(a1 + 32) systemFontType];

  return _MACaptionAppearancePrefSetIsSystemFont(v2, 1, v3, v4);
}

void __65__AXCaptionTextFontController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) profileId];
  [*(id *)(a1 + 32) textCategory];
  MACaptionAppearancePrefSetFontForStyle();
  id v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

- (id)_videoOverridesStyle:(id)a3
{
  [(AXCaptionStyleChooserController *)self profileId];
  [(AXCaptionTextFontController *)self textCategory];
  id v4 = (void *)MACaptionAppearancePrefCopyVideoOverrideFontForStyle();

  return v4;
}

- (void)_setVideoOverridesStyle:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  [(AXCaptionStyleChooserController *)self profileId];
  [(AXCaptionTextFontController *)self textCategory];
  [v5 BOOLValue];

  MACaptionAppearancePrefSetVideoOverrideFontForStyle();
}

- (id)_videoOverrideText
{
  return settingsLocString(@"VIDEO_OVERRIDE_FONT_STYLE", @"CaptioningStyle");
}

- (CGFont)selectedFont
{
  return self->_selectedFont;
}

- (void)setSelectedFont:(CGFont *)a3
{
}

- (int64_t)systemFontType
{
  return self->_systemFontType;
}

- (void)setSystemFontType:(int64_t)a3
{
  self->_systemFontType = a3;
}

@end