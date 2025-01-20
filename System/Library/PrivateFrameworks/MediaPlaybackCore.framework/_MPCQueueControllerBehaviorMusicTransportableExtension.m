@interface _MPCQueueControllerBehaviorMusicTransportableExtension
- (BOOL)isSupportedSessionType:(id)a3 reason:(id *)a4;
- (MPCQueueControllerSessionTypesInvalidatable)sessionTypesInvalidatable;
- (_MPCQueueControllerBehaviorMusicTransportableExtension)initWithInvalidatable:(id)a3;
- (id)allKnownSessionTypes;
- (id)infoForSessionType:(id)a3;
- (void)_updateAllKnownSessionInfos;
- (void)accountManager:(id)a3 didChangeAccounts:(id)a4;
@end

@implementation _MPCQueueControllerBehaviorMusicTransportableExtension

- (id)allKnownSessionTypes
{
  if (![(NSArray *)self->_accounts count])
  {
    v3 = +[MPCPlaybackAccountManager sharedManager];
    v4 = [v3 accounts];

    if ([v4 count])
    {
      v5 = (NSArray *)[v4 copy];
      accounts = self->_accounts;
      self->_accounts = v5;

      [(_MPCQueueControllerBehaviorMusicTransportableExtension *)self _updateAllKnownSessionInfos];
    }
  }
  allKnownSessionInfos = self->_allKnownSessionInfos;

  return (id)[(NSArray *)allKnownSessionInfos msv_map:&__block_literal_global_1146];
}

- (BOOL)isSupportedSessionType:(id)a3 reason:(id *)a4
{
  v5 = [(NSDictionary *)self->_sessionInfoMap objectForKeyedSubscript:a3];
  v6 = v5;
  if (v5)
  {
    char v7 = [v5 supported];
    if (a4 && (v7 & 1) == 0)
    {
      *a4 = [v6 supportedReason];
    }
    char v8 = [v6 supported];
  }
  else
  {
    char v8 = 0;
    if (a4) {
      *a4 = @"unknown sessionType [Music]";
    }
  }

  return v8;
}

- (void)accountManager:(id)a3 didChangeAccounts:(id)a4
{
  id v8 = a4;
  if (!-[NSArray isEqualToArray:](self->_accounts, "isEqualToArray:"))
  {
    v5 = (NSArray *)[v8 copy];
    accounts = self->_accounts;
    self->_accounts = v5;

    [(_MPCQueueControllerBehaviorMusicTransportableExtension *)self _updateAllKnownSessionInfos];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionTypesInvalidatable);
    [WeakRetained invalidateSessionTypesWithReason:@"accounts changed"];
  }
}

