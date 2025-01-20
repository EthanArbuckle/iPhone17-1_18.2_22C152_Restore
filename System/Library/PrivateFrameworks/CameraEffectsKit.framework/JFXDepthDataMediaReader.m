@interface JFXDepthDataMediaReader
- ($70930193D4F448A53BB9343C0237EB5F)readableTimeRange;
- (BOOL)beginReading;
- (BOOL)beginReadingAtTimeRange:(id *)a3;
- (BOOL)isScrubbing;
- (JFXDepthDataMediaReader)initWithVideoTrackReader:(id)a3;
- (JFXDepthDecompressor)depthDecompressor;
- (JFXMediaReaderDepthData)cachedDepthData;
- (JFXMediaVideoTrackReader)reader;
- (NSError)error;
- (NSError)lastDecodeError;
- (NSString)name;
- (OS_dispatch_queue)synchronizationQueue;
- (id)JFX_cachedDepthDataForTime:(id *)a3;
- (id)JFX_decompressAVDepthDataFromVideoTrackReaderSample:(id)a3;
- (id)JFX_readDepthDataForTime:(id *)a3;
- (id)depthDataForTime:(id *)a3;
- (id)videoSampleForTime:(id *)a3;
- (int64_t)status;
- (unint64_t)signPostID;
- (void)setCachedDepthData:(id)a3;
- (void)setDepthDecompressor:(id)a3;
- (void)setIsScrubbing:(BOOL)a3;
- (void)setLastDecodeError:(id)a3;
@end

@implementation JFXDepthDataMediaReader

- (JFXDepthDataMediaReader)initWithVideoTrackReader:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)JFXDepthDataMediaReader;
  v6 = [(JFXDepthDataMediaReader *)&v20 init];
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

    uint64_t v17 = objc_opt_new();
    depthDecompressor = v7->_depthDecompressor;
    v7->_depthDecompressor = (JFXDepthDecompressor *)v17;
  }
  return v7;
}

- (id)depthDataForTime:(id *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = JFXMediaDataReaderIntervalSignpostCategory();
  unint64_t v6 = [(JFXDepthDataMediaReader *)self signPostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a3;
      Float64 Seconds = CMTimeGetSeconds((CMTime *)&v15);
      LODWORD(v15.var0) = 138412546;
      *(int64_t *)((char *)&v15.var0 + 4) = (int64_t)self;
      LOWORD(v15.var2) = 2048;
      *(Float64 *)((char *)&v15.var2 + 2) = Seconds;
      _os_signpost_emit_with_name_impl(&dword_234C41000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "depthDataForTime", "%@ time %f", (uint8_t *)&v15, 0x16u);
    }
  }

  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a3;
  v9 = [(JFXDepthDataMediaReader *)self JFX_readDepthDataForTime:&v15];
  if (v9) {
    [(JFXDepthDataMediaReader *)self setCachedDepthData:v9];
  }
  v10 = JFXMediaDataReaderIntervalSignpostCategory();
  unint64_t v11 = [(JFXDepthDataMediaReader *)self signPostID];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v10))
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a3;
      Float64 v13 = CMTimeGetSeconds((CMTime *)&v15);
      LODWORD(v15.var0) = 134217984;
      *(Float64 *)((char *)&v15.var0 + 4) = v13;
      _os_signpost_emit_with_name_impl(&dword_234C41000, v10, OS_SIGNPOST_INTERVAL_END, v12, "depthDataForTime", "time %f", (uint8_t *)&v15, 0xCu);
    }
  }

  return v9;
}

