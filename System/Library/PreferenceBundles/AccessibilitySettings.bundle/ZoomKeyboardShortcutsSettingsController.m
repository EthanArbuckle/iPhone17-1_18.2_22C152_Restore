@interface ZoomKeyboardShortcutsSettingsController
- (NSMutableArray)kbScrollWheelSpecs;
- (NSMutableArray)kbShortcutSpecs;
- (NSMutableArray)panSpecs;
- (NSMutableArray)resizeSpecs;
- (ZoomKeyboardShortcutsSettingsController)init;
- (id)adjustZoomLevelShortcutEnabled;
- (id)panZoomShortcutEnabled;
- (id)resizeZoomWindowShortcutEnabled;
- (id)scrollWheelShortcutEnabled;
- (id)specifiers;
- (id)switchZoomModeShortcutEnabled;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tempToggleZoomShortcutEnabled;
- (id)toggleZoomShortcutEnabled;
- (id)zoomKeyboardShortcutsEnabled;
- (void)dealloc;
- (void)deviceMonitorDidDetectDeviceEvent:(id)a3;
- (void)insertOrRemoveKbShortcutsSpecs;
- (void)insertOrRemoveWindowModeSpecs;
- (void)setAdjustZoomLevelShortcutEnabled:(id)a3 specifier:(id)a4;
- (void)setKbScrollWheelSpecs:(id)a3;
- (void)setKbShortcutSpecs:(id)a3;
- (void)setPanSpecs:(id)a3;
- (void)setPanZoomShortcutEnabled:(id)a3 specifier:(id)a4;
- (void)setResizeSpecs:(id)a3;
- (void)setResizeZoomWindowShortcutEnabled:(id)a3 specifier:(id)a4;
- (void)setScrollWheelShortcutEnabled:(id)a3 specifier:(id)a4;
- (void)setSwitchZoomModeShortcutEnabled:(id)a3 specifier:(id)a4;
- (void)setTempToggleZoomShortcutEnabled:(id)a3 specifier:(id)a4;
- (void)setToggleZoomShortcutEnabled:(id)a3 specifier:(id)a4;
- (void)setZoomKeyboardShortcutsEnabled:(id)a3 specifier:(id)a4;
@end

@implementation ZoomKeyboardShortcutsSettingsController

- (ZoomKeyboardShortcutsSettingsController)init
{
  v12.receiver = self;
  v12.super_class = (Class)ZoomKeyboardShortcutsSettingsController;
  v2 = [(ZoomKeyboardShortcutsSettingsController *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)AXDeviceMonitor);
    v4 = +[NSRunLoop mainRunLoop];
    v5 = (AXDeviceMonitor *)[v3 initWithMatchingDictionary:&off_22C530 callbackRunLoop:v4];
    deviceMonitor = v2->_deviceMonitor;
    v2->_deviceMonitor = v5;

    [(AXDeviceMonitor *)v2->_deviceMonitor setDelegate:v2];
    [(AXDeviceMonitor *)v2->_deviceMonitor begin];
    objc_initWeak(&location, v2);
    v7 = +[AXSettings sharedInstance];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __47__ZoomKeyboardShortcutsSettingsController_init__block_invoke;
    v9[3] = &unk_208798;
    objc_copyWeak(&v10, &location);
    [v7 registerUpdateBlock:v9 forRetrieveSelector:"zoomPreferredCurrentLensMode" withListener:v2];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __47__ZoomKeyboardShortcutsSettingsController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained insertOrRemoveWindowModeSpecs];
}

