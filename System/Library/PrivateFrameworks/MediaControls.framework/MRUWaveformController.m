@interface MRUWaveformController
- (BOOL)isAnalyzingAudio;
- (BOOL)isPlaying;
- (BOOL)isVisible;
- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3;
- (BOOL)routeSupportsWaveform;
- (CGSize)artworkFittingSize;
- (MPAVEndpointRoute)endpointRoute;
- (MRNowPlayingController)mrNowPlayingController;
- (MRUAudioAnalyzer)audioAnalyzer;
- (MRUNowPlayingController)nowPlayingController;
- (MRUWaveformController)init;
- (MRUWaveformControllerDelegate)delegate;
- (MRUWaveformData)waveform;
- (NSString)description;
- (NSString)trackIdentifier;
- (UIImage)artworkImage;
- (int)nowPlayingPID;
- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4;
- (void)audioAnalyzer:(id)a3 didUpdateWaveform:(id)a4;
- (void)controller:(id)a3 playerPathDidChange:(id)a4;
- (void)dealloc;
- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5;
- (void)routeDidUpdateNotification:(id)a3;
- (void)setArtworkFittingSize:(CGSize)a3;
- (void)setArtworkImage:(id)a3;
- (void)setAudioAnalyzer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndpointRoute:(id)a3;
- (void)setIsAnalyzingAudio:(BOOL)a3;
- (void)setMrNowPlayingController:(id)a3;
- (void)setNowPlayingController:(id)a3;
- (void)setNowPlayingPID:(int)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setRouteSupportsWaveform:(BOOL)a3;
- (void)setTrackIdentifier:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)setWaveform:(id)a3;
- (void)updateAnalyzer;
- (void)updateImage:(id)a3;
- (void)updateRoute:(id)a3;
@end

@implementation MRUWaveformController

- (MRUWaveformController)init
{
  v19.receiver = self;
  v19.super_class = (Class)MRUWaveformController;
  v2 = [(MRUWaveformController *)&v19 init];
  if (v2)
  {
    uint64_t v3 = +[MRUWaveformData zero];
    waveform = v2->_waveform;
    v2->_waveform = (MRUWaveformData *)v3;

    __asm { FMOV            V0.2D, #30.0 }
    v2->_artworkFittingSize = _Q0;
    id v10 = objc_alloc(MEMORY[0x1E4F77088]);
    v11 = [MEMORY[0x1E4F77020] proactiveDestination];
    v12 = (void *)[v10 initWithDestination:v11];

    v13 = [(MRNowPlayingController *)v2->_mrNowPlayingController configuration];
    [v13 setRequestPlaybackQueue:0];

    v14 = [(MRNowPlayingController *)v2->_mrNowPlayingController configuration];
    [v14 setRequestPlaybackState:0];

    v15 = [(MRNowPlayingController *)v2->_mrNowPlayingController configuration];
    [v15 setRequestSupportedCommands:0];

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F77080]) initWithConfiguration:v12];
    mrNowPlayingController = v2->_mrNowPlayingController;
    v2->_mrNowPlayingController = (MRNowPlayingController *)v16;

    [(MRNowPlayingController *)v2->_mrNowPlayingController setDelegate:v2];
    [(MRNowPlayingController *)v2->_mrNowPlayingController beginLoadingUpdates];
  }
  return v2;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p - analyzingAudio=%u playing=%u, visible=%u, routeSupportsWaveform=%u, pid=%u>", objc_opt_class(), self, self->_isAnalyzingAudio, self->_playing, self->_visible, self->_routeSupportsWaveform, self->_nowPlayingPID];
}

- (void)dealloc
{
  [(MRUAudioAnalyzer *)self->_audioAnalyzer removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)MRUWaveformController;
  [(MRUWaveformController *)&v3 dealloc];
}

