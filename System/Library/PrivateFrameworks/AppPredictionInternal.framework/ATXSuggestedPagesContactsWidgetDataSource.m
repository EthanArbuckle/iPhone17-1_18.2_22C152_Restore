@interface ATXSuggestedPagesContactsWidgetDataSource
- (ATXSuggestedPagesContactsWidgetDataSource)init;
- (id)_createMediumContactsWidgetForPeople:(id)a3 entities:(id)a4;
- (id)_createSmallContactsWidgetForPeople:(id)a3;
- (id)provideWidgetsForPageType:(int64_t)a3 environment:(id)a4;
@end

@implementation ATXSuggestedPagesContactsWidgetDataSource

- (ATXSuggestedPagesContactsWidgetDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXSuggestedPagesContactsWidgetDataSource;
  v2 = [(ATXSuggestedPagesContactsWidgetDataSource *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    suggestedPagesTunableConstants = v2->_suggestedPagesTunableConstants;
    v2->_suggestedPagesTunableConstants = (ATXSuggestedPagesTunableConstants *)v3;
  }
  return v2;
}

- (id)provideWidgetsForPageType:(int64_t)a3 environment:(id)a4
{
  id v6 = a4;
  if ((unint64_t)(a3 - 3) < 9 && ((0x143u >> (a3 - 3)) & 1) != 0
    || (unint64_t v7 = +[ATXSuggestedPagesUtils modeForSuggestedPageType:a3], v7 == 16))
  {
    v8 = 0;
  }
  else
  {
    unint64_t v9 = v7;
    v10 = +[ATXSuggestedPagesUtils semanticTypeForSuggestedPageType:a3];
    v11 = v10;
    if (v10 && [v10 integerValue] != 8)
    {
      v13 = [MEMORY[0x1E4F4AF78] sharedInstance];
      v12 = objc_msgSend(v13, "iOSContactAllowListForMode:", objc_msgSend(v11, "integerValue"));
    }
    else
    {
      v12 = 0;
    }
    v14 = +[ATXModeEntityScorerServer sharedInstance];
    v15 = [v14 rankedContactsForMode:v9];
    v16 = objc_opt_new();
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __83__ATXSuggestedPagesContactsWidgetDataSource_provideWidgetsForPageType_environment___block_invoke;
    v25[3] = &unk_1E68B3468;
    v25[4] = self;
    int64_t v28 = a3;
    id v17 = v12;
    id v26 = v17;
    id v18 = v16;
    id v27 = v18;
    v19 = objc_msgSend(v15, "_pas_mappedArrayWithTransform:", v25);
    if ([v19 count])
    {
      v24 = v11;
      v8 = objc_opt_new();
      v20 = [(ATXSuggestedPagesContactsWidgetDataSource *)self _createSmallContactsWidgetForPeople:v19];
      if (v20) {
        [v8 addObject:v20];
      }
      unint64_t v21 = [v19 count];
      if (v21 >= [(ATXSuggestedPagesTunableConstants *)self->_suggestedPagesTunableConstants numberOfContactsForMediumWidget])
      {
        v22 = [(ATXSuggestedPagesContactsWidgetDataSource *)self _createMediumContactsWidgetForPeople:v19 entities:v18];
        if (v22) {
          [v8 addObject:v22];
        }
      }
      v11 = v24;
    }
    else
    {
      v8 = 0;
    }
  }
  return v8;
}

id __83__ATXSuggestedPagesContactsWidgetDataSource_provideWidgetsForPageType_environment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 displayName];
  uint64_t v5 = [v4 length];

  if (!v5) {
    goto LABEL_4;
  }
  id v6 = [v3 cnContactId];
  uint64_t v7 = [v6 length];

  if (!v7) {
    goto LABEL_4;
  }
  v8 = [v3 scoreMetadata];
  [v8 score];
  double v10 = v9;
  [*(id *)(*(void *)(a1 + 32) + 8) minScoreForModeAffinityContactsWidgetSuggestions];
  double v12 = v11;

  if (v10 >= v12)
  {
    if (*(void *)(a1 + 56) == 8
      || (v15 = *(void **)(a1 + 40),
          [v3 cnContactId],
          v16 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(v15) = [v15 containsObject:v16],
          v16,
          (v15 & 1) != 0))
    {
      [*(id *)(a1 + 48) addObject:v3];
      id v17 = objc_msgSend(v3, "displayName", @"displayName");
      v20[1] = @"identifier";
      v21[0] = v17;
      id v18 = [v3 cnContactId];
      v21[1] = v18;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    }
    else
    {
      id v17 = __atxlog_handle_modes();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [v3 cnContactId];
        *(_DWORD *)buf = 138412290;
        v23 = v19;
        _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "Skipping contact not on allow list: %@", buf, 0xCu);
      }
      v13 = 0;
    }
  }
  else
  {
LABEL_4:
    v13 = 0;
  }

  return v13;
}

