@interface DBNowPlayingObserver
- (BOOL)_isValidNowPlayingApplication:(id)a3;
- (BOOL)isPlaying;
- (DBAppHistory)appHistory;
- (DBApplication)nowPlayingApplication;
- (DBApplicationLaunchInfo)nowPlayingLaunchInfo;
- (DBEnvironmentConfiguration)environment;
- (DBNowPlayingDelegate)delegate;
- (DBNowPlayingObserver)initWithEnvironmentConfiguration:(id)a3;
- (id)nowPlayingLaunchInfoWithSource:(unint64_t)a3;
- (void)_nowPlayingDidChangeToBundleIdentifier:(id)a3;
- (void)_updatePlaybackStateForBundleIdentifier:(id)a3 playing:(BOOL)a4;
- (void)nowPlayingManager:(id)a3 didUpdateSnapshot:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setNowPlayingApplication:(id)a3;
@end

@implementation DBNowPlayingObserver

- (DBNowPlayingObserver)initWithEnvironmentConfiguration:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DBNowPlayingObserver;
  v5 = [(DBNowPlayingObserver *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = [v4 appHistory];
    objc_storeWeak((id *)&v6->_appHistory, v7);

    v8 = [MEMORY[0x263F313A0] sharedManager];
    [v8 addNowPlayingObserver:v6];
  }
  return v6;
}

- (DBApplicationLaunchInfo)nowPlayingLaunchInfo
{
  return (DBApplicationLaunchInfo *)[(DBNowPlayingObserver *)self nowPlayingLaunchInfoWithSource:0];
}

- (BOOL)_isValidNowPlayingApplication:(id)a3
{
  id v4 = a3;
  v5 = [(DBNowPlayingObserver *)self appHistory];
  v6 = [v4 bundleIdentifier];
  uint64_t v7 = [v5 appDockCategoryForBundleIdentifier:v6];

  if (v7 == 2)
  {
    char v8 = 1;
  }
  else
  {
    v9 = [(DBNowPlayingObserver *)self appHistory];
    objc_super v10 = [v4 bundleIdentifier];
    v11 = [v9 policyForBundleIdentifier:v10];

    if ([v11 isCarPlaySupported])
    {
      char v8 = v7 == 0;
    }
    else
    {
      v12 = [v4 info];
      char v8 = [v12 supportsBackgroundMode:*MEMORY[0x263F833D0]];
    }
  }

  return v8;
}

- (id)nowPlayingLaunchInfoWithSource:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = [(DBNowPlayingObserver *)self nowPlayingApplication];
  v6 = [(DBNowPlayingObserver *)self environment];
  if (![v6 isVehicleDataSession]) {
    goto LABEL_4;
  }
  uint64_t v7 = [(DBNowPlayingObserver *)self environment];
  char v8 = [v7 session];
  int v9 = [v8 carOwnsMainAudio];

  if (v9)
  {
    v6 = +[DBApplicationController sharedInstance];
    uint64_t v10 = [v6 applicationWithBundleIdentifier:@"com.apple.CarRadio"];

    v5 = v10;
LABEL_4:
  }
  if (v5) {
    goto LABEL_7;
  }
  v11 = [(DBNowPlayingObserver *)self appHistory];
  v12 = [v11 orderedAppsMatchingDockCategory:2];

  v5 = [v12 firstObject];

  if (v5)
  {
LABEL_7:
    v13 = [v5 bundleIdentifier];
    if ([v13 isEqualToString:@"com.apple.WebKit.WebContent"])
    {
      DBLogForCategory(0);
      v14 = (DBActivationSettings *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        v15 = "Now playing app is web content; ignoring.";
LABEL_19:
        _os_log_impl(&dword_22D6F0000, &v14->super, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v21, 2u);
      }
    }
    else
    {
      if ([(DBNowPlayingObserver *)self _isValidNowPlayingApplication:v5])
      {
        v14 = objc_alloc_init(DBActivationSettings);
        v16 = [NSURL URLWithString:@"music://cardisplay/show-now-playing"];
        [(DBActivationSettings *)v14 setUrl:v16];

        if (a3) {
          unint64_t v17 = a3;
        }
        else {
          unint64_t v17 = 2;
        }
        [(DBActivationSettings *)v14 setLaunchSource:v17];
        v18 = DBLogForCategory(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138412290;
          v22 = v5;
          _os_log_impl(&dword_22D6F0000, v18, OS_LOG_TYPE_DEFAULT, "Resolved now playing launch info to %@", (uint8_t *)&v21, 0xCu);
        }

        v19 = +[DBApplicationLaunchInfo launchInfoForApplication:v5 withActivationSettings:v14];
        goto LABEL_21;
      }
      DBLogForCategory(0);
      v14 = (DBActivationSettings *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        v15 = "Now playing app is not valid for CarPlay; ignoring.";
        goto LABEL_19;
      }
    }
    v19 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v5 = DBLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "No available audio app for now playing.", (uint8_t *)&v21, 2u);
  }
  v19 = 0;
LABEL_22:

  return v19;
}

