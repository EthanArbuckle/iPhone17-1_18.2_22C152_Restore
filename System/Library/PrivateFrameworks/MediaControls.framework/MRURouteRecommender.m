@interface MRURouteRecommender
+ (id)sharedInstance;
- (IRServiceToken)serviceToken;
- (IRSession)session;
- (MRRouteRepresentable)lastDonatedPickerChoice;
- (MRURouteRecommender)init;
- (NSArray)donatedRoutes;
- (NSArray)recommendedRoutes;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)donationQueue;
- (id)defaultsContext;
- (id)irCandidateFor:(id)a3;
- (id)recommendationForGroupedOutputDevices:(id)a3;
- (id)sortEndpointRoutes:(id)a3;
- (int)firstUnlockToken;
- (int64_t)mode;
- (os_unfair_lock_s)donatedRoutesLock;
- (os_unfair_lock_s)recommendedRoutesLock;
- (void)addDonatedRoute:(id)a3;
- (void)donateGroupedOutputDevices:(id)a3;
- (void)donatePickerChoiceFor:(id)a3 bundleID:(id)a4 isEligibleApp:(BOOL)a5 reason:(id)a6;
- (void)initializeSession;
- (void)initializeSessionWhenAppropriate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateContext:(id)a4;
- (void)session:(id)a3 suspendedWithReason:(int64_t)a4;
- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5;
- (void)setDonatedRoutes:(id)a3;
- (void)setDonationQueue:(id)a3;
- (void)setFirstUnlockToken:(int)a3;
- (void)setLastDonatedPickerChoice:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setRecommendedRoutes:(id)a3;
- (void)setServiceToken:(id)a3;
- (void)setSession:(id)a3;
- (void)updateRecommendations;
@end

@implementation MRURouteRecommender

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)sharedInstance___sharedInstance;

  return v2;
}

void __37__MRURouteRecommender_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = v0;
}

- (MRURouteRecommender)init
{
  v10.receiver = self;
  v10.super_class = (Class)MRURouteRecommender;
  v2 = [(MRURouteRecommender *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MRURouteRecommender.IRDonations", v3);
    donationQueue = v2->_donationQueue;
    v2->_donationQueue = (OS_dispatch_queue *)v4;

    *(void *)&v2->_recommendedRoutesLock._os_unfair_lock_opaque = 0;
    donatedRoutes = v2->_donatedRoutes;
    v2->_donatedRoutes = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mediaremote"];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v7;

    [(NSUserDefaults *)v2->_userDefaults addObserver:v2 forKeyPath:@"IRContextUpdate" options:0 context:0];
    [(MRURouteRecommender *)v2 initializeSessionWhenAppropriate];
  }
  return v2;
}

- (id)irCandidateFor:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F70BA8];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 routeIdentifier];
  uint64_t v7 = (void *)[v5 initWithCandidateIdentifier:v6];

  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v9 = [v4 nodes];

  objc_super v10 = objc_msgSend(v9, "msv_map:", &__block_literal_global_156);
  v11 = [v8 setWithArray:v10];
  [v7 updateNodes:v11];

  return v7;
}

id __38__MRURouteRecommender_irCandidateFor___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F70BC0];
  id v3 = a2;
  id v4 = objc_alloc_init(v2);
  id v5 = [v3 avOutputDeviceIdentifier];
  [v4 setAvOutpuDeviceIdentifier:v5];

  v6 = [v3 rapportIdentifier];
  [v4 setRapportIdentifier:v6];

  uint64_t v7 = [v3 idsIdentifier];
  [v4 setIdsIdentifier:v7];

  uint64_t v8 = [v3 isLocal];
  [v4 setIsLocal:v8];

  return v4;
}

- (NSArray)recommendedRoutes
{
  p_recommendedRoutesLock = &self->_recommendedRoutesLock;
  os_unfair_lock_lock(&self->_recommendedRoutesLock);
  id v4 = self->_recommendedRoutes;
  os_unfair_lock_unlock(p_recommendedRoutesLock);

  return v4;
}

