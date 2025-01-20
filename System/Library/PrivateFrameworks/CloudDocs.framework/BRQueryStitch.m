@interface BRQueryStitch
- (BRQueryStitch)initWithURL:(id)a3 objid:(id)a4 kind:(char)a5;
- (NSArray)contexts;
- (NSURL)fromURL;
- (id)description;
- (void)_creationDone;
- (void)_deletionDone;
- (void)_enableUpdatesFromIPCAfterStitchingOnAllQueries;
- (void)_renameDone;
- (void)dealloc;
- (void)done;
- (void)setContexts:(id)a3;
- (void)setFromURL:(id)a3;
- (void)setQueries:(id)a3;
@end

@implementation BRQueryStitch

- (BRQueryStitch)initWithURL:(id)a3 objid:(id)a4 kind:(char)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BRQueryStitch;
  v11 = [(BRQueryStitch *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_url, a3);
    objc_storeStrong((id *)&v12->_objid, a4);
    v12->_kind = a5;
  }

  return v12;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:64];
  objc_msgSend(v3, "appendFormat:", @"<BRQueryStitch %p for ", self);
  unint64_t kind = self->_kind;
  if (kind <= 2) {
    [v3 appendString:off_1E59AF868[kind]];
  }
  v5 = [(NSURL *)self->_url path];
  [v3 appendFormat:@"\"%@\" possibly interesting %ld queries>", v5, -[NSArray count](self->_contexts, "count")];

  return v3;
}

- (void)setQueries:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_contexts)
  {
    v15 = brc_bread_crumbs((uint64_t)"-[BRQueryStitch setQueries:]", 170);
    v16 = brc_default_log(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRQueryStitch setQueries:]();
    }
  }
  v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        v12 = [BRQueryStitchingContext alloc];
        v13 = -[BRQueryStitchingContext initWithQuery:](v12, "initWithQuery:", v11, (void)v17);
        [(NSArray *)v5 addObject:v13];
        [(BRQueryStitchingContext *)v13 performAsyncOnReceiver:&__block_literal_global_28];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  contexts = self->_contexts;
  self->_contexts = v5;
}

uint64_t __28__BRQueryStitch_setQueries___block_invoke(uint64_t a1, void *a2)
{
  return [a2 disableUpdatesFromIPCBeforeStitching];
}

- (void)_enableUpdatesFromIPCAfterStitchingOnAllQueries
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_contexts;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "performAsyncOnReceiver:", &__block_literal_global_30_0, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

uint64_t __64__BRQueryStitch__enableUpdatesFromIPCAfterStitchingOnAllQueries__block_invoke(uint64_t a1, void *a2)
{
  return [a2 enableUpdatesFromIPCAfterStitching];
}

- (void)_creationDone
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] could not get notification, not stitching anything%@", v2, v3, v4, v5, v6);
}

void __30__BRQueryStitch__creationDone__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)[*(id *)(a1 + 32) copy];
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v4, 0);
  uint8_t v6 = brc_bread_crumbs((uint64_t)"-[BRQueryStitch _creationDone]_block_invoke", 217);
  long long v7 = brc_default_log(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    objc_super v14 = v6;
    _os_log_debug_impl(&dword_19ED3F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] sending update to %@: %@%@", buf, 0x20u);
  }

  [v3 receiveStitchingUpdates:v5];
  [v3 enableUpdatesFromIPCAfterStitching];
}

- (void)_renameDone
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] destination URL is outside of clouddocs, pretend it's a deletion%@", v2, v3, v4, v5, v6);
}

void __28__BRQueryStitch__renameDone__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = (void *)[*(id *)(a1 + 32) copy];
  if (v8) {
    [v7 addObject:v8];
  }
  if ([*(id *)(*(void *)(a1 + 40) + 16) isFolderOrAliasID])
  {
    uint64_t v22 = v8;
    id v24 = v5;
    long long v9 = [*(id *)(*(void *)(a1 + 40) + 40) path];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v23 = v6;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v16 = [v15 url];
          long long v17 = [v16 path];
          int v18 = [v17 hasPrefix:v9];

          if (v18)
          {
            long long v19 = (void *)[v15 copy];
            [v7 addObject:v19];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v35 count:16];
      }
      while (v12);
    }

    id v6 = v23;
    id v5 = v24;
    uint64_t v8 = v22;
  }
  long long v20 = brc_bread_crumbs((uint64_t)"-[BRQueryStitch _renameDone]_block_invoke", 272);
  v21 = brc_default_log(1);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v30 = v5;
    __int16 v31 = 2112;
    id v32 = v7;
    __int16 v33 = 2112;
    v34 = v20;
    _os_log_debug_impl(&dword_19ED3F000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] sending updates to %@: %@%@", buf, 0x20u);
  }

  [v5 receiveStitchingUpdates:v7];
  [v5 enableUpdatesFromIPCAfterStitching];
}

- (void)_deletionDone
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] the URL is still reachable, not stitching anything%@", v2, v3, v4, v5, v6);
}

void __30__BRQueryStitch__deletionDone__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([*(id *)(*(void *)(a1 + 32) + 16) isFolderOrAliasID])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v24 = v9;
      id v25 = v8;
      objc_super v14 = 0;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v11);
          }
          id v17 = *(id *)(*((void *)&v26 + 1) + 8 * i);

          int v18 = [v17 url];
          char v19 = [v18 checkPromisedItemIsReachableAndReturnError:0];

          if (v19)
          {
            objc_super v14 = v17;
          }
          else
          {
            objc_super v14 = (void *)[v17 copy];

            [v14 markDead];
            [v10 addObject:v14];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v36 count:16];
      }
      while (v13);

      id v9 = v24;
      id v8 = v25;
    }
  }
  long long v20 = objc_msgSend(v9, "objectForKey:", *(void *)(*(void *)(a1 + 32) + 16), v24, v25, (void)v26);
  v21 = (void *)[v20 copy];

  if (v21)
  {
    [v21 markDead];
    [v10 addObject:v21];
  }
  uint64_t v22 = brc_bread_crumbs((uint64_t)"-[BRQueryStitch _deletionDone]_block_invoke", 316);
  id v23 = brc_default_log(1);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v31 = v7;
    __int16 v32 = 2112;
    id v33 = v10;
    __int16 v34 = 2112;
    v35 = v22;
    _os_log_debug_impl(&dword_19ED3F000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] sending update to %@: %@%@", buf, 0x20u);
  }

  [v7 receiveStitchingUpdates:v10];
  [v7 enableUpdatesFromIPCAfterStitching];
}

- (void)done
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: unknown stitching handler%@", v2, v3, v4, v5, v6);
}

- (void)dealloc
{
  if (self->_contexts) {
    [(BRQueryStitch *)self done];
  }
  v3.receiver = self;
  v3.super_class = (Class)BRQueryStitch;
  [(BRQueryStitch *)&v3 dealloc];
}

- (NSURL)fromURL
{
  return self->_fromURL;
}

- (void)setFromURL:(id)a3
{
}

- (NSArray)contexts
{
  return self->_contexts;
}

- (void)setContexts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_fromURL, 0);
  objc_storeStrong((id *)&self->_objid, 0);

  objc_storeStrong((id *)&self->_contexts, 0);
}

- (void)setQueries:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: _contexts == nil%@", v2, v3, v4, v5, v6);
}

@end