@interface BRCThrottle
+ (int64_t)throttleHashBytes:(void *)a3 length:(unint64_t)a4;
+ (int64_t)throttleHashFormat:(id)a3;
- (BRCThrottle)initWithName:(id)a3 andParameters:(id)a4;
- (int64_t)nsecsToNextRetry:(int64_t)a3 now:(int64_t)a4 increment:(BOOL)a5;
- (void)_cleanupStaleCounters:(int64_t)a3;
- (void)incrementRetryCount:(int64_t)a3;
- (void)reset;
@end

@implementation BRCThrottle

- (BRCThrottle)initWithName:(id)a3 andParameters:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)BRCThrottle;
  v4 = [(BRCThrottleBase *)&v10 initWithName:a3 andParameters:a4];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:32];
    retryCounters = v4->_retryCounters;
    v4->_retryCounters = (NSMutableDictionary *)v5;

    v7 = [[BRCMinHeap alloc] initWithComparator:&__block_literal_global_18];
    retryHeap = v4->_retryHeap;
    v4->_retryHeap = v7;
  }
  return v4;
}

uint64_t __42__BRCThrottle_initWithName_andParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 latestRetry];
  uint64_t v6 = [v4 latestRetry];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (void)_cleanupStaleCounters:(int64_t)a3
{
  int64_t nsecsBeforeForgettingCounter = self->super._nsecsBeforeForgettingCounter;
  uint64_t v6 = [(BRCMinHeap *)self->_retryHeap firstObject];
  if (v6)
  {
    uint64_t v7 = a3 - nsecsBeforeForgettingCounter;
    while (1)
    {
      id v11 = v6;
      if ([v6 latestRetry] >= v7
        && [(BRCMinHeap *)self->_retryHeap count] <= self->super._maximumElementCount)
      {
        break;
      }
      [(BRCMinHeap *)self->_retryHeap removeFirstObject];
      retryCounters = self->_retryCounters;
      v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "throttleHash"));
      [(NSMutableDictionary *)retryCounters removeObjectForKey:v9];

      uint64_t v10 = [(BRCMinHeap *)self->_retryHeap firstObject];

      uint64_t v6 = (void *)v10;
      if (!v10) {
        goto LABEL_9;
      }
    }
    uint64_t v6 = v11;
LABEL_9:
  }
}

- (void)incrementRetryCount:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  id v4 = [NSNumber numberWithLongLong:a3];
  uint64_t v5 = [(NSMutableDictionary *)obj->_retryCounters objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    [(BRCRetryCounter *)v5 incrementRetry];
    [(BRCMinHeap *)obj->_retryHeap objectWeightChanged:v6];
  }
  else
  {
    uint64_t v6 = [[BRCRetryCounter alloc] initWithThrottleHash:a3];
    [(NSMutableDictionary *)obj->_retryCounters setObject:v6 forKeyedSubscript:v4];
    [(BRCMinHeap *)obj->_retryHeap addObject:v6];
  }

  objc_sync_exit(obj);
}

- (int64_t)nsecsToNextRetry:(int64_t)a3 now:(int64_t)a4 increment:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v8 = self;
  objc_sync_enter(v8);
  [(BRCThrottle *)v8 _cleanupStaleCounters:a4];
  retryCounters = v8->_retryCounters;
  uint64_t v10 = [NSNumber numberWithLongLong:a3];
  id v11 = [(NSMutableDictionary *)retryCounters objectForKeyedSubscript:v10];

  [v11 schedule];
  int v22 = [v11 retryCount];
  objc_sync_exit(v8);

  int64_t v12 = -[BRCThrottleBase nsecsToNextRetry:retryCount:now:](v8, "nsecsToNextRetry:retryCount:now:", [v11 latestRetry], &v22, a4);
  LODWORD(v10) = v22;
  if (v10 > [v11 retryCount] && v5) {
    [(BRCThrottle *)v8 incrementRetryCount:a3];
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = brc_bread_crumbs();
    v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      name = v8->super._name;
      *(_DWORD *)buf = 138413058;
      v24 = name;
      __int16 v25 = 2048;
      int64_t v26 = a3;
      __int16 v27 = 1024;
      *(_DWORD *)v28 = v22;
      *(_WORD *)&v28[4] = 2112;
      *(void *)&v28[6] = v14;
      v17 = "[DEBUG] gave up on %@/%llx (retry-count:%u)%@";
      v18 = v15;
      uint32_t v19 = 38;
LABEL_14:
      _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, v17, buf, v19);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (v12 >= 100000000)
  {
    v14 = brc_bread_crumbs();
    v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v21 = v8->super._name;
      *(_DWORD *)buf = 138413314;
      v24 = v21;
      __int16 v25 = 2048;
      int64_t v26 = a3;
      __int16 v27 = 2048;
      *(void *)v28 = v12 / 0xF4240uLL;
      *(_WORD *)&v28[8] = 1024;
      *(_DWORD *)&v28[10] = v22;
      __int16 v29 = 2112;
      v30 = v14;
      v17 = "[DEBUG] backing off %@/%llx for %llu milliseconds (retry-count:%u)%@";
      v18 = v15;
      uint32_t v19 = 48;
      goto LABEL_14;
    }
