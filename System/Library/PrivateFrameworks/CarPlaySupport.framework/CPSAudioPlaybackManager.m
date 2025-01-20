@interface CPSAudioPlaybackManager
- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshotForNowPlayingViewController:(SEL)a3;
- (BOOL)actionStateHeld;
- (BOOL)nowPlayingViewController:(id)a3 buttonShouldBeActive:(int64_t)a4;
- (BOOL)nowPlayingViewController:(id)a3 shouldDisplayButton:(int64_t)a4 withImage:(id *)a5 existingIdentifier:(id)a6 tinted:(BOOL *)a7;
- (BOOL)nowPlayingViewControllerCanRepeat:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowAddToLibrary:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowAlbumArt:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowAlbumLink:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowChangePlaybackRate:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowMore:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowUpNext:(id)a3;
- (BOOL)nowPlayingViewControllerCanShuffle:(id)a3;
- (BOOL)nowPlayingViewControllerIsPlaying:(id)a3;
- (BOOL)nowPlayingViewControllerIsRightHandDrive:(id)a3;
- (BOOL)nowPlayingViewControllerIsShowingExplicitTrack:(id)a3;
- (BOOL)shouldShowAlbumArt;
- (BOOL)shouldShowPlayState;
- (CPNowPlayingClientTemplateDelegate)templateDelegate;
- (CPNowPlayingTemplate)template;
- (CPSAudioPlaybackManager)initWithNowPlayingTemplate:(id)a3 templateDelegate:(id)a4 environment:(id)a5;
- (CPSNowPlayingViewController)nowPlayingViewController;
- (CPSTemplateEnvironment)environment;
- (CPUINowPlayingManager)nowPlayingManager;
- (CPUINowPlayingSnapshot)lastSnapshot;
- (MPArtworkCatalog)artworkCatalog;
- (NSNumber)lastSavedPlaybackRate;
- (UIImage)fullSizeArtwork;
- (id)albumTextForNowPlayingController:(id)a3;
- (id)artistTextForNowPlayingController:(id)a3;
- (id)backgroundArtForNowPlayingController:(id)a3;
- (id)customPlaybackControlButtonsForNowPlayingViewController:(id)a3;
- (id)nowPlayingButtonWithClass:(Class)a3;
- (id)nowPlayingButtonWithIdentifier:(id)a3;
- (id)nowPlayingViewControllerGetPlaybackRate:(id)a3;
- (id)progressBarLocalizedDurationStringForNowPlayingViewController:(id)a3;
- (id)titleForNowPlayingController:(id)a3;
- (id)titleForUpNextInNowPlayingViewController:(id)a3;
- (int64_t)placeholderTypeForNowPlayingViewController:(id)a3;
- (int64_t)repeatTypeForNowPlayingViewController:(id)a3;
- (int64_t)shuffleTypeForNowPlayingViewController:(id)a3;
- (void)_loadArtwork:(id)a3;
- (void)_updateAlbumArtFromSessionConfiguration:(id)a3;
- (void)dealloc;
- (void)nowPlayingManager:(id)a3 didThrottleUpdateForBundleIdentifier:(id)a4;
- (void)nowPlayingManager:(id)a3 didUpdateSnapshot:(id)a4;
- (void)nowPlayingViewController:(id)a3 didSelectButton:(id)a4;
- (void)nowPlayingViewController:(id)a3 didSendAction:(int64_t)a4 state:(int64_t)a5;
- (void)nowPlayingViewControllerAddToLibrary:(id)a3;
- (void)nowPlayingViewControllerAlbumArtistButtonTapped:(id)a3;
- (void)nowPlayingViewControllerChangePlaybackRate:(id)a3;
- (void)nowPlayingViewControllerMore:(id)a3;
- (void)nowPlayingViewControllerToggleRepeat:(id)a3;
- (void)nowPlayingViewControllerToggleShuffle:(id)a3;
- (void)nowPlayingViewControllerUpNextButtonTapped:(id)a3;
- (void)nowPlayingViewControllerWillAppear:(id)a3;
- (void)session:(id)a3 didUpdateConfiguration:(id)a4;
- (void)setActionStateHeld:(BOOL)a3;
- (void)setArtworkCatalog:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setFullSizeArtwork:(id)a3;
- (void)setLastSavedPlaybackRate:(id)a3;
- (void)setLastSnapshot:(id)a3;
- (void)setNowPlayingManager:(id)a3;
- (void)setNowPlayingViewController:(id)a3;
- (void)setShouldShowAlbumArt:(BOOL)a3;
- (void)setShouldShowPlayState:(BOOL)a3;
- (void)setTemplateDelegate:(id)a3;
- (void)updateNowPlayingTemplate:(id)a3 templateDelegate:(id)a4;
@end

@implementation CPSAudioPlaybackManager

- (CPSAudioPlaybackManager)initWithNowPlayingTemplate:(id)a3 templateDelegate:(id)a4 environment:(id)a5
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  id v18 = 0;
  objc_storeStrong(&v18, a5);
  v5 = v21;
  v21 = 0;
  v17.receiver = v5;
  v17.super_class = (Class)CPSAudioPlaybackManager;
  v15 = [(CPSAudioPlaybackManager *)&v17 init];
  v21 = v15;
  objc_storeStrong((id *)&v21, v15);
  if (v15)
  {
    objc_storeStrong((id *)&v21->_templateDelegate, v19);
    objc_storeStrong((id *)&v21->_template, location[0]);
    objc_storeWeak((id *)&v21->_environment, v18);
    v21->_shouldShowAlbumArt = 1;
    id v8 = (id)[v18 sessionStatus];
    [v8 addSessionObserver:v21];

    v9 = v21;
    id v12 = (id)[v18 sessionStatus];
    id v11 = (id)[v12 currentSession];
    id v10 = (id)[v11 configuration];
    -[CPSAudioPlaybackManager _updateAlbumArtFromSessionConfiguration:](v9, "_updateAlbumArtFromSessionConfiguration:");

    id v16 = (id)[v18 nowPlayingManager];
    [v16 addNowPlayingObserver:v21];
    objc_storeStrong((id *)&v21->_nowPlayingManager, v16);
    objc_storeStrong(&v16, 0);
  }
  v7 = v21;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v21, 0);
  return v7;
}

- (void)updateNowPlayingTemplate:(id)a3 templateDelegate:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong((id *)&v7->_template, location[0]);
  objc_storeStrong((id *)&v7->_templateDelegate, v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(CPUINowPlayingManager *)self->_nowPlayingManager removeNowPlayingObserver:self];
  v2.receiver = v4;
  v2.super_class = (Class)CPSAudioPlaybackManager;
  [(CPSAudioPlaybackManager *)&v2 dealloc];
}

