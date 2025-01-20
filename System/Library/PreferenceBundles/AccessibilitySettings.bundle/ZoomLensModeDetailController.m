@interface ZoomLensModeDetailController
- (NSMutableArray)dockPositionSpecs;
- (PSSpecifier)dockPositionsGroupSpecifier;
- (ZoomLensModeDetailController)init;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)setDockPositionSpecs:(id)a3;
- (void)setDockPositionsGroupSpecifier:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSpecifiersForZoomModeSettingsChange;
@end

@implementation ZoomLensModeDetailController

- (ZoomLensModeDetailController)init
{
  v12.receiver = self;
  v12.super_class = (Class)ZoomLensModeDetailController;
  v2 = [(ZoomLensModeDetailController *)&v12 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[AXSettings sharedInstance];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __36__ZoomLensModeDetailController_init__block_invoke;
    v9[3] = &unk_208798;
    objc_copyWeak(&v10, &location);
    [v3 registerUpdateBlock:v9 forRetrieveSelector:"zoomPreferredCurrentLensMode" withListener:v2];

    objc_destroyWeak(&v10);
    v4 = +[AXSettings sharedInstance];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __36__ZoomLensModeDetailController_init__block_invoke_2;
    v7[3] = &unk_208798;
    objc_copyWeak(&v8, &location);
    [v4 registerUpdateBlock:v7 forRetrieveSelector:"zoomPreferredCurrentDockPosition" withListener:v2];

    objc_destroyWeak(&v8);
    v5 = v2;
    objc_destroyWeak(&location);
  }

  return v2;
}

void __36__ZoomLensModeDetailController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateSpecifiersForZoomModeSettingsChange];
}

void __36__ZoomLensModeDetailController_init__block_invoke_2(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "dockPositionSpecs", 0);

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v7);
        id v9 = objc_loadWeakRetained(v1);
        [v9 reloadSpecifier:v8 animated:1];

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v38 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v37 = +[PSSpecifier groupSpecifierWithID:@"ZoomLensMode" name:0];
    objc_msgSend(v4, "addObject:");
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    AXZoomUserSelectableLensModes();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v49;
      uint64_t v8 = PSIDKey;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v49 != v7) {
            objc_enumerationMutation(obj);
          }
          long long v10 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          long long v11 = AXLocalizedTitleForZoomLensMode(v10);
          long long v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];

          [v12 setProperty:v10 forKey:@"ZoomLensMode"];
          [v12 setProperty:v10 forKey:v8];
          [v4 addObject:v12];
        }
        id v6 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v6);
    }

    long long v13 = settingsLocString(@"ZOOM_DOCK_POSITION", @"ZoomSettings");
    v14 = +[PSSpecifier groupSpecifierWithID:@"ZoomDockPosition" name:v13];
    [(ZoomLensModeDetailController *)self setDockPositionsGroupSpecifier:v14];

    v15 = [(ZoomLensModeDetailController *)self dockPositionsGroupSpecifier];
    [v4 addObject:v15];

    v16 = +[NSMutableArray array];
    [(ZoomLensModeDetailController *)self setDockPositionSpecs:v16];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v17 = AXZoomDockPositions();
    id v18 = [v17 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v45;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v45 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
          v23 = AXLocalizedTitleForDockPosition(v22);
          v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:self set:0 get:0 detail:0 cell:3 edit:0];

          [v24 setProperty:v22 forKey:@"ZoomDockPosition"];
          [v4 addObject:v24];
          v25 = [(ZoomLensModeDetailController *)self dockPositionSpecs];
          [v25 addObject:v24];
        }
        id v19 = [v17 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v19);
    }

    v26 = +[AXSettings sharedInstance];
    v27 = [v26 zoomPreferredCurrentLensMode];
    unsigned __int8 v28 = [v27 isEqualToString:AXZoomLensModeWindowAnchored];

    if ((v28 & 1) == 0)
    {
      v29 = [(ZoomLensModeDetailController *)self dockPositionsGroupSpecifier];
      [v4 removeObject:v29];

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v30 = [(ZoomLensModeDetailController *)self dockPositionSpecs];
      id v31 = [v30 countByEnumeratingWithState:&v40 objects:v52 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v41;
        do
        {
          for (k = 0; k != v32; k = (char *)k + 1)
          {
            if (*(void *)v41 != v33) {
              objc_enumerationMutation(v30);
            }
            [v4 removeObject:*(void *)(*((void *)&v40 + 1) + 8 * (void)k)];
          }
          id v32 = [v30 countByEnumeratingWithState:&v40 objects:v52 count:16];
        }
        while (v32);
      }
    }
    v35 = *(void **)&self->AXUISettingsBaseListController_opaque[v38];
    *(void *)&self->AXUISettingsBaseListController_opaque[v38] = v4;

    v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v38];
  }

  return v3;
}

