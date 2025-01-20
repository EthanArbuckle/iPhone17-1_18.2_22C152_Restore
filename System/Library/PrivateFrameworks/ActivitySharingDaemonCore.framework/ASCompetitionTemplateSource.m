@interface ASCompetitionTemplateSource
- (ACHTemplateSourceDelegate)delegate;
- (ASCompetitionTemplateSourceDataProvider)dataProvider;
- (BOOL)sourceShouldRunForDate:(id)a3;
- (NSString)identifier;
- (id)_competitionForVictoryTemplate:(id)a3;
- (id)_friendForVictoryTemplate:(id)a3;
- (id)customPlaceholderValuesForTemplate:(id)a3;
- (id)localizationBundleURLForTemplate:(id)a3;
- (id)propertyListBundleURLForTemplate:(id)a3;
- (id)resourceBundleURLForTemplate:(id)a3;
- (id)stickerBundleURLForTemplate:(id)a3;
- (id)unusedTemplateNamesForFriendWithUUID:(id)a3;
- (int64_t)runCadence;
- (void)setDataProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)templatesForDate:(id)a3 completion:(id)a4;
@end

@implementation ASCompetitionTemplateSource

- (NSString)identifier
{
  return (NSString *)(id)*MEMORY[0x263F23CA8];
}

- (int64_t)runCadence
{
  return 1;
}

- (BOOL)sourceShouldRunForDate:(id)a3
{
  return 1;
}

- (void)templatesForDate:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  ASLoggingInitialize();
  v8 = (os_log_t *)MEMORY[0x263F23A98];
  v9 = *MEMORY[0x263F23A98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "CompetitionsTemplateSource collecting templates", buf, 2u);
  }
  *(void *)buf = 0;
  v30 = buf;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__4;
  v33 = __Block_byref_object_dispose__4;
  id v34 = [MEMORY[0x263EFFA08] set];
  ASLoggingInitialize();
  v10 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v35 = 0;
    _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "Adding participation template", v35, 2u);
  }
  v11 = ASCompetitionParticipationTemplate();
  uint64_t v12 = [*((id *)v30 + 5) setByAddingObject:v11];
  v13 = (void *)*((void *)v30 + 5);
  *((void *)v30 + 5) = v12;

  ASLoggingInitialize();
  v14 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG)) {
    -[ASCompetitionTemplateSource templatesForDate:completion:](v14);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
  v16 = [WeakRetained friends];
  v17 = objc_msgSend(v16, "hk_filter:", &__block_literal_global_5);

  v18 = [v17 allObjects];
  v19 = ASFriendsSortedByEarliestCompetitionVictoryOrPotentialVictoryDate();

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __59__ASCompetitionTemplateSource_templatesForDate_completion___block_invoke_278;
  v28[3] = &unk_265216788;
  v28[4] = buf;
  [v19 enumerateObjectsUsingBlock:v28];
  if ([v19 count])
  {
    v20 = (void *)[objc_alloc(MEMORY[0x263F2A780]) initWithIdentifier:@"com.apple.ActivityMonitorApp.activity-competition-participated" bundleID:@"com.apple.ActivityMonitorApp" context:0];
    v21 = [MEMORY[0x263F2A9B8] discoverabilitySignal];
    v22 = [v21 source];
    [v22 sendEvent:v20];
  }
  ASLoggingInitialize();
  v23 = *v8;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*((id *)v30 + 5), "count"));
    *(_DWORD *)v35 = 138412290;
    v36 = v24;
    _os_log_impl(&dword_2474C9000, v23, OS_LOG_TYPE_DEFAULT, "Returning templates: %@", v35, 0xCu);
  }
  (*((void (**)(id, void, void, void))v7 + 2))(v7, *((void *)v30 + 5), 0, 0);
  if ([*((id *)v30 + 5) count])
  {
    ASLoggingInitialize();
    v25 = *v8;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*((id *)v30 + 5), "count"));
      *(_DWORD *)v35 = 138412290;
      v36 = v26;
      _os_log_impl(&dword_2474C9000, v25, OS_LOG_TYPE_DEFAULT, "Notifying delegate that we updated assets templates: %@", v35, 0xCu);
    }
    v27 = [(ASCompetitionTemplateSource *)self delegate];
    [v27 templateSourceDidUpdateAssets:self];
  }
  _Block_object_dispose(buf, 8);
}