- (id)nowPlayingButtonWithClass:(Class)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v16 = self;
  SEL v15 = a2;
  Class v14 = a3;
  memset(__b, 0, sizeof(__b));
  obj = [(CPNowPlayingTemplate *)v16->_template nowPlayingButtons];
  uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v18 count:16];
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0;
    unint64_t v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(id *)(__b[1] + 8 * v7);
      if (objc_opt_isKindOfClass()) {
        break;
      }
      ++v7;
      if (v5 + 1 >= v8)
      {
        uint64_t v7 = 0;
        unint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v18 count:16];
        if (!v8) {
          goto LABEL_9;
        }
      }
    }
    id v17 = v13;
    int v11 = 1;
  }
  else
  {
LABEL_9:
    int v11 = 0;
  }

  if (!v11) {
    id v17 = 0;
  }
  SEL v3 = v17;

  return v3;
}

- (id)nowPlayingButtonWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  obj = [(CPNowPlayingTemplate *)v17->_template nowPlayingButtons];
  uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v19 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(id *)(__b[1] + 8 * v9);
      id v5 = (id)[v15 identifier];
      char v6 = [v5 isEqual:location[0]];

      if (v6) {
        break;
      }
      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v10) {
          goto LABEL_9;
        }
      }
    }
    id v18 = v15;
    int v13 = 1;
  }
  else
  {
LABEL_9:
    int v13 = 0;
  }

  if (!v13) {
    id v18 = 0;
  }
  objc_storeStrong(location, 0);
  SEL v3 = v18;

  return v3;
}

- (void)_updateAlbumArtFromSessionConfiguration:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  Class v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    BOOL v8 = [location[0] nowPlayingAlbumArtMode] == 2;
    if (v8 != v14->_shouldShowAlbumArt)
    {
      os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        if (v8) {
          SEL v3 = @"YES";
        }
        else {
          SEL v3 = @"NO";
        }
        __os_log_helper_16_2_1_8_66((uint64_t)v15, (uint64_t)v3);
        _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEFAULT, "Session configuration allows artwork: %{public}@", v15, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v14->_shouldShowAlbumArt = v8;
      v4 = [(CPSAudioPlaybackManager *)v14 nowPlayingViewController];
      [(CPSNowPlayingViewController *)v4 reloadData];
    }
    int v9 = 0;
  }
  else
  {
    id v12 = CarPlaySupportGeneralLogging();
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      log = v12;
      os_log_type_t type = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_impl(&dword_22B689000, log, type, "Missing session configuration.", v10, 2u);
    }
    objc_storeStrong(&v12, 0);
    int v9 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_loadArtwork:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v49 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    [(CPSAudioPlaybackManager *)v49 setArtworkCatalog:location[0]];
    v22 = [(CPSAudioPlaybackManager *)v49 nowPlayingViewController];
    id v21 = (id)[(CPSNowPlayingViewController *)v22 view];
    id v19 = (id)[v21 traitCollection];
    [v19 displayScale];
    double v20 = v3;

    double v43 = v20;
    id v18 = [(CPSAudioPlaybackManager *)v49 nowPlayingViewController];
    id v17 = (id)[(CPSNowPlayingViewController *)v18 view];
    [v17 bounds];
    v40[1] = v4;
    v40[2] = v5;
    v41.CGFloat width = v6;
    v41.CGFloat height = v7;
    CGSize v42 = v41;

    if (v20 < 1.0
      || __CGSizeEqualToSize(v42.width, v42.height, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8)))
    {
      v40[0] = CarPlaySupportGeneralLogging();
      os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v40[0], OS_LOG_TYPE_DEFAULT))
      {
        id v15 = v40[0];
        os_log_type_t v16 = v39;
        __os_log_helper_16_0_0(v38);
        _os_log_impl(&dword_22B689000, v15, v16, "No available target scale or size for artwork loading.", v38, 2u);
      }
      objc_storeStrong(v40, 0);
      int v44 = 1;
    }
    else
    {
      Class v14 = [(CPSAudioPlaybackManager *)v49 artworkCatalog];
      [(MPArtworkCatalog *)v14 setDestinationScale:v43];

      double v37 = 0.0;
      CGFloat height = v42.height;
      CGFloat width = v42.width;
      if (v42.width >= v42.height) {
        double v13 = width;
      }
      else {
        double v13 = height;
      }
      v34[1] = *(id *)&v13;
      double v37 = v13;
      v42.CGFloat width = v13;
      v42.CGFloat height = v13;
      id v12 = [(CPSAudioPlaybackManager *)v49 artworkCatalog];
      -[MPArtworkCatalog setFittingSize:](v12, "setFittingSize:", v13, v13);

      v34[0] = CarPlaySupportGeneralLogging();
      os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v34[0], OS_LOG_TYPE_DEFAULT))
      {
        id v11 = (id)[NSNumber numberWithDouble:v43];
        unint64_t v10 = NSStringFromCGSize(v42);
        id v32 = v10;
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v50, (uint64_t)v11, (uint64_t)v32);
        _os_log_impl(&dword_22B689000, (os_log_t)v34[0], v33, "Performing artwork load for currently-playing item, scale %@ size %@", v50, 0x16u);

        objc_storeStrong(&v32, 0);
      }
      objc_storeStrong(v34, 0);
      objc_initWeak(&from, v49);
      BOOL v8 = [(CPSAudioPlaybackManager *)v49 artworkCatalog];
      int v9 = v49;
      uint64_t v25 = MEMORY[0x263EF8330];
      int v26 = -1073741824;
      int v27 = 0;
      v28 = __40__CPSAudioPlaybackManager__loadArtwork___block_invoke;
      v29 = &unk_2648A4D78;
      objc_copyWeak(v30, &from);
      [(MPArtworkCatalog *)v8 setDestination:v9 configurationBlock:&v25];

      objc_destroyWeak(v30);
      objc_destroyWeak(&from);
      int v44 = 0;
    }
  }
  else
  {
    id v47 = CarPlaySupportGeneralLogging();
    os_log_type_t v46 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_DEFAULT))
    {
      log = v47;
      os_log_type_t type = v46;
      __os_log_helper_16_0_0(v45);
      _os_log_impl(&dword_22B689000, log, type, "No artwork available to load.", v45, 2u);
    }
    objc_storeStrong(&v47, 0);
    int v44 = 1;
  }
  objc_storeStrong(location, 0);
}

void __40__CPSAudioPlaybackManager__loadArtwork___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v21 = 0;
  objc_storeStrong(&v21, a3);
  v20[1] = a1;
  v20[0] = objc_loadWeakRetained(a1 + 4);
  if (v21)
  {
    id v16 = CarPlaySupportGeneralLogging();
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v23, (uint64_t)v21);
      _os_log_impl(&dword_22B689000, (os_log_t)v16, v15, "Received artwork response: %@", v23, 0xCu);
    }
    objc_storeStrong(&v16, 0);
  }
  else
  {
    id v19 = CarPlaySupportGeneralLogging();
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      log = v19;
      os_log_type_t type = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_impl(&dword_22B689000, log, type, "No available artwork received.", v17, 2u);
    }
    objc_storeStrong(&v19, 0);
  }
  queue = MEMORY[0x263EF83A0];
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = __40__CPSAudioPlaybackManager__loadArtwork___block_invoke_75;
  id v12 = &unk_2648A3990;
  id v13 = v20[0];
  id v14 = v21;
  dispatch_async(queue, &v8);

  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __40__CPSAudioPlaybackManager__loadArtwork___block_invoke_75(uint64_t a1)
{
  [*(id *)(a1 + 32) setFullSizeArtwork:*(void *)(a1 + 40)];
  id v2 = (id)[*(id *)(a1 + 32) nowPlayingViewController];
  [v2 reloadData];
}

