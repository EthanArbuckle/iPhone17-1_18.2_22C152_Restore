@interface WFPlayMusicAction
- (BOOL)attemptContextualPlayback;
- (BOOL)canOfferSuggestionsForParameterWithKey:(id)a3;
- (BOOL)hasPlaybackArchive;
- (BOOL)populatesInputFromInputParameter;
- (WFIntentExecutor)executor;
- (id)disabledOnPlatforms;
- (id)localizedKeyParameterDisplayName;
- (id)mediaQueryFromMediaCollection:(id)a3;
- (id)serializedParametersForContextualActionMediaIntent:(id)a3;
- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4;
- (id)systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:(id)a3;
- (int64_t)repeatMode;
- (int64_t)shuffleMode;
- (void)executePlayMediaIntent:(id)a3;
- (void)fetchSuggestedEntititiesForParameterWithKey:(id)a3 completionHandler:(id)a4;
- (void)finishRunningWithError:(id)a3;
- (void)getContentWithCompletionHandler:(id)a3;
- (void)initializeParameters;
- (void)playContent:(id)a3 withMusicPlayer:(id)a4 completionHandler:(id)a5;
- (void)playContentViaMPCAssistant:(id)a3 routeDescriptor:(id)a4;
- (void)playContentViaMusicPlayer:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)sendPlaybackArchive:(id)a3 orPlaybackQueue:(id)a4 toDestination:(id)a5 completion:(id)a6;
- (void)setExecutor:(id)a3;
- (void)setShuffleAndRepeatModesOnMusicPlayer:(id)a3;
@end

@implementation WFPlayMusicAction

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
  [(WFPlayMusicAction *)self setExecutor:v6];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__WFPlayMusicAction_executePlayMediaIntent___block_invoke;
  v7[3] = &unk_264E57738;
  v7[4] = self;
  [v6 startWithCompletionHandler:v7];
}

uint64_t __44__WFPlayMusicAction_executePlayMediaIntent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

- (BOOL)attemptContextualPlayback
{
  v3 = [(WFPlayMusicAction *)self parameterValueForKey:@"WFMediaItems" ofClass:objc_opt_class()];
  v4 = v3;
  if (v3 && ([v3 intent], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v6 = [v4 intent];
    [(WFPlayMusicAction *)self executePlayMediaIntent:v6];

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)serializedParametersForContextualActionMediaIntent:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  v3 = (objc_class *)MEMORY[0x263F86CD8];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithIntent:v4];

  v6 = (void *)[objc_alloc(MEMORY[0x263F86CE0]) initWithValue:v5];
  v10 = @"WFMediaItems";
  BOOL v7 = [v6 serializedRepresentation];
  v11[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v8;
}

- (void)fetchSuggestedEntititiesForParameterWithKey:(id)a3 completionHandler:(id)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFPlayMusicAction *)self systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:v6];
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
  if (v4 == @"WFMediaItems")
  {
    char v6 = 1;
  }
  else if (v4)
  {
    char v6 = [(__CFString *)v4 isEqualToString:@"WFMediaItems"];
  }
  else
  {
    char v6 = 0;
  }

  id v7 = [(WFPlayMusicAction *)self systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:v5];

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
  v3 = [(WFPlayMusicAction *)self parameterStateForKey:@"WFMediaItems"];
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
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = 0;
    goto LABEL_14;
  }
  id v6 = v5;
  id v7 = [v6 _codableDescription];
  uint64_t v8 = [v6 mediaContainer];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [v6 mediaContainer];
    uint64_t v11 = [v10 type];

    if (v11)
    {
      uint64_t v12 = [v7 attributeByName:@"mediaContainer"];
      uint64_t v13 = [(WFPlayMusicAction *)self parameterForKey:@"WFMediaItems"];
      v14 = [v6 mediaContainer];
      v15 = [v13 definition];
      v16 = objc_msgSend(v12, "wf_parameterStateForIntentValue:parameterDefinition:", v14, v15);
      v17 = [v16 serializedRepresentation];
LABEL_8:

      if (v17
        && ([v17 objectForKey:@"itemName"],
            v20 = objc_claimAutoreleasedReturnValue(),
            [MEMORY[0x263EFF9D0] null],
            v21 = objc_claimAutoreleasedReturnValue(),
            char v22 = [v20 isEqual:v21],
            v21,
            v20,
            (v22 & 1) == 0))
      {
        v24 = @"WFMediaItems";
        v25[0] = v17;
        v18 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
      }
      else
      {
        v18 = 0;
      }
      goto LABEL_13;
    }
  }
  v18 = [v6 mediaItems];

  if (v18)
  {
    uint64_t v12 = [v7 attributeByName:@"mediaItems"];
    uint64_t v13 = [(WFPlayMusicAction *)self parameterForKey:@"WFMediaItems"];
    v14 = [v6 mediaItems];
    v15 = [v14 firstObject];
    v16 = [v13 definition];
    v19 = objc_msgSend(v12, "wf_parameterStateForIntentValue:parameterDefinition:", v15, v16);
    v17 = [v19 serializedRepresentation];

    goto LABEL_8;
  }
  v17 = 0;
