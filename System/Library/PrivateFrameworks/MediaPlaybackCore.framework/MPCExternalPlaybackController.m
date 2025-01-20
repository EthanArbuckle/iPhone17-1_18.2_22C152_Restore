@interface MPCExternalPlaybackController
- (BOOL)isExternalPlaybackAllowedForItem:(id)a3;
- (BOOL)isPodcastContent:(id)a3;
- (BOOL)playerShouldUseAudiOnlyMode:(id)a3 item:(id)a4 externalScreenType:(int64_t)a5;
- (MPAVRoutingController)routingController;
- (MPCExternalPlaybackController)initWithPlaybackEngine:(id)a3 translator:(id)a4;
- (MPCMediaFoundationTranslator)translator;
- (MPCPlaybackEngine)playbackEngine;
- (int64_t)exernalPlaybackRouteRestrictionForItem:(id)a3 route:(id)a4 isScreenMirroringActive:(BOOL)a5;
- (void)configureExternalPlaybackForPlayer:(id)a3 queueItem:(id)a4;
- (void)pickBestDeviceRoute;
@end

@implementation MPCExternalPlaybackController

- (MPCExternalPlaybackController)initWithPlaybackEngine:(id)a3 translator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MPCExternalPlaybackController;
  v8 = [(MPCExternalPlaybackController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_playbackEngine, v6);
    objc_storeStrong((id *)&v9->_translator, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translator, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);

  objc_storeStrong((id *)&self->_routingController, 0);
}

- (MPCMediaFoundationTranslator)translator
{
  return self->_translator;
}

- (MPCPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (int64_t)exernalPlaybackRouteRestrictionForItem:(id)a3 route:(id)a4 isScreenMirroringActive:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([(MPCExternalPlaybackController *)self isPodcastContent:v7]) {
    goto LABEL_12;
  }
  if (([v8 canPlayEncryptedProgressiveDownloadAssets] & 1) != 0
    || [v7 playbackMode]
    || ([v7 hasProtectedContent] & 1) == 0)
  {
    if (([v8 canFetchMediaDataFromSender] & 1) == 0 && !objc_msgSend(v7, "playbackMode"))
    {
      int64_t v9 = 2;
      goto LABEL_13;
    }
    if (([v8 presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets] & 1) == 0
      && [v7 type] == 1)
    {
      int64_t v9 = 3;
      goto LABEL_13;
    }
    if ([v7 type] != 2
      && (![v8 canAccessRemoteAssets]
       || ([v7 allowsAirPlayFromCloud] & 1) == 0))
    {
      int64_t v9 = 4;
      goto LABEL_13;
    }
LABEL_12:
    int64_t v9 = 0;
    goto LABEL_13;
  }
  int64_t v9 = 1;
LABEL_13:

  return v9;
}

- (BOOL)playerShouldUseAudiOnlyMode:(id)a3 item:(id)a4 externalScreenType:(int64_t)a5
{
  return objc_msgSend(a4, "type", a3) != 2;
}

- (BOOL)isExternalPlaybackAllowedForItem:(id)a3
{
  return [a3 allowsExternalPlayback];
}

- (BOOL)isPodcastContent:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 mediaType] == 2 || objc_msgSend(v3, "mediaType") == 1024;

  return v4;
}

- (void)pickBestDeviceRoute
{
  id v2 = [(MPCExternalPlaybackController *)self routingController];
  [v2 pickBestDeviceRoute];
}

