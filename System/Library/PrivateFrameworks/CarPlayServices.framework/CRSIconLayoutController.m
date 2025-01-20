@interface CRSIconLayoutController
- (BSServiceConnection)connection;
- (CRSIconLayoutController)init;
- (OS_dispatch_queue)callbackQueue;
- (void)dealloc;
- (void)exportIconStateForCertificateSerial:(id)a3 categories:(unint64_t)a4 completion:(id)a5;
- (void)fetchApplicationIconInformationForBundleIdentifier:(id)a3 vehicleID:(id)a4 showBorder:(BOOL)a5 completion:(id)a6;
- (void)fetchIconStateForVehicleID:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)resetIconStateForVehicleID:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setConnection:(id)a3;
- (void)setIconOrder:(id)a3 hiddenIcons:(id)a4 forVehicleID:(id)a5;
@end

@implementation CRSIconLayoutController

- (CRSIconLayoutController)init
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)CRSIconLayoutController;
  v2 = [(CRSIconLayoutController *)&v17 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x263F2B9C0];
    v4 = +[CRSIconLayoutServiceSpecification identifier];
    v5 = [v3 endpointForMachName:@"com.apple.CarPlayApp.service" service:v4 instance:0];

    uint64_t v6 = [MEMORY[0x263F2B9B8] connectionWithEndpoint:v5];
    connection = v2->_connection;
    v2->_connection = (BSServiceConnection *)v6;

    v8 = v2->_connection;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __31__CRSIconLayoutController_init__block_invoke;
    v15[3] = &unk_264443180;
    v9 = v2;
    v16 = v9;
    [(BSServiceConnection *)v8 configureConnection:v15];
    uint64_t Serial = BSDispatchQueueCreateSerial();
    callbackQueue = v9->_callbackQueue;
    v9->_callbackQueue = (OS_dispatch_queue *)Serial;

    v12 = CRSLogForCategory(1uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = v2->_connection;
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl(&dword_21D3CC000, v12, OS_LOG_TYPE_INFO, "Activating connection! %@", buf, 0xCu);
    }

    [(BSServiceConnection *)v2->_connection activate];
  }
  return v2;
}

void __31__CRSIconLayoutController_init__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = +[CRSIconLayoutServiceSpecification serviceQuality];
  [v5 setServiceQuality:v3];

  v4 = +[CRSIconLayoutServiceSpecification interface];
  [v5 setInterface:v4];

  [v5 setInterfaceTarget:*(void *)(a1 + 32)];
  [v5 setActivationHandler:&__block_literal_global_3];
  [v5 setInterruptionHandler:&__block_literal_global_66];
  [v5 setInvalidationHandler:&__block_literal_global_69];
}

void __31__CRSIconLayoutController_init__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = CRSLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_21D3CC000, v3, OS_LOG_TYPE_INFO, "Connection activated! %@", (uint8_t *)&v4, 0xCu);
  }
}

void __31__CRSIconLayoutController_init__block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = CRSLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_21D3CC000, v3, OS_LOG_TYPE_INFO, "[CRSIconLayoutController] connection interrupted! Reactivating... %@", (uint8_t *)&v4, 0xCu);
  }

  [v2 activate];
}

void __31__CRSIconLayoutController_init__block_invoke_67(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = CRSLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_21D3CC000, v3, OS_LOG_TYPE_INFO, "Connection invalidated! %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)dealloc
{
  v3 = [(CRSIconLayoutController *)self connection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)CRSIconLayoutController;
  [(CRSIconLayoutController *)&v4 dealloc];
}

- (void)fetchIconStateForVehicleID:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = CRSLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v6;
      _os_log_impl(&dword_21D3CC000, v8, OS_LOG_TYPE_INFO, "Fetching icon state for vehicle: %{public}@", buf, 0xCu);
    }

    v9 = [(CRSIconLayoutController *)self connection];
    v10 = [v9 remoteTarget];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __65__CRSIconLayoutController_fetchIconStateForVehicleID_completion___block_invoke;
    v11[3] = &unk_264443310;
    v11[4] = self;
    id v12 = v7;
    [v10 fetchIconStateForVehicleID:v6 completion:v11];
  }
}

void __65__CRSIconLayoutController_fetchIconStateForVehicleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = objc_opt_new();
  id v5 = [v3 iconOrder];
  [v4 setObject:v5 forKeyedSubscript:@"iconOrder"];

  id v6 = [v3 hiddenIcons];
  id v7 = objc_msgSend(v6, "bs_map:", &__block_literal_global_79);

  [v4 setObject:v7 forKeyedSubscript:@"hiddenIcons"];
  v8 = [v3 oemIconLabel];
  [v4 setObject:v8 forKeyedSubscript:@"OEMIconLabel"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "displaysOEMIcon"));
  [v4 setObject:v9 forKeyedSubscript:@"displaysOEMIcon"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "rows"));
  [v4 setObject:v10 forKeyedSubscript:@"rows"];

  v11 = NSNumber;
  uint64_t v12 = [v3 columns];

  v13 = [v11 numberWithUnsignedInteger:v12];
  [v4 setObject:v13 forKeyedSubscript:@"columns"];

  id v14 = [*(id *)(a1 + 32) callbackQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__CRSIconLayoutController_fetchIconStateForVehicleID_completion___block_invoke_3;
  v17[3] = &unk_2644432E8;
  id v15 = *(id *)(a1 + 40);
  id v18 = v4;
  id v19 = v15;
  id v16 = v4;
  dispatch_async(v14, v17);
}

