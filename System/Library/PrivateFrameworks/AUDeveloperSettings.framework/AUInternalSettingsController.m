@interface AUInternalSettingsController
+ (void)clearSettingsAssetLocationForFollowup;
- (id)createInternalSpecifiers;
- (id)selectSpecifier:(id)a3;
- (id)specifiers;
- (void)addAccessoryID:(id)a3 assetID:(id)a4;
- (void)firmwareUpdateProgressForAccessoryID:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)modifySpecifiersForAccessoryID:(id)a3 withStatus:(BOOL)a4;
- (void)removeAccessoryID:(id)a3;
- (void)removedSpecifier:(id)a3;
- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AUInternalSettingsController

- (void)viewDidLoad
{
  +[AUInternalSettingsController clearSettingsAssetLocationForFollowup];
  v5.receiver = self;
  v5.super_class = (Class)AUInternalSettingsController;
  [(AUInternalSettingsController *)&v5 viewDidLoad];
  [(AUInternalSettingsController *)self setTitle:@"Accessories Firmware Update"];
  [(AUInternalSettingsController *)self setEditing:1];
  v3 = (NSMutableDictionary *)objc_opt_new();
  accessoryToStatus = self->_accessoryToStatus;
  self->_accessoryToStatus = v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8])) {
    [(AUInternalSettingsController *)self reloadSpecifiers];
  }
  v7.receiver = self;
  v7.super_class = (Class)AUInternalSettingsController;
  [(AUInternalSettingsController *)&v7 viewWillAppear:v3];
  objc_super v5 = objc_alloc_init(AUObserverXPC);
  observer = self->_observer;
  self->_observer = v5;

  [(AUObserverXPC *)self->_observer registerClient:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AUInternalSettingsController;
  [(AUInternalSettingsController *)&v4 viewDidDisappear:a3];
  [(AUObserverXPC *)self->_observer stopMonitoring];
}

- (id)selectSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = (id)[v4 objectForKeyedSubscript:*MEMORY[0x263F5FFE0]];
  if (v5 == (id)objc_opt_class()) {
    [v4 setProperty:&unk_26DCD61D0 forKey:*MEMORY[0x263F5FF18]];
  }
  v8.receiver = self;
  v8.super_class = (Class)AUInternalSettingsController;
  v6 = [(AUInternalSettingsController *)&v8 selectSpecifier:v4];

  return v6;
}

- (id)specifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  [v4 setName:@"Pre-release Beta Program"];
  [v3 addObject:v4];
  id v5 = [(AUInternalSettingsController *)self createInternalSpecifiers];
  [v3 addObjectsFromArray:v5];
  v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  [v6 setProperty:@"Internal Development Firmware should only be installed on Apple Owned Units (AOU)" forKey:*MEMORY[0x263F600F8]];
  [v3 addObject:v6];
  objc_super v7 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];
  [(AUInternalSettingsController *)self setSpecifiers:v7];

  id v8 = objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                               + (int)*MEMORY[0x263F5FDB8]));

  return v8;
}

- (id)createInternalSpecifiers
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  v19 = +[AUDeveloperSettingsDatabase sharedDatabase];
  v2 = [v19 accessoriesDictionary];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v27 = [v2 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v27)
  {
    v22 = 0;
    v23 = 0;
    goto LABEL_21;
  }
  v22 = 0;
  v23 = 0;
  uint64_t v25 = *(void *)v29;
  uint64_t v24 = *MEMORY[0x263F60078];
  uint64_t v3 = *MEMORY[0x263F5FFE0];
  uint64_t v21 = *MEMORY[0x263F5FF18];
  do
  {
    for (uint64_t i = 0; i != v27; ++i)
    {
      if (*(void *)v29 != v25) {
        objc_enumerationMutation(v2);
      }
      id v5 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      v6 = [v2 objectForKeyedSubscript:v5];
      objc_super v7 = [v6 objectForKeyedSubscript:@"name"];
      if ([v7 isEqualToString:&stru_26DCD2B00])
      {
        id v8 = v5;

        objc_super v7 = v8;
      }
      v9 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
      v10 = NSStringFromSelector(sel_removedSpecifier_);
      [v9 setProperty:v10 forKey:v24];

      [v9 setIdentifier:v5];
      [v9 setProperty:objc_opt_class() forKey:v3];
      v11 = [v6 objectForKeyedSubscript:@"personalizationRequired"];
      v12 = [v6 objectForKeyedSubscript:@"authListingEnabled"];
      if ([v11 BOOLValue] && (objc_msgSend(v12, "BOOLValue") & 1) == 0)
      {
        [v9 setProperty:objc_opt_class() forKey:v3];
        [v9 setProperty:&unk_26DCD61E8 forKey:v21];
      }
      if (configuredToDefaultAssetLocationForAccessory(v6))
      {
        v13 = v22;
        if (v22) {
          goto LABEL_17;
        }
        id v14 = objc_alloc(MEMORY[0x263EFF980]);
        v15 = [MEMORY[0x263F5FC40] groupSpecifierWithName:@"Default Configuration"];
        v13 = objc_msgSend(v14, "initWithObjects:", v15, 0);
        v22 = v13;
      }
      else
      {
        v13 = v23;
        if (v23) {
          goto LABEL_17;
        }
        id v16 = objc_alloc(MEMORY[0x263EFF980]);
        v15 = [MEMORY[0x263F5FC40] groupSpecifierWithName:@"Custom Configuration"];
        v13 = objc_msgSend(v16, "initWithObjects:", v15, 0);
        v23 = v13;
      }

LABEL_17:
      [v13 addObject:v9];
    }
    uint64_t v27 = [v2 countByEnumeratingWithState:&v28 objects:v32 count:16];
  }
  while (v27);
