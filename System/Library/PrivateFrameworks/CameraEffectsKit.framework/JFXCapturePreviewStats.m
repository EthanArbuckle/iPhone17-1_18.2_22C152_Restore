@interface JFXCapturePreviewStats
- (JFXCapturePreviewStats)init;
- (NSString)name;
- (id)add:(id)a3;
- (id)runningAverage;
- (void)_print_NoLock;
- (void)clear;
- (void)print;
- (void)printSync;
- (void)setName:(id)a3;
@end

@implementation JFXCapturePreviewStats

- (JFXCapturePreviewStats)init
{
  v10.receiver = self;
  v10.super_class = (Class)JFXCapturePreviewStats;
  v2 = [(JFXCapturePreviewStats *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(JFXCapturePreviewFrameStats);
    runningAverage = v2->_runningAverage;
    v2->_runningAverage = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    stats = v2->_stats;
    v2->_stats = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.clips.previewStatsQ", 0);
    q = v2->_q;
    v2->_q = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (id)add:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__5;
    v15 = __Block_byref_object_dispose__5;
    v16 = objc_alloc_init(JFXCapturePreviewFrameStats);
    q = self->_q;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__JFXCapturePreviewStats_add___block_invoke;
    block[3] = &unk_264C0A6B8;
    block[4] = self;
    id v9 = v4;
    objc_super v10 = &v11;
    dispatch_sync(q, block);
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __30__JFXCapturePreviewStats_add___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 40) dropped];
  if ((result & 1) == 0)
  {
    for (uint64_t i = 0; i != 48; i += 8)
    {
      double v4 = *(double *)([*(id *)(*(void *)(a1 + 32) + 8) times] + i);
      double v5 = (double)(unint64_t)([*(id *)(*(void *)(a1 + 32) + 16) count] - 1);
      double v6 = *(double *)([*(id *)(a1 + 40) times] + i) + v4 * v5;
      double v7 = v6 / (double)(unint64_t)[*(id *)(*(void *)(a1 + 32) + 16) count];
      *(double *)([*(id *)(*(void *)(a1 + 32) + 8) times] + i) = v7;
      uint64_t v8 = *(void *)([*(id *)(*(void *)(a1 + 32) + 8) times] + i);
      uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) times];
      *(void *)(result + i) = v8;
    }
  }
  return result;
}

- (id)runningAverage
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy__5;
  uint64_t v11 = __Block_byref_object_dispose__5;
  v12 = objc_alloc_init(JFXCapturePreviewFrameStats);
  q = self->_q;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__JFXCapturePreviewStats_runningAverage__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(q, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __40__JFXCapturePreviewStats_runningAverage__block_invoke(uint64_t a1)
{
  for (uint64_t i = 0; i != 48; i += 8)
  {
    uint64_t v3 = *(void *)([*(id *)(*(void *)(a1 + 32) + 8) times] + i);
    uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) times];
    *(void *)(result + i) = v3;
  }
  return result;
}

- (void)print
{
  q = self->_q;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__JFXCapturePreviewStats_print__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(q, block);
}

uint64_t __31__JFXCapturePreviewStats_print__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_print_NoLock");
}

- (void)printSync
{
  q = self->_q;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__JFXCapturePreviewStats_printSync__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_sync(q, block);
}

uint64_t __35__JFXCapturePreviewStats_printSync__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_print_NoLock");
}

- (void)_print_NoLock
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v2, v3, "------------ Jetty Frame Stats BEGIN [%@] -----------", v4, v5, v6, v7, 2u);
}

- (void)clear
{
  q = self->_q;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__JFXCapturePreviewStats_clear__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(q, block);
}

uint64_t __31__JFXCapturePreviewStats_clear__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  *(void *)(*(void *)(a1 + 32) + 8) = objc_alloc_init(JFXCapturePreviewFrameStats);
  return MEMORY[0x270F9A758]();
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_runningAverage, 0);
}

@end