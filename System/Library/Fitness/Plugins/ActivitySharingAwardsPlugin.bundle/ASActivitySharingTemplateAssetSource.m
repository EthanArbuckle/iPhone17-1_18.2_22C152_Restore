@interface ASActivitySharingTemplateAssetSource
- (ACHTemplateAssetSourceDelegate)assetSourceDelegate;
- (ASActivitySharingTemplateAssetSource)initWithHealthStore:(id)a3;
- (NSString)identifier;
- (id)_competitionForVictoryTemplate:(id)a3;
- (id)_friendForVictoryTemplate:(id)a3;
- (id)_queue_friendWithUUID:(id)a3;
- (id)customPlaceholderValuesForTemplate:(id)a3 error:(id *)a4;
- (id)friendWithUUID:(id)a3;
- (id)localizationBundleURLForTemplate:(id)a3;
- (id)propertyListBundleURLForTemplate:(id)a3;
- (id)resourceBundleURLForTemplate:(id)a3;
- (id)stickerBundleURLForTemplate:(id)a3;
- (void)_queue_updateWithFriends:(id)a3;
- (void)_startFriendsQuery;
- (void)_updateWithFriends:(id)a3;
- (void)setAssetSourceDelegate:(id)a3;
@end

@implementation ASActivitySharingTemplateAssetSource

- (ASActivitySharingTemplateAssetSource)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASActivitySharingTemplateAssetSource;
  v6 = [(ASActivitySharingTemplateAssetSource *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    uint64_t v8 = HKCreateSerialDispatchQueue();
    friendListQueue = v7->_friendListQueue;
    v7->_friendListQueue = (OS_dispatch_queue *)v8;

    v10 = (ASActivitySharingClient *)objc_alloc_init(MEMORY[0x263F24010]);
    activitySharingClient = v7->_activitySharingClient;
    v7->_activitySharingClient = v10;

    v12 = v7->_activitySharingClient;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_223314F78;
    v14[3] = &unk_2646A8A98;
    v15 = v7;
    [(ASActivitySharingClient *)v12 activateWithCompletionHandler:v14];
  }
  return v7;
}

- (NSString)identifier
{
  return (NSString *)(id)*MEMORY[0x263F23CA0];
}

- (id)localizationBundleURLForTemplate:(id)a3
{
  v3 = [a3 uniqueName];
  v4 = ASAchievementLocalizationPathForTemplate();

  return v4;
}

- (id)propertyListBundleURLForTemplate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueName];
  int v6 = ASIsCompetitionVictoryTemplate();

  if (v6)
  {
    v7 = [(ASActivitySharingTemplateAssetSource *)self _competitionForVictoryTemplate:v4];
    uint64_t v8 = v7;
    if (v7)
    {
      [v7 victoryBadgeStyle];
      v9 = ASCompetitionVictoryPropertyListPathForStyle();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = ASCompetitionParticipationResourcePath();
  }

  return v9;
}

- (id)resourceBundleURLForTemplate:(id)a3
{
  id v4 = a3;
  ASLoggingInitialize();
  id v5 = (void *)*MEMORY[0x263F23A98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_DEBUG)) {
    sub_223315AEC(v5, v4);
  }
  int v6 = [v4 uniqueName];
  int v7 = ASIsCompetitionVictoryTemplate();

  if (v7)
  {
    uint64_t v8 = [(ASActivitySharingTemplateAssetSource *)self _competitionForVictoryTemplate:v4];
    v9 = v8;
    if (v8)
    {
      [v8 victoryBadgeStyle];
      v10 = ASCompetitionVictoryResourcePathForStyle();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = ASCompetitionParticipationResourcePath();
  }

  return v10;
}

- (id)stickerBundleURLForTemplate:(id)a3
{
  return 0;
}

- (id)customPlaceholderValuesForTemplate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = [MEMORY[0x263EFF9A0] dictionary];
  int v7 = [v5 uniqueName];
  int v8 = ASIsCompetitionVictoryTemplate();

  if (v8)
  {
    v9 = [(ASActivitySharingTemplateAssetSource *)self _friendForVictoryTemplate:v5];
    v10 = v9;
    if (v9)
    {
      v11 = [v9 displayName];
      [v6 setObject:v11 forKeyedSubscript:*MEMORY[0x263F23C20]];

      v12 = [v10 currentCompetition];

      if (v12)
      {
        v13 = [v10 currentCompetition];
        v14 = [v13 lastDayOfCompetition];
        v15 = FILocalizedDayName();
        [v6 setObject:v15 forKeyedSubscript:*MEMORY[0x263F23C18]];
      }
    }
  }

  return v6;
}

- (void)_startFriendsQuery
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F24018]);
  activitySharingClient = self->_activitySharingClient;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_223315398;
  v7[3] = &unk_2646A8AC0;
  objc_copyWeak(&v8, &location);
  id v5 = (ASActivitySharingFriendQuery *)[v3 initWithActivitySharingClient:activitySharingClient updateHandler:v7];
  friendQuery = self->_friendQuery;
  self->_friendQuery = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_updateWithFriends:(id)a3
{
  id v4 = a3;
  friendListQueue = self->_friendListQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2233154C0;
  v7[3] = &unk_2646A8AE8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(friendListQueue, v7);
}

- (void)_queue_updateWithFriends:(id)a3
{
  friendListQueue = self->_friendListQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(friendListQueue);
  id v6 = (NSSet *)[v5 copy];

  allFriends = self->_allFriends;
  self->_allFriends = v6;

  ASLoggingInitialize();
  id v8 = *MEMORY[0x263F23A98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_223313000, v8, OS_LOG_TYPE_DEFAULT, "Friends updated, requesting asset source update", v10, 2u);
  }
  v9 = [(ASActivitySharingTemplateAssetSource *)self assetSourceDelegate];
  [v9 templateAssetSourceDidUpdateAssets:self];
}

- (id)friendWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_2233156A0;
  objc_super v16 = sub_2233156B0;
  id v17 = 0;
  friendListQueue = self->_friendListQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2233156B8;
  block[3] = &unk_2646A8B10;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(friendListQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_queue_friendWithUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_friendListQueue);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_allFriends;
  id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "contact", (void)v14);
        v11 = [v10 UUID];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_competitionForVictoryTemplate:(id)a3
{
  id v3 = [(ASActivitySharingTemplateAssetSource *)self _friendForVictoryTemplate:a3];
  id v4 = [v3 currentOrMostRecentCompetition];
  if (!v4)
  {
    ASLoggingInitialize();
    id v5 = (void *)*MEMORY[0x263F23A98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_ERROR)) {
      sub_223315BF8(v5, v3);
    }
  }

  return v4;
}

- (id)_friendForVictoryTemplate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F08C38]);
  id v6 = [v4 predicate];
  uint64_t v7 = (void *)[v5 initWithUUIDString:v6];

  if (v7)
  {
    id v8 = [(ASActivitySharingTemplateAssetSource *)self friendWithUUID:v7];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_ERROR)) {
        sub_223315D18();
      }
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_ERROR)) {
      sub_223315CB0();
    }
    v9 = 0;
  }

  return v9;
}

- (ACHTemplateAssetSourceDelegate)assetSourceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->assetSourceDelegate);

  return (ACHTemplateAssetSourceDelegate *)WeakRetained;
}

- (void)setAssetSourceDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->assetSourceDelegate);
  objc_storeStrong((id *)&self->_friendQuery, 0);
  objc_storeStrong((id *)&self->_activitySharingClient, 0);
  objc_storeStrong((id *)&self->_friendListQueue, 0);
  objc_storeStrong((id *)&self->_allFriends, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end