- (void)dealloc
{
  [(AXDeviceMonitor *)self->_deviceMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ZoomKeyboardShortcutsSettingsController;
  [(ZoomKeyboardShortcutsSettingsController *)&v3 dealloc];
}

- (id)specifiers
{
  objc_super v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3) {
    goto LABEL_45;
  }
  uint64_t v57 = OBJC_IVAR___PSListController__specifiers;
  v58 = self;
  v4 = -[ZoomKeyboardShortcutsSettingsController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", @"ZoomKeyboardShortcutsSettings");
  id v5 = [v4 mutableCopy];

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v65 objects:v72 count:16];
  id obj = v6;
  if (!v7)
  {
    v62 = 0;
    v63 = 0;
    v60 = 0;
    v61 = 0;
    v59 = 0;
    v9 = 0;
    id v10 = 0;
    goto LABEL_28;
  }
  id v8 = v7;
  v62 = 0;
  v63 = 0;
  v60 = 0;
  v61 = 0;
  v59 = 0;
  v9 = 0;
  id v10 = 0;
  uint64_t v11 = *(void *)v66;
  uint64_t v12 = PSIDKey;
  do
  {
    v13 = 0;
    do
    {
      if (*(void *)v66 != v11) {
        objc_enumerationMutation(obj);
      }
      v14 = *(void **)(*((void *)&v65 + 1) + 8 * (void)v13);
      v15 = [v14 propertyForKey:v12];
      unsigned __int8 v16 = [v15 isEqualToString:@"ZoomKeyboardShortcutScrollWheel"];

      if (v16)
      {
        v17 = v10;
        v18 = v9;
        id v10 = v14;
LABEL_20:
        id v29 = v14;

        v9 = v18;
        goto LABEL_21;
      }
      v19 = [v14 propertyForKey:v12];
      unsigned __int8 v20 = [v19 isEqualToString:@"ZoomKeyboardShortcutScrollWheelGroup"];

      if (v20)
      {
        v17 = v63;
        v63 = v14;
LABEL_19:
        v18 = v9;
        goto LABEL_20;
      }
      v21 = [v14 propertyForKey:v12];
      unsigned __int8 v22 = [v21 isEqualToString:@"ZoomEnableKeyboardShortcuts"];

      if (v22)
      {
        v17 = v62;
        v62 = v14;
        goto LABEL_19;
      }
      v23 = [v14 propertyForKey:v12];
      unsigned __int8 v24 = [v23 isEqualToString:@"ZoomKeyboardShortcutResizeZoomWindow"];

      if (v24)
      {
        v17 = v61;
        v61 = v14;
        goto LABEL_19;
      }
      v25 = [v14 propertyForKey:v12];
      unsigned __int8 v26 = [v25 isEqualToString:@"ZoomKeyboardShortcutResizeZoomWindowGroup"];

      if (v26)
      {
        v17 = v60;
        v60 = v14;
        goto LABEL_19;
      }
      v27 = [v14 propertyForKey:v12];
      unsigned __int8 v28 = [v27 isEqualToString:@"ZoomKeyboardShortcutPanZoom"];

      if (v28)
      {
        v17 = v59;
        v59 = v14;
        goto LABEL_19;
      }
      v30 = [v14 propertyForKey:v12];
      unsigned int v31 = [v30 isEqualToString:@"ZoomKeyboardShortcutPanZoomGroup"];

      v17 = v9;
      v18 = v14;
      if (v31) {
        goto LABEL_20;
      }
LABEL_21:
      v13 = (char *)v13 + 1;
    }
    while (v8 != v13);
    id v6 = obj;
    id v32 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
    id v8 = v32;
  }
  while (v32);
LABEL_28:

  v33 = +[NSMutableArray array];
  [(ZoomKeyboardShortcutsSettingsController *)v58 setKbScrollWheelSpecs:v33];

  if (v10 && v63)
  {
    v34 = [(ZoomKeyboardShortcutsSettingsController *)v58 kbScrollWheelSpecs];
    v71[0] = v63;
    v71[1] = v10;
    v35 = +[NSArray arrayWithObjects:v71 count:2];
    [v34 addObjectsFromArray:v35];
  }
  id v36 = [(AXDeviceMonitor *)v58->_deviceMonitor copyDevices];
  id v37 = [v36 count];

  if (!v37)
  {
    v38 = [(ZoomKeyboardShortcutsSettingsController *)v58 kbScrollWheelSpecs];
    [obj removeObjectsInArray:v38];
  }
  v39 = +[NSMutableArray array];
  [(ZoomKeyboardShortcutsSettingsController *)v58 setResizeSpecs:v39];

  if (v61 && v60)
  {
    v40 = [(ZoomKeyboardShortcutsSettingsController *)v58 resizeSpecs];
    v70[0] = v60;
    v70[1] = v61;
    v41 = +[NSArray arrayWithObjects:v70 count:2];
    [v40 addObjectsFromArray:v41];
  }
  v42 = +[NSMutableArray array];
  [(ZoomKeyboardShortcutsSettingsController *)v58 setPanSpecs:v42];

  if (v59 && v9)
  {
    v43 = [(ZoomKeyboardShortcutsSettingsController *)v58 panSpecs];
    v69[0] = v9;
    v69[1] = v59;
    v44 = +[NSArray arrayWithObjects:v69 count:2];
    [v43 addObjectsFromArray:v44];
  }
  v45 = +[AXSettings sharedInstance];
  v46 = [v45 zoomPreferredCurrentLensMode];
  unsigned int v47 = [v46 isEqualToString:AXZoomLensModeFullscreen];

  if (v47)
  {
    v48 = [(ZoomKeyboardShortcutsSettingsController *)v58 resizeSpecs];
    [obj removeObjectsInArray:v48];
  }
  id v49 = [obj mutableCopy];
  [(ZoomKeyboardShortcutsSettingsController *)v58 setKbShortcutSpecs:v49];

  if (v62)
  {
    v50 = [(ZoomKeyboardShortcutsSettingsController *)v58 kbShortcutSpecs];
    [v50 removeObject:v62];

    v51 = +[AXSettings sharedInstance];
    unsigned __int8 v52 = [v51 zoomKeyboardShortcutsEnabled];

    if ((v52 & 1) == 0)
    {
      v53 = [(ZoomKeyboardShortcutsSettingsController *)v58 kbShortcutSpecs];
      [obj removeObjectsInArray:v53];
    }
  }
  v54 = *(void **)&v58->AXUISettingsBaseListController_opaque[v57];
  *(void *)&v58->AXUISettingsBaseListController_opaque[v57] = obj;
  id v55 = obj;

  objc_super v3 = *(void **)&v58->AXUISettingsBaseListController_opaque[v57];
LABEL_45:

  return v3;
}

