@interface _DKNowPlayingMonitor
+ (BOOL)shouldMergeUnchangedEvents;
+ (id)_bmEventWithDKEvent:(id)a3 outputDevices:(id)a4 biomeEventMetadata:(id)a5 excludeFromSuggestions:(BOOL)a6;
+ (id)_eventFilterBlock;
+ (id)_eventWithBundleIdentifier:(id)a3 metadata:(id)a4;
+ (id)entitlements;
+ (id)eventStream;
+ (void)setPlaybackState:(unsigned int)a3 bundleId:(id)a4 track:(id)a5 outputDeviceIDs:(id)a6 mediaType:(id)a7 iTunesStoreIdentifier:(id)a8 iTunesSubscriptionIdentifier:(id)a9;
- (AVOutputContext)outputContext;
- (_DKNowPlayingMonitor)init;
- (id)_metadataFromInfo:(id)a3 outputDevices:(id)a4;
- (unsigned)lastPlaybackState;
- (void)_nowPlayingInfoDidChange:(void *)a3 outputDevices:(id)a4;
- (void)_registerForNowPlayingNotifications;
- (void)_stripMetadata:(id)a3;
- (void)deactivate;
- (void)dealloc;
- (void)outputDevicesDidChange:(id)a3;
- (void)saveBMEventWithCurrent:(id)a3 outputDevices:(id)a4 artistStoreIdentifier:(id)a5 albumStoreIdentifier:(id)a6 excludeFromSuggestions:(BOOL)a7;
- (void)setLastPlaybackState:(unsigned int)a3;
- (void)setOutputContext:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation _DKNowPlayingMonitor

- (id)_metadataFromInfo:(id)a3 outputDevices:(id)a4
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v66 = a4;
  v6 = [MEMORY[0x263EFF9A0] dictionary];
  v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F54B38]];
  v8 = (void *)[v7 copy];

  if (v8)
  {
    v9 = [MEMORY[0x263F350F0] album];
    [v6 setObject:v8 forKey:v9];
  }
  v10 = [v5 objectForKeyedSubscript:*MEMORY[0x263F54B48]];
  v11 = (void *)[v10 copy];

  if (v11)
  {
    v12 = [MEMORY[0x263F350F0] artist];
    [v6 setObject:v11 forKey:v12];
  }
  v13 = [v5 objectForKeyedSubscript:*MEMORY[0x263F54B98]];
  uint64_t v14 = [v13 copy];

  if (v14)
  {
    v15 = [MEMORY[0x263F350F0] duration];
    [v6 setObject:v14 forKey:v15];
  }
  v16 = [v5 objectForKeyedSubscript:*MEMORY[0x263F54BB0]];
  v17 = (void *)[v16 copy];

  if (v17)
  {
    v18 = [MEMORY[0x263F350F0] genre];
    [v6 setObject:v17 forKey:v18];
  }
  v19 = [v5 objectForKeyedSubscript:*MEMORY[0x263F54C18]];
  uint64_t v20 = [v19 copy];

  if (v20)
  {
    v21 = [MEMORY[0x263F350F0] title];
    [v6 setObject:v20 forKey:v21];
  }
  v69 = (void *)v20;
  v22 = [v5 objectForKeyedSubscript:*MEMORY[0x263F54BD8]];
  v23 = (void *)[v22 copy];

  if (v23)
  {
    v24 = [MEMORY[0x263F350F0] mediaType];
    [v6 setObject:v23 forKey:v24];
  }
  v25 = [v5 objectForKeyedSubscript:*MEMORY[0x263F54C58]];
  uint64_t v26 = [v25 copy];

  if (v26)
  {
    v27 = [MEMORY[0x263F350F0] iTunesStoreIdentifier];
    [v6 setObject:v26 forKey:v27];
  }
  v64 = (void *)v26;
  v65 = (void *)v14;
  v28 = [v5 objectForKeyedSubscript:*MEMORY[0x263F54C60]];
  v29 = (void *)[v28 copy];

  if (v29)
  {
    v30 = [MEMORY[0x263F350F0] iTunesSubscriptionIdentifier];
    [v6 setObject:v29 forKey:v30];
  }
  v31 = v69;
  v70 = v23;
  if (v66 && [v66 count])
  {
    v59 = v29;
    v60 = v11;
    v61 = v8;
    v62 = v6;
    id v63 = v5;
    id v32 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id obj = v66;
    uint64_t v33 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      char v35 = 0;
      uint64_t v36 = *(void *)v72;
      uint64_t v67 = *MEMORY[0x263F54C48];
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v72 != v36) {
            objc_enumerationMutation(obj);
          }
          v38 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          v39 = objc_msgSend(v38, "deviceID", v59, v60, v61);

          if (v39)
          {
            v40 = v17;
            v41 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v38, "deviceType"));
            id v42 = [v32 objectForKeyedSubscript:v41];

            if (!v42)
            {
              id v42 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              v43 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v38, "deviceType"));
              [v32 setObject:v42 forKeyedSubscript:v43];
            }
            v44 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v38, "deviceSubType"));
            id v45 = [v42 objectForKeyedSubscript:v44];

            if (!v45)
            {
              id v45 = objc_alloc_init(MEMORY[0x263EFF980]);
              v46 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v38, "deviceSubType"));
              [v42 setObject:v45 forKeyedSubscript:v46];
            }
            v47 = [v38 deviceID];
            [v45 addObject:v47];

            v17 = v40;
            v31 = v69;
            v23 = v70;
          }
          if ((v35 & 1) == 0)
          {
            id v48 = v38;
            id v49 = v23;
            v50 = v49;
            if (v23 && ![v49 isEqualToString:v67] || objc_msgSend(v48, "deviceType"))
            {
            }
            else
            {
              char v51 = [v48 deviceFeatures];

              BOOL v52 = (v51 & 4) == 0;
              v23 = v70;
              if (!v52) {
                char v35 = 1;
              }
            }
          }
        }
        uint64_t v34 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
      }
      while (v34);
    }
    else
    {
      char v35 = 0;
    }

    v6 = v62;
    if ([v32 count])
    {
      v54 = (void *)[v32 copy];
      v55 = [MEMORY[0x263F350F0] outputDeviceIDs];
      [v62 setObject:v54 forKey:v55];
    }
    uint64_t v53 = v35 & 1;
    id v5 = v63;
    v11 = v60;
    v8 = v61;
    v29 = v59;
  }
  else
  {
    uint64_t v53 = 0;
  }
  v56 = objc_msgSend(NSNumber, "numberWithBool:", v53, v59, v60, v61);
  v57 = [MEMORY[0x263F350F0] isAirPlayVideo];
  [v6 setObject:v56 forKeyedSubscript:v57];

  return v6;
}

