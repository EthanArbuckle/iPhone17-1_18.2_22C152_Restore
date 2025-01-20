@interface ASTConnectedDevicesController
- (ASTConnectedDevicesController)init;
- (AXMouseEventListener)mouseEventListener;
- (AXSSMotionTrackingInputManager)motionTrackingInputManager;
- (CBCentralManager)centralManager;
- (NSArray)connectedBluetoothDevices;
- (NSArray)connectedPeripherals;
- (id)_nameForCustomizableMouse:(id)a3;
- (id)specifiers;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ASTConnectedDevicesController

- (ASTConnectedDevicesController)init
{
  v16.receiver = self;
  v16.super_class = (Class)ASTConnectedDevicesController;
  v2 = [(ASTConnectedDevicesController *)&v16 init];
  if (v2)
  {
    uint64_t v3 = +[AXMouseEventListener sharedInstance];
    mouseEventListener = v2->_mouseEventListener;
    v2->_mouseEventListener = (AXMouseEventListener *)v3;

    [(AXMouseEventListener *)v2->_mouseEventListener addObserver:v2];
    id v5 = objc_alloc_init((Class)AXSSMotionTrackingInputConfiguration);
    if (AXIsInternalInstall())
    {
      v6 = +[AXSettings sharedInstance];
      unsigned int v7 = [v6 assistiveTouchInternalOnlyPearlTrackingEnabled];
    }
    else
    {
      unsigned int v7 = 0;
    }
    v8 = +[NSMutableSet setWithObject:&off_2296A8];
    v9 = v8;
    if (v7) {
      [v8 addObject:&off_2296C0];
    }
    [v5 setAllowedTrackingTypes:v9];
    v10 = (AXSSMotionTrackingInputManager *)[objc_alloc((Class)AXSSMotionTrackingInputManager) initWithConfiguration:v5];
    motionTrackingInputManager = v2->_motionTrackingInputManager;
    v2->_motionTrackingInputManager = v10;

    v12 = (CBCentralManager *)[objc_alloc((Class)CBCentralManager) initWithDelegate:v2 queue:&_dispatch_main_q];
    centralManager = v2->_centralManager;
    v2->_centralManager = v12;

    id v14 = +[BluetoothManager sharedInstance];
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASTConnectedDevicesController;
  [(ASTConnectedDevicesController *)&v6 viewWillAppear:a3];
  v4 = [(ASTConnectedDevicesController *)self motionTrackingInputManager];
  [v4 setDelegate:self];

  id v5 = [(ASTConnectedDevicesController *)self motionTrackingInputManager];
  [v5 startMonitoring];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASTConnectedDevicesController;
  [(ASTConnectedDevicesController *)&v5 viewWillDisappear:a3];
  v4 = [(ASTConnectedDevicesController *)self motionTrackingInputManager];
  [v4 stopMonitoring];
}

- (id)specifiers
{
  uint64_t v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3) {
    goto LABEL_48;
  }
  uint64_t v67 = OBJC_IVAR___PSListController__specifiers;
  v72 = +[NSMutableArray array];
  v4 = +[NSMutableArray array];
  objc_super v5 = [(ASTConnectedDevicesController *)self mouseEventListener];
  objc_super v6 = [v5 discoveredMouseDevices];
  unsigned int v7 = +[NSMutableArray arrayWithArray:v6];

  [v4 axSafelyAddObjectsFromArray:v7];
  v8 = [(ASTConnectedDevicesController *)self centralManager];
  v9 = +[CBUUID UUIDWithString:CBUUIDHumanInterfaceDeviceServiceString];
  v103 = v9;
  v10 = +[NSArray arrayWithObjects:&v103 count:1];
  v11 = [v8 retrieveConnectedPeripheralsWithServices:v10];
  connectedPeripherals = self->_connectedPeripherals;
  self->_connectedPeripherals = v11;

  v13 = +[BluetoothManager sharedInstance];
  id v14 = [v13 connectedDevices];
  connectedBluetoothDevices = self->_connectedBluetoothDevices;
  self->_connectedBluetoothDevices = v14;

  objc_super v16 = [(ASTConnectedDevicesController *)self motionTrackingInputManager];
  [v16 compatibleInputs];
  v18 = v17 = self;
  uint64_t v19 = +[NSMutableArray arrayWithArray:v18];

  v76 = (void *)v19;
  [v4 axSafelyAddObjectsFromArray:v19];
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = __43__ASTConnectedDevicesController_specifiers__block_invoke;
  v93[3] = &unk_20A158;
  v68 = v17;
  v93[4] = v17;
  v20 = [v4 sortedArrayUsingComparator:v93];
  id v69 = [v20 mutableCopy];

  v71 = +[NSMutableArray array];
  v70 = +[NSMutableDictionary dictionary];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obj = v7;
  id v75 = [obj countByEnumeratingWithState:&v89 objects:v102 count:16];
  if (v75)
  {
    uint64_t v73 = *(void *)v90;
    do
    {
      for (i = 0; i != v75; i = (char *)i + 1)
      {
        if (*(void *)v90 != v73) {
          objc_enumerationMutation(obj);
        }
        v79 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v22 = v76;
        id v23 = [v22 countByEnumeratingWithState:&v85 objects:v101 count:16];
        if (!v23)
        {
          id v28 = v22;
          goto LABEL_24;
        }
        id v24 = v23;
        v77 = i;
        uint64_t v25 = *(void *)v86;
LABEL_9:
        uint64_t v26 = 0;
        while (1)
        {
          if (*(void *)v86 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v85 + 1) + 8 * v26);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || ![v27 isHIDDevice]
            || [v27 trackingType] != (char *)&dword_0 + 2)
          {
            goto LABEL_18;
          }
          id v28 = v27;
          id v29 = [v79 vendorId];
          v30 = [v28 vendorID];
          id v31 = [v30 unsignedIntegerValue];

          id v32 = [v79 productId];
          v33 = [v28 productID];
          id v34 = [v33 unsignedIntegerValue];

          if (v29 == v31 && v32 == v34) {
            break;
          }

LABEL_18:
          if (v24 == (id)++v26)
          {
            id v24 = [v22 countByEnumeratingWithState:&v85 objects:v101 count:16];
            if (v24) {
              goto LABEL_9;
            }
            id v28 = v22;
            i = v77;
            goto LABEL_24;
          }
        }

        i = v77;
        if (!v28) {
          continue;
        }
        id v35 = [v22 indexOfObject:v28];
        id v36 = [obj indexOfObject:v79];
        v37 = +[NSNumber numberWithUnsignedInteger:v35];
        v38 = +[NSNumber numberWithUnsignedInteger:v36];
        [v70 setObject:v37 forKey:v38];

        [v71 addObject:v79];
        [v69 removeObject:v28];
LABEL_24:
      }
      id v75 = [obj countByEnumeratingWithState:&v89 objects:v102 count:16];
    }
    while (v75);
  }

  v39 = v68;
  if (![v69 count]) {
    goto LABEL_45;
  }
  v80 = settingsLocString(@"ASTConnectedDevices", @"HandSettings");
  v78 = +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:");
  objc_msgSend(v72, "addObject:");
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v40 = v69;
  id v41 = [v40 countByEnumeratingWithState:&v81 objects:v100 count:16];
  if (!v41) {
    goto LABEL_44;
  }
  id v42 = v41;
  uint64_t v43 = *(void *)v82;
  do
  {
    for (j = 0; j != v42; j = (char *)j + 1)
    {
      if (*(void *)v82 != v43) {
        objc_enumerationMutation(v40);
      }
      v45 = *(void **)(*((void *)&v81 + 1) + 8 * (void)j);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v46 = [(ASTConnectedDevicesController *)v39 _nameForCustomizableMouse:v45];
        v47 = +[PSSpecifier preferenceSpecifierNamed:v46 target:v39 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

        if ([v71 containsObject:v45])
        {
          v48 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [obj indexOfObject:v45]);
          v49 = [v70 objectForKeyedSubscript:v48];
          id v50 = [v49 unsignedIntegerValue];

          if (v50 < [v76 count])
          {
            v51 = [v76 objectAtIndexedSubscript:v50];
            v98[0] = @"AX_CUSTOMIZABLE_MOUSE_KEY";
            v98[1] = @"AX_CUSTOMIZABLE_MOUSE_IS_CONNECTED_KEY";
            v99[0] = v45;
            v99[1] = &__kCFBooleanTrue;
            v99[2] = &__kCFBooleanTrue;
            v98[2] = @"AX_CUSTOMIZABLE_MOUSE_BEHAVES_LIKE_EYETRACKER";
            v98[3] = @"AX_CUSTOMIZABLE_MOUSE_ASSOCIATED_EYETRACKER";
            v99[3] = v51;
            v52 = +[NSDictionary dictionaryWithObjects:v99 forKeys:v98 count:4];
            [v47 setUserInfo:v52];

            goto LABEL_38;
          }
        }
        else
        {
          v96[0] = @"AX_CUSTOMIZABLE_MOUSE_KEY";
          v96[1] = @"AX_CUSTOMIZABLE_MOUSE_IS_CONNECTED_KEY";
          v97[0] = v45;
          v97[1] = &__kCFBooleanTrue;
          v51 = +[NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:2];
          [v47 setUserInfo:v51];
LABEL_38:
        }
        [v72 addObject:v47];

        v39 = v68;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v53 = v45;
        v54 = [v53 name];
        v55 = +[PSSpecifier preferenceSpecifierNamed:v54 target:v39 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

        CFStringRef v94 = @"AX_EYE_TRACKER_KEY";
        id v95 = v53;
        v56 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
        [v55 setUserInfo:v56];

        [v72 addObject:v55];
      }
    }
    id v42 = [v40 countByEnumeratingWithState:&v81 objects:v100 count:16];
  }
  while (v42);
