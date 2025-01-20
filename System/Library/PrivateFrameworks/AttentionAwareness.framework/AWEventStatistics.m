@interface AWEventStatistics
+ (id)sharedStatistics;
- (AWEventStatistics)init;
- (void)logEvent:(unint64_t)a3;
@end

@implementation AWEventStatistics

void __25__AWEventStatistics_init__block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v35 = [MEMORY[0x1E4F28E78] string];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v2 = [*(id *)(*(void *)(a1 + 32) + 48) allKeys];
  v3 = [v2 sortedArrayUsingSelector:sel_compare_];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v10 = [v9 integerValue];
        v11 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:v9];
        uint64_t v12 = [v11 integerValue];

        if (v12)
        {
          v13 = getEventMaskDescription(v10);
          [v35 appendFormat:@"%llu %@ ", v12, v13];

          char v6 = 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v5);

    [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
    if (v6)
    {
      if (currentLogLevel == 5)
      {
        v14 = _AALog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v15 = absTimeNS();
          if (v15 == -1) {
            double v16 = INFINITY;
          }
          else {
            double v16 = (double)v15 / 1000000000.0;
          }
          uint64_t v21 = *(void *)(a1 + 32);
          unint64_t v22 = *(void *)(v21 + 32);
          if (v22 == -1) {
            double v23 = INFINITY;
          }
          else {
            double v23 = (double)v22 / 1000000000.0;
          }
          uint64_t v24 = *(void *)(v21 + 40);
          *(_DWORD *)buf = 134218754;
          double v41 = v16;
          __int16 v42 = 2112;
          *(void *)v43 = v35;
          *(_WORD *)&v43[8] = 2048;
          *(double *)&v43[10] = v23;
          *(_WORD *)&v43[18] = 2112;
          *(void *)&v43[20] = v24;
          v25 = "%13.5f: %@since %13.5f (%@)";
          v26 = v14;
          uint32_t v27 = 42;
LABEL_36:
          _os_log_impl(&dword_1B3B4B000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
        }
LABEL_37:

        goto LABEL_38;
      }
      if (currentLogLevel >= 6)
      {
        v14 = _AALog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v17 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/EventStatistics.m";
          for (j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/EventStatistics.m";
                ;
                ++j)
          {
            if (*(j - 1) == 47)
            {
              v17 = j;
            }
            else if (!*(j - 1))
            {
              unint64_t v19 = absTimeNS();
              if (v19 == -1) {
                double v20 = INFINITY;
              }
              else {
                double v20 = (double)v19 / 1000000000.0;
              }
              uint64_t v28 = *(void *)(a1 + 32);
              unint64_t v29 = *(void *)(v28 + 32);
              if (v29 == -1) {
                double v30 = INFINITY;
              }
              else {
                double v30 = (double)v29 / 1000000000.0;
              }
              uint64_t v31 = *(void *)(v28 + 40);
              *(_DWORD *)buf = 136316418;
              double v41 = *(double *)&v17;
              __int16 v42 = 1024;
              *(_DWORD *)v43 = 48;
              *(_WORD *)&v43[4] = 2048;
              *(double *)&v43[6] = v20;
              *(_WORD *)&v43[14] = 2112;
              *(void *)&v43[16] = v35;
              *(_WORD *)&v43[24] = 2048;
              *(double *)&v43[26] = v30;
              __int16 v44 = 2112;
              uint64_t v45 = v31;
              v25 = "%30s:%-4d: %13.5f: %@since %13.5f (%@)";
              v26 = v14;
              uint32_t v27 = 58;
              goto LABEL_36;
            }
          }
        }
        goto LABEL_37;
      }
    }
  }
  else
  {

    [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  }
LABEL_38:
  *(void *)(*(void *)(a1 + 32) + 32) = absTimeNS();
  uint64_t v32 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v33 = *(void *)(a1 + 32);
  v34 = *(void **)(v33 + 40);
  *(void *)(v33 + 40) = v32;

  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
}

- (void)logEvent:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  stats = self->_stats;
  char v6 = [NSNumber numberWithUnsignedLongLong:a3];
  id v12 = [(NSMutableDictionary *)stats objectForKeyedSubscript:v6];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "integerValue") + 1);
  v8 = self->_stats;
  v9 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];

  if (!self->_timerResumed)
  {
    timer = self->_timer;
    dispatch_time_t v11 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(timer, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_timer);
    self->_timerResumed = 1;
  }
}

+ (id)sharedStatistics
{
  if (sharedStatistics_onceToken != -1) {
    dispatch_once(&sharedStatistics_onceToken, &__block_literal_global_57);
  }
  v2 = (void *)sharedStatistics_statistics;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_lastLogDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (AWEventStatistics)init
{
  v16.receiver = self;
  v16.super_class = (Class)AWEventStatistics;
  id v2 = [(AWEventStatistics *)&v16 init];
  if (v2)
  {
    uint64_t v3 = awQueue(1);
    uint64_t v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v2 + 1));
    char v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    uint64_t v7 = *((void *)v2 + 2);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __25__AWEventStatistics_init__block_invoke;
    handler[3] = &unk_1E606AC70;
    v8 = v2;
    id v15 = v8;
    dispatch_source_set_event_handler(v7, handler);
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v10 = (void *)v8[6];
    v8[6] = v9;

    v8[4] = absTimeNS();
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    id v12 = (void *)v8[5];
    v8[5] = v11;
  }
  return (AWEventStatistics *)v2;
}

uint64_t __37__AWEventStatistics_sharedStatistics__block_invoke()
{
  sharedStatistics_statistics = objc_alloc_init(AWEventStatistics);

  return MEMORY[0x1F41817F8]();
}

@end