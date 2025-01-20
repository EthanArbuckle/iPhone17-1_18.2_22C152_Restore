@interface WatchControlActionDetailController
- (WatchControlActionDetailControllerDelegate)delegate;
- (id)_createGenericSpecifiersForActionGroup:(unint64_t)a3;
- (id)_createSiriShortcutsSpecifiersForActionGroup:(unint64_t)a3;
- (id)_createSpecifiersForActionGroup:(unint64_t)a3;
- (id)actionDetailControllerDelegate;
- (id)customActionDetailControllerDelegate;
- (id)specifiers;
- (int64_t)greyEvent;
- (int64_t)motionPointerEdge;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation WatchControlActionDetailController

- (id)actionDetailControllerDelegate
{
  v2 = [(WatchControlActionDetailController *)self specifier];
  v3 = [v2 userInfo];
  v4 = [v3 objectForKeyedSubscript:@"ActionDetailDelegate"];

  return v4;
}

- (id)customActionDetailControllerDelegate
{
  v3 = [(WatchControlActionDetailController *)self actionDetailControllerDelegate];
  int v4 = [v3 conformsToProtocol:&unk_26FB20420];

  if (v4)
  {
    v5 = [(WatchControlActionDetailController *)self actionDetailControllerDelegate];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)specifiers
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  int v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (v4) {
    goto LABEL_29;
  }
  v5 = [(WatchControlActionDetailController *)self actionDetailControllerDelegate];
  uint64_t v40 = [v5 selectedActionForDetailController:self];

  v41 = [MEMORY[0x263EFF980] array];
  v6 = [(WatchControlActionDetailController *)self specifier];
  v7 = [v6 userInfo];
  v8 = [v7 objectForKeyedSubscript:@"AdditionalActions"];

  if ([v8 count])
  {
    v9 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:0 edit:0];
    [v9 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
    [v41 addObject:v9];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v38 = v8;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      v36 = v9;
      uint64_t v37 = v3;
      v13 = 0;
      uint64_t v14 = *(void *)v47;
      uint64_t v15 = *MEMORY[0x263F60140];
      uint64_t v16 = *MEMORY[0x263F60308];
      obuint64_t j = v10;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v47 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = [*(id *)(*((void *)&v46 + 1) + 8 * i) unsignedIntegerValue];
          v19 = (void *)MEMORY[0x263F5FC40];
          v20 = WCNameForAction();
          v21 = [v19 preferenceSpecifierNamed:v20 target:0 set:0 get:0 detail:0 cell:3 edit:0];

          v22 = WCImageForAction();
          [v21 setProperty:v22 forKey:v15];

          v23 = [NSNumber numberWithUnsignedInteger:v18];
          [v21 setProperty:v23 forKey:v16];

          if (v18 == v40)
          {
            id v24 = v21;

            v13 = v24;
          }
          [v41 addObject:v21];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v12);

      uint64_t v3 = v37;
      v8 = v38;
      v9 = v36;
      if (!v13) {
        goto LABEL_16;
      }
      [v36 setProperty:v13 forKey:*MEMORY[0x263F60200]];
    }
    else
    {
      v13 = v10;
    }

LABEL_16:
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v25 = WCAvailableActionGroupsForSettings();
  uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v43 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = [*(id *)(*((void *)&v42 + 1) + 8 * j) unsignedIntegerValue];
        v31 = [(WatchControlActionDetailController *)self actionDetailControllerDelegate];
        int v32 = [v31 canShowActionGroup:v30 forDetailController:self];

        if (v32)
        {
          v33 = [(WatchControlActionDetailController *)self _createSpecifiersForActionGroup:v30];
          if ([v33 count]) {
            [v41 addObjectsFromArray:v33];
          }
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v27);
  }

  v34 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v41;

  int v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
LABEL_29:

  return v4;
}

