@interface WFHandOffPlaybackAction
- (id)destinationRouteDescriptor;
- (id)errorFromRoutePickerError:(id)a3;
- (id)errorUserInfoForRoutePickerErrorCode:(int64_t)a3 involvedRouteName:(id)a4;
- (id)invokingHomePodRouteDescriptor;
- (id)localEndpoint;
- (id)sourceRouteDescriptor;
- (void)askForUserSpecificationOfMissingRouteWithRoutePicker:(id)a3 completionBlock:(id)a4;
- (void)findInvokingHomePodEndpointWithRoutePicker:(id)a3 completionBlock:(id)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)runWhenInvokedThroughHomePodWithSpecifiedDescriptor:(id)a3 picker:(id)a4;
- (void)runWhenInvokedThroughLocalDeviceWithSpecifiedDescriptor:(id)a3 picker:(id)a4;
- (void)runWithSourceRouteUID:(id)a3 destinationRouteUID:(id)a4 routePicker:(id)a5;
@end

@implementation WFHandOffPlaybackAction

- (id)errorUserInfoForRoutePickerErrorCode:(int64_t)a3 involvedRouteName:(id)a4
{
  v29[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (!v6)
  {
    WFLocalizedString(@"Unknown");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
      v28[0] = *MEMORY[0x263F08338];
      v15 = NSString;
      v8 = WFLocalizedString(@"Could Not Find “%@”");
      v9 = objc_msgSend(v15, "localizedStringWithFormat:", v8, v6);
      v29[0] = v9;
      v28[1] = *MEMORY[0x263F08320];
      v10 = WFLocalizedString(@"Hand Off Playback failed because the specified device could not be found.");
      v29[1] = v10;
      v16 = NSDictionary;
      v17 = v29;
      v18 = v28;
      goto LABEL_8;
    case 3:
    case 4:
    case 6:
    case 7:
      v22[0] = *MEMORY[0x263F08338];
      v7 = NSString;
      v8 = WFLocalizedString(@"Failed to Hand Off Music Between “%@” and “%@”");
      v9 = [(WFHandOffPlaybackAction *)self sourceRouteDescriptor];
      v10 = [v9 routeName];
      v11 = [(WFHandOffPlaybackAction *)self destinationRouteDescriptor];
      v12 = [v11 routeName];
      v13 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v10, v12);
      v23[0] = v13;
      v22[1] = *MEMORY[0x263F08320];
      v14 = WFLocalizedString(@"Couldn't hand off music between specified devices.");
      v23[1] = v14;
      self = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

      goto LABEL_9;
    case 5:
      v26[0] = *MEMORY[0x263F08338];
      v19 = NSString;
      v8 = WFLocalizedString(@"Could Not Connect To “%@”");
      v9 = objc_msgSend(v19, "localizedStringWithFormat:", v8, v6);
      v27[0] = v9;
      v26[1] = *MEMORY[0x263F08320];
      v10 = WFLocalizedString(@"It took too long to connect to the specified device.");
      v27[1] = v10;
      v16 = NSDictionary;
      v17 = v27;
      v18 = v26;
      goto LABEL_8;
    case 8:
      v24[0] = *MEMORY[0x263F08338];
      v20 = NSString;
      v8 = WFLocalizedString(@"Device “%@” Is Not Playing Music");
      v9 = objc_msgSend(v20, "localizedStringWithFormat:", v8, v6);
      v25[0] = v9;
      v24[1] = *MEMORY[0x263F08320];
      v10 = WFLocalizedString(@"The specified device is not playing any music.");
      v25[1] = v10;
      v16 = NSDictionary;
      v17 = v25;
      v18 = v24;
LABEL_8:
      self = [v16 dictionaryWithObjects:v17 forKeys:v18 count:2];
LABEL_9:

      break;
    default:
      break;
  }

  return self;
}