+ (void)setPlaybackState:(unsigned int)a3 bundleId:(id)a4 track:(id)a5 outputDeviceIDs:(id)a6 mediaType:(id)a7 iTunesStoreIdentifier:(id)a8 iTunesSubscriptionIdentifier:(id)a9
{
  uint64_t v13 = *(void *)&a3;
  v44[5] = *MEMORY[0x263EF8340];
  uint64_t v14 = (__CFString *)a4;
  v37 = (__CFString *)a5;
  id v15 = a6;
  v16 = (__CFString *)a7;
  id v39 = a8;
  id v40 = a9;
  v17 = [NSNumber numberWithUnsignedInt:v13];
  v18 = [MEMORY[0x263F351B8] userContext];
  v19 = [MEMORY[0x263F351D0] keyPathForMediaPlayingStatus];
  [v18 setObject:v17 forKeyedSubscript:v19];

  v38 = [MEMORY[0x263F351D0] nowPlayingStatusKey];
  v43[0] = v38;
  uint64_t v20 = [NSNumber numberWithUnsignedInt:v13];
  v44[0] = v20;
  v21 = [MEMORY[0x263F351D0] nowPlayingBundleIdKey];
  v43[1] = v21;
  id v42 = v14;
  if (v14) {
    v22 = v14;
  }
  else {
    v22 = &stru_26D866630;
  }
  v23 = v37;
  v44[1] = v22;
  v24 = objc_msgSend(MEMORY[0x263F351D0], "nowPlayingTrackKey", v37);
  v43[2] = v24;
  if (v23) {
    v25 = v23;
  }
  else {
    v25 = &stru_26D866630;
  }
  v44[2] = v25;
  uint64_t v26 = [MEMORY[0x263F351D0] nowPlayingOutputDeviceIDsKey];
  v43[3] = v26;
  id v27 = (id)MEMORY[0x263EFFA78];
  v41 = v15;
  if (v15) {
    id v27 = v15;
  }
  v44[3] = v27;
  v28 = [MEMORY[0x263F351D0] nowPlayingMediaTypeKey];
  v43[4] = v28;
  if (v16) {
    v29 = v16;
  }
  else {
    v29 = &stru_26D866630;
  }
  v44[4] = v29;
  v30 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:5];
  v31 = (void *)[v30 mutableCopy];

  if (v39)
  {
    id v32 = [MEMORY[0x263F351D0] nowPlayingiTunesStoreIdentifierKey];
    [v31 setObject:v39 forKey:v32];
  }
  if (v40)
  {
    uint64_t v33 = [MEMORY[0x263F351D0] nowPlayingiTunesSubscriptionIdentifierKey];
    [v31 setObject:v40 forKey:v33];
  }
  uint64_t v34 = (void *)[v31 copy];
  char v35 = [MEMORY[0x263F351B8] userContext];
  uint64_t v36 = [MEMORY[0x263F351D0] keyPathForNowPlayingDataDictionary];
  [v35 setObject:v34 forKeyedSubscript:v36];
}

