@interface AWAttentionAwarenessClientConfig
+ (id)sharedClientConfig;
- (AWAttentionAwarenessClientConfig)init;
- (AWNotification_s)notifySupportedEventsChangedWithQueue:(id)a3 block:(id)a4;
- (id)tagForIndex:(unint64_t)a3;
- (unint64_t)addTag:(id)a3;
- (unint64_t)supportedEvents;
- (void)cancelNotification:(AWNotification_s *)a3;
- (void)dealloc;
- (void)decrementTagIndexRefCount:(unint64_t)a3;
- (void)incrementTagIndexRefCount:(unint64_t)a3;
- (void)updateState:(BOOL)a3;
@end

@implementation AWAttentionAwarenessClientConfig

+ (id)sharedClientConfig
{
  if (sharedClientConfig_onceToken != -1) {
    dispatch_once(&sharedClientConfig_onceToken, &__block_literal_global_2074);
  }
  v2 = (void *)sharedClientConfig_clientConfig;

  return v2;
}

- (id)tagForIndex:(unint64_t)a3
{
  if (a3)
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__2053;
    v11 = __Block_byref_object_dispose__2054;
    id v12 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__AWAttentionAwarenessClientConfig_tagForIndex___block_invoke;
    block[3] = &unk_1E606A910;
    block[4] = self;
    block[5] = &v7;
    block[6] = a3;
    dispatch_sync(queue, block);
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)incrementTagIndexRefCount:(unint64_t)a3
{
  if (a3)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __62__AWAttentionAwarenessClientConfig_incrementTagIndexRefCount___block_invoke;
    v4[3] = &unk_1E606AB88;
    v4[4] = self;
    v4[5] = a3;
    dispatch_sync(queue, v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagRefCount, 0);
  objc_storeStrong((id *)&self->_tagMap, 0);
  objc_storeStrong((id *)&self->_notifyBlocks, 0);
  objc_storeStrong((id *)&self->_notifyQueues, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)decrementTagIndexRefCount:(unint64_t)a3
{
  if (a3)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __62__AWAttentionAwarenessClientConfig_decrementTagIndexRefCount___block_invoke;
    v4[3] = &unk_1E606AB88;
    v4[4] = self;
    v4[5] = a3;
    dispatch_sync(queue, v4);
  }
}

