@interface WFGetDirectionsAction
+ (id)localizedNameForDirectionsModeString:(id)a3;
+ (unint64_t)directionsModeFromString:(id)a3;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (id)appIdentifier;
- (id)contentDestinationWithError:(id *)a3;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)possibleStatesForEnumeration:(id)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (id)supportedDirectionsModesForAppName:(id)a3;
- (void)getMapsURLForMapsLink:(id)a3 appName:(id)a4 completionHandler:(id)a5;
- (void)getStartAddressWithCompletionHandler:(id)a3;
- (void)initializeParameters;
- (void)openMapsLink:(id)a3 inAppNamed:(id)a4;
- (void)openMapsURL:(id)a3 withAppIdentifier:(id)a4;
- (void)parameterAttributesDidChange:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetDirectionsAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a3;
  v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  if (v7)
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to get directions in %2$@ by using %3$@?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v7);
  }
  else
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to get directions in %2$@?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  v12 = };

  return v12;
}

- (id)contentDestinationWithError:(id *)a3
{
  v3 = [(WFGetDirectionsAction *)self appIdentifier];
  v4 = v3;
  if (v3 && ([v3 isEqualToString:@"com.apple.Maps"] & 1) == 0)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F0F988]) initWithBundleIdentifier:v4];
    v5 = [MEMORY[0x263F33708] locationWithAppDescriptor:v6];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)appIdentifier
{
  v2 = [(WFGetDirectionsAction *)self parameterStateForKey:@"WFGetDirectionsActionApp"];
  v3 = [v2 value];
  if (v3)
  {
    v4 = [v2 value];
    WFMapsAppIdentifierForAppName(v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = @"com.apple.Maps";
    v6 = @"com.apple.Maps";
  }

  return v5;
}

- (void)openMapsURL:(id)a3 withAppIdentifier:(id)a4
{
  v6 = (void *)MEMORY[0x263F86828];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 sharedRegistry];
  id v10 = [v9 appWithIdentifier:v7];

  v11 = [v8 scheme];
  v12 = [v10 schemeNamed:v11];

  v13 = (void *)MEMORY[0x263F87080];
  uint64_t v14 = [(WFGetDirectionsAction *)self userInterface];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __55__WFGetDirectionsAction_openMapsURL_withAppIdentifier___block_invoke;
  v18[3] = &unk_264E5DF98;
  v18[4] = self;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __55__WFGetDirectionsAction_openMapsURL_withAppIdentifier___block_invoke_2;
  v17[3] = &unk_264E5EBC8;
  v17[4] = self;
  v15 = [v13 requestWithURL:v8 scheme:v12 userInterface:v14 bundleIdentifier:v7 successHandler:v18 failureHandler:v17];

  [v15 setCallbackRequest:0];
  [v15 setDeferCompletionUntilReturn:0];
  v16 = [MEMORY[0x263F86830] sharedManager];
  [v16 performRequest:v15];
}

uint64_t __55__WFGetDirectionsAction_openMapsURL_withAppIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRunningWithError:0];
}

uint64_t __55__WFGetDirectionsAction_openMapsURL_withAppIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

- (void)getMapsURLForMapsLink:(id)a3 appName:(id)a4 completionHandler:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, uint64_t, void))a5;
  if ([v7 isEqualToString:@"Google Maps"])
  {
    uint64_t v9 = [v11 googleMapsAppURL];
LABEL_9:
    id v10 = (void *)v9;
    v8[2](v8, v9, 0);

    goto LABEL_10;
  }
  if ([v7 isEqualToString:@"Waze"])
  {
    uint64_t v9 = [v11 wazeAppURL];
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"Transit"])
  {
    uint64_t v9 = [v11 transitAppURL];
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"Baidu Maps"])
  {
    uint64_t v9 = [v11 baiduMapsAppURL];
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"Citymapper"]) {
    [v11 getCitymapperAppURL:v8];
  }
  else {
    [v11 getAppleMapsDirectionsURL:v8];
  }
LABEL_10:
}

- (void)openMapsLink:(id)a3 inAppNamed:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__WFGetDirectionsAction_openMapsLink_inAppNamed___block_invoke;
  v8[3] = &unk_264E59D90;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(WFGetDirectionsAction *)self getMapsURLForMapsLink:a3 appName:v7 completionHandler:v8];
}

void __49__WFGetDirectionsAction_openMapsLink_inAppNamed___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6)
  {
    v5 = WFMapsAppIdentifierForAppName(*(void **)(a1 + 40));
    [*(id *)(a1 + 32) openMapsURL:v6 withAppIdentifier:v5];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
}

