@interface GEORegionalResourcesTileLoader
@end

@implementation GEORegionalResourcesTileLoader

void __118___GEORegionalResourcesTileLoader_loadResourcesForTileKey_manifestConfiguration_auditToken_signpostID_finished_error___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v14 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x18C1203C0]();
  if (v8)
  {
    uint64_t v10 = a1[5];
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v8);
    }
  }
  else
  {
    uint64_t v11 = a1[6];
    if (v11) {
      (*(void (**)(uint64_t, void))(v11 + 16))(v11, *(void *)(a1[4] + 8));
    }
    notify_post("kGEORegionalResourcesTileRequesterDidDownloadNotification");
  }
  os_unfair_lock_lock_with_options();
  uint64_t v12 = a1[4];
  v13 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 32));
}

@end