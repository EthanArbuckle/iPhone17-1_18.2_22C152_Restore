@interface _SFDownloadIconCache
- (_SFDownloadIconCache)init;
- (id)_genericIconForUTI:(id)a3;
- (id)_lookupGenericIconForType:(id)a3;
- (id)iconForSource:(id)a3;
- (void)_didGenerateThumbnail:(id)a3 forSource:(id)a4;
- (void)_generateThumbnailForURL:(id)a3 completionHandler:(id)a4;
- (void)_startThumbnailRequestForSource:(id)a3 reportGenericIcons:(BOOL)a4;
- (void)addCacheObserver:(id)a3;
- (void)regenerateIconForSource:(id)a3;
- (void)removeCacheObserver:(id)a3;
@end

@implementation _SFDownloadIconCache

- (_SFDownloadIconCache)init
{
  v12.receiver = self;
  v12.super_class = (Class)_SFDownloadIconCache;
  v2 = [(_SFDownloadIconCache *)&v12 init];
  uint64_t v3 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
  observers = v2->_observers;
  v2->_observers = (NSPointerArray *)v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  thumbnailCache = v2->_thumbnailCache;
  v2->_thumbnailCache = v5;

  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  utiCache = v2->_utiCache;
  v2->_utiCache = v7;

  v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  activeRequestIdentifiers = v2->_activeRequestIdentifiers;
  v2->_activeRequestIdentifiers = v9;

  return v2;
}

- (void)addCacheObserver:(id)a3
{
}

- (void)removeCacheObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_observers;
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v12 + 1) + 8 * v10) == v4)
        {

          if ((v8 ^ 0x7FFFFFFFFFFFFFFFLL) != v10) {
            -[NSPointerArray removePointerAtIndex:](self->_observers, "removePointerAtIndex:", v8 + v10, (void)v12);
          }
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }

LABEL_12:
}

- (id)iconForSource:(id)a3
{
  id v4 = a3;
  thumbnailCache = self->_thumbnailCache;
  uint64_t v6 = [v4 identifier];
  uint64_t v7 = [(NSMutableDictionary *)thumbnailCache objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];

    if (v7 != v8)
    {
      id v9 = v7;
      goto LABEL_6;
    }
  }
  else
  {
    [(_SFDownloadIconCache *)self _startThumbnailRequestForSource:v4 reportGenericIcons:0];
  }
  uint64_t v10 = [v4 uti];
  id v9 = [(_SFDownloadIconCache *)self _genericIconForUTI:v10];

LABEL_6:

  return v9;
}

- (void)regenerateIconForSource:(id)a3
{
}

- (id)_genericIconForUTI:(id)a3
{
  id v4 = a3;
  id v5 = (id)*MEMORY[0x1E4F22590];
  uint64_t v6 = v5;
  if (!v4) {
    id v4 = v5;
  }
  id v7 = [(NSMutableDictionary *)self->_utiCache objectForKeyedSubscript:v4];
  if (!v7)
  {
    uint64_t v8 = [(_SFDownloadIconCache *)self _lookupGenericIconForType:v4];
    id v9 = v8;
    if (v8)
    {
      id v7 = v8;
    }
    else
    {
      uint64_t v10 = [(_SFDownloadIconCache *)self _lookupGenericIconForType:v6];
      uint64_t v11 = v10;
      if (v10) {
        id v12 = v10;
      }
      else {
        id v12 = (id)objc_opt_new();
      }
      id v7 = v12;
    }
    [(NSMutableDictionary *)self->_utiCache setObject:v7 forKeyedSubscript:v4];
  }
  id v13 = v7;

  return v13;
}

- (void)_startThumbnailRequestForSource:(id)a3 reportGenericIcons:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 identifier];
  if (([(NSMutableSet *)self->_activeRequestIdentifiers containsObject:v7] & 1) == 0)
  {
    uint64_t v8 = [v6 completedFileURL];
    if (v8)
    {
      objc_initWeak(&location, self);
      [(NSMutableSet *)self->_activeRequestIdentifiers addObject:v7];
      objc_initWeak(&from, v6);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __75___SFDownloadIconCache__startThumbnailRequestForSource_reportGenericIcons___block_invoke;
      v9[3] = &unk_1E5C77FC0;
      v9[4] = self;
      id v10 = v8;
      objc_copyWeak(&v11, &location);
      objc_copyWeak(&v12, &from);
      objc_msgSend(v10, "safari_accessingSecurityScopedResource:", v9);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&v11);

      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else if (v4)
    {
      [(_SFDownloadIconCache *)self _didGenerateThumbnail:0 forSource:v6];
    }
  }
}

- (void)_didGenerateThumbnail:(id)a3 forSource:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  activeRequestIdentifiers = self->_activeRequestIdentifiers;
  id v9 = [v7 identifier];
  [(NSMutableSet *)activeRequestIdentifiers removeObject:v9];

  id v10 = v6;
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F1CA98] null];
  }
  thumbnailCache = self->_thumbnailCache;
  id v12 = [v7 identifier];
  [(NSMutableDictionary *)thumbnailCache setObject:v10 forKeyedSubscript:v12];

  if (v6)
  {
    id v13 = v6;
  }
  else
  {

    long long v14 = [v7 uti];
    id v13 = [(_SFDownloadIconCache *)self _genericIconForUTI:v14];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v15 = [(NSPointerArray *)self->_observers allObjects];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v19++) downloadIconCache:self didGenerateNewIcon:v13 forSource:v7];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v17);
  }
}

- (void)_generateThumbnailForURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F3A6C0];
  id v7 = a3;
  id v8 = [v6 alloc];
  _SFScreenScale();
  id v10 = objc_msgSend(v8, "initWithFileAtURL:size:scale:representationTypes:", v7, 4, 48.0, 48.0, v9);

  [v10 setIconMode:1];
  id v11 = [MEMORY[0x1E4F3A6C8] sharedGenerator];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67___SFDownloadIconCache__generateThumbnailForURL_completionHandler___block_invoke;
  v13[3] = &unk_1E5C77FE8;
  id v14 = v5;
  id v12 = v5;
  [v11 generateRepresentationsForRequest:v10 updateHandler:v13];
}

- (id)_lookupGenericIconForType:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F22430] documentProxyForName:0 type:a3 MIMEType:0];
  BOOL v4 = [MEMORY[0x1E4FB1818] _iconForResourceProxy:v3 format:13];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_utiCache, 0);
  objc_storeStrong((id *)&self->_thumbnailCache, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end