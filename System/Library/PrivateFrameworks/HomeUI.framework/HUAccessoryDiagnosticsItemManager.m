@interface HUAccessoryDiagnosticsItemManager
- (BOOL)collectionFailed;
- (BOOL)collectionInProgress;
- (HFAccessoryDiagnosticsControlItem)diagnosticsModesItem;
- (HFItem)enableAudioClipLoggingItem;
- (HFItem)enableVerboseLoggingItem;
- (HFStaticItem)fetchADKSnapshotButtonItem;
- (HFStaticItem)fetchManufacturerSnapshotButtonItem;
- (HFStaticItem)fetchMatterSnapshotButtonItem;
- (HFStaticItem)logCollectionFailedItem;
- (HMAccessory)sourceAccessory;
- (HUAccessoryDiagnosticsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (NSMutableArray)downloadedLogs;
- (OS_dispatch_queue)matterDispatchQueue;
- (id)_beginMatterDiagnosticCollectionForDevice:(id)a3 type:(int64_t)a4;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)availableLogs;
- (void)_beginHAPDiagnosticCollection:(id)a3;
- (void)_beginMatterDiagnosticCollection;
- (void)_loadDownloadedLogs;
- (void)_registerForExternalUpdates;
- (void)_setLoggingOption:(int64_t)a3 enable:(BOOL)a4;
- (void)_unregisterForExternalUpdates;
- (void)beginDiagnosticCollection:(id)a3;
- (void)didChangeNotification:(id)a3;
- (void)recordDownloadedLog:(id)a3;
- (void)recordDownloadedMatterLog:(id)a3;
- (void)setAudioClipLoggingEnabled:(BOOL)a3;
- (void)setCollectionFailed:(BOOL)a3;
- (void)setCollectionInProgress:(BOOL)a3;
- (void)setDownloadedLogs:(id)a3;
- (void)setMatterDispatchQueue:(id)a3;
- (void)setVerboseLoggingEnabled:(BOOL)a3;
@end

@implementation HUAccessoryDiagnosticsItemManager

- (HUAccessoryDiagnosticsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v83[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v67 = [MEMORY[0x1E4F28B00] currentHandler];
    [v67 handleFailureInMethod:a2, self, @"HUAccessoryDiagnosticsItemManager.m", 56, @"Invalid parameter not satisfying: %@", @"sourceItem" object file lineNumber description];
  }
  v9 = (void *)[v8 copy];
  v81.receiver = self;
  v81.super_class = (Class)HUAccessoryDiagnosticsItemManager;
  v10 = [(HFItemManager *)&v81 initWithDelegate:v7 sourceItem:v9];

  if (v10)
  {
    v11 = [(HFItemManager *)v10 sourceItem];
    if ([v11 conformsToProtocol:&unk_1F1A3D3B8]) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    v14 = [v13 accessories];

    uint64_t v15 = [v14 anyObject];
    sourceAccessory = v10->_sourceAccessory;
    v10->_sourceAccessory = (HMAccessory *)v15;

    if (!v10->_sourceAccessory)
    {
      v68 = [MEMORY[0x1E4F28B00] currentHandler];
      [v68 handleFailureInMethod:a2 object:v10 file:@"HUAccessoryDiagnosticsItemManager.m" lineNumber:73 description:@"Could not get source accessory!"];
    }
    v17 = [(HUAccessoryDiagnosticsItemManager *)v10 sourceAccessory];
    char v18 = [v17 supportsCHIP];

    if ((v18 & 1) == 0)
    {
      id v19 = objc_alloc(MEMORY[0x1E4F695C0]);
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke;
      v79[3] = &unk_1E6385000;
      v20 = v10;
      v80 = v20;
      uint64_t v21 = [v19 initWithResultsBlock:v79];
      fetchManufacturerSnapshotButtonItem = v20->_fetchManufacturerSnapshotButtonItem;
      v20->_fetchManufacturerSnapshotButtonItem = (HFStaticItem *)v21;
    }
    v23 = [HUInstructionsItem alloc];
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke_2;
    v77[3] = &unk_1E6385000;
    v24 = v10;
    v78 = v24;
    uint64_t v25 = [(HFStaticItem *)v23 initWithResultsBlock:v77];
    logCollectionFailedItem = v24->_logCollectionFailedItem;
    v24->_logCollectionFailedItem = (HFStaticItem *)v25;

    if ([MEMORY[0x1E4F69758] isInternalInstall])
    {
      v71 = v14;
      objc_opt_class();
      v27 = [(HFItemManager *)v24 sourceItem];
      if (objc_opt_isKindOfClass()) {
        v28 = v27;
      }
      else {
        v28 = 0;
      }
      id v29 = v28;

      id v72 = v7;
      if (v29)
      {
        id v30 = [v29 accessories];
        if ([v30 count] != 1) {
          NSLog(&cfstr_ExpectedOneAcc_0.isa, v30);
        }
        v31 = [v30 anyObject];
        v32 = [v31 services];
        v33 = objc_msgSend(v32, "na_firstObjectPassingTest:", &__block_literal_global_220);

        v34 = [MEMORY[0x1E4F1CAD0] setWithObject:v33];
        v35 = [v29 valueSource];
      }
      else
      {
        v36 = [(HFItemManager *)v24 sourceItem];
        if ([v36 conformsToProtocol:&unk_1F1A3D558]) {
          v37 = v36;
        }
        else {
          v37 = 0;
        }
        id v30 = v37;

        v35 = [v30 valueSource];
        v34 = [v30 services];
      }

      if (v35)
      {
        id v38 = objc_alloc(MEMORY[0x1E4F69580]);
        v39 = [v34 anyObject];
        objc_msgSend(v39, "hf_serviceDescriptor");
        v40 = id v70 = v29;
        v69 = (void *)[v38 initWithValueSource:v35 services:v34 primaryServiceDescriptor:v40];

        id v41 = objc_alloc(MEMORY[0x1E4F68DF0]);
        uint64_t v82 = *MEMORY[0x1E4F68B10];
        v83[0] = MEMORY[0x1E4F1CC38];
        v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:&v82 count:1];
        uint64_t v43 = [v41 initWithValueSource:v69 displayResults:v42];
        diagnosticsModesItem = v24->_diagnosticsModesItem;
        v24->_diagnosticsModesItem = (HFAccessoryDiagnosticsControlItem *)v43;

        id v45 = objc_alloc(MEMORY[0x1E4F696A8]);
        v46 = (void *)[(HFAccessoryDiagnosticsControlItem *)v24->_diagnosticsModesItem copy];
        uint64_t v47 = [v45 initWithSourceItem:v46 transformationBlock:&__block_literal_global_118_2];
        enableVerboseLoggingItem = v24->_enableVerboseLoggingItem;
        v24->_enableVerboseLoggingItem = (HFItem *)v47;

        id v49 = objc_alloc(MEMORY[0x1E4F696A8]);
        v50 = (void *)[(HFAccessoryDiagnosticsControlItem *)v24->_diagnosticsModesItem copy];
        v51 = v49;
        id v29 = v70;
        uint64_t v52 = [v51 initWithSourceItem:v50 transformationBlock:&__block_literal_global_123_2];
        enableAudioClipLoggingItem = v24->_enableAudioClipLoggingItem;
        v24->_enableAudioClipLoggingItem = (HFItem *)v52;
      }
      v14 = v71;
      id v7 = v72;
    }
    uint64_t v54 = HFPreferencesBooleanValueForKey();
    v55 = [(HUAccessoryDiagnosticsItemManager *)v24 sourceAccessory];
    int v56 = [v55 supportsCHIP];

    if (v56)
    {
      dispatch_queue_t v57 = dispatch_queue_create("com.apple.Home.MatterLogsQueue", 0);
      matterDispatchQueue = v24->_matterDispatchQueue;
      v24->_matterDispatchQueue = (OS_dispatch_queue *)v57;

      id v59 = objc_alloc(MEMORY[0x1E4F695C0]);
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke_4;
      v75[3] = &unk_1E6385000;
      v60 = (id *)&v76;
      v61 = v24;
      v76 = v61;
      uint64_t v62 = [v59 initWithResultsBlock:v75];
      uint64_t v63 = 248;
    }
    else
    {
      if (v54 != 2)
      {
LABEL_31:
        [(HUAccessoryDiagnosticsItemManager *)v24 _loadDownloadedLogs];

        goto LABEL_32;
      }
      id v64 = objc_alloc(MEMORY[0x1E4F695C0]);
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke_5;
      v73[3] = &unk_1E6385000;
      v60 = (id *)&v74;
      v61 = v24;
      v74 = v61;
      uint64_t v62 = [v64 initWithResultsBlock:v73];
      uint64_t v63 = 240;
    }
    v65 = *(Class *)((char *)&v61->super.super.isa + v63);
    *(Class *)((char *)&v61->super.super.isa + v63) = (Class)v62;

    goto LABEL_31;
  }
