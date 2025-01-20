@interface WFHealthKitAccessResource
+ (BOOL)alwaysMakeAvailable;
+ (BOOL)isSystemResource;
- (HKHealthStore)healthStore;
- (WFHealthKitAccessResource)initWithDefinition:(id)a3;
- (id)associatedAppIdentifier;
- (id)importErrorReasonForStatus:(unint64_t)a3;
- (id)localizedErrorReasonForStatus:(unint64_t)a3;
- (id)localizedErrorRecoveryOptionsForStatus:(unint64_t)a3;
- (id)localizedProtectedResourceDescriptionWithContext:(id)a3;
- (id)objectTypes;
- (id)objectTypesForAccessType:(id)a3;
- (id)readTypes;
- (id)readableUnauthorizedResourceDescription;
- (id)writeTypes;
- (unint64_t)status;
- (void)attemptRecoveryFromErrorWithOptionIndex:(unint64_t)a3 userInterface:(id)a4 completionHandler:(id)a5;
- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4;
- (void)refreshAvailability;
@end

@implementation WFHealthKitAccessResource

- (void).cxx_destruct
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)attemptRecoveryFromErrorWithOptionIndex:(unint64_t)a3 userInterface:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(WFHealthKitAccessResource *)self status] == 3)
  {
    v9 = [MEMORY[0x263F33718] sharedContext];
    v10 = [NSURL URLWithString:@"x-apple-health://"];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __101__WFHealthKitAccessResource_attemptRecoveryFromErrorWithOptionIndex_userInterface_completionHandler___block_invoke;
    v11[3] = &unk_264E59738;
    id v12 = v8;
    [v9 openURL:v10 withBundleIdentifier:@"com.apple.Health" userInterface:v7 completionHandler:v11];
  }
  else
  {
    [(WFHealthKitAccessResource *)self makeAvailableWithUserInterface:v7 completionHandler:v8];
  }
}

uint64_t __101__WFHealthKitAccessResource_attemptRecoveryFromErrorWithOptionIndex_userInterface_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)localizedErrorRecoveryOptionsForStatus:(unint64_t)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  if (a3 == 3)
  {
    v3 = WFLocalizedString(@"Open Health");
    v8[0] = v3;
    v4 = (void **)v8;
  }
  else
  {
    v3 = WFLocalizedString(@"Allow Access");
    id v7 = v3;
    v4 = &v7;
  }
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v5;
}

- (id)importErrorReasonForStatus:(unint64_t)a3
{
  v3 = [(WFHealthKitAccessResource *)self readableUnauthorizedResourceDescription];
  if ([v3 length])
  {
    v4 = NSString;
    v5 = WFLocalizedString(@"In order to answer this question, Shortcuts needs access to your %@ data.");
    v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)localizedErrorReasonForStatus:(unint64_t)a3
{
  v4 = [(WFHealthKitAccessResource *)self readableUnauthorizedResourceDescription];
  if ([v4 length])
  {
    v5 = NSString;
    if (a3 == 3) {
      v6 = @"Health access to %@ is off. You can turn on health data categories in the Health app.";
    }
    else {
      v6 = @"Shortcuts does not have access to your %@ data.";
    }
    id v7 = WFLocalizedString(v6);
    id v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v4);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (![a3 isRunningWithSiriUI])
  {
    id v7 = [(WFHealthKitAccessResource *)self objectTypes];
    if ([v7 count])
    {
      id v8 = [(WFHealthKitAccessResource *)self healthStore];
      v9 = [(WFHealthKitAccessResource *)self writeTypes];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __78__WFHealthKitAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
      v10[3] = &unk_264E5CD58;
      v10[4] = self;
      id v11 = v6;
      [v8 requestAuthorizationToShareTypes:v9 readTypes:v7 completion:v10];
    }
    else
    {
      (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1, 0);
    }
    goto LABEL_9;
  }
  if (self->_status != 4)
  {
    [(WFResource *)self refreshAvailabilityWithNotification];
    if (self->_status != 4)
    {
      id v7 = [MEMORY[0x263F087E8] wfUnsupportedUserInterfaceError];
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v7);
LABEL_9:

      goto LABEL_10;
    }
  }
  (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1, 0);
LABEL_10:
}