+ (id)_eventWithBundleIdentifier:(id)a3 metadata:(id)a4
{
  id v5 = (void *)MEMORY[0x263F35088];
  v6 = (void *)MEMORY[0x263F35148];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 nowPlayingStream];
  v10 = [MEMORY[0x263EFF910] date];
  v11 = [MEMORY[0x263EFF910] distantFuture];
  v12 = [MEMORY[0x263F35058] withBundle:v8];

  uint64_t v13 = [v5 eventWithStream:v9 startDate:v10 endDate:v11 value:v12 metadata:v7];

  return v13;
}

+ (id)eventStream
{
  return @"NowPlaying";
}

+ (id)entitlements
{
  return 0;
}

- (_DKNowPlayingMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)_DKNowPlayingMonitor;
  v2 = [(_DKMonitor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(_DKMonitor *)v2 setEventComparator:&__block_literal_global_4];
    previousEvent = v3->_previousEvent;
    v3->_previousEvent = 0;

    previousBiomeEventMetadata = v3->_previousBiomeEventMetadata;
    v3->_previousBiomeEventMetadata = 0;

    v3->_bmSaveState = 0;
  }
  return v3;
}

- (void)dealloc
{
  [(_DKNowPlayingMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKNowPlayingMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)_eventFilterBlock
{
  return &__block_literal_global_27;
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

- (void)start
{
  v6.receiver = self;
  v6.super_class = (Class)_DKNowPlayingMonitor;
  if ([(_DKMonitor *)&v6 instantMonitorNeedsActivation])
  {
    objc_super v3 = [(id)objc_opt_class() _eventFilterBlock];
    [(_DKMonitor *)self setFilter:v3];

    v4 = [MEMORY[0x263EFA7B8] sharedAudioPresentationOutputContext];
    outputContext = self->_outputContext;
    self->_outputContext = v4;

    [(_DKNowPlayingMonitor *)self _registerForNowPlayingNotifications];
  }
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKNowPlayingMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKNowPlayingMonitor *)self deactivate];
  }
}

- (void)deactivate
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263EF9FA0];
  id v5 = [(_DKNowPlayingMonitor *)self outputContext];
  [v3 removeObserver:self name:v4 object:v5];

  objc_super v6 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v7 = *MEMORY[0x263EF9FA8];
  id v8 = [(_DKNowPlayingMonitor *)self outputContext];
  [v6 removeObserver:self name:v7 object:v8];

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x263F54B88], 0);
  v10 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v10, self, (CFNotificationName)*MEMORY[0x263F54B28], 0);
  MRMediaRemoteSetWantsNowPlayingNotifications();
}

- (void)_registerForNowPlayingNotifications
{
  objc_super v3 = [MEMORY[0x263F34FB8] contextChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_225002000, v3, OS_LOG_TYPE_INFO, "Registering for now playing events", v12, 2u);
  }

  MRMediaRemoteSetWantsNowPlayingNotifications();
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)_nowPlayingInfoInfoCallback, (CFStringRef)*MEMORY[0x263F54B88], 0, CFNotificationSuspensionBehaviorDrop);
  id v5 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_nowPlayingInfoStateCallback, (CFStringRef)*MEMORY[0x263F54B28], 0, CFNotificationSuspensionBehaviorDrop);
  objc_super v6 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v7 = *MEMORY[0x263EF9FA0];
  id v8 = [(_DKNowPlayingMonitor *)self outputContext];
  [v6 addObserver:self selector:sel_outputDevicesDidChange_ name:v7 object:v8];

  v9 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v10 = *MEMORY[0x263EF9FA8];
  v11 = [(_DKNowPlayingMonitor *)self outputContext];
  [v9 addObserver:self selector:sel_outputDevicesDidChange_ name:v10 object:v11];
}

