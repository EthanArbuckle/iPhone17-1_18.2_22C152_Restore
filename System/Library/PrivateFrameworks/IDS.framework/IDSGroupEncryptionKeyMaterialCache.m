@interface IDSGroupEncryptionKeyMaterialCache
- (IDSGroupEncryptionKeyMaterialCache)init;
- (void)enumerateCachedKeyMaterialUsingBlock:(id)a3;
- (void)invalidateKeyMaterialByKeyIndexes:(id)a3;
- (void)recvKeyMaterial:(id)a3;
@end

@implementation IDSGroupEncryptionKeyMaterialCache

- (IDSGroupEncryptionKeyMaterialCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)IDSGroupEncryptionKeyMaterialCache;
  v2 = [(IDSGroupEncryptionKeyMaterialCache *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F6B460] RealTimeEncryptionController];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "IDSGroupEncryptionKeyMaterialCache", v7, 2u);
    }

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
    cache = v2->_cache;
    v2->_cache = (NSMutableSet *)v4;
  }
  return v2;
}

- (void)recvKeyMaterial:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (([(NSMutableSet *)self->_cache containsObject:v4] & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F6B460] RealTimeEncryptionController];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "IDSGroupEncryptionKeyMaterialCache received key %@", (uint8_t *)&v6, 0xCu);
    }

    [(NSMutableSet *)self->_cache addObject:v4];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)invalidateKeyMaterialByKeyIndexes:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  os_unfair_lock_t lock = &self->_lock;
  v16 = self;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_cache;
  uint64_t v5 = [(NSMutableSet *)obj countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v5)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v24 + 1) + 8 * v6);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v8 = v19;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v30 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v21;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v21 != v10) {
                objc_enumerationMutation(v8);
              }
              uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
              v13 = [v7 keyIndex];
              LODWORD(v12) = [v13 isEqual:v12];

              if (v12) {
                [v4 addObject:v7];
              }
              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v30 count:16];
          }
          while (v9);
        }

        ++v6;
      }
      while (v6 != v5);
      uint64_t v5 = [(NSMutableSet *)obj countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v5);
  }

  v14 = [MEMORY[0x1E4F6B460] RealTimeEncryptionController];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v4;
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "IDSGroupEncryptionKeyMaterialCache invalidateKeyMaterialByKeyIndexes %@", buf, 0xCu);
  }

  if ([v4 count]) {
    [(NSMutableSet *)v16->_cache minusSet:v4];
  }

  os_unfair_lock_unlock(lock);
}

- (void)enumerateCachedKeyMaterialUsingBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, char *))a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = self->_cache;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      char v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

@end