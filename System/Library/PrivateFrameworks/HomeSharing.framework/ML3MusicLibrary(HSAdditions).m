@interface ML3MusicLibrary(HSAdditions)
+ (uint64_t)buildDatabaseFromHomeSharingLibrary:()HSAdditions atPath:completionHandler:;
+ (void)buildDatabaseFromHomeSharingLibrary:()HSAdditions atPath:completionHandler:progressHandler:;
- (uint64_t)executeUpdateSQL:()HSAdditions;
- (void)_performImport:()HSAdditions progressHandler:completion:;
- (void)checkForChangesInHomeSharingLibrary:()HSAdditions completionHandler:;
- (void)fillContainerForHomeSharingLibrary:()HSAdditions containerID:completionHandler:;
@end

@implementation ML3MusicLibrary(HSAdditions)

- (void)checkForChangesInHomeSharingLibrary:()HSAdditions completionHandler:
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_t v8 = dispatch_group_create();
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.mobileipod.SharingChangeUpdate", 0);
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__1965;
  v44[4] = __Block_byref_object_dispose__1966;
  id v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 0;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke;
  v38[3] = &unk_26423A528;
  v10 = v9;
  v39 = v10;
  v41 = v44;
  v11 = v8;
  v40 = v11;
  v12 = (void *)MEMORY[0x2166B7C00](v38);
  dispatch_group_enter(v11);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_4;
  v31[3] = &unk_26423A570;
  v13 = v11;
  v32 = v13;
  id v14 = v6;
  id v33 = v14;
  v34 = a1;
  id v35 = v12;
  id v36 = &__block_literal_global_1967;
  v37 = v42;
  id v15 = a1;
  id v16 = v35;
  v17 = v31;
  id v18 = v14;
  v19 = +[HSContainersRequest requestWithDatabaseID:](HSContainersRequest, "requestWithDatabaseID:", [v18 databaseID]);
  v20 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"dmap.itemid", 0);
  v21 = [v20 componentsJoinedByString:@","];
  [v19 setValue:v21 forArgument:@"meta"];

  [v19 setShouldParseResponse:0];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __UpdateContainers_block_invoke;
  v46[3] = &unk_26423A748;
  id v47 = v15;
  id v48 = v16;
  id v49 = v17;
  v22 = v17;
  id v23 = v15;
  id v24 = v16;
  [v18 sendRequest:v19 withResponseHandler:v46];

  dispatch_group_enter(v13);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_5;
  v30[3] = &unk_26423A598;
  v30[4] = v42;
  UpdateItems(v18, v23, v13, v24, &__block_literal_global_1967, v30, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_6;
  block[3] = &unk_26423A5C0;
  id v27 = v7;
  v28 = v42;
  v29 = v44;
  id v25 = v7;
  dispatch_group_notify(v13, v10, block);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);
}

- (uint64_t)executeUpdateSQL:()HSAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__ML3MusicLibrary_HSAdditions__executeUpdateSQL___block_invoke;
  v8[3] = &unk_26423A4D8;
  v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [a1 databaseConnectionAllowingWrites:1 withBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_performImport:()HSAdditions progressHandler:completion:
{
  dispatch_group_t v8 = (const void *)_ML3MusicLibraryHomeSharingImportManagerKey;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  objc_getAssociatedObject(a1, v8);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    id v16 = objc_alloc_init(MEMORY[0x263F57438]);
    objc_setAssociatedObject(a1, (const void *)_ML3MusicLibraryHomeSharingImportManagerKey, v16, (void *)1);
  }
  id v12 = objc_alloc_init(MEMORY[0x263F57440]);
  id v13 = objc_alloc(MEMORY[0x263F57468]);
  char v14 = [MEMORY[0x263F57408] processClient];
  id v15 = (void *)[v13 initWithDatabaseImport:v11 library:a1 writer:v12 client:v14];

  [v16 performImport:v15 fromSource:3 progressBlock:v10 withCompletionHandler:v9];
}

- (void)fillContainerForHomeSharingLibrary:()HSAdditions containerID:completionHandler:
{
  id v8 = a5;
  id v9 = a3;
  id v10 = +[HSItemsRequest requestWithDatabaseID:containerID:](HSItemsRequest, "requestWithDatabaseID:containerID:", [v9 databaseID], a4);
  [v10 setShouldParseResponse:0];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __97__ML3MusicLibrary_HSAdditions__fillContainerForHomeSharingLibrary_containerID_completionHandler___block_invoke;
  v12[3] = &unk_26423A4B0;
  v12[4] = a1;
  id v13 = v8;
  uint64_t v14 = a4;
  id v11 = v8;
  [v9 sendRequest:v10 withResponseHandler:v12];
}

+ (void)buildDatabaseFromHomeSharingLibrary:()HSAdditions atPath:completionHandler:progressHandler:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v25 = v10;
  id v13 = (void *)[objc_alloc(MEMORY[0x263F57448]) initWithPath:v10];
  [v13 setIsHomeSharingLibrary:1];
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__1965;
  v51 = __Block_byref_object_dispose__1966;
  id v52 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  int v46 = 0;
  dispatch_group_t v14 = dispatch_group_create();
  dispatch_queue_t v15 = dispatch_queue_create("com.apple.MusicLibrary.SharingBuild", 0);
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke;
  void v42[3] = &unk_26423A5E8;
  id v16 = v12;
  id v43 = v16;
  v44 = v45;
  v17 = (void *)MEMORY[0x2166B7C00](v42);
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_2;
  v38[3] = &unk_26423A528;
  id v18 = v15;
  v39 = v18;
  v41 = &v47;
  v19 = v14;
  v40 = v19;
  v20 = (void *)MEMORY[0x2166B7C00](v38);
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_4;
  v33[3] = &unk_26423A610;
  v33[4] = &v34;
  [v13 databaseConnectionAllowingWrites:0 withBlock:v33];
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  dispatch_group_enter(v19);
  if (*((unsigned char *)v35 + 24))
  {
    v22 = v32;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_6;
    v32[3] = &unk_26423A658;
    v32[5] = &v47;
    v32[4] = v21;
    UpdateItems(v9, v13, v19, v20, v17, &__block_literal_global_23, v32);
  }
  else
  {
    v22 = v31;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_7;
    v31[3] = &unk_26423A658;
    v31[5] = &v47;
    void v31[4] = v21;
    BuildItems(v9, v13, 0, v20, v17, v31);
  }

  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  if (!v48[5])
  {
    dispatch_group_enter(v19);
    BuildContainers(v9, v13, v20, v17);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_8;
  block[3] = &unk_26423A680;
  id v27 = v13;
  id v28 = v11;
  v29 = &v47;
  v30 = v45;
  id v23 = v11;
  id v24 = v13;
  dispatch_group_notify(v19, v18, block);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v47, 8);
}

+ (uint64_t)buildDatabaseFromHomeSharingLibrary:()HSAdditions atPath:completionHandler:
{
  return [a1 buildDatabaseFromHomeSharingLibrary:a3 atPath:a4 completionHandler:a5 progressHandler:0];
}

@end