LABEL_32:

  return v10;
}

id __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = _HULocalizedStringWithDefaultValue(@"HUAccessoryDiagnosticsGenerateButtonTitle", @"HUAccessoryDiagnosticsGenerateButtonTitle", 1);
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v4 = [*(id *)(a1 + 32) sourceAccessory];
  v5 = [v4 supportedDiagnostics];
  BOOL v6 = ([v5 supportedTypes] & 1) == 0;

  id v7 = [NSNumber numberWithInt:v6];
  [v2 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "collectionInProgress"));
  [v2 setObject:v8 forKeyedSubscript:@"HUAccessoryDiagnosticsInProgress"];

  v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v9;
}

id __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  [v2 setObject:&unk_1F19B4C10 forKeyedSubscript:@"instructionsStyle"];
  v3 = _HULocalizedStringWithDefaultValue(@"HUAccessoryDiagnosticsDownloadFailedMessage", @"HUAccessoryDiagnosticsDownloadFailedMessage", 1);
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "collectionFailed") ^ 1);
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

uint64_t __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke_79(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F2DE10]];

  return v3;
}

id __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke_2_115(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1CA60];
  id v3 = a2;
  v4 = [v2 dictionary];
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F683D8]];
  BOOL v6 = ([v5 integerValue] & 2) == 0;
  id v7 = [NSNumber numberWithInt:v6];
  [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  id v8 = _HULocalizedStringWithDefaultValue(@"HUAccessoryDiagnosticsLoggingOptionVerboseLabel", @"HUAccessoryDiagnosticsLoggingOptionVerboseLabel", 1);
  [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F683E0]];

  if (([v9 integerValue] & 2) != 0) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  v11 = [NSNumber numberWithInteger:v10];
  [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  return v4;
}

id __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  v4 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F683D8]];
  BOOL v5 = ([v4 integerValue] & 1) == 0;
  BOOL v6 = [NSNumber numberWithInt:v5];
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  id v7 = _HULocalizedStringWithDefaultValue(@"HUAccessoryDiagnosticsLoggingOptionIncludeAudioClipsLabel", @"HUAccessoryDiagnosticsLoggingOptionIncludeAudioClipsLabel", 1);
  [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v8 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F683E0]];

  if ([v8 integerValue]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  uint64_t v10 = [NSNumber numberWithInteger:v9];
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  return v3;
}