- (id)JFX_cachedDepthDataForTime:(id *)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = [(JFXDepthDataMediaReader *)self cachedDepthData];
  unint64_t v6 = v5;
  if (v5 && ([v5 timeRange], CMTime time = (CMTime)*a3, CMTimeRangeContainsTime(&range, &time)))
  {
    os_signpost_id_t v7 = JFXLog_DebugMediaDataReader();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

    if (v8)
    {
      v9 = JFXLog_DebugMediaDataReader();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        CMTime time = (CMTime)*a3;
        Float64 Seconds = CMTimeGetSeconds(&time);
        [v6 timeRange];
        CMTime v28 = v27;
        Float64 v19 = CMTimeGetSeconds(&v28);
        [v6 timeRange];
        CMTimeRangeGetEnd(&v26, &v25);
        Float64 v20 = CMTimeGetSeconds(&v26);
        LODWORD(time.value) = 138413058;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
        LOWORD(time.flags) = 2048;
        *(Float64 *)((char *)&time.flags + 2) = Seconds;
        HIWORD(time.epoch) = 2048;
        Float64 v31 = v19;
        __int16 v32 = 2048;
        Float64 v33 = v20;
        _os_log_debug_impl(&dword_234C41000, v9, OS_LOG_TYPE_DEBUG, "%@ cached data found for time %f in cached sample at timerange %f-%f", (uint8_t *)&time, 0x2Au);
      }
    }
    v10 = JFXMediaDataReaderEventSignpostPointCategory();
    unint64_t v11 = [(JFXDepthDataMediaReader *)self signPostID];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v10))
      {
        CMTime time = (CMTime)*a3;
        Float64 v13 = CMTimeGetSeconds(&time);
        [v6 timeRange];
        CMTime v24 = v23;
        Float64 v14 = CMTimeGetSeconds(&v24);
        [v6 timeRange];
        CMTimeRangeGetEnd(&v22, &v21);
        Float64 v15 = CMTimeGetSeconds(&v22);
        LODWORD(time.value) = 138413058;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
        LOWORD(time.flags) = 2048;
        *(Float64 *)((char *)&time.flags + 2) = v13;
        HIWORD(time.epoch) = 2048;
        Float64 v31 = v14;
        __int16 v32 = 2048;
        Float64 v33 = v15;
        _os_signpost_emit_with_name_impl(&dword_234C41000, v10, OS_SIGNPOST_EVENT, v12, "depthDataFoundInCache", "%@ found for time %f in cached sample at timerange %f-%f", (uint8_t *)&time, 0x2Au);
      }
    }

    id v16 = v6;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)JFX_readDepthDataForTime:(id *)a3
{
  uint64_t v10 = 0;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  Float64 v13 = __Block_byref_object_copy__10;
  Float64 v14 = __Block_byref_object_dispose__10;
  id v15 = 0;
  id v5 = [(JFXDepthDataMediaReader *)self synchronizationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__JFXDepthDataMediaReader_JFX_readDepthDataForTime___block_invoke;
  block[3] = &unk_264C0A098;
  block[4] = self;
  block[5] = &v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __52__JFXDepthDataMediaReader_JFX_readDepthDataForTime___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  CMTime time = *(CMTime *)(a1 + 48);
  uint64_t v3 = objc_msgSend(v2, "JFX_cachedDepthDataForTime:", &time);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v6 = (CMTime *)(a1 + 48);
    os_signpost_id_t v7 = [*(id *)(a1 + 32) reader];
    CMTime time = *(CMTime *)(a1 + 48);
    BOOL v8 = [v7 videoSampleForTime:&time];

    if (v8)
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = (const void *)[v8 sampleBufferRef];
      if (CMGetAttachment(v9, (CFStringRef)*MEMORY[0x263F01048], 0) != (CFTypeRef)*MEMORY[0x263EFFB40])
      {
        uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "JFX_decompressAVDepthDataFromVideoTrackReaderSample:", v8);
        if (v10)
        {
          unint64_t v11 = [JFXMediaReaderDepthData alloc];
          [v8 timeRange];
          uint64_t v12 = [(JFXMediaReaderDepthData *)v11 initWithAVDepthData:v10 timeRange:&v20];
          uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
          Float64 v14 = *(void **)(v13 + 40);
          *(void *)(v13 + 40) = v12;
        }
        goto LABEL_9;
      }
      uint64_t v10 = JFXLog_DebugMediaDataReader();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
LABEL_9:

        return;
      }
      CMTimeValue v18 = *(void *)(a1 + 32);
      CMTime time = *v6;
      Float64 Seconds = CMTimeGetSeconds(&time);
      LODWORD(time.value) = 138412546;
      *(CMTimeValue *)((char *)&time.value + 4) = v18;
      LOWORD(time.flags) = 2048;
      *(Float64 *)((char *)&time.flags + 2) = Seconds;
      uint64_t v17 = "%@ empty frame found at time %f";
    }
    else
    {
      uint64_t v10 = JFXLog_DebugMediaDataReader();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_9;
      }
      CMTimeValue v15 = *(void *)(a1 + 32);
      CMTime time = *v6;
      Float64 v16 = CMTimeGetSeconds(&time);
      LODWORD(time.value) = 138412546;
      *(CMTimeValue *)((char *)&time.value + 4) = v15;
      LOWORD(time.flags) = 2048;
      *(Float64 *)((char *)&time.flags + 2) = v16;
      uint64_t v17 = "%@ could not read video sample at time %f";
    }
    _os_log_debug_impl(&dword_234C41000, v10, OS_LOG_TYPE_DEBUG, v17, (uint8_t *)&time, 0x16u);
    goto LABEL_9;
  }
}

