@interface MRUMRMetadataDataSource
- (MRNowPlayingPlayerResponse)response;
- (MRUArtwork)artwork;
- (MRUEndpointController)endpointController;
- (MRUMRMetadataDataSource)init;
- (MRUMRMetadataDataSource)initWithEndpointController:(id)a3 response:(id)a4;
- (MRUMetadataDataSourceDelegate)delegate;
- (MRUNowPlayingInfo)nowPlayingInfo;
- (MRUTimeControls)timeControls;
- (MRUTransportControls)transportControls;
- (NSString)bundleID;
- (NSString)description;
- (id)_stateDumpObject;
- (id)placeholder;
- (id)placeholderSymbolName;
- (unint64_t)stateHandle;
- (void)dealloc;
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

@implementation MRUMRMetadataDataSource

- (MRUMRMetadataDataSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)MRUMRMetadataDataSource;
  v2 = [(MRUMRMetadataDataSource *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __31__MRUMRMetadataDataSource_init__block_invoke;
    v5[3] = &unk_1E5F0DEA0;
    v6 = v2;
    v6->_stateHandle = __31__MRUMRMetadataDataSource_init__block_invoke((uint64_t)v5);
  }
  return v3;
}

uint64_t __31__MRUMRMetadataDataSource_init__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [NSString stringWithFormat:@"%@: %p", objc_opt_class(), *(void *)(a1 + 32)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__MRUMRMetadataDataSource_init__block_invoke_2;
  v5[3] = &unk_1E5F0DE78;
  objc_copyWeak(&v6, &location);
  uint64_t v3 = MCLogAddStateHandlerWithName(v2, v5);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

id __31__MRUMRMetadataDataSource_init__block_invoke_2(uint64_t a1, uint64_t a2)
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

- (MRUMRMetadataDataSource)initWithEndpointController:(id)a3 response:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(MRUMRMetadataDataSource *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endpointController, a3);
    [v7 addObserver:v10];
    objc_storeStrong((id *)&v10->_response, a4);
    [(MRUMRMetadataDataSource *)v10 updateData];
  }

  return v10;
}

- (void)dealloc
{
  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)MRUMRMetadataDataSource;
  [(MRUMRMetadataDataSource *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%@ (%@) | (%@) | (%@) | (%@) | (%@)", objc_opt_class(), self->_bundleID, self->_artwork, self->_nowPlayingInfo, self->_timeControls, self->_transportControls];
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);

  [(MRUMRMetadataDataSource *)self updateData];
}

- (void)updateData
{
  objc_super v3 = self->_response;
  [(MRUMRMetadataDataSource *)self updateBundleIDWithResponse:v3];
  [(MRUMRMetadataDataSource *)self updateArtworkWithResponse:v3];
  [(MRUMRMetadataDataSource *)self updateNowPlayingInfoWithResponse:v3];
  [(MRUMRMetadataDataSource *)self updateTimeControlsWithResponse:v3];
  [(MRUMRMetadataDataSource *)self updateTransportControlsWithResponse:v3];
}

- (void)updateBundleIDWithResponse:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = [a3 playerPath];
  v5 = [v4 client];
  id v6 = [v5 bundleIdentifier];

  if (![(NSString *)self->_bundleID isEqualToString:v6])
  {
    objc_storeStrong((id *)&self->_bundleID, v6);
    id v7 = MCLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543618;
      uint64_t v10 = objc_opt_class();
      __int16 v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ update bundleID: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained metadataDataSource:self didChangeBundleID:v6];
  }
}

- (void)updateArtwork
{
}

- (void)updateArtworkWithResponse:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = [a3 playbackQueue];
  v5 = [v4 contentItems];
  id v6 = [v5 firstObject];
  id v7 = [v6 artwork];
  id v8 = [v7 imageData];

  if (v8) {
    int v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithData:v8];
  }
  else {
    int v9 = 0;
  }
  uint64_t v10 = [[MRUArtwork alloc] initWithImage:v9];
  if (![(MRUArtwork *)self->_artwork isEqual:v10])
  {
    objc_storeStrong((id *)&self->_artwork, v10);
    __int16 v11 = [(MRUArtwork *)v10 catalog];
    v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    [v11 setCacheIdentifier:v13 forCacheReference:self];

    v14 = MCLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543618;
      uint64_t v17 = objc_opt_class();
      __int16 v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_1AE7DF000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ update artwork: %{public}@", (uint8_t *)&v16, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained metadataDataSource:self didChangeArtwork:v10];
  }
}

- (void)updateNowPlayingInfoWithResponse:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MRUNowPlayingInfo alloc];
  id v6 = [(MRUMRMetadataDataSource *)self placeholder];
  id v7 = [(MRUNowPlayingInfo *)v5 initWithMRResponse:v4 placeholder:v6];

  if (![(MRUNowPlayingInfo *)self->_nowPlayingInfo isEqual:v7])
  {
    objc_storeStrong((id *)&self->_nowPlayingInfo, v7);
    id v8 = MCLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      uint64_t v11 = objc_opt_class();
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ update metadata: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained metadataDataSource:self didChangeNowPlayingInfo:v7];
  }
}

- (void)updateTimeControlsWithResponse:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MRUTimeControls);
  if (![(MRUTimeControls *)self->_timeControls isEqual:v4])
  {
    objc_storeStrong((id *)&self->_timeControls, v4);
    v5 = MCLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543618;
      uint64_t v8 = objc_opt_class();
      __int16 v9 = 2114;
      int v10 = v4;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ update time controls: %{public}@", (uint8_t *)&v7, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained metadataDataSource:self didChangeTimeControls:v4];
  }
}

- (void)updateTransportControlsWithResponse:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MRUTransportControls);
  if (![(MRUTransportControls *)self->_transportControls isEqual:v4])
  {
    objc_storeStrong((id *)&self->_transportControls, v4);
    v5 = MCLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543618;
      uint64_t v8 = objc_opt_class();
      __int16 v9 = 2114;
      int v10 = v4;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ update transport controls: %{public}@", (uint8_t *)&v7, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained metadataDataSource:self didChangeTransportControls:v4];
  }
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

- (id)placeholderSymbolName
{
  uint64_t v3 = [(MRUEndpointController *)self->_endpointController route];
  if (v3
    && (id v4 = (void *)v3,
        BOOL v5 = [(MRUEndpointController *)self->_endpointController isDeviceSystemRoute],
        v4,
        v5))
  {
    id v6 = [MEMORY[0x1E4F31850] _currentDeviceRoutingSymbolName];
  }
  else
  {
    int v7 = (void *)MEMORY[0x1E4F31850];
    uint64_t v8 = [(MRUEndpointController *)self->_endpointController route];
    id v6 = [v7 _symbolNameForRoute:v8];
  }

  return v6;
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
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];

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

- (MRNowPlayingPlayerResponse)response
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