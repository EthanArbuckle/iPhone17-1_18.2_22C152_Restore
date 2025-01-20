@interface CAFGroupEnableNotificationRequest
- (id)groupRequestValueForRequests:(id)a3;
- (id)requestForCharacteristic:(id)a3;
- (id)requestForControl:(id)a3;
- (void)addControl:(id)a3;
- (void)completedRequests:(id)a3 withResponse:(id)a4;
@end

@implementation CAFGroupEnableNotificationRequest

- (void)addControl:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__CAFGroupEnableNotificationRequest_addControl___block_invoke;
  v6[3] = &unk_265263280;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CAFGroupRequest *)self _lockedPerformBlock:v6];
}

uint64_t __48__CAFGroupEnableNotificationRequest_addControl___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) requestForControl:*(void *)(a1 + 40)];
  if (v2) {
    [*(id *)(a1 + 32) _addRequest:v2];
  }
  return MEMORY[0x270F9A758]();
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
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 values];

  if (v7)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v42 = v5;
    id obj = v5;
    uint64_t v45 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (!v45) {
      goto LABEL_37;
    }
    uint64_t v44 = *(void *)v56;
    while (1)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v56 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v46 = v8;
        uint64_t v9 = *(void **)(*((void *)&v55 + 1) + 8 * v8);
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        uint64_t v10 = [v9 characteristic];
        uint64_t v11 = [v10 registrationInstanceIDs];

        uint64_t v12 = [v11 countByEnumeratingWithState:&v51 objects:v60 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v52;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v52 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v51 + 1) + 8 * v15);
              v17 = [v6 values];
              v18 = [v17 objectForKeyedSubscript:v16];

              long long v19 = [MEMORY[0x263EFF9D0] null];
              int v20 = [v18 isEqual:v19];

              if (v20)
              {
                long long v21 = [v9 characteristic];
                long long v22 = v21;
                uint64_t v23 = v16;
                uint64_t v24 = 0;
LABEL_16:
                [v21 handleRegistrationWithInstanceID:v23 value:v24 registered:1];
                goto LABEL_17;
              }
              long long v21 = [v9 characteristic];
              long long v22 = v21;
              uint64_t v23 = v16;
              if (v18)
              {
                uint64_t v24 = v18;
                goto LABEL_16;
              }
              [v21 handleRegistrationWithInstanceID:v16 registered:0];
LABEL_17:

              ++v15;
            }
            while (v13 != v15);
            uint64_t v25 = [v11 countByEnumeratingWithState:&v51 objects:v60 count:16];
            uint64_t v13 = v25;
          }
          while (v25);
        }

        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        v26 = [v9 control];
        v27 = [v26 registrationInstanceIDs];

        uint64_t v28 = [v27 countByEnumeratingWithState:&v47 objects:v59 count:16];
        if (!v28) {
          goto LABEL_35;
        }
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v48;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v48 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v47 + 1) + 8 * v31);
            v33 = [v6 values];
            v34 = [v33 objectForKeyedSubscript:v32];

            v35 = [MEMORY[0x263EFF9D0] null];
            int v36 = [v34 isEqual:v35];

            if (v36)
            {
              v37 = [v9 control];
              v38 = v37;
              uint64_t v39 = v32;
              v40 = 0;
LABEL_30:
              [v37 handleRegistrationWithInstanceID:v39 value:v40 registered:1];
              goto LABEL_31;
            }
            v37 = [v9 control];
            v38 = v37;
            uint64_t v39 = v32;
            if (v34)
            {
              v40 = v34;
              goto LABEL_30;
            }
            [v37 handleRegistrationWithInstanceID:v32 registered:0];
LABEL_31:

            ++v31;
          }
          while (v29 != v31);
          uint64_t v41 = [v27 countByEnumeratingWithState:&v47 objects:v59 count:16];
          uint64_t v29 = v41;
        }
        while (v41);
LABEL_35:

        uint64_t v8 = v46 + 1;
      }
      while (v46 + 1 != v45);
      uint64_t v45 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
      if (!v45)
      {
LABEL_37:

        id v5 = v42;
        break;
      }
    }
  }
}

- (void)groupRequestValueForRequests:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_249710000, log, OS_LOG_TYPE_ERROR, "Generating group enable notification request value failed", v1, 2u);
}

@end