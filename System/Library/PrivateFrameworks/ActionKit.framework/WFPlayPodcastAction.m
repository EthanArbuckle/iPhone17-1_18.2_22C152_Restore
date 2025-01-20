@interface WFPlayPodcastAction
- (BOOL)attemptContextualPlayback;
- (BOOL)canOfferSuggestionsForParameterWithKey:(id)a3;
- (WFIntentExecutor)executor;
- (id)contentNotFoundError;
- (id)errorPlayingPodcast:(unsigned int)a3;
- (id)genericPlayPodcastFailedError;
- (id)getPlaybackURLForContentItem:(id)a3 playbackOrder:(id)a4;
- (id)localizedKeyParameterDisplayName;
- (id)serializedParametersForContextualActionMediaIntent:(id)a3;
- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4;
- (id)systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:(id)a3;
- (void)executePlayMediaIntent:(id)a3;
- (void)fetchSuggestedEntititiesForParameterWithKey:(id)a3 completionHandler:(id)a4;
- (void)playQueue:(_MRSystemAppPlaybackQueue *)a3 onPlayerPath:(void *)a4 completion:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setExecutor:(id)a3;
@end

@implementation WFPlayPodcastAction

- (void).cxx_destruct
{
}

- (void)setExecutor:(id)a3
{
}

- (WFIntentExecutor)executor
{
  return self->executor;
}

- (void)executePlayMediaIntent:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F86C40];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithIntent:v5 donateInteraction:0 groupIdentifier:0];

  [v6 setSkipResolveAndConfirm:1];
  [(WFPlayPodcastAction *)self setExecutor:v6];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__WFPlayPodcastAction_executePlayMediaIntent___block_invoke;
  v7[3] = &unk_264E57738;
  v7[4] = self;
  [v6 startWithCompletionHandler:v7];
}

uint64_t __46__WFPlayPodcastAction_executePlayMediaIntent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

- (BOOL)attemptContextualPlayback
{
  v3 = [(WFPlayPodcastAction *)self parameterValueForKey:@"WFPodcastShow" ofClass:objc_opt_class()];
  v4 = [v3 intent];

  if (v4)
  {
    id v5 = [v3 intent];
    [(WFPlayPodcastAction *)self executePlayMediaIntent:v5];
  }
  return v4 != 0;
}

- (id)serializedParametersForContextualActionMediaIntent:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  v3 = (objc_class *)MEMORY[0x263F86DA0];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithIntent:v4];

  v6 = (void *)[objc_alloc(MEMORY[0x263F86DB0]) initWithValue:v5];
  v10 = @"WFPodcastShow";
  v7 = [v6 serializedRepresentation];
  v11[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v8;
}

- (void)fetchSuggestedEntititiesForParameterWithKey:(id)a3 completionHandler:(id)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFPlayPodcastAction *)self systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:v6];
  if (v8)
  {
    v9 = [MEMORY[0x263F86E48] sharedDataSource];
    [v9 loadEntriesFor:objc_opt_class() parameterKey:v6 limit:20 collectionIdentifier:v8 completionHandler:v7];
  }
  else
  {
    v9 = WFLocalizedString(@"Suggestions Not Found");
    v10 = WFLocalizedString(@"The specified action has no suggestions available");
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F870B8];
    uint64_t v13 = *MEMORY[0x263F08320];
    v16[0] = *MEMORY[0x263F08338];
    v16[1] = v13;
    v17[0] = v9;
    v17[1] = v10;
    v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    v15 = [v11 errorWithDomain:v12 code:5 userInfo:v14];

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);
  }
}

