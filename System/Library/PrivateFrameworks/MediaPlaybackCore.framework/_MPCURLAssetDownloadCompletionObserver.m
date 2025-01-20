@interface _MPCURLAssetDownloadCompletionObserver
- (AVURLAsset)asset;
- (_MPCURLAssetDownloadCompletionObserver)initWithAsset:(id)a3;
- (id)completionHandler;
- (void)_downloadCompleteFailedNotification:(id)a3;
- (void)_downloadCompleteSuccessNotification:(id)a3;
- (void)_notifyCompletionHandlerWithSuccess:(BOOL)a3 error:(id)a4;
- (void)dealloc;
- (void)setCompletionHandler:(id)a3;
@end

@implementation _MPCURLAssetDownloadCompletionObserver

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_destroyWeak((id *)&self->_asset);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (AVURLAsset)asset
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_asset);

  return (AVURLAsset *)WeakRetained;
}

- (void)_notifyCompletionHandlerWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  v6 = [(_MPCURLAssetDownloadCompletionObserver *)self completionHandler];
  [(_MPCURLAssetDownloadCompletionObserver *)self setCompletionHandler:0];
  if (v6) {
    ((void (**)(void, BOOL, id))v6)[2](v6, v4, v7);
  }
}

- (void)_downloadCompleteFailedNotification:(id)a3
{
  id v5 = [a3 userInfo];
  BOOL v4 = [v5 objectForKey:*MEMORY[0x263EFA220]];
  [(_MPCURLAssetDownloadCompletionObserver *)self _notifyCompletionHandlerWithSuccess:0 error:v4];
}

- (void)_downloadCompleteSuccessNotification:(id)a3
{
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_asset);
  [v3 removeObserver:self name:*MEMORY[0x263EFA228] object:WeakRetained];
  [v3 removeObserver:self name:*MEMORY[0x263EFA218] object:WeakRetained];
  [(_MPCURLAssetDownloadCompletionObserver *)self _notifyCompletionHandlerWithSuccess:0 error:0];

  v5.receiver = self;
  v5.super_class = (Class)_MPCURLAssetDownloadCompletionObserver;
  [(_MPCURLAssetDownloadCompletionObserver *)&v5 dealloc];
}

- (_MPCURLAssetDownloadCompletionObserver)initWithAsset:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_MPCURLAssetDownloadCompletionObserver *)self init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_asset, v4);
    if (v4)
    {
      id v7 = [MEMORY[0x263F08A00] defaultCenter];
      [v7 addObserver:v6 selector:sel__downloadCompleteSuccessNotification_ name:*MEMORY[0x263EFA228] object:v4];
      [v7 addObserver:v6 selector:sel__downloadCompleteFailedNotification_ name:*MEMORY[0x263EFA218] object:v4];
    }
  }

  return v6;
}

@end