void __78__WFHealthKitAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __78__WFHealthKitAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2;
  v8[3] = &unk_264E587D8;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __78__WFHealthKitAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshAvailabilityWithForcedNotification];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)refreshAvailability
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v3 = [(WFHealthKitAccessResource *)self objectTypes];
  if ([v3 count])
  {
    v4 = [(WFHealthKitAccessResource *)self healthStore];
    id v5 = [MEMORY[0x263F089C8] indexSet];
    [(WFHealthKitAccessResource *)self writeTypes];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v35;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(v5, "addIndex:", objc_msgSend(v4, "authorizationStatusForType:", *(void *)(*((void *)&v34 + 1) + 8 * v9++)));
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v7);
    }

    id v10 = [MEMORY[0x263F089C8] indexSet];
    [(WFHealthKitAccessResource *)self readTypes];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v31;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(v10, "addIndex:", objc_msgSend(v4, "authorizationStatusForType:", *(void *)(*((void *)&v30 + 1) + 8 * v14++)));
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v12);
    }

    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 1;
    if ([v5 containsIndex:1]) {
      v27[3] = 3;
    }
    v15 = [MEMORY[0x263F088D0] indexSetWithIndex:2];
    if ([v5 isEqualToIndexSet:v15])
    {
      BOOL v16 = [v11 count] == 0;

      v17 = v27;
      if (v16) {
        v27[3] = 4;
      }
    }
    else
    {

      v17 = v27;
    }
    unint64_t v18 = v17[3];
    if (v18 == 1)
    {
      dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __48__WFHealthKitAccessResource_refreshAvailability__block_invoke;
      v23[3] = &unk_264E55BD8;
      v25 = &v26;
      v20 = v19;
      v24 = v20;
      [v4 getRequestStatusForAuthorizationToShareTypes:v6 readTypes:v3 completion:v23];
      dispatch_time_t v21 = dispatch_time(0, 2000000000);
      dispatch_semaphore_wait(v20, v21);

      unint64_t v18 = v27[3];
    }
    self->_status = v18;
    v22.receiver = self;
    v22.super_class = (Class)WFHealthKitAccessResource;
    [(WFAccessResource *)&v22 refreshAvailability];
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    self->_status = 4;
    v38.receiver = self;
    v38.super_class = (Class)WFHealthKitAccessResource;
    [(WFAccessResource *)&v38 refreshAvailability];
  }
}

intptr_t __48__WFHealthKitAccessResource_refreshAvailability__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 4;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)readableUnauthorizedResourceDescription
{
  v3 = [(WFHealthKitAccessResource *)self healthStore];
  v4 = objc_opt_new();
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  BOOL v16 = __68__WFHealthKitAccessResource_readableUnauthorizedResourceDescription__block_invoke;
  v17 = &unk_264E55BB0;
  id v5 = v3;
  id v18 = v5;
  id v6 = v4;
  id v19 = v6;
  uint64_t v7 = (uint64_t (**)(void *, void *, uint64_t))_Block_copy(&v14);
  uint64_t v8 = [(WFHealthKitAccessResource *)self readTypes];
  if (v7[2](v7, v8, 2))
  {
    uint64_t v9 = [(WFHealthKitAccessResource *)self writeTypes];
    char v10 = v7[2](v7, v9, 1);

    if (v10)
    {
      uint64_t v11 = [MEMORY[0x263F08950] localizedStringByJoiningStrings:v6];
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v11 = WFLocalizedString(@"Health");
LABEL_6:
  uint64_t v12 = (void *)v11;

  return v12;
}

uint64_t __68__WFHealthKitAccessResource_readableUnauthorizedResourceDescription__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 allObjects];
  if ([v5 count])
  {
    unint64_t v6 = 0;
    uint64_t v7 = sel_hk_localizedName;
    unint64_t v8 = 0x263F0A000uLL;
    unint64_t v9 = 0x263F0A000uLL;
    char v10 = @"Workout";
    uint64_t v22 = a3;
    do
    {
      uint64_t v11 = [v5 objectAtIndexedSubscript:v6];
      uint64_t v12 = [*(id *)(a1 + 32) authorizationStatusForType:v11];
      if (a3 == 1 && v12 == 2) {
        goto LABEL_13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          [v11 identifier];
          uint64_t v15 = v7;
          unint64_t v16 = v8;
          unint64_t v17 = v9;
          v19 = id v18 = v10;
          uint64_t v14 = +[WFHealthKitHelper readableSampleTypeIdentifierFromSampleTypeIdentifier:v19];

          char v10 = v18;
          unint64_t v9 = v17;
          unint64_t v8 = v16;
          uint64_t v7 = v15;
          a3 = v22;
          goto LABEL_12;
        }
        uint64_t v13 = objc_msgSend(v11, "hk_localizedName");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          uint64_t v20 = 0;
          goto LABEL_15;
        }
        uint64_t v13 = WFLocalizedString(v10);
      }
      uint64_t v14 = (void *)v13;
LABEL_12:
      [*(id *)(a1 + 40) addObject:v14];

LABEL_13:
      ++v6;
    }
    while (v6 < [v5 count]);
  }
  uint64_t v20 = 1;
LABEL_15:

  return v20;
}

- (id)writeTypes
{
  return [(WFHealthKitAccessResource *)self objectTypesForAccessType:@"Write"];
}

- (id)readTypes
{
  return [(WFHealthKitAccessResource *)self objectTypesForAccessType:@"Read"];
}

- (id)objectTypes
{
  return [(WFHealthKitAccessResource *)self objectTypesForAccessType:0];
}

