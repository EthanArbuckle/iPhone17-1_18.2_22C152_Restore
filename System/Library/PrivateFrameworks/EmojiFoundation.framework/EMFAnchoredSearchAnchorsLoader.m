@interface EMFAnchoredSearchAnchorsLoader
- (EMFAnchoredSearchAnchorCollection)locallyCachedAnchorCollection;
- (EMFAnchoredSearchAnchorsCache)anchorsCache;
- (EMFAnchoredSearchAnchorsLoader)initWithLocaleIdentifier:(id)a3;
- (NSArray)leftHandAnchors;
- (NSArray)rightHandAnchors;
- (NSString)localeIdentifier;
- (void)_loadAndCacheAnchorsForLocaleIdentifierIfNecessary:(id)a3;
- (void)setAnchorsCache:(id)a3;
- (void)setLocallyCachedAnchorCollection:(id)a3;
@end

@implementation EMFAnchoredSearchAnchorsLoader

- (EMFAnchoredSearchAnchorsLoader)initWithLocaleIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMFAnchoredSearchAnchorsLoader;
  v5 = [(EMFAnchoredSearchAnchorsLoader *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSString *)v6;

    uint64_t v8 = +[EMFAnchoredSearchAnchorsCache sharedCache];
    anchorsCache = v5->_anchorsCache;
    v5->_anchorsCache = (EMFAnchoredSearchAnchorsCache *)v8;
  }
  return v5;
}

- (NSArray)leftHandAnchors
{
  v3 = [(EMFAnchoredSearchAnchorsLoader *)self locallyCachedAnchorCollection];

  if (!v3)
  {
    id v4 = [(EMFAnchoredSearchAnchorsLoader *)self localeIdentifier];
    [(EMFAnchoredSearchAnchorsLoader *)self _loadAndCacheAnchorsForLocaleIdentifierIfNecessary:v4];
  }
  v5 = [(EMFAnchoredSearchAnchorsLoader *)self locallyCachedAnchorCollection];
  uint64_t v6 = [v5 leftHandAnchors];

  return (NSArray *)v6;
}

- (NSArray)rightHandAnchors
{
  v3 = [(EMFAnchoredSearchAnchorsLoader *)self locallyCachedAnchorCollection];

  if (!v3)
  {
    id v4 = [(EMFAnchoredSearchAnchorsLoader *)self localeIdentifier];
    [(EMFAnchoredSearchAnchorsLoader *)self _loadAndCacheAnchorsForLocaleIdentifierIfNecessary:v4];
  }
  v5 = [(EMFAnchoredSearchAnchorsLoader *)self locallyCachedAnchorCollection];
  uint64_t v6 = [v5 rightHandAnchors];

  return (NSArray *)v6;
}