- (id)artistTextForNowPlayingController:(id)a3
{
  CGFloat v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = [(CPSAudioPlaybackManager *)v7 lastSnapshot];
  id v5 = (id)[(CPUINowPlayingSnapshot *)v4 artist];

  objc_storeStrong(location, 0);

  return v5;
}

- (id)albumTextForNowPlayingController:(id)a3
{
  CGFloat v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = [(CPSAudioPlaybackManager *)v7 lastSnapshot];
  id v5 = (id)[(CPUINowPlayingSnapshot *)v4 album];

  objc_storeStrong(location, 0);

  return v5;
}

- (id)titleForNowPlayingController:(id)a3
{
  CGFloat v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = [(CPSAudioPlaybackManager *)v7 lastSnapshot];
  id v5 = (id)[(CPUINowPlayingSnapshot *)v4 title];

  objc_storeStrong(location, 0);

  return v5;
}

- (id)backgroundArtForNowPlayingController:(id)a3
{
  CGFloat v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = [(CPSAudioPlaybackManager *)v6 fullSizeArtwork];
  objc_storeStrong(location, 0);

  return v4;
}

- (BOOL)nowPlayingViewControllerIsShowingExplicitTrack:(id)a3
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(CPSAudioPlaybackManager *)v8 lastSnapshot];
  id v4 = (id)[(CPUINowPlayingSnapshot *)v5 song];
  char v6 = [v4 isExplicitSong];

  objc_storeStrong(location, 0);
  return v6 & 1;
}

- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshotForNowPlayingViewController:(SEL)a3
{
  int v9 = self;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if (v9->_shouldShowPlayState)
  {
    id v5 = [(CPSAudioPlaybackManager *)v9 lastSnapshot];
    if (v5) {
      [(CPUINowPlayingSnapshot *)v5 durationSnapshot];
    }
    else {
      memset(retstr, 0, sizeof($04B05C73ED6AEEF31C5815932084562D));
    }
  }
  else
  {
    memset(retstr, 0, sizeof($04B05C73ED6AEEF31C5815932084562D));
    char v6 = [(CPSAudioPlaybackManager *)v9 lastSnapshot];
    if (v6) {
      [(CPUINowPlayingSnapshot *)v6 durationSnapshot];
    }
    else {
      memset(retstr, 0, sizeof($04B05C73ED6AEEF31C5815932084562D));
    }

    retstr->var5 = 0.0;
  }
  objc_storeStrong(location, 0);
  return result;
}

- (id)progressBarLocalizedDurationStringForNowPlayingViewController:(id)a3
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(CPSAudioPlaybackManager *)v8 lastSnapshot];
  id v4 = (id)[(CPUINowPlayingSnapshot *)v5 responseItem];
  id v6 = (id)[v4 localizedDurationString];

  objc_storeStrong(location, 0);

  return v6;
}

- (BOOL)nowPlayingViewControllerIsPlaying:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v4 = [(CPSAudioPlaybackManager *)v6 shouldShowPlayState];
  objc_storeStrong(location, 0);
  return v4;
}

- (int64_t)shuffleTypeForNowPlayingViewController:(id)a3
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v4 = [(CPSAudioPlaybackManager *)v8 lastSnapshot];
  id v6 = (id)[(CPUINowPlayingSnapshot *)v4 tracklist];

  int64_t v5 = [v6 shuffleType];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (int64_t)repeatTypeForNowPlayingViewController:(id)a3
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v4 = [(CPSAudioPlaybackManager *)v8 lastSnapshot];
  id v6 = (id)[(CPUINowPlayingSnapshot *)v4 tracklist];

  int64_t v5 = [v6 repeatType];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (int64_t)placeholderTypeForNowPlayingViewController:(id)a3
{
  int v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  CGFloat v7 = [(CPSAudioPlaybackManager *)v10 lastSnapshot];
  if (v7) {
    [(CPUINowPlayingSnapshot *)v7 durationSnapshot];
  }
  else {
    memset(__b, 0, sizeof(__b));
  }
  char v6 = __b[48];

  if (v6)
  {
    int64_t v11 = 4;
  }
  else
  {
    int64_t v5 = [(CPSAudioPlaybackManager *)v10 environment];
    BOOL v4 = [(CPSTemplateEnvironment *)v5 bundleIdentifier];
    int64_t v11 = CPUIPlaceholderTypeForBundleIdentifier();
  }
  objc_storeStrong(location, 0);
  return v11;
}

- (id)nowPlayingViewControllerGetPlaybackRate:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = [(CPSAudioPlaybackManager *)v28 lastSnapshot];
  id v13 = (id)[(CPUINowPlayingSnapshot *)v14 responseItem];
  id v26 = (id)[v13 playbackRateCommand];

  if (v26)
  {
    int64_t v11 = NSNumber;
    [v26 preferredPlaybackRate];
    id v25 = (id)objc_msgSend(v11, "numberWithFloat:");
    [v25 floatValue];
    char v23 = 0;
    BOOL v12 = 0;
    if (v3 == 0.0)
    {
      uint64_t v24 = [(CPSAudioPlaybackManager *)v28 lastSavedPlaybackRate];
      char v23 = 1;
      BOOL v12 = v24 != 0;
    }
    if (v23) {

    }
    if (v12)
    {
      id v22 = CarPlaySupportGeneralLogging();
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = [(CPSAudioPlaybackManager *)v28 lastSavedPlaybackRate];
        __os_log_helper_16_2_1_8_64((uint64_t)v31, (uint64_t)v10);
        _os_log_impl(&dword_22B689000, (os_log_t)v22, v21, "Playing with a playback rate equal to 0x, returning last saved playback rate: %@", v31, 0xCu);
      }
      objc_storeStrong(&v22, 0);
      v29 = [(CPSAudioPlaybackManager *)v28 lastSavedPlaybackRate];
      int v20 = 1;
    }
    else
    {
      [(CPSAudioPlaybackManager *)v28 setLastSavedPlaybackRate:v25];
      v29 = (NSNumber *)v25;
      int v20 = 1;
    }
    objc_storeStrong(&v25, 0);
  }
  else
  {
    int v9 = [(CPSAudioPlaybackManager *)v28 lastSavedPlaybackRate];

    if (v9)
    {
      id v19 = CarPlaySupportGeneralLogging();
      os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [(CPSAudioPlaybackManager *)v28 lastSavedPlaybackRate];
        __os_log_helper_16_2_1_8_64((uint64_t)v30, (uint64_t)v8);
        _os_log_impl(&dword_22B689000, (os_log_t)v19, v18, "Returning last saved playback rate: %@", v30, 0xCu);
      }
      objc_storeStrong(&v19, 0);
      v29 = [(CPSAudioPlaybackManager *)v28 lastSavedPlaybackRate];
      int v20 = 1;
    }
    else
    {
      os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        char v6 = oslog;
        os_log_type_t v7 = v16;
        __os_log_helper_16_0_0(v15);
        _os_log_impl(&dword_22B689000, v6, v7, "Returning 0x playback rate", v15, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v29 = &unk_26DF069B8;
      int v20 = 1;
    }
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  BOOL v4 = v29;

  return v4;
}

