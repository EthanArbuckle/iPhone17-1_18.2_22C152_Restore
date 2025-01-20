@interface VoiceOverBrailleStatusCellController
- (id)specifiers;
- (id)statusCellGeneralEnabled:(id)a3;
- (id)statusCellTextStyleEnabled:(id)a3;
- (void)setEnableStatusCellGeneral:(id)a3 specifier:(id)a4;
- (void)setEnableStatusCellTextStyle:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation VoiceOverBrailleStatusCellController

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v17 = OBJC_IVAR___PSListController__specifiers;
    v18 = self;
    v4 = [(VoiceOverBrailleStatusCellController *)self loadSpecifiersFromPlistName:@"BrailleStatusCellSettings" target:self];
    v5 = +[NSMutableArray array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = v4;
    id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (!v6) {
      goto LABEL_14;
    }
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = PSIDKey;
    while (1)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v12 = [v11 propertyForKey:v9];
        if ([v12 isEqualToString:@"StatusCellTextStyle"])
        {

LABEL_10:
          if (_AXSVoiceOverTouchBrailleMasterStatusCellIndex() < 0) {
            continue;
          }
          goto LABEL_11;
        }
        v13 = [v11 propertyForKey:v9];
        unsigned int v14 = [v13 isEqualToString:@"StatusCellGeneral"];

        if (v14) {
          goto LABEL_10;
        }
LABEL_11:
        [v5 addObject:v11];
      }
      id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (!v7)
      {
LABEL_14:

        v15 = *(void **)&v18->AXUISettingsBaseListController_opaque[v17];
        *(void *)&v18->AXUISettingsBaseListController_opaque[v17] = v5;

        v3 = *(void **)&v18->AXUISettingsBaseListController_opaque[v17];
        break;
      }
    }
  }

  return v3;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v11 = a4;
  id v7 = [(VoiceOverBrailleStatusCellController *)self specifierForIndexPath:a5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v7 propertyForKey:@"statusCellOption"];
    uint64_t v9 = _AXSVoiceOverTouchBrailleVirtualStatusAlignment();
    if (_AXSVoiceOverTouchBrailleMasterStatusCellIndex() < 0)
    {
      if ([v8 isEqualToString:@"off"])
      {
LABEL_7:
        uint64_t v10 = 1;
LABEL_10:
        [v11 setChecked:v10];

        goto LABEL_11;
      }
    }
    else if ([v8 isEqualToString:@"left"] && !v9 {
           || [v8 isEqualToString:@"right"] && v9 == 1)
    }
    {
      goto LABEL_7;
    }
    uint64_t v10 = 0;
    goto LABEL_10;
  }
LABEL_11:
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)VoiceOverBrailleStatusCellController;
  [(VoiceOverBrailleStatusCellController *)&v20 tableView:v6 didSelectRowAtIndexPath:v7];
  uint64_t v8 = [v6 cellForRowAtIndexPath:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = objc_msgSend(v6, "visibleCells", 0);
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)v13) setChecked:0];
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v11);
    }

    [v8 setChecked:1];
    unsigned int v14 = [(VoiceOverBrailleStatusCellController *)self specifierForIndexPath:v7];
    v15 = [v14 propertyForKey:@"statusCellOption"];
    if (([v15 isEqualToString:@"left"] & 1) != 0
      || [v15 isEqualToString:@"right"])
    {
      _AXSVoiceOverTouchSetBrailleVirtualStatusAlignment();
      _AXSVoiceOverTouchSetBrailleMasterStatusCellIndex();
    }
    [(VoiceOverBrailleStatusCellController *)self reloadSpecifiers];
  }
}

- (void)setEnableStatusCellTextStyle:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[AXSettings sharedInstance];
  id v5 = [v4 BOOLValue];

  [v6 setVoiceOverTouchBrailleShowTextStyleStatus:v5];
}

- (id)statusCellTextStyleEnabled:(id)a3
{
  v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverTouchBrailleShowTextStyleStatus]);

  return v4;
}

- (void)setEnableStatusCellGeneral:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[AXSettings sharedInstance];
  id v5 = [v4 BOOLValue];

  [v6 setVoiceOverTouchBrailleShowGeneralStatus:v5];
}

- (id)statusCellGeneralEnabled:(id)a3
{
  v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverTouchBrailleShowGeneralStatus]);

  return v4;
}

- (void).cxx_destruct
{
}

@end