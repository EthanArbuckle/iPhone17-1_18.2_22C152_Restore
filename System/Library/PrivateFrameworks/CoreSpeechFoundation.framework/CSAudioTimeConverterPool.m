@interface CSAudioTimeConverterPool
+ (id)sharedInstance;
- (CSAudioTimeConverter)exclaveTimeConverter;
- (CSAudioTimeConverterPool)init;
- (NSMutableDictionary)pool;
- (OS_dispatch_queue)queue;
- (id)_getAudioTimeConverterWithAudioStreamId:(unint64_t)a3;
- (id)defaultConverter;
- (id)defaultExclaveConverter;
- (void)setExclaveTimeConverter:(id)a3;
- (void)setPool:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSAudioTimeConverterPool

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclaveTimeConverter, 0);
  objc_storeStrong((id *)&self->_pool, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setExclaveTimeConverter:(id)a3
{
}

- (CSAudioTimeConverter)exclaveTimeConverter
{
  return self->_exclaveTimeConverter;
}

- (void)setPool:(id)a3
{
}

- (NSMutableDictionary)pool
{
  return self->_pool;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)_getAudioTimeConverterWithAudioStreamId:(unint64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__304;
  v11 = __Block_byref_object_dispose__305;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__CSAudioTimeConverterPool__getAudioTimeConverterWithAudioStreamId___block_invoke;
  block[3] = &unk_1E6200FE0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_async_and_wait(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __68__CSAudioTimeConverterPool__getAudioTimeConverterWithAudioStreamId___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1[4] + 16);
  v3 = [NSNumber numberWithUnsignedInteger:a1[6]];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    v5 = *(void **)(a1[4] + 16);
    id v16 = [NSNumber numberWithUnsignedInteger:a1[6]];
    uint64_t v6 = objc_msgSend(v5, "objectForKeyedSubscript:");
    uint64_t v7 = *(void *)(a1[5] + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    uint64_t v9 = objc_alloc_init(CSAudioTimeConverter);
    uint64_t v10 = *(void *)(a1[5] + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v12 = *(void *)(*(void *)(a1[5] + 8) + 40);
    v13 = *(void **)(a1[4] + 16);
    v14 = [NSNumber numberWithUnsignedInteger:a1[6]];
    [v13 setObject:v12 forKeyedSubscript:v14];

    if (!a1[6])
    {
      v15 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[CSAudioTimeConverterPool _getAudioTimeConverterWithAudioStreamId:]_block_invoke";
        _os_log_error_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_ERROR, "%s Requested audioTimeConverter on invalid streamHandleId", buf, 0xCu);
      }
    }
  }
}

- (id)defaultExclaveConverter
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__304;
  uint64_t v10 = __Block_byref_object_dispose__305;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__CSAudioTimeConverterPool_defaultExclaveConverter__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __51__CSAudioTimeConverterPool_defaultExclaveConverter__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    id v3 = objc_alloc_init(CSAudioTimeConverter);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v6 + 40) = v2;
  return MEMORY[0x1F41817F8]();
}

- (id)defaultConverter
{
  return [(CSAudioTimeConverterPool *)self _getAudioTimeConverterWithAudioStreamId:1];
}

- (CSAudioTimeConverterPool)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSAudioTimeConverterPool;
  v2 = [(CSAudioTimeConverterPool *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAudioTimeConverterPool", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    pool = v2->_pool;
    v2->_pool = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_314 != -1) {
    dispatch_once(&sharedInstance_onceToken_314, &__block_literal_global_315);
  }
  v2 = (void *)sharedInstance_sharedInstance_316;
  return v2;
}

uint64_t __42__CSAudioTimeConverterPool_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_316 = objc_alloc_init(CSAudioTimeConverterPool);
  return MEMORY[0x1F41817F8]();
}

@end