- (BOOL)canOfferSuggestionsForParameterWithKey:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = v4;
  if (v4 == @"WFPodcastShow")
  {
    char v6 = 1;
  }
  else if (v4)
  {
    char v6 = [(__CFString *)v4 isEqualToString:@"WFPodcastShow"];
  }
  else
  {
    char v6 = 0;
  }

  id v7 = [(WFPlayPodcastAction *)self systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:v5];

  if (v7) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:(id)a3
{
  v3 = [(WFPlayPodcastAction *)self parameterStateForKey:@"WFPodcastShow"];
  id v4 = [v3 variable];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 collectionFilter];

  BOOL v8 = [v7 namedQueryReference];

  if (v8)
  {
    v9 = [v8 topHitSystemEntityCollectionIdentifier];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = [v6 _codableDescription];
    BOOL v8 = [v7 attributeByName:@"mediaContainer"];
    v9 = [(WFPlayPodcastAction *)self parameterForKey:@"WFPodcastShow"];
    v10 = [v6 mediaContainer];
    v11 = [v9 definition];
    uint64_t v12 = objc_msgSend(v8, "wf_parameterStateForIntentValue:parameterDefinition:", v10, v11);
    uint64_t v13 = [v12 serializedRepresentation];

    if (v13)
    {
      v16 = @"WFPodcastShow";
      v17[0] = v13;
      v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)localizedKeyParameterDisplayName
{
  return WFLocalizedString(@"Podcast");
}

- (id)errorPlayingPodcast:(unsigned int)a3
{
  if (a3)
  {
    if (a3 == 1) {
      [(WFPlayPodcastAction *)self contentNotFoundError];
    }
    else {
    id v4 = [(WFPlayPodcastAction *)self genericPlayPodcastFailedError];
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)genericPlayPodcastFailedError
{
  void v11[2] = *MEMORY[0x263EF8340];
  v2 = WFLocalizedString(@"Unable to Play Podcast");
  uint64_t v3 = WFLocalizedString(@"Unable to play podcast because an unknown error occurred.");
  id v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F870B8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v10[0] = *MEMORY[0x263F08338];
  v10[1] = v6;
  v11[0] = v2;
  v11[1] = v3;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  BOOL v8 = [v4 errorWithDomain:v5 code:5 userInfo:v7];

  return v8;
}

- (id)contentNotFoundError
{
  void v11[2] = *MEMORY[0x263EF8340];
  v2 = WFLocalizedString(@"Podcast Not Found");
  uint64_t v3 = WFLocalizedString(@"The specified podcast could not be found.");
  id v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F870B8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v10[0] = *MEMORY[0x263F08338];
  v10[1] = v6;
  v11[0] = v2;
  v11[1] = v3;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  BOOL v8 = [v4 errorWithDomain:v5 code:5 userInfo:v7];

  return v8;
}

- (id)getPlaybackURLForContentItem:(id)a3 playbackOrder:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = @"storeTrackId";
    id v7 = [v5 episode];
    BOOL v8 = [v7 identifier];
    v13[0] = v8;
    v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];

LABEL_5:
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v5 object];
    v9 = [v7 podcastQueryDictionaryWithPlaybackOrder:v6];
    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:
  v10 = +[WFPodcastUtilities generatePlaybackQueueURL:@"playPodcast" withQueryDictionary:v9];

  return v10;
}

- (void)playQueue:(_MRSystemAppPlaybackQueue *)a3 onPlayerPath:(void *)a4 completion:(id)a5
{
  id v8 = a5;
  v9 = [(WFPlayPodcastAction *)self userInterface];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __57__WFPlayPodcastAction_playQueue_onPlayerPath_completion___block_invoke;
  void v11[3] = &unk_264E572F8;
  uint64_t v13 = a3;
  v14 = a4;
  id v12 = v8;
  id v10 = v8;
  WFConfigureAudioRoutesForUserInterface(v9, v11);
}

void __57__WFPlayPodcastAction_playQueue_onPlayerPath_completion___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  MRMediaRemoteSetAppPlaybackQueueForPlayer();
}

