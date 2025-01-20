@interface WFGetDistanceAction
+ (unint64_t)transportTypeFromString:(id)a3;
- (BOOL)destinationIsCurrentLocation;
- (BOOL)locationParameterIsCurrentLocation:(id)a3;
- (BOOL)originIsCurrentLocation;
- (id)contentDestinationWithError:(id *)a3;
- (id)noLocationError;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)finishRunningWithDistance:(double)a3;
- (void)getDirectDistanceFromOrigin:(id)a3 toDestination:(id)a4;
- (void)getDistanceFromOrigin:(id)a3 toDestination:(id)a4 transportType:(unint64_t)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetDistanceAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(WFGetDistanceAction *)self originIsCurrentLocation]
    || [(WFGetDistanceAction *)self destinationIsCurrentLocation])
  {
    v11 = NSString;
    v12 = WFLocalizedString(@"Allow “%1$@” to access your current location?");
    v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WFGetDistanceAction;
    v13 = [(WFGetDistanceAction *)&v15 smartPromptWithContentDescription:v8 contentDestination:v9 workflowName:v10];
  }

  return v13;
}

- (id)contentDestinationWithError:(id *)a3
{
  if ([(WFGetDistanceAction *)self originIsCurrentLocation]
    || [(WFGetDistanceAction *)self destinationIsCurrentLocation])
  {
    v4 = [MEMORY[0x263F337E8] locationLocation];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)noLocationError
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F870B8];
  v9[0] = *MEMORY[0x263F08338];
  v4 = WFLocalizedString(@"Invalid Location");
  v10[0] = v4;
  v9[1] = *MEMORY[0x263F08320];
  v5 = WFLocalizedString(@"The location specified in the Get Distance action could not be found.");
  v10[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = [v2 errorWithDomain:v3 code:5 userInfo:v6];

  return v7;
}

- (BOOL)locationParameterIsCurrentLocation:(id)a3
{
  uint64_t v3 = [(WFGetDistanceAction *)self parameterStateForKey:a3];
  v4 = [v3 value];
  char v5 = [v4 isCurrentLocation];

  return v5;
}

- (BOOL)destinationIsCurrentLocation
{
  return [(WFGetDistanceAction *)self locationParameterIsCurrentLocation:@"WFGetDistanceDestination"];
}

- (BOOL)originIsCurrentLocation
{
  return [(WFGetDistanceAction *)self locationParameterIsCurrentLocation:@"WFGetDirectionsCustomLocation"];
}

- (void)finishRunningWithDistance:(double)a3
{
  id v18 = [(WFGetDistanceAction *)self parameterValueForKey:@"WFDistanceUnit" ofClass:objc_opt_class()];
  int v5 = [v18 isEqualToString:@"Miles"];
  double v6 = 0.001;
  if (v5) {
    double v6 = 0.00062137;
  }
  v7 = [NSNumber numberWithDouble:v6 * a3];
  id v8 = objc_opt_new();
  [v8 setNumberStyle:1];
  [v8 setMinimumFractionDigits:0];
  [v8 setMaximumFractionDigits:1];
  id v9 = objc_alloc_init(MEMORY[0x263F08940]);
  [v9 setUnitStyle:3];
  [v9 setNumberFormatter:v8];
  if ([(WFGetDistanceAction *)self originIsCurrentLocation]
    || [(WFGetDistanceAction *)self destinationIsCurrentLocation])
  {
    id v10 = (void *)MEMORY[0x263F337A0];
    v11 = [MEMORY[0x263F337E8] locationLocation];
    v12 = [v10 attributionSetWithOrigin:v11 disclosureLevel:1];
  }
  else
  {
    v12 = 0;
  }
  if (v5) {
    uint64_t v13 = 1284;
  }
  else {
    uint64_t v13 = 14;
  }
  v14 = [(WFGetDistanceAction *)self output];
  objc_super v15 = (void *)MEMORY[0x263F337C8];
  [v7 doubleValue];
  v16 = objc_msgSend(v9, "stringFromValue:unit:", v13);
  v17 = [v15 itemWithObject:v7 named:v16 attributionSet:v12];
  [v14 addItem:v17];

  [(WFGetDistanceAction *)self finishRunningWithError:0];
}

- (void)getDistanceFromOrigin:(id)a3 toDestination:(id)a4 transportType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__34144;
  v32 = __Block_byref_object_dispose__34145;
  BOOL v10 = [(WFGetDistanceAction *)self originIsCurrentLocation];
  v11 = 0;
  if (v10)
  {
    v11 = [getMKMapItemClass() mapItemForCurrentLocation];
  }
  id v33 = v11;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__34144;
  v26 = __Block_byref_object_dispose__34145;
  if ([(WFGetDistanceAction *)self destinationIsCurrentLocation])
  {
    v12 = [getMKMapItemClass() mapItemForCurrentLocation];
  }
  else
  {
    v12 = 0;
  }
  id v27 = v12;
  uint64_t v13 = dispatch_group_create();
  v14 = v13;
  if (!v29[5])
  {
    dispatch_group_enter(v13);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __73__WFGetDistanceAction_getDistanceFromOrigin_toDestination_transportType___block_invoke;
    v19[3] = &unk_264E5A5B0;
    v19[4] = self;
    v21 = &v28;
    v20 = v14;
    [v8 getObjectRepresentation:v19 forClass:getMKMapItemClass()];
  }
  if (!v23[5])
  {
    dispatch_group_enter(v14);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __73__WFGetDistanceAction_getDistanceFromOrigin_toDestination_transportType___block_invoke_2;
    v16[3] = &unk_264E5A5B0;
    v16[4] = self;
    id v18 = &v22;
    v17 = v14;
    [v9 getObjectRepresentation:v16 forClass:getMKMapItemClass()];
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __73__WFGetDistanceAction_getDistanceFromOrigin_toDestination_transportType___block_invoke_3;
  v15[3] = &unk_264E5A5D8;
  v15[6] = &v22;
  v15[7] = a5;
  v15[4] = self;
  v15[5] = &v28;
  dispatch_group_notify(v14, MEMORY[0x263EF83A0], v15);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
}

