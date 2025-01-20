@interface ATXMediaApplications
- (ATXMediaApplications)init;
- (BOOL)appSupportsMedia:(id)a3;
- (void)_updateMediaApps;
@end

@implementation ATXMediaApplications

- (ATXMediaApplications)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXMediaApplications;
  v2 = [(ATXMediaApplications *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ATXMediaApplicationsQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    [(ATXMediaApplications *)v2 _updateMediaApps];
  }
  return v2;
}

- (void)_updateMediaApps
{
  dispatch_suspend((dispatch_object_t)self->_queue);
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v4 = dispatch_queue_create("get-media-apps", v3);

  MRMediaRemoteGetAppsSupportingBrowsableContentAPIs();
}

void __40__ATXMediaApplications__updateMediaApps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __40__ATXMediaApplications__updateMediaApps__block_invoke_cold_1(a3, v5);
    }
  }
  else
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:a2];
    [v6 addObject:@"com.apple.Music"];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v6;
  }
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
}

- (BOOL)appSupportsMedia:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"ATXMediaApplications.m", 48, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ATXMediaApplications_appSupportsMedia___block_invoke;
  block[3] = &unk_1E68AF258;
  id v12 = v5;
  v13 = &v14;
  block[4] = self;
  id v7 = v5;
  dispatch_sync(queue, block);
  char v8 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __41__ATXMediaApplications_appSupportsMedia___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaApps, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __40__ATXMediaApplications__updateMediaApps__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch media apps with error: %@", (uint8_t *)&v2, 0xCu);
}

@end