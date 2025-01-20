@interface _SHMediaLibrary
+ (_SHMediaLibrary)_defaultLibrary;
+ (id)_localizedAttributionForLibraryItem:(id)a3;
+ (id)sh_uiServerConnection;
+ (void)_presentMediaLibraryWithCompletionHandler:(id)a3;
- (NSMutableDictionary)inflightTasks;
- (SHMediaLibrarySyncDelegate)delegate;
- (_SHMediaLibrary)init;
- (os_unfair_lock_s)inflightTasksLock;
- (void)_addMediaItems:(id)a3 completionHandler:(id)a4;
- (void)_library:(id)a3 didChangeWithSnapshot:(id)a4;
- (void)_library:(id)a3 didProduceError:(id)a4 failedItemIdentifiers:(id)a5;
- (void)_libraryDidCompleteSync:(id)a3;
- (void)_libraryInfoWithCompletionHandler:(id)a3;
- (void)_libraryInfoWithTask:(id)a3 completionHandler:(id)a4;
- (void)_libraryWillBeginSync:(id)a3;
- (void)_queryLibraryWithCompletionHandler:(id)a3;
- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4;
- (void)_queryLibraryWithTask:(id)a3 parameters:(id)a4 completionHandler:(id)a5;
- (void)_synchronize;
- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4;
- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4 completionHandler:(id)a5;
- (void)_synchronizeTask:(id)a3 snapshot:(id)a4 startCondition:(id)a5 completionHandler:(id)a6;
- (void)addInflightTask:(id)a3;
- (void)librarySyncDidChange:(id)a3;
- (void)removeInflightTask:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInflightTasks:(id)a3;
- (void)setInflightTasksLock:(os_unfair_lock_s)a3;
@end

@implementation _SHMediaLibrary

+ (void)_presentMediaLibraryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "sh_uiServerConnection");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75___SHMediaLibrary_Presentation___presentMediaLibraryWithCompletionHandler___block_invoke;
  v7[3] = &unk_2646EF550;
  id v8 = v4;
  id v6 = v4;
  [v5 presentMediaLibraryWithCompletionHandler:v7];
}

+ (id)sh_uiServerConnection
{
  if (sh_uiServerConnection_onceToken != -1) {
    dispatch_once(&sh_uiServerConnection_onceToken, &__block_literal_global);
  }
  v2 = (void *)sh_uiServerConnection_serverConnection;

  return v2;
}

+ (_SHMediaLibrary)_defaultLibrary
{
  if (_defaultLibrary_onceToken != -1) {
    dispatch_once(&_defaultLibrary_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_defaultLibrary_library;

  return (_SHMediaLibrary *)v2;
}

- (_SHMediaLibrary)init
{
  v8.receiver = self;
  v8.super_class = (Class)_SHMediaLibrary;
  v2 = [(_SHMediaLibrary *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_inflightTasksLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    inflightTasks = v3->_inflightTasks;
    v3->_inflightTasks = (NSMutableDictionary *)v4;

    id v6 = [MEMORY[0x263F087C8] defaultCenter];
    [v6 addObserver:v3 selector:sel_librarySyncDidChange_ name:@"SHMediaLibrarySyncDidChangeNotification" object:0];
  }
  return v3;
}

- (void)_addMediaItems:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    if ([v6 count])
    {
      v24 = self;
      objc_super v8 = objc_opt_new();
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v26;
        while (2)
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v26 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v25 + 1) + 8 * v13);
            v15 = [[SHMediaLibraryTrack alloc] initWithMediaItem:v14];
            if (!v15)
            {
              v17 = sh_log_object();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                v18 = [v14 properties];
                *(_DWORD *)buf = 138412290;
                v32 = v18;
                _os_log_impl(&dword_224B4B000, v17, OS_LOG_TYPE_ERROR, "Failed to create library track from media item with properties: %@", buf, 0xCu);
              }
              v19 = NSString;
              v20 = [v14 shazamID];
              v21 = [v19 stringWithFormat:@"%@ is not a valid shazamID or it is missing. Ensure shazamID is provided and valid.", v20];

              uint64_t v29 = *MEMORY[0x263F07F80];
              v30 = v21;
              v22 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
              v23 = +[SHError errorWithCode:400 underlyingError:0 keyOverrides:v22];

              v7[2](v7, v23);
              goto LABEL_15;
            }
            v16 = v15;
            [v8 addItem:v15];

            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      [(_SHMediaLibrary *)v24 _synchronizeSnapshot:v8 startCondition:@"UserAction" completionHandler:v7];
LABEL_15:
    }
    else
    {
      v7[2](v7, 0);
    }
  }
}

- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_opt_new();
  [(_SHMediaLibrary *)self _synchronizeTask:v8 snapshot:v7 startCondition:v6 completionHandler:0];
}

- (void)_libraryInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [(_SHMediaLibrary *)self _libraryInfoWithTask:v5 completionHandler:v4];
}

- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_opt_new();
  [(_SHMediaLibrary *)self _queryLibraryWithTask:v8 parameters:v7 completionHandler:v6];
}

+ (id)_localizedAttributionForLibraryItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 providerIdentifier];

    if (v5
      && ([v4 providerIdentifier],
          id v6 = objc_claimAutoreleasedReturnValue(),
          BOOL v7 = +[SHAttribution requiresMediaLibraryAttributionForBundleIdentifier:v6], v6, v7))
    {
      id v8 = [v4 providerIdentifier];
      id v9 = +[SHAttribution productNameForBundleIdentifier:v8];
      uint64_t v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v11 = [MEMORY[0x263F6C4B8] localizedStringForKey:@"SHAZAM_LIBRARY_MISSING_PROVIDER_NAME"];
      }
      uint64_t v12 = v11;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)_synchronize
{
  id v3 = (id)objc_opt_new();
  [(_SHMediaLibrary *)self _synchronizeSnapshot:v3 startCondition:@"UserAction"];
}

- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_opt_new();
  [(_SHMediaLibrary *)self _synchronizeTask:v11 snapshot:v10 startCondition:v9 completionHandler:v8];
}

- (void)_queryLibraryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_opt_new();
  id v5 = +[SHMediaLibraryQueryParameters defaultParameters];
  [(_SHMediaLibrary *)self _queryLibraryWithTask:v6 parameters:v5 completionHandler:v4];
}

- (void)_libraryWillBeginSync:(id)a3
{
  id v4 = [(_SHMediaLibrary *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(_SHMediaLibrary *)self delegate];
    [v6 _libraryWillBeginSync:self];
  }
}

- (void)_library:(id)a3 didChangeWithSnapshot:(id)a4
{
  id v8 = a4;
  char v5 = [(_SHMediaLibrary *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    BOOL v7 = [(_SHMediaLibrary *)self delegate];
    [v7 _library:self didChangeWithSnapshot:v8];
  }
}

- (void)_library:(id)a3 didProduceError:(id)a4 failedItemIdentifiers:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(_SHMediaLibrary *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(_SHMediaLibrary *)self delegate];
    [v10 _library:self didProduceError:v11 failedItemIdentifiers:v7];
  }
}

- (void)_libraryDidCompleteSync:(id)a3
{
  id v7 = a3;
  id v4 = [(_SHMediaLibrary *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(_SHMediaLibrary *)self delegate];
    [v6 _libraryDidCompleteSync:self];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(_SHMediaLibrary *)self removeInflightTask:v7];
  }
}

- (void)_synchronizeTask:(id)a3 snapshot:(id)a4 startCondition:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [v13 setDelegate:self];
  [v13 setSyncCompletionBlock:v10];

  [(_SHMediaLibrary *)self addInflightTask:v13];
  [v13 _synchronizeSnapshot:v12 startCondition:v11];
}

- (void)_queryLibraryWithTask:(id)a3 parameters:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(_SHMediaLibrary *)self addInflightTask:v8];
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70___SHMediaLibrary__queryLibraryWithTask_parameters_completionHandler___block_invoke;
  v13[3] = &unk_2646EF7E8;
  objc_copyWeak(&v16, &location);
  id v11 = v8;
  id v14 = v11;
  id v12 = v10;
  id v15 = v12;
  [v11 _queryLibraryWithParameters:v9 completionHandler:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_libraryInfoWithTask:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(_SHMediaLibrary *)self addInflightTask:v6];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58___SHMediaLibrary__libraryInfoWithTask_completionHandler___block_invoke;
  v10[3] = &unk_2646EF810;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [v8 _libraryInfoWithCompletionHandler:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)addInflightTask:(id)a3
{
  p_inflightTasksLock = &self->_inflightTasksLock;
  id v5 = a3;
  os_unfair_lock_lock(p_inflightTasksLock);
  id v6 = [(_SHMediaLibrary *)self inflightTasks];
  id v7 = [v5 identifier];
  [v6 setObject:v5 forKey:v7];

  os_unfair_lock_unlock(p_inflightTasksLock);
}

- (void)removeInflightTask:(id)a3
{
  p_inflightTasksLock = &self->_inflightTasksLock;
  id v5 = a3;
  os_unfair_lock_lock(p_inflightTasksLock);
  id v6 = [(_SHMediaLibrary *)self inflightTasks];
  id v7 = [v5 identifier];

  [v6 removeObjectForKey:v7];

  os_unfair_lock_unlock(p_inflightTasksLock);
}

- (void)librarySyncDidChange:(id)a3
{
  p_inflightTasksLock = &self->_inflightTasksLock;
  os_unfair_lock_lock(&self->_inflightTasksLock);
  id v5 = [(_SHMediaLibrary *)self inflightTasks];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"SHMediaLibraryLocalChangeNotification" object:0];
  }

  os_unfair_lock_unlock(p_inflightTasksLock);
}

- (SHMediaLibrarySyncDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (SHMediaLibrarySyncDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (os_unfair_lock_s)inflightTasksLock
{
  return self->_inflightTasksLock;
}

- (void)setInflightTasksLock:(os_unfair_lock_s)a3
{
  self->_inflightTasksLock = a3;
}

- (NSMutableDictionary)inflightTasks
{
  return self->_inflightTasks;
}

- (void)setInflightTasks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inflightTasks, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end