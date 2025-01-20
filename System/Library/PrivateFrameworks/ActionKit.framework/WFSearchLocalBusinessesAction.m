@interface WFSearchLocalBusinessesAction
- (BOOL)shouldUseMetricSystem;
- (MKLocalSearch)localSearch;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)cancel;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)runSearchWithLocation:(id)a3 inputDisclosureLevel:(unint64_t)a4;
- (void)setLocalSearch:(id)a3;
@end

@implementation WFSearchLocalBusinessesAction

- (void).cxx_destruct
{
}

- (void)setLocalSearch:(id)a3
{
}

- (MKLocalSearch)localSearch
{
  return self->_localSearch;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  v5 = NSString;
  id v6 = a5;
  v7 = WFLocalizedString(@"Allow “%1$@” to use your current location to search for local businesses in Maps?");
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);

  return v8;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(WFSearchLocalBusinessesAction *)self input];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__WFSearchLocalBusinessesAction_getContentDestinationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264E59648;
  id v8 = v4;
  id v6 = v4;
  [v5 getObjectRepresentation:v7 forClass:getCLLocationClass_25809()];
}

void __76__WFSearchLocalBusinessesAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    v3 = *(void (**)(uint64_t, void, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 0, 0);
  }
  else
  {
    id v5 = [MEMORY[0x263F337E8] locationLocation];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
}

- (BOOL)shouldUseMetricSystem
{
  return [MEMORY[0x263F85370] usesMetricSystemForUnitType:*MEMORY[0x263F857C8]];
}

- (void)cancel
{
  v3 = [(WFSearchLocalBusinessesAction *)self localSearch];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)WFSearchLocalBusinessesAction;
  [(WFSearchLocalBusinessesAction *)&v4 cancel];
}

