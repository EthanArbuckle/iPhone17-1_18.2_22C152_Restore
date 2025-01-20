@interface CAFGroupDisableNotificationRequest
- (id)groupRequestValueForRequests:(id)a3;
- (id)requestForCharacteristic:(id)a3;
- (id)requestForControl:(id)a3;
- (void)addControl:(id)a3;
- (void)completedRequests:(id)a3 withResponse:(id)a4;
- (void)setNeedsForced;
@end

@implementation CAFGroupDisableNotificationRequest

- (void)addControl:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__CAFGroupDisableNotificationRequest_addControl___block_invoke;
  v6[3] = &unk_265263280;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CAFGroupRequest *)self _lockedPerformBlock:v6];
}

uint64_t __49__CAFGroupDisableNotificationRequest_addControl___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) requestForControl:*(void *)(a1 + 40)];
  if (v2) {
    [*(id *)(a1 + 32) _addRequest:v2];
  }
  return MEMORY[0x270F9A758]();
}

- (void)setNeedsForced
{
}

- (id)requestForCharacteristic:(id)a3
{
  id v3 = a3;
  if ([v3 notifies])
  {
    id v4 = +[CAFRequest requestWithCharacteristic:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)requestForControl:(id)a3
{
  id v3 = a3;
  if ([v3 notifies])
  {
    id v4 = +[CAFRequest requestWithControl:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)groupRequestValueForRequests:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (!v4 || (id v5 = v4, (objc_opt_isKindOfClass() & 1) == 0))
  {

    v6 = CAFGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CAFGroupEnableNotificationRequest groupRequestValueForRequests:](v6);
    }

    id v5 = 0;
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "characteristic", (void)v19);
        v15 = [v14 registrationInstanceIDs];
        [v7 addObjectsFromArray:v15];

        v16 = [v13 control];
        v17 = [v16 registrationInstanceIDs];
        [v7 addObjectsFromArray:v17];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)completedRequests:(id)a3 withResponse:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [a4 values];

  if (v6)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v28 = v5;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v39;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v39 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v38 + 1) + 8 * v10);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          v12 = objc_msgSend(v11, "characteristic", v28);
          v13 = [v12 registrationInstanceIDs];

          uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v35;
            do
            {
              uint64_t v17 = 0;
              do
              {
                if (*(void *)v35 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * v17);
                long long v19 = [v11 characteristic];
                [v19 handleRegistrationWithInstanceID:v18 registered:0];

                ++v17;
              }
              while (v15 != v17);
              uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
            }
            while (v15);
          }

          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v20 = [v11 control];
          long long v21 = [v20 registrationInstanceIDs];

          uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v42 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v31;
            do
            {
              uint64_t v25 = 0;
              do
              {
                if (*(void *)v31 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void *)(*((void *)&v30 + 1) + 8 * v25);
                v27 = [v11 control];
                [v27 handleRegistrationWithInstanceID:v26 registered:0];

                ++v25;
              }
              while (v23 != v25);
              uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v42 count:16];
            }
            while (v23);
          }

          ++v10;
        }
        while (v10 != v8);
        uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v8);
    }

    id v5 = v28;
  }
}

@end