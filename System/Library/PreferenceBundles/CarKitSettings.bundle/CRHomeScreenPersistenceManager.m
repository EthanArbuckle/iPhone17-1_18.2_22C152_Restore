@interface CRHomeScreenPersistenceManager
+ (id)_iconStateDebugDescription:(id)a3;
- (BOOL)drawIconBorders;
- (CRCarPlayAppPolicyEvaluator)evaluator;
- (CRHomeScreenPersistenceManager)initWithVehicleId:(id)a3 certificateSerial:(id)a4;
- (CRSIconLayoutController)iconLayoutController;
- (NSData)vehicleCertificateSerial;
- (NSString)vehicleId;
- (id)_iconForBundleIdentifier:(id)a3;
- (void)_processIconStateResponse:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)fetchIconStateWithCompletion:(id)a3;
- (void)resetIconState;
- (void)setDrawIconBorders:(BOOL)a3;
- (void)setEvaluator:(id)a3;
- (void)setIconLayoutController:(id)a3;
- (void)setIconState:(id)a3 hiddenIcons:(id)a4;
@end

@implementation CRHomeScreenPersistenceManager

- (CRHomeScreenPersistenceManager)initWithVehicleId:(id)a3 certificateSerial:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CRHomeScreenPersistenceManager;
  v9 = [(CRHomeScreenPersistenceManager *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_vehicleId, a3);
    objc_storeStrong((id *)&v10->_vehicleCertificateSerial, a4);
    v11 = (CRSIconLayoutController *)objc_alloc_init((Class)CRSIconLayoutController);
    iconLayoutController = v10->_iconLayoutController;
    v10->_iconLayoutController = v11;

    v13 = (CRCarPlayAppPolicyEvaluator *)objc_alloc_init((Class)CRCarPlayAppPolicyEvaluator);
    evaluator = v10->_evaluator;
    v10->_evaluator = v13;

    v15 = +[GEOCountryConfiguration sharedConfiguration];
    -[CRCarPlayAppPolicyEvaluator setGeoSupported:](v10->_evaluator, "setGeoSupported:", [v15 currentCountrySupportsCarIntegration]);
  }
  return v10;
}

- (void)dealloc
{
  v3 = [(CRHomeScreenPersistenceManager *)self iconLayoutController];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)CRHomeScreenPersistenceManager;
  [(CRHomeScreenPersistenceManager *)&v4 dealloc];
}

- (void)fetchIconStateWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = CarGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(CRHomeScreenPersistenceManager *)self vehicleId];
      *(_DWORD *)buf = 138412290;
      objc_super v17 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Fetching icon state for vehicle %@", buf, 0xCu);
    }
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_CAB4;
    v13 = &unk_24B48;
    v14 = self;
    id v15 = v4;
    id v7 = objc_retainBlock(&v10);
    id v8 = [(CRHomeScreenPersistenceManager *)self iconLayoutController];
    v9 = [(CRHomeScreenPersistenceManager *)self vehicleId];
    [v8 fetchIconStateForVehicleID:v9 completion:v7];
  }
}

- (void)setIconState:(id)a3 hiddenIcons:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(CRHomeScreenPersistenceManager *)self iconLayoutController];
  id v8 = [(CRHomeScreenPersistenceManager *)self vehicleId];
  [v9 setIconOrder:v7 hiddenIcons:v6 forVehicleID:v8];
}

- (void)resetIconState
{
  id v4 = [(CRHomeScreenPersistenceManager *)self iconLayoutController];
  v3 = [(CRHomeScreenPersistenceManager *)self vehicleId];
  [v4 resetIconStateForVehicleID:v3];
}

+ (id)_iconStateDebugDescription:(id)a3
{
  uint64_t v3 = kCRSIconLayoutDisplaysOEMIcon;
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:v3];
  id v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 BOOLValue]);
  id v7 = [v4 objectForKeyedSubscript:kCRSIconLayoutOEMIconLabel];
  id v8 = [v4 objectForKeyedSubscript:kCRSIconLayoutIconOrderKey];
  id v9 = [v8 firstObject];
  v10 = [v4 objectForKeyedSubscript:kCRSIconLayoutHiddenIconsKey];

  uint64_t v11 = +[NSString stringWithFormat:@"%@ '%@', %@ icons, %@ hidden apps", v6, v7, v9, v10];

  return v11;
}

