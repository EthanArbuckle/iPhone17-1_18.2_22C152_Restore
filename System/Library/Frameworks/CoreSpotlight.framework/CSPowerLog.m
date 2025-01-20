@interface CSPowerLog
+ (id)keyNameForOperation:(int64_t)a3;
+ (id)sharedInstance;
- (BOOL)onBattery;
- (CSPowerLog)init;
- (CSPowerLog)logWithBundleID:(id)a3 indexOperation:(int64_t)a4 itemCount:(unint64_t)a5 code:(int64_t)a6;
- (CSPowerLog)logWithBundleID:(id)a3 indexOperation:(int64_t)a4 itemCount:(unint64_t)a5 reason:(id)a6;
- (NSDate)endFlushDate;
- (NSDate)startFlushDate;
- (NSMutableDictionary)operationsByBundleID;
- (NSMutableDictionary)reasonedOperationsByBundleID;
- (unint64_t)cachedCount;
- (void)_addToDictionary:(int64_t)a3 bundleID:(id)a4 itemCount:(unint64_t)a5 code:(int64_t)a6;
- (void)_addToDictionary:(int64_t)a3 bundleID:(id)a4 itemCount:(unint64_t)a5 reason:(id)a6;
- (void)flush;
- (void)flushToPowerLog_locked_and_unlock;
- (void)setCachedCount:(unint64_t)a3;
- (void)setEndFlushDate:(id)a3;
- (void)setOnBattery:(BOOL)a3;
- (void)setOperationsByBundleID:(id)a3;
- (void)setReasonedOperationsByBundleID:(id)a3;
- (void)setStartFlushDate:(id)a3;
- (void)updateDictionaryAndUnlock:(unint64_t)a3 cacheCount:(int64_t)a4 keyName:(id)a5 operationDictionary:(id)a6;
- (void)updateDictionaryAndUnlock:(unint64_t)a3 keyName:(id)a4 operationDictionary:(id)a5;
@end

@implementation CSPowerLog

- (CSPowerLog)logWithBundleID:(id)a3 indexOperation:(int64_t)a4 itemCount:(unint64_t)a5 code:(int64_t)a6
{
  if (a3)
  {
    if (a5) {
      return (CSPowerLog *)[(CSPowerLog *)self _addToDictionary:a4 bundleID:a3 itemCount:a5 code:a6];
    }
  }
  return self;
}

- (void)_addToDictionary:(int64_t)a3 bundleID:(id)a4 itemCount:(unint64_t)a5 code:(int64_t)a6
{
  id v20 = a4;
  v10 = +[CSDeviceListener sharedListener];
  int v11 = [v10 onBattery];

  if (v11 != [(CSPowerLog *)self onBattery]) {
    [(CSPowerLog *)self flush];
  }
  v12 = [(id)objc_opt_class() keyNameForOperation:a3];
  v13 = [NSNumber numberWithInteger:a6];
  os_unfair_lock_lock((os_unfair_lock_t)&logLock);
  v14 = [(CSPowerLog *)self operationsByBundleID];
  id v15 = [v14 objectForKeyedSubscript:v13];

  if (!v15)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v16 = [(CSPowerLog *)self operationsByBundleID];
    [v16 setObject:v15 forKeyedSubscript:v13];
  }
  v17 = [v15 objectForKeyedSubscript:v20];

  if (!v17)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v15 setObject:v18 forKey:v20];
  }
  v19 = [v15 objectForKeyedSubscript:v20];
  [(CSPowerLog *)self updateDictionaryAndUnlock:a5 keyName:v12 operationDictionary:v19];
}

- (void)updateDictionaryAndUnlock:(unint64_t)a3 keyName:(id)a4 operationDictionary:(id)a5
{
}

- (NSMutableDictionary)operationsByBundleID
{
  return self->_operationsByBundleID;
}

uint64_t __28__CSPowerLog_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v1;

  return atexit_b(&__block_literal_global_33);
}