uint64_t __65__CRSIconLayoutController_fetchIconStateForVehicleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

void __65__CRSIconLayoutController_fetchIconStateForVehicleID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)exportIconStateForCertificateSerial:(id)a3 categories:(unint64_t)a4 completion:(id)a5
{
  id v6 = a5;
  if (v6)
  {
    id v7 = a3;
    v8 = CRSLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D3CC000, v8, OS_LOG_TYPE_INFO, "Exporting icon state for vehicle by certificate serial.", buf, 2u);
    }

    id v9 = v6;
    CRVehicleIdentifierForCertificateSerial();
  }
}

void __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke(void *a1, uint64_t a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_2;
  v5[3] = &unk_264443388;
  objc_super v4 = (void *)a1[4];
  id v3 = (void *)a1[5];
  uint64_t v7 = a1[6];
  v5[4] = v4;
  id v6 = v3;
  [v4 fetchIconStateForVehicleID:a2 completion:v5];
}

void __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F30E78];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  id v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"iconOrder"];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_3;
  v17[3] = &unk_264443360;
  uint64_t v8 = *(void *)(a1 + 48);
  id v18 = v5;
  uint64_t v20 = v8;
  id v9 = v6;
  id v19 = v9;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:v17];
  v11 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_129;
  block[3] = &unk_2644432E8;
  id v12 = *(id *)(a1 + 40);
  id v15 = v9;
  id v16 = v12;
  id v13 = v9;
  dispatch_async(v11, block);
}

void __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_4;
  v7[3] = &unk_264443338;
  id v4 = *(id *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v8 = v4;
  uint64_t v10 = v5;
  id v9 = v6;
  [a2 enumerateObjectsUsingBlock:v7];
}

void __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_4(uint64_t a1, void *a2)
{
  v22[3] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([v3 isEqualToString:@"com.apple.cardisplay.OEM"] & 1) == 0
    && ([v3 isEqualToString:@"com.apple.cardisplay.nowplaying"] & 1) == 0)
  {
    id v4 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v3];
    uint64_t v5 = [MEMORY[0x263F30E68] requiredInfoKeys];
    id v6 = [v4 objectsForInfoDictionaryKeys:v5];

    uint64_t v7 = [MEMORY[0x263F30E68] requiredEntitlementKeys];
    id v8 = [v4 entitlementValuesForKeys:v7];

    id v9 = [MEMORY[0x263F30E68] declarationForBundleIdentifier:v3 info:v6 entitlements:v8];
    uint64_t v10 = [*(id *)(a1 + 32) effectivePolicyForAppDeclaration:v9];
    v11 = v10;
    uint64_t v12 = *(void *)(a1 + 48);
    if ((v12 & 1) == 0 && ([v10 applicationCategory] & v12) == 0)
    {
      id v16 = CRSLogForCategory(1uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_4_cold_1((uint64_t)v3, v11, v16);
      }
      goto LABEL_38;
    }
    id v13 = [v4 localizedNameForContext:@"Car"];
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v4 localizedNameForContext:0];
    }
    id v16 = v15;

    if (([v11 applicationCategory] & 0x10) != 0)
    {
      id v18 = @"audio";
    }
    else if (([v11 applicationCategory] & 4) != 0)
    {
      id v18 = @"calling";
    }
    else if (([v11 applicationCategory] & 2) != 0)
    {
      id v18 = @"messaging";
    }
    else if (([v11 applicationCategory] & 8) != 0)
    {
      id v18 = @"navigation";
    }
    else if (([v11 applicationCategory] & 0x20) != 0)
    {
      id v18 = @"automaker";
    }
    else if (([v11 applicationCategory] & 0x200) != 0)
    {
      id v18 = @"parking";
    }
    else if (([v11 applicationCategory] & 0x100) != 0)
    {
      id v18 = @"charging";
    }
    else if (([v11 applicationCategory] & 0x80) != 0)
    {
      id v18 = @"quick ordering";
    }
    else if (([v11 applicationCategory] & 0x400) != 0)
    {
      id v18 = @"productivity";
    }
    else if (([v11 applicationCategory] & 0x800) != 0)
    {
      id v18 = @"fueling";
    }
    else
    {
      if (([v11 applicationCategory] & 0x1000) == 0)
      {
        objc_super v17 = CRSLogForCategory(1uLL);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_4_cold_2((uint64_t)v3, v17);
        }
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      id v18 = @"driving task";
    }
    id v19 = *(void **)(a1 + 40);
    v21[0] = @"CARApplicationLocalizedNameKey";
    v21[1] = @"CARApplicationBundleIdentifierKey";
    uint64_t v20 = &stru_26CDC5C80;
    if (v16) {
      uint64_t v20 = (__CFString *)v16;
    }
    v22[0] = v20;
    v22[1] = v3;
    v21[2] = @"CARApplicationCategoryKey";
    v22[2] = v18;
    objc_super v17 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
    [v19 addObject:v17];
    goto LABEL_37;
  }