LABEL_13:

LABEL_14:
  return v18;
}

- (id)localizedKeyParameterDisplayName
{
  return WFLocalizedString(@"Music");
}

- (void)finishRunningWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(WFPlayMusicAction *)self variableSource];
  id v6 = objc_opt_new();
  [v5 setContent:v6 forVariableWithName:@"Has Played Music"];

  v7.receiver = self;
  v7.super_class = (Class)WFPlayMusicAction;
  [(WFPlayMusicAction *)&v7 finishRunningWithError:v4];
}

- (int64_t)repeatMode
{
  v2 = [(WFPlayMusicAction *)self parameterValueForKey:@"WFPlayMusicActionRepeat" ofClass:objc_opt_class()];
  if ([v2 isEqualToString:@"None"])
  {
    int64_t v3 = 1;
  }
  else if ([v2 isEqualToString:@"One"])
  {
    int64_t v3 = 2;
  }
  else if ([v2 isEqualToString:@"All"])
  {
    int64_t v3 = 3;
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (int64_t)shuffleMode
{
  v2 = [(WFPlayMusicAction *)self parameterValueForKey:@"WFPlayMusicActionShuffle" ofClass:objc_opt_class()];
  if ([v2 isEqualToString:@"Off"])
  {
    int64_t v3 = 1;
  }
  else if ([v2 isEqualToString:@"Songs"])
  {
    int64_t v3 = 2;
  }
  else if ([v2 isEqualToString:@"Albums"])
  {
    int64_t v3 = 3;
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (void)setShuffleAndRepeatModesOnMusicPlayer:(id)a3
{
  id v6 = a3;
  int64_t v4 = [(WFPlayMusicAction *)self shuffleMode];
  if (v4) {
    [v6 setShuffleMode:v4];
  }
  int64_t v5 = [(WFPlayMusicAction *)self repeatMode];
  if (v5) {
    [v6 setRepeatMode:v5];
  }
}

- (void)playContent:(id)a3 withMusicPlayer:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  uint64_t v11 = [v8 storeIDs];

  if (v11)
  {
    uint64_t v12 = [v8 storeIDs];
    [v9 setQueueWithStoreIDs:v12];
  }
  else
  {
    uint64_t v13 = [v8 mediaCollection];

    if (v13)
    {
      uint64_t v12 = [v8 mediaCollection];
      [v9 setQueueWithItemCollection:v12];
    }
    else
    {
      v15 = [v9 nowPlayingItem];

      if (v15) {
        goto LABEL_6;
      }
      uint64_t v12 = [getMPMediaQueryClass() songsQuery];
      v16 = [v12 items];
      uint64_t v17 = [v16 count];

      if (!v17)
      {
        v10[2](v10, 0);

        goto LABEL_7;
      }
      [v9 setQueueWithQuery:v12];
    }
  }

LABEL_6:
  v14 = [(WFPlayMusicAction *)self userInterface];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __67__WFPlayMusicAction_playContent_withMusicPlayer_completionHandler___block_invoke;
  v18[3] = &unk_264E5DD30;
  id v19 = v9;
  v20 = self;
  v21 = v10;
  WFConfigureAudioRoutesForUserInterface(v14, v18);

LABEL_7:
}

void __67__WFPlayMusicAction_playContent_withMusicPlayer_completionHandler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__WFPlayMusicAction_playContent_withMusicPlayer_completionHandler___block_invoke_2;
  v4[3] = &unk_264E58968;
  int8x16_t v3 = *(int8x16_t *)(a1 + 32);
  id v2 = (id)v3.i64[0];
  int8x16_t v5 = vextq_s8(v3, v3, 8uLL);
  id v6 = *(id *)(a1 + 48);
  [v2 prepareToPlayWithCompletionHandler:v4];
}

void __67__WFPlayMusicAction_playContent_withMusicPlayer_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    int64_t v4 = getWFActionsLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      int v5 = 136315394;
      id v6 = "-[WFPlayMusicAction playContent:withMusicPlayer:completionHandler:]_block_invoke_2";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_23C364000, v4, OS_LOG_TYPE_FAULT, "%s Error preparing to play music: %@", (uint8_t *)&v5, 0x16u);
    }
  }
  [*(id *)(a1 + 32) setShuffleAndRepeatModesOnMusicPlayer:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) play];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)playContentViaMusicPlayer:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  int v5 = (void *)getMPMusicPlayerControllerClass_softClass;
  uint64_t v17 = getMPMusicPlayerControllerClass_softClass;
  if (!getMPMusicPlayerControllerClass_softClass)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __getMPMusicPlayerControllerClass_block_invoke;
    v13[3] = &unk_264E5EC88;
    v13[4] = &v14;
    __getMPMusicPlayerControllerClass_block_invoke((uint64_t)v13);
    int v5 = (void *)v15[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v14, 8);
  __int16 v7 = [v6 systemMusicPlayer];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__WFPlayMusicAction_playContentViaMusicPlayer___block_invoke;
  v10[3] = &unk_264E5C978;
  v10[4] = self;
  id v11 = v7;
  id v12 = v4;
  id v8 = v4;
  id v9 = v7;
  [(WFPlayMusicAction *)self playContent:v8 withMusicPlayer:v9 completionHandler:v10];
}