id __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = _HULocalizedStringWithDefaultValue(@"HUAccessoryDiagnosticsFetchMatterSnapshotButtonTitle", @"HUAccessoryDiagnosticsFetchMatterSnapshotButtonTitle", 1);
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v2 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "collectionInProgress"));
  [v2 setObject:v4 forKeyedSubscript:@"HUAccessoryDiagnosticsInProgress"];

  BOOL v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __65__HUAccessoryDiagnosticsItemManager_initWithDelegate_sourceItem___block_invoke_5(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = _HULocalizedStringWithDefaultValue(@"HUAccessoryDiagnosticsFetchADKSnapshotButtonTitle", @"HUAccessoryDiagnosticsFetchADKSnapshotButtonTitle", 1);
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v4 = [*(id *)(a1 + 32) sourceAccessory];
  BOOL v5 = [v4 supportedDiagnostics];
  BOOL v6 = ([v5 supportedTypes] & 2) == 0;

  id v7 = [NSNumber numberWithInt:v6];
  [v2 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "collectionInProgress"));
  [v2 setObject:v8 forKeyedSubscript:@"HUAccessoryDiagnosticsInProgress"];

  uint64_t v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v9;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", a3);
  BOOL v5 = [(HUAccessoryDiagnosticsItemManager *)self fetchManufacturerSnapshotButtonItem];
  objc_msgSend(v4, "na_safeAddObject:", v5);

  BOOL v6 = [(HUAccessoryDiagnosticsItemManager *)self logCollectionFailedItem];
  objc_msgSend(v4, "na_safeAddObject:", v6);

  id v7 = [(HUAccessoryDiagnosticsItemManager *)self fetchADKSnapshotButtonItem];
  objc_msgSend(v4, "na_safeAddObject:", v7);

  id v8 = [(HUAccessoryDiagnosticsItemManager *)self fetchMatterSnapshotButtonItem];
  objc_msgSend(v4, "na_safeAddObject:", v8);

  uint64_t v9 = [(HUAccessoryDiagnosticsItemManager *)self diagnosticsModesItem];
  objc_msgSend(v4, "na_safeAddObject:", v9);

  uint64_t v10 = [(HUAccessoryDiagnosticsItemManager *)self enableVerboseLoggingItem];
  objc_msgSend(v4, "na_safeAddObject:", v10);

  v11 = [(HUAccessoryDiagnosticsItemManager *)self enableAudioClipLoggingItem];
  objc_msgSend(v4, "na_safeAddObject:", v11);

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v4];
  v16[0] = v12;
  id v13 = [[HUAccessoryDiagnosticsItemProvider alloc] initWithItemManager:self];
  v16[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];

  return v14;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CA48];
  id v35 = a3;
  BOOL v5 = [v35 allObjects];
  BOOL v6 = [v4 arrayWithArray:v5];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [(HUAccessoryDiagnosticsItemManager *)self fetchManufacturerSnapshotButtonItem];
  objc_msgSend(v7, "na_safeAddObject:", v8);

  uint64_t v9 = [(HUAccessoryDiagnosticsItemManager *)self logCollectionFailedItem];
  objc_msgSend(v7, "na_safeAddObject:", v9);

  uint64_t v10 = [(HUAccessoryDiagnosticsItemManager *)self enableVerboseLoggingItem];
  objc_msgSend(v7, "na_safeAddObject:", v10);

  v11 = [(HUAccessoryDiagnosticsItemManager *)self enableAudioClipLoggingItem];
  objc_msgSend(v7, "na_safeAddObject:", v11);

  v12 = [(HUAccessoryDiagnosticsItemManager *)self fetchADKSnapshotButtonItem];
  objc_msgSend(v7, "na_safeAddObject:", v12);

  id v13 = [(HUAccessoryDiagnosticsItemManager *)self fetchMatterSnapshotButtonItem];
  objc_msgSend(v7, "na_safeAddObject:", v13);

  [v6 removeObjectsInArray:v7];
  v14 = [MEMORY[0x1E4F69220] defaultItemComparator];
  [v6 sortUsingComparator:v14];

  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"Logs"];
  [v15 setItems:v6];
  v16 = _HULocalizedStringWithDefaultValue(@"HUAccessoryAvailableDiagnosticForShareFooter", @"HUAccessoryAvailableDiagnosticForShareFooter", 1);
  [v15 setFooterTitle:v16];

  v17 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"GenerateButton"];
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v19 = [(HUAccessoryDiagnosticsItemManager *)self fetchManufacturerSnapshotButtonItem];
  objc_msgSend(v18, "na_safeAddObject:", v19);

  v20 = [(HUAccessoryDiagnosticsItemManager *)self fetchADKSnapshotButtonItem];
  objc_msgSend(v18, "na_safeAddObject:", v20);

  uint64_t v21 = [(HUAccessoryDiagnosticsItemManager *)self fetchMatterSnapshotButtonItem];
  objc_msgSend(v18, "na_safeAddObject:", v21);

  [v17 setItems:v18];
  v22 = _HULocalizedStringWithDefaultValue(@"HUAccessoryDiagnosticsGenerateButtonFooter", @"HUAccessoryDiagnosticsGenerateButtonFooter", 1);
  [v17 setFooterTitle:v22];

  v23 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"CollectionFailed"];
  v24 = [(HUAccessoryDiagnosticsItemManager *)self logCollectionFailedItem];
  v37[0] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  [v23 setItems:v25];

  v26 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"LoggingOptions"];
  if ([MEMORY[0x1E4F69758] isInternalInstall])
  {
    v27 = _HULocalizedStringWithDefaultValue(@"HUAccessoryDiagnosticsInternalSettingsHeader", @"HUAccessoryDiagnosticsInternalSettingsHeader", 1);
    [v26 setHeaderTitle:v27];

    v28 = _HULocalizedStringWithDefaultValue(@"HUAccessoryDiagnosticsInternalSettingsFooter", @"HUAccessoryDiagnosticsInternalSettingsFooter", 1);
    [v26 setFooterTitle:v28];

    id v29 = [MEMORY[0x1E4F1CA48] array];
    id v30 = [(HUAccessoryDiagnosticsItemManager *)self enableVerboseLoggingItem];
    objc_msgSend(v29, "na_safeAddObject:", v30);

    v31 = [(HUAccessoryDiagnosticsItemManager *)self enableAudioClipLoggingItem];
    objc_msgSend(v29, "na_safeAddObject:", v31);

    [v26 setItems:v29];
  }
  v36[0] = v15;
  v36[1] = v17;
  v36[2] = v23;
  v36[3] = v26;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
  v33 = [MEMORY[0x1E4F69220] filterSections:v32 toDisplayedItems:v35];

  return v33;
}