- (void)nowPlayingViewControllerAlbumArtistButtonTapped:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(CPNowPlayingClientTemplateDelegate *)v4->_templateDelegate conformsToProtocol:&unk_26DF78478])[(CPNowPlayingClientTemplateDelegate *)v4->_templateDelegate albumArtistButtonTapped]; {
  objc_storeStrong(location, 0);
  }
}

- (BOOL)nowPlayingViewControllerCanShowUpNext:(id)a3
{
  char v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v4 = [(CPNowPlayingTemplate *)v6->_template isUpNextButtonEnabled];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)titleForUpNextInNowPlayingViewController:(id)a3
{
  char v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v4 = [(CPNowPlayingTemplate *)v6->_template upNextTitle];
  objc_storeStrong(location, 0);

  return v4;
}

- (void)nowPlayingViewControllerUpNextButtonTapped:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(CPNowPlayingClientTemplateDelegate *)v4->_templateDelegate conformsToProtocol:&unk_26DF78478])[(CPNowPlayingClientTemplateDelegate *)v4->_templateDelegate upNextButtonTapped]; {
  objc_storeStrong(location, 0);
  }
}

- (void)nowPlayingViewControllerChangePlaybackRate:(id)a3
{
  os_log_type_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(CPSAudioPlaybackManager *)v7 nowPlayingButtonWithClass:objc_opt_class()];
  if (v5)
  {
    templateDelegate = v7->_templateDelegate;
    id v4 = (id)[v5 identifier];
    -[CPNowPlayingClientTemplateDelegate handleActionForControlIdentifier:](templateDelegate, "handleActionForControlIdentifier:");
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)nowPlayingViewControllerAddToLibrary:(id)a3
{
  os_log_type_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(CPSAudioPlaybackManager *)v7 nowPlayingButtonWithClass:objc_opt_class()];
  if (v5)
  {
    templateDelegate = v7->_templateDelegate;
    id v4 = (id)[v5 identifier];
    -[CPNowPlayingClientTemplateDelegate handleActionForControlIdentifier:](templateDelegate, "handleActionForControlIdentifier:");
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)nowPlayingViewControllerToggleRepeat:(id)a3
{
  os_log_type_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(CPSAudioPlaybackManager *)v7 nowPlayingButtonWithClass:objc_opt_class()];
  if (v5)
  {
    templateDelegate = v7->_templateDelegate;
    id v4 = (id)[v5 identifier];
    -[CPNowPlayingClientTemplateDelegate handleActionForControlIdentifier:](templateDelegate, "handleActionForControlIdentifier:");
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)nowPlayingViewControllerToggleShuffle:(id)a3
{
  os_log_type_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(CPSAudioPlaybackManager *)v7 nowPlayingButtonWithClass:objc_opt_class()];
  if (v5)
  {
    templateDelegate = v7->_templateDelegate;
    id v4 = (id)[v5 identifier];
    -[CPNowPlayingClientTemplateDelegate handleActionForControlIdentifier:](templateDelegate, "handleActionForControlIdentifier:");
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)nowPlayingViewControllerMore:(id)a3
{
  os_log_type_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(CPSAudioPlaybackManager *)v7 nowPlayingButtonWithClass:objc_opt_class()];
  if (v5)
  {
    templateDelegate = v7->_templateDelegate;
    id v4 = (id)[v5 identifier];
    -[CPNowPlayingClientTemplateDelegate handleActionForControlIdentifier:](templateDelegate, "handleActionForControlIdentifier:");
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)nowPlayingViewController:(id)a3 didSelectButton:(id)a4
{
  BOOL v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  os_log_type_t v7 = v12;
  id v8 = (id)[v10 identifier];
  id v9 = -[CPSAudioPlaybackManager nowPlayingButtonWithIdentifier:](v7, "nowPlayingButtonWithIdentifier:");

  if (v9)
  {
    templateDelegate = v12->_templateDelegate;
    id v5 = (id)[v9 identifier];
    -[CPNowPlayingClientTemplateDelegate handleActionForControlIdentifier:](templateDelegate, "handleActionForControlIdentifier:");
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (id)customPlaybackControlButtonsForNowPlayingViewController:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = (id)[MEMORY[0x263EFF980] array];
  id v5 = [(CPSAudioPlaybackManager *)v20 nowPlayingViewController];
  id v17 = [(CPUINowPlayingViewController *)v5 playModeControlView];

  id v16 = (id)[v17 mediaButtons];
  char v6 = [(CPNowPlayingTemplate *)v20->_template nowPlayingButtons];
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  int64_t v11 = __83__CPSAudioPlaybackManager_customPlaybackControlButtonsForNowPlayingViewController___block_invoke;
  BOOL v12 = &unk_2648A4DA0;
  id v13 = v16;
  id v14 = v17;
  id v15 = v18;
  [(NSArray *)v6 enumerateObjectsUsingBlock:&v8];

  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v21, (uint64_t)v18);
    _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEFAULT, "Returning custom media buttons %@", v21, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v4 = v18;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);

  return v4;
}

