@interface AXCaptioningThemeStyleController
- (BOOL)shouldSaveProfile;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)originalName;
- (__CFString)previousProfileId;
- (__CFString)profileId;
- (id)_nameForColor:(CGColor *)a3 colorType:(int)a4;
- (id)_nameForTransparency:(__CFNumber *)a3 transparencyType:(int)a4;
- (id)backgroundColor:(id)a3;
- (id)backgroundTransparency:(id)a3;
- (id)captionSize:(id)a3;
- (id)captioningEnabled:(id)a3;
- (id)profileName:(id)a3;
- (id)specifiers;
- (id)textColor:(id)a3;
- (id)textEdgeStyle:(id)a3;
- (id)textFont:(id)a3;
- (id)textTransparency:(id)a3;
- (id)windowColor:(id)a3;
- (id)windowTransparency:(id)a3;
- (void)_savePressed:(id)a3;
- (void)_settingsChanged:(id)a3;
- (void)_updateTitle;
- (void)dealloc;
- (void)setCaptioningEnabled:(id)a3 specifier:(id)a4;
- (void)setOriginalName:(id)a3;
- (void)setPreviousProfileId:(__CFString *)a3;
- (void)setProfileId:(__CFString *)a3;
- (void)setProfileName:(id)a3 specifier:(id)a4;
- (void)setShouldSaveProfile:(BOOL)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willBecomeActive;
@end

@implementation AXCaptioningThemeStyleController

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:kMACaptionAppearanceSettingsChangedNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)AXCaptioningThemeStyleController;
  [(AXCaptioningThemeStyleController *)&v4 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(AXCaptioningThemeStyleController *)self loadSpecifiersFromPlistName:@"CaptioningStyle" target:self];
    v6 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->super.AXUISettingsBaseListController_opaque[v3] = v5;

    objc_super v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)_savePressed:(id)a3
{
  self->_shouldSaveProfile = 1;
  id v4 = [(AXCaptioningThemeStyleController *)self navigationController];
  id v3 = [v4 popViewControllerAnimated:1];
}

