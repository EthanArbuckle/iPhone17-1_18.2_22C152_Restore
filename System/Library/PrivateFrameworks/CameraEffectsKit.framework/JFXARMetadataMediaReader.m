@interface JFXARMetadataMediaReader
+ (void)initialize;
- ($70930193D4F448A53BB9343C0237EB5F)readableTimeRange;
- (BOOL)beginReading;
- (BOOL)beginReadingAtTimeRange:(id *)a3;
- (BOOL)isScrubbing;
- (JFXARMetadataMediaReader)initWithMetadataReader:(id)a3;
- (JFXARMetadataMediaReaderItem)cachedARMetadata;
- (JFXMediaMetadataReader)reader;
- (NSError)error;
- (NSError)lastDecodeError;
- (NSString)name;
- (OS_dispatch_queue)synchronizationQueue;
- (id)JFX_ARMetadataFromMetadataReaderItem:(id)a3;
- (id)arMetadataItemForTime:(id *)a3;
- (id)metadataForTime:(id *)a3;
- (int64_t)status;
- (unint64_t)signPostID;
- (void)setCachedARMetadata:(id)a3;
- (void)setIsScrubbing:(BOOL)a3;
- (void)setLastDecodeError:(id)a3;
@end

@implementation JFXARMetadataMediaReader

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_4);
  }
}

uint64_t __38__JFXARMetadataMediaReader_initialize__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  s_JFXARMetadataClassName = NSStringFromClass(v0);
  return MEMORY[0x270F9A758]();
}

- (JFXARMetadataMediaReader)initWithMetadataReader:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)JFXARMetadataMediaReader;
  v6 = [(JFXARMetadataMediaReader *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reader, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UNSPECIFIED, 0);

    v10 = NSString;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = [v10 stringWithFormat:@"com.apple.%@", v12];

    id v14 = v13;
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], v9);
    synchronizationQueue = v7->_synchronizationQueue;
    v7->_synchronizationQueue = (OS_dispatch_queue *)v15;
  }
  return v7;
}

- (id)arMetadataItemForTime:(id *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = JFXMediaDataReaderIntervalSignpostCategory();
  unint64_t v6 = [(JFXARMetadataMediaReader *)self signPostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      CMTime time = (CMTime)*a3;
      Float64 Seconds = CMTimeGetSeconds(&time);
      LODWORD(time.value) = 138412546;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
      LOWORD(time.flags) = 2048;
      *(Float64 *)((char *)&time.flags + 2) = Seconds;
      _os_signpost_emit_with_name_impl(&dword_234C41000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "arMetadataItemForTime", "%@ time %f", (uint8_t *)&time, 0x16u);
    }
  }

  time.value = 0;
  *(void *)&time.timescale = &time;
  time.epoch = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  v9 = [(JFXARMetadataMediaReader *)self synchronizationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__JFXARMetadataMediaReader_arMetadataItemForTime___block_invoke;
  block[3] = &unk_264C0A290;
  long long v16 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  block[4] = self;
  block[5] = &time;
  dispatch_sync(v9, block);

  v10 = JFXMediaDataReaderIntervalSignpostCategory();
  os_signpost_id_t v11 = [(JFXARMetadataMediaReader *)self signPostID];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)id v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_234C41000, v10, OS_SIGNPOST_INTERVAL_END, v11, "arMetadataItemForTime", (const char *)&unk_234D6C482, v14, 2u);
  }

  id v12 = *(id *)(*(void *)&time.timescale + 40);
  _Block_object_dispose(&time, 8);

  return v12;
}