LABEL_44:

LABEL_45:
  v57 = +[PSSpecifier groupSpecifierWithName:0];
  v58 = settingsLocString(@"BluetoothDevicesFooterText", @"HandSettings");
  v59 = +[AXSettings sharedInstance];
  unsigned int v60 = [v59 laserEnabled];

  if (v60)
  {
    uint64_t v61 = settingsLocString(@"BluetoothDevicesFooterText", @"Accessibility-hello");

    v58 = (void *)v61;
  }
  [v57 setProperty:v58 forKey:PSFooterTextGroupKey];
  [v72 addObject:v57];
  v62 = settingsLocString(@"BluetoothDevicesScanning", @"HandSettings");
  [(ASTConnectedDevicesController *)v39 inSetup];
  v63 = +[PSSpecifier preferenceSpecifierNamed:v62 target:v39 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

  [v63 setProperty:@"BluetoothDevicesScanning" forKey:PSIDKey];
  [v72 addObject:v63];
  v64 = *(void **)&v39->AXUISettingsBaseListController_opaque[v67];
  *(void *)&v39->AXUISettingsBaseListController_opaque[v67] = v72;
  id v65 = v72;

  uint64_t v3 = *(void **)&v39->AXUISettingsBaseListController_opaque[v67];
LABEL_48:

  return v3;
}

