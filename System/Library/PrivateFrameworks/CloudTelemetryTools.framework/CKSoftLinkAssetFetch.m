@interface CKSoftLinkAssetFetch
- (CKContainer)container;
- (void)fetchAssetWithTeamID:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)setContainer:(id)a3;
@end

@implementation CKSoftLinkAssetFetch

- (void)fetchAssetWithTeamID:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  v50[1] = *MEMORY[0x263EF8340];
  id v36 = a3;
  id v37 = a4;
  id v8 = a5;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2050000000;
  v9 = (void *)getCKOperationConfigurationClass_softClass;
  uint64_t v49 = getCKOperationConfigurationClass_softClass;
  if (!getCKOperationConfigurationClass_softClass)
  {
    uint64_t v41 = MEMORY[0x263EF8330];
    uint64_t v42 = 3221225472;
    v43 = __getCKOperationConfigurationClass_block_invoke;
    v44 = &unk_265287530;
    v45 = &v46;
    __getCKOperationConfigurationClass_block_invoke((uint64_t)&v41);
    v9 = (void *)v47[3];
  }
  v35 = v8;
  v10 = v9;
  _Block_object_dispose(&v46, 8);
  id v11 = objc_alloc_init(v10);
  [v11 setApplicationBundleIdentifierOverride:@"com.apple.CloudTelemetryService.xpc"];
  objc_msgSend(v11, "setAllowsCellularAccess:", objc_msgSend(v37, "allowsCellularAccess"));
  objc_msgSend(v11, "setAllowsExpensiveNetworkAccess:", objc_msgSend(v37, "_allowsExpensiveAccess"));
  [v11 setPreferAnonymousRequests:1];
  v12 = [(CKSoftLinkAssetFetch *)self container];
  if (!v12)
  {
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2050000000;
    v13 = (void *)getCKContainerClass_softClass;
    uint64_t v49 = getCKContainerClass_softClass;
    if (!getCKContainerClass_softClass)
    {
      uint64_t v41 = MEMORY[0x263EF8330];
      uint64_t v42 = 3221225472;
      v43 = __getCKContainerClass_block_invoke;
      v44 = &unk_265287530;
      v45 = &v46;
      __getCKContainerClass_block_invoke((uint64_t)&v41);
      v13 = (void *)v47[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v46, 8);
    v12 = [v14 containerWithIdentifier:@"com.apple.acp.developer.apptelemetry.storebags"];
  }
  v15 = [v12 publicCloudDatabase];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2050000000;
  v16 = (void *)getCKRecordZoneIDClass_softClass;
  uint64_t v49 = getCKRecordZoneIDClass_softClass;
  if (!getCKRecordZoneIDClass_softClass)
  {
    uint64_t v41 = MEMORY[0x263EF8330];
    uint64_t v42 = 3221225472;
    v43 = __getCKRecordZoneIDClass_block_invoke;
    v44 = &unk_265287530;
    v45 = &v46;
    __getCKRecordZoneIDClass_block_invoke((uint64_t)&v41);
    v16 = (void *)v47[3];
  }
  v17 = v16;
  _Block_object_dispose(&v46, 8);
  id v18 = [v17 alloc];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  v19 = (void *)getCKCurrentUserDefaultNameSymbolLoc_ptr;
  uint64_t v49 = getCKCurrentUserDefaultNameSymbolLoc_ptr;
  if (!getCKCurrentUserDefaultNameSymbolLoc_ptr)
  {
    uint64_t v41 = MEMORY[0x263EF8330];
    uint64_t v42 = 3221225472;
    v43 = __getCKCurrentUserDefaultNameSymbolLoc_block_invoke;
    v44 = &unk_265287530;
    v45 = &v46;
    v20 = (void *)CloudKitLibrary();
    v21 = dlsym(v20, "CKCurrentUserDefaultName");
    *(void *)(v45[1] + 24) = v21;
    getCKCurrentUserDefaultNameSymbolLoc_ptr = *(void *)(v45[1] + 24);
    v19 = (void *)v47[3];
  }
  _Block_object_dispose(&v46, 8);
  if (!v19) {
    -[CKSoftLinkAssetFetch fetchAssetWithTeamID:options:completionHandler:]();
  }
  v22 = (void *)[v18 initWithZoneName:v36 ownerName:*v19];
  if (os_variant_has_internal_diagnostics()) {
    v23 = @"%@StoreBagWithLocal.json";
  }
  else {
    v23 = @"%@StoreBag.json";
  }
  v24 = objc_msgSend(NSString, "stringWithFormat:", v23, v36);
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2050000000;
  v25 = (void *)getCKRecordIDClass_softClass;
  uint64_t v49 = getCKRecordIDClass_softClass;
  if (!getCKRecordIDClass_softClass)
  {
    uint64_t v41 = MEMORY[0x263EF8330];
    uint64_t v42 = 3221225472;
    v43 = __getCKRecordIDClass_block_invoke;
    v44 = &unk_265287530;
    v45 = &v46;
    __getCKRecordIDClass_block_invoke((uint64_t)&v41);
    v25 = (void *)v47[3];
  }
  v26 = v25;
  _Block_object_dispose(&v46, 8);
  v27 = (void *)[[v26 alloc] initWithRecordName:v24 zoneID:v22];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2050000000;
  v28 = (void *)getCKFetchRecordsOperationClass_softClass;
  uint64_t v49 = getCKFetchRecordsOperationClass_softClass;
  if (!getCKFetchRecordsOperationClass_softClass)
  {
    uint64_t v41 = MEMORY[0x263EF8330];
    uint64_t v42 = 3221225472;
    v43 = __getCKFetchRecordsOperationClass_block_invoke;
    v44 = &unk_265287530;
    v45 = &v46;
    __getCKFetchRecordsOperationClass_block_invoke((uint64_t)&v41);
    v28 = (void *)v47[3];
  }
  v29 = v28;
  _Block_object_dispose(&v46, 8);
  id v30 = [v29 alloc];
  v50[0] = v27;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:1];
  v32 = (void *)[v30 initWithRecordIDs:v31];

  [v32 setShouldFetchAssetContentInMemory:1];
  [v32 setDropInMemoryAssetContentASAP:0];
  [v32 setConfiguration:v11];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __71__CKSoftLinkAssetFetch_fetchAssetWithTeamID_options_completionHandler___block_invoke;
  v38[3] = &unk_265287508;
  id v39 = v27;
  id v40 = v35;
  id v33 = v35;
  id v34 = v27;
  [v32 setFetchRecordsCompletionBlock:v38];
  [v15 addOperation:v32];
}

void __71__CKSoftLinkAssetFetch_fetchAssetWithTeamID_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  v5 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  v6 = [v5 objectForKeyedSubscript:@"storeBagAsset"];
  v7 = [v5 objectForKeyedSubscript:@"signature"];
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    v9 = [v6 assetContent];
    (*(void (**)(uint64_t, void *, void *, id))(v8 + 16))(v8, v9, v7, v10);
  }
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)fetchAssetWithTeamID:options:completionHandler:.cold.1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getCKCurrentUserDefaultName(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKSoftLinkAssetFetch.m", 16, @"%s", dlerror());

  __break(1u);
}

@end