void __57__WFPlayPodcastAction_playQueue_onPlayerPath_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 firstObject];
  [v4 unsignedIntValue];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(WFPlayPodcastAction *)self attemptContextualPlayback])
  {
    v7[0] = objc_opt_class();
    v7[1] = objc_opt_class();
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __50__WFPlayPodcastAction_runAsynchronouslyWithInput___block_invoke;
    v6[3] = &unk_264E5DBA0;
    v6[4] = self;
    [v4 generateCollectionByCoercingToItemClasses:v5 completionHandler:v6];
  }
}

void __50__WFPlayPodcastAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 numberOfItems])
  {
    id v4 = @"APPLICATION_DEFAULT";
    id v5 = [*(id *)(a1 + 32) parameterValueForKey:@"WFPodcastPlaybackOrder" ofClass:objc_opt_class()];
    if ([v5 isEqualToString:@"Newest First"])
    {
      id v6 = WFPodcastsPlaybackOrderNewestFirst;
    }
    else
    {
      if (![v5 isEqualToString:@"Oldest First"])
      {
        id v8 = @"APPLICATION_DEFAULT";
        goto LABEL_9;
      }
      id v6 = &WFPodcastsPlaybackOrderOldestFirst;
    }
    id v8 = *v6;

LABEL_9:
    v9 = [v3 items];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __50__WFPlayPodcastAction_runAsynchronouslyWithInput___block_invoke_2;
    v18[3] = &unk_264E57258;
    v18[4] = *(void *)(a1 + 32);
    v19 = v8;
    id v10 = v8;
    id v7 = objc_msgSend(v9, "if_compactMap:", v18);

    goto LABEL_10;
  }
  id v5 = +[WFPodcastUtilities generatePlaybackQueueURL:@"playPodcasts" withQueryDictionary:0];
  v20[0] = v5;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
LABEL_10:

  v11 = +[WFPodcastUtilities createPlaybackQueueWithURLs:v7 setImmediatePlayback:1];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__WFPlayPodcastAction_runAsynchronouslyWithInput___block_invoke_3;
  v14[3] = &unk_264E572A8;
  uint64_t v12 = *(void *)(a1 + 32);
  id v15 = v7;
  uint64_t v16 = v12;
  v17 = v11;
  id v13 = v7;
  +[WFPodcastUtilities createPreferredPlayerPathWithCompletion:v14];
}

uint64_t __50__WFPlayPodcastAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) getPlaybackURLForContentItem:a2 playbackOrder:*(void *)(a1 + 40)];
}

uint64_t __50__WFPlayPodcastAction_runAsynchronouslyWithInput___block_invoke_3(void *a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = getWFActionsLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    *(_DWORD *)buf = 136315650;
    v17 = "-[WFPlayPodcastAction runAsynchronouslyWithInput:]_block_invoke_3";
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = a2;
    _os_log_impl(&dword_23C364000, v4, OS_LOG_TYPE_INFO, "%s Attempting to play podcasts %@ on playback path %@...", buf, 0x20u);
  }

  id v6 = (void *)a1[5];
  uint64_t v7 = a1[6];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __50__WFPlayPodcastAction_runAsynchronouslyWithInput___block_invoke_183;
  uint64_t v12 = &unk_264E57280;
  uint64_t v14 = a2;
  uint64_t v15 = v7;
  id v13 = v6;
  return objc_msgSend(v6, "playQueue:onPlayerPath:completion:");
}

void __50__WFPlayPodcastAction_runAsynchronouslyWithInput___block_invoke_183(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  CFRelease(*(CFTypeRef *)(a1 + 40));
  id v4 = getWFActionsLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[WFPlayPodcastAction runAsynchronouslyWithInput:]_block_invoke";
    __int16 v9 = 1026;
    int v10 = a2;
    _os_log_impl(&dword_23C364000, v4, OS_LOG_TYPE_INFO, "%s Finished attempting playback with MediaRemote status code %{public}u", (uint8_t *)&v7, 0x12u);
  }

  MRSystemAppPlaybackQueueDestroy();
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [v5 errorPlayingPodcast:a2];
  [v5 finishRunningWithError:v6];
}

@end