- (void)setRecommendedRoutes:(id)a3
{
  id v4 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_recommendedRoutesLock);
  recommendedRoutes = self->_recommendedRoutes;
  self->_recommendedRoutes = v4;

  os_unfair_lock_unlock(&self->_recommendedRoutesLock);
}

- (void)updateRecommendations
{
  id v3 = [(MRURouteRecommender *)self donationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MRURouteRecommender_updateRecommendations__block_invoke;
  block[3] = &unk_1E5F0D7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __44__MRURouteRecommender_updateRecommendations__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) session];
  [v1 requestCurrentContext];
}

- (NSArray)donatedRoutes
{
  p_donatedRoutesLock = &self->_donatedRoutesLock;
  os_unfair_lock_lock(&self->_donatedRoutesLock);
  id v4 = self->_donatedRoutes;
  os_unfair_lock_unlock(p_donatedRoutesLock);

  return v4;
}

- (void)setDonatedRoutes:(id)a3
{
  id v4 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_donatedRoutesLock);
  donatedRoutes = self->_donatedRoutes;
  self->_donatedRoutes = v4;

  os_unfair_lock_unlock(&self->_donatedRoutesLock);
}

- (void)addDonatedRoute:(id)a3
{
  id v9 = a3;
  p_donatedRoutesLock = &self->_donatedRoutesLock;
  os_unfair_lock_lock(&self->_donatedRoutesLock);
  donatedRoutes = self->_donatedRoutes;
  p_donatedRoutes = &self->_donatedRoutes;
  uint64_t v7 = donatedRoutes;
  if (![(NSArray *)v7 containsObject:v9])
  {
    uint64_t v8 = [(NSArray *)*p_donatedRoutes arrayByAddingObject:v9];

    objc_storeStrong((id *)p_donatedRoutes, v8);
    uint64_t v7 = v8;
  }
  os_unfair_lock_unlock(p_donatedRoutesLock);
}

- (id)recommendationForGroupedOutputDevices:(id)a3
{
  id v4 = [MEMORY[0x1E4F77058] routeWithOutputDevices:a3];
  if (v4)
  {
    id v5 = [(MRURouteRecommender *)self recommendedRoutes];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__MRURouteRecommender_recommendationForGroupedOutputDevices___block_invoke;
    v17[3] = &unk_1E5F0EA30;
    id v6 = v4;
    id v18 = v6;
    uint64_t v7 = objc_msgSend(v5, "msv_firstWhere:", v17);

    if (v7)
    {
      uint64_t v8 = v7;
    }
    else
    {
      id v9 = [(MRURouteRecommender *)self donatedRoutes];
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __61__MRURouteRecommender_recommendationForGroupedOutputDevices___block_invoke_2;
      v15 = &unk_1E5F0EA58;
      id v16 = v6;
      objc_super v10 = objc_msgSend(v9, "msv_firstWhere:", &v12);

      if (v10)
      {
        uint64_t v8 = objc_alloc_init(MRURecommendation);
        -[MRURecommendation setRoute:](v8, "setRoute:", v10, v12, v13, v14, v15);
        [(MRURecommendation *)v8 setClassification:0];
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __61__MRURouteRecommender_recommendationForGroupedOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 route];
  id v4 = [v3 routeIdentifier];
  id v5 = [*(id *)(a1 + 32) routeIdentifier];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

uint64_t __61__MRURouteRecommender_recommendationForGroupedOutputDevices___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 routeIdentifier];
  id v4 = [*(id *)(a1 + 32) routeIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)donateGroupedOutputDevices:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MRURouteRecommender *)self session];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F77058] routeWithOutputDevices:v4];
    uint64_t v7 = v6;
    if (v6)
    {
      if ([v6 donateAsCandidate])
      {
        uint64_t v8 = [(MRURouteRecommender *)self donationQueue];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __50__MRURouteRecommender_donateGroupedOutputDevices___block_invoke;
        v16[3] = &unk_1E5F0D8E8;
        v17 = v7;
        id v18 = self;
        dispatch_async(v8, v16);

        id v9 = v17;
      }
      else
      {
        id v9 = _MRLogForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v7;
          _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR NOT donating %@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    uint64_t v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MRURouteRecommender donateGroupedOutputDevices:]((uint64_t)v4, v7, v10, v11, v12, v13, v14, v15);
    }
  }
}

