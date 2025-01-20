@interface AccessoryControlListItemsController
- (AccessoryControlListItemsController)init;
- (BOOL)allowOffListeningMode;
- (id)device;
- (id)listeningModeCombinations;
- (id)specifiers;
- (void)dealloc;
- (void)listItemSelected:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AccessoryControlListItemsController

- (AccessoryControlListItemsController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AccessoryControlListItemsController;
  v2 = [(AccessoryControlListItemsController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *((unsigned char *)&v2->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F00]) = 0;
    v2->_autoANCSupported = 0;
    v2->_listeningModeConfigs = 0;
    currentSelectedSpecifier = v2->_currentSelectedSpecifier;
    v2->_currentSelectedSpecifier = (NSString *)@"Left";
  }
  return v3;
}

- (id)device
{
  return self->_currentDevice;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AccessoryControlListItemsController;
  [(PSListItemsController *)&v2 dealloc];
}

- (id)listeningModeCombinations
{
  p_listeningModeConfigs = &self->_listeningModeConfigs;
  if (self->_listeningModeConfigs.anc)
  {
    if (self->_listeningModeConfigs.transparency)
    {
      if (p_listeningModeConfigs->normal)
      {
        if (self->_listeningModeConfigs.autoANC) {
          return @"NC&Off&T&Auto";
        }
        else {
          return @"NC&Off&T";
        }
      }
      if (self->_listeningModeConfigs.autoANC)
      {
        if (p_listeningModeConfigs->normal) {
          return @"NC&Off&Auto";
        }
        else {
          return @"NC&T&Auto";
        }
      }
    }
    else if (self->_listeningModeConfigs.autoANC)
    {
      if (p_listeningModeConfigs->normal) {
        return @"NC&Off&Auto";
      }
      BOOL v4 = 1;
      goto LABEL_19;
    }
  }
  BOOL v4 = !p_listeningModeConfigs->normal;
  if (p_listeningModeConfigs->normal && self->_listeningModeConfigs.transparency && self->_listeningModeConfigs.autoANC) {
    return @"Off&T&Auto";
  }
  if (self->_listeningModeConfigs.anc)
  {
LABEL_19:
    if (self->_listeningModeConfigs.transparency) {
      return @"NC&T";
    }
    if (self->_listeningModeConfigs.autoANC) {
      return @"NC&Auto";
    }
  }
  if (!v4 && self->_listeningModeConfigs.autoANC) {
    return @"Off&Auto";
  }
  if (self->_listeningModeConfigs.transparency)
  {
    if (self->_listeningModeConfigs.autoANC) {
      return @"T&Auto";
    }
  }
  else if (self->_listeningModeConfigs.anc)
  {
    return @"NC&Off";
  }
  return @"Off&T";
}

