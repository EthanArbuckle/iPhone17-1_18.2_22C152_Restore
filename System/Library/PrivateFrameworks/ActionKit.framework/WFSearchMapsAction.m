@interface WFSearchMapsAction
- (id)appIdentifier;
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)openMapItems:(id)a3;
- (void)openMapsLink:(id)a3 inAppNamed:(id)a4;
- (void)openMapsURL:(id)a3 withAppIdentifier:(id)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFSearchMapsAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a3;
  v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  if (v7)
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to search for locations in %2$@ by using %3$@?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v7);
  }
  else
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to search for locations in %2$@?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  v12 = };

  return v12;
}

- (id)contentDestinationWithError:(id *)a3
{
  v3 = [(WFSearchMapsAction *)self appIdentifier];
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
  v2 = [(WFSearchMapsAction *)self parameterStateForKey:@"WFSearchMapsActionApp"];
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
  uint64_t v14 = [(WFSearchMapsAction *)self userInterface];
  v15 = [v10 bundleIdentifier];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __52__WFSearchMapsAction_openMapsURL_withAppIdentifier___block_invoke;
  v19[3] = &unk_264E5DF98;
  v19[4] = self;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __52__WFSearchMapsAction_openMapsURL_withAppIdentifier___block_invoke_2;
  v18[3] = &unk_264E5EBC8;
  v18[4] = self;
  v16 = [v13 requestWithURL:v8 scheme:v12 userInterface:v14 bundleIdentifier:v15 successHandler:v19 failureHandler:v18];

  [v16 setCallbackRequest:0];
  [v16 setDeferCompletionUntilReturn:0];
  v17 = [MEMORY[0x263F86830] sharedManager];
  [v17 performRequest:v16];
}

uint64_t __52__WFSearchMapsAction_openMapsURL_withAppIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRunningWithError:0];
}

uint64_t __52__WFSearchMapsAction_openMapsURL_withAppIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

- (void)openMapsLink:(id)a3 inAppNamed:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = WFMapsAppIdentifierForAppName(v6);
  if ([v6 isEqualToString:@"Google Maps"])
  {
    uint64_t v8 = [v10 googleMapsAppURL];
  }
  else
  {
    if ([v6 isEqualToString:@"Waze"]) {
      [v10 wazeAppURL];
    }
    else {
    uint64_t v8 = [v10 mapsAppURL];
    }
  }
  id v9 = (void *)v8;
  [(WFSearchMapsAction *)self openMapsURL:v8 withAppIdentifier:v7];
}

- (void)openMapItems:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v5 = (void *)getMKMapItemClass_softClass_52603;
  uint64_t v12 = getMKMapItemClass_softClass_52603;
  if (!getMKMapItemClass_softClass_52603)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getMKMapItemClass_block_invoke_52604;
    v8[3] = &unk_264E5EC88;
    v8[4] = &v9;
    __getMKMapItemClass_block_invoke_52604((uint64_t)v8);
    v5 = (void *)v10[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v9, 8);
  id v7 = [v6 urlForMapItems:v4 options:0];
  [(WFSearchMapsAction *)self openMapsURL:v7 withAppIdentifier:@"com.apple.Maps"];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFSearchMapsAction *)self parameterValueForKey:@"WFSearchMapsActionApp" ofClass:objc_opt_class()];
  id v6 = WFMapsAppIdentifierForAppName(v5);
  if (v6)
  {
    uint64_t v20 = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    if ([v5 isEqualToString:@"Maps"])
    {
      uint64_t v8 = [v7 arrayByAddingObject:objc_opt_class()];

      id v7 = (void *)v8;
    }
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __49__WFSearchMapsAction_runAsynchronouslyWithInput___block_invoke;
    v17[3] = &unk_264E5DF58;
    v17[4] = self;
    id v18 = v5;
    id v19 = v4;
    [v19 generateCollectionByCoercingToItemClasses:v7 completionHandler:v17];
  }
  else
  {
    id v7 = WFLocalizedMapsAppNameForAppName(v5);
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F870B8];
    v21[0] = *MEMORY[0x263F08338];
    id v10 = NSString;
    uint64_t v11 = WFLocalizedString(@"“%@” Not Installed");
    uint64_t v12 = objc_msgSend(v10, "stringWithFormat:", v11, v7);
    v22[0] = v12;
    v21[1] = *MEMORY[0x263F08320];
    v13 = WFLocalizedString(@"Please select a different app for the Show in Maps action.");
    v22[1] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    v15 = [v16 errorWithDomain:v9 code:5 userInfo:v14];
    [(WFSearchMapsAction *)self finishRunningWithError:v15];
  }
}

void __49__WFSearchMapsAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 numberOfItems])
  {
    id v4 = [v3 items];
    v5 = [v4 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v3 items];
      id v7 = objc_msgSend(v6, "if_objectsOfClass:", objc_opt_class());
      uint64_t v8 = [v7 valueForKey:@"mapItem"];

      [*(id *)(a1 + 32) openMapItems:v8];
    }
    else
    {
      uint64_t v11 = *(void **)(a1 + 32);
      uint64_t v8 = [v5 mapsLink];
      [v11 openMapsLink:v8 inAppNamed:*(void *)(a1 + 40)];
    }
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __49__WFSearchMapsAction_runAsynchronouslyWithInput___block_invoke_2;
    v12[3] = &unk_264E5DF30;
    uint64_t v9 = *(void **)(a1 + 40);
    id v10 = *(void **)(a1 + 48);
    v12[4] = *(void *)(a1 + 32);
    id v13 = v9;
    [v10 getStringRepresentation:v12];
  }
}

void __49__WFSearchMapsAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 length])
  {
    id v6 = objc_alloc_init(MEMORY[0x263F336D0]);
    [v6 setSearchQuery:v7];
    [*(id *)(a1 + 32) openMapsLink:v6 inAppNamed:*(void *)(a1 + 40)];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v5];
  }
}

@end