@interface CPSClipEventsReporter
+ (id)reporter;
- (CPSClipEventsReporter)init;
- (void)init;
- (void)logClipLaunchEventForSession:(id)a3;
@end

@implementation CPSClipEventsReporter

+ (id)reporter
{
  if (reporter_onceToken != -1) {
    dispatch_once(&reporter_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)reporter_reporter;

  return v2;
}

uint64_t __33__CPSClipEventsReporter_reporter__block_invoke()
{
  reporter_reporter = objc_alloc_init(CPSClipEventsReporter);

  return MEMORY[0x270F9A758]();
}

- (CPSClipEventsReporter)init
{
  v14.receiver = self;
  v14.super_class = (Class)CPSClipEventsReporter;
  v2 = [(CPSClipEventsReporter *)&v14 init];
  if (v2)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v3 = (void *)getBMStreamsClass_softClass;
    uint64_t v19 = getBMStreamsClass_softClass;
    if (!getBMStreamsClass_softClass)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __getBMStreamsClass_block_invoke;
      v15[3] = &unk_26424E580;
      v15[4] = &v16;
      __getBMStreamsClass_block_invoke((uint64_t)v15);
      v3 = (void *)v17[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v16, 8);
    if (v4)
    {
      v5 = [v4 appClipLaunch];
      uint64_t v6 = [v5 source];
      source = v2->_source;
      v2->_source = (BMSource *)v6;
    }
    else
    {
      v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CPSClipEventsReporter init](v8);
      }
    }
    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.ClipServices.clipserviced.EventReporting", v9);
    logQueue = v2->_logQueue;
    v2->_logQueue = (OS_dispatch_queue *)v10;

    v12 = v2;
  }

  return v2;
}

- (void)logClipLaunchEventForSession:(id)a3
{
  id v4 = a3;
  logQueue = self->_logQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__CPSClipEventsReporter_logClipLaunchEventForSession___block_invoke;
  v7[3] = &unk_26424E7D8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(logQueue, v7);
}

void __54__CPSClipEventsReporter_logClipLaunchEventForSession___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1;
    id v4 = *(void **)(a1 + 32);
    v5 = v2;
    id v6 = [v4 metadata];
    v7 = [v6 clipURLHash];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_21559C000, v5, OS_LOG_TYPE_DEFAULT, "Logging Biome Event with session: %@ for clip with hash: %@", buf, 0x16u);

    a1 = v3;
  }
  uint64_t v22 = a1;
  id v8 = (id *)(a1 + 32);
  v9 = [*(id *)(a1 + 32) metadata];
  v23 = [*v8 url];
  dispatch_queue_t v10 = [*v8 configuration];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  v11 = (void *)getBMAppClipLaunchEventClass_softClass;
  uint64_t v27 = getBMAppClipLaunchEventClass_softClass;
  if (!getBMAppClipLaunchEventClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getBMAppClipLaunchEventClass_block_invoke;
    v29 = &unk_26424E580;
    v30 = &v24;
    __getBMAppClipLaunchEventClass_block_invoke((uint64_t)buf);
    v11 = (void *)v25[3];
  }
  v12 = v11;
  _Block_object_dispose(&v24, 8);
  id v13 = [v12 alloc];
  objc_super v14 = [v9 clipURLHash];
  v15 = [v9 clipBundleID];
  uint64_t v16 = [v9 fullAppBundleID];
  v17 = [v9 webClipID];
  uint64_t v18 = [v10 analyticsLaunchReason];
  if ([v10 analyticsShouldIncludeReferrerURL]) {
    uint64_t v19 = v23;
  }
  else {
    uint64_t v19 = 0;
  }
  v20 = [v10 analyticsReferrerBundleID];
  v21 = (void *)[v13 initWithURLHash:v14 clipBundleID:v15 appBundleID:v16 webAppBundleID:v17 launchReason:v18 fullURL:v23 referrerURL:v19 referrerBundleID:v20];

  [*(id *)(*(void *)(v22 + 40) + 8) sendEvent:v21];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logQueue, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21559C000, log, OS_LOG_TYPE_ERROR, "Error loading softlinked Biome stream for clip launch donations", v1, 2u);
}

@end