- (id)_createSpecifiersForActionGroup:(unint64_t)a3
{
  if (a3 == 10002) {
    [(WatchControlActionDetailController *)self _createSiriShortcutsSpecifiersForActionGroup:10002];
  }
  else {
  uint64_t v3 = -[WatchControlActionDetailController _createGenericSpecifiersForActionGroup:](self, "_createGenericSpecifiersForActionGroup:");
  }

  return v3;
}

- (id)_createGenericSpecifiersForActionGroup:(unint64_t)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v30 = [MEMORY[0x263EFF980] array];
  int v4 = [(WatchControlActionDetailController *)self actionDetailControllerDelegate];
  uint64_t v28 = [v4 selectedActionForDetailController:self];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  WCDefaultActionsForActionGroup();
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v29 = 0;
    uint64_t v7 = *(void *)v33;
    uint64_t v26 = *MEMORY[0x263F83628];
    uint64_t v27 = *MEMORY[0x263F60140];
    uint64_t v8 = *MEMORY[0x263F60308];
    uint64_t v9 = *MEMORY[0x263F5FEF8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = [*(id *)(*((void *)&v32 + 1) + 8 * i) unsignedIntegerValue];
        uint64_t v12 = [(WatchControlActionDetailController *)self actionDetailControllerDelegate];
        int v13 = [v12 canShowAction:v11 forDetailController:self];

        if (v13)
        {
          uint64_t v14 = (void *)MEMORY[0x263F5FC40];
          uint64_t v15 = WCNameForAction();
          uint64_t v16 = [v14 preferenceSpecifierNamed:v15 target:0 set:0 get:0 detail:0 cell:3 edit:0];

          v17 = WCImageForAction();
          uint64_t v18 = v17;
          if ((unint64_t)(v11 - 11) <= 1)
          {
            uint64_t v19 = AXResizeImageToSystemImage(v17, v26);

            uint64_t v18 = (void *)v19;
          }
          [v16 setProperty:v18 forKey:v27];
          v20 = [NSNumber numberWithUnsignedInteger:v11];
          [v16 setProperty:v20 forKey:v8];

          [v16 setProperty:MEMORY[0x263EFFA88] forKey:v9];
          if (v11 == v28)
          {
            id v21 = v16;

            v29 = v21;
          }
          [v30 addObject:v16];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v6);
  }
  else
  {
    v29 = 0;
  }

  if ([v30 count])
  {
    v22 = (void *)MEMORY[0x263F5FC40];
    v23 = WCNameForActionGroup();
    id v24 = [v22 preferenceSpecifierNamed:v23 target:self set:0 get:0 detail:0 cell:0 edit:0];

    [v24 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
    if (v29) {
      [v24 setProperty:v29 forKey:*MEMORY[0x263F60200]];
    }
    [v30 insertObject:v24 atIndex:0];
  }

  return v30;
}