- (void)updateAnalyzer
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_playing && self->_visible && self->_routeSupportsWaveform && self->_nowPlayingPID)
  {
    if ([(MRUAudioAnalyzer *)self->_audioAnalyzer pid] != self->_nowPlayingPID)
    {
      objc_super v3 = MCLogCategoryDefault();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int nowPlayingPID = self->_nowPlayingPID;
        int v13 = 138412546;
        v14 = self;
        __int16 v15 = 1024;
        LODWORD(v16) = nowPlayingPID;
        _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "%@ Creating new audio analyzer for PID: %u", (uint8_t *)&v13, 0x12u);
      }

      [(MRUAudioAnalyzer *)self->_audioAnalyzer removeObserver:self];
      self->_isAnalyzingAudio = 0;
      v5 = +[MRUAudioAnalyzer audioAnalyzerForPID:self->_nowPlayingPID];
      audioAnalyzer = self->_audioAnalyzer;
      self->_audioAnalyzer = v5;
    }
    if (!self->_isAnalyzingAudio)
    {
      v7 = +[MRUWaveformData zero];
      [(MRUWaveformController *)self setWaveform:v7];

      v8 = MCLogCategoryDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = self->_audioAnalyzer;
        int v13 = 138412546;
        v14 = self;
        __int16 v15 = 2112;
        uint64_t v16 = v9;
        _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, "%@ Starting audio analyzer: %@", (uint8_t *)&v13, 0x16u);
      }

      [(MRUAudioAnalyzer *)self->_audioAnalyzer addObserver:self];
      self->_isAnalyzingAudio = 1;
    }
  }
  else if (self->_audioAnalyzer && self->_isAnalyzingAudio)
  {
    id v10 = MCLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_audioAnalyzer;
      int v13 = 138412546;
      v14 = self;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1AE7DF000, v10, OS_LOG_TYPE_DEFAULT, "%@ Stopping audio analyzer: %@", (uint8_t *)&v13, 0x16u);
    }

    [(MRUAudioAnalyzer *)self->_audioAnalyzer removeObserver:self];
    self->_isAnalyzingAudio = 0;
    v12 = +[MRUWaveformData zero];
    [(MRUWaveformController *)self setWaveform:v12];
  }
}

- (void)setNowPlayingController:(id)a3
{
  v5 = (MRUNowPlayingController *)a3;
  nowPlayingController = self->_nowPlayingController;
  v11 = v5;
  if (nowPlayingController != v5)
  {
    [(MRUNowPlayingController *)nowPlayingController removeObserver:self];
    objc_storeStrong((id *)&self->_nowPlayingController, a3);
    v7 = [(MRUNowPlayingController *)v11 metadataController];
    v8 = [v7 nowPlayingInfo];
    -[MRUWaveformController setPlaying:](self, "setPlaying:", [v8 isPlaying]);

    v9 = [(MRUNowPlayingController *)v11 endpointController];
    id v10 = [v9 route];
    [(MRUWaveformController *)self setEndpointRoute:v10];

    [(MRUNowPlayingController *)v11 addObserver:self];
  }
}

- (void)setNowPlayingPID:(int)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_nowPlayingPID != a3)
  {
    v5 = MCLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int nowPlayingPID = self->_nowPlayingPID;
      int v7 = 138412802;
      v8 = self;
      __int16 v9 = 1024;
      int v10 = nowPlayingPID;
      __int16 v11 = 1024;
      int v12 = a3;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "%@ nowPlaying PID changing from: %u to: %u", (uint8_t *)&v7, 0x18u);
    }

    self->_int nowPlayingPID = a3;
    [(MRUWaveformController *)self updateAnalyzer];
  }
}

- (void)setVisible:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_visible != a3)
  {
    BOOL v3 = a3;
    self->_visible = a3;
    v5 = MCLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      v8 = self;
      __int16 v9 = 1024;
      BOOL v10 = v3;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "%@ isVisible changed to: %u", (uint8_t *)&v7, 0x12u);
    }

    [(MRUWaveformController *)self updateRoute:self->_endpointRoute];
    [(MRUWaveformController *)self updateAnalyzer];
    v6 = [(MRUWaveformController *)self nowPlayingController];
    [v6 updateAutomaticResponseLoading];
  }
}

- (void)setPlaying:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_playing != a3)
  {
    BOOL v3 = a3;
    self->_playing = a3;
    v5 = MCLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      int v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "%@ isPlaying changed to: %u", (uint8_t *)&v6, 0x12u);
    }

    [(MRUWaveformController *)self updateAnalyzer];
  }
}

- (void)setWaveform:(id)a3
{
  objc_storeStrong((id *)&self->_waveform, a3);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained waveformController:self waveformDidChange:v5];
}

- (void)setRouteSupportsWaveform:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_routeSupportsWaveform != a3)
  {
    BOOL v3 = a3;
    self->_routeSupportsWaveform = a3;
    id v5 = MCLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      int v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "%@ routeSupportsWaveform changed to: %{BOOL}u", (uint8_t *)&v6, 0x12u);
    }

    [(MRUWaveformController *)self updateAnalyzer];
  }
}

- (void)setArtworkImage:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImage, a3);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained waveformController:self artworkImageDidChange:v5];
}

- (void)setEndpointRoute:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = (MPAVEndpointRoute *)a3;
  if (self->_endpointRoute != v5)
  {
    objc_storeStrong((id *)&self->_endpointRoute, a3);
    int v6 = MCLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      uint64_t v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "%@ endpointRoute changed to: %@", (uint8_t *)&v10, 0x16u);
    }

    int v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v8 = *MEMORY[0x1E4F31240];
    [v7 removeObserver:self name:*MEMORY[0x1E4F31240] object:0];

    [(MRUWaveformController *)self updateRoute:v5];
    if (v5)
    {
      BOOL v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 addObserver:self selector:sel_routeDidUpdateNotification_ name:v8 object:v5];
    }
  }
}