- (void)updateSpecifiersForZoomModeSettingsChange
{
  v3 = [(ZoomLensModeDetailController *)self specifiers];
  id v4 = [(ZoomLensModeDetailController *)self dockPositionsGroupSpecifier];
  if ([v3 containsObject:v4])
  {
  }
  else
  {
    id v5 = +[AXSettings sharedInstance];
    id v6 = [v5 zoomPreferredCurrentLensMode];
    unsigned int v7 = [v6 isEqualToString:AXZoomLensModeWindowAnchored];

    if (v7)
    {
      uint64_t v8 = [(ZoomLensModeDetailController *)self dockPositionsGroupSpecifier];
      id v9 = [(ZoomLensModeDetailController *)self specifiers];
      long long v10 = [v9 lastObject];
      [(ZoomLensModeDetailController *)self insertSpecifier:v8 afterSpecifier:v10 animated:1];

      id v16 = [(ZoomLensModeDetailController *)self dockPositionSpecs];
      long long v11 = [(ZoomLensModeDetailController *)self dockPositionsGroupSpecifier];
      [(ZoomLensModeDetailController *)self insertContiguousSpecifiers:v16 afterSpecifier:v11 animated:1];
LABEL_8:

      goto LABEL_10;
    }
  }
  id v16 = [(ZoomLensModeDetailController *)self specifiers];
  long long v11 = [(ZoomLensModeDetailController *)self dockPositionsGroupSpecifier];
  if (([v16 containsObject:v11] & 1) == 0) {
    goto LABEL_8;
  }
  long long v12 = +[AXSettings sharedInstance];
  long long v13 = [v12 zoomPreferredCurrentLensMode];
  unsigned __int8 v14 = [v13 isEqualToString:AXZoomLensModeWindowAnchored];

  if (v14) {
    return;
  }
  v15 = [(ZoomLensModeDetailController *)self dockPositionsGroupSpecifier];
  [(ZoomLensModeDetailController *)self removeSpecifier:v15 animated:1];

  id v16 = [(ZoomLensModeDetailController *)self dockPositionSpecs];
  [(ZoomLensModeDetailController *)self removeContiguousSpecifiers:v16 animated:1];
LABEL_10:
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)ZoomLensModeDetailController;
  id v4 = [(ZoomLensModeDetailController *)&v14 tableView:a3 cellForRowAtIndexPath:a4];
  id v5 = +[AXSettings sharedInstance];
  id v6 = [v5 zoomPreferredCurrentLensMode];

  unsigned int v7 = +[AXSettings sharedInstance];
  uint64_t v8 = [v7 zoomPreferredCurrentDockPosition];

  id v9 = [v4 specifier];
  long long v10 = [v9 propertyForKey:@"ZoomLensMode"];

  if (v10) {
    objc_msgSend(v4, "setChecked:", objc_msgSend(v6, "isEqualToString:", v10));
  }
  long long v11 = [v4 specifier];
  long long v12 = [v11 propertyForKey:@"ZoomDockPosition"];

  if (v12) {
    objc_msgSend(v4, "setChecked:", objc_msgSend(v8, "isEqualToString:", v12));
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ZoomLensModeDetailController;
  id v7 = a4;
  uint64_t v8 = [(ZoomLensModeDetailController *)&v17 tableView:v6 cellForRowAtIndexPath:v7];
  id v9 = objc_msgSend(v8, "specifier", v17.receiver, v17.super_class);
  long long v10 = [v9 propertyForKey:@"ZoomLensMode"];

  if (v10)
  {
    long long v11 = +[AXSettings sharedInstance];
    [v11 setZoomPreferredCurrentLensMode:v10];

    long long v12 = +[ZoomServices sharedInstance];
    [v12 notifyZoomLensModeWasChangedInSettingsTo:v10];
  }
  long long v13 = [v8 specifier];
  objc_super v14 = [v13 propertyForKey:@"ZoomDockPosition"];

  if (v14)
  {
    v15 = +[AXSettings sharedInstance];
    [v15 setZoomPreferredCurrentDockPosition:v14];

    id v16 = +[ZoomServices sharedInstance];
    [v16 notifyZoomDockPositionWasChangedInSettingsTo:v14];
  }
  [v6 deselectRowAtIndexPath:v7 animated:1];
  [(ZoomLensModeDetailController *)self updateTableCheckedSelection:v7];
}

- (PSSpecifier)dockPositionsGroupSpecifier
{
  return self->_dockPositionsGroupSpecifier;
}

- (void)setDockPositionsGroupSpecifier:(id)a3
{
}

- (NSMutableArray)dockPositionSpecs
{
  return self->_dockPositionSpecs;
}

- (void)setDockPositionSpecs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dockPositionSpecs, 0);

  objc_storeStrong((id *)&self->_dockPositionsGroupSpecifier, 0);
}

@end