void __47__WFPlayMusicAction_playContentViaMusicPlayer___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    dispatch_time_t v3 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__WFPlayMusicAction_playContentViaMusicPlayer___block_invoke_2;
    block[3] = &unk_264E5E938;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = v4;
    uint64_t v9 = v5;
    id v10 = *(id *)(a1 + 48);
    dispatch_after(v3, MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    [v6 finishRunningWithError:0];
  }
}

uint64_t __47__WFPlayMusicAction_playContentViaMusicPlayer___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) playbackState];
  dispatch_time_t v3 = *(void **)(a1 + 40);
  if (v2 == 1)
  {
    return [v3 finishRunningWithError:0];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__WFPlayMusicAction_playContentViaMusicPlayer___block_invoke_3;
    v7[3] = &unk_264E57710;
    v7[4] = v3;
    return [v3 playContent:v5 withMusicPlayer:v6 completionHandler:v7];
  }
}

uint64_t __47__WFPlayMusicAction_playContentViaMusicPlayer___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRunningWithError:0];
}

- (void)sendPlaybackArchive:(id)a3 orPlaybackQueue:(id)a4 toDestination:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(WFPlayMusicAction *)self userInterface];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __82__WFPlayMusicAction_sendPlaybackArchive_orPlaybackQueue_toDestination_completion___block_invoke;
  v19[3] = &unk_264E5DC38;
  id v20 = v10;
  id v21 = v12;
  id v22 = v11;
  id v23 = v13;
  id v15 = v11;
  id v16 = v13;
  id v17 = v12;
  id v18 = v10;
  WFConfigureAudioRoutesForUserInterface(v14, v19);
}

