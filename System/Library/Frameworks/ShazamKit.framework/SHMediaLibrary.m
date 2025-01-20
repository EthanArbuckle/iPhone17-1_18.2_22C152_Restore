@interface SHMediaLibrary
+ (SHMediaLibrary)defaultLibrary;
- (SHMediaLibrarySyncDelegate)delegate;
- (_SHMediaLibrary)underlyingLibrary;
- (id)_init;
- (void)_library:(id)a3 didChangeWithSnapshot:(id)a4;
- (void)_library:(id)a3 didProduceError:(id)a4 failedItemIdentifiers:(id)a5;
- (void)_libraryDidCompleteSync:(id)a3;
- (void)_libraryInfoWithCompletionHandler:(id)a3;
- (void)_libraryWillBeginSync:(id)a3;
- (void)_queryLibraryWithCompletionHandler:(id)a3;
- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4;
- (void)_synchronize;
- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4;
- (void)addMediaItems:(NSArray *)mediaItems completionHandler:(void *)completionHandler;
- (void)setDelegate:(id)a3;
- (void)setUnderlyingLibrary:(id)a3;
@end

@implementation SHMediaLibrary

void __75___SHMediaLibrary_Presentation___presentMediaLibraryWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[SHError remapErrorToClientError:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54___SHMediaLibrary_Presentation__sh_uiServerConnection__block_invoke()
{
  v0 = [SHShazamKitUIServiceConnection alloc];
  id v3 = (id)objc_opt_new();
  uint64_t v1 = [(SHShazamKitUIServiceConnection *)v0 initWithConnectionProvider:v3];
  v2 = (void *)sh_uiServerConnection_serverConnection;
  sh_uiServerConnection_serverConnection = v1;
}

uint64_t __34___SHMediaLibrary__defaultLibrary__block_invoke()
{
  _defaultLibrary_library = objc_alloc_init(_SHMediaLibrary);

  return MEMORY[0x270F9A758]();
}

void __70___SHMediaLibrary__queryLibraryWithTask_parameters_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v7 = (id *)(a1 + 48);
  id v8 = a4;
  id v9 = a3;
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained removeInflightTask:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __58___SHMediaLibrary__libraryInfoWithTask_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (id *)(a1 + 48);
  id v6 = a3;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained removeInflightTask:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (SHMediaLibrary)defaultLibrary
{
  if (defaultLibrary_onceToken != -1) {
    dispatch_once(&defaultLibrary_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)defaultLibrary_library;

  return (SHMediaLibrary *)v2;
}

uint64_t __32__SHMediaLibrary_defaultLibrary__block_invoke()
{
  defaultLibrary_library = [[SHMediaLibrary alloc] _init];

  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)SHMediaLibrary;
  v2 = [(SHMediaLibrary *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[_SHMediaLibrary _defaultLibrary];
    underlyingLibrary = v2->_underlyingLibrary;
    v2->_underlyingLibrary = (_SHMediaLibrary *)v3;

    [(_SHMediaLibrary *)v2->_underlyingLibrary setDelegate:v2];
  }
  return v2;
}

- (void)addMediaItems:(NSArray *)mediaItems completionHandler:(void *)completionHandler
{
  objc_super v6 = completionHandler;
  v7 = mediaItems;
  id v8 = [(SHMediaLibrary *)self underlyingLibrary];
  [v8 _addMediaItems:v7 completionHandler:v6];
}

- (void)_libraryInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SHMediaLibrary *)self underlyingLibrary];
  [v5 _libraryInfoWithCompletionHandler:v4];
}

- (void)_queryLibraryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SHMediaLibrary *)self underlyingLibrary];
  [v5 _queryLibraryWithCompletionHandler:v4];
}

- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHMediaLibrary *)self underlyingLibrary];
  [v8 _queryLibraryWithParameters:v7 completionHandler:v6];
}

- (void)_synchronize
{
  id v2 = [(SHMediaLibrary *)self underlyingLibrary];
  [v2 _synchronize];
}

- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHMediaLibrary *)self underlyingLibrary];
  [v8 _synchronizeSnapshot:v7 startCondition:v6];
}

- (void)_libraryWillBeginSync:(id)a3
{
  id v4 = [(SHMediaLibrary *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SHMediaLibrary *)self delegate];
    [v6 _libraryWillBeginSync:self];
  }
}

- (void)_library:(id)a3 didChangeWithSnapshot:(id)a4
{
  id v8 = a4;
  char v5 = [(SHMediaLibrary *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SHMediaLibrary *)self delegate];
    [v7 _library:self didChangeWithSnapshot:v8];
  }
}

- (void)_library:(id)a3 didProduceError:(id)a4 failedItemIdentifiers:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(SHMediaLibrary *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(SHMediaLibrary *)self delegate];
    [v10 _library:self didProduceError:v11 failedItemIdentifiers:v7];
  }
}

- (void)_libraryDidCompleteSync:(id)a3
{
  id v4 = [(SHMediaLibrary *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SHMediaLibrary *)self delegate];
    [v6 _libraryDidCompleteSync:self];
  }
}

- (SHMediaLibrarySyncDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (SHMediaLibrarySyncDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_SHMediaLibrary)underlyingLibrary
{
  return self->_underlyingLibrary;
}

- (void)setUnderlyingLibrary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingLibrary, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end