uint64_t __50__MRURouteRecommender_donateGroupedOutputDevices___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = _MRLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1AE7DF000, v2, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR updateRouteCandidate: %@", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) session];
  uint64_t v5 = [*(id *)(a1 + 40) irCandidateFor:*(void *)(a1 + 32)];
  [v4 updateCandidate:v5];

  return [*(id *)(a1 + 40) addDonatedRoute:*(void *)(a1 + 32)];
}

- (void)initializeSessionWhenAppropriate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  uint64_t v3 = [(MRURouteRecommender *)self donationQueue];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __55__MRURouteRecommender_initializeSessionWhenAppropriate__block_invoke;
  handler[3] = &unk_1E5F0E8B0;
  objc_copyWeak(&v11, &location);
  uint32_t v4 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &self->_firstUnlockToken, v3, handler);

  if (v4)
  {
    uint64_t v5 = _MRLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v14 = v4;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR Failed to register for first unlock notification (status = %d)", buf, 8u);
    }
  }
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    uint64_t v6 = [(MRURouteRecommender *)self donationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__MRURouteRecommender_initializeSessionWhenAppropriate__block_invoke_162;
    block[3] = &unk_1E5F0DA00;
    objc_copyWeak(&v9, &location);
    dispatch_async(v6, block);

    objc_destroyWeak(&v9);
  }
  else
  {
    int v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR Device not yet unlocked since boot", buf, 2u);
    }
  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __55__MRURouteRecommender_initializeSessionWhenAppropriate__block_invoke(uint64_t a1)
{
  v2 = _MRLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v4 = 0;
    _os_log_impl(&dword_1AE7DF000, v2, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR Received first unlock notification", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained initializeSession];
}

void __55__MRURouteRecommender_initializeSessionWhenAppropriate__block_invoke_162(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained initializeSession];
}

- (void)initializeSession
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F77108] currentSettings];
  int v4 = [v3 supportRouteRecommendations];

  if (v4)
  {
    int v5 = [MEMORY[0x1E4F77990] hasEntitlement:@"com.apple.intelligentroutingd.xpc.media" inGroup:@"com.apple.security.exception.mach-lookup.global-name"];
    int v6 = [MEMORY[0x1E4F77990] hasBoolEntitlement:@"com.apple.intelligentrouting.recommendationservice"];
    int v7 = v6;
    if (v5 && (v6 & 1) != 0)
    {
      uint64_t v8 = [(MRURouteRecommender *)self serviceToken];

      id v9 = _MRLogForCategory();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v10)
        {
          id v11 = [(MRURouteRecommender *)self serviceToken];
          int v17 = 138412290;
          id v18 = v11;
          _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR Using persisted token %@", (uint8_t *)&v17, 0xCu);
        }
        id v12 = objc_alloc_init(MEMORY[0x1E4F70BD0]);
        [(MRURouteRecommender *)self setSession:v12];

        uint64_t v13 = [(MRURouteRecommender *)self session];
        [v13 setDelegate:self];

        [(MRURouteRecommender *)self setMode:0];
      }
      else
      {
        if (v10)
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR No persisted token :(", (uint8_t *)&v17, 2u);
        }
      }
      if (notify_is_valid_token(self->_firstUnlockToken)) {
        notify_cancel(self->_firstUnlockToken);
      }
    }
    else
    {
      uint32_t v14 = _MRLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = @"NO";
        if (v5) {
          id v16 = @"YES";
        }
        else {
          id v16 = @"NO";
        }
        if (v7) {
          uint64_t v15 = @"YES";
        }
        int v17 = 138412546;
        id v18 = v16;
        __int16 v19 = 2112;
        v20 = v15;
        _os_log_impl(&dword_1AE7DF000, v14, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR MRUClient hasLookupException: %@, hasIRBooleanEntitlement: %@ - won't try to create a session", (uint8_t *)&v17, 0x16u);
      }
    }
  }
}

