@interface EMMessageContentCachedMetadata
- (BOOL)showRemoteImages;
- (BOOL)skipMessageReformatting;
- (EMMessageContentCachedMetadata)initWithDelegate:(id)a3;
- (_BYTE)_cachedValueForKeyPath:(void *)a3 fromJSONData:;
- (id)_cachedMetadataJSONFromResult;
- (id)_cachedValueForKeyPath:(void *)a3 fromDictionary:;
- (id)cachedValueForKeyPath:(uint64_t)a1;
- (uint64_t)_BOOLValueForKeyPath:(uint64_t)a1;
- (void)_setBoolValue:(void *)a3 forKeyPath:;
- (void)setShowRemoteImages:(BOOL)a3;
- (void)setSkipMessageReformatting:(BOOL)a3;
@end

@implementation EMMessageContentCachedMetadata

- (EMMessageContentCachedMetadata)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EMMessageContentCachedMetadata;
  v5 = [(EMMessageContentCachedMetadata *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    localCache = v6->_localCache;
    v6->_localCache = (NSMutableDictionary *)v7;
  }
  return v6;
}

- (BOOL)showRemoteImages
{
  return -[EMMessageContentCachedMetadata _BOOLValueForKeyPath:]((uint64_t)self, @"ShowRemoteImages");
}

- (uint64_t)_BOOLValueForKeyPath:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    id v4 = [*(id *)(a1 + 24) objectForKeyedSubscript:v3];
    if (!v4)
    {
      id v4 = -[EMMessageContentCachedMetadata cachedValueForKeyPath:](a1, v3);
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = [v4 BOOLValue];
    }
    else {
      uint64_t v5 = 0;
    }
    v6 = [NSNumber numberWithBool:v5];
    [*(id *)(a1 + 24) setObject:v6 forKeyedSubscript:v3];

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)setShowRemoteImages:(BOOL)a3
{
}

- (void)_setBoolValue:(void *)a3 forKeyPath:
{
  id v8 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    uint64_t v5 = [NSNumber numberWithBool:a2];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    uint64_t v7 = [WeakRetained contentMessage];
    [v7 setCachedMetadata:v5 forKey:v8];

    [*(id *)(a1 + 24) setObject:v5 forKeyedSubscript:v8];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
}

- (BOOL)skipMessageReformatting
{
  return -[EMMessageContentCachedMetadata _BOOLValueForKeyPath:]((uint64_t)self, @"SkipMessageReformat");
}

- (void)setSkipMessageReformatting:(BOOL)a3
{
}

- (id)cachedValueForKeyPath:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[EMMessageContentCachedMetadata cachedValueForKeyPath:]((uint64_t)v3, v4);
    }

    uint64_t v5 = -[EMMessageContentCachedMetadata _cachedMetadataJSONFromResult](a1);
    if (v5)
    {
      v6 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[EMMessageContentCachedMetadata cachedValueForKeyPath:]((uint64_t)v3, v6);
      }

      uint64_t v7 = -[EMMessageContentCachedMetadata _cachedValueForKeyPath:fromJSONData:]((unsigned char *)a1, v3, v5);
    }
    else
    {
      id v8 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[EMMessageContentCachedMetadata cachedValueForKeyPath:]((uint64_t)v3, v8);
      }

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      objc_super v10 = [WeakRetained contentMessage];
      uint64_t v7 = [v10 cachedMetadataOfClass:objc_opt_class() forKey:v3];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_cachedMetadataJSONFromResult
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    v2 = [WeakRetained contentRepresentation];
    id v3 = [v2 cachedMetadataJSON];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (_BYTE)_cachedValueForKeyPath:(void *)a3 fromJSONData:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    if ([v6 length])
    {
      id v13 = 0;
      id v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:24 error:&v13];
      id v9 = v13;
      if (v8)
      {
        -[EMMessageContentCachedMetadata _cachedValueForKeyPath:fromDictionary:]((uint64_t)a1, v5, v8);
        a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!a1[12])
        {
          a1[12] = 1;
          objc_super v10 = EMLogCategoryMessageLoading();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v11 = objc_msgSend(v9, "ef_publicDescription");
            -[EMMessageContentCachedMetadata _cachedValueForKeyPath:fromJSONData:](v11, buf, v10);
          }
        }
        a1 = 0;
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_cachedValueForKeyPath:(void *)a3 fromDictionary:
{
  id v5 = a2;
  id v6 = a3;
  if (a1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__6;
    v18[4] = __Block_byref_object_dispose__6;
    id v19 = (id)0xAAAAAAAAAAAAAAAALL;
    id v19 = v6;
    uint64_t v7 = [v5 componentsSeparatedByString:@"."];
    uint64_t v8 = [v7 count];
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__6;
    v16 = __Block_byref_object_dispose__6;
    id v17 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__EMMessageContentCachedMetadata__cachedValueForKeyPath_fromDictionary___block_invoke;
    v11[3] = &unk_1E63E4690;
    v11[4] = &v12;
    v11[5] = v18;
    v11[6] = v8;
    [v7 enumerateObjectsWithOptions:2 usingBlock:v11];
    id v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(v18, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __72__EMMessageContentCachedMetadata__cachedValueForKeyPath_fromDictionary___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(*(void *)(a1[5] + 8) + 40);
  id v11 = v5;
  if (a3 + 1 == a1[6])
  {
    uint64_t v7 = [v6 objectForKeyedSubscript:v5];
    uint64_t v8 = *(void *)(a1[4] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    id v9 = [v6 objectForKeyedSubscript:v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v10 = v9;
    }
    else {
      objc_super v10 = 0;
    }
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localCache, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)cachedValueForKeyPath:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_ERROR, "Using EMMessage fallback for cached metadata value for key %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)cachedValueForKeyPath:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_DEBUG, "Got cached metadata value for key %{public}@ from EMContentRepresentation.", (uint8_t *)&v2, 0xCu);
}

- (void)cachedValueForKeyPath:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_DEBUG, "Getting cached metadata value for key %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_cachedValueForKeyPath:(os_log_t)log fromJSONData:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Failed to parse cached metadata JSON: %{public}@", buf, 0xCu);
}

@end