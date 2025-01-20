@interface WFSkipSongAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFSkipSongAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  v4 = [(WFSkipSongAction *)self parameterValueForKey:@"WFMediaRoute" ofClass:objc_opt_class()];
  if (v4)
  {
    v5 = [(WFSkipSongAction *)self definition];
    v6 = [v5 objectForKey:@"WFSkipSongActionMode"];

    v7 = [(WFSkipSongAction *)self parameterValueForKey:@"WFSkipBackBehavior" ofClass:objc_opt_class()];
    v8 = objc_alloc_init(WFMediaPlaybackController);
    if ([v4 isLocalDevice])
    {
      v9 = 0;
    }
    else
    {
      v10 = [v4 routeUID];

      if (!v10)
      {
        v9 = WFMediaRouteDescriptorIsMissingRouteUIDError();
        [(WFSkipSongAction *)self finishRunningWithError:v9];
LABEL_15:

        goto LABEL_16;
      }
      v11 = [v4 routeUID];
      v14[0] = v11;
      v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__WFSkipSongAction_runAsynchronouslyWithInput___block_invoke;
    aBlock[3] = &unk_264E5EBC8;
    aBlock[4] = self;
    v12 = _Block_copy(aBlock);
    if ([v6 isEqualToString:@"Forward"])
    {
      [(WFMediaPlaybackController *)v8 goToNextTrackOnDevicesWithUIDs:v9 completion:v12];
    }
    else if ([v6 isEqualToString:@"Back"])
    {
      if ([v7 isEqualToString:@"Beginning"]) {
        [(WFMediaPlaybackController *)v8 goToBeginningOfTrackOnDevicesWithUIDs:v9 completion:v12];
      }
      else {
        [(WFMediaPlaybackController *)v8 goToPreviousTrackOnDevicesWithUIDs:v9 completion:v12];
      }
    }

    goto LABEL_15;
  }
  [(WFSkipSongAction *)self finishRunningWithError:0];
LABEL_16:
}

void __47__WFSkipSongAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (v3)
  {
    v4 = [v3 userInfo];
    v5 = (void *)[v4 mutableCopy];

    v6 = WFLocalizedString(@"Unable to Skip Song");
    [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F08338]];

    v7 = [v12 localizedDescription];

    if (!v7)
    {
      v8 = WFLocalizedString(@"An unknown error occurred.");
      [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x263F08320]];
    }
    v9 = (void *)MEMORY[0x263F087E8];
    v10 = [v12 domain];
    v11 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v12, "code"), v5);
  }
  else
  {
    v11 = 0;
  }
  [*(id *)(a1 + 32) finishRunningWithError:v11];
}

@end