void __83__CPSAudioPlaybackManager_customPlaybackControlButtonsForNowPlayingViewController___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v61[3] = a3;
  v61[2] = a4;
  v61[1] = a1;
  v61[0] = 0;
  memset(__b, 0, sizeof(__b));
  id obj = a1[4];
  uint64_t v48 = [obj countByEnumeratingWithState:__b objects:v64 count:16];
  if (v48)
  {
    uint64_t v41 = *(void *)__b[2];
    uint64_t v42 = 0;
    unint64_t v43 = v48;
    while (1)
    {
      uint64_t v40 = v42;
      if (*(void *)__b[2] != v41) {
        objc_enumerationMutation(obj);
      }
      v60 = *(void **)(__b[1] + 8 * v42);
      objc_opt_class();
      char v57 = 0;
      char v55 = 0;
      char v39 = 0;
      if (objc_opt_isKindOfClass())
      {
        id v58 = (id)[v60 identifier];
        char v57 = 1;
        id v56 = (id)[location[0] identifier];
        char v55 = 1;
        char v39 = objc_msgSend(v58, "isEqual:");
      }
      if (v55) {

      }
      if (v57) {
      if (v39)
      }
        break;
      ++v42;
      if (v40 + 1 >= v43)
      {
        uint64_t v42 = 0;
        unint64_t v43 = [obj countByEnumeratingWithState:__b objects:v64 count:16];
        if (!v43) {
          goto LABEL_15;
        }
      }
    }
    id v4 = objc_opt_class();
    id v5 = CPSSafeCast_12(v4, v60);
    id v6 = v61[0];
    v61[0] = v5;

    int v54 = 2;
  }
  else
  {
LABEL_15:
    int v54 = 0;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || v61[0])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = (id)[a1[5] moreButton];
      id v19 = v61[0];
      v61[0] = v18;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = (id)[a1[5] repeatButton];
        id v21 = v61[0];
        v61[0] = v20;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v22 = (id)[a1[5] shuffleButton];
          id v23 = v61[0];
          v61[0] = v22;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v24 = (id)[a1[5] addToLibraryButton];
            id v25 = v61[0];
            v61[0] = v24;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v26 = (id)[a1[5] playbackRateButton];
              id v27 = v61[0];
              v61[0] = v26;
            }
          }
        }
      }
    }
  }
  else
  {
    os_log_type_t v7 = objc_opt_class();
    id v53 = CPSSafeCast_12(v7, location[0]);
    uint64_t v8 = objc_opt_new();
    id v9 = v61[0];
    v61[0] = v8;

    [v61[0] setTranslatesAutoresizingMaskIntoConstraints:0];
    id v52 = 0;
    id v38 = (id)[v53 image];
    [v38 size];
    double v50 = v10;
    double v51 = v11;

    if (__CGSizeEqualToSize(v50, v51, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8)))
    {
      os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v37 = (id)[v53 identifier];
        __os_log_helper_16_2_1_8_64((uint64_t)v63, (uint64_t)v37);
        _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEFAULT, "Empty custom image provided for now playing button with identifier: %@", v63, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v36 = (id)[v61[0] traitCollection];
      id v12 = (id)CPUIQuestionmarkGlyph();
      id v13 = v52;
      id v52 = v12;
    }
    else
    {
      id v35 = (id)[v53 image];
      id v14 = (id)CPImageByScalingImageToSize();
      id v15 = v52;
      id v52 = v14;
    }
    id v16 = (id)[v52 imageWithRenderingMode:2];
    id v17 = v52;
    id v52 = v16;

    [v61[0] setImage:v52 forState:0];
    id v31 = v61[0];
    id v30 = v52;
    id v34 = (id)[MEMORY[0x263F1C550] labelColor];
    id v33 = (id)[v34 colorWithAlphaComponent:0.2];
    id v32 = (id)objc_msgSend(v30, "imageWithTintColor:");
    objc_msgSend(v31, "setImage:forState:");

    objc_storeStrong(&v52, 0);
    objc_storeStrong(&v53, 0);
  }
  if (v61[0])
  {
    id v28 = v61[0];
    id v29 = (id)[location[0] identifier];
    objc_msgSend(v28, "setIdentifier:");

    objc_msgSend(v61[0], "setEnabled:", objc_msgSend(location[0], "isEnabled") & 1);
    objc_msgSend(v61[0], "setSelected:", objc_msgSend(location[0], "isSelected") & 1);
    [a1[6] addObject:v61[0]];
  }
  objc_storeStrong(v61, 0);
  objc_storeStrong(location, 0);
}