- (void)_registerForExternalUpdates
{
  v5.receiver = self;
  v5.super_class = (Class)HUAccessoryDiagnosticsItemManager;
  [(HFItemManager *)&v5 _registerForExternalUpdates];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = [(HUAccessoryDiagnosticsItemManager *)self sourceAccessory];
  [v3 addObserver:self selector:sel_didChangeNotification_ name:@"HUAccessoryDiagnosticsDidChange" object:v4];
}

- (void)_unregisterForExternalUpdates
{
  v5.receiver = self;
  v5.super_class = (Class)HUAccessoryDiagnosticsItemManager;
  [(HFItemManager *)&v5 _unregisterForExternalUpdates];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = [(HUAccessoryDiagnosticsItemManager *)self sourceAccessory];
  [v3 removeObserver:self name:@"HUAccessoryDiagnosticsDidChange" object:v4];
}

- (void)didChangeNotification:(id)a3
{
  [(HUAccessoryDiagnosticsItemManager *)self _loadDownloadedLogs];
  id v5 = [(HFItemManager *)self reloadAndUpdateAllItemsFromSenderSelector:a2];
}

- (BOOL)collectionInProgress
{
  id v2 = [(HUAccessoryDiagnosticsItemManager *)self sourceAccessory];
  id v3 = objc_getAssociatedObject(v2, "hu_diagnosticLogsInProgress");

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (void)setCollectionInProgress:(BOOL)a3
{
  BOOL v3 = a3;
  id object = [(HUAccessoryDiagnosticsItemManager *)self sourceAccessory];
  v4 = [NSNumber numberWithBool:v3];
  objc_setAssociatedObject(object, "hu_diagnosticLogsInProgress", v4, (void *)0x301);
}

- (BOOL)collectionFailed
{
  id v2 = [(HUAccessoryDiagnosticsItemManager *)self sourceAccessory];
  BOOL v3 = objc_getAssociatedObject(v2, "hu_diagnosticLogsLastDownloadFailed");

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (void)setCollectionFailed:(BOOL)a3
{
  BOOL v3 = a3;
  id object = [(HUAccessoryDiagnosticsItemManager *)self sourceAccessory];
  v4 = [NSNumber numberWithBool:v3];
  objc_setAssociatedObject(object, "hu_diagnosticLogsLastDownloadFailed", v4, (void *)0x301);
}

- (void)beginDiagnosticCollection:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(HUAccessoryDiagnosticsItemManager *)self fetchManufacturerSnapshotButtonItem];
  id v7 = v5;
  if ((id)v6 == v5) {
    goto LABEL_6;
  }
  id v8 = (void *)v6;
  uint64_t v9 = [(HUAccessoryDiagnosticsItemManager *)self fetchADKSnapshotButtonItem];
  if ((id)v9 == v5)
  {

    id v7 = v8;
LABEL_6:

    goto LABEL_7;
  }
  uint64_t v10 = (void *)v9;
  id v11 = [(HUAccessoryDiagnosticsItemManager *)self fetchMatterSnapshotButtonItem];

  if (v11 != v5)
  {
    v12 = NSStringFromSelector(a2);
    NSLog(&cfstr_CalledWithUnex.isa, v12, v5);
LABEL_10:

    goto LABEL_14;
  }
LABEL_7:
  if ([(HUAccessoryDiagnosticsItemManager *)self collectionInProgress])
  {
    v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring request to begin diagnostic collection because a collection is already in progress", buf, 2u);
    }
    goto LABEL_10;
  }
  [(HUAccessoryDiagnosticsItemManager *)self setCollectionInProgress:1];
  id v13 = [(HFItemManager *)self reloadAndUpdateAllItemsFromSenderSelector:a2];
  v14 = [(HUAccessoryDiagnosticsItemManager *)self sourceAccessory];
  int v15 = [v14 supportsCHIP];

  if (v15) {
    [(HUAccessoryDiagnosticsItemManager *)self _beginMatterDiagnosticCollection];
  }
  else {
    [(HUAccessoryDiagnosticsItemManager *)self _beginHAPDiagnosticCollection:v5];
  }