- (void)routeDidUpdateNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MRUWaveformController_routeDidUpdateNotification___block_invoke;
  block[3] = &unk_1E5F0D7F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __52__MRUWaveformController_routeDidUpdateNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRoute:*(void *)(*(void *)(a1 + 32) + 64)];
}

- (void)updateRoute:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = MCLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v21 = self;
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_INFO, "%@ updating info from route: %@", buf, 0x16u);
  }

  int v6 = [v4 endpointObject];
  int v7 = [v6 outputDevices];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 0;
    char v11 = 0;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v14 isLocalDevice])
        {
          if ([v14 deviceSubtype] == 19
            || [v14 deviceType] == 3)
          {
            char v11 = 1;
          }
        }
        else
        {
          char v10 = 1;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  else
  {
    char v10 = 0;
    char v11 = 0;
  }
  [(MRUWaveformController *)self setRouteSupportsWaveform:((v10 | v11) & 1) == 0];
}

- (void)updateImage:(id)a3
{
  +[MRUImageUtilities formatImage:forDisplayAtSize:](MRUImageUtilities, "formatImage:forDisplayAtSize:", a3, self->_artworkFittingSize.width, self->_artworkFittingSize.height);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(MRUWaveformController *)self setArtworkImage:v4];
}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
}

- (void)audioAnalyzer:(id)a3 didUpdateWaveform:(id)a4
{
}

- (void)controller:(id)a3 playerPathDidChange:(id)a4
{
  id v5 = objc_msgSend(a4, "client", a3);
  int v6 = [v5 processIdentifier];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__MRUWaveformController_controller_playerPathDidChange___block_invoke;
  v7[3] = &unk_1E5F0E2E8;
  v7[4] = self;
  int v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __56__MRUWaveformController_controller_playerPathDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNowPlayingPID:*(unsigned int *)(a1 + 40)];
}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  return self->_visible;
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__MRUWaveformController_nowPlayingController_metadataController_didChangeNowPlayingInfo___block_invoke;
  v8[3] = &unk_1E5F0D8E8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __89__MRUWaveformController_nowPlayingController_metadataController_didChangeNowPlayingInfo___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPlaying:", objc_msgSend(*(id *)(a1 + 40), "isPlaying"));
  v2 = [*(id *)(a1 + 40) identifier];
  char v3 = [v2 isEqual:*(void *)(*(void *)(a1 + 32) + 72)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = [*(id *)(a1 + 40) identifier];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v4;

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [WeakRetained waveformControllerTrackDidChange:*(void *)(a1 + 32)];
  }
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__MRUWaveformController_nowPlayingController_endpointController_didChangeRoute___block_invoke;
  v8[3] = &unk_1E5F0D8E8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __80__MRUWaveformController_nowPlayingController_endpointController_didChangeRoute___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEndpointRoute:*(void *)(a1 + 40)];
}

- (MRUWaveformData)waveform
{
  return self->_waveform;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)routeSupportsWaveform
{
  return self->_routeSupportsWaveform;
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (MRUNowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (MRUWaveformControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUWaveformControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRUAudioAnalyzer)audioAnalyzer
{
  return self->_audioAnalyzer;
}

- (void)setAudioAnalyzer:(id)a3
{
}

- (MRNowPlayingController)mrNowPlayingController
{
  return self->_mrNowPlayingController;
}

- (void)setMrNowPlayingController:(id)a3
{
}

- (MPAVEndpointRoute)endpointRoute
{
  return self->_endpointRoute;
}

- (BOOL)isAnalyzingAudio
{
  return self->_isAnalyzingAudio;
}

- (void)setIsAnalyzingAudio:(BOOL)a3
{
  self->_isAnalyzingAudio = a3;
}

- (CGSize)artworkFittingSize
{
  double width = self->_artworkFittingSize.width;
  double height = self->_artworkFittingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setArtworkFittingSize:(CGSize)a3
{
  self->_artworkFittingSize = a3;
}

- (NSString)trackIdentifier
{
  return self->_trackIdentifier;
}

- (void)setTrackIdentifier:(id)a3
{
}

- (int)nowPlayingPID
{
  return self->_nowPlayingPID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointRoute, 0);
  objc_storeStrong((id *)&self->_mrNowPlayingController, 0);
  objc_storeStrong((id *)&self->_audioAnalyzer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nowPlayingController, 0);
  objc_storeStrong((id *)&self->_artworkImage, 0);

  objc_storeStrong((id *)&self->_waveform, 0);
}

@end