- (void)nowPlayingViewController:(id)a3 didSendAction:(int64_t)a4 state:(int64_t)a5
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  v85 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v83 = a4;
  int64_t v82 = a5;
  id v81 = 0;
  if (!v6 & v5)
  {
    int64_t v8 = a4 + 1;
    char v7 = 1;
  }
  else
  {
    int64_t v8 = a4 + 1;
    char v7 = 0;
  }
  if ((v7 & 1) == 0)
  {
    switch(v8)
    {
      case 0:
        break;
      case 1:
        id v80 = CarPlaySupportGeneralLogging();
        os_log_type_t v79 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v80, OS_LOG_TYPE_DEFAULT))
        {
          v61 = v80;
          os_log_type_t v62 = v79;
          __os_log_helper_16_0_0(v78);
          _os_log_impl(&dword_22B689000, v61, v62, "Sending back action.", v78, 2u);
        }
        objc_storeStrong(&v80, 0);
        if (v82 == 1)
        {
          [(CPSAudioPlaybackManager *)v85 setActionStateHeld:1];
          v60 = [(CPSAudioPlaybackManager *)v85 lastSnapshot];
          id v9 = (id)[(CPUINowPlayingSnapshot *)v60 commandWithType:8];
          id v10 = v81;
          id v81 = v9;
        }
        else if (v82 == 2 && [(CPSAudioPlaybackManager *)v85 actionStateHeld])
        {
          [(CPSAudioPlaybackManager *)v85 setActionStateHeld:0];
          v59 = [(CPSAudioPlaybackManager *)v85 lastSnapshot];
          id v11 = (id)[(CPUINowPlayingSnapshot *)v59 commandWithType:9];
          id v12 = v81;
          id v81 = v11;
        }
        else
        {
          char v57 = [(CPSAudioPlaybackManager *)v85 lastSnapshot];
          id v58 = (id)[(CPUINowPlayingSnapshot *)v57 jumpBackInterval];

          if (v58)
          {
            id v56 = [(CPSAudioPlaybackManager *)v85 lastSnapshot];
            id v13 = (id)[(CPUINowPlayingSnapshot *)v56 commandWithType:6];
            id v14 = v81;
            id v81 = v13;
          }
          else
          {
            char v55 = [(CPSAudioPlaybackManager *)v85 lastSnapshot];
            id v15 = (id)[(CPUINowPlayingSnapshot *)v55 commandWithType:4];
            id v16 = v81;
            id v81 = v15;
          }
        }
        break;
      case 2:
        id v68 = CarPlaySupportGeneralLogging();
        os_log_type_t v67 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_DEFAULT))
        {
          char v39 = v68;
          os_log_type_t v40 = v67;
          __os_log_helper_16_0_0(v66);
          _os_log_impl(&dword_22B689000, v39, v40, "Sending next action.", v66, 2u);
        }
        objc_storeStrong(&v68, 0);
        if (v82 == 1)
        {
          [(CPSAudioPlaybackManager *)v85 setActionStateHeld:1];
          id v38 = [(CPSAudioPlaybackManager *)v85 lastSnapshot];
          id v23 = (id)[(CPUINowPlayingSnapshot *)v38 commandWithType:7];
          id v24 = v81;
          id v81 = v23;
        }
        else if (v82 == 2 && [(CPSAudioPlaybackManager *)v85 actionStateHeld])
        {
          [(CPSAudioPlaybackManager *)v85 setActionStateHeld:0];
          id v37 = [(CPSAudioPlaybackManager *)v85 lastSnapshot];
          id v25 = (id)[(CPUINowPlayingSnapshot *)v37 commandWithType:9];
          id v26 = v81;
          id v81 = v25;
        }
        else
        {
          id v35 = [(CPSAudioPlaybackManager *)v85 lastSnapshot];
          id v36 = (id)[(CPUINowPlayingSnapshot *)v35 jumpForwardInterval];

          if (v36)
          {
            id v34 = [(CPSAudioPlaybackManager *)v85 lastSnapshot];
            id v27 = (id)[(CPUINowPlayingSnapshot *)v34 commandWithType:5];
            id v28 = v81;
            id v81 = v27;
          }
          else
          {
            id v33 = [(CPSAudioPlaybackManager *)v85 lastSnapshot];
            id v29 = (id)[(CPUINowPlayingSnapshot *)v33 commandWithType:3];
            id v30 = v81;
            id v81 = v29;
          }
        }
        break;
      case 3:
        id v52 = v85;
        id v53 = [(CPSAudioPlaybackManager *)v85 nowPlayingViewController];
        BOOL v54 = -[CPSAudioPlaybackManager nowPlayingViewControllerIsPlaying:](v52, "nowPlayingViewControllerIsPlaying:");

        if (v54)
        {
          double v50 = [(CPSAudioPlaybackManager *)v85 lastSnapshot];
          char v51 = [(CPUINowPlayingSnapshot *)v50 showsStopButton];

          if (v51)
          {
            id v77 = CarPlaySupportGeneralLogging();
            os_log_type_t v76 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled((os_log_t)v77, OS_LOG_TYPE_DEFAULT))
            {
              log = v77;
              os_log_type_t type = v76;
              __os_log_helper_16_0_0(v75);
              _os_log_impl(&dword_22B689000, log, type, "Sending stop action.", v75, 2u);
            }
            objc_storeStrong(&v77, 0);
            id v47 = [(CPSAudioPlaybackManager *)v85 lastSnapshot];
            id v17 = (id)[(CPUINowPlayingSnapshot *)v47 commandWithType:0];
            id v18 = v81;
            id v81 = v17;
          }
          else
          {
            id v74 = CarPlaySupportGeneralLogging();
            os_log_type_t v73 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled((os_log_t)v74, OS_LOG_TYPE_DEFAULT))
            {
              v45 = v74;
              os_log_type_t v46 = v73;
              __os_log_helper_16_0_0(v72);
              _os_log_impl(&dword_22B689000, v45, v46, "Sending pause action.", v72, 2u);
            }
            objc_storeStrong(&v74, 0);
            int v44 = [(CPSAudioPlaybackManager *)v85 lastSnapshot];
            id v19 = (id)[(CPUINowPlayingSnapshot *)v44 commandWithType:2];
            id v20 = v81;
            id v81 = v19;
          }
        }
        else
        {
          id v71 = CarPlaySupportGeneralLogging();
          os_log_type_t v70 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v42 = v71;
            os_log_type_t v43 = v70;
            __os_log_helper_16_0_0(v69);
            _os_log_impl(&dword_22B689000, v42, v43, "Sending play action.", v69, 2u);
          }
          objc_storeStrong(&v71, 0);
          uint64_t v41 = [(CPSAudioPlaybackManager *)v85 lastSnapshot];
          id v21 = (id)[(CPUINowPlayingSnapshot *)v41 commandWithType:1];
          id v22 = v81;
          id v81 = v21;
        }
        break;
      default:
        JUMPOUT(0);
    }
  }
  if (v81)
  {
    id v32 = [(CPSAudioPlaybackManager *)v85 nowPlayingManager];
    [(CPUINowPlayingManager *)v32 performCommandRequest:v81 completion:0];
  }
  else
  {
    id v65 = CarPlaySupportGeneralLogging();
    if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_ERROR))
    {
      id v31 = (id)[NSNumber numberWithInteger:v83];
      __os_log_helper_16_2_1_8_64((uint64_t)v86, (uint64_t)v31);
      _os_log_error_impl(&dword_22B689000, (os_log_t)v65, OS_LOG_TYPE_ERROR, "No available remote command for action %@", v86, 0xCu);
    }
    objc_storeStrong(&v65, 0);
  }
  objc_storeStrong(&v81, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)nowPlayingViewController:(id)a3 shouldDisplayButton:(int64_t)a4 withImage:(id *)a5 existingIdentifier:(id)a6 tinted:(BOOL *)a7
{
  v87[1] = *MEMORY[0x263EF8340];
  int64_t v82 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v80 = a4;
  os_log_type_t v79 = a5;
  id v78 = 0;
  objc_storeStrong(&v78, a6);
  id v77 = a7;
  if (v80)
  {
    if (v80 == 1)
    {
      id v21 = [(CPSAudioPlaybackManager *)v82 lastSnapshot];
      id v62 = (id)[(CPUINowPlayingSnapshot *)v21 jumpForwardInterval];

      if (v62)
      {
        id v61 = 0;
        id v19 = (id)[MEMORY[0x263F313A8] knownJumpIntervals];
        char v20 = [v19 containsObject:v62];

        if (v20)
        {
          id v11 = (id)[v62 stringValue];
          id v12 = v61;
          id v61 = v11;
        }
        else
        {
          id v60 = CarPlaySupportGeneralLogging();
          if (os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v83, (uint64_t)v62);
            _os_log_error_impl(&dword_22B689000, (os_log_t)v60, OS_LOG_TYPE_ERROR, "Received request for unknown jump forward interval %{public}@", v83, 0xCu);
          }
          objc_storeStrong(&v60, 0);
        }
        id v18 = (id)[v62 stringValue];
        id v17 = [(CPSAudioPlaybackManager *)v82 nowPlayingViewController];
        id v16 = (id)[(CPSNowPlayingViewController *)v17 traitCollection];
        *os_log_type_t v79 = (id)CPUIImageForTransportButton();

        objc_storeStrong(&v61, 0);
      }
      else
      {
        id v15 = [(CPSAudioPlaybackManager *)v82 nowPlayingViewController];
        id v14 = (id)[(CPSNowPlayingViewController *)v15 traitCollection];
        *os_log_type_t v79 = (id)CPUIImageForTransportButton();
      }
      objc_storeStrong(&v62, 0);
    }
    else if (v80 == 2)
    {
      id v53 = v82;
      BOOL v54 = [(CPSAudioPlaybackManager *)v82 nowPlayingViewController];
      BOOL v55 = -[CPSAudioPlaybackManager nowPlayingViewControllerIsPlaying:](v53, "nowPlayingViewControllerIsPlaying:");

      if (v55)
      {
        char v51 = [(CPSAudioPlaybackManager *)v82 lastSnapshot];
        char v52 = [(CPUINowPlayingSnapshot *)v51 showsStopButton];

        char v76 = v52 & 1;
        if (v52)
        {
          id v75 = CarPlaySupportGeneralLogging();
          os_log_type_t v74 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v75, OS_LOG_TYPE_DEFAULT))
          {
            log = v75;
            os_log_type_t type = v74;
            __os_log_helper_16_0_0(v73);
            _os_log_impl(&dword_22B689000, log, type, "Showing stop button", v73, 2u);
          }
          objc_storeStrong(&v75, 0);
          id v44 = (id)[location[0] transportControlView];
          [v44 setPauseButtonImageName:@"stop.fill"];

          id v48 = (id)CPUILocalizedStringForKey();
          v87[0] = v48;
          id v47 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:1];
          id v46 = (id)[location[0] transportControlView];
          id v45 = (id)[v46 playPauseButton];
          [v45 setAccessibilityUserInputLabels:v47];
        }
        else
        {
          id v72 = CarPlaySupportGeneralLogging();
          os_log_type_t v71 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v72, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v42 = v72;
            os_log_type_t v43 = v71;
            __os_log_helper_16_0_0(v70);
            _os_log_impl(&dword_22B689000, v42, v43, "Showing pause button", v70, 2u);
          }
          objc_storeStrong(&v72, 0);
          id v37 = (id)[location[0] transportControlView];
          [v37 setPauseButtonImageName:@"pause.fill"];

          id v41 = (id)CPUILocalizedStringForKey();
          id v86 = v41;
          id v40 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v86 count:1];
          id v39 = (id)[location[0] transportControlView];
          id v38 = (id)[v39 playPauseButton];
          [v38 setAccessibilityUserInputLabels:v40];
        }
      }
      else
      {
        id v69 = CarPlaySupportGeneralLogging();
        os_log_type_t v68 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v69, OS_LOG_TYPE_DEFAULT))
        {
          id v35 = v69;
          os_log_type_t v36 = v68;
          __os_log_helper_16_0_0(v67);
          _os_log_impl(&dword_22B689000, v35, v36, "Showing play button", v67, 2u);
        }
        objc_storeStrong(&v69, 0);
        id v30 = (id)[location[0] transportControlView];
        [v30 setPlayButtonImageName:@"play.fill"];

        id v34 = (id)CPUILocalizedStringForKey();
        id v85 = v34;
        id v33 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v85 count:1];
        id v32 = (id)[location[0] transportControlView];
        id v31 = (id)[v32 playPauseButton];
        [v31 setAccessibilityUserInputLabels:v33];
      }
    }
  }
  else
  {
    id v29 = [(CPSAudioPlaybackManager *)v82 lastSnapshot];
    id v66 = (id)[(CPUINowPlayingSnapshot *)v29 jumpBackInterval];

    if (v66)
    {
      id v65 = 0;
      id v7 = (id)objc_msgSend(NSNumber, "numberWithInteger:", -objc_msgSend(v66, "integerValue"));
      id v8 = v66;
      id v66 = v7;

      id v27 = (id)[MEMORY[0x263F313A8] knownJumpIntervals];
      char v28 = [v27 containsObject:v66];

      if (v28)
      {
        id v9 = (id)[v66 stringValue];
        id v10 = v65;
        id v65 = v9;
      }
      else
      {
        id v64 = CarPlaySupportGeneralLogging();
        os_log_type_t v63 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_66((uint64_t)v84, (uint64_t)v66);
          _os_log_error_impl(&dword_22B689000, (os_log_t)v64, v63, "Received request for unknown jump back interval %{public}@", v84, 0xCu);
        }
        objc_storeStrong(&v64, 0);
      }
      id v26 = (id)[v66 stringValue];
      id v25 = [(CPSAudioPlaybackManager *)v82 nowPlayingViewController];
      id v24 = (id)[(CPSNowPlayingViewController *)v25 traitCollection];
      *os_log_type_t v79 = (id)CPUIImageForTransportButton();

      objc_storeStrong(&v65, 0);
    }
    else
    {
      id v23 = [(CPSAudioPlaybackManager *)v82 nowPlayingViewController];
      id v22 = (id)[(CPSNowPlayingViewController *)v23 traitCollection];
      *os_log_type_t v79 = (id)CPUIImageForTransportButton();
    }
    objc_storeStrong(&v66, 0);
  }
  objc_storeStrong(&v78, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (BOOL)nowPlayingViewController:(id)a3 buttonShouldBeActive:(int64_t)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!v5 & v4)
  {
    int64_t v7 = a4 + 1;
    char v6 = 1;
  }
  else
  {
    int64_t v7 = a4 + 1;
    char v6 = 0;
  }
  if ((v6 & 1) == 0)
  {
    switch(v7)
    {
      case 0:
        break;
      case 1:
        id v10 = [(CPSAudioPlaybackManager *)v13 lastSnapshot];
        char v14 = [(CPUINowPlayingSnapshot *)v10 shouldEnableBackButton] & 1;

        goto LABEL_10;
      case 2:
        id v9 = [(CPSAudioPlaybackManager *)v13 lastSnapshot];
        char v14 = [(CPUINowPlayingSnapshot *)v9 shouldEnableNextButton] & 1;

        goto LABEL_10;
      case 3:
        char v14 = 1;
        goto LABEL_10;
      default:
        JUMPOUT(0);
    }
  }
  char v14 = 0;