- (void)_updateAllKnownSessionInfos
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  v48 = [MEMORY[0x263EFF980] array];
  v47 = [MEMORY[0x263EFF9A0] dictionary];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v43 = self;
  obj = self->_accounts;
  uint64_t v49 = [(NSArray *)obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v49)
  {
    uint64_t v45 = *(void *)v52;
    v46 = 0;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v52 != v45) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v51 + 1) + 8 * v3);
        if ([v4 isActiveAccount])
        {
          id v5 = v4;

          v46 = v5;
        }
        uint64_t v50 = v3;
        if ([v4 hasCatalogPlaybackCapability])
        {
          uint64_t v6 = [v4 hasCloudLibraryEnabled];
          if (v6) {
            char v7 = 0;
          }
          else {
            char v7 = @"library sync is OFF";
          }
        }
        else
        {
          uint64_t v6 = 0;
          char v7 = @"non-subscriber";
        }
        id v8 = [v4 shortHashedDSID];
        v9 = _MPCSessionTypeIdentifierFromHashedDSID(@"com.apple.MediaPlaybackCore.playbackSession-v4.5.opack", v8);
        v10 = +[_MPCQCBMSessionTypeInfo infoWithIdentifier:v9 account:v4 supported:v6 supportedReason:v7 exportable:1 exportableReason:0];

        [v48 addObject:v10];
        v11 = [v10 identifier];
        [v47 setObject:v10 forKeyedSubscript:v11];

        v12 = [v4 shortHashedDSID];
        v13 = _MPCSessionTypeIdentifierFromHashedDSID(@"com.apple.MediaPlaybackCore.playbackSession-v4.opack", v12);
        v14 = +[_MPCQCBMSessionTypeInfo infoWithIdentifier:v13 account:v4 supported:v6 supportedReason:v7 exportable:0 exportableReason:@"cannot export old version"];

        [v48 addObject:v14];
        v15 = [v14 identifier];
        [v47 setObject:v14 forKeyedSubscript:v15];

        v16 = [v4 shortHashedDSID];
        v17 = _MPCSessionTypeIdentifierFromHashedDSID(@"com.apple.MediaPlaybackCore.playbackSession-v3.opack", v16);
        v18 = +[_MPCQCBMSessionTypeInfo infoWithIdentifier:v17 account:v4 supported:v6 supportedReason:v7 exportable:0 exportableReason:@"cannot export old version"];

        [v48 addObject:v18];
        v19 = [v18 identifier];
        [v47 setObject:v18 forKeyedSubscript:v19];

        ++v3;
      }
      while (v49 != v50 + 1);
      uint64_t v49 = [(NSArray *)obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v49);
  }
  else
  {
    v46 = 0;
  }

  v20 = [v46 storeFrontIdentifier];
  v21 = [v20 componentsSeparatedByString:@"-"];
  uint64_t v22 = [v21 firstObject];
  v23 = (void *)v22;
  v24 = &stru_26CBCA930;
  if (v22) {
    v24 = (__CFString *)v22;
  }
  v25 = v24;

  if (MSVDeviceSupportsDelegatedIdentities())
  {
    uint64_t v26 = 0;
    v27 = @"device supports delegation";
  }
  else if (v46)
  {
    if ([(__CFString *)v25 length])
    {
      uint64_t v26 = [v46 hasCatalogPlaybackCapability];
      if (v26) {
        v27 = 0;
      }
      else {
        v27 = @"non-subscriber active account";
      }
    }
    else
    {
      v28 = NSString;
      v29 = [v46 storeFrontIdentifier];
      v27 = [v28 stringWithFormat:@"unknown storefront: %@", v29];

      uint64_t v26 = 0;
    }
  }
  else
  {
    uint64_t v26 = 0;
    v27 = @"no active account";
  }
  v30 = _MPCSessionTypeIdentifierForStorefront(@"com.apple.MediaPlaybackCore.playbackSession-v4.5.opack", v25);
  v31 = +[_MPCQCBMSessionTypeInfo infoWithIdentifier:v30 account:v46 supported:v26 supportedReason:v27 exportable:1 exportableReason:0];

  [v48 addObject:v31];
  v32 = [v31 identifier];
  [v47 setObject:v31 forKeyedSubscript:v32];

  v33 = _MPCSessionTypeIdentifierForStorefront(@"com.apple.MediaPlaybackCore.playbackSession-v4.opack", v25);
  v34 = +[_MPCQCBMSessionTypeInfo infoWithIdentifier:v33 account:v46 supported:v26 supportedReason:v27 exportable:0 exportableReason:@"cannot export old version"];

  [v48 addObject:v34];
  v35 = [v34 identifier];
  [v47 setObject:v34 forKeyedSubscript:v35];

  v36 = _MPCSessionTypeIdentifierForStorefront(@"com.apple.MediaPlaybackCore.playbackSession-v3.opack", v25);
  v37 = +[_MPCQCBMSessionTypeInfo infoWithIdentifier:v36 account:v46 supported:v26 supportedReason:v27 exportable:0 exportableReason:@"cannot export old version"];

  [v48 addObject:v37];
  v38 = [v37 identifier];
  [v47 setObject:v37 forKeyedSubscript:v38];

  uint64_t v39 = [v48 copy];
  allKnownSessionInfos = v43->_allKnownSessionInfos;
  v43->_allKnownSessionInfos = (NSArray *)v39;

  uint64_t v41 = [v47 copy];
  sessionInfoMap = v43->_sessionInfoMap;
  v43->_sessionInfoMap = (NSDictionary *)v41;
}

- (id)infoForSessionType:(id)a3
{
  return [(NSDictionary *)self->_sessionInfoMap objectForKeyedSubscript:a3];
}

- (_MPCQueueControllerBehaviorMusicTransportableExtension)initWithInvalidatable:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_MPCQueueControllerBehaviorMusicTransportableExtension;
  id v5 = [(_MPCQueueControllerBehaviorMusicTransportableExtension *)&v14 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sessionTypesInvalidatable, v4);
    char v7 = +[MPCPlaybackAccountManager sharedManager];
    [v7 registerObserver:v6];
    allKnownSessionInfos = v6->_allKnownSessionInfos;
    v6->_allKnownSessionInfos = (NSArray *)MEMORY[0x263EFFA68];

    sessionInfoMap = v6->_sessionInfoMap;
    v6->_sessionInfoMap = (NSDictionary *)MEMORY[0x263EFFA78];

    if ([v7 hasLoadedInitialAccounts])
    {
      v10 = [v7 accounts];
      uint64_t v11 = [v10 copy];
      accounts = v6->_accounts;
      v6->_accounts = (NSArray *)v11;

      [(_MPCQueueControllerBehaviorMusicTransportableExtension *)v6 _updateAllKnownSessionInfos];
    }
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionTypesInvalidatable);
  objc_storeStrong((id *)&self->_sessionInfoMap, 0);
  objc_storeStrong((id *)&self->_allKnownSessionInfos, 0);

  objc_storeStrong((id *)&self->_accounts, 0);
}

- (MPCQueueControllerSessionTypesInvalidatable)sessionTypesInvalidatable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionTypesInvalidatable);

  return (MPCQueueControllerSessionTypesInvalidatable *)WeakRetained;
}

@end