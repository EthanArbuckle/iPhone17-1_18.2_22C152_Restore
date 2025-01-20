@interface WFSubscribeToPodcastAction
- (id)contentNotFoundError;
- (id)errorSubscribingToPodcast:(unsigned int)a3;
- (id)genericSubscribeFailedError;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)subscribeToPodcast:(id)a3 completion:(id)a4;
@end

@implementation WFSubscribeToPodcastAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to subscribe to a podcast with %2$@?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to subscribe to a podcast?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(WFSubscribeToPodcastAction *)self input];
  v7 = v4;
  id v6 = v4;
  WFGetContentLocationFromURLActionInput();
}

void __73__WFSubscribeToPodcastAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
  else
  {
    id v5 = [MEMORY[0x263F33708] locationWithSystemAppBundleIdentifier:*MEMORY[0x263F85560] promptingBehaviour:2];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
}

- (id)errorSubscribingToPodcast:(unsigned int)a3
{
  if (a3)
  {
    if (a3 == 1) {
      [(WFSubscribeToPodcastAction *)self contentNotFoundError];
    }
    else {
    uint64_t v4 = [(WFSubscribeToPodcastAction *)self genericSubscribeFailedError];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)genericSubscribeFailedError
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = WFLocalizedString(@"Unable to Follow");
  uint64_t v3 = WFLocalizedString(@"Unable to follow podcast because an unknown error occurred.");
  uint64_t v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F870B8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v10[0] = *MEMORY[0x263F08338];
  v10[1] = v6;
  v11[0] = v2;
  v11[1] = v3;
  v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  id v8 = [v4 errorWithDomain:v5 code:5 userInfo:v7];

  return v8;
}

- (id)contentNotFoundError
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = WFLocalizedString(@"Podcast Not Found");
  uint64_t v3 = WFLocalizedString(@"The specified podcast could not be found.");
  uint64_t v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F870B8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v10[0] = *MEMORY[0x263F08338];
  v10[1] = v6;
  v11[0] = v2;
  v11[1] = v3;
  v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  id v8 = [v4 errorWithDomain:v5 code:5 userInfo:v7];

  return v8;
}

- (void)subscribeToPodcast:(id)a3 completion:(id)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = @"podcastFeedUrl";
    v7 = [v5 URL];
    id v8 = [v7 absoluteString];
    v20[0] = v8;
    v9 = NSDictionary;
    v10 = (void **)v20;
    v11 = &v19;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v12 = 0;
      goto LABEL_7;
    }
    v17 = @"storeCollectionId";
    v7 = [v5 object];
    id v8 = [v7 identifier];
    v18 = v8;
    v9 = NSDictionary;
    v10 = &v18;
    v11 = &v17;
  }
  uint64_t v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];

LABEL_7:
  v13 = +[WFPodcastUtilities generatePlaybackQueueURL:@"subscribe" withQueryDictionary:v12];
  v16 = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];

  +[WFPodcastUtilities createPlaybackQueueWithURLs:v14 setImmediatePlayback:0];
  +[WFPodcastUtilities createLocalPlayerPathWithPlayerID:@"PodcastsFollowProxyPlayer"];
  id v15 = v6;
  MRMediaRemoteSetAppPlaybackQueueForPlayer();
}

void __60__WFSubscribeToPodcastAction_subscribeToPodcast_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  MRSystemAppPlaybackQueueDestroy();
  id v7 = [a3 firstObject];
  id v5 = objc_msgSend(*(id *)(a1 + 32), "errorSubscribingToPodcast:", objc_msgSend(v7, "unsignedIntValue"));
  id v6 = *(const void **)(a1 + 56);
  if (v6) {
    CFRelease(v6);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__WFSubscribeToPodcastAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClasses:v5 completionHandler:v6];
}

void __57__WFSubscribeToPodcastAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    id v5 = *(void **)(a1 + 32);
    [v5 finishRunningWithError:a4];
  }
  else
  {
    id v6 = [a2 items];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __57__WFSubscribeToPodcastAction_runAsynchronouslyWithInput___block_invoke_2;
    v8[3] = &unk_264E5CA28;
    uint64_t v9 = *(void *)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __57__WFSubscribeToPodcastAction_runAsynchronouslyWithInput___block_invoke_4;
    void v7[3] = &unk_264E5E8E8;
    v7[4] = v9;
    objc_msgSend(v6, "if_enumerateAsynchronouslyInSequence:completionHandler:", v8, v7);
  }
}

void __57__WFSubscribeToPodcastAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__WFSubscribeToPodcastAction_runAsynchronouslyWithInput___block_invoke_3;
  v9[3] = &unk_264E5CA00;
  id v10 = v6;
  id v8 = v6;
  [v7 subscribeToPodcast:a2 completion:v9];
}

uint64_t __57__WFSubscribeToPodcastAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

uint64_t __57__WFSubscribeToPodcastAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end