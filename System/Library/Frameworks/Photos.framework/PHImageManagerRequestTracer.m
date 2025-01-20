@interface PHImageManagerRequestTracer
+ (id)_currentTimestampString;
+ (id)recentMessagesSummaryForAssetUUID:(id)a3;
+ (int)requestIDFromTaskIdentifier:(id)a3;
+ (void)_inq_recordRequestID:(int64_t)a3;
+ (void)_inq_trimToMostRecentImageManagerMessages;
+ (void)initialize;
+ (void)registerRequestID:(int)a3 withAssetUUID:(id)a4;
+ (void)setTracingDisabled:(BOOL)a3;
+ (void)traceMessageForRequestID:(int)a3 message:(id)a4;
@end

@implementation PHImageManagerRequestTracer

+ (void)setTracingDisabled:(BOOL)a3
{
  s_tracingDisabled = a3;
}

+ (id)recentMessagesSummaryForAssetUUID:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PHImageManagerRequestTracer.m", 178, @"Invalid parameter not satisfying: %@", @"assetUUID" object file lineNumber description];
  }
  v6 = [MEMORY[0x1E4F28E78] string];
  v7 = s_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PHImageManagerRequestTracer_recentMessagesSummaryForAssetUUID___block_invoke;
  block[3] = &unk_1E5848DF0;
  id v15 = v5;
  id v8 = v6;
  id v16 = v8;
  id v9 = v5;
  dispatch_sync(v7, block);
  v10 = v16;
  id v11 = v8;

  return v11;
}

void __65__PHImageManagerRequestTracer_recentMessagesSummaryForAssetUUID___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v4 = [(id)s_requestIDsByAssetUUID objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        v10 = [(id)s_mostRecentTraceDateByRequestID objectForKeyedSubscript:v9];
        [v2 setObject:v9 forKeyedSubscript:v10];
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v6);
  }

  [v3 sortUsingSelector:sel_compare_];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v3;
  uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(obj);
        }
        v14 = [v2 objectForKeyedSubscript:*(void *)(*((void *)&v26 + 1) + 8 * j)];
        [*(id *)(a1 + 40) appendFormat:@"ID: %@\n", v14];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v15 = [(id)s_messagesByRequestID objectForKeyedSubscript:v14];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v34 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v23;
          do
          {
            for (uint64_t k = 0; k != v17; ++k)
            {
              if (*(void *)v23 != v18) {
                objc_enumerationMutation(v15);
              }
              [*(id *)(a1 + 40) appendString:*(void *)(*((void *)&v22 + 1) + 8 * k)];
              [*(id *)(a1 + 40) appendString:@"\n"];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v34 count:16];
          }
          while (v17);
        }

        [*(id *)(a1 + 40) appendString:@"\n"];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v12);
  }
}

+ (void)traceMessageForRequestID:(int)a3 message:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PHImageManagerRequestTracer.m", 154, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];
  }
  v20 = &v21;
  id v8 = NSString;
  uint64_t v9 = [(id)objc_opt_class() _currentTimestampString];
  v10 = [v8 stringWithFormat:@"%@: ", v9];

  uint64_t v11 = (void *)[[NSString alloc] initWithFormat:v7 arguments:&v21];
  uint64_t v12 = [v10 stringByAppendingString:v11];

  v13 = s_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PHImageManagerRequestTracer_traceMessageForRequestID_message___block_invoke;
  block[3] = &unk_1E5846BF0;
  int v19 = a3;
  id v17 = v12;
  id v18 = a1;
  id v14 = v12;
  dispatch_async(v13, block);
}

void __64__PHImageManagerRequestTracer_traceMessageForRequestID_message___block_invoke(uint64_t a1)
{
  id v2 = (void *)s_messagesByRequestID;
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  id v6 = [v2 objectForKeyedSubscript:v3];

  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4 = (void *)s_messagesByRequestID;
    uint64_t v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
    [v4 setObject:v6 forKeyedSubscript:v5];
  }
  [v6 addObject:*(void *)(a1 + 32)];
  objc_msgSend(*(id *)(a1 + 40), "_inq_recordRequestID:", *(int *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "_inq_trimToMostRecentImageManagerMessages");
}

+ (void)registerRequestID:(int)a3 withAssetUUID:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PHImageManagerRequestTracer.m", 142, @"Invalid parameter not satisfying: %@", @"assetUUID" object file lineNumber description];
  }
  id v8 = s_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PHImageManagerRequestTracer_registerRequestID_withAssetUUID___block_invoke;
  block[3] = &unk_1E5846BC8;
  id v12 = v7;
  int v13 = a3;
  id v9 = v7;
  dispatch_async(v8, block);
}