void __82__WFPlayMusicAction_sendPlaybackArchive_orPlaybackQueue_toDestination_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)getMPCAssistantCommandClass());
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __82__WFPlayMusicAction_sendPlaybackArchive_orPlaybackQueue_toDestination_completion___block_invoke_2;
    v13[3] = &unk_264E576E8;
    uint64_t v5 = &v16;
    uint64_t v6 = &v14;
    id v16 = *(id *)(a1 + 56);
    id v14 = v2;
    __int16 v7 = &v15;
    id v15 = *(id *)(a1 + 40);
    [v2 sendPlaybackArchive:v3 toDestination:v4 completion:v13];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __82__WFPlayMusicAction_sendPlaybackArchive_orPlaybackQueue_toDestination_completion___block_invoke_3;
    v9[3] = &unk_264E576E8;
    uint64_t v5 = &v12;
    uint64_t v6 = &v10;
    id v12 = *(id *)(a1 + 56);
    id v10 = v2;
    __int16 v7 = &v11;
    id v11 = *(id *)(a1 + 40);
    [v2 sendPlaybackQueue:v8 toDestination:v4 completion:v9];
  }
}

uint64_t __82__WFPlayMusicAction_sendPlaybackArchive_orPlaybackQueue_toDestination_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) sendCommand:0 toDestination:*(void *)(a1 + 40) withOptions:0 completion:*(void *)(a1 + 48)];
  }
}

uint64_t __82__WFPlayMusicAction_sendPlaybackArchive_orPlaybackQueue_toDestination_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) sendCommand:0 toDestination:*(void *)(a1 + 40) withOptions:0 completion:*(void *)(a1 + 48)];
  }
}

- (void)playContentViaMPCAssistant:(id)a3 routeDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 playbackArchive];
  int64_t v9 = [(WFPlayMusicAction *)self shuffleMode];
  id v10 = [v6 storeIDs];

  if (v10)
  {
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2050000000;
    id v11 = (void *)getMPCAssistantStoreTracklistPlaybackQueueClass_softClass;
    uint64_t v40 = getMPCAssistantStoreTracklistPlaybackQueueClass_softClass;
    if (!getMPCAssistantStoreTracklistPlaybackQueueClass_softClass)
    {
      uint64_t v32 = MEMORY[0x263EF8330];
      uint64_t v33 = 3221225472;
      v34 = __getMPCAssistantStoreTracklistPlaybackQueueClass_block_invoke;
      v35 = &unk_264E5EC88;
      v36 = &v37;
      __getMPCAssistantStoreTracklistPlaybackQueueClass_block_invoke((uint64_t)&v32);
      id v11 = (void *)v38[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v37, 8);
    id v13 = [v12 alloc];
    id v14 = [v6 storeIDs];
    id v15 = (void *)[v13 initWithContextID:0 storeItemIDs:v14 collectionIdentifierSet:0];

    if ((unint64_t)(v9 - 1) >= 3) {
      uint64_t v16 = 1000;
    }
    else {
      uint64_t v16 = v9 - 1;
    }
    [v15 setShuffleType:v16];
    goto LABEL_23;
  }
  id v17 = [v6 mediaCollection];

  if (v17)
  {
    id v18 = [v6 mediaCollection];
    id v19 = [(WFPlayMusicAction *)self mediaQueryFromMediaCollection:v18];

    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2050000000;
    id v20 = (void *)getMPCAssistantQueryPlaybackQueueClass_softClass;
    uint64_t v40 = getMPCAssistantQueryPlaybackQueueClass_softClass;
    if (!getMPCAssistantQueryPlaybackQueueClass_softClass)
    {
      uint64_t v32 = MEMORY[0x263EF8330];
      uint64_t v33 = 3221225472;
      v34 = __getMPCAssistantQueryPlaybackQueueClass_block_invoke;
      v35 = &unk_264E5EC88;
      v36 = &v37;
      __getMPCAssistantQueryPlaybackQueueClass_block_invoke((uint64_t)&v32);
      id v20 = (void *)v38[3];
    }
    id v21 = v20;
    _Block_object_dispose(&v37, 8);
    id v22 = (void *)[[v21 alloc] initWithContextID:0 query:v19];
    id v15 = v22;
    if ((unint64_t)(v9 - 1) >= 3) {
      uint64_t v23 = 1000;
    }
    else {
      uint64_t v23 = v9 - 1;
    }
    [v22 setShuffleType:v23];

    goto LABEL_23;
  }
  if (v8)
  {
    if ((unint64_t)(v9 - 2) >= 2)
    {
      if (v9 != 1)
      {
LABEL_22:
        id v15 = 0;
LABEL_23:
        v26 = objc_alloc_init(WFMediaPlaybackController);
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __64__WFPlayMusicAction_playContentViaMPCAssistant_routeDescriptor___block_invoke;
        v28[3] = &unk_264E576C0;
        v28[4] = self;
        id v29 = v7;
        id v30 = v6;
        id v31 = v15;
        id v27 = v15;
        [(WFMediaPlaybackController *)v26 getPreferredPlaybackDestinationForPlaybackArchive:v8 completionBlock:v28];

        goto LABEL_24;
      }
      v24 = v8;
      uint64_t v25 = 0;
    }
    else
    {
      v24 = v8;
      uint64_t v25 = 1;
    }
    [v24 setBOOLValue:v25 forOption:1];
    goto LABEL_22;
  }
  [(WFPlayMusicAction *)self finishRunningWithError:0];
LABEL_24:
}