LABEL_14:
}

- (void)_beginHAPDiagnosticCollection:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HUAccessoryDiagnosticsItemManager *)self fetchADKSnapshotButtonItem];

  if (v5 == v4) {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F2E578]) initWithLogSizeBytes:0 delaySeconds:0 snapshotType:2 recordAudio:0 enableAudioClips:0 cloudkitMetadataRequired:0];
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Starting diagnostic collection with options %@", buf, 0xCu);
  }

  id v8 = [(HUAccessoryDiagnosticsItemManager *)self sourceAccessory];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__HUAccessoryDiagnosticsItemManager__beginHAPDiagnosticCollection___block_invoke;
  v9[3] = &unk_1E638F5D8;
  v9[4] = self;
  [v8 initiateDiagnosticsTransferWithOptions:v6 completionHandler:v9];
}

void __67__HUAccessoryDiagnosticsItemManager__beginHAPDiagnosticCollection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Diagnostic collection completed with error: %@\n %@", (uint8_t *)&v11, 0x16u);
  }

  [*(id *)(a1 + 32) setCollectionInProgress:0];
  id v8 = *(void **)(a1 + 32);
  if (v5)
  {
    [v8 setCollectionFailed:1];
  }
  else
  {
    [v8 setCollectionFailed:0];
    [*(id *)(a1 + 32) recordDownloadedLog:v6];
  }
  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v10 = [*(id *)(a1 + 32) sourceAccessory];
  [v9 postNotificationName:@"HUAccessoryDiagnosticsDidChange" object:v10];
}

- (void)_beginMatterDiagnosticCollection
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(HUAccessoryDiagnosticsItemManager *)self setCollectionInProgress:1];
  BOOL v3 = [(HUAccessoryDiagnosticsItemManager *)self sourceAccessory];
  id v4 = [v3 home];

  id v5 = objc_msgSend(v4, "hdm_sharedMatterController");
  id v6 = (void *)MEMORY[0x1E4F31188];
  id v7 = [(HUAccessoryDiagnosticsItemManager *)self sourceAccessory];
  id v8 = [v7 matterNodeID];
  uint64_t v9 = [v6 deviceWithNodeID:v8 controller:v5];

  uint64_t v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[HUAccessoryDiagnosticsItemManager _beginMatterDiagnosticCollection]";
    __int16 v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%s: device: %@", buf, 0x16u);
  }

  int v11 = [(HUAccessoryDiagnosticsItemManager *)self _beginMatterDiagnosticCollectionForDevice:v9 type:2];
  v18[0] = v11;
  id v12 = [(HUAccessoryDiagnosticsItemManager *)self _beginMatterDiagnosticCollectionForDevice:v9 type:0];
  v18[1] = v12;
  __int16 v13 = [(HUAccessoryDiagnosticsItemManager *)self _beginMatterDiagnosticCollectionForDevice:v9 type:1];
  v18[2] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];

  uint64_t v15 = [MEMORY[0x1E4F7A0D8] chainFutures:v14];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__HUAccessoryDiagnosticsItemManager__beginMatterDiagnosticCollection__block_invoke;
  v17[3] = &unk_1E63851B0;
  v17[4] = self;
  id v16 = (id)[v15 addCompletionBlock:v17];
}