void __62__AWAttentionAwarenessClientConfig_decrementTagIndexRefCount___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 72);
  v3 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    uint64_t v5 = [v4 unsignedLongLongValue];
    uint64_t v6 = v5 - 1;
    if (v5 == 1)
    {
      if (currentLogLevel < 7) {
        goto LABEL_32;
      }
      v15 = _AALog();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      v16 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Client/SimpleFrameworkTypes.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Client/SimpleFrameworkTypes.m"; ; ++i)
      {
        if (*(i - 1) == 47)
        {
          v16 = i;
        }
        else if (!*(i - 1))
        {
          unint64_t v20 = absTimeNS();
          if (v20 == -1) {
            double v21 = INFINITY;
          }
          else {
            double v21 = (double)v20 / 1000000000.0;
          }
          uint64_t v27 = *(void *)(a1 + 40);
          v28 = *(void **)(*(void *)(a1 + 32) + 64);
          v29 = [NSNumber numberWithUnsignedLongLong:v27];
          v30 = [v28 objectForKeyedSubscript:v29];
          v31 = tagDescription(v27, v30);
          int v37 = 136315906;
          double v38 = *(double *)&v16;
          __int16 v39 = 1024;
          *(_DWORD *)v40 = 247;
          *(_WORD *)&v40[4] = 2048;
          *(double *)&v40[6] = v21;
          __int16 v41 = 2112;
          v42 = v31;
          _os_log_impl(&dword_1B3B4B000, v15, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: removed %@ from tag map", (uint8_t *)&v37, 0x26u);

LABEL_31:
LABEL_32:
          v32 = *(void **)(*(void *)(a1 + 32) + 64);
          v33 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
          [v32 removeObjectForKey:v33];

          uint64_t v34 = *(void *)(a1 + 40);
          v35 = *(void **)(*(void *)(a1 + 32) + 72);
          v10 = [NSNumber numberWithUnsignedLongLong:v34];
          [v35 removeObjectForKey:v10];
          goto LABEL_33;
        }
      }
    }
    uint64_t v7 = [NSNumber numberWithUnsignedLongLong:v6];
    v8 = *(void **)(*(void *)(a1 + 32) + 72);
    uint64_t v9 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
    [v8 setObject:v7 forKeyedSubscript:v9];

    if (currentLogLevel >= 7)
    {
      v10 = _AALog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_33;
      }
      v11 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Client/SimpleFrameworkTypes.m";
      for (j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Client/SimpleFrameworkTypes.m"; ; ++j)
      {
        if (*(j - 1) == 47)
        {
          v11 = j;
        }
        else if (!*(j - 1))
        {
          unint64_t v18 = absTimeNS();
          if (v18 == -1) {
            double v19 = INFINITY;
          }
          else {
            double v19 = (double)v18 / 1000000000.0;
          }
          uint64_t v22 = *(void *)(a1 + 40);
          v23 = *(void **)(*(void *)(a1 + 32) + 64);
          v24 = [NSNumber numberWithUnsignedLongLong:v22];
          v25 = [v23 objectForKeyedSubscript:v24];
          v26 = tagDescription(v22, v25);
          int v37 = 136316162;
          double v38 = *(double *)&v11;
          __int16 v39 = 1024;
          *(_DWORD *)v40 = 242;
          *(_WORD *)&v40[4] = 2048;
          *(double *)&v40[6] = v19;
          __int16 v41 = 2112;
          v42 = v26;
          __int16 v43 = 2048;
          uint64_t v44 = v6;
          _os_log_impl(&dword_1B3B4B000, v10, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: decremented ref count of %@ to %llu", (uint8_t *)&v37, 0x30u);

          goto LABEL_33;
        }
      }
    }
  }
  else if (currentLogLevel >= 3)
  {
    v10 = _AALog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unint64_t v13 = absTimeNS();
      if (v13 == -1) {
        double v14 = INFINITY;
      }
      else {
        double v14 = (double)v13 / 1000000000.0;
      }
      v36 = tagDescription(*(void *)(a1 + 40), 0);
      int v37 = 134218242;
      double v38 = v14;
      __int16 v39 = 2112;
      *(void *)v40 = v36;
      _os_log_error_impl(&dword_1B3B4B000, v10, OS_LOG_TYPE_ERROR, "%13.5f: trying to decrement ref for non-existent %@", (uint8_t *)&v37, 0x16u);
    }
LABEL_33:
  }
}

void __62__AWAttentionAwarenessClientConfig_incrementTagIndexRefCount___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 72);
  v3 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    uint64_t v5 = [v4 unsignedLongLongValue] + 1;
    uint64_t v6 = [NSNumber numberWithUnsignedLongLong:v5];
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 72);
    v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
    [v7 setObject:v6 forKeyedSubscript:v8];

    if (currentLogLevel >= 7)
    {
      uint64_t v9 = _AALog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      v10 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Client/SimpleFrameworkTypes.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Client/SimpleFrameworkTypes.m"; ; ++i)
      {
        if (*(i - 1) == 47)
        {
          v10 = i;
        }
        else if (!*(i - 1))
        {
          unint64_t v14 = absTimeNS();
          if (v14 == -1) {
            double v15 = INFINITY;
          }
          else {
            double v15 = (double)v14 / 1000000000.0;
          }
          uint64_t v16 = *(void *)(a1 + 40);
          v17 = *(void **)(*(void *)(a1 + 32) + 64);
          unint64_t v18 = [NSNumber numberWithUnsignedLongLong:v16];
          double v19 = [v17 objectForKeyedSubscript:v18];
          unint64_t v20 = tagDescription(v16, v19);
          int v22 = 136316162;
          double v23 = *(double *)&v10;
          __int16 v24 = 1024;
          *(_DWORD *)v25 = 216;
          *(_WORD *)&v25[4] = 2048;
          *(double *)&v25[6] = v15;
          __int16 v26 = 2112;
          uint64_t v27 = v20;
          __int16 v28 = 2048;
          uint64_t v29 = v5;
          _os_log_impl(&dword_1B3B4B000, v9, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: incremented ref count of %@ to %llu", (uint8_t *)&v22, 0x30u);

          goto LABEL_18;
        }
      }
    }
  }
  else if (currentLogLevel >= 3)
  {
    uint64_t v9 = _AALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unint64_t v12 = absTimeNS();
      if (v12 == -1) {
        double v13 = INFINITY;
      }
      else {
        double v13 = (double)v12 / 1000000000.0;
      }
      double v21 = tagDescription(*(void *)(a1 + 40), 0);
      int v22 = 134218242;
      double v23 = v13;
      __int16 v24 = 2112;
      *(void *)v25 = v21;
      _os_log_error_impl(&dword_1B3B4B000, v9, OS_LOG_TYPE_ERROR, "%13.5f: trying to increment ref for non-existent %@", (uint8_t *)&v22, 0x16u);
    }