- (id)_createSiriShortcutsSpecifiersForActionGroup:(unint64_t)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  int v4 = [(WatchControlActionDetailController *)self customActionDetailControllerDelegate];

  if (v4)
  {
    id v39 = [MEMORY[0x263EFF980] array];
    uint64_t v5 = [(WatchControlActionDetailController *)self customActionDetailControllerDelegate];
    uint64_t v38 = [v5 selectedActionForDetailController:self];

    uint64_t v6 = [(WatchControlActionDetailController *)self customActionDetailControllerDelegate];
    long long v32 = self;
    uint64_t v7 = [v6 selectedCustomActionIdentifierForCustomActionType:1 forDetailController:self];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v8 = [MEMORY[0x263F22958] shortcutsManagerForSource:1];
    uint64_t v9 = [v8 shortcuts];

    obuint64_t j = v9;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      long long v33 = 0;
      uint64_t v36 = *MEMORY[0x263F83628];
      uint64_t v37 = *(void *)v41;
      uint64_t v35 = *MEMORY[0x263F60140];
      uint64_t v12 = *MEMORY[0x263F60308];
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v41 != v37) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v15 = (void *)MEMORY[0x263F5FC40];
          uint64_t v16 = [v14 shortcutName];
          v17 = [v15 preferenceSpecifierNamed:v16 target:0 set:0 get:0 detail:0 cell:3 edit:0];

          [v14 glyphCharacter];
          uint64_t v18 = WFSystemImageNameForGlyphCharacter();
          if ([v18 length])
          {
            uint64_t v19 = (void *)MEMORY[0x263F827E8];
            v20 = [MEMORY[0x263F82818] configurationWithTextStyle:v36];
            id v21 = [v19 _systemImageNamed:v18 withConfiguration:v20];

            v22 = [MEMORY[0x263F825C8] whiteColor];
            v23 = [v21 imageWithTintColor:v22 renderingMode:1];

            [v17 setProperty:v23 forKey:v35];
          }
          id v24 = [v14 identifier];
          [v17 setProperty:v24 forKey:v12];

          if (v38 == 10020)
          {
            if ([v7 length])
            {
              v25 = [v14 identifier];
              int v26 = [v25 isEqualToString:v7];

              if (v26)
              {
                id v27 = v17;

                long long v33 = v27;
              }
            }
          }
          [v39 addObject:v17];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v11);
    }
    else
    {
      long long v33 = 0;
    }

    if ([v39 count])
    {
      uint64_t v28 = (void *)MEMORY[0x263F5FC40];
      v29 = WCNameForActionGroup();
      id v30 = [v28 preferenceSpecifierNamed:v29 target:v32 set:0 get:0 detail:0 cell:0 edit:0];

      [v30 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
      [v30 setProperty:&unk_26FB004F0 forKey:@"CustomActionType"];
      if (v33) {
        [v30 setProperty:v33 forKey:*MEMORY[0x263F60200]];
      }
      [v39 insertObject:v30 atIndex:0];
    }
  }
  else
  {
    id v39 = (id)MEMORY[0x263EFFA68];
  }

  return v39;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)WatchControlActionDetailController;
  id v6 = a4;
  [(WatchControlActionDetailController *)&v18 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[WatchControlActionDetailController indexForIndexPath:](self, "indexForIndexPath:", v6, v18.receiver, v18.super_class);
  uint64_t v8 = [(WatchControlActionDetailController *)self specifiers];
  uint64_t v9 = [v8 objectAtIndex:v7];

  uint64_t v10 = [v6 section];
  uint64_t v11 = [(WatchControlActionDetailController *)self specifierAtIndex:[(WatchControlActionDetailController *)self indexOfGroup:v10]];
  uint64_t v12 = [v11 propertyForKey:*MEMORY[0x263F60168]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    uint64_t v14 = [v9 propertyForKey:*MEMORY[0x263F60308]];
    if (!v14)
    {
LABEL_10:

      goto LABEL_11;
    }
    uint64_t v15 = [v11 propertyForKey:@"CustomActionType"];
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v16 = [v15 integerValue];
      v17 = [(WatchControlActionDetailController *)self customActionDetailControllerDelegate];
      [v17 setCustomActionType:v16 withCustomActionIdentifier:v14 forDetailController:self];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_9:
        [(WatchControlActionDetailController *)self reloadSpecifiers];

        goto LABEL_10;
      }
      v17 = [(WatchControlActionDetailController *)self actionDetailControllerDelegate];
      objc_msgSend(v17, "setAction:forDetailController:", objc_msgSend(v14, "unsignedIntegerValue"), self);
    }

    goto LABEL_9;
  }
LABEL_11:
}

- (WatchControlActionDetailControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WatchControlActionDetailControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (int64_t)greyEvent
{
  v2 = [(WatchControlActionDetailController *)self specifier];
  uint64_t v3 = [v2 userInfo];
  int v4 = [v3 objectForKeyedSubscript:@"GreyEvent"];
  int64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (int64_t)motionPointerEdge
{
  v2 = [(WatchControlActionDetailController *)self specifier];
  uint64_t v3 = [v2 userInfo];
  int v4 = [v3 objectForKeyedSubscript:@"MotionPointerEdge"];
  int64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

@end