- (id)JFX_decompressAVDepthDataFromVideoTrackReaderSample:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(JFXDepthDataMediaReader *)self synchronizationQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = JFXMediaDataReaderIntervalSignpostCategory();
  unint64_t v7 = [(JFXDepthDataMediaReader *)self signPostID];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      if (v4)
      {
        [v4 timeRange];
      }
      else
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v33 = 0u;
      }
      *(_OWORD *)&time.value = v33;
      time.epoch = v34;
      Float64 Seconds = CMTimeGetSeconds(&time);
      int buf = 138412546;
      v38 = self;
      __int16 v39 = 2048;
      Float64 v40 = Seconds;
      _os_signpost_emit_with_name_impl(&dword_234C41000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "decompressAVDepthData", "%@ time %f", (uint8_t *)&buf, 0x16u);
    }
  }

  uint64_t v10 = [(JFXDepthDataMediaReader *)self depthDecompressor];
  id v32 = 0;
  unint64_t v11 = objc_msgSend(v10, "decompressAVDepthData:error:", objc_msgSend(v4, "sampleBufferRef"), &v32);
  double v12 = COERCE_DOUBLE(v32);

  if (v4)
  {
    [v4 timeRange];
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
  }
  *(_OWORD *)&v31.value = v28;
  v31.epoch = v29;
  double v13 = CMTimeGetSeconds(&v31);
  Float64 v14 = [(JFXDepthDataMediaReader *)self depthDecompressor];
  int v15 = [v14 depthCodecType];

  if (!v15)
  {
    Float64 v16 = JFXLog_mediaDataReader();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      [(JFXDepthDataMediaReader *)(uint64_t)self JFX_decompressAVDepthDataFromVideoTrackReaderSample:v13];
    }
  }
  uint64_t v17 = JFXLog_DebugMediaDataReader();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (v11 && v12 == 0.0)
  {
    if (v18)
    {
      v27[0] = HIBYTE(v15);
      v27[1] = BYTE2(v15);
      v27[2] = BYTE1(v15);
      v27[3] = v15;
      v27[4] = 0;
      int buf = 138412802;
      v38 = self;
      __int16 v39 = 2048;
      Float64 v40 = v13;
      __int16 v41 = 2080;
      double v42 = COERCE_DOUBLE(v27);
      Float64 v19 = "%@ depth data decompression succeeded for time %f, type detected %s";
      uint64_t v20 = v17;
      uint32_t v21 = 32;
LABEL_26:
      _os_log_debug_impl(&dword_234C41000, v20, OS_LOG_TYPE_DEBUG, v19, (uint8_t *)&buf, v21);
    }
  }
  else if (v18)
  {
    v26[0] = HIBYTE(v15);
    v26[1] = BYTE2(v15);
    v26[2] = BYTE1(v15);
    v26[3] = v15;
    v26[4] = 0;
    int buf = 138413058;
    v38 = self;
    __int16 v39 = 2112;
    Float64 v40 = v12;
    __int16 v41 = 2048;
    double v42 = v13;
    __int16 v43 = 2080;
    v44 = v26;
    Float64 v19 = "%@ depth data decompression failed with error %@ for time %f, type detected %s";
    uint64_t v20 = v17;
    uint32_t v21 = 42;
    goto LABEL_26;
  }

  uint64_t v22 = JFXMediaDataReaderIntervalSignpostCategory();
  unint64_t v23 = [(JFXDepthDataMediaReader *)self signPostID];
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v24 = v23;
    if (os_signpost_enabled(v22))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_234C41000, v22, OS_SIGNPOST_INTERVAL_END, v24, "decompressAVDepthData", (const char *)&unk_234D6C482, (uint8_t *)&buf, 2u);
    }
  }

  return v11;
}