LABEL_18:
  }
}

void __48__AWAttentionAwarenessClientConfig_tagForIndex___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 64);
  id v6 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (unint64_t)addTag:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AWAttentionAwarenessClientConfig_addTag___block_invoke;
  block[3] = &unk_1E606A8E8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __43__AWAttentionAwarenessClientConfig_addTag___block_invoke(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(v2 + 56);
  *(void *)(v2 + 56) = v3 + 1;
  *(void *)(*(void *)(a1[6] + 8) + 24) = v3;
  uint64_t v4 = a1[5];
  uint64_t v5 = *(void **)(a1[4] + 64);
  id v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(a1[6] + 8) + 24)];
  [v5 setObject:v4 forKeyedSubscript:v6];

  unint64_t v7 = *(void **)(a1[4] + 72);
  v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(a1[6] + 8) + 24)];
  [v7 setObject:&unk_1F0C5AE40 forKeyedSubscript:v8];

  if (currentLogLevel < 7) {
    return;
  }
  uint64_t v9 = _AALog();
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_13;
  }
  id v10 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Client/SimpleFrameworkTypes.m";
  for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Client/SimpleFrameworkTypes.m";
        *(i - 1) == 47;
        ++i)
  {
    id v10 = i;
LABEL_8:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_8;
  }
  unint64_t v12 = absTimeNS();
  if (v12 == -1) {
    double v13 = INFINITY;
  }
  else {
    double v13 = (double)v12 / 1000000000.0;
  }
  uint64_t v14 = tagDescription(*(void *)(*(void *)(a1[6] + 8) + 24), (void *)a1[5]);
  int v15 = 136315906;
  uint64_t v16 = v10;
  __int16 v17 = 1024;
  int v18 = 178;
  __int16 v19 = 2048;
  double v20 = v13;
  __int16 v21 = 2112;
  int v22 = v14;
  _os_log_impl(&dword_1B3B4B000, v9, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: adding %@ to tag map", (uint8_t *)&v15, 0x26u);

LABEL_13:
}

- (void)cancelNotification:(AWNotification_s *)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__AWAttentionAwarenessClientConfig_cancelNotification___block_invoke;
  v4[3] = &unk_1E606AB88;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

void __55__AWAttentionAwarenessClientConfig_cancelNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:v2];
  [v3 removeObjectForKey:v4];

  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 32);
  id v6 = [NSNumber numberWithUnsignedInteger:v2];
  [v5 removeObjectForKey:v6];
}

