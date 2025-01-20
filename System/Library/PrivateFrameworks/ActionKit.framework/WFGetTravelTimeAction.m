@interface WFGetTravelTimeAction
+ (unint64_t)transportTypeFromString:(id)a3;
- (BOOL)isStartOrDestinationCurrentLocation;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (id)outputContentClasses;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)getMapItemFromCollection:(id)a3 parameterKey:(id)a4 completionHandler:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetTravelTimeAction

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFGetTravelTimeAction;
  BOOL v7 = [(WFGetTravelTimeAction *)&v9 setParameterState:a3 forKey:v6];
  if (v7 && [v6 isEqualToString:@"WFGetDirectionsActionMode"]) {
    [(WFGetTravelTimeAction *)self outputDetailsUpdated];
  }

  return v7;
}

- (id)outputContentClasses
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [(WFGetTravelTimeAction *)self parameterStateForKey:@"WFGetDirectionsActionMode"];
  v3 = [v2 value];
  int v4 = [v3 isEqualToString:@"Transit"];

  if (v4)
  {
    v9[0] = objc_opt_class();
    v5 = v9;
  }
  else
  {
    uint64_t v8 = objc_opt_class();
    v5 = &v8;
  }
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v6;
}

- (BOOL)isStartOrDestinationCurrentLocation
{
  v3 = [(WFGetTravelTimeAction *)self parameterStateForKey:@"WFGetDirectionsCustomLocation"];
  int v4 = [(WFGetTravelTimeAction *)self parameterStateForKey:@"WFDestination"];
  v5 = [v3 value];
  if ([v5 isCurrentLocation])
  {
    char v6 = 1;
  }
  else
  {
    BOOL v7 = [v4 value];
    char v6 = [v7 isCurrentLocation];
  }
  return v6;
}

- (void)getMapItemFromCollection:(id)a3 parameterKey:(id)a4 completionHandler:(id)a5
{
  id v13 = a3;
  uint64_t v8 = (void (**)(id, void *, void))a5;
  objc_super v9 = [(WFGetTravelTimeAction *)self parameterStateForKey:a4];
  v10 = [v9 value];
  int v11 = [v10 isCurrentLocation];

  if (v11)
  {
    v12 = [getMKMapItemClass_40953() mapItemForCurrentLocation];
    v8[2](v8, v12, 0);
  }
  else
  {
    v12 = [(WFGetTravelTimeAction *)self localizedName];
    WFGetMapItemFromContentCollection(v13, v12, v8);
  }
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [(WFGetTravelTimeAction *)self isStartOrDestinationCurrentLocation];
    objc_super v9 = [MEMORY[0x263F337E8] locationLocation];
    v10 = [(WFGetTravelTimeAction *)self output];
    int v11 = (void *)MEMORY[0x263F337C8];
    v12 = [MEMORY[0x263F337D0] configurationWithOrigin:v9 disclosureLevel:v8];
    id v13 = [v11 itemWithObject:v6 privacyConfiguration:v12];
    [v10 addItem:v13];

    [(WFGetTravelTimeAction *)self finishRunningWithError:v7];
  }
  else
  {
    v14 = getWFActionsLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      v16 = "-[WFGetTravelTimeAction finishWithResult:error:]";
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_23C364000, v14, OS_LOG_TYPE_ERROR, "%s hit an error %@", (uint8_t *)&v15, 0x16u);
    }

    [(WFGetTravelTimeAction *)self finishRunningWithError:v7];
  }
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [(WFGetTravelTimeAction *)self parameterValueForKey:@"WFGetDirectionsActionMode" ofClass:objc_opt_class()];
  uint64_t v7 = [v5 transportTypeFromString:v6];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__WFGetTravelTimeAction_runAsynchronouslyWithInput___block_invoke;
  v8[3] = &unk_264E5B700;
  v8[4] = self;
  v8[5] = v7;
  [(WFGetTravelTimeAction *)self getMapItemFromCollection:v4 parameterKey:@"WFDestination" completionHandler:v8];
}

void __52__WFGetTravelTimeAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v24[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  uint64_t v8 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_super v9 = [v8 parameterValueForKey:@"WFGetDirectionsCustomLocation" ofClass:objc_opt_class()];
    v10 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __52__WFGetTravelTimeAction_runAsynchronouslyWithInput___block_invoke_2;
    v18[3] = &unk_264E5B6D8;
    id v19 = v9;
    v20 = v10;
    uint64_t v22 = *(void *)(a1 + 40);
    id v21 = v5;
    id v11 = v9;
    [v10 getMapItemFromCollection:v11 parameterKey:@"WFGetDirectionsCustomLocation" completionHandler:v18];
  }
  else if (v6)
  {
    [*(id *)(a1 + 32) finishRunningWithError:v6];
  }
  else
  {
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F870B8];
    v23[0] = *MEMORY[0x263F08338];
    v14 = WFLocalizedString(@"No Location");
    v24[0] = v14;
    v23[1] = *MEMORY[0x263F08320];
    int v15 = WFLocalizedString(@"Get Travel Time needs a destination location, but none was specified.");
    v24[1] = v15;
    v16 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    __int16 v17 = [v12 errorWithDomain:v13 code:6 userInfo:v16];
    [v8 finishRunningWithError:v17];
  }
}

void __52__WFGetTravelTimeAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v27[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    objc_super v9 = [*(id *)(a1 + 40) workflow];
    uint64_t v10 = [v9 environment];
    if (v8 == 4)
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      void v23[2] = __52__WFGetTravelTimeAction_runAsynchronouslyWithInput___block_invoke_3;
      v23[3] = &unk_264E5B688;
      v23[4] = *(void *)(a1 + 40);
      WFGetTravelTime(v5, v7, 4, v10, v23);
    }
    else
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __52__WFGetTravelTimeAction_runAsynchronouslyWithInput___block_invoke_4;
      v22[3] = &unk_264E5B6B0;
      v22[4] = *(void *)(a1 + 40);
      WFGetTravelTimeWithTripInfo(v5, v7, v8, v10, v22);
    }
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 32) numberOfItems];
    v12 = *(void **)(a1 + 40);
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F870B8];
    if (v11)
    {
      v24[0] = *MEMORY[0x263F08338];
      int v15 = WFLocalizedString(@"Start Location Not Found");
      v25[0] = v15;
      v24[1] = *MEMORY[0x263F08320];
      v16 = WFLocalizedString(@"Get Travel Time needs a start location, but the specified start location could not be found.");
      v25[1] = v16;
      __int16 v17 = NSDictionary;
      id v18 = v25;
      id v19 = v24;
    }
    else
    {
      v26[0] = *MEMORY[0x263F08338];
      int v15 = WFLocalizedString(@"No Start Location");
      v27[0] = v15;
      v26[1] = *MEMORY[0x263F08320];
      v16 = WFLocalizedString(@"Get Travel Time needs a start location, but none was provided.");
      v27[1] = v16;
      __int16 v17 = NSDictionary;
      id v18 = v27;
      id v19 = v26;
    }
    v20 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:2];
    id v21 = [v13 errorWithDomain:v14 code:5 userInfo:v20];
    [v12 finishRunningWithError:v21];
  }
}

uint64_t __52__WFGetTravelTimeAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

uint64_t __52__WFGetTravelTimeAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

+ (unint64_t)transportTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Walking"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Transit"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"Biking"])
  {
    unint64_t v4 = 8;
  }
  else
  {
    unint64_t v4 = 1;
  }

  return v4;
}

@end