LABEL_39:
}

void __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_129(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [MEMORY[0x263EFF8C0] arrayWithArray:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)setIconOrder:(id)a3 hiddenIcons:(id)a4 forVehicleID:(id)a5
{
  v21[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = objc_msgSend(a3, "bs_map:", &__block_literal_global_135);
  v11 = objc_msgSend(v9, "bs_map:", &__block_literal_global_138);

  uint64_t v12 = [[CRSIconLayoutPage alloc] initWithIcons:v10];
  id v13 = [CRSIconLayoutState alloc];
  v21[0] = v12;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  id v15 = [(CRSIconLayoutState *)v13 initWithPages:v14 hiddenIcons:v11];

  id v16 = CRSLogForCategory(1uLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v19 = 138543362;
    id v20 = v8;
    _os_log_impl(&dword_21D3CC000, v16, OS_LOG_TYPE_INFO, "Setting icon state for vehicle: %{public}@", (uint8_t *)&v19, 0xCu);
  }

  objc_super v17 = [(CRSIconLayoutController *)self connection];
  id v18 = [v17 remoteTarget];
  [v18 setIconState:v15 forVehicleID:v8];
}

CRSApplicationIcon *__65__CRSIconLayoutController_setIconOrder_hiddenIcons_forVehicleID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[CRSApplicationIcon alloc] initWithBundleIdentifier:v2];

  return v3;
}

CRSApplicationIcon *__65__CRSIconLayoutController_setIconOrder_hiddenIcons_forVehicleID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[CRSApplicationIcon alloc] initWithBundleIdentifier:v2];

  return v3;
}

- (void)resetIconStateForVehicleID:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = CRSLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_21D3CC000, v5, OS_LOG_TYPE_INFO, "Resetting icon state for vehicle: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(CRSIconLayoutController *)self connection];
  uint64_t v7 = [v6 remoteTarget];
  [v7 resetIconStateForVehicleID:v4];
}

- (void)fetchApplicationIconInformationForBundleIdentifier:(id)a3 vehicleID:(id)a4 showBorder:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    id v13 = CRSLogForCategory(1uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v10;
      __int16 v21 = 2114;
      id v22 = v11;
      _os_log_impl(&dword_21D3CC000, v13, OS_LOG_TYPE_INFO, "Fetching icon information for bundle ID: %@, vehicle: %{public}@", buf, 0x16u);
    }

    id v14 = [(CRSIconLayoutController *)self connection];
    id v15 = [v14 remoteTarget];
    id v16 = [NSNumber numberWithBool:v7];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __110__CRSIconLayoutController_fetchApplicationIconInformationForBundleIdentifier_vehicleID_showBorder_completion___block_invoke;
    v17[3] = &unk_2644433F8;
    void v17[4] = self;
    id v18 = v12;
    [v15 fetchApplicationIconInformationForBundleIdentifier:v10 vehicleID:v11 drawBorder:v16 completion:v17];
  }
}

void __110__CRSIconLayoutController_fetchApplicationIconInformationForBundleIdentifier_vehicleID_showBorder_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __110__CRSIconLayoutController_fetchApplicationIconInformationForBundleIdentifier_vehicleID_showBorder_completion___block_invoke_2;
  v7[3] = &unk_2644432E8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __110__CRSIconLayoutController_fetchApplicationIconInformationForBundleIdentifier_vehicleID_showBorder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = CRSLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(CRSIconLayoutController *)self connection];
    int v6 = 138412290;
    BOOL v7 = v4;
    _os_log_impl(&dword_21D3CC000, v3, OS_LOG_TYPE_INFO, "Invalidating connection! %@", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(CRSIconLayoutController *)self connection];
  [v5 invalidate];
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_4_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "applicationCategory"));
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_debug_impl(&dword_21D3CC000, a3, OS_LOG_TYPE_DEBUG, "Ignoring app %@ with categories %@", (uint8_t *)&v6, 0x16u);
}

void __85__CRSIconLayoutController_exportIconStateForCertificateSerial_categories_completion___block_invoke_4_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21D3CC000, a2, OS_LOG_TYPE_DEBUG, "Unable to determine a category for %@", (uint8_t *)&v2, 0xCu);
}

@end