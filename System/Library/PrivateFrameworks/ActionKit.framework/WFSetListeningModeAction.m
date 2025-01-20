@interface WFSetListeningModeAction
- (id)errorFromRoutePickerError:(id)a3;
- (id)errorUserInfoForRoutePickerErrorCode:(int64_t)a3;
- (id)routeDescriptor;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFSetListeningModeAction

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
      v6 = WFLocalizedString(@"Could Not Set Noise Control Mode on “%@”");
      v7 = [(WFSetListeningModeAction *)self routeDescriptor];
      v8 = [v7 routeName];
      v9 = objc_msgSend(v15, "localizedStringWithFormat:", v6, v8);
      v20[0] = v9;
      v19[1] = *MEMORY[0x263F08320];
      v10 = WFLocalizedString(@"It took too long to set the Noise Control mode on the specified device.");
      v20[1] = v10;
      v11 = NSDictionary;
      v12 = v20;
      v13 = v19;
    }
    else
    {
      v21[0] = *MEMORY[0x263F08338];
      v14 = NSString;
      v6 = WFLocalizedStringWithKey(@"Could Not Find “%@” (Listening Mode)", @"Could Not Find “%@”");
      v7 = [(WFSetListeningModeAction *)self routeDescriptor];
      v8 = [v7 routeName];
      v9 = objc_msgSend(v14, "localizedStringWithFormat:", v6, v8);
      v22[0] = v9;
      v21[1] = *MEMORY[0x263F08320];
      v10 = WFLocalizedString(@"Set Noise Control Mode failed because the device could not be found.");
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
    v6 = WFLocalizedString(@"Failed to Set Noise Control Mode on “%@”");
    v7 = [(WFSetListeningModeAction *)self routeDescriptor];
    v8 = [v7 routeName];
    v9 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v8, v17[0]);
    v18[0] = v9;
    v17[1] = *MEMORY[0x263F08320];
    v10 = WFLocalizedString(@"The Noise Control mode could not be set.");
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
    v11 = (void *)getMPAVRoutingControllerErrorDomainSymbolLoc_ptr_54784;
    uint64_t v21 = getMPAVRoutingControllerErrorDomainSymbolLoc_ptr_54784;
    if (!getMPAVRoutingControllerErrorDomainSymbolLoc_ptr_54784)
    {
      v12 = MediaPlayerLibrary_54786();
      v19[3] = (uint64_t)dlsym(v12, "MPAVRoutingControllerErrorDomain");
      getMPAVRoutingControllerErrorDomainSymbolLoc_ptr_54784 = v19[3];
      v11 = (void *)v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (!v11)
    {
      v16 = [MEMORY[0x263F08690] currentHandler];
      v17 = [NSString stringWithUTF8String:"NSString *getMPAVRoutingControllerErrorDomain(void)"];
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"WFSetListeningModeAction.m", 30, @"%s", dlerror());

      __break(1u);
      return result;
    }
    if ([v10 isEqualToString:*v11])
    {
      uint64_t v13 = [v4 code];

      if (v13 == 6)
      {
        id v14 = [MEMORY[0x263F087E8] userCancelledError];
LABEL_11:
        v9 = v14;
        goto LABEL_12;
      }
    }
    else
    {
    }
    id v14 = v4;
    goto LABEL_11;
  }
  v7 = -[WFSetListeningModeAction errorUserInfoForRoutePickerErrorCode:](self, "errorUserInfoForRoutePickerErrorCode:", [v4 code]);
  v8 = (void *)[v7 mutableCopy];
  [v8 setObject:v4 forKey:*MEMORY[0x263F08608]];
  v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:v8];

LABEL_12:
  return v9;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  id v4 = [(WFSetListeningModeAction *)self routeDescriptor];

  if (v4)
  {
    v5 = objc_opt_new();
    char v6 = [(WFSetListeningModeAction *)self routeDescriptor];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __55__WFSetListeningModeAction_runAsynchronouslyWithInput___block_invoke;
    v13[3] = &unk_264E5E878;
    v13[4] = self;
    id v14 = v5;
    id v7 = v5;
    [v7 findRouteMatchingDescriptor:v6 timeout:v13 completionHandler:15.0];
  }
  else
  {
    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F870B8];
    v15[0] = *MEMORY[0x263F08338];
    v10 = WFLocalizedString(@"Could Not Set Noise Control mode");
    v16[0] = v10;
    v15[1] = *MEMORY[0x263F08320];
    v11 = WFLocalizedString(@"Set Noise Control Mode failed because no route was selected.");
    v16[1] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    id v7 = [v8 errorWithDomain:v9 code:5 userInfo:v12];

    [(WFSetListeningModeAction *)self finishRunningWithError:v7];
  }
}

void __55__WFSetListeningModeAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v5)
  {
    v8 = [v7 parameterValueForKey:@"WFListeningMode" ofClass:objc_opt_class()];
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    uint64_t v9 = (void *)getMPAVOutputDeviceRouteClass_softClass_54807;
    uint64_t v19 = getMPAVOutputDeviceRouteClass_softClass_54807;
    if (!getMPAVOutputDeviceRouteClass_softClass_54807)
    {
      v15[0] = (id)MEMORY[0x263EF8330];
      v15[1] = (id)3221225472;
      void v15[2] = __getMPAVOutputDeviceRouteClass_block_invoke_54808;
      v15[3] = &unk_264E5EC88;
      v15[4] = &v16;
      __getMPAVOutputDeviceRouteClass_block_invoke_54808((uint64_t)v15);
      uint64_t v9 = (void *)v17[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v16, 8);
    if (objc_opt_isKindOfClass())
    {
      v15[0] = 0;
      [v5 logicalLeaderOutputDevice];
      WFAVOutputDeviceBluetoothListeningModeFromListeningMode(v8);
      id v11 = 0;
      if ((MRAVOutputDeviceSetCurrentBluetoothListeningMode() & 1) == 0) {
        id v11 = v15[0];
      }
      v12 = *(void **)(a1 + 32);
    }
    else
    {
      id v14 = *(void **)(a1 + 32);
      id v11 = [v14 errorFromRoutePickerError:v6];
      v12 = v14;
    }
    [v12 finishRunningWithError:v11];
  }
  else
  {
    uint64_t v13 = [*(id *)(a1 + 32) errorFromRoutePickerError:v6];
    [v7 finishRunningWithError:v13];
  }
}

- (id)routeDescriptor
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFSetListeningModeAction *)self parameterValueForKey:@"WFRoute" ofClass:v3];
}

- (void)initializeParameters
{
  v4.receiver = self;
  v4.super_class = (Class)WFSetListeningModeAction;
  [(WFSetListeningModeAction *)&v4 initializeParameters];
  uint64_t v3 = [(WFSetListeningModeAction *)self parameterForKey:@"WFListeningMode"];
  [v3 setAction:self];
}

@end