LABEL_10:
  objc_storeStrong(location, 0);
  return v14 & 1;
}

- (BOOL)nowPlayingViewControllerCanShuffle:(id)a3
{
  int64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(CPSAudioPlaybackManager *)v7 nowPlayingButtonWithClass:objc_opt_class()];
  BOOL v5 = v3 != 0;

  objc_storeStrong(location, 0);
  return v5;
}

- (BOOL)nowPlayingViewControllerCanRepeat:(id)a3
{
  int64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(CPSAudioPlaybackManager *)v7 nowPlayingButtonWithClass:objc_opt_class()];
  BOOL v5 = v3 != 0;

  objc_storeStrong(location, 0);
  return v5;
}

- (BOOL)nowPlayingViewControllerCanShowAddToLibrary:(id)a3
{
  int64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(CPSAudioPlaybackManager *)v7 nowPlayingButtonWithClass:objc_opt_class()];
  BOOL v5 = v3 != 0;

  objc_storeStrong(location, 0);
  return v5;
}

- (BOOL)nowPlayingViewControllerCanShowAlbumLink:(id)a3
{
  char v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v4 = [(CPNowPlayingTemplate *)v6->_template isAlbumArtistButtonEnabled];
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)nowPlayingViewControllerCanShowChangePlaybackRate:(id)a3
{
  int64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(CPSAudioPlaybackManager *)v7 nowPlayingButtonWithClass:objc_opt_class()];
  BOOL v5 = v3 != 0;

  objc_storeStrong(location, 0);
  return v5;
}

- (BOOL)nowPlayingViewControllerCanShowMore:(id)a3
{
  int64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(CPSAudioPlaybackManager *)v7 nowPlayingButtonWithClass:objc_opt_class()];
  BOOL v5 = v3 != 0;

  objc_storeStrong(location, 0);
  return v5;
}

- (BOOL)nowPlayingViewControllerCanShowAlbumArt:(id)a3
{
  char v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v4 = [(CPSAudioPlaybackManager *)v6 shouldShowAlbumArt];
  objc_storeStrong(location, 0);
  return v4;
}