- (void)outputDevicesDidChange:(id)a3
{
  uint64_t v4 = [(_DKMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47___DKNowPlayingMonitor_outputDevicesDidChange___block_invoke;
  block[3] = &unk_264714788;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)saveBMEventWithCurrent:(id)a3 outputDevices:(id)a4 artistStoreIdentifier:(id)a5 albumStoreIdentifier:(id)a6 excludeFromSuggestions:(BOOL)a7
{
  BOOL v88 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  p_previousEvent = &self->_previousEvent;
  v16 = [(_DKEvent *)self->_previousEvent metadata];
  v17 = [MEMORY[0x263F350F0] playing];
  v18 = [v16 objectForKeyedSubscript:v17];

  v19 = [v11 metadata];
  uint64_t v20 = [MEMORY[0x263F350F0] playing];
  uint64_t v91 = [v19 objectForKeyedSubscript:v20];

  v21 = (NSDictionary *)objc_opt_new();
  if (v13)
  {
    v22 = [v13 stringValue];
    [(NSDictionary *)v21 setObject:v22 forKeyedSubscript:@"iTunesArtistIdentifierKey"];
  }
  if (v14)
  {
    v23 = [v14 stringValue];
    [(NSDictionary *)v21 setObject:v23 forKeyedSubscript:@"iTunesAlbumIdentifierKey"];
  }
  v94 = v21;
  v24 = [MEMORY[0x263F548C8] localDeviceInfo];
  v93 = v24;
  if ([v24 hasAirPlayActive])
  {
    v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v24, "isAirPlayActive"));
    [(NSDictionary *)v21 setObject:v25 forKeyedSubscript:@"isAirPlayActive"];

    v24 = v93;
  }
  if ([v24 hasParentGroupContainsDiscoverableGroupLeader])
  {
    uint64_t v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v93, "parentGroupContainsDiscoverableGroupLeader"));
    [(NSDictionary *)v21 setObject:v26 forKeyedSubscript:@"parentGroupContainsDiscoverableGroupLeader"];
  }
  uint64_t v27 = MEMORY[0x22A629AA0]();
  v28 = (void *)v27;
  v89 = v18;
  id v90 = v11;
  v92 = &self->_previousEvent;
  if (*p_previousEvent)
  {
    v83 = (void *)v27;
    id v84 = v14;
    id v85 = v13;
    id v86 = v12;
    id v29 = objc_alloc(MEMORY[0x263EFF9A0]);
    v30 = [(_DKEvent *)*p_previousEvent metadata];
    v31 = (void *)[v29 initWithDictionary:v30];

    id v32 = [MEMORY[0x263F350F0] duration];
    [v31 removeObjectForKey:v32];

    id v33 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v34 = [v11 metadata];
    char v35 = v11;
    uint64_t v36 = (void *)[v33 initWithDictionary:v34];

    v37 = [MEMORY[0x263F350F0] duration];
    [v36 removeObjectForKey:v37];

    LODWORD(v37) = [v36 isEqualToDictionary:v31];
    v38 = [v35 metadata];
    id v39 = [MEMORY[0x263F350F0] duration];
    id v40 = [v38 objectForKeyedSubscript:v39];
    [v40 floatValue];
    float v42 = v41;
    [(_DKEvent *)self->_previousEvent metadata];
    v44 = v43 = self;
    id v45 = [MEMORY[0x263F350F0] duration];
    v46 = [v44 objectForKeyedSubscript:v45];
    [v46 floatValue];
    float v48 = v47;

    self = v43;
    BOOL v49 = [(NSDictionary *)v94 isEqualToDictionary:v43->_previousBiomeEventMetadata];
    int v50 = !v37 || vabds_f32(v42, v48) >= 0.2 || !v49;
    id v13 = v85;
    id v12 = v86;
    v28 = v83;
    id v14 = v84;
    char v51 = (void *)v91;

    v18 = v89;
    id v11 = v90;
  }
  else
  {
    int v50 = 1;
    char v51 = (void *)v91;
  }
  unsigned int bmSaveState = self->_bmSaveState;
  if (bmSaveState == 2)
  {
    if ([v51 longValue] == 1)
    {
      v55 = [MEMORY[0x263F34FB8] contextChannel];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v95 = 0;
        _os_log_impl(&dword_225002000, v55, OS_LOG_TYPE_INFO, "Biome state transition Stopped -> Playing", v95, 2u);
      }

      v54 = [MEMORY[0x263F34FB8] contextChannel];
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
        -[_DKNowPlayingMonitor saveBMEventWithCurrent:outputDevices:artistStoreIdentifier:albumStoreIdentifier:excludeFromSuggestions:](v11);
      }
      goto LABEL_29;
    }
  }
  else if (bmSaveState == 1)
  {
    if ([v18 longValue] == 1 && (objc_msgSend(v18, "isEqualToNumber:", v51) & 1) == 0)
    {
      v82 = [MEMORY[0x263F34FB8] contextChannel];
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v97 = 0;
        _os_log_impl(&dword_225002000, v82, OS_LOG_TYPE_INFO, "Biome state transition Playing -> Stopped", v97, 2u);
      }

      unsigned int v56 = 2;
      goto LABEL_30;
    }
    if (v50)
    {
      v62 = [MEMORY[0x263F34FB8] contextChannel];
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v96 = 0;
        _os_log_impl(&dword_225002000, v62, OS_LOG_TYPE_INFO, "Biome state transition Playing -> Playing", v96, 2u);
      }

      id v63 = [MEMORY[0x263F34FB8] contextChannel];
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
        -[_DKNowPlayingMonitor saveBMEventWithCurrent:outputDevices:artistStoreIdentifier:albumStoreIdentifier:excludeFromSuggestions:]((id *)v92);
      }

      v64 = [MEMORY[0x263F34FB8] contextChannel];
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
        -[_DKNowPlayingMonitor saveBMEventWithCurrent:outputDevices:artistStoreIdentifier:albumStoreIdentifier:excludeFromSuggestions:](v11);
      }

      v65 = [(_DKEvent *)*v92 metadata];
      v57 = (void *)[v65 mutableCopy];

      id v66 = [MEMORY[0x263F350F0] playing];
      [v57 setObject:&unk_26D86D8F8 forKeyedSubscript:v66];

      uint64_t v67 = objc_opt_class();
      v68 = objc_opt_class();
      v69 = [(_DKEvent *)*v92 value];
      v70 = [v69 stringValue];
      long long v71 = [v68 _eventWithBundleIdentifier:v70 metadata:v57];
      v87 = self;
      long long v72 = (void *)[(NSDictionary *)self->_previousBiomeEventMetadata copy];
      v58 = [v67 _bmEventWithDKEvent:v71 outputDevices:v12 biomeEventMetadata:v72 excludeFromSuggestions:v88];

      long long v73 = BiomeLibrary();
      long long v74 = [v73 Media];
      v75 = [v74 NowPlaying];
      uint64_t v76 = [v75 source];
      [v76 sendEvent:v58];

      v59 = [(id)objc_opt_class() _bmEventWithDKEvent:v11 outputDevices:v12 biomeEventMetadata:v94 excludeFromSuggestions:v88];
      v60 = BiomeLibrary();
      v61 = [v60 Media];
      v77 = [v61 NowPlaying];
      v78 = [v77 source];
      [v78 sendEvent:v59];

      self = v87;
      char v51 = (void *)v91;
      goto LABEL_41;
    }
  }
  else if (!bmSaveState && [v51 longValue] == 1)
  {
    uint64_t v53 = [MEMORY[0x263F34FB8] contextChannel];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225002000, v53, OS_LOG_TYPE_INFO, "Biome state transition Unknown -> Playing", buf, 2u);
    }

    v54 = [MEMORY[0x263F34FB8] contextChannel];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
      -[_DKNowPlayingMonitor saveBMEventWithCurrent:outputDevices:artistStoreIdentifier:albumStoreIdentifier:excludeFromSuggestions:](v11);
    }