void __50__JFXARMetadataMediaReader_arMetadataItemForTime___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) cachedARMetadata];
  v3 = v2;
  if (v2 && ([v2 timeRange], CMTime time = *(CMTime *)(a1 + 48), CMTimeRangeContainsTime(&range, &time)))
  {
    v4 = (_OWORD *)(a1 + 48);
    id v5 = JFXLog_DebugMediaDataReader();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

    if (v6)
    {
      os_signpost_id_t v7 = JFXLog_DebugMediaDataReader();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        CMTimeValue v35 = *(void *)(a1 + 32);
        *(_OWORD *)&time.value = *v4;
        time.epoch = *(void *)(a1 + 64);
        Float64 Seconds = CMTimeGetSeconds(&time);
        [v3 timeRange];
        CMTime v47 = v46;
        Float64 v37 = CMTimeGetSeconds(&v47);
        [v3 timeRange];
        CMTimeRangeGetEnd(&v45, &v44);
        Float64 v38 = CMTimeGetSeconds(&v45);
        LODWORD(time.value) = 138413058;
        *(CMTimeValue *)((char *)&time.value + 4) = v35;
        LOWORD(time.flags) = 2048;
        *(Float64 *)((char *)&time.flags + 2) = Seconds;
        HIWORD(time.epoch) = 2048;
        Float64 v50 = v37;
        __int16 v51 = 2048;
        Float64 v52 = v38;
        _os_log_debug_impl(&dword_234C41000, v7, OS_LOG_TYPE_DEBUG, "%@ cached data found for time %f in cached sample at timerange %f-%f", (uint8_t *)&time, 0x2Au);
      }
    }
    v8 = JFXMediaDataReaderEventSignpostPointCategory();
    uint64_t v9 = [*(id *)(a1 + 32) signPostID];
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        CMTimeValue v11 = *(void *)(a1 + 32);
        *(_OWORD *)&time.value = *v4;
        time.epoch = *(void *)(a1 + 64);
        Float64 v12 = CMTimeGetSeconds(&time);
        [v3 timeRange];
        CMTime v43 = v42;
        Float64 v13 = CMTimeGetSeconds(&v43);
        [v3 timeRange];
        CMTimeRangeGetEnd(&v41, &v40);
        Float64 v14 = CMTimeGetSeconds(&v41);
        LODWORD(time.value) = 138413058;
        *(CMTimeValue *)((char *)&time.value + 4) = v11;
        LOWORD(time.flags) = 2048;
        *(Float64 *)((char *)&time.flags + 2) = v12;
        HIWORD(time.epoch) = 2048;
        Float64 v50 = v13;
        __int16 v51 = 2048;
        Float64 v52 = v14;
        _os_signpost_emit_with_name_impl(&dword_234C41000, v8, OS_SIGNPOST_EVENT, v10, "arMetadataFoundInCache", "%@ found for time %f in cached sample at timerange %f-%f", (uint8_t *)&time, 0x2Au);
      }
    }

    dispatch_queue_t v15 = JFXMediaDataReaderIntervalSignpostCategory();
    uint64_t v16 = [*(id *)(a1 + 32) signPostID];
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v17 = v16;
      if (os_signpost_enabled(v15))
      {
        LOWORD(time.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_234C41000, v15, OS_SIGNPOST_INTERVAL_END, v17, "arMetadataItemForTime", (const char *)&unk_234D6C482, (uint8_t *)&time, 2u);
      }
    }

    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    id v19 = v3;
    v20 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v19;
  }
  else
  {
    id v21 = [*(id *)(a1 + 32) reader];
    CMTime time = *(CMTime *)(a1 + 48);
    v20 = [v21 metadataForTime:&time];

    if (v20)
    {
      uint64_t v22 = JFXMediaDataReaderIntervalSignpostCategory();
      uint64_t v23 = [*(id *)(a1 + 32) signPostID];
      if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v24 = v23;
        if (os_signpost_enabled(v22))
        {
          CMTimeValue v25 = *(void *)(a1 + 32);
          CMTime time = *(CMTime *)(a1 + 48);
          Float64 v26 = CMTimeGetSeconds(&time);
          LODWORD(time.value) = 138412546;
          *(CMTimeValue *)((char *)&time.value + 4) = v25;
          LOWORD(time.flags) = 2048;
          *(Float64 *)((char *)&time.flags + 2) = v26;
          _os_signpost_emit_with_name_impl(&dword_234C41000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "decodingARMetadata", "%@ for time %f", (uint8_t *)&time, 0x16u);
        }
      }

      v27 = objc_msgSend(*(id *)(a1 + 32), "JFX_ARMetadataFromMetadataReaderItem:", v20);
      v28 = JFXMediaDataReaderIntervalSignpostCategory();
      uint64_t v29 = [*(id *)(a1 + 32) signPostID];
      if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v30 = v29;
        if (os_signpost_enabled(v28))
        {
          LOWORD(time.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_234C41000, v28, OS_SIGNPOST_INTERVAL_END, v30, "decodingARMetadata", (const char *)&unk_234D6C482, (uint8_t *)&time, 2u);
        }
      }

      if (v27)
      {
        v31 = [JFXARMetadataMediaReaderItem alloc];
        [v20 timeRange];
        uint64_t v32 = [(JFXARMetadataMediaReaderItem *)v31 initWithARMetadata:v27 timeRange:v39];
        uint64_t v33 = *(void *)(*(void *)(a1 + 40) + 8);
        v34 = *(void **)(v33 + 40);
        *(void *)(v33 + 40) = v32;

        [*(id *)(a1 + 32) setCachedARMetadata:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      }
    }
  }
}

- (id)JFX_ARMetadataFromMetadataReaderItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  int v6 = [v5 hasSuffix:s_JFXARMetadataClassName];

  if (v6)
  {
    os_signpost_id_t v7 = (void *)MEMORY[0x263F08928];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v4 data];
    id v13 = 0;
    os_signpost_id_t v10 = [v7 unarchivedObjectOfClass:v8 fromData:v9 error:&v13];
    id v11 = v13;

    if (!v10 || v11) {
      [(JFXARMetadataMediaReader *)self setLastDecodeError:v11];
    }
  }
  else
  {
    os_signpost_id_t v10 = 0;
  }

  return v10;
}

