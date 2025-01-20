@interface WFGetHalfwayPointAction
- (void)getPlacemarkFromCollection:(id)a3 completionHandler:(id)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetHalfwayPointAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v46[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFGetHalfwayPointAction *)self parameterValueForKey:@"WFGetHalfwayPointFirstLocation" ofClass:objc_opt_class()];
  if ([v5 numberOfItems])
  {
    v6 = [(WFGetHalfwayPointAction *)self parameterValueForKey:@"WFGetHalfwayPointSecondLocation" ofClass:objc_opt_class()];
    if ([v6 numberOfItems])
    {
      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x3010000000;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      v40[3] = &unk_23C7915D1;
      getkCLLocationCoordinate2DInvalid();
      uint64_t v41 = v7;
      uint64_t v42 = v8;
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x3010000000;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      v37[3] = &unk_23C7915D1;
      getkCLLocationCoordinate2DInvalid();
      uint64_t v38 = v9;
      uint64_t v39 = v10;
      v35[0] = 0;
      v35[1] = v35;
      v35[2] = 0x3032000000;
      v35[3] = __Block_byref_object_copy__37624;
      v35[4] = __Block_byref_object_dispose__37625;
      id v36 = 0;
      v33[0] = 0;
      v33[1] = v33;
      v33[2] = 0x3032000000;
      v33[3] = __Block_byref_object_copy__37624;
      v33[4] = __Block_byref_object_dispose__37625;
      id v34 = 0;
      v11 = dispatch_group_create();
      dispatch_group_enter(v11);
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __54__WFGetHalfwayPointAction_runAsynchronouslyWithInput___block_invoke;
      v29[3] = &unk_264E5AD40;
      v31 = v40;
      v32 = v35;
      v12 = v11;
      v30 = v12;
      [(WFGetHalfwayPointAction *)self getPlacemarkFromCollection:v5 completionHandler:v29];
      dispatch_group_enter(v12);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __54__WFGetHalfwayPointAction_runAsynchronouslyWithInput___block_invoke_2;
      v25[3] = &unk_264E5AD40;
      v27 = v37;
      v28 = v33;
      v13 = v12;
      v26 = v13;
      [(WFGetHalfwayPointAction *)self getPlacemarkFromCollection:v6 completionHandler:v25];
      v14 = dispatch_get_global_queue(0, 0);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __54__WFGetHalfwayPointAction_runAsynchronouslyWithInput___block_invoke_3;
      v24[3] = &unk_264E5AD68;
      v24[4] = self;
      v24[5] = v40;
      v24[6] = v37;
      v24[7] = v35;
      v24[8] = v33;
      dispatch_group_notify(v13, v14, v24);

      _Block_object_dispose(v33, 8);
      _Block_object_dispose(v35, 8);

      _Block_object_dispose(v37, 8);
      _Block_object_dispose(v40, 8);
    }
    else
    {
      v19 = (void *)MEMORY[0x263F087E8];
      v43[0] = *MEMORY[0x263F08338];
      v20 = WFLocalizedString(@"No second location was provided.");
      v44[0] = v20;
      v43[1] = *MEMORY[0x263F08320];
      v21 = WFLocalizedString(@"Please provide a second location.");
      v44[1] = v21;
      v22 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
      v23 = [v19 errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:v22];
      [(WFGetHalfwayPointAction *)self finishRunningWithError:v23];
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x263F087E8];
    v45[0] = *MEMORY[0x263F08338];
    v6 = WFLocalizedString(@"No first location was provided.");
    v46[0] = v6;
    v45[1] = *MEMORY[0x263F08320];
    v16 = WFLocalizedString(@"Please provide a first location.");
    v46[1] = v16;
    v17 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
    v18 = [v15 errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:v17];
    [(WFGetHalfwayPointAction *)self finishRunningWithError:v18];
  }
}

