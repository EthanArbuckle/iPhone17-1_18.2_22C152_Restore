@interface WFSeekAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFSeekAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  v4 = [(WFSeekAction *)self parameterValueForKey:@"WFMediaRoute" ofClass:objc_opt_class()];
  if (v4)
  {
    v5 = [(WFSeekAction *)self parameterValueForKey:@"WFSeekBehavior" ofClass:objc_opt_class()];
    v6 = [(WFSeekAction *)self parameterValueForKey:@"WFTimeInterval" ofClass:objc_opt_class()];
    v7 = (void *)MEMORY[0x263F86AD8];
    v8 = [v6 unitString];
    uint64_t v9 = [v7 calendarUnitFromUnitString:v8];

    v10 = [MEMORY[0x263EFF910] date];
    v11 = [MEMORY[0x263EFF8F0] currentCalendar];
    v12 = [v6 magnitude];
    v13 = objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", v9, objc_msgSend(v12, "integerValue"), v10, 0);

    [v13 timeIntervalSinceDate:v10];
    double v15 = v14;
    v16 = objc_alloc_init(WFMediaPlaybackController);
    v17 = 0;
    if (([v4 isLocalDevice] & 1) == 0)
    {
      v18 = [v4 routeUID];

      if (!v18)
      {
        v17 = WFMediaRouteDescriptorIsMissingRouteUIDError();
        [(WFSeekAction *)self finishRunningWithError:v17];
LABEL_12:

        goto LABEL_13;
      }
      v19 = [v4 routeUID];
      v22[0] = v19;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__WFSeekAction_runAsynchronouslyWithInput___block_invoke;
    aBlock[3] = &unk_264E5EBC8;
    aBlock[4] = self;
    v20 = _Block_copy(aBlock);
    if ([v5 isEqualToString:@"Forward By"])
    {
      [(WFMediaPlaybackController *)v16 skipForwardOnDevicesWithUIDs:v17 interval:v20 completion:v15];
    }
    else if ([v5 isEqualToString:@"Backward By"])
    {
      [(WFMediaPlaybackController *)v16 skipBackwardOnDevicesWithUIDs:v17 interval:v20 completion:v15];
    }
    else
    {
      [(WFMediaPlaybackController *)v16 skipToPositionOnDevicesWithUIDs:v17 interval:v20 completion:v15];
    }

    goto LABEL_12;
  }
  [(WFSeekAction *)self finishRunningWithError:0];
LABEL_13:
}

void __43__WFSeekAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (v3)
  {
    v4 = [v3 userInfo];
    v5 = (void *)[v4 mutableCopy];

    v6 = WFLocalizedString(@"Unable to Seek");
    [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F08338]];

    v7 = [v12 localizedDescription];

    if (!v7)
    {
      v8 = WFLocalizedString(@"An unknown error occurred.");
      [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x263F08320]];
    }
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
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