void __73__WFGetDistanceAction_getDistanceFromOrigin_toDestination_transportType___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  if (!v6)
  {
    v7 = *(void **)(a1 + 32);
    id v8 = WFLocalizedMapKitError(a4);
    [v7 finishRunningWithError:v8];
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __73__WFGetDistanceAction_getDistanceFromOrigin_toDestination_transportType___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  if (!v6)
  {
    v7 = *(void **)(a1 + 32);
    id v8 = WFLocalizedMapKitError(a4);
    [v7 finishRunningWithError:v8];
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __73__WFGetDistanceAction_getDistanceFromOrigin_toDestination_transportType___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = *(void *)(a1 + 56);
  v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  int v5 = [*(id *)(a1 + 32) workflow];
  uint64_t v6 = [v5 environment];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__WFGetDistanceAction_getDistanceFromOrigin_toDestination_transportType___block_invoke_4;
  v7[3] = &unk_264E5B688;
  v7[4] = *(void *)(a1 + 32);
  WFGetTravelTime(v2, v4, v3, v6, v7);
}

uint64_t __73__WFGetDistanceAction_getDistanceFromOrigin_toDestination_transportType___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithDistance:");
}

- (void)getDirectDistanceFromOrigin:(id)a3 toDestination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFGetDistanceAction *)self parameterValueForKey:@"Accuracy" ofClass:objc_opt_class()];
  WFCLLocationAccuracyFromWFLocationAccuracy();
  double v10 = v9;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__34144;
  v33[4] = __Block_byref_object_dispose__34145;
  id v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__34144;
  v31[4] = __Block_byref_object_dispose__34145;
  id v32 = 0;
  id v11 = dispatch_group_create();
  BOOL v12 = [(WFGetDistanceAction *)self originIsCurrentLocation];
  dispatch_group_enter(v11);
  if (v12)
  {
    uint64_t v13 = (void *)MEMORY[0x263F86CC8];
    v14 = [(WFGetDistanceAction *)self workflow];
    uint64_t v15 = [v14 environment];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke;
    v29[3] = &unk_264E5A538;
    v29[4] = self;
    v30[1] = v33;
    v30[0] = v11;
    [v13 determineLocationWithWorkflowEnvironment:v15 desiredAccuracy:v29 completion:v10];
    v16 = (id *)v30;
  }
  else
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke_2;
    v27[3] = &unk_264E5A560;
    v27[4] = self;
    v28[1] = v33;
    v28[0] = v11;
    [v6 getObjectRepresentation:v27 forClass:getCLLocationClass_34169()];
    v16 = (id *)v28;
  }

  BOOL v17 = [(WFGetDistanceAction *)self destinationIsCurrentLocation];
  dispatch_group_enter(v11);
  if (v17)
  {
    id v18 = (void *)MEMORY[0x263F86CC8];
    v19 = [(WFGetDistanceAction *)self workflow];
    uint64_t v20 = [v19 environment];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke_3;
    v25[3] = &unk_264E5A538;
    v25[4] = self;
    v26[1] = v31;
    v26[0] = v11;
    [v18 determineLocationWithWorkflowEnvironment:v20 desiredAccuracy:v25 completion:v10];
    v21 = (id *)v26;
  }
  else
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke_4;
    v23[3] = &unk_264E5A560;
    v23[4] = self;
    v24[1] = v31;
    v24[0] = v11;
    [v7 getObjectRepresentation:v23 forClass:getCLLocationClass_34169()];
    v21 = (id *)v24;
  }

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke_5;
  v22[3] = &unk_264E5A588;
  v22[4] = self;
  v22[5] = v31;
  v22[6] = v33;
  dispatch_group_notify(v11, MEMORY[0x263EF83A0], v22);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
}

void __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
}

void __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a4];
  }
}

void __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
}

void __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a4];
  }
}

uint64_t __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke_5(void *a1)
{
  v1 = (void *)a1[4];
  [*(id *)(*(void *)(a1[5] + 8) + 40) distanceFromLocation:*(void *)(*(void *)(a1[6] + 8) + 40)];
  return objc_msgSend(v1, "finishRunningWithDistance:");
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  int v5 = [(WFGetDistanceAction *)self parameterValueForKey:@"WFGetDirectionsActionMode" ofClass:objc_opt_class()];
  uint64_t v6 = [(id)objc_opt_class() transportTypeFromString:v5];
  id v7 = [(WFGetDistanceAction *)self parameterValueForKey:@"WFGetDirectionsCustomLocation" ofClass:objc_opt_class()];
  id v12 = v4;
  id v8 = [v7 items];
  double v9 = [v8 firstObject];

  double v10 = [v12 items];
  id v11 = [v10 firstObject];

  if ([v5 isEqualToString:@"Direct"]) {
    [(WFGetDistanceAction *)self getDirectDistanceFromOrigin:v9 toDestination:v11];
  }
  else {
    [(WFGetDistanceAction *)self getDistanceFromOrigin:v9 toDestination:v11 transportType:v6];
  }
}

+ (unint64_t)transportTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Walking"])
  {
    unint64_t v4 = 2;
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