- (void)runSearchWithLocation:(id)a3 inputDisclosureLevel:(unint64_t)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(WFSearchLocalBusinessesAction *)self parameterValueForKey:@"WFSearchQuery" ofClass:objc_opt_class()];
  if ([v6 length])
  {
    v7 = [(WFSearchLocalBusinessesAction *)self parameterValueForKey:@"WFSearchRadius" ofClass:objc_opt_class()];
    id v8 = v7;
    if (v7)
    {
      v9 = (void *)MEMORY[0x263F85370];
      v10 = [v7 unitString];
      v11 = [v9 unitFromString:v10];

      if (v11)
      {
        id v12 = objc_alloc(MEMORY[0x263F08980]);
        v13 = [v8 magnitude];
        [v13 doubleValue];
        v14 = objc_msgSend(v12, "initWithDoubleValue:unit:", v11);

        v15 = [MEMORY[0x263F08CE8] meters];
        int v16 = [v14 canBeConvertedToUnit:v15];

        if (!v16) {
          goto LABEL_28;
        }
        v17 = [MEMORY[0x263F08CE8] meters];
        v18 = [v14 measurementByConvertingToUnit:v17];

        [v18 doubleValue];
        double v20 = v19;

        if (v20 <= 0.0)
        {
LABEL_28:
          if ([(WFSearchLocalBusinessesAction *)self shouldUseMetricSystem]) {
            double v20 = 1500.0;
          }
          else {
            double v20 = 1609.34;
          }
        }
        uint64_t v50 = 0;
        v51 = &v50;
        uint64_t v52 = 0x2050000000;
        v21 = (void *)getMKLocalSearchRequestClass_softClass;
        v53 = (void *)getMKLocalSearchRequestClass_softClass;
        if (!getMKLocalSearchRequestClass_softClass)
        {
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getMKLocalSearchRequestClass_block_invoke;
          v61 = &unk_264E5EC88;
          v62 = &v50;
          __getMKLocalSearchRequestClass_block_invoke((uint64_t)buf);
          v21 = (void *)v51[3];
        }
        v22 = v21;
        _Block_object_dispose(&v50, 8);
        id v23 = objc_alloc_init(v22);
        [v23 setNaturalLanguageQuery:v6];
        [v5 coordinate];
        double v25 = v24;
        double v27 = v26;
        uint64_t v50 = 0;
        v51 = &v50;
        uint64_t v52 = 0x2020000000;
        v28 = (void (*)(double, double, double, double))getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr;
        v53 = getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr;
        if (!getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr)
        {
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getMKCoordinateRegionMakeWithDistanceSymbolLoc_block_invoke;
          v61 = &unk_264E5EC88;
          v62 = &v50;
          v29 = MapKitLibrary();
          v30 = dlsym(v29, "MKCoordinateRegionMakeWithDistance");
          *(void *)(v62[1] + 24) = v30;
          getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr = *(_UNKNOWN **)(v62[1] + 24);
          v28 = (void (*)(double, double, double, double))v51[3];
        }
        _Block_object_dispose(&v50, 8);
        if (!v28)
        {
          v42 = [MEMORY[0x263F08690] currentHandler];
          v43 = objc_msgSend(NSString, "stringWithUTF8String:", "MKCoordinateRegion WFMKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D, CLLocationDistance, CLLocationDistance)");
          objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, @"WFSearchLocalBusinessesAction.m", 26, @"%s", dlerror());

          __break(1u);
        }
        v28(v25, v27, v20, v20);
        objc_msgSend(v23, "setRegion:");
        uint64_t v50 = 0;
        v51 = &v50;
        uint64_t v52 = 0x2050000000;
        v31 = (void *)getMKLocalSearchClass_softClass;
        v53 = (void *)getMKLocalSearchClass_softClass;
        if (!getMKLocalSearchClass_softClass)
        {
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getMKLocalSearchClass_block_invoke;
          v61 = &unk_264E5EC88;
          v62 = &v50;
          __getMKLocalSearchClass_block_invoke((uint64_t)buf);
          v31 = (void *)v51[3];
        }
        v32 = v31;
        _Block_object_dispose(&v50, 8);
        v33 = (void *)[[v32 alloc] initWithRequest:v23];
        [(WFSearchLocalBusinessesAction *)self setLocalSearch:v33];

        v34 = [(WFSearchLocalBusinessesAction *)self localSearch];
        v45[0] = MEMORY[0x263EF8330];
        v45[1] = 3221225472;
        v45[2] = __76__WFSearchLocalBusinessesAction_runSearchWithLocation_inputDisclosureLevel___block_invoke;
        v45[3] = &unk_264E59620;
        id v46 = v23;
        v47 = self;
        id v48 = v5;
        unint64_t v49 = a4;
        id v35 = v23;
        [v34 startWithCompletionHandler:v45];

        v36 = v46;
      }
      else
      {
        v39 = getWFActionsLogObject();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = [v8 unitString];
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[WFSearchLocalBusinessesAction runSearchWithLocation:inputDisclosureLevel:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v40;
          _os_log_impl(&dword_23C364000, v39, OS_LOG_TYPE_ERROR, "%s WFSearchLocalBusinessesAction parameters had invalid radius unit: %@", buf, 0x16u);
        }
        v41 = (void *)MEMORY[0x263F087E8];
        uint64_t v54 = *MEMORY[0x263F08320];
        v14 = WFLocalizedString(@"The unit for the radius parameter is invalid.");
        v55 = v14;
        id v35 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        v36 = [v41 errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:v35];
        [(WFSearchLocalBusinessesAction *)self finishRunningWithError:v36];
      }
    }
    else
    {
      v38 = (void *)MEMORY[0x263F087E8];
      uint64_t v56 = *MEMORY[0x263F08320];
      v11 = WFLocalizedString(@"You must provide a radius value to Search Local Businesses.");
      v57 = v11;
      v14 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      id v35 = [v38 errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:v14];
      [(WFSearchLocalBusinessesAction *)self finishRunningWithError:v35];
    }
  }
  else
  {
    v37 = (void *)MEMORY[0x263F087E8];
    uint64_t v58 = *MEMORY[0x263F08320];
    id v8 = WFLocalizedString(@"You must provide a search query to Search Local Businesses.");
    v59 = v8;
    v11 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    v14 = [v37 errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:v11];
    [(WFSearchLocalBusinessesAction *)self finishRunningWithError:v14];
  }
}