- (void)nowPlayingViewControllerWillAppear:(id)a3
{
  char v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(CPSAudioPlaybackManager *)v6 lastSnapshot];
  id v4 = (id)[(CPUINowPlayingSnapshot *)v3 artworkCatalog];

  if (v4) {
    [(CPSAudioPlaybackManager *)v6 _loadArtwork:v4];
  }
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)nowPlayingViewControllerIsRightHandDrive:(id)a3
{
  int64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(CPSAudioPlaybackManager *)v7 environment];
  BOOL v5 = [(CPSTemplateEnvironment *)v4 rightHandDrive];

  objc_storeStrong(location, 0);
  return v5;
}

- (void)session:(id)a3 didUpdateConfiguration:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __58__CPSAudioPlaybackManager_session_didUpdateConfiguration___block_invoke;
  id v10 = &unk_2648A3990;
  id v11 = v15;
  id v12 = v13;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

uint64_t __58__CPSAudioPlaybackManager_session_didUpdateConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAlbumArtFromSessionConfiguration:", *(void *)(a1 + 40), a1, a1);
}

- (void)nowPlayingManager:(id)a3 didUpdateSnapshot:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = (id)[v31 bundleIdentifier];
  if (v30)
  {
    if (v31)
    {
      id v10 = [(CPSAudioPlaybackManager *)v33 environment];
      id v9 = [(CPSTemplateEnvironment *)v10 bundleIdentifier];
      char v11 = objc_msgSend(v30, "isEqualToString:");

      if (v11)
      {
        id v20 = CarPlaySupportGeneralLogging();
        os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v35, (uint64_t)v30);
          _os_log_impl(&dword_22B689000, (os_log_t)v20, v19, "Received a now playing update for the current app: %@", v35, 0xCu);
        }
        objc_storeStrong(&v20, 0);
        [(CPSAudioPlaybackManager *)v33 setLastSnapshot:v31];
        BOOL v5 = [(CPSAudioPlaybackManager *)v33 lastSnapshot];
        [(CPSAudioPlaybackManager *)v33 setShouldShowPlayState:[(CPUINowPlayingSnapshot *)v5 state] == 2];

        id v18 = (id)[v31 artworkCatalog];
        if (!v18)
        {
          -[CPSAudioPlaybackManager setArtworkCatalog:](v33, "setArtworkCatalog:");
          [(CPSAudioPlaybackManager *)v33 setFullSizeArtwork:0];
          id v17 = CarPlaySupportGeneralLogging();
          if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v34, (uint64_t)v31);
            _os_log_impl(&dword_22B689000, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "No artwork catalog available for snapshot %@", v34, 0xCu);
          }
          objc_storeStrong(&v17, 0);
        }
        id v4 = [(CPSAudioPlaybackManager *)v33 nowPlayingViewController];
        [(CPSNowPlayingViewController *)v4 reloadData];

        if (v18) {
          [(CPSAudioPlaybackManager *)v33 _loadArtwork:v18];
        }
        objc_storeStrong(&v18, 0);
        int v26 = 0;
      }
      else
      {
        id v22 = CarPlaySupportGeneralLogging();
        os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = [(CPSAudioPlaybackManager *)v33 environment];
          int v7 = [(CPSTemplateEnvironment *)v8 bundleIdentifier];
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v36, (uint64_t)v30, (uint64_t)v7);
          _os_log_impl(&dword_22B689000, (os_log_t)v22, v21, "Received a now playing update for a different app: %@ vs ours: %@", v36, 0x16u);
        }
        objc_storeStrong(&v22, 0);
        [(CPSAudioPlaybackManager *)v33 setShouldShowPlayState:0];
        uint64_t v6 = [(CPSAudioPlaybackManager *)v33 nowPlayingViewController];
        [(CPSNowPlayingViewController *)v6 reloadData];

        int v26 = 1;
      }
    }
    else
    {
      id v25 = CarPlaySupportGeneralLogging();
      os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = v25;
        os_log_type_t v13 = v24;
        __os_log_helper_16_0_0(v23);
        _os_log_impl(&dword_22B689000, v12, v13, "Received an empty now playing snapshot.", v23, 2u);
      }
      objc_storeStrong(&v25, 0);
      int v26 = 1;
    }
  }
  else
  {
    id v29 = CarPlaySupportGeneralLogging();
    os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
    {
      log = v29;
      os_log_type_t type = v28;
      __os_log_helper_16_0_0(v27);
      _os_log_impl(&dword_22B689000, log, type, "Received a now playing update for an unknown application.", v27, 2u);
    }
    objc_storeStrong(&v29, 0);
    int v26 = 1;
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

- (void)nowPlayingManager:(id)a3 didThrottleUpdateForBundleIdentifier:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  if (v7)
  {
    BOOL v5 = +[CPSAnalytics sharedInstance];
    [(CPSAnalytics *)v5 audioAppMetadataThrottledWithBundleIdentifier:v7];
  }
  id v4 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"CPSAudioManagerDidThrottleUpdateNotification" object:v9];

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (CPSNowPlayingViewController)nowPlayingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nowPlayingViewController);

  return (CPSNowPlayingViewController *)WeakRetained;
}

- (void)setNowPlayingViewController:(id)a3
{
}

- (CPUINowPlayingManager)nowPlayingManager
{
  return self->_nowPlayingManager;
}

- (void)setNowPlayingManager:(id)a3
{
}

- (CPNowPlayingTemplate)template
{
  return self->_template;
}

- (CPNowPlayingClientTemplateDelegate)templateDelegate
{
  return self->_templateDelegate;
}

- (void)setTemplateDelegate:(id)a3
{
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (void)setArtworkCatalog:(id)a3
{
}

- (UIImage)fullSizeArtwork
{
  return self->_fullSizeArtwork;
}

- (void)setFullSizeArtwork:(id)a3
{
}

- (CPUINowPlayingSnapshot)lastSnapshot
{
  return self->_lastSnapshot;
}

- (void)setLastSnapshot:(id)a3
{
}

- (CPSTemplateEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (CPSTemplateEnvironment *)WeakRetained;
}

- (void)setEnvironment:(id)a3
{
}

- (BOOL)actionStateHeld
{
  return self->_actionStateHeld;
}

- (void)setActionStateHeld:(BOOL)a3
{
  self->_actionStateHeld = a3;
}

- (BOOL)shouldShowAlbumArt
{
  return self->_shouldShowAlbumArt;
}

- (void)setShouldShowAlbumArt:(BOOL)a3
{
  self->_shouldShowAlbumArt = a3;
}

- (BOOL)shouldShowPlayState
{
  return self->_shouldShowPlayState;
}

- (void)setShouldShowPlayState:(BOOL)a3
{
  self->_shouldShowPlayState = a3;
}

- (NSNumber)lastSavedPlaybackRate
{
  return self->_lastSavedPlaybackRate;
}

- (void)setLastSavedPlaybackRate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end