LABEL_29:

    unsigned int v56 = 1;
LABEL_30:
    self->_unsigned int bmSaveState = v56;
    v57 = [(id)objc_opt_class() _bmEventWithDKEvent:v11 outputDevices:v12 biomeEventMetadata:v94 excludeFromSuggestions:v88];
    v58 = BiomeLibrary();
    v59 = [v58 Media];
    v60 = [v59 NowPlaying];
    v61 = [v60 source];
    [v61 sendEvent:v57];
LABEL_41:

    v18 = v89;
    id v11 = v90;
  }
  v79 = *v92;
  *v92 = (_DKEvent *)v11;
  id v80 = v11;

  previousBiomeEventMetadata = self->_previousBiomeEventMetadata;
  self->_previousBiomeEventMetadata = v94;
}

- (void)_nowPlayingInfoDidChange:(void *)a3 outputDevices:(id)a4
{
  id v5 = a4;
  objc_super v6 = dispatch_group_create();
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy__3;
  v66[4] = __Block_byref_object_dispose__3;
  id v67 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = __Block_byref_object_copy__3;
  v64[4] = __Block_byref_object_dispose__3;
  id v65 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = __Block_byref_object_copy__3;
  v62[4] = __Block_byref_object_dispose__3;
  id v63 = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  char v61 = 0;
  dispatch_group_enter(v6);
  uint64_t v7 = (void *)os_transaction_create();
  id v8 = [(_DKMonitor *)self queue];
  uint64_t v48 = MEMORY[0x263EF8330];
  uint64_t v49 = 3221225472;
  int v50 = __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke;
  char v51 = &unk_264714C48;
  unsigned int v56 = v66;
  BOOL v52 = self;
  id v9 = v5;
  id v53 = v9;
  v57 = v64;
  v58 = v62;
  v59 = v60;
  uint64_t v10 = v6;
  v54 = v10;
  id v11 = v7;
  id v55 = v11;
  MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork();

  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__3;
  v46[4] = __Block_byref_object_dispose__3;
  id v47 = 0;
  dispatch_group_enter(v10);
  id v12 = [(_DKMonitor *)self queue];
  uint64_t v39 = MEMORY[0x263EF8330];
  uint64_t v40 = 3221225472;
  float v41 = __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_2;
  float v42 = &unk_264714C70;
  id v45 = v46;
  id v13 = v10;
  v43 = v13;
  id v14 = v11;
  id v44 = v14;
  MRMediaRemoteGetNowPlayingClientForOrigin();

  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  int v38 = 0;
  dispatch_group_enter(v13);
  id v15 = [(_DKMonitor *)self queue];
  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 3221225472;
  id v32 = __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_63;
  id v33 = &unk_264714C98;
  uint64_t v36 = v37;
  v16 = v13;
  uint64_t v34 = v16;
  id v35 = v14;
  MRMediaRemoteGetNowPlayingApplicationPlaybackState();

  v17 = [(_DKMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_2_65;
  block[3] = &unk_264714CC0;
  v25 = v66;
  uint64_t v26 = v60;
  id v21 = v9;
  v22 = self;
  uint64_t v27 = v37;
  v28 = v64;
  id v29 = v62;
  id v23 = v35;
  v24 = v46;
  id v18 = v35;
  id v19 = v9;
  dispatch_group_notify(v16, v17, block);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v46, 8);

  _Block_object_dispose(v60, 8);
  _Block_object_dispose(v62, 8);

  _Block_object_dispose(v64, 8);
  _Block_object_dispose(v66, 8);
}

- (void)_stripMetadata:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x263F350F0];
  id v4 = a3;
  id v5 = [v3 album];
  [v4 removeObjectForKey:v5];

  objc_super v6 = [MEMORY[0x263F350F0] artist];
  [v4 removeObjectForKey:v6];

  uint64_t v7 = [MEMORY[0x263F350F0] duration];
  [v4 removeObjectForKey:v7];

  id v8 = [MEMORY[0x263F350F0] elapsed];
  [v4 removeObjectForKey:v8];

  id v9 = [MEMORY[0x263F350F0] genre];
  [v4 removeObjectForKey:v9];

  uint64_t v10 = [MEMORY[0x263F350F0] iTunesStoreIdentifier];
  [v4 removeObjectForKey:v10];

  id v11 = [MEMORY[0x263F350F0] iTunesSubscriptionIdentifier];
  [v4 removeObjectForKey:v11];

  id v12 = [MEMORY[0x263F350F0] title];
  [v4 removeObjectForKey:v12];
}