- (void)getStartAddressWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, __CFString *))a3;
  v5 = [(WFGetDirectionsAction *)self parameterForKey:@"WFLocation"];
  id v6 = [(WFGetDirectionsAction *)self parameterStateForKey:@"WFLocation"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = [v8 value];

  id v10 = [v5 resourceManager];
  if (![v10 resourcesRequiredForDisplayAvailable])
  {

    goto LABEL_11;
  }
  char v11 = [v9 isCurrentLocation];

  if (v11)
  {
LABEL_11:
    v4[2](v4, &stru_26F008428);
    goto LABEL_14;
  }
  v12 = [(WFGetDirectionsAction *)self parameterValueForKey:@"WFLocation" ofClass:objc_opt_class()];
  v13 = [v12 items];
  uint64_t v14 = [v13 firstObject];

  if (v14)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __62__WFGetDirectionsAction_getStartAddressWithCompletionHandler___block_invoke;
    v15[3] = &unk_264E59D68;
    v16 = v4;
    [v14 getObjectRepresentation:v15 forClass:objc_opt_class()];
  }
  else
  {
    v4[2](v4, &stru_26F008428);
  }

LABEL_14:
}

void __62__WFGetDirectionsAction_getStartAddressWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 addressString];
  id v5 = (id)v3;
  if (v3) {
    v4 = (__CFString *)v3;
  }
  else {
    v4 = &stru_26F008428;
  }
  (*(void (**)(uint64_t, __CFString *))(v2 + 16))(v2, v4);
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v30[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFGetDirectionsAction *)self parameterValueForKey:@"WFGetDirectionsActionApp" ofClass:objc_opt_class()];
  id v6 = WFMapsAppIdentifierForAppName(v5);
  if (v6)
  {
    id v7 = objc_opt_class();
    id v8 = [(WFGetDirectionsAction *)self parameterValueForKey:@"WFGetDirectionsActionMode" ofClass:objc_opt_class()];
    uint64_t v9 = [v7 directionsModeFromString:v8];

    id v10 = [MEMORY[0x263F853D8] sharedManager];
    char v11 = (void *)MEMORY[0x263EFFA08];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    uint64_t v14 = [v11 setWithObject:v13];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __52__WFGetDirectionsAction_runAsynchronouslyWithInput___block_invoke;
    v25[3] = &unk_264E59D40;
    v25[4] = self;
    id v26 = v4;
    uint64_t v28 = v9;
    id v27 = v5;
    [v10 requestSandboxExtensionForRunningActionWithAccessResources:v14 completion:v25];
  }
  else
  {
    v15 = WFLocalizedMapsAppNameForAppName(v5);
    id v24 = v4;
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F870B8];
    v29[0] = *MEMORY[0x263F08338];
    v18 = NSString;
    v19 = WFLocalizedString(@"“%@” Not Installed");
    v20 = objc_msgSend(v18, "stringWithFormat:", v19, v15);
    v30[0] = v20;
    v29[1] = *MEMORY[0x263F08320];
    v21 = WFLocalizedString(@"Please select a different app for the Show Directions action.");
    v30[1] = v21;
    v22 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
    v23 = [v16 errorWithDomain:v17 code:5 userInfo:v22];
    [(WFGetDirectionsAction *)self finishRunningWithError:v23];

    id v4 = v24;
  }
}

void __52__WFGetDirectionsAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __52__WFGetDirectionsAction_runAsynchronouslyWithInput___block_invoke_2;
    v8[3] = &unk_264E59D18;
    id v4 = *(id *)(a1 + 40);
    id v5 = *(void **)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 32);
    id v9 = v4;
    uint64_t v10 = v6;
    id v11 = v5;
    [v2 getStartAddressWithCompletionHandler:v8];
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "finishRunningWithError:");
  }
}

void __52__WFGetDirectionsAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = objc_opt_class();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__WFGetDirectionsAction_runAsynchronouslyWithInput___block_invoke_3;
  v9[3] = &unk_264E59CF0;
  uint64_t v6 = *(void **)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v7;
  id v12 = v6;
  id v13 = *(id *)(a1 + 32);
  id v8 = v3;
  [v4 generateCollectionByCoercingToItemClass:v5 completionHandler:v9];
}

