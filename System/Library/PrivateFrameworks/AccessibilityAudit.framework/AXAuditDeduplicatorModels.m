@interface AXAuditDeduplicatorModels
- (AXAuditDeduplicatorModels)init;
- (BOOL)determineUIPlatform:(id)a3 outPlatform:(int64_t *)a4;
- (OS_dispatch_queue)dedupeQueue;
- (OS_os_log)log;
- (UIUDeduplicator)deduplicator;
- (id)createUIUScreenShotForImage:(CGImage *)a3 withTimestamp:(id)a4;
- (id)packIssueRects:(id)a3;
- (int)deduplicateIssues:(id)a3 onImage:(CGImage *)a4 forPlatform:(id)a5;
- (int)deduplicateIssues:(id)a3 onImage:(CGImage *)a4 forUIUPlatform:(int64_t)a5;
- (int64_t)activePlatform;
- (void)setActivePlatform:(int64_t)a3;
- (void)setDedupeQueue:(id)a3;
- (void)setDeduplicator:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation AXAuditDeduplicatorModels

- (AXAuditDeduplicatorModels)init
{
  v9.receiver = self;
  v9.super_class = (Class)AXAuditDeduplicatorModels;
  v2 = [(AXAuditDeduplicatorModels *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("AXAuditDeduplicator", 0);
    [(AXAuditDeduplicatorModels *)v2 setDedupeQueue:v3];

    os_log_t v4 = os_log_create("AXAuditDeduplicator", "Models");
    [(AXAuditDeduplicatorModels *)v2 setLog:v4];

    [(AXAuditDeduplicatorModels *)v2 setActivePlatform:0];
    v5 = [(AXAuditDeduplicatorModels *)v2 dedupeQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__AXAuditDeduplicatorModels_init__block_invoke;
    block[3] = &unk_26520D308;
    v8 = v2;
    dispatch_async(v5, block);
  }
  return v2;
}

void __33__AXAuditDeduplicatorModels_init__block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F83EC8]) initWithPortraitModels];
  [*(id *)(a1 + 32) setDeduplicator:v2];

  dispatch_queue_t v3 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v4 = 0;
    _os_log_impl(&dword_247247000, v3, OS_LOG_TYPE_DEFAULT, "Created the deduplicator", v4, 2u);
  }
}

- (BOOL)determineUIPlatform:(id)a3 outPlatform:(int64_t *)a4
{
  id v5 = a3;
  if ([v5 localizedCaseInsensitiveContainsString:@"iPad"])
  {
    int64_t v6 = 1;
  }
  else
  {
    if (![v5 localizedCaseInsensitiveContainsString:@"iPhone"])
    {
      BOOL v7 = 0;
      goto LABEL_7;
    }
    int64_t v6 = 0;
  }
  *a4 = v6;
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (int)deduplicateIssues:(id)a3 onImage:(CGImage *)a4 forPlatform:(id)a5
{
  id v8 = a3;
  uint64_t v11 = 0;
  if ([(AXAuditDeduplicatorModels *)self determineUIPlatform:a5 outPlatform:&v11]) {
    int v9 = [(AXAuditDeduplicatorModels *)self deduplicateIssues:v8 onImage:a4 forUIUPlatform:v11];
  }
  else {
    int v9 = -1;
  }

  return v9;
}

- (int)deduplicateIssues:(id)a3 onImage:(CGImage *)a4 forUIUPlatform:(int64_t)a5
{
  id v8 = a3;
  if (!objc_opt_class()) {
    goto LABEL_16;
  }
  if (([MEMORY[0x263F83EC8] areModelsAvailable] & 1) == 0)
  {
    v35 = [(AXAuditDeduplicatorModels *)self log];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[AXAuditDeduplicatorModels deduplicateIssues:onImage:forUIUPlatform:](v35);
    }
    goto LABEL_15;
  }
  uint64_t v9 = [(AXAuditDeduplicatorModels *)self deduplicator];
  if (!v9
    || (v10 = (void *)v9,
        int64_t v11 = [(AXAuditDeduplicatorModels *)self activePlatform],
        v10,
        v11 != a5))
  {
    v36 = [(AXAuditDeduplicatorModels *)self dedupeQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__AXAuditDeduplicatorModels_deduplicateIssues_onImage_forUIUPlatform___block_invoke;
    block[3] = &unk_26520D308;
    void block[4] = self;
    dispatch_async(v36, block);

    [(AXAuditDeduplicatorModels *)self setActivePlatform:a5];
    v35 = [(AXAuditDeduplicatorModels *)self log];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[AXAuditDeduplicatorModels deduplicateIssues:onImage:forUIUPlatform:](v35);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (![v8 count])
  {
LABEL_16:
    v17 = 0;
    v19 = 0;
    v15 = 0;
    v14 = 0;
LABEL_17:
    int v26 = -1;
    goto LABEL_18;
  }
  v12 = [v8 firstObject];
  v13 = [v12 timeStamp];
  v14 = [(AXAuditDeduplicatorModels *)self createUIUScreenShotForImage:a4 withTimestamp:v13];

  v15 = [(AXAuditDeduplicatorModels *)self packIssueRects:v8];
  v16 = [(AXAuditDeduplicatorModels *)self deduplicator];
  v17 = [v16 identifyElements:v14 elements:v15];

  v18 = [(AXAuditDeduplicatorModels *)self deduplicator];
  v19 = [v18 addElementsForScreen:v14 candidates:v17 screenGroupID:0];

  v20 = [v19 results];
  uint64_t v21 = [v20 count];
  uint64_t v22 = [v8 count];

  if (v21 != v22)
  {
    v38 = [(AXAuditDeduplicatorModels *)self log];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[AXAuditDeduplicatorModels deduplicateIssues:onImage:forUIUPlatform:](v19, v8, v38);
    }

    goto LABEL_17;
  }
  v23 = [v19 results];
  uint64_t v24 = [v23 count];

  if (v24)
  {
    unint64_t v25 = 0;
    int v26 = 0;
    do
    {
      v27 = [v19 results];
      v28 = [v27 objectAtIndexedSubscript:v25];

      uint64_t v29 = [v28 isDuplicate];
      v30 = [v8 objectAtIndexedSubscript:v25];
      [v30 setIsDuplicate:v29];

      v31 = [v19 groupID];
      v32 = [v8 objectAtIndexedSubscript:v25];
      [v32 setScreenGroupId:v31];

      v26 += [v28 isDuplicate];
      ++v25;
      v33 = [v19 results];
      unint64_t v34 = [v33 count];
    }
    while (v34 > v25);
  }
  else
  {
    int v26 = 0;
  }
LABEL_18:

  return v26;
}

void __70__AXAuditDeduplicatorModels_deduplicateIssues_onImage_forUIUPlatform___block_invoke(uint64_t a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F83EC8]) initWithPortraitModels];
  [*(id *)(a1 + 32) setDeduplicator:v2];
}

