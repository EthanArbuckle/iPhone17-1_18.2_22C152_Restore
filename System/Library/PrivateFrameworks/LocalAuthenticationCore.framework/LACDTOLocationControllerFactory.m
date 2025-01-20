@interface LACDTOLocationControllerFactory
+ (id)controllerWithStore:(id)a3 featureController:(id)a4 eventBus:(id)a5 workQueue:(id)a6;
@end

@implementation LACDTOLocationControllerFactory

+ (id)controllerWithStore:(id)a3 featureController:(id)a4 eventBus:(id)a5 workQueue:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke;
  v39[3] = &unk_2653B5B90;
  id v12 = v11;
  id v40 = v12;
  id v13 = v9;
  id v41 = v13;
  id v42 = v10;
  id v14 = v10;
  id v15 = a5;
  v16 = __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke((uint64_t)v39);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_3;
  v35[3] = &unk_2653B5BB8;
  id v17 = v16;
  id v36 = v17;
  id v18 = v13;
  id v37 = v18;
  id v19 = v12;
  id v38 = v19;
  v20 = __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_3(v35);
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_4;
  v30 = &unk_2653B5BE0;
  id v31 = v17;
  id v32 = v18;
  id v33 = v20;
  id v34 = v19;
  id v21 = v19;
  id v22 = v20;
  id v23 = v18;
  id v24 = v17;
  v25 = __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_4(&v27);
  objc_msgSend(v25, "setEventBus:", v15, v27, v28, v29, v30);

  return v25;
}

LACDTOLocationProviderModeDecorator *__92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke(uint64_t a1)
{
  v2 = [LACDTOLocationProviderModeDecorator alloc];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_2;
  id v9 = &unk_2653B5B68;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  v3 = __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_2((uint64_t)&v6);
  v4 = -[LACDTOLocationProviderModeDecorator initWithLocationProvider:featureController:](v2, "initWithLocationProvider:featureController:", v3, *(void *)(a1 + 48), v6, v7);

  return v4;
}

LACDTOLocationProviderTaskDecorator *__92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_2(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    v2 = [[LACDTOLocationProviderCRAdapter alloc] initWithWorkQueue:*(void *)(a1 + 32)];
    v3 = [[LACDTOLocationProviderTaskDecorator alloc] initWithLocationProvider:v2 workQueue:*(void *)(a1 + 32)];
  }
  else
  {
    v3 = [[LACDTOLocationProviderKVSAdapter alloc] initWithKVStore:*(void *)(a1 + 40)];
  }
  return v3;
}

LACDTOLocationMonitor *__92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_3(void *a1)
{
  v2 = [[LACDTOLocationProviderPersistenceDecorator alloc] initWithLocationProvider:a1[4] store:a1[5] cacheEnabled:1];
  v3 = [[LACDTOLocationMonitor alloc] initWithLocationProvider:v2 workQueue:a1[6]];

  return v3;
}

LACDTOLocationController *__92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_4(void *a1)
{
  v2 = [[LACDTOLocationProviderPersistenceDecorator alloc] initWithLocationProvider:a1[4] store:a1[5] cacheEnabled:0];
  v3 = [[LACDTOLocationController alloc] initWithLocationProvider:v2 monitor:a1[6] workQueue:a1[7]];

  return v3;
}

@end