- (id)errorFromRoutePickerError:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 domain];
    char v7 = [v6 isEqualToString:@"WFMediaRoutePickerErrorDomain"];

    if (v7)
    {
      v8 = [v5 userInfo];
      v9 = [v8 objectForKeyedSubscript:@"InvolvedMediaRoute"];

      v10 = -[WFHandOffPlaybackAction errorUserInfoForRoutePickerErrorCode:involvedRouteName:](self, "errorUserInfoForRoutePickerErrorCode:involvedRouteName:", [v5 code], v9);
      v11 = (void *)[v10 mutableCopy];
      [v11 setObject:v5 forKey:*MEMORY[0x263F08608]];
      id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:v11];
    }
    else
    {
      id v12 = v5;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)destinationRouteDescriptor
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFHandOffPlaybackAction *)self parameterValueForKey:@"WFDestinationMediaRoute" ofClass:v3];
}

- (id)sourceRouteDescriptor
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFHandOffPlaybackAction *)self parameterValueForKey:@"WFSourceMediaRoute" ofClass:v3];
}

- (void)askForUserSpecificationOfMissingRouteWithRoutePicker:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = [(WFHandOffPlaybackAction *)self sourceRouteDescriptor];
  if (v6) {
    char v7 = @"WFDestinationMediaRoute";
  }
  else {
    char v7 = @"WFSourceMediaRoute";
  }
  v8 = [(WFHandOffPlaybackAction *)self parameterForKey:v7];

  v9 = [MEMORY[0x263EFF9D8] orderedSetWithObject:v8];
  v10 = dispatch_get_global_queue(0, 0);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __96__WFHandOffPlaybackAction_askForUserSpecificationOfMissingRouteWithRoutePicker_completionBlock___block_invoke;
  v13[3] = &unk_264E55EB0;
  id v14 = v8;
  id v15 = v5;
  id v11 = v5;
  id v12 = v8;
  [(WFHandOffPlaybackAction *)self askForValuesOfParameters:v9 withDefaultStates:MEMORY[0x263EFFA78] prompts:MEMORY[0x263EFFA78] input:0 workQueue:v10 completionHandler:v13];
}

void __96__WFHandOffPlaybackAction_askForUserSpecificationOfMissingRouteWithRoutePicker_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  char v7 = *(void **)(a1 + 32);
  id v8 = a2;
  v9 = [v7 key];
  v10 = [v8 objectForKeyedSubscript:v9];

  uint64_t v11 = objc_opt_class();
  id v12 = v10;
  if (v12 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = getWFGeneralLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v20 = 136315906;
      v21 = "WFEnforceClass";
      __int16 v22 = 2114;
      id v23 = v12;
      __int16 v24 = 2114;
      id v25 = (id)objc_opt_class();
      __int16 v26 = 2114;
      uint64_t v27 = v11;
      id v15 = v25;
      _os_log_impl(&dword_23C364000, v14, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v20, 0x2Au);
    }
    id v13 = 0;
  }
  else
  {
    id v13 = v12;
  }

  if (v13) {
    id v19 = v13;
  }
  else {
    id v19 = 0;
  }
  (*(void (**)(void, id, id, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v19, v6, v16, v17, v18);
}

- (void)findInvokingHomePodEndpointWithRoutePicker:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFHandOffPlaybackAction *)self invokingHomePodRouteDescriptor];
  if (v8)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __86__WFHandOffPlaybackAction_findInvokingHomePodEndpointWithRoutePicker_completionBlock___block_invoke;
    v9[3] = &unk_264E55E88;
    v9[4] = self;
    id v10 = v7;
    [v6 findHandoffRouteMatchingDescriptor:v8 timeout:v9 completionHandler:5.0];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __86__WFHandOffPlaybackAction_findInvokingHomePodEndpointWithRoutePicker_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 errorFromRoutePickerError:a3];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);
}

