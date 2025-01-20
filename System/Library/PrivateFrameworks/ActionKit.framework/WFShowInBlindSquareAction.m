@interface WFShowInBlindSquareAction
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)showLocation:(id)a3 named:(id)a4 address:(id)a5 phoneNumber:(id)a6;
- (void)showMapItem:(id)a3 named:(id)a4;
- (void)showPlacemark:(id)a3 named:(id)a4 phoneNumber:(id)a5;
@end

@implementation WFShowInBlindSquareAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to show %2$@ in BlindSquare?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to show content in BlindSquare?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (void)showLocation:(id)a3 named:(id)a4 address:(id)a5 phoneNumber:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(WFShowInBlindSquareAction *)self parameterValueForKey:@"WFBlindSquareSimulation" ofClass:objc_opt_class()];
  int v15 = [v14 BOOLValue];
  v16 = @"open";
  if (v15) {
    v16 = @"simulate";
  }
  v17 = v16;

  [v13 coordinate];
  uint64_t v19 = v18;
  uint64_t v21 = v20;

  v22 = objc_msgSend(NSString, "stringWithFormat:", @"%f", v19);
  v23 = objc_msgSend(NSString, "stringWithFormat:", @"%f", v21);
  v24 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v17, @"action", v22, @"lat", v23, @"lon", v12, @"name", v11, @"address", v10, @"phoneNumber", 0);

  v25 = NSURL;
  v26 = NSString;
  v27 = objc_msgSend(NSURL, "dc_queryStringWithQueryDictionary:", v24);
  v28 = [v26 stringWithFormat:@"blindsquare://api/place?%@", v27];
  v29 = [v25 URLWithString:v28];

  v30 = [MEMORY[0x263F33718] sharedContext];
  v31 = [(WFShowInBlindSquareAction *)self appDescriptor];
  v32 = [v31 bundleIdentifier];
  v33 = [(WFShowInBlindSquareAction *)self userInterface];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __68__WFShowInBlindSquareAction_showLocation_named_address_phoneNumber___block_invoke;
  v34[3] = &unk_264E5BF28;
  v34[4] = self;
  [v30 openURL:v29 withBundleIdentifier:v32 userInterface:v33 completionHandler:v34];
}

uint64_t __68__WFShowInBlindSquareAction_showLocation_named_address_phoneNumber___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

- (void)showPlacemark:(id)a3 named:(id)a4 phoneNumber:(id)a5
{
  id v8 = (void *)MEMORY[0x263F33990];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 streetAddressWithPlacemark:v11 label:0];
  id v14 = [v12 addressString];

  id v13 = [v11 location];

  [(WFShowInBlindSquareAction *)self showLocation:v13 named:v10 address:v14 phoneNumber:v9];
}

- (void)showMapItem:(id)a3 named:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 placemark];
  id v8 = [v7 phoneNumber];

  [(WFShowInBlindSquareAction *)self showPlacemark:v9 named:v6 phoneNumber:v8];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClasses:v5 completionHandler:v6];
}

void __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v7 numberOfItems])
  {
    id v10 = [v7 items];
    id v11 = [v10 firstObject];

    id v12 = [v11 preferredObjectType];
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2050000000;
    id v13 = (void *)getMKMapItemClass_softClass;
    uint64_t v33 = getMKMapItemClass_softClass;
    if (!getMKMapItemClass_softClass)
    {
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __getMKMapItemClass_block_invoke;
      v29[3] = &unk_264E5EC88;
      v29[4] = &v30;
      __getMKMapItemClass_block_invoke((uint64_t)v29);
      id v13 = (void *)v31[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v30, 8);
    LODWORD(v14) = [v12 conformsToClass:v14];

    if (v14)
    {
      int v15 = *(void **)(a1 + 32);
      v16 = [v11 mapItem];
      v17 = [v11 name];
      [v15 showMapItem:v16 named:v17];
    }
    else
    {
      uint64_t v18 = [v11 preferredObjectType];
      int v19 = [v18 conformsToClass:getCLPlacemarkClass()];

      if (v19)
      {
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke_2;
        v27[3] = &unk_264E58A98;
        v27[4] = *(void *)(a1 + 32);
        id v28 = v11;
        [v28 getObjectRepresentation:v27 forClass:getCLPlacemarkClass()];
        id v20 = v28;
      }
      else
      {
        uint64_t v21 = [v11 preferredObjectType];
        int v22 = [v21 conformsToClass:objc_opt_class()];

        if (v22)
        {
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke_3;
          v25[3] = &unk_264E58AE8;
          v25[4] = *(void *)(a1 + 32);
          id v26 = v11;
          [v26 getObjectRepresentation:v25 forClass:objc_opt_class()];
          id v20 = v26;
        }
        else
        {
          v23[0] = MEMORY[0x263EF8330];
          v23[1] = 3221225472;
          v23[2] = __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke_5;
          v23[3] = &unk_264E595F8;
          v23[4] = *(void *)(a1 + 32);
          id v24 = v11;
          [v24 getObjectRepresentation:v23 forClass:getCLLocationClass()];
          id v20 = v24;
        }
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v9];
  }
}

void __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  id v9 = v6;
  if (v6)
  {
    id v8 = [*(id *)(a1 + 40) name];
    [v7 showPlacemark:v9 named:v8 phoneNumber:0];
  }
  else
  {
    [v7 finishRunningWithError:a4];
  }
}

void __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  if (v6)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke_4;
    v8[3] = &unk_264E58AC0;
    id v7 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    id v10 = v6;
    [v9 getObjectRepresentation:v8 forClass:getCLLocationClass()];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a4];
  }
}

void __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  id v9 = v6;
  if (v6)
  {
    id v8 = [*(id *)(a1 + 40) name];
    [v7 showLocation:v9 named:v8 address:0 phoneNumber:0];
  }
  else
  {
    [v7 finishRunningWithError:a4];
  }
}

void __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  id v10 = v6;
  if (v6)
  {
    id v8 = [*(id *)(a1 + 40) name];
    id v9 = [*(id *)(a1 + 48) addressString];
    [v7 showLocation:v10 named:v8 address:v9 phoneNumber:0];
  }
  else
  {
    [v7 finishRunningWithError:a4];
  }
}

@end