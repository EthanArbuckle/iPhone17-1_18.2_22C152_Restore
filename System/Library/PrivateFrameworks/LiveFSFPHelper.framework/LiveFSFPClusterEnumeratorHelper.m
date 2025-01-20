@interface LiveFSFPClusterEnumeratorHelper
+ (id)newWithEnumeratedItem:(id)a3 extension:(id)a4 error:(id *)a5;
- (BOOL)isDir;
- (LiveFSFPClusterEnumeratorHelper)initWithEnumeratedItem:(id)a3 extension:(id)a4 error:(id *)a5;
- (LiveFSFPItemHelper)enumeratedItem;
- (int)state;
- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4;
- (void)invalidate;
- (void)setState:(int)a3;
@end

@implementation LiveFSFPClusterEnumeratorHelper

- (LiveFSFPClusterEnumeratorHelper)initWithEnumeratedItem:(id)a3 extension:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LiveFSFPClusterEnumeratorHelper;
  v8 = [(LiveFSFPClusterEnumeratorHelper *)&v11 init];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->ext, a4);
  }

  return v9;
}

+ (id)newWithEnumeratedItem:(id)a3 extension:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [v8 isEqualToString:*MEMORY[0x263F05400]];
  objc_super v11 = (void *)*MEMORY[0x263F053F0];
  if (v10)
  {
    id v12 = v11;

    id v8 = v12;
LABEL_4:
    v13 = (void *)[objc_alloc((Class)a1) initWithEnumeratedItem:v8 extension:v9 error:a5];
    goto LABEL_5;
  }
  if ([v8 isEqualToString:v11]) {
    goto LABEL_4;
  }
  if (a5)
  {
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:22];
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_5:

  return v13;
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = livefs_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    v6 = "-[LiveFSFPClusterEnumeratorHelper invalidate]";
    _os_log_impl(&dword_22CE49000, v3, OS_LOG_TYPE_INFO, "%s: marking state as DEAD", (uint8_t *)&v5, 0xCu);
  }

  v4 = self;
  objc_sync_enter(v4);
  v4->_state = 3;
  objc_sync_exit(v4);
}

- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = objc_opt_new();
  ext = self->ext;
  id v15 = 0;
  id v8 = [(LiveFSFPExtensionHelper *)ext clusterDomainItemsOrError:&v15];
  id v9 = v15;
  int v10 = livefs_std_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[LiveFSFPClusterEnumeratorHelper enumerateItemsForObserver:startingAtPage:]";
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_22CE49000, v10, OS_LOG_TYPE_DEFAULT, "%s: err (%@)", buf, 0x16u);
    }

    [v5 finishEnumeratingWithError:v9];
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[LiveFSFPClusterEnumeratorHelper enumerateItemsForObserver:startingAtPage:]";
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_22CE49000, v10, OS_LOG_TYPE_DEFAULT, "%s: clusterDomainItems (%@)", buf, 0x16u);
    }

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __76__LiveFSFPClusterEnumeratorHelper_enumerateItemsForObserver_startingAtPage___block_invoke;
    v13[3] = &unk_2649349C8;
    v13[4] = self;
    id v12 = v6;
    id v14 = v12;
    [v8 enumerateObjectsUsingBlock:v13];
    [v5 didEnumerateItems:v12];
    [v5 finishEnumeratingUpToPage:0];
  }
}

void __76__LiveFSFPClusterEnumeratorHelper_enumerateItemsForObserver_startingAtPage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[LiveFSFPClusterItem newWithName:v3 extension:*(void *)(*(void *)(a1 + 32) + 8)];
  id v5 = livefs_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    uint64_t v7 = "-[LiveFSFPClusterEnumeratorHelper enumerateItemsForObserver:startingAtPage:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_22CE49000, v5, OS_LOG_TYPE_DEFAULT, "%s: clusterItem(%@) LiveFSFPClusterItem (%@)", (uint8_t *)&v6, 0x20u);
  }

  [*(id *)(a1 + 40) addObject:v4];
}

- (BOOL)isDir
{
  return self->_isDir;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (LiveFSFPItemHelper)enumeratedItem
{
  return self->_enumeratedItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumeratedItem, 0);
  objc_storeStrong((id *)&self->ext, 0);
}

@end