- (void)_loadAndCacheAnchorsForLocaleIdentifierIfNecessary:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(EMFAnchoredSearchAnchorsLoader *)self locallyCachedAnchorCollection];

  if (!v5)
  {
    uint64_t v6 = [(EMFAnchoredSearchAnchorsLoader *)self anchorsCache];
    v7 = [v6 anchorCollectionForLocaleIdentifier:v4];

    if (v7)
    {
      [(EMFAnchoredSearchAnchorsLoader *)self setLocallyCachedAnchorCollection:v7];
LABEL_42:

      goto LABEL_43;
    }
    uint64_t v8 = emf_logging_get_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1B8C45000, v8, OS_LOG_TYPE_INFO, "Loading search anchors for locale '%{public}@'", (uint8_t *)&buf, 0xCu);
    }

    v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__0;
    v54 = __Block_byref_object_dispose__0;
    id v55 = [v9 URLForResource:v4 withExtension:@"plist" subdirectory:@"Anchor Strings"];
    uint64_t v10 = *(void *)(*((void *)&buf + 1) + 40);
    if (!v10)
    {
      objc_super v11 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v4];
      v12 = [v11 languageIdentifier];

      v13 = emf_logging_get_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v43 = 138543618;
        id v44 = v4;
        __int16 v45 = 2114;
        id v46 = v12;
        _os_log_impl(&dword_1B8C45000, v13, OS_LOG_TYPE_INFO, "No search anchors found for locale identifier '%{public}@'; attempting to load data associated with the normal"
          "ized locale identifier '%{public}@'.",
          v43,
          0x16u);
      }

      uint64_t v14 = [v9 URLForResource:v12 withExtension:@"plist" subdirectory:@"Anchor Strings"];
      v15 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v14;

      uint64_t v10 = *(void *)(*((void *)&buf + 1) + 40);
      if (!v10)
      {
        v16 = emf_logging_get_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v43 = 138543362;
          id v44 = v4;
          _os_log_impl(&dword_1B8C45000, v16, OS_LOG_TYPE_INFO, "No search anchors found for locale identifier '%{public}@'; attempting to load a fallback language.",
            v43,
            0xCu);
        }

        v17 = (void *)MEMORY[0x1E4F1CA20];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __85__EMFAnchoredSearchAnchorsLoader__loadAndCacheAnchorsForLocaleIdentifierIfNecessary___block_invoke;
        v39[3] = &unk_1E61A9900;
        id v18 = v4;
        id v40 = v18;
        p_long long buf = &buf;
        id v41 = v9;
        [v17 _enumerateLanguageFallbackGraphForLocaleIdentifier:v18 usingBlock:v39];
        if (!*(void *)(*((void *)&buf + 1) + 40))
        {
          v33 = emf_logging_get_default_log();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            -[EMFAnchoredSearchAnchorsLoader _loadAndCacheAnchorsForLocaleIdentifierIfNecessary:]((uint64_t)v18, v33);
          }

          v7 = 0;
          id v20 = v40;
          goto LABEL_41;
        }

        uint64_t v10 = *(void *)(*((void *)&buf + 1) + 40);
      }
    }
    id v38 = 0;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v10 error:&v38];
    id v20 = v38;
    if (!v20 && v19 && [v19 count])
    {
      v21 = [v19 objectForKeyedSubscript:@"metadata"];
      v22 = v21;
      if (v21)
      {
        v23 = [v21 objectForKeyedSubscript:@"schemaVersion"];
        v24 = v23;
        if (v23 && [v23 unsignedLongValue] == 1)
        {
          v7 = [[EMFAnchoredSearchAnchorCollection alloc] initWithLocaleIdentifier:v4];
          v25 = [v19 objectForKeyedSubscript:@"leftHandAnchors"];
          v26 = v25;
          if (v25 && [v25 count]) {
            [(EMFAnchoredSearchAnchorCollection *)v7 setLeftHandAnchors:v26];
          }
          v37 = [v19 objectForKeyedSubscript:@"rightHandAnchors"];
          if (v37 && [v37 count]) {
            [(EMFAnchoredSearchAnchorCollection *)v7 setRightHandAnchors:v37];
          }
          v27 = [(EMFAnchoredSearchAnchorsLoader *)self anchorsCache];
          [v27 setAnchorCollection:v7 forLocaleIdentifier:v4];

          [(EMFAnchoredSearchAnchorsLoader *)self setLocallyCachedAnchorCollection:v7];
          v28 = emf_logging_get_default_log();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v29 = [*(id *)(*((void *)&buf + 1) + 40) absoluteString];
            uint64_t v36 = [v26 count];
            uint64_t v30 = [v37 count];
            *(_DWORD *)v43 = 138544130;
            id v44 = v29;
            __int16 v45 = 2114;
            id v46 = v4;
            __int16 v47 = 2048;
            uint64_t v48 = v36;
            __int16 v49 = 2048;
            uint64_t v50 = v30;
            _os_log_impl(&dword_1B8C45000, v28, OS_LOG_TYPE_INFO, "Loaded search anchor plist '%{public}@' for locale '%{public}@' (%lu left, %lu right)", v43, 0x2Au);
          }
        }
        else
        {
          v26 = emf_logging_get_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v31 = [*(id *)(*((void *)&buf + 1) + 40) absoluteString];
            -[EMFAnchoredSearchAnchorsLoader _loadAndCacheAnchorsForLocaleIdentifierIfNecessary:](v31, v43, [v24 unsignedLongValue], v26);
          }
          v7 = 0;
        }
      }
      else
      {
        v24 = emf_logging_get_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v32 = [*(id *)(*((void *)&buf + 1) + 40) absoluteString];
          [(EMFAnchoredSearchAnchorsLoader *)v32 _loadAndCacheAnchorsForLocaleIdentifierIfNecessary:v24];
        }
        v7 = 0;
      }
    }
    else
    {
      v22 = emf_logging_get_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v34 = [*(id *)(*((void *)&buf + 1) + 40) absoluteString];
        v35 = [v20 localizedDescription];
        *(_DWORD *)v43 = 138543874;
        id v44 = v34;
        __int16 v45 = 2114;
        id v46 = v4;
        __int16 v47 = 2114;
        uint64_t v48 = (uint64_t)v35;
        _os_log_error_impl(&dword_1B8C45000, v22, OS_LOG_TYPE_ERROR, "Search anchor plist at path '%{public}@' for locale '%{public}@' could not be read with error: '%{public}@", v43, 0x20u);
      }
      v7 = 0;
    }

LABEL_41:
    _Block_object_dispose(&buf, 8);

    goto LABEL_42;
  }
LABEL_43:
}

void __85__EMFAnchoredSearchAnchorsLoader__loadAndCacheAnchorsForLocaleIdentifierIfNecessary___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (([*(id *)(a1 + 32) isEqualToString:v5] & 1) == 0)
  {
    uint64_t v6 = emf_logging_get_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 138543362;
      id v11 = v5;
      _os_log_impl(&dword_1B8C45000, v6, OS_LOG_TYPE_INFO, "Loading search anchors for language fallback '%{public}@'", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v7 = [*(id *)(a1 + 40) URLForResource:v5 withExtension:@"plist" subdirectory:@"Anchor Strings"];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      *a3 = 1;
    }
  }
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (EMFAnchoredSearchAnchorsCache)anchorsCache
{
  return self->_anchorsCache;
}

- (void)setAnchorsCache:(id)a3
{
}

- (EMFAnchoredSearchAnchorCollection)locallyCachedAnchorCollection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locallyCachedAnchorCollection);
  return (EMFAnchoredSearchAnchorCollection *)WeakRetained;
}

- (void)setLocallyCachedAnchorCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_locallyCachedAnchorCollection);
  objc_storeStrong((id *)&self->_anchorsCache, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

- (void)_loadAndCacheAnchorsForLocaleIdentifierIfNecessary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B8C45000, a2, OS_LOG_TYPE_ERROR, "Could not load search anchors for locale identifier '%{public}@'.", (uint8_t *)&v2, 0xCu);
}

- (void)_loadAndCacheAnchorsForLocaleIdentifierIfNecessary:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B8C45000, log, OS_LOG_TYPE_ERROR, "Search anchor plist at path '%{public}@' is malformed and lacks a 'metadata' segment.", buf, 0xCu);
}

- (void)_loadAndCacheAnchorsForLocaleIdentifierIfNecessary:(uint64_t)a3 .cold.3(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)long long buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1B8C45000, log, OS_LOG_TYPE_ERROR, "Search anchor plist at path '%{public}@' registers an unsupported schemaVersion of '%lu'.", buf, 0x16u);
}

@end