void __64__WFPlayMusicAction_playContentViaMPCAssistant_routeDescriptor___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    if (([*(id *)(a1 + 40) isLocalDevice] & 1) == 0)
    {
      uint64_t v4 = [*(id *)(a1 + 40) routeUID];
      v11[0] = v4;
      uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      [v3 setOutputDeviceUIDs:v5];
    }
    id v6 = *(void **)(a1 + 32);
    id v7 = [*(id *)(a1 + 48) playbackArchive];
    uint64_t v8 = *(void *)(a1 + 56);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __64__WFPlayMusicAction_playContentViaMPCAssistant_routeDescriptor___block_invoke_2;
    v9[3] = &unk_264E57698;
    void v9[4] = *(void *)(a1 + 32);
    id v10 = v3;
    [v6 sendPlaybackArchive:v7 orPlaybackQueue:v8 toDestination:v10 completion:v9];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:0];
  }
}

uint64_t __64__WFPlayMusicAction_playContentViaMPCAssistant_routeDescriptor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    return [v3 finishRunningWithError:a2];
  }
  else
  {
    uint64_t v5 = [v3 repeatMode];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = objc_alloc_init((Class)getMPCAssistantCommandClass());
      uint64_t v10 = *MEMORY[0x263F54D68];
      uint64_t v8 = [NSNumber numberWithInteger:v6];
      v11[0] = v8;
      int64_t v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

      [v7 sendCommand:25 toDestination:*(void *)(a1 + 40) withOptions:v9 completion:&__block_literal_global_205_12325];
    }
    return [*(id *)(a1 + 32) finishRunningWithError:0];
  }
}

void __64__WFPlayMusicAction_playContentViaMPCAssistant_routeDescriptor___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = getWFActionsLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      int v4 = 136315394;
      uint64_t v5 = "-[WFPlayMusicAction playContentViaMPCAssistant:routeDescriptor:]_block_invoke_3";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_23C364000, v3, OS_LOG_TYPE_FAULT, "%s Error when trying to change repeat mode which is expected for certain content e.g. radio stations: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (id)mediaQueryFromMediaCollection:(id)a3
{
  v37[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = [v3 itemsQuery];

  if (v4)
  {
    uint64_t v5 = [v3 itemsQuery];
  }
  else
  {
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x2050000000;
    __int16 v6 = (void *)getMPMediaPropertyPredicateClass_softClass_12329;
    uint64_t v35 = getMPMediaPropertyPredicateClass_softClass_12329;
    if (!getMPMediaPropertyPredicateClass_softClass_12329)
    {
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      id v29 = __getMPMediaPropertyPredicateClass_block_invoke_12330;
      id v30 = &unk_264E5EC88;
      id v31 = &v32;
      __getMPMediaPropertyPredicateClass_block_invoke_12330((uint64_t)&v27);
      __int16 v6 = (void *)v33[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v32, 8);
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x2020000000;
    uint64_t v8 = (id *)getMPMediaItemPropertyIsPlayableSymbolLoc_ptr;
    uint64_t v35 = getMPMediaItemPropertyIsPlayableSymbolLoc_ptr;
    if (!getMPMediaItemPropertyIsPlayableSymbolLoc_ptr)
    {
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      id v29 = __getMPMediaItemPropertyIsPlayableSymbolLoc_block_invoke;
      id v30 = &unk_264E5EC88;
      id v31 = &v32;
      int64_t v9 = MediaPlayerLibrary_12295();
      uint64_t v10 = dlsym(v9, "MPMediaItemPropertyIsPlayable");
      *(void *)(v31[1] + 24) = v10;
      getMPMediaItemPropertyIsPlayableSymbolLoc_ptr = *(void *)(v31[1] + 24);
      uint64_t v8 = (id *)v33[3];
    }
    _Block_object_dispose(&v32, 8);
    if (!v8)
    {
      id v21 = [MEMORY[0x263F08690] currentHandler];
      id v22 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyIsPlayable(void)"];
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"WFPlayMusicAction.m", 35, @"%s", dlerror());

      __break(1u);
    }
    id v11 = *v8;
    id v12 = [v7 predicateWithValue:MEMORY[0x263EFFA88] forProperty:v11];
    v37[0] = v12;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];

    id v14 = objc_alloc((Class)getMPMediaQueryClass());
    id v15 = [v3 items];
    uint64_t v5 = (void *)[v14 initWithEntities:v15 entityType:0];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v16 = v13;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v16);
          }
          [v5 addFilterPredicate:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v36 count:16];
      }
      while (v17);
    }
  }
  return v5;
}

