@interface BKHIDEventSenderCache
- (BKHIDEventSenderCache)initWithQueue:(id)a3;
- (NSString)description;
- (id)senderInfoForSenderID:(unint64_t)a3;
- (void)addSenderInfo:(id)a3;
- (void)addSenderInfo:(id)a3 forSenderID:(unint64_t)a4;
- (void)removeSenderInfo:(id)a3;
- (void)serviceDidDisappear:(id)a3;
@end

@implementation BKHIDEventSenderCache

- (id)senderInfoForSenderID:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  senderIDToSenderInfo = self->_senderIDToSenderInfo;
  v7 = [NSNumber numberWithUnsignedLongLong:a3];
  v8 = [(NSMutableDictionary *)senderIDToSenderInfo objectForKey:v7];

  os_unfair_lock_unlock(p_lock);
  if (!v8)
  {
    v9 = BKLogHID();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      unint64_t v12 = a3;
      _os_log_impl(&dword_1CFDE2000, v9, OS_LOG_TYPE_DEFAULT, "unknown senderID: 0x%llX", (uint8_t *)&v11, 0xCu);
    }

    v8 = +[BKHIDUnknownSender unknownSenderInfo];
  }

  return v8;
}

void __42__BKHIDEventSenderCache_removeSenderInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    unint64_t v11 = 0x1E4F28000uLL;
    do
    {
      uint64_t v12 = 0;
      uint64_t v25 = v9;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        if (*(id *)(*((void *)&v26 + 1) + 8 * v12) == v6)
        {
          uint64_t v13 = [v5 unsignedLongLongValue];
          v14 = BKLogHID();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = objc_opt_class();
            *(_DWORD *)buf = 134218242;
            uint64_t v31 = v13;
            __int16 v32 = 2114;
            v33 = v15;
            uint64_t v16 = v10;
            id v17 = v6;
            id v18 = v7;
            uint64_t v19 = a1;
            id v20 = v5;
            unint64_t v21 = v11;
            id v22 = v15;
            _os_log_impl(&dword_1CFDE2000, v14, OS_LOG_TYPE_DEFAULT, "purge sender info for senderID:%llX -- %{public}@", buf, 0x16u);

            unint64_t v11 = v21;
            id v5 = v20;
            a1 = v19;
            id v7 = v18;
            id v6 = v17;
            uint64_t v10 = v16;
            uint64_t v9 = v25;
          }

          v23 = *(void **)(*(void *)(a1 + 40) + 24);
          v24 = [*(id *)(v11 + 3792) numberWithUnsignedLongLong:v13];
          [v23 removeObjectForKey:v24];
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v9);
  }
}

- (void)addSenderInfo:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    unint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"senders != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = NSStringFromSelector(a2);
      uint64_t v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138544642;
      unint64_t v21 = v12;
      __int16 v22 = 2114;
      v23 = v14;
      __int16 v24 = 2048;
      uint64_t v25 = self;
      __int16 v26 = 2114;
      long long v27 = @"BKHIDEventSenderCache.m";
      __int16 v28 = 1024;
      int v29 = 113;
      __int16 v30 = 2114;
      uint64_t v31 = v11;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFDED3F8);
  }
  id v6 = v5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        -[BKHIDEventSenderCache addSenderInfo:forSenderID:](self, "addSenderInfo:forSenderID:", *(void *)(*((void *)&v15 + 1) + 8 * v10), [*(id *)(*((void *)&v15 + 1) + 8 * v10) senderID]);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)addSenderInfo:(id)a3 forSenderID:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:a4];
  uint64_t v8 = [(NSMutableDictionary *)self->_senderIDToSenderInfo objectForKeyedSubscript:v7];

  uint64_t v9 = BKLogHID();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)uint64_t v12 = 134217984;
      *(void *)&v12[4] = a4;
      _os_log_impl(&dword_1CFDE2000, v9, OS_LOG_TYPE_DEFAULT, "we already have a service for senderID:%llX", v12, 0xCu);
    }
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)uint64_t v12 = 134218242;
      *(void *)&v12[4] = a4;
      *(_WORD *)&v12[12] = 2114;
      *(void *)&v12[14] = objc_opt_class();
      id v11 = *(id *)&v12[14];
      _os_log_impl(&dword_1CFDE2000, v9, OS_LOG_TYPE_DEFAULT, "cache sender info for senderID:%llX -- %{public}@", v12, 0x16u);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 addDisappearanceObserver:self queue:self->_queue];
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_senderIDToSenderInfo, "setObject:forKeyedSubscript:", v6, v7, *(_OWORD *)v12, *(void *)&v12[16], v13);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)serviceDidDisappear:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];

  -[BKHIDEventSenderCache removeSenderInfo:](self, "removeSenderInfo:", v6, v7, v8);
}

- (void)removeSenderInfo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    BOOL v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"senders != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v11 = NSStringFromSelector(a2);
      uint64_t v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      long long v18 = v11;
      __int16 v19 = 2114;
      id v20 = v13;
      __int16 v21 = 2048;
      __int16 v22 = self;
      __int16 v23 = 2114;
      __int16 v24 = @"BKHIDEventSenderCache.m";
      __int16 v25 = 1024;
      int v26 = 122;
      __int16 v27 = 2114;
      __int16 v28 = v10;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFDF00F0);
  }
  id v6 = v5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v8 = (void *)[(NSMutableDictionary *)self->_senderIDToSenderInfo copy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__BKHIDEventSenderCache_removeSenderInfo___block_invoke;
  v14[3] = &unk_1E6871408;
  id v15 = v6;
  long long v16 = self;
  id v9 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v14];

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderIDToSenderInfo, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_senderIDToSenderInfo withName:@"senderIDToSenderInfo"];
  id v5 = [v3 build];

  return (NSString *)v5;
}

- (BKHIDEventSenderCache)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKHIDEventSenderCache;
  id v6 = [(BKHIDEventSenderCache *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    senderIDToSenderInfo = v7->_senderIDToSenderInfo;
    v7->_senderIDToSenderInfo = v8;
  }
  return v7;
}

@end