- (id)objectTypesForAccessType:(id)a3
{
  v51[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v41 = (id)objc_opt_new();
  id v5 = [(WFResource *)self definition];
  unint64_t v6 = [v5 objectForKeyedSubscript:@"Resources"];
  uint64_t v7 = objc_opt_class();
  unint64_t v8 = WFEnforceClass(v6, v7);

  if (!v8)
  {
    unint64_t v8 = [(WFResource *)self definition];

    if (v8)
    {
      unint64_t v9 = [(WFResource *)self definition];
      v51[0] = v9;
      unint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:1];
    }
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v47;
    uint64_t v45 = *MEMORY[0x263F09C28];
    uint64_t v42 = *MEMORY[0x263F09C20];
    uint64_t v43 = *(void *)v47;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v47 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v46 + 1) + 8 * v13);
        uint64_t v15 = objc_opt_class();
        unint64_t v16 = WFEnforceClass(v14, v15);
        unint64_t v17 = v16;
        if (v16)
        {
          if (!v4
            || ([v16 objectForKeyedSubscript:@"AccessType"],
                id v18 = objc_claimAutoreleasedReturnValue(),
                int v19 = [v18 isEqualToString:v4],
                v18,
                v19))
          {
            id v20 = v17;
            dispatch_time_t v21 = [v20 objectForKeyedSubscript:@"ObjectType"];
            if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {

              uint64_t v22 = [v20 objectForKeyedSubscript:@"ReadableType"];
              v23 = [v20 objectForKeyedSubscript:@"ReadableObjectTypeIdentifier"];

              if (v23)
              {
                v23 = [v20 objectForKeyedSubscript:@"ReadableObjectTypeIdentifier"];
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                BOOL v24 = v23 != 0;
                if ([v22 isEqualToString:@"Quantity"] && v23)
                {
                  v25 = +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:v23];
                  uint64_t v26 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:v25];
                  goto LABEL_27;
                }
              }
              else
              {

                [v22 isEqualToString:@"Quantity"];
                BOOL v24 = 0;
                v23 = 0;
              }
              if ([v22 isEqualToString:@"Workout"])
              {
                dispatch_time_t v21 = [MEMORY[0x263F0A598] workoutType];
                goto LABEL_28;
              }
              if (([v22 isEqualToString:@"Characteristic"] & v24) == 1)
              {
                v25 = +[WFHealthKitHelper characteristicTypeIdentifierFromReadableTypeIdentifier:v23];
                uint64_t v26 = [MEMORY[0x263F0A598] characteristicTypeForIdentifier:v25];
                goto LABEL_27;
              }
              if ([v22 isEqualToString:@"Category"])
              {
                v25 = +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:v23];
                uint64_t v26 = [MEMORY[0x263F0A598] categoryTypeForIdentifier:v25];
LABEL_27:
                dispatch_time_t v21 = (void *)v26;
              }
              else
              {
                if ([v22 isEqualToString:@"Correlation"])
                {
                  long long v37 = NSString;
                  objc_super v38 = WFLocalizedString(@"%@ types are not implemented");
                  uint64_t v39 = objc_msgSend(v37, "localizedStringWithFormat:", v38, v22);

                  id v40 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:v39 userInfo:0];
                  objc_exception_throw(v40);
                }
                dispatch_time_t v21 = 0;
              }
LABEL_28:
            }
            if (![v4 isEqualToString:@"Write"]
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v27 = v21;
              uint64_t v28 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithObjects:", v27, 0);
              uint64_t v29 = [v27 identifier];
              if ([v29 isEqualToString:v45])
              {

                goto LABEL_34;
              }
              long long v30 = [v27 identifier];
              int v31 = [v30 isEqualToString:v42];

              if (v31)
              {
LABEL_34:
                long long v32 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:v42];
                [v28 addObject:v32];

                long long v33 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:v45];
                [v28 addObject:v33];
              }
              long long v34 = (void *)[v28 copy];

              [v41 unionSet:v34];
            }

            uint64_t v12 = v43;
          }
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v35 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
      uint64_t v11 = v35;
    }
    while (v35);
  }

  return v41;
}

- (WFHealthKitAccessResource)initWithDefinition:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFHealthKitAccessResource;
  v3 = [(WFAccessResource *)&v8 initWithDefinition:a3];
  if (v3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x263F0A410], "wf_shortcutsAppHealthStore");
    healthStore = v3->_healthStore;
    v3->_healthStore = (HKHealthStore *)v4;

    unint64_t v6 = v3;
  }

  return v3;
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = WFLocalizedStringResourceWithKey(@"your Health data", @"your Health data");
  id v5 = [v3 localize:v4];

  return v5;
}

- (id)associatedAppIdentifier
{
  return @"com.apple.Health";
}

+ (BOOL)isSystemResource
{
  return 1;
}

+ (BOOL)alwaysMakeAvailable
{
  return 1;
}

@end