- (void)_settingsChanged:(id)a3
{
  self->_shouldSaveProfile = 1;
  id v3 = [(AXCaptioningThemeStyleController *)self navigationItem];
  [v3 setRightBarButtonItem:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AXCaptioningThemeStyleController;
  [(AXCaptioningThemeStyleController *)&v10 viewWillDisappear:a3];
  if (([(AXCaptioningThemeStyleController *)self isBeingDismissed] & 1) != 0
    || [(AXCaptioningThemeStyleController *)self isMovingFromParentViewController])
  {
    BOOL shouldSaveProfile = self->_shouldSaveProfile;
    [(AXCaptioningThemeStyleController *)self profileId];
    if (shouldSaveProfile)
    {
      MACaptionAppearancePrefSetActiveProfileID();
      [(AXCaptioningThemeStyleController *)self profileId];
      uint64_t v5 = (void *)MACaptionAppearancePrefCopyProfileName();
      if (![v5 length])
      {
        [(AXCaptioningThemeStyleController *)self profileId];
        v6 = [(AXCaptioningThemeStyleController *)self originalName];
        MACaptionAppearancePrefSetProfileName();
      }
      v7 = +[NSNotificationCenter defaultCenter];
      [v7 postNotificationName:kMACaptionAppearanceSettingsChangedNotification object:0];
    }
    else
    {
      MACaptionAppearancePrefRemoveProfile();
      [(AXCaptioningThemeStyleController *)self setProfileId:0];
      if (self->_previousActiveProfile) {
        MACaptionAppearancePrefSetActiveProfileID();
      }
      else {
        AXCaptionResetDefaultActiveProfile();
      }
    }
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"AXThemeCountChangedNotification" object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 removeObserver:self name:kMACaptionAppearanceSettingsChangedNotification object:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = self;
  v34.receiver = self;
  v34.super_class = (Class)AXCaptioningThemeStyleController;
  [(AXCaptioningThemeStyleController *)&v34 viewWillAppear:a3];
  if (![(AXCaptioningThemeStyleController *)v3 profileId])
  {
    previousActiveProfile = v3->_previousActiveProfile;
    if (previousActiveProfile)
    {
      CFRelease(previousActiveProfile);
      v3->_previousActiveProfile = 0;
    }
    v3->_previousActiveProfile = (__CFString *)MACaptionAppearancePrefCopyActiveProfileID();
    id v5 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:3 target:v3 action:"_savePressed:"];
    v6 = [(AXCaptioningThemeStyleController *)v3 navigationItem];
    v26 = v5;
    [v6 setRightBarButtonItem:v5];

    v27 = v3;
    [(AXCaptioningThemeStyleController *)v3 setProfileId:(id)MACaptionAppearancePrefCreateNewProfileFromProfile()];
    v7 = (void *)MACaptionAppearancePrefCopyProfileIDs();
    v8 = settingsLocString(@"default.style.name", @"CaptioningStyle");
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, &stru_20F6B8);

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v7;
    objc_super v10 = (char *)[obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      uint64_t v13 = *(void *)v31;
      uint64_t v14 = 1;
      uint64_t v28 = *(void *)v31;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(obj);
          }
          if (MACaptionAppearancePrefIsProfileEditable())
          {
            v16 = (void *)MACaptionAppearancePrefCopyProfileName();
            if ([v16 hasPrefix:v9])
            {
              objc_msgSend(v16, "substringFromIndex:", objc_msgSend(v9, "length"));
              v18 = uint64_t v17 = v14;
              id v19 = [v18 integerValue];

              uint64_t v14 = v17;
              uint64_t v13 = v28;
              if ((uint64_t)v19 + 1 > v14) {
                uint64_t v14 = (uint64_t)v19 + 1;
              }
            }
            v20 = (void *)MACaptionAppearancePrefCopyProfileOrder();
            v21 = (char *)[v20 integerValue];
            if ((uint64_t)v12 <= (uint64_t)v21) {
              v12 = v21;
            }
          }
        }
        v11 = (char *)[obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    v22 = settingsLocString(@"default.style.name", @"CaptioningStyle");
    v23 = AXFormatInteger();
    v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v23);
    id v3 = v27;
    [(AXCaptioningThemeStyleController *)v27 setOriginalName:v24];

    [(AXCaptioningThemeStyleController *)v27 profileId];
    v25 = [(AXCaptioningThemeStyleController *)v27 originalName];
    MACaptionAppearancePrefSetProfileName();

    [(AXCaptioningThemeStyleController *)v27 profileId];
    +[NSNumber numberWithInteger:v12 + 1];
    MACaptionAppearancePrefSetProfileOrder();
    AXPerformBlockOnMainThreadAfterDelay();
  }
  [(AXCaptioningThemeStyleController *)v3 profileId];
  MACaptionAppearancePrefSetActiveProfileID();
  [(AXCaptioningThemeStyleController *)v3 _updateTitle];
  [*(id *)&v3->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table] reloadData];
}

void __51__AXCaptioningThemeStyleController_viewWillAppear___block_invoke(uint64_t a1)
{
  v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"AXThemeCountChangedNotification" object:0];

  MACaptionAppearanceGetShowCaptions();
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:"_settingsChanged:" name:kMACaptionAppearanceSettingsChangedNotification object:0];
}

- (id)profileName:(id)a3
{
  [(AXCaptioningThemeStyleController *)self profileId];
  id v3 = (void *)MACaptionAppearancePrefCopyProfileName();

  return v3;
}

- (void)willBecomeActive
{
  v3.receiver = self;
  v3.super_class = (Class)AXCaptioningThemeStyleController;
  [(AXCaptioningThemeStyleController *)&v3 willBecomeActive];
  [(AXCaptioningThemeStyleController *)self _updateTitle];
}

- (void)_updateTitle
{
  [(AXCaptioningThemeStyleController *)self profileId];
  id v3 = (id)MACaptionAppearancePrefCopyProfileName();
  [(AXCaptioningThemeStyleController *)self setTitle:v3];
}

- (void)setProfileName:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  [(AXCaptioningThemeStyleController *)self profileId];
  MACaptionAppearancePrefSetProfileName();

  [(AXCaptioningThemeStyleController *)self _updateTitle];
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"AXThemeCountChangedNotification" object:0];
}