+ (id)_bmEventWithDKEvent:(id)a3 outputDevices:(id)a4 biomeEventMetadata:(id)a5 excludeFromSuggestions:(BOOL)a6
{
  uint64_t v117 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id obj = a4;
  id v10 = a5;
  id v11 = [v9 metadata];
  id v12 = [MEMORY[0x263F350F0] playing];
  id v13 = [v11 objectForKeyedSubscript:v12];
  uint64_t v14 = [v13 unsignedIntValue];

  id v93 = objc_alloc(MEMORY[0x263F2A2C0]);
  if (a6)
  {
    uint64_t v15 = 0;
  }
  else
  {
    v82 = [v9 source];
    uint64_t v15 = [v82 itemID];
  }
  uint64_t v16 = [v9 startDate];
  if (v14 >= 6)
  {
    v17 = [MEMORY[0x263F34FB8] contextChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[_DKNowPlayingMonitor _bmEventWithDKEvent:outputDevices:biomeEventMetadata:excludeFromSuggestions:](v14, v17);
    }

    uint64_t v14 = 0;
  }
  unsigned int v94 = v14;
  if (a6)
  {
    uint64_t v18 = 0;
    v98 = 0;
    uint64_t v100 = 0;
    uint64_t v19 = 0;
    v106 = 0;
    uint64_t v20 = 0;
  }
  else
  {
    id v21 = [v9 metadata];
    uint64_t v80 = [MEMORY[0x263F350F0] album];
    v81 = v21;
    uint64_t v100 = objc_msgSend(v21, "objectForKeyedSubscript:");
    v22 = [v9 metadata];
    uint64_t v14 = [MEMORY[0x263F350F0] artist];
    v79 = v22;
    uint64_t v19 = [v22 objectForKeyedSubscript:v14];
    id v23 = [v9 metadata];
    v77 = [MEMORY[0x263F350F0] duration];
    v78 = v23;
    v98 = objc_msgSend(v23, "objectForKeyedSubscript:");
    v24 = [v9 metadata];
    v75 = [MEMORY[0x263F350F0] genre];
    uint64_t v76 = v24;
    v106 = objc_msgSend(v24, "objectForKeyedSubscript:");
    v25 = [v9 metadata];
    long long v73 = [MEMORY[0x263F350F0] title];
    long long v74 = v25;
    uint64_t v18 = objc_msgSend(v25, "objectForKeyedSubscript:");
    uint64_t v26 = [v9 metadata];
    long long v71 = [MEMORY[0x263F350F0] elapsed];
    long long v72 = v26;
    uint64_t v20 = objc_msgSend(v26, "objectForKeyedSubscript:");
  }
  v103 = v10;
  uint64_t v27 = [v9 metadata];
  [MEMORY[0x263F350F0] mediaType];
  v91 = id v90 = v27;
  objc_msgSend(v27, "objectForKeyedSubscript:");
  v101 = (void *)v15;
  v96 = (void *)v16;
  v97 = (void *)v20;
  BOOL v102 = a6;
  v99 = (void *)v19;
  v83 = (void *)v14;
  v89 = v92 = (void *)v18;
  if (a6)
  {
    v105 = 0;
    uint64_t v28 = 0;
  }
  else
  {
    id v29 = [v9 metadata];
    v69 = [MEMORY[0x263F350F0] iTunesStoreIdentifier];
    v70 = v29;
    v68 = objc_msgSend(v29, "objectForKeyedSubscript:");
    v105 = [v68 stringValue];
    uint64_t v30 = [v9 metadata];
    id v66 = [MEMORY[0x263F350F0] iTunesSubscriptionIdentifier];
    id v67 = v30;
    id v65 = objc_msgSend(v30, "objectForKeyedSubscript:");
    uint64_t v28 = [v65 stringValue];
  }
  BOOL v88 = (void *)v28;
  v104 = v9;
  uint64_t v31 = [v9 metadata];
  id v86 = [MEMORY[0x263F350F0] isAirPlayVideo];
  v87 = v31;
  id v85 = objc_msgSend(v31, "objectForKeyedSubscript:");
  id v32 = obj;
  id v33 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v32, "count"));
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id obja = v32;
  uint64_t v34 = [obja countByEnumeratingWithState:&v110 objects:v114 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v111;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v111 != v36) {
          objc_enumerationMutation(obja);
        }
        int v38 = *(void **)(*((void *)&v110 + 1) + 8 * v37);
        id v39 = objc_alloc(MEMORY[0x263F2A2C8]);
        unint64_t v40 = [v38 deviceType];
        unint64_t v41 = v40;
        if (v40 >= 5)
        {
          v43 = [MEMORY[0x263F34FB8] contextChannel];
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v116 = v41;
            _os_log_fault_impl(&dword_225002000, v43, OS_LOG_TYPE_FAULT, "BMMediaNowPlayingOutputDeviceType: Unrecognized value for outputDevice: %ld", buf, 0xCu);
          }

          uint64_t v42 = 0;
        }
        else
        {
          uint64_t v42 = (v40 + 1);
        }
        unint64_t v44 = [v38 deviceSubType];
        unint64_t v45 = v44;
        if (v44 >= 0x14)
        {
          id v47 = [MEMORY[0x263F34FB8] contextChannel];
          if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v116 = v45;
            _os_log_fault_impl(&dword_225002000, v47, OS_LOG_TYPE_FAULT, "BMMediaNowPlayingOutputDeviceSubType: Unrecognized value for outputSubtype: %ld", buf, 0xCu);
          }

          uint64_t v46 = 0;
        }
        else
        {
          uint64_t v46 = (v44 + 1);
        }
        uint64_t v48 = [v38 deviceID];
        uint64_t v49 = (void *)[v39 initWithType:v42 subType:v46 outputDeviceID:v48];
        [v33 addObject:v49];

        ++v37;
      }
      while (v35 != v37);
      uint64_t v35 = [obja countByEnumeratingWithState:&v110 objects:v114 count:16];
    }
    while (v35);
  }

  v107 = [v104 value];
  id v84 = [v107 stringValue];
  if (v102)
  {
    int v50 = 0;
    char v51 = 0;
    BOOL v52 = v103;
  }
  else
  {
    BOOL v52 = v103;
    int v50 = [v103 objectForKeyedSubscript:@"iTunesArtistIdentifierKey"];
    char v51 = [v103 objectForKeyedSubscript:@"iTunesAlbumIdentifierKey"];
  }
  id v53 = v85;
  v54 = [v52 objectForKeyedSubscript:@"isAirPlayActive"];
  id v55 = [v52 objectForKeyedSubscript:@"parentGroupContainsDiscoverableGroupLeader"];
  unsigned int v56 = v89;
  v57 = v96;
  id v95 = (id)objc_msgSend(v93, "initWithUniqueID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:isAirPlayVideo:outputDevices:bundleID:iTunesArtistIdentifier:iTunesAlbumIdentifier:groupIdentifier:isRemoteControl:itemMediaType:itemMediaSubtype:isAirPlayActive:parentGroupContainsDiscoverableGroupLeader:", v101, v96, v94, v100, v99, v98, v106, v92, v97, v89, v105, v88, v85, v33,
              v84,
              v50,
              v51,
              0,
              0,
              0,
              v54,
              v55);

  if (v102)
  {
    v58 = v84;
    v59 = v107;
    char v61 = v86;
    v60 = v87;
    v62 = v96;
    id v63 = v90;
    v57 = v91;
  }
  else
  {

    unsigned int v56 = v81;
    v62 = v82;
    char v61 = (void *)v100;
    id v63 = v101;
    id v53 = v79;
    v60 = (void *)v80;
    v59 = v99;
    id v33 = v83;
    v58 = v78;
  }

  return v95;
}