void __76__WFSearchLocalBusinessesAction_runSearchWithLocation_inputDisclosureLevel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v41[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 mapItems];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    v21 = [v6 domain];
    v22 = getMKErrorDomain();
    if ([v21 isEqualToString:v22])
    {
      uint64_t v23 = [v6 code];

      if (v23 == 4)
      {
        double v24 = (void *)MEMORY[0x263F087E8];
        double v25 = getMKErrorDomain();
        v40[0] = *MEMORY[0x263F08338];
        double v26 = WFLocalizedString(@"No Locations Found");
        v41[0] = v26;
        v40[1] = *MEMORY[0x263F08320];
        double v27 = NSString;
        v28 = WFLocalizedString(@"No locations were found with the keywords “%@”.");
        v29 = [*(id *)(a1 + 32) naturalLanguageQuery];
        v30 = objc_msgSend(v27, "localizedStringWithFormat:", v28, v29);
        v41[1] = v30;
        v31 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
        uint64_t v20 = [v24 errorWithDomain:v25 code:4 userInfo:v31];

        id v6 = (id)v20;
        goto LABEL_15;
      }
    }
    else
    {
    }
    uint64_t v20 = (uint64_t)v6;
    goto LABEL_15;
  }
  id v32 = v6;
  id v33 = v5;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [v5 mapItems];
  uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    uint64_t v12 = *MEMORY[0x263F85518];
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v35 + 1) + 8 * v13);
        v15 = [*(id *)(a1 + 40) output];
        int v16 = (void *)MEMORY[0x263F338D8];
        uint64_t v17 = *(void *)(a1 + 48);
        v18 = [MEMORY[0x263F33708] locationWithSystemAppBundleIdentifier:v12];
        double v19 = [v16 itemWithMapItem:v14 fromQueryLocation:v17 origin:v18 disclosureLevel:*(void *)(a1 + 56)];
        [v15 addItem:v19];

        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v10);
  }

  uint64_t v20 = 0;
  id v6 = v32;
  id v5 = v33;
LABEL_15:
  [*(id *)(a1 + 40) finishRunningWithError:v20];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__WFSearchLocalBusinessesAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E595F8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [v5 getObjectRepresentation:v6 forClass:getCLLocationClass_25809()];
}

void __60__WFSearchLocalBusinessesAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(a1 + 32) attributionSet];
  uint64_t v11 = [v10 derivedDisclosureLevel];

  if (v7)
  {
    [*(id *)(a1 + 40) runSearchWithLocation:v7 inputDisclosureLevel:v11];
LABEL_9:

    return;
  }
  if (v9)
  {
    [*(id *)(a1 + 40) finishRunningWithError:v9];
    goto LABEL_9;
  }
  uint64_t v12 = (void *)MEMORY[0x263F86CC8];
  uint64_t v13 = [*(id *)(a1 + 40) workflow];
  uint64_t v14 = [v13 environment];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  v15 = (double *)getkCLLocationAccuracyHundredMetersSymbolLoc_ptr;
  uint64_t v25 = getkCLLocationAccuracyHundredMetersSymbolLoc_ptr;
  if (!getkCLLocationAccuracyHundredMetersSymbolLoc_ptr)
  {
    v20[6] = MEMORY[0x263EF8330];
    v20[7] = 3221225472;
    v20[8] = __getkCLLocationAccuracyHundredMetersSymbolLoc_block_invoke;
    v20[9] = &unk_264E5EC88;
    v21 = &v22;
    int v16 = CoreLocationLibrary_25812();
    v23[3] = (uint64_t)dlsym(v16, "kCLLocationAccuracyHundredMeters");
    getkCLLocationAccuracyHundredMetersSymbolLoc_ptr = *(void *)(v21[1] + 24);
    v15 = (double *)v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (v15)
  {
    double v17 = *v15;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __60__WFSearchLocalBusinessesAction_runAsynchronouslyWithInput___block_invoke_2;
    v20[3] = &unk_264E595D0;
    v20[4] = *(void *)(a1 + 40);
    v20[5] = v11;
    [v12 determineLocationWithWorkflowEnvironment:v14 desiredAccuracy:v20 completion:v17];

    goto LABEL_9;
  }
  v18 = [MEMORY[0x263F08690] currentHandler];
  double v19 = [NSString stringWithUTF8String:"CLLocationAccuracy getkCLLocationAccuracyHundredMeters(void)"];
  objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"WFSearchLocalBusinessesAction.m", 30, @"%s", dlerror());

  __break(1u);
}

uint64_t __60__WFSearchLocalBusinessesAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 runSearchWithLocation:a2 inputDisclosureLevel:*(void *)(a1 + 40)];
  }
  else {
    return objc_msgSend(v3, "finishRunningWithError:");
  }
}

@end