- (id)createUIUScreenShotForImage:(CGImage *)a3 withTimestamp:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(AXAuditDeduplicatorModels *)self deduplicator];
  id v8 = [v7 identifyImage:v6 image:a3];

  return v8;
}

- (id)packIssueRects:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  os_log_t v4 = [MEMORY[0x263EFF980] array];
  id v5 = +[AXAuditScreenshotManager sharedManager];
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
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        v12 = [v5 screenshotForIssue:v11 elementRect:&v19];
        [v12 scale];
        double v14 = v13;
        double v15 = v13 * *(double *)&v19;
        [v12 size];
        v17 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v15, v14 * (v16 - *((double *)&v19 + 1) - *((double *)&v20 + 1)), v14 * *(double *)&v20, v14 * *((double *)&v20 + 1));
        [v4 addObject:v17];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  return v4;
}

- (UIUDeduplicator)deduplicator
{
  return (UIUDeduplicator *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeduplicator:(id)a3
{
}

- (int64_t)activePlatform
{
  return self->_activePlatform;
}

- (void)setActivePlatform:(int64_t)a3
{
  self->_activePlatform = a3;
}

- (OS_dispatch_queue)dedupeQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDedupeQueue:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_dedupeQueue, 0);

  objc_storeStrong((id *)&self->_deduplicator, 0);
}

- (void)deduplicateIssues:(os_log_t)log onImage:forUIUPlatform:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_247247000, log, OS_LOG_TYPE_ERROR, "UIUDeduplicator object is not available, skipping", v1, 2u);
}

- (void)deduplicateIssues:(void *)a1 onImage:(void *)a2 forUIUPlatform:(NSObject *)a3 .cold.2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a1 results];
  int v6 = 134218240;
  uint64_t v7 = [v5 count];
  __int16 v8 = 2048;
  uint64_t v9 = [a2 count];
  _os_log_error_impl(&dword_247247000, a3, OS_LOG_TYPE_ERROR, "Deduplication result mismatched length, added %lu but expected %lu. Do nothing to avoid wrong duping", (uint8_t *)&v6, 0x16u);
}

- (void)deduplicateIssues:(os_log_t)log onImage:forUIUPlatform:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_247247000, log, OS_LOG_TYPE_ERROR, "UIUDeduplicator models are not available, skipping", v1, 2u);
}

@end