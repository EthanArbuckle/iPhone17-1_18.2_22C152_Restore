@interface WFAddToPlaylistAction
- (id)disabledOnPlatforms;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFAddToPlaylistAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFAddToPlaylistAction *)self parameterValueForKey:@"WFPlaylistName" ofClass:objc_opt_class()];
  v6 = WFPlaylistsMatchingDescriptor(v5);
  v7 = [v6 firstObject];
  if (v7 || ([v5 entireMusicLibrary] & 1) != 0)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __52__WFAddToPlaylistAction_runAsynchronouslyWithInput___block_invoke;
    v21[3] = &unk_264E5E9F8;
    id v22 = v7;
    v23 = self;
    WFAddContentToPlaylist(v22, v4, v21);
    v8 = v22;
  }
  else
  {
    v8 = WFLocalizedString(@"Playlist Not Found");
    v9 = [v5 playlistName];
    uint64_t v10 = [v9 length];

    v11 = NSString;
    if (v10)
    {
      v12 = WFLocalizedString(@"%1$@ failed because the playlist “%2$@” could not be found.");
      v13 = [(WFAddToPlaylistAction *)self localizedName];
      v14 = [v5 playlistName];
      v15 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v13, v14);
    }
    else
    {
      v12 = WFLocalizedString(@"%1$@ failed because no playlist was specified. Please choose a playlist.");
      v13 = [(WFAddToPlaylistAction *)self localizedName];
      v15 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v13);
    }

    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F870B8];
    uint64_t v18 = *MEMORY[0x263F08320];
    v24[0] = *MEMORY[0x263F08338];
    v24[1] = v18;
    v25[0] = v8;
    v25[1] = v15;
    v19 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    v20 = [v16 errorWithDomain:v17 code:5 userInfo:v19];

    [(WFAddToPlaylistAction *)self finishRunningWithError:v20];
  }
}

void __52__WFAddToPlaylistAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend(*(id *)(a1 + 32), "items", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        v11 = [*(id *)(a1 + 40) output];
        [v11 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 40) finishRunningWithError:v4];
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFAddToPlaylistAction;
  v2 = [(WFAddToPlaylistAction *)&v5 disabledOnPlatforms];
  v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

@end