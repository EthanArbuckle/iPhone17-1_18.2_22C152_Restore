@interface _LSDModificationPendingSaveToken
- (_LSDModificationPendingSaveToken)initWithUUID:(id)a3;
- (id).cxx_construct;
- (void)saveDidHappen:(BOOL)a3 error:(id)a4;
- (void)waitForResult:(id)a3;
@end

@implementation _LSDModificationPendingSaveToken

- (_LSDModificationPendingSaveToken)initWithUUID:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LSDModificationPendingSaveToken;
  v6 = [(_LSDModificationPendingSaveToken *)&v10 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    waiters = v6->_waiters;
    v6->_waiters = v7;

    objc_storeStrong((id *)&v6->_uuid, a3);
  }

  return v6;
}

- (void)waitForResult:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, BOOL))a3;
  p_mutex = (os_unfair_lock_s *)&self->_mutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_mutex);
  if (self->_saveError.__engaged_)
  {
    v6 = _LSInstallLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uuid = self->_uuid;
      int v13 = 138412290;
      v14 = uuid;
      _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEFAULT, "save for operation %@ is already complete", (uint8_t *)&v13, 0xCu);
    }

    v4[2](v4, self->_saveError.var0.__val_ == 0);
  }
  else
  {
    v8 = _LSInstallLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = self->_uuid;
      int v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_INFO, "waiting for save for operation %@", (uint8_t *)&v13, 0xCu);
    }

    waiters = self->_waiters;
    v11 = (void *)[v4 copy];
    v12 = (void *)MEMORY[0x18530F950]();
    [(NSMutableArray *)waiters addObject:v12];
  }
  os_unfair_lock_unlock(p_mutex);
}

- (void)saveDidHappen:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v21 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_mutex);
  if (self->_saveError.__engaged_)
  {
    v6 = _LSInstallLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[_LSDModificationPendingSaveToken saveDidHappen:error:]((uint64_t)self, v6);
    }
  }
  else
  {
    std::optional<NSError * {__strong}>::operator=[abi:nn180100]<NSError * {__strong}&,void>((uint64_t)&self->_saveError, &v21);
    v7 = _LSInstallLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v21;
      uuid = self->_uuid;
      uint64_t v10 = [(NSMutableArray *)self->_waiters count];
      *(_DWORD *)buf = 67109890;
      BOOL v24 = v4;
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 2112;
      v28 = uuid;
      __int16 v29 = 2048;
      uint64_t v30 = v10;
      _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEFAULT, "Save happened (%d %@) for operation %@, save token calling %zu handler(s)", buf, 0x26u);
    }

    v11 = (void *)MEMORY[0x18530F680]();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v12 = self->_waiters;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v12);
          }
          (*(void (**)(void, BOOL))(*(void *)(*((void *)&v17 + 1) + 8 * v15) + 16))(*(void *)(*((void *)&v17 + 1) + 8 * v15), v21 == 0);
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v13);
    }

    waiters = self->_waiters;
    self->_waiters = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_mutex);
}

- (void).cxx_destruct
{
  if (self->_saveError.__engaged_) {

  }
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_waiters, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 24) = 0;
  *((unsigned char *)self + 32) = 0;
  *((_DWORD *)self + 10) = 0;
  return self;
}

- (void)saveDidHappen:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_182959000, a2, OS_LOG_TYPE_FAULT, "Got multiple save callbacks for pending save token (op %@)! That's a bug!", (uint8_t *)&v3, 0xCu);
}

@end