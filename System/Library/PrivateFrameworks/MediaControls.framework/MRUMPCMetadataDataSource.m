@interface MRUMPCMetadataDataSource
- (MPCPlayerResponse)response;
- (MRUArtwork)artwork;
- (MRUEndpointController)endpointController;
- (MRUMPCMetadataDataSource)init;
- (MRUMPCMetadataDataSource)initWithEndpointController:(id)a3;
- (MRUMPCMetadataDataSource)initWithResponse:(id)a3;
- (MRUMetadataDataSourceDelegate)delegate;
- (MRUNowPlayingInfo)nowPlayingInfo;
- (MRUTimeControls)timeControls;
- (MRUTransportControls)transportControls;
- (NSString)bundleID;
- (NSString)description;
- (id)_stateDumpObject;
- (id)placeholder;
- (unint64_t)stateHandle;
- (void)dealloc;
- (void)endpointController:(id)a3 didChangeResponse:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setResponse:(id)a3;
- (void)setStateHandle:(unint64_t)a3;
- (void)updateArtwork;
- (void)updateArtworkWithResponse:(id)a3;
- (void)updateBundleIDWithResponse:(id)a3;
- (void)updateData;
- (void)updateNowPlayingInfoWithResponse:(id)a3;
- (void)updateTimeControlsWithResponse:(id)a3;
- (void)updateTransportControlsWithResponse:(id)a3;
@end

@implementation MRUMPCMetadataDataSource

- (MRUMPCMetadataDataSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)MRUMPCMetadataDataSource;
  v2 = [(MRUMPCMetadataDataSource *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __32__MRUMPCMetadataDataSource_init__block_invoke;
    v5[3] = &unk_1E5F0DEA0;
    v6 = v2;
    v6->_stateHandle = __32__MRUMPCMetadataDataSource_init__block_invoke((uint64_t)v5);
  }
  return v3;
}

uint64_t __32__MRUMPCMetadataDataSource_init__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [NSString stringWithFormat:@"%@: %p", objc_opt_class(), *(void *)(a1 + 32)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__MRUMPCMetadataDataSource_init__block_invoke_2;
  v5[3] = &unk_1E5F0DE78;
  objc_copyWeak(&v6, &location);
  uint64_t v3 = MCLogAddStateHandlerWithName(v2, v5);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

id __32__MRUMPCMetadataDataSource_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v3 = WeakRetained;
    if (WeakRetained)
    {
      v4 = [WeakRetained _stateDumpObject];
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (MRUMPCMetadataDataSource)initWithEndpointController:(id)a3
{
  id v5 = a3;
  id v6 = [(MRUMPCMetadataDataSource *)self init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointController, a3);
    [v5 addObserver:v7];
    [(MRUMPCMetadataDataSource *)v7 updateData];
  }

  return v7;
}

- (MRUMPCMetadataDataSource)initWithResponse:(id)a3
{
  id v5 = a3;
  id v6 = [(MRUMPCMetadataDataSource *)self init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_response, a3);
    [(MRUMPCMetadataDataSource *)v7 updateData];
  }

  return v7;
}

- (void)dealloc
{
  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)MRUMPCMetadataDataSource;
  [(MRUMPCMetadataDataSource *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%@ (%@) | (%@) | (%@) | (%@) | (%@)", objc_opt_class(), self->_bundleID, self->_artwork, self->_nowPlayingInfo, self->_timeControls, self->_transportControls];
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);

  [(MRUMPCMetadataDataSource *)self updateData];
}

- (void)endpointController:(id)a3 didChangeResponse:(id)a4
{
}

- (void)updateData
{
  objc_super v3 = self->_response;
  [(MRUMPCMetadataDataSource *)self updateBundleIDWithResponse:v3];
  [(MRUMPCMetadataDataSource *)self updateNowPlayingInfoWithResponse:v3];
  [(MRUMPCMetadataDataSource *)self updateTimeControlsWithResponse:v3];
  [(MRUMPCMetadataDataSource *)self updateTransportControlsWithResponse:v3];
  [(MRUMPCMetadataDataSource *)self updateArtworkWithResponse:v3];
}

- (void)updateBundleIDWithResponse:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = [(MRUEndpointController *)self->_endpointController endpointController];
  id v5 = [v4 representedBundleID];
  if (![(NSString *)self->_bundleID isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_bundleID, v5);
    id v6 = MCLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      uint64_t v9 = objc_opt_class();
      __int16 v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ update bundleID: %{public}@", (uint8_t *)&v8, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained metadataDataSource:self didChangeBundleID:v5];
  }
}

