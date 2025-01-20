@interface CARInternalSettingsPanel
- (BOOL)_sessionSupportsVehicleData;
- (CARDebugPanel)debugPanel;
- (CARInternalSettingsPanel)initWithPanelController:(id)a3;
- (CARNavigationOverridesPanel)navigationOverridesPanel;
- (NSArray)switches;
- (id)cellSpecifier;
- (id)cellSpecifiers;
- (void)viewDidLoad;
@end

@implementation CARInternalSettingsPanel

- (CARInternalSettingsPanel)initWithPanelController:(id)a3
{
  id v4 = a3;
  v98.receiver = self;
  v98.super_class = (Class)CARInternalSettingsPanel;
  v5 = [(CARSettingsPanel *)&v98 initWithPanelController:v4];
  if (v5)
  {
    v6 = [[CARDebugPanel alloc] initWithPanelController:v4];
    debugPanel = v5->_debugPanel;
    v5->_debugPanel = v6;

    id v86 = v4;
    v8 = [[CARNavigationOverridesPanel alloc] initWithPanelController:v4];
    navigationOverridesPanel = v5->_navigationOverridesPanel;
    v5->_navigationOverridesPanel = v8;

    v10 = [[CARSettingsCellSpecifier alloc] initWithTitle:@"Plug-in Version" image:0 accessoryType:0 actionBlock:&stru_100092330];
    v11 = [(CARSettingsPanel *)v5 panelController];
    v12 = [v11 carSession];
    v13 = [v12 sourceVersion];

    if (v13)
    {
      uint64_t v14 = qword_1000B0858;
      id v15 = v13;
      if (v14 != -1) {
        dispatch_once(&qword_1000B0858, &stru_100092438);
      }
      v16 = (void *)qword_1000B0850;
      v17 = [v15 stringByReplacingOccurrencesOfString:@"." withString:&stru_100094078];
      uint64_t v18 = [v16 objectForKeyedSubscript:v17];
      v19 = (void *)v18;
      v20 = @"Unknown";
      if (v18) {
        v20 = (__CFString *)v18;
      }
      v21 = v20;

      v22 = +[NSString stringWithFormat:@"%@ (%@)", v21, v15];

      [(CARSettingsCellSpecifier *)v10 setDetail:v22 sizeToFit:1 withNumberOfLines:1 lineBreakMode:3];
      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472;
      v96[2] = sub_100017464;
      v96[3] = &unk_100092358;
      id v97 = v22;
      id v23 = v22;
      [(CARSettingsCellSpecifier *)v10 setActionBlock:v96];
    }
    else
    {
      [(CARSettingsCellSpecifier *)v10 setDetail:@"Unknown"];
    }
    if ([(CARInternalSettingsPanel *)v5 _sessionSupportsVehicleData])
    {
      v24 = [[CARSettingsCellSpecifier alloc] initWithTitle:@"Asset ID" image:0 accessoryType:0 actionBlock:&stru_100092378];
      v25 = [(CARSettingsPanel *)v5 panelController];
      v26 = [v25 vehicle];
      v27 = [v26 clusterAssetIdentifier];

      if ([v27 length])
      {
        [(CARSettingsCellSpecifier *)v24 setDetail:v27 sizeToFit:1 withNumberOfLines:1 lineBreakMode:5];
        v94[0] = _NSConcreteStackBlock;
        v94[1] = 3221225472;
        v94[2] = sub_1000174C0;
        v94[3] = &unk_100092358;
        id v95 = v27;
        [(CARSettingsCellSpecifier *)v24 setActionBlock:v94];
      }
      else
      {
        [(CARSettingsCellSpecifier *)v24 setDetail:@"Unknown"];
      }
      v29 = [[CARSettingsCellSpecifier alloc] initWithTitle:@"Asset Version" image:0 accessoryType:0 actionBlock:&stru_100092398];
      v30 = [(CARSettingsPanel *)v5 panelController];
      v31 = [v30 vehicle];
      v32 = [v31 clusterAssetVersion];

      v88 = v29;
      if (v32)
      {
        v33 = [v32 stringValue];
        [(CARSettingsCellSpecifier *)v29 setDetail:v33 sizeToFit:1 withNumberOfLines:1 lineBreakMode:3];

        v92[0] = _NSConcreteStackBlock;
        v92[1] = 3221225472;
        v92[2] = sub_10001751C;
        v92[3] = &unk_100092358;
        id v93 = v32;
        [(CARSettingsCellSpecifier *)v29 setActionBlock:v92];
      }
      else
      {
        [(CARSettingsCellSpecifier *)v29 setDetail:@"Unknown"];
      }
      v34 = [[CARSettingsCellSpecifier alloc] initWithTitle:@"SDK Version" image:0 accessoryType:0 actionBlock:&stru_1000923B8];
      v35 = [(CARSettingsPanel *)v5 panelController];
      v36 = [v35 vehicle];
      v37 = [v36 SDKVersion];

      if ([v37 length])
      {
        [(CARSettingsCellSpecifier *)v34 setDetail:v37 sizeToFit:1 withNumberOfLines:1 lineBreakMode:3];
        [(CARSettingsCellSpecifier *)v34 setDetail:v37];
        v90[0] = _NSConcreteStackBlock;
        v90[1] = 3221225472;
        v90[2] = sub_100017590;
        v90[3] = &unk_100092358;
        id v91 = v37;
        [(CARSettingsCellSpecifier *)v34 setActionBlock:v90];
      }
      else
      {
        [(CARSettingsCellSpecifier *)v34 setDetail:@"Unknown"];
      }
      v87 = v34;

      v28 = v88;
    }
    else
    {
      v87 = 0;
      v28 = 0;
      v24 = 0;
    }
    v84 = v13;
    v38 = [[CARSettingsCellSpecifier alloc] initWithTitle:@"Toggle USB" image:0 accessoryType:0 actionBlock:&stru_1000923D8];
    v103[0] = v38;
    v103[1] = v10;
    v85 = v10;
    uint64_t v39 = +[NSArray arrayWithObjects:v103 count:2];
    switches = v5->_switches;
    v5->_switches = (NSArray *)v39;

    if ([(CARInternalSettingsPanel *)v5 _sessionSupportsVehicleData])
    {
      v41 = v5->_switches;
      v102[0] = v24;
      v102[1] = v28;
      v102[2] = v87;
      v42 = +[NSArray arrayWithObjects:v102 count:3];
      uint64_t v43 = [(NSArray *)v41 arrayByAddingObjectsFromArray:v42];
      v44 = v5->_switches;
      v5->_switches = (NSArray *)v43;
    }
    v89 = v28;
    v83 = v24;
    v79 = v5->_switches;
    v45 = [CARInternalSettingPrototypeSpecifier alloc];
    v82 = +[CARPrototypePref showInternalApps];
    v81 = [(CARInternalSettingPrototypeSpecifier *)v45 initWithInternalSettingPrototype:v82];
    v101[0] = v81;
    v46 = [CARInternalSettingPrototypeSpecifier alloc];
    v80 = +[CARPrototypePref nowPlayingAlbumArt];
    v47 = [(CARInternalSettingPrototypeSpecifier *)v46 initWithInternalSettingPrototype:v80];
    v101[1] = v47;
    v48 = [CARInternalSettingPrototypeSpecifier alloc];
    v49 = +[CARPrototypePref smartWidgetDebugShowScore];
    v50 = [(CARInternalSettingPrototypeSpecifier *)v48 initWithInternalSettingPrototype:v49];
    v101[2] = v50;
    v51 = [CARInternalSettingPrototypeSpecifier alloc];
    v52 = +[CARPrototypePref smartWidgetDebugGestures];
    v53 = [(CARInternalSettingPrototypeSpecifier *)v51 initWithInternalSettingPrototype:v52];
    v101[3] = v53;
    v54 = [CARInternalSettingPrototypeSpecifier alloc];
    v55 = +[CARPrototypePref fakeNeatlineDashboardSupport];
    v56 = [(CARInternalSettingPrototypeSpecifier *)v54 initWithInternalSettingPrototype:v55];
    v101[4] = v56;
    v57 = +[NSArray arrayWithObjects:v101 count:5];
    uint64_t v58 = [(NSArray *)v79 arrayByAddingObjectsFromArray:v57];
    v59 = v5->_switches;
    v5->_switches = (NSArray *)v58;

    if ([(CARInternalSettingsPanel *)v5 _sessionSupportsVehicleData])
    {
      v60 = v5->_switches;
      v61 = [CARInternalSettingPrototypeSpecifier alloc];
      v62 = +[CARPrototypePref showDisclaimerLabel];
      v63 = [(CARInternalSettingPrototypeSpecifier *)v61 initWithInternalSettingPrototype:v62];
      v100[0] = v63;
      v64 = [CARInternalSettingPrototypeSpecifier alloc];
      v65 = +[CARPrototypePref showSerialNumber];
      v66 = [(CARInternalSettingPrototypeSpecifier *)v64 initWithInternalSettingPrototype:v65];
      v100[1] = v66;
      v67 = [[CARSettingsCellSpecifier alloc] initWithTitle:@"Change Dynamic Content" image:0 accessoryType:0 actionBlock:&stru_1000923F8];
      v100[2] = v67;
      v68 = [[CARSettingsCellSpecifier alloc] initWithTitle:@"Change Layout" image:0 accessoryType:0 actionBlock:&stru_100092418];
      v100[3] = v68;
      v69 = +[NSArray arrayWithObjects:v100 count:4];
      uint64_t v70 = [(NSArray *)v60 arrayByAddingObjectsFromArray:v69];
      v71 = v5->_switches;
      v5->_switches = (NSArray *)v70;
    }
    v72 = v5->_switches;
    v73 = [(CARDebugPanel *)v5->_debugPanel cellSpecifier];
    v99[0] = v73;
    v74 = [(CARNavigationOverridesPanel *)v5->_navigationOverridesPanel cellSpecifier];
    v99[1] = v74;
    v75 = +[NSArray arrayWithObjects:v99 count:2];
    uint64_t v76 = [(NSArray *)v72 arrayByAddingObjectsFromArray:v75];
    v77 = v5->_switches;
    v5->_switches = (NSArray *)v76;

    id v4 = v86;
  }

  return v5;
}