- (id)specifiers
{
  v112[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v111.receiver = self;
  v111.super_class = (Class)AccessoryControlListItemsController;
  BOOL v4 = [(PSListItemsController *)&v111 specifiers];
  v5 = [v3 arrayWithArray:v4];

  uint64_t v6 = (int)*MEMORY[0x1E4F92FA0];
  v7 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v6) userInfo];
  v8 = +[HPSDevice deviceKey];
  v9 = [v7 objectForKeyedSubscript:v8];
  currentDevice = self->_currentDevice;
  self->_currentDevice = v9;

  self->_BOOL autoANCSupported = [(BluetoothDeviceProtocol *)self->_currentDevice getAutoANCSupport];
  int v11 = [(BluetoothDeviceProtocol *)self->_currentDevice productId];
  int v110 = 0;
  int v109 = 0;
  v108 = v5;
  if (v11 != 8230)
  {
    int v12 = v11;
    v13 = &v110;
    [(BluetoothDeviceProtocol *)self->_currentDevice clickHoldMode:&v110 rightAction:&v109];
    v14 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v6) identifier];
    char v15 = [v14 isEqualToString:@"LEFT_ID"];

    unint64_t v16 = 0x1E4F1C000;
    if ((v15 & 1) == 0)
    {
      v17 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v6) identifier];
      int v18 = [v17 isEqualToString:@"RIGHT_ID"];

      if (!v18) {
        goto LABEL_38;
      }
      v13 = &v109;
    }
    if (*v13 == 5
      && (!+[HPSProductUtils isBeatsNonWx:self->_currentDevice]
       || ![(BluetoothDeviceProtocol *)self->_currentDevice featureCapability:30]
       || [(BluetoothDeviceProtocol *)self->_currentDevice getAACPCapabilityBit:12]))
    {
      char v19 = [(BluetoothDeviceProtocol *)self->_currentDevice listeningModeConfigs];
      self->_listeningModeConfigs.anc = (v19 & 2) != 0;
      self->_listeningModeConfigs.transparency = (v19 & 4) != 0;
      self->_listeningModeConfigs.normal = v19 & 1;
      self->_listeningModeConfigs.autoANC = (v19 & 8) != 0;
      BOOL autoANCSupported = self->_autoANCSupported;
      v21 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v6) identifier];
      int v22 = [v21 isEqualToString:@"LEFT_ID"];

      if (autoANCSupported)
      {
        if (v22)
        {
          currentSelectedSpecifier = self->_currentSelectedSpecifier;
          self->_currentSelectedSpecifier = (NSString *)@"Left";

          v24 = [(AccessoryControlListItemsController *)self listeningModeCombinations];
          v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v24, @"cycleBetweenV2LeftBudValue", 0);
          v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
          v27 = v26;
          v28 = @"CycleBetweenV2LeftBudValue";
        }
        else
        {
          v30 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v6) identifier];
          int v31 = [v30 isEqualToString:@"RIGHT_ID"];

          if (!v31) {
            goto LABEL_19;
          }
          v32 = self->_currentSelectedSpecifier;
          self->_currentSelectedSpecifier = (NSString *)@"Right";

          v24 = [(AccessoryControlListItemsController *)self listeningModeCombinations];
          v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v24, @"cycleBetweenV2RightBudValue", 0);
          v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
          v27 = v26;
          v28 = @"CycleBetweenV2RightBudValue";
        }
      }
      else if (v22)
      {
        v29 = self->_currentSelectedSpecifier;
        self->_currentSelectedSpecifier = (NSString *)@"Left";

        v24 = [(AccessoryControlListItemsController *)self listeningModeCombinations];
        v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v24, @"cycleBetweenLeftBudValue", 0);
        v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v27 = v26;
        v28 = @"CycleBetweenLeftBudValue";
      }
      else
      {
        v33 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v6) identifier];
        int v34 = [v33 isEqualToString:@"RIGHT_ID"];

        if (!v34) {
          goto LABEL_19;
        }
        v35 = self->_currentSelectedSpecifier;
        self->_currentSelectedSpecifier = (NSString *)@"Right";

        v24 = [(AccessoryControlListItemsController *)self listeningModeCombinations];
        v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v24, @"cycleBetweenRightBudValue", 0);
        v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v27 = v26;
        v28 = @"CycleBetweenRightBudValue";
      }
      [v26 postNotificationName:v28 object:0 userInfo:v25];

