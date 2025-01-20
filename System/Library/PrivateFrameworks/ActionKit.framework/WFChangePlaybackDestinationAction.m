@interface WFChangePlaybackDestinationAction
- (id)errorFromRoutePickerError:(id)a3;
- (id)errorUserInfoForRoutePickerErrorCode:(int64_t)a3;
- (id)routeDescriptor;
- (int64_t)operation;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFChangePlaybackDestinationAction

- (id)errorUserInfoForRoutePickerErrorCode:(int64_t)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  if ((unint64_t)(a3 - 4) >= 5)
  {
    if ((unint64_t)a3 >= 3)
    {
      if (a3 != 3) {
        goto LABEL_8;
      }
      v19[0] = *MEMORY[0x263F08338];
      v15 = NSString;
      v6 = WFLocalizedString(@"Could Not Set Playback Destination to “%@”");
      v7 = [(WFChangePlaybackDestinationAction *)self routeDescriptor];
      v8 = [v7 routeName];
      v9 = objc_msgSend(v15, "localizedStringWithFormat:", v6, v8);
      v20[0] = v9;
      v19[1] = *MEMORY[0x263F08320];
      v10 = WFLocalizedString(@"It took too long to set the destination to the specified device.");
      v20[1] = v10;
      v11 = NSDictionary;
      v12 = v20;
      v13 = v19;
    }
    else
    {
      v21[0] = *MEMORY[0x263F08338];
      v14 = NSString;
      v6 = WFLocalizedString(@"Could Not Find “%@”");
      v7 = [(WFChangePlaybackDestinationAction *)self routeDescriptor];
      v8 = [v7 routeName];
      v9 = objc_msgSend(v14, "localizedStringWithFormat:", v6, v8);
      v22[0] = v9;
      v21[1] = *MEMORY[0x263F08320];
      v10 = WFLocalizedString(@"Set Playback Destination failed because the device could not be found.");
      v22[1] = v10;
      v11 = NSDictionary;
      v12 = v22;
      v13 = v21;
    }
  }
  else
  {
    v17[0] = *MEMORY[0x263F08338];
    v5 = NSString;
    v6 = WFLocalizedString(@"Failed to Set Playback Destination to “%@”");
    v7 = [(WFChangePlaybackDestinationAction *)self routeDescriptor];
    v8 = [v7 routeName];
    v9 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v8, v17[0]);
    v18[0] = v9;
    v17[1] = *MEMORY[0x263F08320];
    v10 = WFLocalizedString(@"The playback destination could not be set.");
    v18[1] = v10;
    v11 = NSDictionary;
    v12 = v18;
    v13 = v17;
  }
  v3 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:2];

LABEL_8:
  return v3;
}

- (id)errorFromRoutePickerError:(id)a3
{
  id v4 = a3;
  v5 = [v4 domain];
  char v6 = [v5 isEqualToString:@"WFMediaRoutePickerErrorDomain"];

  if ((v6 & 1) == 0)
  {
    v10 = [v4 domain];
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    v11 = (void *)getMPAVRoutingControllerErrorDomainSymbolLoc_ptr;
    uint64_t v21 = getMPAVRoutingControllerErrorDomainSymbolLoc_ptr;
    if (!getMPAVRoutingControllerErrorDomainSymbolLoc_ptr)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      void v17[2] = __getMPAVRoutingControllerErrorDomainSymbolLoc_block_invoke;
      v17[3] = &unk_264E5EC88;
      v17[4] = &v18;
      __getMPAVRoutingControllerErrorDomainSymbolLoc_block_invoke(v17);
      v11 = (void *)v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (!v11)
    {
      v15 = [MEMORY[0x263F08690] currentHandler];
      v16 = [NSString stringWithUTF8String:"NSString *getMPAVRoutingControllerErrorDomain(void)"];
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"WFChangePlaybackDestinationAction.m", 18, @"%s", dlerror());

      __break(1u);
      return result;
    }
    if ([v10 isEqualToString:*v11])
    {
      uint64_t v12 = [v4 code];

      if (v12 == 6)
      {
        id v13 = [MEMORY[0x263F087E8] userCancelledError];
LABEL_11:
        v9 = v13;
        goto LABEL_12;
      }
    }
    else
    {
    }
    id v13 = v4;
    goto LABEL_11;
  }
  v7 = -[WFChangePlaybackDestinationAction errorUserInfoForRoutePickerErrorCode:](self, "errorUserInfoForRoutePickerErrorCode:", [v4 code]);
  v8 = (void *)[v7 mutableCopy];
  [v8 setObject:v4 forKey:*MEMORY[0x263F08608]];
  v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:v8];

LABEL_12:
  return v9;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = objc_opt_new();
  v5 = [(WFChangePlaybackDestinationAction *)self routeDescriptor];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__WFChangePlaybackDestinationAction_runAsynchronouslyWithInput___block_invoke;
  v7[3] = &unk_264E5E878;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v6 findRouteMatchingDescriptor:v5 timeout:v7 completionHandler:15.0];
}

void __64__WFChangePlaybackDestinationAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = [*(id *)(a1 + 32) operation];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__WFChangePlaybackDestinationAction_runAsynchronouslyWithInput___block_invoke_2;
    v10[3] = &unk_264E5EBC8;
    v10[4] = *(void *)(a1 + 32);
    [v6 selectRoute:v5 operation:v7 timeout:v10 completionHandler:20.0];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    v9 = [v8 errorFromRoutePickerError:a3];
    [v8 finishRunningWithError:v9];
  }
}

void __64__WFChangePlaybackDestinationAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 errorFromRoutePickerError:a2];
  [v2 finishRunningWithError:v3];
}

- (int64_t)operation
{
  v2 = [(WFChangePlaybackDestinationAction *)self parameterValueForKey:@"WFMediaRouteOperation" ofClass:objc_opt_class()];
  if ([v2 isEqualToString:@"Add"])
  {
    int64_t v3 = 1;
  }
  else if ([v2 isEqualToString:@"Remove"])
  {
    int64_t v3 = 2;
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (id)routeDescriptor
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFChangePlaybackDestinationAction *)self parameterValueForKey:@"WFMediaRoute" ofClass:v3];
}

@end