- (id)textFont:(id)a3
{
  uint64_t v21 = -1;
  [(AXCaptioningThemeStyleController *)self profileId];
  MACaptionAppearancePrefIsSystemFont();
  [(AXCaptioningThemeStyleController *)self profileId];
  id v4 = (CGFont *)MACaptionAppearancePrefCopyFontForStyle();
  if (v4)
  {
    id v5 = v4;
    id v6 = (void *)CGFontCopyPostScriptName(v4);
    CFRelease(v5);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = AXCaptionFonts();
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "objectForKeyedSubscript:", @"name", (void)v17);
          unsigned __int8 v14 = [v13 isEqualToString:v6];

          if (v14)
          {
            v15 = [v12 objectForKeyedSubscript:@"displayName"];
            goto LABEL_12;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    v15 = 0;
LABEL_12:
  }
  else
  {
    id v6 = AXCaptionDefaultFontForCategory(0);
    v15 = [v6 objectForKeyedSubscript:@"displayName"];
  }

  return v15;
}

- (id)captionSize:(id)a3
{
  id v4 = a3;
  [(AXCaptioningThemeStyleController *)self profileId];
  uint64_t RelativeCharSize = MACaptionAppearancePrefGetRelativeCharSize();
  AXCaptionTextSizes();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v6)
  {
LABEL_14:
    id v6 = v6;
    id v8 = v6;
    goto LABEL_15;
  }
  id v7 = v6;
  id v22 = v4;
  v23 = 0;
  id v8 = 0;
  uint64_t v9 = *(void *)v26;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v26 != v9) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      v12 = [v11 objectForKeyedSubscript:@"relativeSize"];
      uint64_t v13 = +[NSNumber numberWithLong:RelativeCharSize];
      unsigned int v14 = [v12 isEqual:v13];

      if (v14)
      {
        v15 = [v11 objectForKeyedSubscript:@"name"];
        uint64_t v16 = settingsLocString(v15, @"CaptioningStyle");
        long long v17 = v8;
        id v8 = (void *)v16;
      }
      else
      {
        long long v18 = [v11 objectForKeyedSubscript:@"default"];
        unsigned int v19 = [v18 BOOLValue];

        if (!v19) {
          continue;
        }
        v15 = [v11 objectForKeyedSubscript:@"name"];
        uint64_t v20 = settingsLocString(v15, @"CaptioningStyle");
        long long v17 = v23;
        v23 = (void *)v20;
      }
    }
    id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v7);
  id v4 = v22;
  id v6 = v23;
  if (!v8) {
    goto LABEL_14;
  }
LABEL_15:

  return v8;
}

- (void)setCaptioningEnabled:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];

  _AXSClosedCaptionsSetEnabled();
}

- (id)captioningEnabled:(id)a3
{
  uint64_t v3 = _AXSClosedCaptionsEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (id)_nameForTransparency:(__CFNumber *)a3 transparencyType:(int)a4
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = AXCaptionTransparency(a4);
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"alpha", (void)v19);
        [v11 floatValue];
        float v13 = v12;
        [(__CFNumber *)a3 floatValue];
        double v15 = vabds_f32(v13, v14);

        if (v15 < 0.001)
        {
          long long v17 = [v10 objectForKeyedSubscript:@"name"];
          uint64_t v16 = settingsLocString(v17, @"CaptioningStyle");

          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v16 = 0;
LABEL_11:

  return v16;
}

- (id)textTransparency:(id)a3
{
  [(AXCaptioningThemeStyleController *)self profileId];
  id v4 = (const void *)MACaptionAppearancePrefCopyForegroundOpacity();
  id v5 = [(AXCaptioningThemeStyleController *)self _nameForTransparency:v4 transparencyType:1];
  if (v4) {
    CFRelease(v4);
  }

  return v5;
}