LABEL_19:
      v36 = (void *)MEMORY[0x1E4F92E70];
      v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v38 = [v37 localizedStringForKey:@"NOISE_CONTROL_HEADER" value:&stru_1F4097960 table:@"DeviceConfig"];
      v39 = [v36 preferenceSpecifierNamed:v38 target:self set:0 get:0 detail:0 cell:0 edit:0];

      v40 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v41 = [v40 localizedStringForKey:@"NOISE_CONTROL_FOOTER" value:&stru_1F4097960 table:@"DeviceConfig"];

      if (v12 > 8213)
      {
        if (v12 == 8214)
        {
          v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v43 = v42;
          v44 = @"DeviceConfig-B607";
          goto LABEL_28;
        }
        if (v12 == 8221)
        {
          v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v43 = v42;
          v44 = @"DeviceConfig-B498-v2";
          goto LABEL_28;
        }
      }
      else
      {
        if (v12 == 8209)
        {
          v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v43 = v42;
          v44 = @"DeviceConfig-B507";
          goto LABEL_28;
        }
        if (v12 == 8210)
        {
          v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v43 = v42;
          v44 = @"DeviceConfig-B494";
LABEL_28:
          uint64_t v45 = [v42 localizedStringForKey:@"NOISE_CONTROL_FOOTER" value:&stru_1F4097960 table:v44];
          unint64_t v46 = 0x1E4F92000;

          v41 = (void *)v45;
LABEL_30:
          v101 = v41;
          [v39 setProperty:v41 forKey:*MEMORY[0x1E4F93170]];
          v102 = v39;
          [v5 addObject:v39];
          v107 = [MEMORY[0x1E4FB1830] configurationWithPointSize:25.0];
          v47 = *(void **)(v46 + 3696);
          v48 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v49 = [v48 localizedStringForKey:@"ACTIVE_NOISE_CANCELLATION" value:&stru_1F4097960 table:@"DeviceConfig"];
          v50 = [v47 preferenceSpecifierNamed:v49 target:0 set:0 get:0 detail:0 cell:3 edit:0];

          uint64_t v105 = *MEMORY[0x1E4F93188];
          objc_msgSend(v50, "setProperty:forKey:", @"ANC");
          v51 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v52 = [v51 localizedStringForKey:@"ACTIVE_NOISE_CANCELLATION_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig"];
          uint64_t v104 = *MEMORY[0x1E4F93230];
          objc_msgSend(v50, "setProperty:forKey:", v52);

          v53 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"person.closed.fill"];
          v54 = [v53 imageByApplyingSymbolConfiguration:v107];

          v55 = [MEMORY[0x1E4FB1618] systemBlueColor];
          v99 = v54;
          v56 = [v54 imageWithTintColor:v55];
          uint64_t v106 = *MEMORY[0x1E4F93190];
          objc_msgSend(v50, "setProperty:forKey:", v56);

          uint64_t v57 = objc_opt_class();
          uint64_t v58 = *MEMORY[0x1E4F930A8];
          v100 = v50;
          uint64_t v103 = *MEMORY[0x1E4F930A8];
          [v50 setProperty:v57 forKey:*MEMORY[0x1E4F930A8]];
          v59 = *(void **)(v46 + 3696);
          v60 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v61 = [v60 localizedStringForKey:@"ACTIVE_PASS_THROUGH" value:&stru_1F4097960 table:@"DeviceConfig"];
          v62 = [v59 preferenceSpecifierNamed:v61 target:0 set:0 get:0 detail:0 cell:3 edit:0];

          [v62 setProperty:@"Passthrough" forKey:v105];
          v63 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v64 = [v63 localizedStringForKey:@"ACTIVE_PASS_THROUGH_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig"];
          [v62 setProperty:v64 forKey:v104];

          v65 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"person.open.fill"];
          uint64_t v66 = [v65 imageByApplyingSymbolConfiguration:v107];

          v97 = (void *)v66;
          [v62 setProperty:v66 forKey:v106];
          v98 = v62;
          [v62 setProperty:objc_opt_class() forKey:v58];
          v67 = (void *)MEMORY[0x1E4F92E70];
          v68 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v69 = [v68 localizedStringForKey:@"BYPASS" value:&stru_1F4097960 table:@"DeviceConfig"];
          v70 = [v67 preferenceSpecifierNamed:v69 target:0 set:0 get:0 detail:0 cell:3 edit:0];

          [v70 setProperty:@"Off" forKey:v105];
          v71 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v72 = [v71 localizedStringForKey:@"BYPASS_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig"];
          [v70 setProperty:v72 forKey:v104];

          v73 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"person.closed.fill"];
          v74 = (void *)MEMORY[0x1E4FB1830];
          v75 = [MEMORY[0x1E4FB1618] systemBlueColor];
          v76 = [v75 colorWithAlphaComponent:0.5];
          v112[0] = v76;
          v77 = [MEMORY[0x1E4FB1618] systemBlueColor];
          v112[1] = v77;
          v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:2];
          v79 = [v74 configurationWithPaletteColors:v78];
          v80 = [v73 imageByApplyingSymbolConfiguration:v79];
          v81 = [v80 imageByApplyingSymbolConfiguration:v107];

          [v70 setProperty:v81 forKey:v106];
          [v70 setProperty:objc_opt_class() forKey:v103];
          if (self->_autoANCSupported)
          {
            v82 = (void *)MEMORY[0x1E4F92E70];
            v83 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v84 = [v83 localizedStringForKey:@"AUTO_ANC" value:&stru_1F4097960 table:@"DeviceConfig-B698"];
            v85 = [v82 preferenceSpecifierNamed:v84 target:0 set:0 get:0 detail:0 cell:3 edit:0];

            [v85 setProperty:@"AutoANC" forKey:v105];
            v86 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v87 = [v86 localizedStringForKey:@"AUTO_ANC_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig-B698"];
            [v85 setProperty:v87 forKey:v104];

            v88 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"person.and.sparkles.fill"];
            v89 = [v88 imageByApplyingSymbolConfiguration:v107];

            v90 = [MEMORY[0x1E4FB1618] systemBlueColor];
            v91 = [v89 imageWithTintColor:v90];
            [v85 setProperty:v91 forKey:v106];

            [v85 setProperty:objc_opt_class() forKey:v103];
          }
          else
          {
            v85 = 0;
          }
          if ([(AccessoryControlListItemsController *)self allowOffListeningMode]) {
            [v108 addObject:v70];
          }
          [v108 addObject:v98];
          if (self->_autoANCSupported) {
            [v108 addObject:v85];
          }
          [v108 addObject:v100];

          unint64_t v16 = 0x1E4F1C000uLL;
          goto LABEL_38;
        }
      }
      unint64_t v46 = 0x1E4F92000uLL;
      goto LABEL_30;
    }