- (id)localEndpoint
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getMPAVEndpointRouteClass_softClass;
  uint64_t v10 = getMPAVEndpointRouteClass_softClass;
  if (!getMPAVEndpointRouteClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getMPAVEndpointRouteClass_block_invoke;
    v6[3] = &unk_264E5EC88;
    v6[4] = &v7;
    __getMPAVEndpointRouteClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  uint64_t v3 = v2;
  _Block_object_dispose(&v7, 8);
  uint64_t v4 = (void *)[[v3 alloc] initWithEndpoint:MRAVEndpointGetLocalEndpoint()];
  return v4;
}

- (id)invokingHomePodRouteDescriptor
{
  uint64_t v3 = [(WFHandOffPlaybackAction *)self userInterface];
  if (![v3 isRunningWithSiriUI])
  {
    id v8 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = [(WFHandOffPlaybackAction *)self userInterface];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WFHandOffPlaybackAction *)self userInterface];
    uint64_t v7 = [v6 airPlayRouteIDs];
    uint64_t v3 = [v7 firstObject];

    if (v3)
    {
      id v8 = [[WFMediaRouteDescriptor alloc] initWithRouteUID:v3 groupUID:0 routeName:0 isLocalDevice:0];
LABEL_6:

      goto LABEL_8;
    }
  }
  id v8 = 0;
LABEL_8:
  return v8;
}

- (void)runWithSourceRouteUID:(id)a3 destinationRouteUID:(id)a4 routePicker:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __81__WFHandOffPlaybackAction_runWithSourceRouteUID_destinationRouteUID_routePicker___block_invoke;
  v5[3] = &unk_264E5EBC8;
  v5[4] = self;
  [a5 handOffFromSourceUID:a3 toDestinationUID:a4 timeout:v5 completionHandler:20.0];
}

uint64_t __81__WFHandOffPlaybackAction_runWithSourceRouteUID_destinationRouteUID_routePicker___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRunningWithError:0];
}

- (void)runWhenInvokedThroughLocalDeviceWithSpecifiedDescriptor:(id)a3 picker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFHandOffPlaybackAction *)self sourceRouteDescriptor];

  if ([v6 isLocalDevice])
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __90__WFHandOffPlaybackAction_runWhenInvokedThroughLocalDeviceWithSpecifiedDescriptor_picker___block_invoke;
    v14[3] = &unk_264E55E60;
    v14[4] = self;
    BOOL v17 = v8 == 0;
    id v15 = v6;
    id v16 = v7;
    [(WFHandOffPlaybackAction *)self askForUserSpecificationOfMissingRouteWithRoutePicker:v16 completionBlock:v14];
  }
  else
  {
    if (v8)
    {
      uint64_t v9 = [v6 routeUID];
      uint64_t v10 = [(WFHandOffPlaybackAction *)self localEndpoint];
      uint64_t v11 = [v10 routeUID];
      id v12 = self;
      id v13 = v9;
    }
    else
    {
      uint64_t v9 = [(WFHandOffPlaybackAction *)self localEndpoint];
      uint64_t v10 = [v9 routeUID];
      uint64_t v11 = [v6 routeUID];
      id v12 = self;
      id v13 = v10;
    }
    [(WFHandOffPlaybackAction *)v12 runWithSourceRouteUID:v13 destinationRouteUID:v11 routePicker:v7];
  }
}

void __90__WFHandOffPlaybackAction_runWhenInvokedThroughLocalDeviceWithSpecifiedDescriptor_picker___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v11)
  {
    if (*(unsigned char *)(a1 + 56)) {
      id v7 = v11;
    }
    else {
      id v7 = *(void **)(a1 + 40);
    }
    id v8 = [v7 routeUID];
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v9 = *(void **)(a1 + 40);
    }
    else {
      uint64_t v9 = v11;
    }
    uint64_t v10 = [v9 routeUID];
    [v6 runWithSourceRouteUID:v8 destinationRouteUID:v10 routePicker:*(void *)(a1 + 48)];
  }
  else
  {
    [v6 finishRunningWithError:v5];
  }
}