uint64_t __59__ASCompetitionTemplateSource_templatesForDate_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = a2;
  LODWORD(v3) = [v2 isCompetitionActive];
  uint64_t v4 = [v2 numberOfCompetitionWinsByMe];
  ASLoggingInitialize();
  v5 = (void *)*MEMORY[0x263F23A98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_DEBUG))
  {
    id v7 = v5;
    v8 = [v2 UUID];
    int v9 = 138412802;
    v10 = v8;
    __int16 v11 = 1024;
    int v12 = v3;
    __int16 v13 = 1024;
    BOOL v14 = v4 != 0;
    _os_log_debug_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEBUG, "For friend %@ isCompetitionActive: %d hasCompetitionWonByMe %d", (uint8_t *)&v9, 0x18u);
  }
  if (v4) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = v3;
  }

  return v3;
}

void __59__ASCompetitionTemplateSource_templatesForDate_completion___block_invoke_278(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  ASLoggingInitialize();
  uint64_t v4 = (void *)*MEMORY[0x263F23A98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    id v6 = [v3 UUID];
    id v7 = [v3 displayName];
    int v13 = 138543618;
    BOOL v14 = v6;
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Adding victory template for friend: %{public}@ - %@", (uint8_t *)&v13, 0x16u);
  }
  v8 = [v3 UUID];
  int v9 = ASCompetitionVictoryTemplateForFriend();

  uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setByAddingObject:v9];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  int v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (id)localizationBundleURLForTemplate:(id)a3
{
  id v3 = [a3 uniqueName];
  uint64_t v4 = ASAchievementLocalizationPathForTemplate();

  return v4;
}

- (id)resourceBundleURLForTemplate:(id)a3
{
  id v4 = a3;
  ASLoggingInitialize();
  v5 = (void *)*MEMORY[0x263F23A98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_DEBUG)) {
    -[ASCompetitionTemplateSource resourceBundleURLForTemplate:](v5, v4);
  }
  id v6 = [v4 uniqueName];
  int v7 = ASIsCompetitionVictoryTemplate();

  if (v7)
  {
    v8 = [(ASCompetitionTemplateSource *)self _competitionForVictoryTemplate:v4];
    int v9 = v8;
    if (v8)
    {
      [v8 victoryBadgeStyle];
      uint64_t v10 = ASCompetitionVictoryResourcePathForStyle();
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = ASCompetitionParticipationResourcePath();
  }

  return v10;
}

- (id)propertyListBundleURLForTemplate:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueName];
  int v6 = ASIsCompetitionVictoryTemplate();

  if (v6)
  {
    int v7 = [(ASCompetitionTemplateSource *)self _competitionForVictoryTemplate:v4];
    v8 = v7;
    if (v7)
    {
      [v7 victoryBadgeStyle];
      int v9 = ASCompetitionVictoryPropertyListPathForStyle();
    }
    else
    {
      int v9 = 0;
    }
  }
  else
  {
    int v9 = ASCompetitionParticipationResourcePath();
  }

  return v9;
}

- (id)stickerBundleURLForTemplate:(id)a3
{
  return 0;
}

- (id)customPlaceholderValuesForTemplate:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  int v6 = [v4 uniqueName];
  int v7 = ASIsCompetitionVictoryTemplate();

  if (v7)
  {
    v8 = [(ASCompetitionTemplateSource *)self _friendForVictoryTemplate:v4];
    int v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 displayName];
      [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x263F23C20]];

      uint64_t v11 = [v9 currentCompetition];

      if (v11)
      {
        int v12 = [v9 currentCompetition];
        int v13 = [v12 lastDayOfCompetition];
        BOOL v14 = FILocalizedDayName();
        [v5 setObject:v14 forKeyedSubscript:*MEMORY[0x263F23C18]];
      }
    }
  }
  return v5;
}

- (id)unusedTemplateNamesForFriendWithUUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFFA08] set];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
  int v7 = [WeakRetained friendWithUUID:v4];

  ASLoggingInitialize();
  v8 = (os_log_t *)MEMORY[0x263F23A98];
  int v9 = *MEMORY[0x263F23A98];
  BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      uint64_t v11 = v9;
      int v12 = [v7 displayName];
      int v19 = 138543618;
      id v20 = v4;
      __int16 v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "Competition template source building unused template names for friend: %{public}@ - %@", (uint8_t *)&v19, 0x16u);
    }
    if (![v7 numberOfCompetitionWinsByMe] && (objc_msgSend(v7, "isCompetitionActive") & 1) == 0)
    {
      ASLoggingInitialize();
      int v13 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "No wins against this friend and competition isn't active, victory template is now unused", (uint8_t *)&v19, 2u);
      }
      BOOL v14 = [v7 UUID];
      __int16 v15 = ASCompetitionVictoryTemplateNameForFriend();

      uint64_t v16 = [v5 setByAddingObject:v15];

      v5 = (void *)v16;
    }
  }
  else if (v10)
  {
    int v19 = 138543362;
    id v20 = v4;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Competition template source couldn't find friend: %{public}@", (uint8_t *)&v19, 0xCu);
  }
  id v17 = v5;

  return v17;
}

- (id)_competitionForVictoryTemplate:(id)a3
{
  id v3 = [(ASCompetitionTemplateSource *)self _friendForVictoryTemplate:a3];
  id v4 = [v3 currentOrMostRecentCompetition];
  if (!v4)
  {
    ASLoggingInitialize();
    v5 = (void *)*MEMORY[0x263F23A98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_ERROR)) {
      -[ASCompetitionTemplateSource _competitionForVictoryTemplate:](v5, v3);
    }
  }

  return v4;
}

- (id)_friendForVictoryTemplate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F08C38]);
  int v6 = [v4 predicate];
  int v7 = (void *)[v5 initWithUUIDString:v6];

  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
    int v9 = [WeakRetained friendWithUUID:v7];

    if (v9)
    {
      id v10 = v9;
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_ERROR)) {
        -[ASCompetitionTemplateSource _friendForVictoryTemplate:]();
      }
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_ERROR)) {
      -[ASCompetitionTemplateSource _friendForVictoryTemplate:]();
    }
    int v9 = 0;
  }

  return v9;
}

- (ACHTemplateSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (ACHTemplateSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ASCompetitionTemplateSourceDataProvider)dataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
  return (ASCompetitionTemplateSourceDataProvider *)WeakRetained;
}

- (void)setDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataProvider);
  objc_destroyWeak((id *)&self->delegate);
}

- (void)templatesForDate:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2474C9000, log, OS_LOG_TYPE_DEBUG, "Evaluting friends for victory templates", v1, 2u);
}

- (void)resourceBundleURLForTemplate:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = [a2 uniqueName];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEBUG, "Responding to resource bundle for template: %@", v5, 0xCu);
}

- (void)_competitionForVictoryTemplate:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = [a2 UUID];
  OUTLINED_FUNCTION_1_0();
  __int16 v6 = 2112;
  int v7 = a2;
  _os_log_error_impl(&dword_2474C9000, v3, OS_LOG_TYPE_ERROR, "Couldn't find a competition to determine badge style for friend: %{public}@ - %@", v5, 0x16u);
}

- (void)_friendForVictoryTemplate:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2474C9000, v0, OS_LOG_TYPE_ERROR, "FriendUUID missing from template: %@", v1, 0xCu);
}

- (void)_friendForVictoryTemplate:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2474C9000, v0, OS_LOG_TYPE_ERROR, "Couldn't find friend with UUID: %{public}@", v1, 0xCu);
}

@end