- (unsigned)lastPlaybackState
{
  return self->_lastPlaybackState;
}

- (void)setLastPlaybackState:(unsigned int)a3
{
  self->_lastPlaybackState = a3;
}

- (AVOutputContext)outputContext
{
  return self->_outputContext;
}

- (void)setOutputContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputContext, 0);
  objc_storeStrong((id *)&self->_previousBiomeEventMetadata, 0);
  objc_storeStrong((id *)&self->_previousEvent, 0);
}

- (void)saveBMEventWithCurrent:(void *)a1 outputDevices:artistStoreIdentifier:albumStoreIdentifier:excludeFromSuggestions:.cold.1(void *a1)
{
  v1 = [a1 metadata];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_225002000, v2, v3, "Biome new metadata:%@", v4, v5, v6, v7, v8);
}

- (void)saveBMEventWithCurrent:(id *)a1 outputDevices:artistStoreIdentifier:albumStoreIdentifier:excludeFromSuggestions:.cold.3(id *a1)
{
  v1 = [*a1 metadata];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_225002000, v2, v3, "Biome old metadata:%@", v4, v5, v6, v7, v8);
}

+ (void)_bmEventWithDKEvent:(uint64_t)a1 outputDevices:(NSObject *)a2 biomeEventMetadata:excludeFromSuggestions:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSNumber numberWithUnsignedInt:a1];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_225002000, a2, OS_LOG_TYPE_ERROR, "BMMediaNowPlaying: unable to convert MRPlaybackState enum value: %@", v4, 0xCu);
}

@end