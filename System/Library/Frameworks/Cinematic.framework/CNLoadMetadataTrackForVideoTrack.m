@interface CNLoadMetadataTrackForVideoTrack
@end

@implementation CNLoadMetadataTrackForVideoTrack

void ___CNLoadMetadataTrackForVideoTrack_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 40);
  id v20 = *(id *)(a1 + 32);
  id v8 = v5;
  v18 = v7;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  id v40 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  v9 = dispatch_group_create();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v41 count:16];
  v17 = v6;
  if (v10)
  {
    uint64_t v11 = *(void *)v28;
    v12 = (void *)*MEMORY[0x263EFA1B0];
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
        dispatch_group_enter(v9);
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = ___CNFindMetadataTrackForVideoTrack_block_invoke;
        v21[3] = &unk_26517A3D8;
        id v22 = v20;
        v23 = v14;
        v25 = &v35;
        v26 = &v31;
        v24 = v9;
        _CNLoadFirstAssociatedTrack(v14, v12, v21);

        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v41 count:16];
    }
    while (v10);
  }

  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (*((unsigned char *)v32 + 24))
  {
    v18[2](v18, v36[5], 0);
  }
  else
  {
    v15 = _CNLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      ___CNLoadMetadataTrackForVideoTrack_block_invoke_cold_1((uint64_t)v20, v15);
    }

    v16 = _CNCinematicError(3, 0);
    ((void (**)(id, uint64_t, void *))v18)[2](v18, 0, v16);
  }
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
}

void ___CNLoadMetadataTrackForVideoTrack_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_243267000, a2, OS_LOG_TYPE_DEBUG, "Error: Unable to find metadata track for video track %@", (uint8_t *)&v2, 0xCu);
}

@end