- (void)configureExternalPlaybackForPlayer:(id)a3 queueItem:(id)a4
{
  v82[12] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![v7 isAssetLoaded]) {
    goto LABEL_57;
  }
  v68 = self;
  id v69 = v6;
  id v8 = [(MPCExternalPlaybackController *)self routingController];
  int64_t v9 = [v8 pickedRoute];
  [v7 reevaluateType];
  [v7 reevaluateHasProtectedContent];
  unint64_t v10 = [v8 externalScreenType];
  v82[0] = MEMORY[0x263EFFA80];
  v81[0] = @"_useAirPlayMusicMode";
  v81[1] = @"itemAllowsAirPlayFromCloud";
  v64 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "allowsAirPlayFromCloud"));
  v82[1] = v64;
  v81[2] = @"itemAllowsExternalPlayback";
  v63 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "allowsExternalPlayback"));
  v82[2] = v63;
  v81[3] = @"itemHasProtectedContent";
  v62 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "hasProtectedContent"));
  v82[3] = v62;
  v81[4] = @"itemType";
  unint64_t v11 = [v7 type];
  if (v11 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown - %ld", v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_2643C1FD0[v11];
  }
  v61 = v12;
  v82[4] = v12;
  v81[5] = @"itemPlaybackMode";
  uint64_t v13 = [v7 playbackMode];
  v65 = v8;
  if (v13)
  {
    if (v13 == 1)
    {
      v14 = @"Streaming";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown - %ld", v13);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v14 = @"File";
  }
  v82[5] = v14;
  v81[6] = @"externalScreenType";
  if (v10 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown - %ld", v10);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_2643C1FE8[v10];
  }
  v82[6] = v15;
  v81[7] = @"isAppleTVRoute";
  v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isAppleTVRoute"));
  v82[7] = v16;
  v81[8] = @"routeSubtype";
  [v9 routeSubtype];
  v17 = MPAVRouteSubtypeDescription();
  v82[8] = v17;
  v81[9] = @"canPlayEncryptedProgressiveDownloadAssets";
  v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "canPlayEncryptedProgressiveDownloadAssets"));
  v82[9] = v18;
  v81[10] = @"canFetchMediaDataFromSender";
  v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "canFetchMediaDataFromSender"));
  v82[10] = v19;
  v81[11] = @"presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets";
  v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets"));
  v82[11] = v20;
  v67 = [NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:12];

  v21 = v68;
  LODWORD(v16) = [(MPCExternalPlaybackController *)v68 isExternalPlaybackAllowedForItem:v7];
  uint64_t v22 = [(MPCExternalPlaybackController *)v68 playerShouldUseAudiOnlyMode:v69 item:v7 externalScreenType:v10];
  v66 = v9;
  if (!v16)
  {
    uint64_t v30 = 0;
    BOOL v31 = 0;
    unint64_t v24 = 0x263F08000;
LABEL_40:
    id v6 = v69;
    goto LABEL_44;
  }
  uint64_t v23 = [(MPCExternalPlaybackController *)v68 exernalPlaybackRouteRestrictionForItem:v7 route:v9 isScreenMirroringActive:v10 != 0];
  unint64_t v24 = 0x263F08000uLL;
  if (v23)
  {
    v25 = [(MPCExternalPlaybackController *)v68 playbackEngine];
    v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [v25 engineID];
      v28 = (void *)v27;
      if ((unint64_t)(v23 - 2) > 2) {
        v29 = @"Picked route can't play encrypted local files via progressive download";
      }
      else {
        v29 = off_2643C2000[v23 - 2];
      }
      *(_DWORD *)buf = 138544386;
      uint64_t v73 = v27;
      __int16 v74 = 2048;
      v75 = v68;
      __int16 v76 = 2114;
      *(void *)v77 = v9;
      *(_WORD *)&v77[8] = 2114;
      id v78 = v7;
      __int16 v79 = 2114;
      v80 = v29;
      _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCExternalPlaybackControllerImplementation %p - External playback configuration [Overriding isExternalPlaybackPossible to NO] - Picked route does not support external display - pickedRoute:%{public}@ - item:%{public}@ - reason:%{public}@", buf, 0x34u);
    }
  }
  if (v10 && [v7 type] != 2)
  {
    v32 = [(MPCExternalPlaybackController *)v68 playbackEngine];
    v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = [v32 engineID];
      v35 = (void *)v34;
      if ((unint64_t)(v23 - 1) > 3) {
        v36 = @"Picked route has no restrictions";
      }
      else {
        v36 = off_2643C2018[v23 - 1];
      }
      *(_DWORD *)buf = 138544386;
      uint64_t v73 = v34;
      __int16 v74 = 2048;
      v75 = v68;
      __int16 v76 = 2114;
      *(void *)v77 = v9;
      *(_WORD *)&v77[8] = 2114;
      id v78 = v7;
      __int16 v79 = 2114;
      v80 = v36;
      _os_log_impl(&dword_21BB87000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCExternalPlaybackControllerImplementation %p - External playback configuration [Overriding isExternalPlaybackPossible to NO] - Screen mirroring is on for an audio item - pickedRoute:%{public}@ - item:%{public}@ - reason:%{public}@", buf, 0x34u);
    }
    if ([v7 type] != 1)
    {
LABEL_39:
      uint64_t v30 = 0;
      BOOL v31 = 0;
      goto LABEL_40;
    }
  }
  else if ([v7 type] != 1)
  {
    if (!v23)
    {
      BOOL v31 = (v10 || [(MPCExternalPlaybackController *)v68 isPodcastContent:v7])
         && [v7 type] == 2;
      uint64_t v30 = 1;
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  v37 = [(MPCExternalPlaybackController *)v68 playbackEngine];
  v38 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v6 = v69;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v39 = [v37 engineID];
    v40 = (void *)v39;
    if ((unint64_t)(v23 - 1) > 3) {
      v41 = @"Picked route has no restrictions";
    }
    else {
      v41 = off_2643C2018[v23 - 1];
    }
    *(_DWORD *)buf = 138544386;
    uint64_t v73 = v39;
    __int16 v74 = 2048;
    v75 = v68;
    __int16 v76 = 2114;
    *(void *)v77 = v9;
    *(_WORD *)&v77[8] = 2114;
    id v78 = v7;
    __int16 v79 = 2114;
    v80 = v41;
    _os_log_impl(&dword_21BB87000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCExternalPlaybackControllerImplementation %p - External playback configuration [Overriding isExternalPlaybackPossible to NO] - We prefer buffered audio over url flinging for audio items - pickedRoute:%{public}@ - item:%{public}@ - reason:%{public}@", buf, 0x34u);
  }
  uint64_t v30 = 0;
  BOOL v31 = 0;
LABEL_44:
  v70[0] = @"usesExternalPlaybackWhileExternalScreenIsActive";
  v42 = [*(id *)(v24 + 2584) numberWithBool:v31];
  v71[0] = v42;
  v70[1] = @"isExternalPlaybackAllowed";
  v43 = [*(id *)(v24 + 2584) numberWithBool:v30];
  v71[1] = v43;
  v70[2] = @"usesAudioOnlyMode";
  v44 = [*(id *)(v24 + 2584) numberWithBool:v22];
  v71[2] = v44;
  v45 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:3];

  v46 = [(MPCExternalPlaybackController *)v68 playbackEngine];
  v47 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = [v46 engineID];
    v49 = objc_msgSend(v67, "msv_compactDescription");
    v50 = objc_msgSend(v45, "msv_compactDescription");
    *(_DWORD *)buf = 138544130;
    uint64_t v73 = (uint64_t)v48;
    __int16 v74 = 2048;
    v75 = v68;
    __int16 v76 = 2114;
    *(void *)v77 = v49;
    *(_WORD *)&v77[8] = 2114;
    id v78 = v50;
    _os_log_impl(&dword_21BB87000, v47, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCExternalPlaybackControllerImplementation %p - External playback configuration [diagnosis] - input: %{public}@ -> output: %{public}@", buf, 0x2Au);

    id v6 = v69;
    v21 = v68;
  }
  v51 = [(MPCExternalPlaybackController *)v21 playbackEngine];
  v52 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    v53 = [v51 engineID];
    *(_DWORD *)buf = 138544386;
    uint64_t v73 = (uint64_t)v53;
    __int16 v74 = 2048;
    v75 = v21;
    __int16 v76 = 1024;
    *(_DWORD *)v77 = v31;
    *(_WORD *)&v77[4] = 1024;
    *(_DWORD *)&v77[6] = v22;
    LOWORD(v78) = 1024;
    *(_DWORD *)((char *)&v78 + 2) = v30;
    _os_log_impl(&dword_21BB87000, v52, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCExternalPlaybackControllerImplementation %p - External playback configuration [Updating player] - usesExternalPlaybackWhileExternalScreenIsActive:%{BOOL}u, usesAudioOnlyMode:%{BOOL}u, wantsExternalPlayback:%{BOOL}u", buf, 0x28u);
  }
  int v54 = v22 ^ [v6 usesAudioOnlyModeForExternalPlayback];
  if (v54 == 1) {
    [v6 setUsesAudioOnlyModeForExternalPlayback:v22];
  }
  [v6 setUsesExternalPlaybackWhileExternalScreenIsActive:v31];
  if (v30 != [v6 allowsExternalPlayback]) {
    goto LABEL_53;
  }
  if (v54)
  {
    [v6 setAllowsExternalPlayback:v30 ^ 1];
LABEL_53:
    [v6 setAllowsExternalPlayback:v30];
  }
  uint64_t v55 = v30 & [v66 isAppleTVRoute];
  v56 = [(MPCExternalPlaybackController *)v21 playbackEngine];
  v57 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v58 = [v56 engineID];
    v59 = v21;
    v60 = (void *)v58;
    *(_DWORD *)buf = 138544130;
    uint64_t v73 = v58;
    __int16 v74 = 2048;
    v75 = v59;
    __int16 v76 = 2114;
    *(void *)v77 = v7;
    *(_WORD *)&v77[8] = 1024;
    LODWORD(v78) = v55;
    _os_log_impl(&dword_21BB87000, v57, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCExternalPlaybackControllerImplementation %p - External playback configuration [Updating item] - queueItem:%{public}@ - externalDisplay:%{BOOL}u", buf, 0x26u);
  }
  [v7 setExternalDisplay:v55];

LABEL_57:
}

- (MPAVRoutingController)routingController
{
  routingController = self->_routingController;
  if (!routingController)
  {
    id v4 = objc_alloc(MEMORY[0x263F11D28]);
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = (MPAVRoutingController *)[v4 initWithName:v6];
    id v8 = self->_routingController;
    self->_routingController = v7;

    [(MPAVRoutingController *)self->_routingController setFetchAvailableRoutesSynchronously:1];
    routingController = self->_routingController;
  }

  return routingController;
}

@end