- ($70930193D4F448A53BB9343C0237EB5F)readableTimeRange
{
  uint64_t v10 = 0;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x5010000000;
  double v13 = &unk_234D77F97;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(JFXDepthDataMediaReader *)self synchronizationQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__JFXDepthDataMediaReader_readableTimeRange__block_invoke;
  v9[3] = &unk_264C09EE8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v5, v9);

  id v6 = v11;
  long long v7 = *((_OWORD *)v11 + 3);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v11 + 2);
  *(_OWORD *)&retstr->var0.var3 = v7;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v6 + 4);
  _Block_object_dispose(&v10, 8);
  return result;
}

__n128 __44__JFXDepthDataMediaReader_readableTimeRange__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) reader];
  uint64_t v3 = v2;
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
  uint64_t v3 = [(JFXDepthDataMediaReader *)self synchronizationQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__JFXDepthDataMediaReader_isScrubbing__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __38__JFXDepthDataMediaReader_isScrubbing__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) reader];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isScrubbing];
}

- (void)setIsScrubbing:(BOOL)a3
{
  id v5 = [(JFXDepthDataMediaReader *)self synchronizationQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__JFXDepthDataMediaReader_setIsScrubbing___block_invoke;
  v6[3] = &unk_264C0A0C0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __42__JFXDepthDataMediaReader_setIsScrubbing___block_invoke(uint64_t a1)
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
  uint64_t v3 = [(JFXDepthDataMediaReader *)self synchronizationQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__JFXDepthDataMediaReader_status__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __33__JFXDepthDataMediaReader_status__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) reader];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 status];
}

- (NSError)error
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__10;
  unint64_t v11 = __Block_byref_object_dispose__10;
  id v12 = 0;
  uint64_t v3 = [(JFXDepthDataMediaReader *)self synchronizationQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__JFXDepthDataMediaReader_error__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSError *)v4;
}

void __32__JFXDepthDataMediaReader_error__block_invoke(uint64_t a1)
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
  double v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v5 = [(JFXDepthDataMediaReader *)self synchronizationQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__JFXDepthDataMediaReader_beginReadingAtTimeRange___block_invoke;
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

void __51__JFXDepthDataMediaReader_beginReadingAtTimeRange___block_invoke(uint64_t a1)
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
  long long v3 = [(JFXDepthDataMediaReader *)self synchronizationQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__JFXDepthDataMediaReader_beginReading__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __39__JFXDepthDataMediaReader_beginReading__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) reader];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 beginReading];
}

- (NSString)name
{
  id v2 = [(JFXDepthDataMediaReader *)self reader];
  long long v3 = [v2 name];

  return (NSString *)v3;
}

- (unint64_t)signPostID
{
  id v2 = [(JFXDepthDataMediaReader *)self reader];
  unint64_t v3 = [v2 signPostID];

  return v3;
}

- (id)videoSampleForTime:(id *)a3
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = __Block_byref_object_copy__10;
  uint64_t v14 = __Block_byref_object_dispose__10;
  id v15 = 0;
  id v5 = [(JFXDepthDataMediaReader *)self synchronizationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__JFXDepthDataMediaReader_videoSampleForTime___block_invoke;
  block[3] = &unk_264C0A098;
  block[4] = self;
  block[5] = &v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __46__JFXDepthDataMediaReader_videoSampleForTime___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) reader];
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v3 = [v2 videoSampleForTime:&v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (JFXMediaVideoTrackReader)reader
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

- (JFXMediaReaderDepthData)cachedDepthData
{
  return self->_cachedDepthData;
}

- (void)setCachedDepthData:(id)a3
{
}

- (OS_dispatch_queue)synchronizationQueue
{
  return self->_synchronizationQueue;
}

- (JFXDepthDecompressor)depthDecompressor
{
  return self->_depthDecompressor;
}

- (void)setDepthDecompressor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthDecompressor, 0);
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
  objc_storeStrong((id *)&self->_cachedDepthData, 0);
  objc_storeStrong((id *)&self->_lastDecodeError, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)JFX_decompressAVDepthDataFromVideoTrackReaderSample:(double)a3 .cold.1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl(&dword_234C41000, a2, OS_LOG_TYPE_ERROR, "%@ found data with invalid depth data at time %f", (uint8_t *)&v3, 0x16u);
}

@end