void __63__PHImageManagerRequestTracer_registerRequestID_withAssetUUID___block_invoke(uint64_t a1)
{
  id v3 = [(id)s_requestIDsByAssetUUID objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (!v3)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_msgSend((id)s_requestIDsByAssetUUID, "setObject:forKeyedSubscript:");
  }
  id v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  [v3 addObject:v2];
}

+ (int)requestIDFromTaskIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 length]
    && (uint64_t v4 = [v3 rangeOfString:@"-" options:2], v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    id v6 = [v3 substringFromIndex:v4];
    int v5 = [v6 integerValue];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    s_tracingDisabled = 0;
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v3 = (void *)s_requestIDsByAssetUUID;
    s_requestIDsByAssetUUID = (uint64_t)v2;

    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int v5 = (void *)s_messagesByRequestID;
    s_messagesByRequestID = (uint64_t)v4;

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = (void *)s_mostRecentTraceDateByRequestID;
    s_mostRecentTraceDateByRequestID = (uint64_t)v6;

    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    attr = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.photos.pdimagemanagertracingqueue", attr);
    v10 = (void *)s_queue;
    s_queue = (uint64_t)v9;
  }
}

+ (void)_inq_trimToMostRecentImageManagerMessages
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)[(id)s_mostRecentTraceDateByRequestID count] >= 0x65)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v30 = 0;
    long long v31 = (id *)&v30;
    uint64_t v32 = 0x3032000000;
    long long v33 = __Block_byref_object_copy__33405;
    v34 = __Block_byref_object_dispose__33406;
    id v35 = 0;
    id v3 = [(id)s_mostRecentTraceDateByRequestID allValues];
    id v4 = [v3 sortedArrayUsingSelector:sel_compare_];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v6)
    {
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v27;
LABEL_4:
      uint64_t v9 = 0;
      uint64_t v10 = 4 - v7;
      v7 += v6;
      while (1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_storeStrong(v31 + 5, *(id *)(*((void *)&v26 + 1) + 8 * v9));
        if (v10 == v9) {
          break;
        }
        if (v6 == ++v9)
        {
          uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v36 count:16];
          if (v6) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    uint64_t v11 = (void *)s_mostRecentTraceDateByRequestID;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __72__PHImageManagerRequestTracer__inq_trimToMostRecentImageManagerMessages__block_invoke;
    v23[3] = &unk_1E5846B78;
    long long v25 = &v30;
    id v12 = v2;
    id v24 = v12;
    [v11 enumerateKeysAndObjectsUsingBlock:v23];
    [(id)s_messagesByRequestID removeObjectsForKeys:v12];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v14 = (void *)s_requestIDsByAssetUUID;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    int v19 = __72__PHImageManagerRequestTracer__inq_trimToMostRecentImageManagerMessages__block_invoke_2;
    v20 = &unk_1E5846BA0;
    id v15 = v12;
    id v21 = v15;
    id v16 = v13;
    id v22 = v16;
    [v14 enumerateKeysAndObjectsUsingBlock:&v17];
    objc_msgSend((id)s_mostRecentTraceDateByRequestID, "removeObjectsForKeys:", v15, v17, v18, v19, v20);
    [(id)s_requestIDsByAssetUUID removeObjectsForKeys:v16];

    _Block_object_dispose(&v30, 8);
  }
}

void __72__PHImageManagerRequestTracer__inq_trimToMostRecentImageManagerMessages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 compare:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)] == -1) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __72__PHImageManagerRequestTracer__inq_trimToMostRecentImageManagerMessages__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  [v6 removeObjectsInArray:v5];
  uint64_t v7 = [v6 count];

  if (!v7) {
    [*(id *)(a1 + 40) addObject:v8];
  }
}

+ (void)_inq_recordRequestID:(int64_t)a3
{
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = (void *)s_mostRecentTraceDateByRequestID;
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

+ (id)_currentTimestampString
{
  if (_currentTimestampString_s_onceToken != -1) {
    dispatch_once(&_currentTimestampString_s_onceToken, &__block_literal_global_33410);
  }
  id v2 = (void *)_currentTimestampString_s_formatter;
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [v2 stringFromDate:v3];

  return v4;
}

uint64_t __54__PHImageManagerRequestTracer__currentTimestampString__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_currentTimestampString_s_formatter;
  _currentTimestampString_s_formatter = (uint64_t)v0;

  id v2 = (void *)_currentTimestampString_s_formatter;

  return [v2 setDateFormat:@"yyyy-MM-dd' 'HH:mm:ss.SS"];
}

@end