- (void)insertOrRemoveKbShortcutsSpecs
{
  objc_super v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 zoomKeyboardShortcutsEnabled];

  id v5 = [(ZoomKeyboardShortcutsSettingsController *)self kbShortcutSpecs];
  if (v4) {
    [(ZoomKeyboardShortcutsSettingsController *)self insertContiguousSpecifiers:v5 afterSpecifierID:@"ZoomEnableKeyboardShortcuts" animated:1];
  }
  else {
    [(ZoomKeyboardShortcutsSettingsController *)self removeContiguousSpecifiers:v5 animated:1];
  }

  [(ZoomKeyboardShortcutsSettingsController *)self prepareSpecifiersMetadata];
}

- (void)deviceMonitorDidDetectDeviceEvent:(id)a3
{
  unsigned int v4 = [(ZoomKeyboardShortcutsSettingsController *)self kbScrollWheelSpecs];

  if (!v4) {
    return;
  }
  id v5 = [(AXDeviceMonitor *)self->_deviceMonitor copyDevices];
  id v6 = [v5 count];

  id v7 = [(ZoomKeyboardShortcutsSettingsController *)self kbShortcutSpecs];
  id v8 = [(ZoomKeyboardShortcutsSettingsController *)self kbScrollWheelSpecs];
  v9 = v8;
  if (!v6)
  {
    [v7 removeObjectsInArray:v8];

    id v18 = [(ZoomKeyboardShortcutsSettingsController *)self kbScrollWheelSpecs];
    [(ZoomKeyboardShortcutsSettingsController *)self removeContiguousSpecifiers:v18 animated:1];
    goto LABEL_11;
  }
  id v10 = [v8 objectAtIndex:0];
  unsigned __int8 v11 = [v7 containsObject:v10];

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = [(ZoomKeyboardShortcutsSettingsController *)self kbShortcutSpecs];
    v13 = [(ZoomKeyboardShortcutsSettingsController *)self kbScrollWheelSpecs];
    [v12 addObjectsFromArray:v13];
  }
  id v18 = [(ZoomKeyboardShortcutsSettingsController *)self specifierForID:@"ZoomKeyboardShortcutTempToggleZoom"];
  v14 = +[AXSettings sharedInstance];
  if (![v14 zoomKeyboardShortcutsEnabled]) {
    goto LABEL_8;
  }
  v15 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  unsigned __int8 v16 = [(ZoomKeyboardShortcutsSettingsController *)self kbScrollWheelSpecs];
  v17 = [v16 objectAtIndex:0];
  LOBYTE(v15) = [v15 containsObject:v17];

  if ((v15 & 1) == 0)
  {
    v14 = [(ZoomKeyboardShortcutsSettingsController *)self kbScrollWheelSpecs];
    [(ZoomKeyboardShortcutsSettingsController *)self insertContiguousSpecifiers:v14 afterSpecifier:v18 animated:1];
LABEL_8:
  }
LABEL_11:
}

- (void)insertOrRemoveWindowModeSpecs
{
  objc_super v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 zoomPreferredCurrentLensMode];
  if ([v4 isEqualToString:AXZoomLensModeFullscreen])
  {
  }
  else
  {
    id v5 = [(ZoomKeyboardShortcutsSettingsController *)self specifiers];
    id v6 = [(ZoomKeyboardShortcutsSettingsController *)self specifierForID:@"ZoomKeyboardShortcutResizeZoomWindow"];
    unsigned __int8 v7 = [v5 containsObject:v6];

    if ((v7 & 1) == 0)
    {
      id v12 = [(ZoomKeyboardShortcutsSettingsController *)self resizeSpecs];
      id v8 = [(ZoomKeyboardShortcutsSettingsController *)self specifierForID:@"ZoomKeyboardShortcutPanZoom"];
      [(ZoomKeyboardShortcutsSettingsController *)self insertContiguousSpecifiers:v12 afterSpecifier:v8 animated:1];
      goto LABEL_8;
    }
  }
  id v12 = +[AXSettings sharedInstance];
  id v8 = [v12 zoomPreferredCurrentLensMode];
  if (([v8 isEqualToString:AXZoomLensModeFullscreen] & 1) == 0)
  {
LABEL_8:

    goto LABEL_9;
  }
  v9 = [(ZoomKeyboardShortcutsSettingsController *)self specifiers];
  id v10 = [(ZoomKeyboardShortcutsSettingsController *)self specifierForID:@"ZoomKeyboardShortcutResizeZoomWindow"];
  unsigned int v11 = [v9 containsObject:v10];

  if (!v11) {
    return;
  }
  id v12 = [(ZoomKeyboardShortcutsSettingsController *)self resizeSpecs];
  [(ZoomKeyboardShortcutsSettingsController *)self removeContiguousSpecifiers:v12 animated:1];