id __43__ASTConnectedDevicesController_specifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v7 = [*(id *)(a1 + 32) _nameForCustomizableMouse:v5];
  }
  else
  {
    unsigned int v7 = &stru_20F6B8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [*(id *)(a1 + 32) _nameForCustomizableMouse:v6];
  }
  else
  {
    v8 = &stru_20F6B8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v5 name];

    unsigned int v7 = (__CFString *)v9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v6 name];

    v8 = (__CFString *)v10;
  }
  id v11 = [(__CFString *)v7 localizedCaseInsensitiveCompare:v8];

  return v11;
}

- (id)_nameForCustomizableMouse:(id)a3
{
  id v4 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v31 = self;
  id v5 = [(ASTConnectedDevicesController *)self connectedPeripherals];
  id v6 = [v5 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v37;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v11 = [v10 identifier];
        v12 = [v11 UUIDString];
        v13 = [v4 identifier];
        unsigned int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          v15 = [v10 name];
          id v16 = [v15 length];

          if (v16)
          {
            v27 = ASTLogMouse();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v42 = v10;
              __int16 v43 = 2112;
              id v44 = v4;
              _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Using peripheral name (%@) for customizableMouse (%@)", buf, 0x16u);
            }

            id v28 = v10;
LABEL_27:
            uint64_t v26 = [v28 name];

            goto LABEL_28;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v36 objects:v45 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = [(ASTConnectedDevicesController *)v31 connectedBluetoothDevices];
  id v17 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v33;
    while (2)
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v5);
        }
        v21 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
        unsigned int v22 = [v21 vendorId];
        if ([v4 vendorId] == (id)v22)
        {
          unsigned int v23 = [v21 productId];
          if ([v4 productId] == (id)v23)
          {
            id v24 = [v21 name];
            id v25 = [v24 length];

            if (v25)
            {
              id v29 = ASTLogMouse();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v42 = v21;
                __int16 v43 = 2112;
                id v44 = v4;
                _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Using device name (%@) for customizableMouse (%@)", buf, 0x16u);
              }

              id v28 = v21;
              goto LABEL_27;
            }
          }
        }
      }
      id v18 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }

  uint64_t v26 = [v4 name];
LABEL_28:

  return v26;
}

- (void)centralManagerDidUpdateState:(id)a3
{
  if ([a3 state] == (char *)&dword_4 + 1)
  {
    [(ASTConnectedDevicesController *)self reloadSpecifiers];
  }
}

- (AXMouseEventListener)mouseEventListener
{
  return self->_mouseEventListener;
}

- (AXSSMotionTrackingInputManager)motionTrackingInputManager
{
  return self->_motionTrackingInputManager;
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (NSArray)connectedBluetoothDevices
{
  return self->_connectedBluetoothDevices;
}

- (NSArray)connectedPeripherals
{
  return self->_connectedPeripherals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedPeripherals, 0);
  objc_storeStrong((id *)&self->_connectedBluetoothDevices, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_motionTrackingInputManager, 0);

  objc_storeStrong((id *)&self->_mouseEventListener, 0);
}

@end