LABEL_38:
    v92 = [*(id *)(v16 + 2424) arrayWithArray:v108];
    uint64_t v93 = (int)*MEMORY[0x1E4F92F08];
    v94 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v93);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v93) = v92;

    v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v93);
  }
  id v95 = v5;

  return v95;
}

- (void)listItemSelected:(id)a3
{
  id v4 = a3;
  if (![v4 section])
  {
    v40.receiver = self;
    v40.super_class = (Class)AccessoryControlListItemsController;
    [(PSListItemsController *)&v40 listItemSelected:v4];
    [(AccessoryControlListItemsController *)self reloadSpecifiers];
    goto LABEL_47;
  }
  v5 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F10]) cellForRowAtIndexPath:v4];
  uint64_t v6 = [(AccessoryControlListItemsController *)self specifierAtIndexPath:v4];
  v7 = v6;
  p_listeningModeConfigs = &self->_listeningModeConfigs;
  p_anc = ($9FDB394E5CA5750B7644BE339E11A47B *)&self->_listeningModeConfigs.anc;
  int v10 = self->_listeningModeConfigs.transparency + self->_listeningModeConfigs.anc + self->_listeningModeConfigs.normal;
  if (self->_autoANCSupported) {
    v10 += self->_listeningModeConfigs.autoANC;
  }
  if (v10 == 2)
  {
    int v11 = [v6 identifier];
    if ([v11 isEqualToString:@"ANC"] && p_anc->normal) {
      goto LABEL_10;
    }
    int v12 = [v7 identifier];
    if ([v12 isEqualToString:@"Passthrough"]
      && self->_listeningModeConfigs.transparency)
    {

LABEL_10:
      goto LABEL_14;
    }
    v39 = v5;
    v13 = [v7 identifier];
    if ([v13 isEqualToString:@"Off"])
    {
      BOOL normal = p_listeningModeConfigs->normal;

      v5 = v39;
      if (normal)
      {
LABEL_14:
        v14 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[AccessoryControlListItemsController listItemSelected:](v14);
        }
LABEL_16:

        goto LABEL_47;
      }
    }
    else
    {

      v5 = v39;
    }
    if (self->_autoANCSupported)
    {
      char v15 = [v7 identifier];
      if ([v15 isEqualToString:@"AutoANC"])
      {
        BOOL autoANC = self->_listeningModeConfigs.autoANC;

        if (autoANC)
        {
          v14 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            -[AccessoryControlListItemsController listItemSelected:](v14);
          }
          goto LABEL_16;
        }
      }
      else
      {
      }
    }
  }
  objc_msgSend(v5, "setChecked:", objc_msgSend(v5, "isChecked") ^ 1);
  v17 = [v7 identifier];
  int v18 = [v17 isEqualToString:@"ANC"];

  if (v18)
  {
    char v19 = [v5 isChecked];
  }
  else
  {
    v20 = [v7 identifier];
    int v21 = [v20 isEqualToString:@"Passthrough"];

    if (v21)
    {
      char v19 = [v5 isChecked];
      p_anc = ($9FDB394E5CA5750B7644BE339E11A47B *)&self->_listeningModeConfigs.transparency;
    }
    else
    {
      int v22 = [v7 identifier];
      int v23 = [v22 isEqualToString:@"Off"];

      if (v23)
      {
        char v19 = [v5 isChecked];
        p_anc = &self->_listeningModeConfigs;
      }
      else
      {
        if (!self->_autoANCSupported) {
          goto LABEL_34;
        }
        v24 = [v7 identifier];
        int v25 = [v24 isEqualToString:@"AutoANC"];

        if (!v25) {
          goto LABEL_34;
        }
        char v19 = [v5 isChecked];
        p_anc = ($9FDB394E5CA5750B7644BE339E11A47B *)&self->_listeningModeConfigs.autoANC;
      }
    }
  }
  p_anc->BOOL normal = v19;