- (void)runWhenInvokedThroughHomePodWithSpecifiedDescriptor:(id)a3 picker:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [(WFHandOffPlaybackAction *)self sourceRouteDescriptor];

  id v8 = [(WFHandOffPlaybackAction *)self invokingHomePodRouteDescriptor];
  if ([v15 isEqualInRouteUIDs:v8])
  {
    if (v7)
    {
      uint64_t v9 = [v15 routeUID];
      uint64_t v10 = [(WFHandOffPlaybackAction *)self localEndpoint];
      id v11 = [v10 routeUID];
      id v12 = self;
      id v13 = v9;
    }
    else
    {
      uint64_t v9 = [(WFHandOffPlaybackAction *)self localEndpoint];
      uint64_t v10 = [v9 routeUID];
      id v11 = [v15 routeUID];
      id v12 = self;
      id v13 = v10;
    }
    [(WFHandOffPlaybackAction *)v12 runWithSourceRouteUID:v13 destinationRouteUID:v11 routePicker:v6];
  }
  else
  {
    if (!v8)
    {
      [(WFHandOffPlaybackAction *)self finishRunningWithError:0];
      goto LABEL_13;
    }
    if (v7)
    {
      uint64_t v9 = [v15 routeUID];
      id v14 = v8;
    }
    else
    {
      uint64_t v9 = [v8 routeUID];
      id v14 = v15;
    }
    uint64_t v10 = [v14 routeUID];
    [(WFHandOffPlaybackAction *)self runWithSourceRouteUID:v9 destinationRouteUID:v10 routePicker:v6];
  }

LABEL_13:
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  uint64_t v4 = [[WFMediaRoutePicker alloc] initWithRouteType:2];
  uint64_t v5 = [(WFHandOffPlaybackAction *)self sourceRouteDescriptor];
  if (v5
    && (id v6 = (void *)v5,
        [(WFHandOffPlaybackAction *)self destinationRouteDescriptor],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    id v8 = [(WFHandOffPlaybackAction *)self sourceRouteDescriptor];
    uint64_t v9 = [v8 routeUID];
    uint64_t v10 = [(WFHandOffPlaybackAction *)self destinationRouteDescriptor];
    id v11 = [v10 routeUID];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __54__WFHandOffPlaybackAction_runAsynchronouslyWithInput___block_invoke;
    v18[3] = &unk_264E5EBC8;
    v18[4] = self;
    [(WFMediaRoutePicker *)v4 handOffFromSourceUID:v9 toDestinationUID:v11 timeout:v18 completionHandler:20.0];
  }
  else
  {
    id v12 = [(WFHandOffPlaybackAction *)self sourceRouteDescriptor];
    if (v12)
    {
    }
    else
    {
      id v13 = [(WFHandOffPlaybackAction *)self destinationRouteDescriptor];

      if (!v13)
      {
        [(WFHandOffPlaybackAction *)self finishRunningWithError:0];
        goto LABEL_14;
      }
    }
    id v14 = [(WFHandOffPlaybackAction *)self sourceRouteDescriptor];
    id v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [(WFHandOffPlaybackAction *)self destinationRouteDescriptor];
    }
    id v8 = v16;

    BOOL v17 = [(WFHandOffPlaybackAction *)self invokingHomePodRouteDescriptor];

    if (v17) {
      [(WFHandOffPlaybackAction *)self runWhenInvokedThroughHomePodWithSpecifiedDescriptor:v8 picker:v4];
    }
    else {
      [(WFHandOffPlaybackAction *)self runWhenInvokedThroughLocalDeviceWithSpecifiedDescriptor:v8 picker:v4];
    }
  }

LABEL_14:
}

uint64_t __54__WFHandOffPlaybackAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRunningWithError:0];
}

@end