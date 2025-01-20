@interface SHMediaLibraryTask
- (NSError)syncError;
- (NSUUID)identifier;
- (SHMediaLibrarySyncDelegate)delegate;
- (SHMediaLibraryTask)init;
- (SHRemoteMediaLibrary)remoteLibrary;
- (id)syncCompletionBlock;
- (void)_initWithRemoteLibrary:(id)a3;
- (void)_library:(id)a3 didChangeWithSnapshot:(id)a4;
- (void)_library:(id)a3 didProduceError:(id)a4 failedItemIdentifiers:(id)a5;
- (void)_libraryDidCompleteSync:(id)a3;
- (void)_libraryInfoWithCompletionHandler:(id)a3;
- (void)_libraryWillBeginSync:(id)a3;
- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4;
- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setRemoteLibrary:(id)a3;
- (void)setSyncCompletionBlock:(id)a3;
- (void)setSyncError:(id)a3;
@end

@implementation SHMediaLibraryTask

- (SHMediaLibraryTask)init
{
  v7.receiver = self;
  v7.super_class = (Class)SHMediaLibraryTask;
  v2 = [(SHMediaLibraryTask *)&v7 init];
  if (v2)
  {
    v3 = [SHShazamKitServiceConnection alloc];
    v4 = objc_opt_new();
    v5 = [(SHShazamKitServiceConnection *)v3 initWithConnectionProvider:v4];
    [(SHMediaLibraryTask *)v2 _initWithRemoteLibrary:v5];
  }
  return v2;
}

- (void)_initWithRemoteLibrary:(id)a3
{
  v4 = (SHRemoteMediaLibrary *)a3;
  v5 = [MEMORY[0x263F08C38] UUID];
  identifier = self->_identifier;
  self->_identifier = v5;

  remoteLibrary = self->_remoteLibrary;
  self->_remoteLibrary = v4;
  v8 = v4;

  [(SHRemoteMediaLibrary *)self->_remoteLibrary setDelegate:self];
}

- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHMediaLibraryTask *)self remoteLibrary];
  [v8 _synchronizeSnapshot:v7 startCondition:v6];
}

- (void)_libraryInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SHMediaLibraryTask *)self remoteLibrary];
  [v5 _libraryInfoWithCompletionHandler:v4];
}

- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHMediaLibraryTask *)self remoteLibrary];
  [v8 _queryLibraryWithParameters:v7 completionHandler:v6];
}

- (void)_libraryWillBeginSync:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = sh_log_object();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(SHMediaLibraryTask *)self identifier];
    id v6 = [v5 UUIDString];
    int v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_224B4B000, v4, OS_LOG_TYPE_DEFAULT, "Library sync task <ID:%@> will begin", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [(SHMediaLibraryTask *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(SHMediaLibraryTask *)self delegate];
    [v9 _libraryWillBeginSync:self];
  }
}

- (void)_library:(id)a3 didChangeWithSnapshot:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = sh_log_object();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(SHMediaLibraryTask *)self identifier];
    char v8 = [v7 UUIDString];
    int v12 = 138412546;
    v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_224B4B000, v6, OS_LOG_TYPE_DEFAULT, "Library sync task <ID:%@> produced changes %@", (uint8_t *)&v12, 0x16u);
  }
  v9 = [(SHMediaLibraryTask *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(SHMediaLibraryTask *)self delegate];
    [v11 _library:self didChangeWithSnapshot:v5];
  }
}

- (void)_library:(id)a3 didProduceError:(id)a4 failedItemIdentifiers:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = sh_log_object();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    char v10 = [(SHMediaLibraryTask *)self identifier];
    v11 = [v10 UUIDString];
    int v15 = 138412546;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_224B4B000, v9, OS_LOG_TYPE_ERROR, "Library sync task <ID:%@> produced error %@", (uint8_t *)&v15, 0x16u);
  }
  [(SHMediaLibraryTask *)self setSyncError:v7];
  int v12 = [(SHMediaLibraryTask *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    __int16 v14 = [(SHMediaLibraryTask *)self delegate];
    [v14 _library:self didProduceError:v7 failedItemIdentifiers:v8];
  }
}

- (void)_libraryDidCompleteSync:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = sh_log_object();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(SHMediaLibraryTask *)self identifier];
    id v6 = [v5 UUIDString];
    int v13 = 138412290;
    __int16 v14 = v6;
    _os_log_impl(&dword_224B4B000, v4, OS_LOG_TYPE_DEFAULT, "Library sync task <ID:%@> execution complete", (uint8_t *)&v13, 0xCu);
  }
  id v7 = [(SHMediaLibraryTask *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(SHMediaLibraryTask *)self delegate];
    [v9 _libraryDidCompleteSync:self];
  }
  char v10 = [(SHMediaLibraryTask *)self syncCompletionBlock];

  if (v10)
  {
    v11 = [(SHMediaLibraryTask *)self syncCompletionBlock];
    int v12 = [(SHMediaLibraryTask *)self syncError];
    ((void (**)(void, void *))v11)[2](v11, v12);
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

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)syncCompletionBlock
{
  return self->_syncCompletionBlock;
}

- (void)setSyncCompletionBlock:(id)a3
{
}

- (SHRemoteMediaLibrary)remoteLibrary
{
  return self->_remoteLibrary;
}

- (void)setRemoteLibrary:(id)a3
{
}

- (NSError)syncError
{
  return self->_syncError;
}

- (void)setSyncError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncError, 0);
  objc_storeStrong((id *)&self->_remoteLibrary, 0);
  objc_storeStrong(&self->_syncCompletionBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end