- (IRServiceToken)serviceToken
{
  return (IRServiceToken *)[MEMORY[0x1E4F70BC8] serviceTokenForServiceIdentifier:*MEMORY[0x1E4F76F68]];
}

- (void)setMode:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  self->_mode = a3;
  int v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134217984;
    int64_t v21 = a3;
    _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR Mode set to %ld", (uint8_t *)&v20, 0xCu);
  }

  int v6 = [(MRURouteRecommender *)self session];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F70BB0]);
    uint64_t v8 = [(MRURouteRecommender *)self serviceToken];
    id v9 = [v7 initWithServiceToken:v8];

    [v9 setMode:a3];
    BOOL v10 = _MRLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(MRURouteRecommender *)self session];
      id v12 = [(MRURouteRecommender *)self session];
      int v20 = 134218498;
      int64_t v21 = (int64_t)v11;
      __int16 v22 = 2112;
      v23 = v12;
      __int16 v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1AE7DF000, v10, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR Will call (%p)%@ runWithConfiguration: %@", (uint8_t *)&v20, 0x20u);
    }
    uint64_t v13 = [(MRURouteRecommender *)self session];
    [v13 runWithConfiguration:v9];
  }
  else
  {
    id v9 = _MRLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MRURouteRecommender setMode:](a3, v9, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v7;
    _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR session:didFailWithError: %@", (uint8_t *)&v15, 0xCu);
  }

  id v9 = [(MRURouteRecommender *)self session];
  if (v9 == v6)
  {
    BOOL v10 = [v7 domain];
    int v11 = [v10 isEqualToString:*MEMORY[0x1E4F70BA0]];

    if (v11)
    {
      if ([v7 code] == -12887)
      {
        id v12 = _MRLogForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 134217984;
          id v16 = v6;
          _os_log_impl(&dword_1AE7DF000, v12, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR Client session %p invalidated, recreating", (uint8_t *)&v15, 0xCu);
        }

        [(MRURouteRecommender *)self initializeSession];
      }
      else if ([v7 code] == -12889)
      {
        uint64_t v13 = _MRLogForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[MRURouteRecommender session:didFailWithError:](self, (uint64_t)v6, v13);
        }

        uint64_t v14 = _MRLogForCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          -[MRURouteRecommender session:didFailWithError:](self, (uint64_t)v6, v14);
        }

        [(MRURouteRecommender *)self setSession:0];
      }
    }
  }
  else
  {
  }
}

- (void)session:(id)a3 didUpdateContext:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v5;
    _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR session:didUpdateContext: %@", buf, 0xCu);
  }

  id v7 = [(MRURouteRecommender *)self defaultsContext];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F70B98]];
  }
  BOOL v10 = v9;

  int v11 = [v10 contextIdentifier];
  id v12 = [v10 candidateResults];
  uint64_t v13 = _MRLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v12;
    _os_log_impl(&dword_1AE7DF000, v13, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR got %@", buf, 0xCu);
  }

  uint64_t v14 = [v12 allObjects];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __48__MRURouteRecommender_session_didUpdateContext___block_invoke;
  v18[3] = &unk_1E5F0EA80;
  id v19 = v11;
  id v15 = v11;
  id v16 = objc_msgSend(v14, "msv_map:", v18);
  [(MRURouteRecommender *)self setRecommendedRoutes:v16];

  uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 postNotificationName:MRURouteRecommenderDidUpdateRecommendationsNotification object:self];
}

MRURecommendation *__48__MRURouteRecommender_session_didUpdateContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[MRURecommendation recommendationWithIRCandidateResult:a2 contextIdentifier:*(void *)(a1 + 32)];
}

- (void)session:(id)a3 suspendedWithReason:(int64_t)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    int64_t v7 = a4;
    _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR session:suspendedWithReason: %ld", (uint8_t *)&v6, 0xCu);
  }
}

- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    int64_t v9 = a4;
    __int16 v10 = 1024;
    BOOL v11 = v5;
    _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR session:suspensionReasonEnded:isNoLongerSuspended: %ld %d", (uint8_t *)&v8, 0x12u);
  }
}