LABEL_21:
  [v20 addObjectsFromArray:v22];
  [v20 addObjectsFromArray:v23];
  v17 = [MEMORY[0x263EFF8C0] arrayWithArray:v20];

  return v17;
}

- (void)removedSpecifier:(id)a3
{
  id v3 = a3;
  id v5 = +[AUDeveloperSettingsDatabase sharedDatabase];
  id v4 = [v3 identifier];

  [v5 removeAccessoryWithSerialNumber:v4];
}

+ (void)clearSettingsAssetLocationForFollowup
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error while clearing followUp: %@", (uint8_t *)&v1, 0xCu);
}

- (void)modifySpecifiersForAccessoryID:(id)a3 withStatus:(BOOL)a4
{
  int v4 = a4;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_super v7 = [(NSMutableDictionary *)self->_accessoryToStatus objectForKeyedSubscript:v6];
  if ([v7 BOOLValue] != v4)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = *(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
    uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      int v29 = v4;
      long long v30 = v7;
      long long v31 = self;
      uint64_t v10 = *(void *)v40;
      uint64_t v11 = *MEMORY[0x263F5FFE0];
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v14 = [v13 objectForKeyedSubscript:v11];
          uint64_t v15 = objc_opt_class();

          if (v14 == (void *)v15)
          {
            id v16 = [v13 identifier];
            v17 = getInfoForAccessory(v16);

            v18 = [v17 objectForKeyedSubscript:@"partnerSerialNumbers"];
            uint64_t v19 = [v6 serialNumber];
            id v20 = v13;
            uint64_t v21 = (void *)v19;
            v32 = v20;
            v22 = [v20 identifier];
            if ([v21 isEqualToString:v22])
            {

LABEL_16:
              v26 = [v32 objectForKeyedSubscript:@"AUSettingsProgressActiveUpdate"];
              if ([v26 BOOLValue] == v29)
              {
                id v25 = 0;
              }
              else
              {
                uint64_t v27 = objc_msgSend(NSNumber, "numberWithBool:");
                [(NSMutableDictionary *)v31->_accessoryToStatus setObject:v27 forKeyedSubscript:v6];
                [v32 setObject:v27 forKeyedSubscript:@"AUSettingsProgressActiveUpdate"];
                id v25 = v32;
              }
              objc_super v7 = v30;

              goto LABEL_20;
            }
            [v6 serialNumber];
            v35 = v17;
            uint64_t v24 = v23 = v6;
            int v34 = [v18 containsObject:v24];

            id v6 = v23;
            v17 = v35;

            if (v34) {
              goto LABEL_16;
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      id v25 = 0;
      objc_super v7 = v30;
LABEL_20:
      self = v31;
    }
    else
    {
      id v25 = 0;
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__AUInternalSettingsController_modifySpecifiersForAccessoryID_withStatus___block_invoke;
    block[3] = &unk_264838E98;
    id v37 = v25;
    v38 = self;
    id v28 = v25;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __74__AUInternalSettingsController_modifySpecifiersForAccessoryID_withStatus___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(result + 40), "reloadSpecifier:");
  }
  return result;
}

- (void)addAccessoryID:(id)a3 assetID:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = v6;
    __int16 v9 = 2112;
    id v10 = a4;
    _os_log_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_INFO, "Accessory connected: %@ with asset: %@", (uint8_t *)&v7, 0x16u);
  }
  [(AUInternalSettingsController *)self modifySpecifiersForAccessoryID:v6 withStatus:0];
}

- (void)removeAccessoryID:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_INFO, "Accessory disconnected: %@", (uint8_t *)&v5, 0xCu);
  }
  [(AUInternalSettingsController *)self modifySpecifiersForAccessoryID:v4 withStatus:0];
}

- (void)firmwareUpdateProgressForAccessoryID:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412802;
    id v11 = v9;
    __int16 v12 = 2048;
    unint64_t v13 = a5;
    __int16 v14 = 2048;
    unint64_t v15 = a6;
    _os_log_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_INFO, "FW update progress: %@ bytes/total: %lu/%lu", (uint8_t *)&v10, 0x20u);
  }
  [(AUInternalSettingsController *)self modifySpecifiersForAccessoryID:v9 withStatus:1];
}

- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_INFO, "Staging complete: %@", (uint8_t *)&v7, 0xCu);
  }
  [(AUInternalSettingsController *)self modifySpecifiersForAccessoryID:v6 withStatus:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryToStatus, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

@end