LABEL_9:
}

- (void)setZoomKeyboardShortcutsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];
  id v6 = +[AXSettings sharedInstance];
  [v6 setZoomKeyboardShortcutsEnabled:v5];

  [(ZoomKeyboardShortcutsSettingsController *)self insertOrRemoveKbShortcutsSpecs];
}

- (id)zoomKeyboardShortcutsEnabled
{
  v2 = +[AXSettings sharedInstance];
  objc_super v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 zoomKeyboardShortcutsEnabled]);

  return v3;
}

- (void)setAdjustZoomLevelShortcutEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setZoomAdjustZoomLevelKbShortcutEnabled:v4];
}

- (id)adjustZoomLevelShortcutEnabled
{
  v2 = +[AXSettings sharedInstance];
  objc_super v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 zoomAdjustZoomLevelKbShortcutEnabled]);

  return v3;
}

- (void)setToggleZoomShortcutEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setZoomToggleZoomKbShortcutEnabled:v4];
}

- (id)toggleZoomShortcutEnabled
{
  v2 = +[AXSettings sharedInstance];
  objc_super v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 zoomToggleZoomKbShortcutEnabled]);

  return v3;
}

- (void)setPanZoomShortcutEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setZoomPanZoomKbShortcutEnabled:v4];
}

- (id)panZoomShortcutEnabled
{
  v2 = +[AXSettings sharedInstance];
  objc_super v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 zoomPanZoomKbShortcutEnabled]);

  return v3;
}

- (void)setResizeZoomWindowShortcutEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setZoomResizeZoomWindowKbShortcutEnabled:v4];
}

- (id)resizeZoomWindowShortcutEnabled
{
  v2 = +[AXSettings sharedInstance];
  objc_super v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 zoomResizeZoomWindowKbShortcutEnabled]);

  return v3;
}

- (void)setSwitchZoomModeShortcutEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setZoomSwitchZoomModeKbShortcutEnabled:v4];
}

- (id)switchZoomModeShortcutEnabled
{
  v2 = +[AXSettings sharedInstance];
  objc_super v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 zoomSwitchZoomModeKbShortcutEnabled]);

  return v3;
}

- (void)setTempToggleZoomShortcutEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setZoomTempToggleZoomKbShortcutEnabled:v4];
}

- (id)tempToggleZoomShortcutEnabled
{
  v2 = +[AXSettings sharedInstance];
  objc_super v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 zoomTempToggleZoomKbShortcutEnabled]);

  return v3;
}

- (void)setScrollWheelShortcutEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setZoomScrollWheelKbShortcutEnabled:v4];
}

- (id)scrollWheelShortcutEnabled
{
  v2 = +[AXSettings sharedInstance];
  objc_super v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 zoomScrollWheelKbShortcutEnabled]);

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ZoomKeyboardShortcutsSettingsController;
  id v4 = [(ZoomKeyboardShortcutsSettingsController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  id v5 = [v4 textLabel];
  [v5 setNumberOfLines:0];

  return v4;
}

- (NSMutableArray)kbShortcutSpecs
{
  return self->_kbShortcutSpecs;
}

- (void)setKbShortcutSpecs:(id)a3
{
}

- (NSMutableArray)kbScrollWheelSpecs
{
  return self->_kbScrollWheelSpecs;
}

- (void)setKbScrollWheelSpecs:(id)a3
{
}

- (NSMutableArray)resizeSpecs
{
  return self->_resizeSpecs;
}

- (void)setResizeSpecs:(id)a3
{
}

- (NSMutableArray)panSpecs
{
  return self->_panSpecs;
}

- (void)setPanSpecs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panSpecs, 0);
  objc_storeStrong((id *)&self->_resizeSpecs, 0);
  objc_storeStrong((id *)&self->_kbScrollWheelSpecs, 0);
  objc_storeStrong((id *)&self->_kbShortcutSpecs, 0);

  objc_storeStrong((id *)&self->_deviceMonitor, 0);
}

@end