LABEL_11:
  }
  return v12;
}

- (void)reset
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  [(BRCMinHeap *)v2->_retryHeap removeAllObjects];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(NSMutableDictionary *)v2->_retryCounters allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        v8 = -[BRCRetryCounter initWithThrottleHash:]([BRCRetryCounter alloc], "initWithThrottleHash:", [v7 unsignedLongLongValue]);
        [(NSMutableDictionary *)v2->_retryCounters setObject:v8 forKeyedSubscript:v7];
        [(BRCMinHeap *)v2->_retryHeap addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

+ (int64_t)throttleHashFormat:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v35 = 0;
  int v34 = 0;
  v32 = 0;
  v33 = 0;
  uint64_t v31 = 0;
  memset(&c, 0, sizeof(c));
  CC_SHA1_Init(&c);
  id v4 = v3;
  uint64_t v5 = (unsigned __int8 *)[v4 UTF8String];
  v35 = (const char **)&v38;
  int v6 = *v5;
  if (*v5)
  {
    uint64_t v7 = v5;
    while (1)
    {
      for (i = 0; v6; int v6 = v7[++i])
      {
        if (v6 == 37) {
          break;
        }
      }
      if (i)
      {
        CC_SHA1_Update(&c, v7, i);
        int v6 = v7[i];
      }
      if (!v6) {
        goto LABEL_40;
      }
      for (uint64_t j = 0; ; ++j)
      {
        int v10 = (char)v7[i + 1 + j];
        if (v10 != 108) {
          break;
        }
      }
      if (v10 > 111)
      {
        switch(v7[i + 1 + j])
        {
          case 'p':
            long long v11 = v35++;
            uint64_t v31 = *v11;
            long long v12 = (const char *)&v31;
            goto LABEL_23;
          case 's':
            v17 = v35++;
            v18 = *v17;
            goto LABEL_26;
          case 'u':
          case 'x':
            goto LABEL_18;
          default:
            goto LABEL_31;
        }
      }
      if (v10 == 64)
      {
        uint32_t v19 = (id *)v35++;
        v18 = (const char *)[*v19 UTF8String];
LABEL_26:
        if (v18) {
          v20 = v18;
        }
        else {
          v20 = "NULL";
        }
        if (v18) {
          CC_LONG v14 = strlen(v18);
        }
        else {
          CC_LONG v14 = 4;
        }
        long long v12 = v20;
        goto LABEL_38;
      }
      if (v10 != 100 && v10 != 105)
      {
LABEL_31:
        v21 = brc_bread_crumbs();
        int v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v21;
          _os_log_fault_impl(&dword_1D353B000, v22, OS_LOG_TYPE_FAULT, "[CRIT] API MISUSE: unhandled format specifier%@", buf, 0xCu);
        }

        v23 = brc_bread_crumbs();
        v24 = brc_default_log();
        if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
        {
          int v27 = (char)v7[i + 2 + j];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v27;
          *(_WORD *)&buf[8] = 2112;
          *(void *)&buf[10] = v23;
          _os_log_error_impl(&dword_1D353B000, v24, (os_log_type_t)0x90u, "[ERROR] unhandled format specifier %%%c\n%@", buf, 0x12u);
        }

        goto LABEL_39;
      }
LABEL_18:
      if (j == 1) {
        break;
      }
      if (j)
      {
        v16 = v35++;
        v32 = *v16;
        long long v12 = (const char *)&v32;
        goto LABEL_23;
      }
      v13 = v35++;
      int v34 = *(_DWORD *)v13;
      long long v12 = (const char *)&v34;
      CC_LONG v14 = 4;
LABEL_38:
      CC_SHA1_Update(&c, v12, v14);
LABEL_39:
      __int16 v25 = &v7[i + j];
      int v26 = v25[2];
      uint64_t v7 = v25 + 2;
      int v6 = v26;
      if (!v26) {
        goto LABEL_40;
      }
    }
    v15 = v35++;
    v33 = *v15;
    long long v12 = (const char *)&v33;
LABEL_23:
    CC_LONG v14 = 8;
    goto LABEL_38;
  }
LABEL_40:
  CC_SHA1_Final(buf, &c);
  int64_t v28 = *(void *)buf;

  return v28;
}

+ (int64_t)throttleHashBytes:(void *)a3 length:(unint64_t)a4
{
  CC_LONG v4 = a4;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, a3, v4);
  CC_SHA1_Final(md, &v7);
  return *(void *)md;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryHeap, 0);

  objc_storeStrong((id *)&self->_retryCounters, 0);
}

@end