- (CSPowerLog)init
{
  v9.receiver = self;
  v9.super_class = (Class)CSPowerLog;
  v2 = [(CSPowerLog *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(CSPowerLog *)v2 setOperationsByBundleID:v3];

    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(CSPowerLog *)v2 setReasonedOperationsByBundleID:v4];

    id v5 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    [(CSPowerLog *)v2 setStartFlushDate:v5];

    id v6 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    [(CSPowerLog *)v2 setEndFlushDate:v6];

    [(CSPowerLog *)v2 setCachedCount:0];
    v7 = +[CSDeviceListener sharedListener];
    -[CSPowerLog setOnBattery:](v2, "setOnBattery:", [v7 onBattery]);
  }
  return v2;
}

- (void)setStartFlushDate:(id)a3
{
}

- (void)setReasonedOperationsByBundleID:(id)a3
{
}

- (void)setOperationsByBundleID:(id)a3
{
}

- (void)setEndFlushDate:(id)a3
{
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__CSPowerLog_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;

  return v2;
}

- (CSPowerLog)logWithBundleID:(id)a3 indexOperation:(int64_t)a4 itemCount:(unint64_t)a5 reason:(id)a6
{
  if (a3)
  {
    if (a5) {
      return (CSPowerLog *)[(CSPowerLog *)self _addToDictionary:a4 bundleID:a3 itemCount:a5 reason:a6];
    }
  }
  return self;
}

- (void)_addToDictionary:(int64_t)a3 bundleID:(id)a4 itemCount:(unint64_t)a5 reason:(id)a6
{
  id v20 = a4;
  v10 = (__CFString *)a6;
  int v11 = +[CSDeviceListener sharedListener];
  int v12 = [v11 onBattery];

  if (v12 != [(CSPowerLog *)self onBattery]) {
    [(CSPowerLog *)self flush];
  }
  if ((unint64_t)[(__CFString *)v10 length] < 0x21)
  {
    if (v10) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  v10 = @"Unknown";
LABEL_7:
  v13 = [(id)objc_opt_class() keyNameForOperation:a3];
  os_unfair_lock_lock((os_unfair_lock_t)&logLock);
  v14 = [(CSPowerLog *)self reasonedOperationsByBundleID];
  id v15 = [v14 objectForKeyedSubscript:v20];

  if (!v15)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v16 = [(CSPowerLog *)self reasonedOperationsByBundleID];
    [v16 setObject:v15 forKeyedSubscript:v20];
  }
  v17 = [v15 objectForKeyedSubscript:v10];
  if (!v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v19 = [NSNumber numberWithUnsignedInteger:a5];
    v17 = objc_msgSend(v18, "initWithObjectsAndKeys:", v19, v13, 0);

    [v15 setObject:v17 forKeyedSubscript:v10];
  }
  [(CSPowerLog *)self updateDictionaryAndUnlock:a5 cacheCount:1 keyName:v13 operationDictionary:v17];
}

- (NSMutableDictionary)reasonedOperationsByBundleID
{
  return self->_reasonedOperationsByBundleID;
}

- (void)updateDictionaryAndUnlock:(unint64_t)a3 cacheCount:(int64_t)a4 keyName:(id)a5 operationDictionary:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  int v12 = [v10 objectForKeyedSubscript:v11];
  v13 = NSNumber;
  id v20 = v12;
  if (v12) {
    a3 += [v12 unsignedIntegerValue];
  }
  v14 = [v13 numberWithUnsignedInteger:a3];
  [v10 setObject:v14 forKeyedSubscript:v11];

  id v15 = +[CSDeviceListener sharedListener];
  -[CSPowerLog setOnBattery:](self, "setOnBattery:", [v15 onBattery]);

  id v16 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  if ([(CSPowerLog *)self cachedCount] + a4 > 0x1388
    || ([(CSPowerLog *)self startFlushDate],
        v17 = objc_claimAutoreleasedReturnValue(),
        [v16 timeIntervalSinceDate:v17],
        double v19 = v18,
        v17,
        v19 >= 1800.0))
  {
    [(CSPowerLog *)self flushToPowerLog_locked_and_unlock];
  }
  else
  {
    [(CSPowerLog *)self setCachedCount:[(CSPowerLog *)self cachedCount] + a4];
    os_unfair_lock_unlock((os_unfair_lock_t)&logLock);
  }
}

- (unint64_t)cachedCount
{
  return self->_cachedCount;
}

- (void)setOnBattery:(BOOL)a3
{
  self->_onBattery = a3;
}

- (void)setCachedCount:(unint64_t)a3
{
  self->_cachedCount = a3;
}