- ($70930193D4F448A53BB9343C0237EB5F)readableTimeRange
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x5010000000;
  id v13 = &unk_234D77F97;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(JFXARMetadataMediaReader *)self synchronizationQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__JFXARMetadataMediaReader_readableTimeRange__block_invoke;
  v9[3] = &unk_264C09EE8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v5, v9);

  int v6 = v11;
  long long v7 = *((_OWORD *)v11 + 3);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v11 + 2);
  *(_OWORD *)&retstr->var0.int64_t var3 = v7;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v6 + 4);
  _Block_object_dispose(&v10, 8);
  return result;
}

__n128 __45__JFXARMetadataMediaReader_readableTimeRange__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) reader];
  v3 = v2;
  if (v2)
  {
    [v2 readableTimeRange];
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
    long long v6 = 0u;
  }
  id v4 = *(_OWORD **)(*(void *)(a1 + 40) + 8);
  v4[2] = v6;
  v4[3] = v7;
  v4[4] = v8;

  return result;
}

- (BOOL)isScrubbing
{
  v2 = self;
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(JFXARMetadataMediaReader *)self synchronizationQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__JFXARMetadataMediaReader_isScrubbing__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __39__JFXARMetadataMediaReader_isScrubbing__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) reader];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isScrubbing];
}

- (void)setIsScrubbing:(BOOL)a3
{
  id v5 = [(JFXARMetadataMediaReader *)self synchronizationQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__JFXARMetadataMediaReader_setIsScrubbing___block_invoke;
  v6[3] = &unk_264C0A0C0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __43__JFXARMetadataMediaReader_setIsScrubbing___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) reader];
  [v2 setIsScrubbing:v1];
}

- (int64_t)status
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 2;
  v3 = [(JFXARMetadataMediaReader *)self synchronizationQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__JFXARMetadataMediaReader_status__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __34__JFXARMetadataMediaReader_status__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) reader];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 status];
}

- (NSError)error
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__2;
  id v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  v3 = [(JFXARMetadataMediaReader *)self synchronizationQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__JFXARMetadataMediaReader_error__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSError *)v4;
}

void __33__JFXARMetadataMediaReader_error__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) reader];
  uint64_t v3 = [v2 error];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) lastDecodeError];
    MEMORY[0x270F9A758]();
  }
}

- (BOOL)beginReadingAtTimeRange:(id *)a3
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v5 = [(JFXARMetadataMediaReader *)self synchronizationQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__JFXARMetadataMediaReader_beginReadingAtTimeRange___block_invoke;
  v8[3] = &unk_264C0A2B8;
  v8[4] = self;
  v8[5] = &v12;
  long long v6 = *(_OWORD *)&a3->var0.var3;
  long long v9 = *(_OWORD *)&a3->var0.var0;
  long long v10 = v6;
  long long v11 = *(_OWORD *)&a3->var1.var1;
  dispatch_sync(v5, v8);

  LOBYTE(a3) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)a3;
}

void __52__JFXARMetadataMediaReader_beginReadingAtTimeRange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) reader];
  long long v3 = *(_OWORD *)(a1 + 64);
  v4[0] = *(_OWORD *)(a1 + 48);
  v4[1] = v3;
  v4[2] = *(_OWORD *)(a1 + 80);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 beginReadingAtTimeRange:v4];
}

- (BOOL)beginReading
{
  id v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  long long v3 = [(JFXARMetadataMediaReader *)self synchronizationQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__JFXARMetadataMediaReader_beginReading__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __40__JFXARMetadataMediaReader_beginReading__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) reader];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 beginReading];
}

- (NSString)name
{
  id v2 = [(JFXARMetadataMediaReader *)self reader];
  long long v3 = [v2 name];

  return (NSString *)v3;
}

- (unint64_t)signPostID
{
  id v2 = [(JFXARMetadataMediaReader *)self reader];
  unint64_t v3 = [v2 signPostID];

  return v3;
}

- (id)metadataForTime:(id *)a3
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__2;
  uint64_t v14 = __Block_byref_object_dispose__2;
  id v15 = 0;
  id v5 = [(JFXARMetadataMediaReader *)self synchronizationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__JFXARMetadataMediaReader_metadataForTime___block_invoke;
  block[3] = &unk_264C0A098;
  block[4] = self;
  block[5] = &v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __44__JFXARMetadataMediaReader_metadataForTime___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) reader];
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v3 = [v2 metadataForTime:&v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (JFXMediaMetadataReader)reader
{
  return self->_reader;
}

- (NSError)lastDecodeError
{
  return self->_lastDecodeError;
}

- (void)setLastDecodeError:(id)a3
{
}

- (JFXARMetadataMediaReaderItem)cachedARMetadata
{
  return self->_cachedARMetadata;
}

- (void)setCachedARMetadata:(id)a3
{
}

- (OS_dispatch_queue)synchronizationQueue
{
  return self->_synchronizationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
  objc_storeStrong((id *)&self->_cachedARMetadata, 0);
  objc_storeStrong((id *)&self->_lastDecodeError, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end