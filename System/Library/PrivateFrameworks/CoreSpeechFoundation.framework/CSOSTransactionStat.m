@interface CSOSTransactionStat
+ (id)sharedInstance;
- (CSOSTransactionStat)init;
- (OS_dispatch_queue)queue;
- (int)numTransaction;
- (int)numTransactionNow;
- (void)reportCreation;
- (void)reportDestroy;
- (void)setNumTransactionNow:(int)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSOSTransactionStat

- (void).cxx_destruct
{
}

- (void)setNumTransactionNow:(int)a3
{
  self->_numTransactionNow = a3;
}

- (int)numTransactionNow
{
  return self->_numTransactionNow;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int)numTransaction
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__CSOSTransactionStat_numTransaction__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__CSOSTransactionStat_numTransaction__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)reportDestroy
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CSOSTransactionStat_reportDestroy__block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_async(queue, block);
}

void __36__CSOSTransactionStat_reportDestroy__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  --*(_DWORD *)(*(void *)(a1 + 32) + 8);
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
    int v4 = 136315394;
    v5 = "-[CSOSTransactionStat reportDestroy]_block_invoke";
    __int16 v6 = 1024;
    int v7 = v3;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s NumTransactionNow = %d", (uint8_t *)&v4, 0x12u);
  }
}

- (void)reportCreation
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CSOSTransactionStat_reportCreation__block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__CSOSTransactionStat_reportCreation__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  ++*(_DWORD *)(*(void *)(a1 + 32) + 8);
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
    int v4 = 136315394;
    v5 = "-[CSOSTransactionStat reportCreation]_block_invoke";
    __int16 v6 = 1024;
    int v7 = v3;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s NumTransactionNow = %d", (uint8_t *)&v4, 0x12u);
  }
}

- (CSOSTransactionStat)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSOSTransactionStat;
  v2 = [(CSOSTransactionStat *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSOSTransactionStat", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2212 != -1) {
    dispatch_once(&sharedInstance_onceToken_2212, &__block_literal_global_2213);
  }
  v2 = (void *)sharedInstance_sharedInstance_2214;
  return v2;
}

uint64_t __37__CSOSTransactionStat_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_2214 = objc_alloc_init(CSOSTransactionStat);
  return MEMORY[0x1F41817F8]();
}

@end