void __54__WFGetHalfwayPointAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v6 = [a2 location];
    [v6 coordinate];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v7 + 32) = v8;
    *(void *)(v7 + 40) = v9;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
  id v12 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __54__WFGetHalfwayPointAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v6 = [a2 location];
    [v6 coordinate];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v7 + 32) = v8;
    *(void *)(v7 + 40) = v9;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
  id v12 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __54__WFGetHalfwayPointAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  WFCLLocationCoordinate2DIsValid(*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  if (v2
    && (WFCLLocationCoordinate2DIsValid(*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)), (v3 & 1) != 0))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    double v6 = *(double *)(v4 + 32);
    double v5 = *(double *)(v4 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    double v8 = v5 * 3.14159265 / 180.0;
    double v9 = v6 * 3.14159265 / 180.0;
    double v10 = *(double *)(v7 + 40) * 3.14159265 / 180.0 - v8;
    __double2 v11 = __sincos_stret(*(double *)(v7 + 32) * 3.14159265 / 180.0);
    __double2 v12 = __sincos_stret(v10);
    __double2 v13 = __sincos_stret(v9);
    long double v14 = v13.__cosval + v11.__cosval * v12.__cosval;
    double v15 = atan2(v13.__sinval + v11.__sinval, sqrt(v11.__cosval * v12.__sinval * (v11.__cosval * v12.__sinval) + v14 * v14));
    double v16 = atan2(v11.__cosval * v12.__sinval, v14);
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v17 = (void *)getCLLocationClass_softClass_37627;
    uint64_t v30 = getCLLocationClass_softClass_37627;
    if (!getCLLocationClass_softClass_37627)
    {
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __getCLLocationClass_block_invoke_37628;
      v26[3] = &unk_264E5EC88;
      v26[4] = &v27;
      __getCLLocationClass_block_invoke_37628((uint64_t)v26);
      v17 = (void *)v28[3];
    }
    v18 = v17;
    _Block_object_dispose(&v27, 8);
    v19 = (void *)[[v18 alloc] initWithLatitude:v15 * 180.0 / 3.14159265 longitude:(v8 + v16) * 180.0 / 3.14159265];
    v20 = [*(id *)(a1 + 32) output];
    v21 = (void *)MEMORY[0x263F337C8];
    v22 = [MEMORY[0x263F337E8] locationLocation];
    v23 = [v21 itemWithObject:v19 origin:v22 disclosureLevel:1];
    [v20 addItem:v23];

    [*(id *)(a1 + 32) finishRunningWithError:0];
  }
  else
  {
    v24 = *(void **)(a1 + 32);
    uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v25) {
      uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    }
    [v24 finishRunningWithError:v25];
  }
}

- (void)getPlacemarkFromCollection:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__WFGetHalfwayPointAction_getPlacemarkFromCollection_completionHandler___block_invoke;
  v10[3] = &unk_264E5D218;
  id v11 = v5;
  id v12 = v6;
  id v8 = v5;
  id v9 = v6;
  [v8 generateCollectionByCoercingToItemClass:v7 completionHandler:v10];
}

void __72__WFGetHalfwayPointAction_getPlacemarkFromCollection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  double v10 = [v7 items];
  id v11 = [v10 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __72__WFGetHalfwayPointAction_getPlacemarkFromCollection_completionHandler___block_invoke_2;
    v18[3] = &unk_264E5C080;
    id v19 = *(id *)(a1 + 40);
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    __double2 v13 = (void *)getCLPlacemarkClass_softClass_37669;
    uint64_t v24 = getCLPlacemarkClass_softClass_37669;
    if (!getCLPlacemarkClass_softClass_37669)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __getCLPlacemarkClass_block_invoke_37670;
      v20[3] = &unk_264E5EC88;
      v20[4] = &v21;
      __getCLPlacemarkClass_block_invoke_37670((uint64_t)v20);
      __double2 v13 = (void *)v22[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v21, 8);
    [v12 getObjectRepresentation:v18 forClass:v14];
  }
  else
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __72__WFGetHalfwayPointAction_getPlacemarkFromCollection_completionHandler___block_invoke_3;
    v16[3] = &unk_264E5B5E8;
    double v15 = *(void **)(a1 + 32);
    id v17 = *(id *)(a1 + 40);
    [v15 getStringRepresentation:v16];
    id v12 = v17;
  }
}

uint64_t __72__WFGetHalfwayPointAction_getPlacemarkFromCollection_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__WFGetHalfwayPointAction_getPlacemarkFromCollection_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 length])
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2050000000;
    id v7 = (void *)getCLGeocoderClass_softClass;
    uint64_t v16 = getCLGeocoderClass_softClass;
    if (!getCLGeocoderClass_softClass)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __getCLGeocoderClass_block_invoke;
      v12[3] = &unk_264E5EC88;
      v12[4] = &v13;
      __getCLGeocoderClass_block_invoke((uint64_t)v12);
      id v7 = (void *)v14[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v13, 8);
    id v9 = objc_opt_new();
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __72__WFGetHalfwayPointAction_getPlacemarkFromCollection_completionHandler___block_invoke_4;
    v10[3] = &unk_264E5CE88;
    id v11 = *(id *)(a1 + 32);
    [v9 geocodeAddressString:v5 completionHandler:v10];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __72__WFGetHalfwayPointAction_getPlacemarkFromCollection_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 firstObject];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

@end