- (id)_iconForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v34 = 0;
  v35 = (id *)&v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_D1E0;
  v38 = sub_D1F0;
  id v39 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_D1E0;
  v32 = sub_D1F0;
  id v33 = 0;
  v5 = [[CRApplicationIcon alloc] initWithBundleIdentifier:v4];
  if ([(CRApplicationIcon *)v5 hasCustomImage])
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_D1F8;
    v22[3] = &unk_24B70;
    v26 = &v34;
    v27 = &v28;
    id v7 = v4;
    id v23 = v7;
    v24 = self;
    id v8 = v6;
    v25 = v8;
    id v9 = objc_retainBlock(v22);
    v10 = [(CRHomeScreenPersistenceManager *)self iconLayoutController];
    uint64_t v11 = [(CRHomeScreenPersistenceManager *)self vehicleId];
    objc_msgSend(v10, "fetchApplicationIconInformationForBundleIdentifier:vehicleID:showBorder:completion:", v7, v11, -[CRHomeScreenPersistenceManager drawIconBorders](self, "drawIconBorders"), v9);

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    v12 = v23;
LABEL_14:

    [(CRApplicationIcon *)v5 setDisplayName:v35[5]];
    [(CRApplicationIcon *)v5 setIconImage:v29[5]];
    v19 = v5;
    goto LABEL_15;
  }
  id v8 = +[LSApplicationProxy applicationProxyForIdentifier:v4];
  v12 = +[CRCarPlayAppDeclaration declarationForAppProxy:v8];
  v13 = [(CRHomeScreenPersistenceManager *)self evaluator];
  v14 = [(CRHomeScreenPersistenceManager *)self vehicleCertificateSerial];
  id v15 = [v13 effectivePolicyForAppDeclaration:v12 inVehicleWithCertificateSerial:v14];

  if ([v15 isCarPlaySupported])
  {
    if ([v4 isEqualToString:CRSBooksIdentifier])
    {
      id v16 = [v8 localizedNameForContext:@"Car"];
      objc_super v17 = v16;
      if (!v16)
      {
        objc_super v17 = [v8 localizedNameForContext:0];
      }
      objc_storeStrong(v35 + 5, v17);
      if (!v16) {
    }
      }
    else
    {
      uint64_t v20 = [v8 localizedName];
      id v16 = v35[5];
      v35[5] = (id)v20;
    }

    goto LABEL_14;
  }
  v18 = CarGeneralLogging();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v4;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Application %@ is not supported in this vehicle.", buf, 0xCu);
  }

  v19 = 0;
LABEL_15:

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v19;
}

- (void)_processIconStateResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v34 = (void (**)(id, void *))a4;
  uint64_t v36 = +[NSMutableDictionary dictionaryWithDictionary:v6];
  id v7 = CarGeneralLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(id)objc_opt_class() _iconStateDebugDescription:v6];
    *(_DWORD *)buf = 138412290;
    v49 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Processing icon state response: %@", buf, 0xCu);
  }
  v35 = v6;

  uint64_t v33 = kCRSIconLayoutIconOrderKey;
  id v9 = objc_msgSend(v36, "objectForKeyedSubscript:");
  v10 = [v9 firstObject];

  uint64_t v11 = +[NSMutableArray array];
  v12 = [v36 objectForKeyedSubscript:kCRSIconLayoutDisplaysOEMIcon];
  unsigned int v13 = [v12 BOOLValue];

  v37 = [v36 objectForKeyedSubscript:kCRSIconLayoutOEMIconLabel];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v14 = v10;
  id v15 = [v14 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v43;
    uint64_t v18 = CRSOEMIdentifier;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v43 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if (([v20 isEqualToString:v18] ^ 1 | v13) == 1)
        {
          v21 = [(CRHomeScreenPersistenceManager *)self _iconForBundleIdentifier:v20];
          if (v21)
          {
            if ([v20 isEqualToString:v18] && objc_msgSend(v37, "length")) {
              [v21 setDisplayName:v37];
            }
            [v11 addObject:v21];
          }
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v16);
  }

  v22 = +[NSArray arrayWithArray:v11];
  [v36 setObject:v22 forKeyedSubscript:v33];

  id v23 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v24 = kCRSIconLayoutHiddenIconsKey;
  v25 = [v36 objectForKeyedSubscript:kCRSIconLayoutHiddenIconsKey];
  id v26 = [v25 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v39;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v39 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = [(CRHomeScreenPersistenceManager *)self _iconForBundleIdentifier:*(void *)(*((void *)&v38 + 1) + 8 * (void)j)];
        if (v30) {
          [v23 addObject:v30];
        }
      }
      id v27 = [v25 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v27);
  }

  v31 = +[NSArray arrayWithArray:v23];
  [v36 setObject:v31 forKeyedSubscript:v24];

  v32 = +[NSDictionary dictionaryWithDictionary:v36];
  v34[2](v34, v32);
}

- (NSString)vehicleId
{
  return self->_vehicleId;
}

- (NSData)vehicleCertificateSerial
{
  return self->_vehicleCertificateSerial;
}

- (BOOL)drawIconBorders
{
  return self->_drawIconBorders;
}

- (void)setDrawIconBorders:(BOOL)a3
{
  self->_drawIconBorders = a3;
}

- (CRSIconLayoutController)iconLayoutController
{
  return self->_iconLayoutController;
}

- (void)setIconLayoutController:(id)a3
{
}

- (CRCarPlayAppPolicyEvaluator)evaluator
{
  return self->_evaluator;
}

- (void)setEvaluator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_iconLayoutController, 0);
  objc_storeStrong((id *)&self->_vehicleCertificateSerial, 0);

  objc_storeStrong((id *)&self->_vehicleId, 0);
}

@end