- (void)updateArtwork
{
}

- (void)updateArtworkWithResponse:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[MRUArtwork alloc] initWithMPCResponse:v4];

  if (![(MRUArtwork *)self->_artwork isEqual:v5])
  {
    objc_storeStrong((id *)&self->_artwork, v5);
    id v6 = [(MRUArtwork *)v5 catalog];
    objc_super v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    [v6 setCacheIdentifier:v8 forCacheReference:self];

    uint64_t v9 = MCLogCategoryDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      uint64_t v12 = objc_opt_class();
      __int16 v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ update artwork: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained metadataDataSource:self didChangeArtwork:v5];
  }
}

- (void)updateNowPlayingInfoWithResponse:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MRUNowPlayingInfo alloc];
  id v6 = [(MRUMPCMetadataDataSource *)self placeholder];
  objc_super v7 = [(MRUNowPlayingInfo *)v5 initWithMPCResponse:v4 placeholder:v6];

  if (![(MRUNowPlayingInfo *)self->_nowPlayingInfo isEqual:v7])
  {
    objc_storeStrong((id *)&self->_nowPlayingInfo, v7);
    int v8 = MCLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      uint64_t v11 = objc_opt_class();
      __int16 v12 = 2114;
      __int16 v13 = v7;
      _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ update metadata: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained metadataDataSource:self didChangeNowPlayingInfo:v7];
  }
}

- (void)updateTimeControlsWithResponse:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MRUTimeControls alloc];
  id v6 = [v4 tracklist];

  objc_super v7 = [v6 playingItem];
  int v8 = [(MRUTimeControls *)v5 initWithResponseItem:v7];

  if (![(MRUTimeControls *)self->_timeControls isEqual:v8])
  {
    objc_storeStrong((id *)&self->_timeControls, v8);
    uint64_t v9 = MCLogCategoryDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      uint64_t v12 = objc_opt_class();
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ update time controls: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained metadataDataSource:self didChangeTimeControls:v8];
  }
}

- (void)updateTransportControlsWithResponse:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[MRUTransportControls alloc] initWithMPCResponse:v4];

  objc_storeStrong((id *)&self->_transportControls, v5);
  id v6 = MCLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    uint64_t v9 = objc_opt_class();
    __int16 v10 = 2114;
    int v11 = v5;
    _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ update transport controls: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained metadataDataSource:self didChangeTransportControls:v5];
}

- (id)placeholder
{
  v2 = [(MRUEndpointController *)self->_endpointController state];
  switch((unint64_t)v2)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      v2 = +[MRUStringsProvider notConnected];
      break;
    case 0uLL:
    case 1uLL:
      v2 = +[MRUStringsProvider connecting];
      break;
    case 2uLL:
      v2 = +[MRUStringsProvider loading];
      break;
    case 3uLL:
      v2 = +[MRUStringsProvider notPlaying];
      break;
    default:
      break;
  }

  return v2;
}

- (id)_stateDumpObject
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v9[0] = @"bundleID";
  v9[1] = @"artwork";
  bundleID = (__CFString *)self->_bundleID;
  artwork = self->_artwork;
  if (!bundleID) {
    bundleID = @"<NONE>";
  }
  if (!artwork) {
    artwork = (MRUArtwork *)@"<NONE>";
  }
  v10[0] = bundleID;
  v10[1] = artwork;
  v9[2] = @"nowPlayingInfo";
  v9[3] = @"timeControls";
  timeControls = self->_timeControls;
  nowPlayingInfo = self->_nowPlayingInfo;
  if (!nowPlayingInfo) {
    nowPlayingInfo = (MRUNowPlayingInfo *)@"<NONE>";
  }
  if (!timeControls) {
    timeControls = (MRUTimeControls *)@"<NONE>";
  }
  v10[2] = nowPlayingInfo;
  v10[3] = timeControls;
  v9[4] = @"transportControls";
  transportControls = self->_transportControls;
  if (!transportControls) {
    transportControls = (MRUTransportControls *)@"<NONE>";
  }
  v10[4] = transportControls;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (MRUArtwork)artwork
{
  return self->_artwork;
}

- (MRUTimeControls)timeControls
{
  return self->_timeControls;
}

- (MRUNowPlayingInfo)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (MRUTransportControls)transportControls
{
  return self->_transportControls;
}

- (MRUMetadataDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUMetadataDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRUEndpointController)endpointController
{
  return self->_endpointController;
}

- (MPCPlayerResponse)response
{
  return self->_response;
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_endpointController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transportControls, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_timeControls, 0);
  objc_storeStrong((id *)&self->_artwork, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end