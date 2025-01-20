@interface WFGetPodcastsFromLibraryAction
- (id)origin;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetPodcastsFromLibraryAction

- (id)origin
{
  return (id)[MEMORY[0x263F33708] locationWithSystemAppBundleIdentifier:*MEMORY[0x263F85560]];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __61__WFGetPodcastsFromLibraryAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_264E5EEE8;
  v3[4] = self;
  +[WFPodcastUtilities getPodcastsFromLibraryFetchingDetailsFromServer:1 withCompletion:v3];
}

void __61__WFGetPodcastsFromLibraryAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__WFGetPodcastsFromLibraryAction_runAsynchronouslyWithInput___block_invoke_2;
  v8[3] = &unk_264E5BE60;
  v8[4] = *(void *)(a1 + 32);
  id v5 = a3;
  v6 = objc_msgSend(a2, "if_map:", v8);
  v7 = [*(id *)(a1 + 32) output];
  [v7 addItems:v6];

  [*(id *)(a1 + 32) finishRunningWithError:v5];
}

id __61__WFGetPodcastsFromLibraryAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F337C8];
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 origin];
  v6 = [v2 itemWithObject:v4 origin:v5 disclosureLevel:1];

  return v6;
}

@end