void __52__WFGetDirectionsAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 numberOfItems])
  {
    id v4 = [v3 items];
    uint64_t v5 = [v4 firstObject];

    uint64_t v6 = [v5 mapsLink];
    id v7 = objc_alloc_init(MEMORY[0x263F336D0]);
    [v7 setStartAddress:*(void *)(a1 + 32)];
    id v8 = [v6 destinationAddress];
    if (v8)
    {
      [v7 setDestinationAddress:v8];
    }
    else
    {
      uint64_t v11 = [v6 searchQuery];
      [v7 setDestinationAddress:v11];
    }
    if ([v6 directionsMode]) {
      uint64_t v12 = [v6 directionsMode];
    }
    else {
      uint64_t v12 = *(void *)(a1 + 64);
    }
    [v7 setDirectionsMode:v12];
    [*(id *)(a1 + 40) openMapsLink:v7 inAppNamed:*(void *)(a1 + 48)];
  }
  else
  {
    id v9 = *(void **)(a1 + 56);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __52__WFGetDirectionsAction_runAsynchronouslyWithInput___block_invoke_4;
    v14[3] = &unk_264E59CC8;
    int8x16_t v13 = *(int8x16_t *)(a1 + 32);
    id v10 = (id)v13.i64[0];
    int8x16_t v15 = vextq_s8(v13, v13, 8uLL);
    uint64_t v17 = *(void *)(a1 + 64);
    id v16 = *(id *)(a1 + 48);
    [v9 getStringRepresentation:v14];
  }
}

void __52__WFGetDirectionsAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 length])
  {
    id v6 = objc_alloc_init(MEMORY[0x263F336D0]);
    [v6 setStartAddress:*(void *)(a1 + 40)];
    [v6 setDestinationAddress:v7];
    [v6 setDirectionsMode:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) openMapsLink:v6 inAppNamed:*(void *)(a1 + 48)];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v5];
  }
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v4 = a4;
  id v5 = objc_opt_class();
  id v6 = [v4 value];

  id v7 = [v5 localizedNameForDirectionsModeString:v6];

  return v7;
}

- (id)possibleStatesForEnumeration:(id)a3
{
  id v4 = [(WFGetDirectionsAction *)self parameterStateForKey:@"WFGetDirectionsActionApp"];
  id v5 = [v4 value];

  id v6 = [(WFGetDirectionsAction *)self supportedDirectionsModesForAppName:v5];
  id v7 = objc_msgSend(v6, "if_map:", &__block_literal_global_29350);

  return v7;
}

id __54__WFGetDirectionsAction_possibleStatesForEnumeration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

- (id)supportedDirectionsModesForAppName:(id)a3
{
  v6[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (([v3 isEqualToString:@"Maps"] & 1) != 0
    || ([v3 isEqualToString:@"Google Maps"] & 1) != 0
    || [v3 isEqualToString:@"Baidu Maps"])
  {
    v6[0] = @"Driving";
    v6[1] = @"Walking";
    v6[2] = @"Biking";
    v6[3] = @"Transit";
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  }
  else
  {
    id v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

- (void)parameterAttributesDidChange:(id)a3
{
  id v4 = [a3 key];
  int v5 = [v4 isEqualToString:@"WFGetDirectionsActionApp"];

  if (v5)
  {
    id v6 = [(WFGetDirectionsAction *)self parameterForKey:@"WFGetDirectionsActionMode"];
    [v6 reloadPossibleStates];
  }
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)WFGetDirectionsAction;
  BOOL v7 = [(WFGetDirectionsAction *)&v10 setParameterState:a3 forKey:v6];
  if (v7 && [v6 isEqualToString:@"WFGetDirectionsActionApp"])
  {
    id v8 = [(WFGetDirectionsAction *)self parameterForKey:@"WFGetDirectionsActionMode"];
    [v8 reloadPossibleStates];
  }
  return v7;
}

- (void)initializeParameters
{
  v5.receiver = self;
  v5.super_class = (Class)WFGetDirectionsAction;
  [(WFGetDirectionsAction *)&v5 initializeParameters];
  id v3 = [(WFGetDirectionsAction *)self parameterForKey:@"WFGetDirectionsActionMode"];
  [v3 setDataSource:self];

  id v4 = [(WFGetDirectionsAction *)self parameterForKey:@"WFGetDirectionsActionApp"];
  [v4 addEventObserver:self];
}

+ (id)localizedNameForDirectionsModeString:(id)a3
{
  id v3 = a3;
  id v4 = @"Driving";
  if (([v3 isEqualToString:@"Driving"] & 1) != 0
    || (id v4 = @"Transit", ([v3 isEqualToString:@"Transit"] & 1) != 0)
    || (id v4 = @"Biking", ([v3 isEqualToString:@"Biking"] & 1) != 0)
    || (id v4 = @"Walking", [v3 isEqualToString:@"Walking"]))
  {
    objc_super v5 = WFLocalizedString(v4);
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

+ (unint64_t)directionsModeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Walking"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"Transit"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"Biking"])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 1;
  }

  return v4;
}

@end