- (AWNotification_s)notifySupportedEventsChangedWithQueue:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__AWAttentionAwarenessClientConfig_notifySupportedEventsChangedWithQueue_block___block_invoke;
  v13[3] = &unk_1E606A8C0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v13);
  v11 = (AWNotification_s *)v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __80__AWAttentionAwarenessClientConfig_notifySupportedEventsChangedWithQueue_block___block_invoke(void *a1)
{
  uint64_t v2 = ++CARColorFilterIntensityBlueYellowKey_block_invoke_counter;
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void **)(a1[4] + 24);
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:CARColorFilterIntensityBlueYellowKey_block_invoke_counter];
  [v4 setObject:v3 forKeyedSubscript:v5];

  id v6 = (void *)MEMORY[0x1B3EC18C0](a1[6]);
  id v7 = *(void **)(a1[4] + 32);
  v8 = [NSNumber numberWithUnsignedInteger:v2];
  [v7 setObject:v6 forKeyedSubscript:v8];

  *(void *)(*(void *)(a1[7] + 8) + 24) = v2;
}

- (void)updateState:(BOOL)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_supportedEventsValid = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __48__AWAttentionAwarenessClientConfig_updateState___block_invoke;
  v21[3] = &unk_1E606AB10;
  BOOL v22 = a3;
  v21[4] = self;
  uint64_t v5 = +[AWServiceManager invokeWithService:v21];
  if (v5)
  {
    if (currentLogLevel >= 3)
    {
      id v6 = _AALog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        unint64_t v15 = absTimeNS();
        if (v15 == -1) {
          double v16 = INFINITY;
        }
        else {
          double v16 = (double)v15 / 1000000000.0;
        }
        *(_DWORD *)buf = 134218242;
        double v25 = v16;
        __int16 v26 = 2112;
        uint64_t v27 = v5;
        _os_log_error_impl(&dword_1B3B4B000, v6, OS_LOG_TYPE_ERROR, "%13.5f: failed get supported events: %@", buf, 0x16u);
      }
    }
    self->_supportedEventsValid = 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = self->_notifyQueues;
  uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        double v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->_notifyQueues, "objectForKeyedSubscript:", v12, (void)v17);
        id v14 = [(NSMutableDictionary *)self->_notifyBlocks objectForKeyedSubscript:v12];
        dispatch_async(v13, v14);
      }
      uint64_t v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v9);
  }
}

uint64_t __48__AWAttentionAwarenessClientConfig_updateState___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__AWAttentionAwarenessClientConfig_updateState___block_invoke_2;
  v3[3] = &unk_1E606A898;
  char v4 = *(unsigned char *)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  [a2 getSupportedEventsWithReply:v3];
  return 0;
}

void __48__AWAttentionAwarenessClientConfig_updateState___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 40))
  {
    if (currentLogLevel == 5)
    {
      char v4 = _AALog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v5 = absTimeNS();
        if (v5 == -1) {
          double v6 = INFINITY;
        }
        else {
          double v6 = (double)v5 / 1000000000.0;
        }
        v11 = getEventMaskDescription(*(void *)(*(void *)(a1 + 32) + 40));
        uint64_t v12 = getEventMaskDescription(a2);
        int v16 = 134218498;
        double v17 = v6;
        __int16 v18 = 2112;
        *(void *)long long v19 = v11;
        *(_WORD *)&v19[8] = 2112;
        *(void *)&v19[10] = v12;
        double v13 = "%13.5f: supported event mask changed from %@ to %@";
        id v14 = v4;
        uint32_t v15 = 32;
LABEL_20:
        _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, v15);
      }
LABEL_21:

      goto LABEL_22;
    }
    if (currentLogLevel >= 6)
    {
      char v4 = _AALog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Client/SimpleFrameworkTypes.m";
        for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Client/SimpleFrameworkTypes.m"; ; ++i)
        {
          if (*(i - 1) == 47)
          {
            id v7 = i;
          }
          else if (!*(i - 1))
          {
            unint64_t v9 = absTimeNS();
            if (v9 == -1) {
              double v10 = INFINITY;
            }
            else {
              double v10 = (double)v9 / 1000000000.0;
            }
            v11 = getEventMaskDescription(*(void *)(*(void *)(a1 + 32) + 40));
            uint64_t v12 = getEventMaskDescription(a2);
            int v16 = 136316162;
            double v17 = *(double *)&v7;
            __int16 v18 = 1024;
            *(_DWORD *)long long v19 = 128;
            *(_WORD *)&v19[4] = 2048;
            *(double *)&v19[6] = v10;
            *(_WORD *)&v19[14] = 2112;
            *(void *)&v19[16] = v11;
            __int16 v20 = 2112;
            __int16 v21 = v12;
            double v13 = "%30s:%-4d: %13.5f: supported event mask changed from %@ to %@";
            id v14 = v4;
            uint32_t v15 = 48;
            goto LABEL_20;
          }
        }
      }
      goto LABEL_21;
    }
  }