void __69__HUAccessoryDiagnosticsItemManager__beginMatterDiagnosticCollection__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCollectionInProgress:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__HUAccessoryDiagnosticsItemManager__beginMatterDiagnosticCollection__block_invoke_2;
  block[3] = &unk_1E6386018;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __69__HUAccessoryDiagnosticsItemManager__beginMatterDiagnosticCollection__block_invoke_2(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v2 = [*(id *)(a1 + 32) sourceAccessory];
  [v3 postNotificationName:@"HUAccessoryDiagnosticsDidChange" object:v2];
}

- (id)_beginMatterDiagnosticCollectionForDevice:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  v16[1] = (id)a4;
  id v8 = v6;
  id v15 = v8;
  objc_copyWeak(v16, &location);
  uint64_t v9 = (void *)MEMORY[0x1E4F7A0F0];
  uint64_t v10 = [(HUAccessoryDiagnosticsItemManager *)self matterDispatchQueue];
  int v11 = [v9 schedulerWithDispatchQueue:v10];
  id v12 = [v7 lazyFutureWithBlock:&v14 scheduler:v11];

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  return v12;
}

void __84__HUAccessoryDiagnosticsItemManager__beginMatterDiagnosticCollectionForDevice_type___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Collecting logs of type: %ld for device: %@", buf, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 48);
  id v7 = (id *)(a1 + 48);
  uint64_t v9 = *(v7 - 2);
  id WeakRetained = objc_loadWeakRetained(v7 - 1);
  int v11 = [WeakRetained matterDispatchQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__HUAccessoryDiagnosticsItemManager__beginMatterDiagnosticCollectionForDevice_type___block_invoke_182;
  v13[3] = &unk_1E638F600;
  objc_copyWeak(v15, v7 - 1);
  v15[1] = *v7;
  id v12 = v3;
  id v14 = v12;
  [v9 downloadLogOfType:v8 timeout:v11 queue:v13 completion:600.0];

  objc_destroyWeak(v15);
}

void __84__HUAccessoryDiagnosticsItemManager__beginMatterDiagnosticCollectionForDevice_type___block_invoke_182(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = 134218242;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Finished collecting logs of type: %ld error: %@", (uint8_t *)&v10, 0x16u);
  }

  if (v6) {
    [WeakRetained setCollectionFailed:1];
  }
  if (v5) {
    [WeakRetained recordDownloadedMatterLog:v5];
  }
  [*(id *)(a1 + 32) finishWithNoResult];
}

- (void)_loadDownloadedLogs
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = [(HUAccessoryDiagnosticsItemManager *)self sourceAccessory];
  id v3 = objc_getAssociatedObject(v2, "hu_diagnosticLogs");

  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Loading diagnostic logs: %@.", buf, 0xCu);
  }

  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        __int16 v12 = [v11 snapshotPath];
        id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v14 = [v13 fileExistsAtPath:v12];

        if (v14)
        {
          [(NSMutableArray *)v5 addObject:v11];
        }
        else
        {
          id v15 = HFLogForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v12;
            _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Removing diagnostic log because it no longer exists: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  uint64_t v16 = [v6 count];
  if (v16 != [(NSMutableArray *)v5 count])
  {
    uint64_t v17 = (void *)[(NSMutableArray *)v5 copy];
    __int16 v18 = [(HUAccessoryDiagnosticsItemManager *)self sourceAccessory];
    objc_setAssociatedObject(v18, "hu_diagnosticLogs", v17, (void *)0x301);
  }
  downloadedLogs = self->_downloadedLogs;
  self->_downloadedLogs = v5;
}

- (void)recordDownloadedMatterLog:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 lastPathComponent];
  id v6 = NSTemporaryDirectory();
  uint64_t v7 = [v6 stringByAppendingPathComponent:v5];

  uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:0];
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = 0;
  char v10 = [v9 copyItemAtURL:v4 toURL:v8 error:&v13];
  id v11 = v13;
  if (v10)
  {
    __int16 v12 = [objc_alloc(MEMORY[0x1E4F2E570]) initWithSnapshotPath:v7 urlParameters:0 privacyPolicyURL:0 uploadDestination:0 consentVersion:0 uploadType:0];
    [(HUAccessoryDiagnosticsItemManager *)self recordDownloadedLog:v12];
  }
  else
  {
    __int16 v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "Copying MTRDevice log %@ to %@ failed:%@", buf, 0x20u);
    }
  }
}