- (void)getContentWithCompletionHandler:(id)a3
{
  v25[3] = *MEMORY[0x263EF8340];
  int v4 = (void (**)(id, WFPlayMusicActionContent *, id))a3;
  uint64_t v5 = [(WFPlayMusicAction *)self parameterValueForKey:@"WFMediaItems" ofClass:objc_opt_class()];
  __int16 v6 = [v5 playbackArchiveData];
  if (v6)
  {
    id v7 = (void *)MEMORY[0x263F08928];
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2050000000;
    uint64_t v8 = (void *)getMPPlaybackArchiveClass_softClass;
    uint64_t v24 = getMPPlaybackArchiveClass_softClass;
    if (!getMPPlaybackArchiveClass_softClass)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __getMPPlaybackArchiveClass_block_invoke;
      v20[3] = &unk_264E5EC88;
      v20[4] = &v21;
      __getMPPlaybackArchiveClass_block_invoke((uint64_t)v20);
      uint64_t v8 = (void *)v22[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v21, 8);
    id v19 = 0;
    uint64_t v10 = [v7 unarchivedObjectOfClass:v9 fromData:v6 error:&v19];
    id v11 = v19;
    id v12 = [[WFPlayMusicActionContent alloc] initWithPlaybackArchive:v10];
    v4[2](v4, v12, v11);
  }
  else if (v5)
  {
    id v13 = [v5 collectionForPlayback];
    id v14 = [[WFPlayMusicActionContent alloc] initWithMediaCollection:v13];
    v4[2](v4, v14, 0);
  }
  else
  {
    id v15 = [(WFPlayMusicAction *)self parameterValueForKey:@"WFMediaItems" ofClass:objc_opt_class()];
    if (v15)
    {
      v25[0] = objc_opt_class();
      v25[1] = objc_opt_class();
      void v25[2] = objc_opt_class();
      id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __53__WFPlayMusicAction_getContentWithCompletionHandler___block_invoke;
      void v17[3] = &unk_264E5B8E0;
      uint64_t v18 = v4;
      [v15 generateCollectionByCoercingToItemClasses:v16 completionHandler:v17];
    }
    else
    {
      v4[2](v4, 0, 0);
    }
  }
}