- (id)defaultsContext
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [(MRURouteRecommender *)self userDefaults];
  uint64_t v3 = [v2 objectForKey:@"IRContextUpdate"];

  int v4 = +[MRIRRouteRecommendationContext fromObject:v3];
  BOOL v5 = _MRLogForCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6) {
      goto LABEL_7;
    }
    int v11 = 138412290;
    uint64_t v12 = v4;
    int64_t v7 = "[MRDRRC].URR Overriding context with %@";
    int v8 = v5;
    uint32_t v9 = 12;
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    int v11 = 138412546;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    uint64_t v14 = v3;
    int64_t v7 = "[MRDRRC].URR Not overriding with %@, %@";
    int v8 = v5;
    uint32_t v9 = 22;
  }
  _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, v9);
LABEL_7:

  return v4;
}

- (id)sortEndpointRoutes:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MRURouteRecommender *)self session];
  if (v5 && (v6 = (void *)v5, unint64_t v7 = [v4 count], v6, v7 > 1))
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v32 = [(MRURouteRecommender *)self recommendedRoutes];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v27 = v4;
    id obj = v4;
    uint64_t v9 = [obj countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v33 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v37 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            __int16 v13 = v12;
          }
          else {
            __int16 v13 = 0;
          }
          id v14 = v13;
          uint64_t v15 = [v14 endpointObject];
          if (v15)
          {
            id v16 = [MEMORY[0x1E4F77058] routeWithEndpoint:v15];
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __42__MRURouteRecommender_sortEndpointRoutes___block_invoke;
            v34[3] = &unk_1E5F0EA30;
            id v17 = v16;
            id v35 = v17;
            uint64_t v18 = objc_msgSend(v32, "msv_firstWhere:", v34);
            uint64_t v19 = [v18 classification];
            if ((unint64_t)(v19 - 2) >= 3)
            {
              if (v19 == 1)
              {
                int v20 = v28;
                uint64_t v21 = 1;
              }
              else
              {
                uint64_t v21 = 0;
                int v20 = v30;
              }
            }
            else
            {
              int v20 = v29;
              uint64_t v21 = 2;
            }
            id v22 = v20;
            v23 = _MRLogForCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              id v41 = v12;
              __int16 v42 = 2048;
              uint64_t v43 = v21;
              __int16 v44 = 2112;
              id v45 = v18;
              _os_log_impl(&dword_1AE7DF000, v23, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR %@ got %lu - %@", buf, 0x20u);
            }

            [v22 addObject:v12];
          }
          else
          {
            [v30 addObject:v12];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v48 count:16];
      }
      while (v10);
    }

    __int16 v24 = [v29 arrayByAddingObjectsFromArray:v30];
    id v8 = [v24 arrayByAddingObjectsFromArray:v28];

    v25 = _MRLogForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v41 = v29;
      __int16 v42 = 2112;
      uint64_t v43 = (uint64_t)v30;
      __int16 v44 = 2112;
      id v45 = v28;
      __int16 v46 = 2112;
      id v47 = v8;
      _os_log_impl(&dword_1AE7DF000, v25, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR promoted: %@ medium: %@, bottom: %@ = %@", buf, 0x2Au);
    }

    id v4 = v27;
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

uint64_t __42__MRURouteRecommender_sortEndpointRoutes___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 routeIdentifier];
  uint64_t v5 = [v3 route];

  BOOL v6 = [v5 routeIdentifier];
  uint64_t v7 = [v4 isEqualToString:v6];

  return v7;
}