- (void)_nowPlayingDidChangeToBundleIdentifier:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = (DBApplication *)a3;
  v5 = DBLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v4;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Resolved now playing identifier to %@", buf, 0xCu);
  }

  id v24 = 0;
  v6 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v24];
  id v7 = v24;
  if (v6)
  {
    char v8 = [v6 applicationState];
    char v9 = [v8 isValid];

    if (v9)
    {
      uint64_t v10 = [v6 applicationState];
      int v11 = [v10 isRestricted];

      if (v11)
      {
        v12 = DBLogForCategory(0);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v13 = "Now playing application is restricted; ignoring.";
LABEL_12:
          _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
        }
      }
      else
      {
        v14 = [(DBNowPlayingObserver *)self nowPlayingApplication];
        v12 = [v14 bundleIdentifier];

        if ([v12 isEqualToString:v4])
        {
          DBLogForCategory(0);
          v15 = (DBApplication *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22D6F0000, &v15->super, OS_LOG_TYPE_DEFAULT, "No changes to now playing bundle identifier.", buf, 2u);
          }
        }
        else
        {
          v16 = +[DBApplicationController sharedInstance];
          v15 = [v16 applicationWithBundleIdentifier:v4];

          if (!v15)
          {
            unint64_t v17 = [[DBApplicationInfo alloc] initWithApplicationRecord:v6];
            v15 = [[DBApplication alloc] initWithApplicationInfo:v17];
          }
          BOOL v18 = [(DBNowPlayingObserver *)self _isValidNowPlayingApplication:v15];
          v19 = DBLogForCategory(0);
          BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
          if (v18)
          {
            if (v20)
            {
              *(_DWORD *)buf = 138412290;
              v26 = v15;
              _os_log_impl(&dword_22D6F0000, v19, OS_LOG_TYPE_DEFAULT, "Updated now playing to %@", buf, 0xCu);
            }

            [(DBNowPlayingObserver *)self setNowPlayingApplication:v15];
            int v21 = [(DBNowPlayingObserver *)self delegate];
            char v22 = objc_opt_respondsToSelector();

            if (v22)
            {
              v23[0] = MEMORY[0x263EF8330];
              v23[1] = 3221225472;
              v23[2] = __63__DBNowPlayingObserver__nowPlayingDidChangeToBundleIdentifier___block_invoke;
              v23[3] = &unk_2649B3E90;
              v23[4] = self;
              dispatch_async(MEMORY[0x263EF83A0], v23);
            }
          }
          else
          {
            if (v20)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22D6F0000, v19, OS_LOG_TYPE_DEFAULT, "Now playing app is not valid for CarPlay; ignoring.",
                buf,
                2u);
            }
          }
        }
      }
    }
    else
    {
      v12 = DBLogForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "No available now playing app record.";
        goto LABEL_12;
      }
    }
  }
  else
  {
    v12 = DBLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[DBNowPlayingObserver _nowPlayingDidChangeToBundleIdentifier:]((uint64_t)v7, v12);
    }
  }
}

void __63__DBNowPlayingObserver__nowPlayingDidChangeToBundleIdentifier___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  v2 = *(void **)(a1 + 32);
  v3 = [v2 nowPlayingApplication];
  [v4 nowPlayingObserver:v2 didChangeNowPlayingApplication:v3];
}

- (void)_updatePlaybackStateForBundleIdentifier:(id)a3 playing:(BOOL)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v6 allowPlaceholder:0 error:0];
  char v8 = [v7 applicationState];
  int v9 = [v8 isValid];

  if (v9)
  {
    uint64_t v10 = +[DBApplicationController sharedInstance];
    int v11 = [v10 applicationWithBundleIdentifier:v6];

    self->_playing = a4;
    v12 = [(DBNowPlayingObserver *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __72__DBNowPlayingObserver__updatePlaybackStateForBundleIdentifier_playing___block_invoke;
      block[3] = &unk_2649B66E0;
      block[4] = self;
      BOOL v16 = a4;
      id v15 = v11;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

void __72__DBNowPlayingObserver__updatePlaybackStateForBundleIdentifier_playing___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 nowPlayingObserver:*(void *)(a1 + 32) didUpdatePlaybackState:*(unsigned __int8 *)(a1 + 48) inApplication:*(void *)(a1 + 40)];
}

- (void)nowPlayingManager:(id)a3 didUpdateSnapshot:(id)a4
{
  id v5 = a4;
  id v7 = [v5 bundleIdentifier];
  [(DBNowPlayingObserver *)self _nowPlayingDidChangeToBundleIdentifier:v7];
  uint64_t v6 = [v5 state];

  [(DBNowPlayingObserver *)self _updatePlaybackStateForBundleIdentifier:v7 playing:v6 == 2];
}

- (DBApplication)nowPlayingApplication
{
  return self->_nowPlayingApplication;
}

- (void)setNowPlayingApplication:(id)a3
{
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (DBAppHistory)appHistory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appHistory);
  return (DBAppHistory *)WeakRetained;
}

- (DBEnvironmentConfiguration)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironmentConfiguration *)WeakRetained;
}

- (DBNowPlayingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DBNowPlayingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_environment);
  objc_destroyWeak((id *)&self->_appHistory);
  objc_storeStrong((id *)&self->_nowPlayingApplication, 0);
}

- (void)_nowPlayingDidChangeToBundleIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "Error looking up now playing application record: %@", (uint8_t *)&v2, 0xCu);
}

@end