@interface MapsSuggestionsDestinationdTrigger
- (MapsSuggestionsDestinationdTrigger)init;
- (MapsSuggestionsDestinationdTrigger)initWithName:(id)a3;
- (id).cxx_construct;
- (void)addIgnoredClientProcess:(id)a3;
- (void)didAddFirstObserver;
- (void)didRemoveLastObserver;
@end

@implementation MapsSuggestionsDestinationdTrigger

void __57__MapsSuggestionsDestinationdTrigger_didAddFirstObserver__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (id *)WeakRetained;
    objc_sync_enter(v5);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v5[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = *(void *)(a2 + 32);
          if (v11 == MapsSuggestionsIPCPayloadForNSString(v10))
          {
            v12 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v19 = v10;
              _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "Ignoring wake-ups from peerIdentifier '%@'", buf, 0xCu);
            }

            objc_sync_exit(v5);
            v13 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v20 = 0;
              _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "Not firing because this client process is being ignored.", v20, 2u);
            }
            goto LABEL_18;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    objc_sync_exit(v5);
    objc_msgSend(v5, "triggerMyObservers", (void)v14);
  }
  else
  {
    GEOFindOrCreateLog();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v20 = 136446722;
      v21 = "MapsSuggestionsIPC.mm";
      __int16 v22 = 1026;
      int v23 = 201;
      __int16 v24 = 2082;
      v25 = "-[MapsSuggestionsDestinationdTrigger didAddFirstObserver]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", v20, 0x1Cu);
    }

LABEL_18:
  }
}

- (MapsSuggestionsDestinationdTrigger)init
{
  return [(MapsSuggestionsDestinationdTrigger *)self initWithName:@"MapsSuggestionsDestinationdTrigger"];
}

- (MapsSuggestionsDestinationdTrigger)initWithName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapsSuggestionsDestinationdTrigger;
  id v5 = [(MapsSuggestionsBaseTrigger *)&v10 initWithName:v4];
  id v6 = (MapsSuggestionsDestinationdTrigger *)v5;
  if (v5)
  {
    std::unique_ptr<MSg::NotificationReceiver>::reset[abi:ne180100]((uint64_t *)v5 + 4, 0);
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
    ignoredPeerIdentifiers = v6->_ignoredPeerIdentifiers;
    v6->_ignoredPeerIdentifiers = (NSSet *)v7;
  }
  return v6;
}

- (void)addIgnoredClientProcess:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1AD0C8E80]();
    id v6 = self;
    objc_sync_enter(v6);
    uint64_t v7 = [(NSSet *)v6->_ignoredPeerIdentifiers setByAddingObject:v4];
    ignoredPeerIdentifiers = v6->_ignoredPeerIdentifiers;
    v6->_ignoredPeerIdentifiers = (NSSet *)v7;

    objc_sync_exit(v6);
  }
  else
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446978;
      uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsIPC.mm";
      __int16 v12 = 1024;
      int v13 = 168;
      __int16 v14 = 2082;
      long long v15 = "-[MapsSuggestionsDestinationdTrigger addIgnoredClientProcess:]";
      __int16 v16 = 2082;
      long long v17 = "nil == (clientProcessName)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a process name", (uint8_t *)&v10, 0x26u);
    }
  }
}

- (void)didAddFirstObserver
{
  v3 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__MapsSuggestionsDestinationdTrigger_didAddFirstObserver__block_invoke;
  aBlock[3] = &unk_1E5CC3520;
  objc_copyWeak(&v5, &location);
  _Block_copy(aBlock);
  operator new();
}

- (void)didRemoveLastObserver
{
  v3 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  std::unique_ptr<MSg::NotificationReceiver>::reset[abi:ne180100]((uint64_t *)&self->_notificationReceiver, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredPeerIdentifiers, 0);
  std::unique_ptr<MSg::NotificationReceiver>::reset[abi:ne180100]((uint64_t *)&self->_notificationReceiver, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

@end