- (void)donatePickerChoiceFor:(id)a3 bundleID:(id)a4 isEligibleApp:(BOOL)a5 reason:(id)a6
{
  BOOL v7 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = a6;
  __int16 v13 = [(MRURouteRecommender *)self session];

  if (v13)
  {
    id v14 = [MEMORY[0x1E4F77058] routeWithEndpoint:v10];
    uint64_t v15 = [(MRURouteRecommender *)self lastDonatedPickerChoice];
    int v16 = [v14 isEqual:v15];

    if (v16)
    {
      id v17 = _MRLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 138412290;
        v31 = v14;
        _os_log_impl(&dword_1AE7DF000, v17, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR Not dropping duplicate picker choice for %@ - picks are distributed", (uint8_t *)&v30, 0xCu);
      }
    }
    [(MRURouteRecommender *)self setLastDonatedPickerChoice:v14];
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F70BB8]) initWithEventType:0 eventSubType:0];
    uint64_t v19 = v18;
    if (v11)
    {
      [v18 setBundleID:v11];
      [v19 setIsEligibleApp:v7];
    }
    int v20 = [(MRURouteRecommender *)self irCandidateFor:v14];
    uint64_t v21 = [v20 candidateIdentifier];

    id v22 = _MRLogForCategory();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v23)
      {
        int v30 = 138412802;
        v31 = v19;
        __int16 v32 = 2112;
        uint64_t v33 = v20;
        __int16 v34 = 2112;
        id v35 = v12;
        _os_log_impl(&dword_1AE7DF000, v22, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR EVENT: MRU is adding %@ for candidate %@ - reason: %@", (uint8_t *)&v30, 0x20u);
      }

      id v22 = [(MRURouteRecommender *)self session];
      [v22 addEvent:v19 forCandidate:v20];
    }
    else if (v23)
    {
      int v30 = 138413314;
      v31 = v19;
      __int16 v32 = 2112;
      uint64_t v33 = v20;
      __int16 v34 = 2112;
      id v35 = v14;
      __int16 v36 = 2112;
      id v37 = v10;
      __int16 v38 = 2112;
      long long v39 = v12;
      _os_log_impl(&dword_1AE7DF000, v22, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR EVENT: MRU is DROPPING %@ for candidate %@, no candidate identifier - route: %@, endpoint: %@ - reason: %@", (uint8_t *)&v30, 0x34u);
    }
  }
  else
  {
    id v14 = _MRLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MRURouteRecommender donatePickerChoiceFor:bundleID:isEligibleApp:reason:]((uint64_t)v10, v14, v24, v25, v26, v27, v28, v29);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11 = a3;
  id v8 = a4;
  id v9 = [(MRURouteRecommender *)self userDefaults];

  if (v9 == v8 && [v11 isEqualToString:@"IRContextUpdate"])
  {
    id v10 = [(MRURouteRecommender *)self session];
    [(MRURouteRecommender *)self session:v10 didUpdateContext:MEMORY[0x1E4F1CC08]];
  }
}

- (IRSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void)setServiceToken:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (int64_t)mode
{
  return self->_mode;
}

- (OS_dispatch_queue)donationQueue
{
  return self->_donationQueue;
}

- (void)setDonationQueue:(id)a3
{
}

- (os_unfair_lock_s)recommendedRoutesLock
{
  return self->_recommendedRoutesLock;
}

- (os_unfair_lock_s)donatedRoutesLock
{
  return self->_donatedRoutesLock;
}

- (int)firstUnlockToken
{
  return self->_firstUnlockToken;
}

- (void)setFirstUnlockToken:(int)a3
{
  self->_firstUnlockToken = a3;
}

- (MRRouteRepresentable)lastDonatedPickerChoice
{
  return self->_lastDonatedPickerChoice;
}

- (void)setLastDonatedPickerChoice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDonatedPickerChoice, 0);
  objc_storeStrong((id *)&self->_donationQueue, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_serviceToken, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_donatedRoutes, 0);

  objc_storeStrong((id *)&self->_recommendedRoutes, 0);
}

- (void)donateGroupedOutputDevices:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setMode:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)session:(NSObject *)a3 didFailWithError:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 serviceToken];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1AE7DF000, a3, OS_LOG_TYPE_FAULT, "Token %@ invalidated for session %p, in client process, clearing session", v5, 0x16u);
}

- (void)session:(NSObject *)a3 didFailWithError:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 serviceToken];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1AE7DF000, a3, OS_LOG_TYPE_ERROR, "[MRDRRC].URR Token %@ invalidated for session %p, in client process, clearing session", v5, 0x16u);
}

- (void)donatePickerChoiceFor:(uint64_t)a3 bundleID:(uint64_t)a4 isEligibleApp:(uint64_t)a5 reason:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end