- (id)textEdgeStyle:(id)a3
{
  [(AXCaptioningThemeStyleController *)self profileId];
  uint64_t v3 = (void *)MACaptionAppearancePrefCopyTextEdgeStyle();
  if (!v3)
  {
    id v4 = AXCaptionTextEdgeStyleDefault();
    uint64_t v3 = [v4 objectForKey:@"edgeKey"];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = AXCaptionTextEdgeStyles();
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"edgeKey", (void)v16);
        unsigned __int8 v12 = [v11 isEqual:v3];

        if (v12)
        {
          float v14 = [v10 objectForKeyedSubscript:@"name"];
          float v13 = settingsLocString(v14, @"CaptioningStyle");

          goto LABEL_13;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  float v13 = 0;
LABEL_13:

  return v13;
}

- (id)_nameForColor:(CGColor *)a3 colorType:(int)a4
{
  if (a3)
  {
    size_t NumberOfComponents = CGColorGetNumberOfComponents(a3);
    Components = CGColorGetComponents(a3);
    for (i = +[NSMutableArray array];
    {
      double v9 = *Components++;
      uint64_t v10 = +[NSNumber numberWithDouble:v9];
      [i addObject:v10];
    }
  }
  else
  {
    i = AXCaptionColorDefault(a4);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v11 = AXCaptionColors(a4);
  id v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
        long long v17 = objc_msgSend(v16, "objectForKeyedSubscript:", @"rgb", (void)v28);
        uint64_t v18 = 0;
        while (1)
        {
          long long v19 = [i objectAtIndexedSubscript:v18];
          [v19 floatValue];
          float v21 = v20;

          long long v22 = [v17 objectAtIndexedSubscript:v18];
          [v22 floatValue];
          float v24 = v23;

          if (vabds_f32(v21, v24) > 0.0001) {
            break;
          }
          if (++v18 == 3)
          {
            long long v25 = [v16 objectForKeyedSubscript:@"name"];
            long long v26 = settingsLocString(v25, @"CaptioningStyle");

            goto LABEL_19;
          }
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      long long v26 = 0;
    }
    while (v13);
  }
  else
  {
    long long v26 = 0;
  }
LABEL_19:

  return v26;
}

- (id)textColor:(id)a3
{
  [(AXCaptioningThemeStyleController *)self profileId];
  id v4 = (const void *)MACaptionAppearancePrefCopyForegroundColor();
  id v5 = [(AXCaptioningThemeStyleController *)self _nameForColor:v4 colorType:1];
  if (v4) {
    CFRelease(v4);
  }

  return v5;
}

- (id)backgroundColor:(id)a3
{
  [(AXCaptioningThemeStyleController *)self profileId];
  id v4 = (const void *)MACaptionAppearancePrefCopyBackgroundColor();
  id v5 = [(AXCaptioningThemeStyleController *)self _nameForColor:v4 colorType:2];
  if (v4) {
    CFRelease(v4);
  }

  return v5;
}

- (id)windowColor:(id)a3
{
  [(AXCaptioningThemeStyleController *)self profileId];
  id v4 = (const void *)MACaptionAppearancePrefCopyWindowColor();
  id v5 = [(AXCaptioningThemeStyleController *)self _nameForColor:v4 colorType:3];
  if (v4) {
    CFRelease(v4);
  }

  return v5;
}

- (id)backgroundTransparency:(id)a3
{
  [(AXCaptioningThemeStyleController *)self profileId];
  id v4 = (const void *)MACaptionAppearancePrefCopyBackgroundOpacity();
  id v5 = [(AXCaptioningThemeStyleController *)self _nameForTransparency:v4 transparencyType:2];
  if (v4) {
    CFRelease(v4);
  }

  return v5;
}

- (id)windowTransparency:(id)a3
{
  [(AXCaptioningThemeStyleController *)self profileId];
  id v4 = (const void *)MACaptionAppearancePrefCopyWindowOpacity();
  id v5 = [(AXCaptioningThemeStyleController *)self _nameForTransparency:v4 transparencyType:3];
  if (v4) {
    CFRelease(v4);
  }

  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXCaptioningThemeStyleController;
  [(AXCaptionStyleChooserController *)&v12 tableView:a3 willDisplayCell:v8 forRowAtIndexPath:a5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v9 = [v8 textField];
    [v9 setDelegate:self];
    [v9 setAutocapitalizationType:1];
    [v9 setReturnKeyType:9];
    uint64_t v10 = [v8 specifier];
    v11 = [(AXCaptioningThemeStyleController *)self profileName:v10];
    [v9 setText:v11];
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = [a3 text];
  [(AXCaptioningThemeStyleController *)self setProfileName:v4 specifier:0];
}

- (__CFString)profileId
{
  return self->profileId;
}

- (void)setProfileId:(__CFString *)a3
{
}

- (__CFString)previousProfileId
{
  return self->previousProfileId;
}

- (void)setPreviousProfileId:(__CFString *)a3
{
}

- (BOOL)shouldSaveProfile
{
  return self->_shouldSaveProfile;
}

- (void)setShouldSaveProfile:(BOOL)a3
{
  self->_BOOL shouldSaveProfile = a3;
}

- (NSString)originalName
{
  return self->_originalName;
}

- (void)setOriginalName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end