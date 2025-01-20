@interface WFPlayPauseAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFPlayPauseAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  v4 = [(WFPlayPauseAction *)self parameterValueForKey:@"WFMediaRoute" ofClass:objc_opt_class()];
  v5 = v4;
  if (v4)
  {
    if ([v4 isLocalDevice])
    {
      v6 = 0;
    }
    else
    {
      v7 = [v5 routeUID];

      if (!v7)
      {
        v6 = WFMediaRouteDescriptorIsMissingRouteUIDError();
        [(WFPlayPauseAction *)self finishRunningWithError:v6];
LABEL_14:

        goto LABEL_15;
      }
      v8 = [v5 routeUID];
      v13[0] = v8;
      v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    }
    v9 = objc_alloc_init(WFMediaPlaybackController);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__WFPlayPauseAction_runAsynchronouslyWithInput___block_invoke;
    aBlock[3] = &unk_264E5EBC8;
    aBlock[4] = self;
    v10 = _Block_copy(aBlock);
    v11 = [(WFPlayPauseAction *)self parameterValueForKey:@"WFPlayPauseBehavior" ofClass:objc_opt_class()];
    if ([v11 isEqualToString:@"Play/Pause"])
    {
      [(WFMediaPlaybackController *)v9 playPauseOnDevicesWithUIDs:v6 completion:v10];
    }
    else if ([v11 isEqualToString:@"Play"])
    {
      [(WFMediaPlaybackController *)v9 playOnDevicesWithUIDs:v6 completion:v10];
    }
    else if ([v11 isEqualToString:@"Pause"])
    {
      [(WFMediaPlaybackController *)v9 pauseOnDevicesWithUIDs:v6 completion:v10];
    }

    goto LABEL_14;
  }
  [(WFPlayPauseAction *)self finishRunningWithError:0];
LABEL_15:
}

void __48__WFPlayPauseAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  v3 = [v14 domain];
  if ([v3 isEqualToString:@"WFMediaPlaybackControllerErrorDomain"])
  {
    uint64_t v4 = [v14 code];

    v5 = v14;
    if (v4 == 1)
    {
      v6 = 0;
      v7 = v14;
LABEL_9:

      goto LABEL_11;
    }
  }
  else
  {

    v5 = v14;
  }
  if (v5)
  {
    v8 = [v5 userInfo];
    v7 = (void *)[v8 mutableCopy];

    v9 = WFLocalizedString(@"Unable to Play/Pause");
    [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x263F08338]];

    v10 = [v14 localizedDescription];

    if (!v10)
    {
      v11 = WFLocalizedString(@"An unknown error occurred.");
      [v7 setObject:v11 forKeyedSubscript:*MEMORY[0x263F08320]];
    }
    v12 = (void *)MEMORY[0x263F087E8];
    v13 = [v14 domain];
    v6 = objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, objc_msgSend(v14, "code"), v7);

    goto LABEL_9;
  }
  v6 = 0;
LABEL_11:
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

@end