- (id)cellSpecifier
{
  cellSpecifier = self->_cellSpecifier;
  if (!cellSpecifier)
  {
    objc_initWeak(&location, self);
    id v4 = [CARSettingsCellSpecifier alloc];
    v5 = sub_1000210C8(@"INTERNAL_SETTINGS");
    v6 = +[CARSettingsImageCache internalImage];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000177F0;
    v10[3] = &unk_100092008;
    objc_copyWeak(&v11, &location);
    v7 = [(CARSettingsCellSpecifier *)v4 initWithTitle:v5 image:v6 accessoryType:1 actionBlock:v10];
    v8 = self->_cellSpecifier;
    self->_cellSpecifier = v7;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    cellSpecifier = self->_cellSpecifier;
  }

  return cellSpecifier;
}

- (id)cellSpecifiers
{
  return [(CARInternalSettingsPanel *)self switches];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)CARInternalSettingsPanel;
  [(CARSettingsTablePanel *)&v2 viewDidLoad];
}

- (BOOL)_sessionSupportsVehicleData
{
  objc_super v2 = [(CARSettingsPanel *)self panelController];
  v3 = [v2 carSession];
  id v4 = [v3 configuration];
  unsigned __int8 v5 = [v4 supportsVehicleData];

  return v5;
}

- (NSArray)switches
{
  return self->_switches;
}

- (CARDebugPanel)debugPanel
{
  return self->_debugPanel;
}

- (CARNavigationOverridesPanel)navigationOverridesPanel
{
  return self->_navigationOverridesPanel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationOverridesPanel, 0);
  objc_storeStrong((id *)&self->_debugPanel, 0);
  objc_storeStrong((id *)&self->_switches, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end