LABEL_22:
  *(void *)(*(void *)(a1 + 32) + 40) = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
}

- (unint64_t)supportedEvents
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__AWAttentionAwarenessClientConfig_supportedEvents__block_invoke;
  v5[3] = &unk_1E606AB38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__AWAttentionAwarenessClientConfig_supportedEvents__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t result = *(void *)(a1 + 32);
  if (!*(unsigned char *)(result + 48))
  {
    int v3 = 5;
    while (1)
    {
      uint64_t result = *(void *)(a1 + 32);
      if (*(unsigned char *)(result + 48)) {
        break;
      }
      [(id)result updateState:1];
      if (!--v3)
      {
        uint64_t result = *(void *)(a1 + 32);
        if (*(unsigned char *)(result + 48)) {
          BOOL v4 = 1;
        }
        else {
          BOOL v4 = currentLogLevel < 3;
        }
        if (!v4)
        {
          unint64_t v5 = _AALog();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            unint64_t v6 = absTimeNS();
            if (v6 == -1) {
              double v7 = INFINITY;
            }
            else {
              double v7 = (double)v6 / 1000000000.0;
            }
            uint64_t v8 = getEventMaskDescription(*(void *)(*(void *)(a1 + 32) + 40));
            int v9 = 134218242;
            double v10 = v7;
            __int16 v11 = 2112;
            uint64_t v12 = v8;
            _os_log_error_impl(&dword_1B3B4B000, v5, OS_LOG_TYPE_ERROR, "%13.5f: returning invalid supportedEvents %@", (uint8_t *)&v9, 0x16u);
          }
          uint64_t result = *(void *)(a1 + 32);
        }
        break;
      }
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(result + 40);
  return result;
}

- (void)dealloc
{
  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)AWAttentionAwarenessClientConfig;
  [(AWAttentionAwarenessClientConfig *)&v3 dealloc];
}

- (AWAttentionAwarenessClientConfig)init
{
  v21.receiver = self;
  v21.super_class = (Class)AWAttentionAwarenessClientConfig;
  uint64_t v2 = [(AWAttentionAwarenessClientConfig *)&v21 init];
  if (v2)
  {
    uint64_t v3 = awQueue(1);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    unint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    notifyQueues = v2->_notifyQueues;
    v2->_notifyQueues = v5;

    double v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    notifyBlocks = v2->_notifyBlocks;
    v2->_notifyBlocks = v7;

    int v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tagMap = v2->_tagMap;
    v2->_tagMap = v9;

    __int16 v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tagRefCount = v2->_tagRefCount;
    v2->_tagRefCount = v11;

    v2->_nextTagIndex = 1;
    objc_initWeak(&location, v2);
    uint64_t v13 = v2->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __40__AWAttentionAwarenessClientConfig_init__block_invoke;
    handler[3] = &unk_1E606A870;
    objc_copyWeak(&v19, &location);
    notify_register_dispatch("com.apple.AttentionAwareness.SupportedEventsChanged", &v2->_notifyToken, v13, handler);
    id v14 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__AWAttentionAwarenessClientConfig_init__block_invoke_2;
    block[3] = &unk_1E606AC70;
    double v17 = v2;
    dispatch_sync(v14, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __40__AWAttentionAwarenessClientConfig_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateState:1];
}

uint64_t __40__AWAttentionAwarenessClientConfig_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateState:0];
}

uint64_t __54__AWAttentionAwarenessClientConfig_sharedClientConfig__block_invoke()
{
  v0 = objc_alloc_init(AWAttentionAwarenessClientConfig);
  uint64_t v1 = sharedClientConfig_clientConfig;
  sharedClientConfig_clientConfig = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end