LABEL_34:
  int v26 = 2 * self->_listeningModeConfigs.anc;
  if (self->_listeningModeConfigs.transparency) {
    v26 |= 4u;
  }
  uint64_t v27 = v26 | p_listeningModeConfigs->normal;
  if (self->_autoANCSupported)
  {
    v28 = v5;
    if (self->_listeningModeConfigs.autoANC) {
      uint64_t v27 = v27 | 8;
    }
    else {
      uint64_t v27 = v27;
    }
    BOOL v29 = [(NSString *)self->_currentSelectedSpecifier isEqualToString:@"Left"];
    v30 = [(AccessoryControlListItemsController *)self listeningModeCombinations];
    id v31 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    if (v29)
    {
      v32 = objc_msgSend(v31, "initWithObjectsAndKeys:", v30, @"cycleBetweenV2LeftBudValue", 0);
      v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
      int v34 = v33;
      v35 = @"CycleBetweenV2LeftBudValue";
    }
    else
    {
      v32 = objc_msgSend(v31, "initWithObjectsAndKeys:", v30, @"cycleBetweenV2RightBudValue", 0);
      v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
      int v34 = v33;
      v35 = @"CycleBetweenV2RightBudValue";
    }
  }
  else
  {
    v28 = v5;
    BOOL v36 = [(NSString *)self->_currentSelectedSpecifier isEqualToString:@"Left"];
    v30 = [(AccessoryControlListItemsController *)self listeningModeCombinations];
    id v37 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    if (v36)
    {
      v32 = objc_msgSend(v37, "initWithObjectsAndKeys:", v30, @"cycleBetweenLeftBudValue", 0);
      v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
      int v34 = v33;
      v35 = @"CycleBetweenLeftBudValue";
    }
    else
    {
      v32 = objc_msgSend(v37, "initWithObjectsAndKeys:", v30, @"cycleBetweenRightBudValue", 0);
      v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
      int v34 = v33;
      v35 = @"CycleBetweenRightBudValue";
    }
  }
  [v33 postNotificationName:v35 object:0 userInfo:v32];

  [(BluetoothDeviceProtocol *)self->_currentDevice setListeningModeConfigs:v27];
LABEL_47:
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v22 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  id v6 = v22;
  v7 = [v6 valueLabel];
  [v7 setLineBreakMode:0];

  v8 = [v6 valueLabel];
  [v8 setNumberOfLines:0];

  v9 = [v6 specifier];
  int v10 = [v9 identifier];
  int v11 = [v10 isEqualToString:@"ANC"];

  if (v11)
  {
    p_anc = ($9FDB394E5CA5750B7644BE339E11A47B *)&self->_listeningModeConfigs.anc;
  }
  else
  {
    v13 = [v6 specifier];
    v14 = [v13 identifier];
    int v15 = [v14 isEqualToString:@"Passthrough"];

    if (v15)
    {
      p_anc = ($9FDB394E5CA5750B7644BE339E11A47B *)&self->_listeningModeConfigs.transparency;
    }
    else
    {
      unint64_t v16 = [v6 specifier];
      v17 = [v16 identifier];
      int v18 = [v17 isEqualToString:@"Off"];

      if (!v18) {
        goto LABEL_9;
      }
      p_anc = &self->_listeningModeConfigs;
    }
  }
  [v6 setChecked:p_anc->normal];
LABEL_9:
  if (self->_autoANCSupported)
  {
    char v19 = [v6 specifier];
    v20 = [v19 identifier];
    int v21 = [v20 isEqualToString:@"AutoANC"];

    if (v21) {
      [v6 setChecked:self->_listeningModeConfigs.autoANC];
    }
  }

LABEL_13:

  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSelectedSpecifier, 0);

  objc_storeStrong((id *)&self->_currentDevice, 0);
}

- (BOOL)allowOffListeningMode
{
  objc_super v2 = self;
  BOOL v3 = sub_1E4C9B9B0();

  return v3;
}

- (void)listItemSelected:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E4BFE000, log, OS_LOG_TYPE_ERROR, "Invalid listening mode (Auto ANC) configuration. Early return", v1, 2u);
}

- (void)listItemSelected:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E4BFE000, log, OS_LOG_TYPE_ERROR, "Invalid listening mode configuration. Early return", v1, 2u);
}

@end