- (BOOL)onBattery
{
  return self->_onBattery;
}

+ (id)keyNameForOperation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9) {
    return @"unknown";
  }
  else {
    return off_1E554CD60[a3 - 1];
  }
}

- (NSDate)startFlushDate
{
  return self->_startFlushDate;
}

uint64_t __28__CSPowerLog_sharedInstance__block_invoke_2()
{
  return [(id)sharedInstance_sharedInstance_1 flush];
}

- (void)flushToPowerLog_locked_and_unlock
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v39 = self;
  id obj = [(CSPowerLog *)self operationsByBundleID];
  uint64_t v34 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v34)
  {
    uint64_t v32 = *(void *)v50;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v50 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = v3;
        uint64_t v4 = *(void *)(*((void *)&v49 + 1) + 8 * v3);
        id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v6 = [(CSPowerLog *)v39 operationsByBundleID];
        v7 = [v6 objectForKeyedSubscript:v4];

        id v37 = v7;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v46;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v46 != v10) {
                objc_enumerationMutation(v37);
              }
              uint64_t v12 = *(void *)(*((void *)&v45 + 1) + 8 * v11);
              v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v4, @"reason", 0);
              v14 = [(CSPowerLog *)v39 operationsByBundleID];
              id v15 = [v14 objectForKeyedSubscript:v4];
              id v16 = [v15 objectForKeyedSubscript:v12];
              [v13 addEntriesFromDictionary:v16];

              [v5 setObject:v13 forKey:v12];
              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v37 countByEnumeratingWithState:&v45 objects:v54 count:16];
          }
          while (v9);
        }

        [v33 addObject:v5];
        uint64_t v3 = v35 + 1;
      }
      while (v35 + 1 != v34);
      uint64_t v34 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v34);
  }

  v17 = [(CSPowerLog *)v39 reasonedOperationsByBundleID];
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(CSPowerLog *)v39 setOperationsByBundleID:v18];

  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(CSPowerLog *)v39 setReasonedOperationsByBundleID:v19];

  id v38 = [(CSPowerLog *)v39 startFlushDate];
  v36 = [(CSPowerLog *)v39 endFlushDate];
  -[CSPowerLog setStartFlushDate:](v39, "setStartFlushDate:");
  id v20 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  [(CSPowerLog *)v39 setEndFlushDate:v20];

  [(CSPowerLog *)v39 setCachedCount:0];
  os_unfair_lock_unlock((os_unfair_lock_t)&logLock);
  if ([v17 count] || v33)
  {
    if ([v33 count])
    {
      v40 = v17;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v21 = v33;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v53 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v42;
        do
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v42 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v41 + 1) + 8 * v25);
            if (PLShouldLogRegisteredEvent())
            {
              [v26 setObject:v38 forKeyedSubscript:@"timestamp"];
              [v26 setObject:v36 forKeyedSubscript:@"timestampEnd"];
              v27 = [MEMORY[0x1E4F28F80] processInfo];
              v28 = [v27 processName];
              [v26 setObject:v28 forKeyedSubscript:@"processName"];

              PLLogRegisteredEvent();
            }
            ++v25;
          }
          while (v23 != v25);
          uint64_t v23 = [v21 countByEnumeratingWithState:&v41 objects:v53 count:16];
        }
        while (v23);
      }

      v17 = v40;
    }
    if ([v17 count] && PLShouldLogRegisteredEvent())
    {
      [v17 setObject:v38 forKeyedSubscript:@"timestamp"];
      [v17 setObject:v36 forKeyedSubscript:@"timestampEnd"];
      v29 = [MEMORY[0x1E4F28F80] processInfo];
      v30 = [v29 processName];
      [v17 setObject:v30 forKeyedSubscript:@"processName"];

      PLLogRegisteredEvent();
    }
  }
}

- (void)flush
{
  os_unfair_lock_lock((os_unfair_lock_t)&logLock);

  [(CSPowerLog *)self flushToPowerLog_locked_and_unlock];
}

- (NSDate)endFlushDate
{
  return self->_endFlushDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endFlushDate, 0);
  objc_storeStrong((id *)&self->_startFlushDate, 0);
  objc_storeStrong((id *)&self->_reasonedOperationsByBundleID, 0);

  objc_storeStrong((id *)&self->_operationsByBundleID, 0);
}

@end