- (id)_createMediumContactsWidgetForPeople:(id)a3 entities:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  unint64_t v9 = [v8 count];
  if (v9 < [(ATXSuggestedPagesTunableConstants *)self->_suggestedPagesTunableConstants numberOfContactsForMediumWidget])
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"ATXSuggestedPagesContactsWidgetDataSource.m", 99, @"Invalid parameter not satisfying: %@", @"people.count >= _suggestedPagesTunableConstants.numberOfContactsForMediumWidget" object file lineNumber description];
  }
  unint64_t v10 = [v7 count];
  if (v10 < [(ATXSuggestedPagesTunableConstants *)self->_suggestedPagesTunableConstants numberOfContactsForMediumWidget])
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"ATXSuggestedPagesContactsWidgetDataSource.m", 100, @"Invalid parameter not satisfying: %@", @"entities.count >= _suggestedPagesTunableConstants.numberOfContactsForMediumWidget" object file lineNumber description];
  }
  double v11 = objc_msgSend(v8, "subarrayWithRange:", 0, -[ATXSuggestedPagesTunableConstants numberOfContactsForMediumWidget](self->_suggestedPagesTunableConstants, "numberOfContactsForMediumWidget"));

  id v12 = objc_alloc(MEMORY[0x1E4F938E0]);
  unint64_t v21 = @"people";
  v22[0] = v11;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  v14 = (void *)[v12 initWithTypeName:@"com.apple.PeopleViewService.SelectPerson-iOS.SelectPeopleIntent" parameters:v13];

  v15 = [v14 createIntent];
  if (v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F4B0D0]);
    [v16 setIntent:v15];
    [v16 setSize:1];
    [v16 setWidgetKind:@"MultipleContactWidget_iOS"];
    [v16 setExtensionBundleId:@"com.apple.PeopleViewService.PeopleWidget-iOS"];
    [v16 setAppBundleId:@"com.apple.PeopleViewService"];
    [v16 setScore:0.5];
    [v16 setPredictionSource:@"Contacts Heuristic"];
    [v16 setRequiresAppLaunch:0];
  }
  else
  {
    id v17 = __atxlog_handle_modes();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[ATXSuggestedPagesContactsWidgetDataSource _createMediumContactsWidgetForPeople:entities:](v17);
    }

    id v16 = 0;
  }

  return v16;
}

- (id)_createSmallContactsWidgetForPeople:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [v5 count];
  if (v6 < [(ATXSuggestedPagesTunableConstants *)self->_suggestedPagesTunableConstants numberOfContactsForSmallWidget])
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"ATXSuggestedPagesContactsWidgetDataSource.m", 130, @"Invalid parameter not satisfying: %@", @"people.count >= _suggestedPagesTunableConstants.numberOfContactsForSmallWidget" object file lineNumber description];
  }
  id v7 = [v5 firstObject];
  id v8 = objc_alloc(MEMORY[0x1E4F302B8]);
  v15 = @"person";
  v16[0] = v7;
  unint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  unint64_t v10 = (void *)[v8 initWithAppBundleIdentifier:@"com.apple.PeopleViewService" appIntentIdentifier:@"SelectPersonIntent" serializedParameters:v9];

  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F4B0D0]);
    [v11 setIntent:v10];
    [v11 setSize:0];
    [v11 setWidgetKind:@"SingleContactWidget_iOS"];
    [v11 setExtensionBundleId:@"com.apple.PeopleViewService.PeopleWidget-iOS"];
    [v11 setAppBundleId:@"com.apple.PeopleViewService"];
    [v11 setScore:0.5];
    [v11 setPredictionSource:@"Contacts Heuristic"];
  }
  else
  {
    id v12 = __atxlog_handle_modes();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[ATXSuggestedPagesContactsWidgetDataSource _createMediumContactsWidgetForPeople:entities:](v12);
    }

    id v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
}

- (void)_createMediumContactsWidgetForPeople:(os_log_t)log entities:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "ATXSuggestedPagesContactsWidgetDataSource: could not make intent", v1, 2u);
}

@end