void __53__WFPlayMusicAction_getContentWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a2;
  id v30 = v9;
  uint64_t v10 = [v9 collectionByFilteringToItemClass:objc_opt_class() excludedItems:&v30];
  id v11 = v30;

  id v29 = v11;
  id v12 = [v11 collectionByFilteringToItemClass:objc_opt_class() excludedItems:&v29];
  id v13 = v29;

  id v28 = v13;
  id v14 = [v13 collectionByFilteringToItemClass:objc_opt_class() excludedItems:&v28];
  id v15 = v28;

  if ([v12 numberOfItems])
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __53__WFPlayMusicAction_getContentWithCompletionHandler___block_invoke_2;
    v26[3] = &unk_264E5BDE0;
    id v27 = *(id *)(a1 + 32);
    [v12 getObjectRepresentations:v26 forClass:objc_opt_class()];
  }
  else if ([v14 numberOfItems])
  {
    id v16 = [v14 items];
    uint64_t v17 = objc_msgSend(v16, "if_map:", &__block_literal_global_198);

    if (v17)
    {
      uint64_t v32 = 0;
      uint64_t v33 = &v32;
      uint64_t v34 = 0x2050000000;
      uint64_t v18 = (void *)getMPMediaItemCollectionClass_softClass;
      uint64_t v35 = getMPMediaItemCollectionClass_softClass;
      if (!getMPMediaItemCollectionClass_softClass)
      {
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __getMPMediaItemCollectionClass_block_invoke;
        v31[3] = &unk_264E5EC88;
        v31[4] = &v32;
        __getMPMediaItemCollectionClass_block_invoke((uint64_t)v31);
        uint64_t v18 = (void *)v33[3];
      }
      id v19 = v18;
      _Block_object_dispose(&v32, 8);
      id v20 = [v19 collectionWithItems:v17];
    }
    else
    {
      id v20 = 0;
    }
    long long v25 = [[WFPlayMusicActionContent alloc] initWithMediaCollection:v20];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else if ([v10 numberOfItems])
  {
    uint64_t v21 = [v10 items];
    id v22 = [v21 firstObject];

    uint64_t v23 = [v22 collection];
    uint64_t v24 = [[WFPlayMusicActionContent alloc] initWithMediaCollection:v23];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __53__WFPlayMusicAction_getContentWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  objc_msgSend(a2, "if_compactMap:", &__block_literal_global_12343);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [[WFPlayMusicActionContent alloc] initWithStoreIDs:v8];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__WFPlayMusicAction_getContentWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 mediaItem];
}

uint64_t __53__WFPlayMusicAction_getContentWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (BOOL)populatesInputFromInputParameter
{
  return 0;
}

- (BOOL)hasPlaybackArchive
{
  id v2 = [(WFPlayMusicAction *)self parameterStateForKey:@"WFMediaItems"];
  id v3 = [v2 value];
  int v4 = [v3 type];

  LOBYTE(v3) = [v4 isEqualToString:*MEMORY[0x263F87298]];
  return (char)v3;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  int v4 = [(WFPlayMusicAction *)self parameterValueForKey:@"WFMediaRoute" ofClass:objc_opt_class()];
  if (!v4) {
    int v4 = [[WFMediaRouteDescriptor alloc] initWithRouteUID:0 groupUID:0 routeName:0 isLocalDevice:1];
  }
  if (![(WFPlayMusicAction *)self attemptContextualPlayback])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __48__WFPlayMusicAction_runAsynchronouslyWithInput___block_invoke;
    v5[3] = &unk_264E57610;
    v5[4] = self;
    id v6 = v4;
    [(WFPlayMusicAction *)self getContentWithCompletionHandler:v5];
  }
}

void __48__WFPlayMusicAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = v5;
  if (!v10 && v5)
  {
    [*(id *)(a1 + 32) finishRunningWithError:v5];
    goto LABEL_9;
  }
  id v7 = [v10 playbackArchive];
  if (v7)
  {

    id v8 = v10;
  }
  else
  {
    char v9 = [*(id *)(a1 + 40) isLocalDevice];
    id v8 = v10;
    if (v9)
    {
      [*(id *)(a1 + 32) playContentViaMusicPlayer:v10];
      goto LABEL_9;
    }
  }
  [*(id *)(a1 + 32) playContentViaMPCAssistant:v8 routeDescriptor:*(void *)(a1 + 40)];
LABEL_9:
}

- (void)initializeParameters
{
  v6.receiver = self;
  v6.super_class = (Class)WFPlayMusicAction;
  [(WFPlayMusicAction *)&v6 initializeParameters];
  id v3 = [(WFPlayMusicAction *)self parameterForKey:@"WFMediaItems"];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v4 = v3;
    }
    else {
      int v4 = 0;
    }
  }
  else
  {
    int v4 = 0;
  }
  id v5 = v4;

  [v5 setAction:self];
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFPlayMusicAction;
  id v2 = [(WFPlayMusicAction *)&v5 disabledOnPlatforms];
  id v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

@end