- (void)recordDownloadedLog:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAccessoryDiagnosticsItemManager *)self downloadedLogs];
  [v5 addObject:v4];

  id v6 = [(HUAccessoryDiagnosticsItemManager *)self downloadedLogs];
  id value = (id)[v6 copy];

  uint64_t v7 = [(HUAccessoryDiagnosticsItemManager *)self sourceAccessory];
  objc_setAssociatedObject(v7, "hu_diagnosticLogs", value, (void *)0x301);
}

- (id)availableLogs
{
  id v2 = [(HUAccessoryDiagnosticsItemManager *)self downloadedLogs];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (void)_setLoggingOption:(int64_t)a3 enable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(HUAccessoryDiagnosticsItemManager *)self diagnosticsModesItem];
  uint64_t v8 = [v7 latestResults];
  uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F683E0]];

  uint64_t v10 = [v9 unsignedIntegerValue];
  if (((a3 & ~v10) == 0) != v4)
  {
    if (v4) {
      int64_t v11 = v10 | a3;
    }
    else {
      int64_t v11 = v10 & ~a3;
    }
    __int16 v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134217984;
      int64_t v17 = v11;
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to write accessory diagnostic options: %lx", (uint8_t *)&v16, 0xCu);
    }

    id v13 = [(HUAccessoryDiagnosticsItemManager *)self diagnosticsModesItem];
    int v14 = [NSNumber numberWithUnsignedInteger:v11];
    id v15 = (id)[v13 writeValue:v14];
  }
}

- (void)setVerboseLoggingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to set accessory diagnostic verbose logging to: %{BOOL}d", (uint8_t *)v6, 8u);
  }

  [(HUAccessoryDiagnosticsItemManager *)self _setLoggingOption:2 enable:v3];
}

- (void)setAudioClipLoggingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to set accessory diagnostic audio clip logging to: %{BOOL}d", (uint8_t *)v6, 8u);
  }

  [(HUAccessoryDiagnosticsItemManager *)self _setLoggingOption:1 enable:v3];
}

- (HFStaticItem)fetchManufacturerSnapshotButtonItem
{
  return self->_fetchManufacturerSnapshotButtonItem;
}

- (HFStaticItem)fetchADKSnapshotButtonItem
{
  return self->_fetchADKSnapshotButtonItem;
}

- (HFStaticItem)fetchMatterSnapshotButtonItem
{
  return self->_fetchMatterSnapshotButtonItem;
}

- (HFStaticItem)logCollectionFailedItem
{
  return self->_logCollectionFailedItem;
}

- (HFItem)enableVerboseLoggingItem
{
  return self->_enableVerboseLoggingItem;
}

- (HFItem)enableAudioClipLoggingItem
{
  return self->_enableAudioClipLoggingItem;
}

- (HMAccessory)sourceAccessory
{
  return self->_sourceAccessory;
}

- (NSMutableArray)downloadedLogs
{
  return self->_downloadedLogs;
}

- (void)setDownloadedLogs:(id)a3
{
}

- (HFAccessoryDiagnosticsControlItem)diagnosticsModesItem
{
  return self->_diagnosticsModesItem;
}

- (OS_dispatch_queue)matterDispatchQueue
{
  return self->_matterDispatchQueue;
}

- (void)setMatterDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matterDispatchQueue, 0);
  objc_storeStrong((id *)&self->_diagnosticsModesItem, 0);
  objc_storeStrong((id *)&self->_downloadedLogs, 0);
  objc_storeStrong((id *)&self->_sourceAccessory, 0);
  objc_storeStrong((id *)&self->_enableAudioClipLoggingItem, 0);
  objc_storeStrong((id *)&self->_enableVerboseLoggingItem, 0);
  objc_storeStrong((id *)&self->_logCollectionFailedItem, 0);
  objc_storeStrong((id *)&self->_fetchMatterSnapshotButtonItem, 0);
  objc_storeStrong((id *)&self->_fetchADKSnapshotButtonItem, 0);

  objc_storeStrong((id *)&self->_fetchManufacturerSnapshotButtonItem, 0);
}

@end