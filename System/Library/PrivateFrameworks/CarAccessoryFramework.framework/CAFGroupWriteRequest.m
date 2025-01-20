@interface CAFGroupWriteRequest
- (id)groupRequestValueForRequests:(id)a3;
- (id)requestForCharacteristic:(id)a3;
- (void)addCharacteristic:(id)a3 value:(id)a4;
- (void)addCharacteristicsAndValues:(id)a3;
- (void)completedRequests:(id)a3 withResponse:(id)a4;
@end

@implementation CAFGroupWriteRequest

- (void)addCharacteristic:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__CAFGroupWriteRequest_addCharacteristic_value___block_invoke;
  v10[3] = &unk_265263398;
  id v11 = v6;
  id v12 = v7;
  v13 = self;
  id v8 = v7;
  id v9 = v6;
  [(CAFGroupRequest *)self _lockedPerformBlock:v10];
}

uint64_t __48__CAFGroupWriteRequest_addCharacteristic_value___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[CAFWriteRequest requestWithCharacteristic:*(void *)(a1 + 32) value:*(void *)(a1 + 40)];
  if (v2) {
    [*(id *)(a1 + 48) _addRequest:v2];
  }
  return MEMORY[0x270F9A758]();
}

- (void)addCharacteristicsAndValues:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__CAFGroupWriteRequest_addCharacteristicsAndValues___block_invoke;
  v6[3] = &unk_265263280;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(CAFGroupRequest *)self _lockedPerformBlock:v6];
}

uint64_t __52__CAFGroupWriteRequest_addCharacteristicsAndValues___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__CAFGroupWriteRequest_addCharacteristicsAndValues___block_invoke_2;
  v3[3] = &unk_2652633C0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __52__CAFGroupWriteRequest_addCharacteristicsAndValues___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = +[CAFWriteRequest requestWithCharacteristic:a2 value:a3];
  if (v4) {
    [*(id *)(a1 + 32) _addRequest:v4];
  }
  return MEMORY[0x270F9A758]();
}

- (id)requestForCharacteristic:(id)a3
{
  return 0;
}

- (id)groupRequestValueForRequests:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (!v5 || (id v6 = v5, (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v7 = CAFGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CAFGroupWriteRequest groupRequestValueForRequests:](v7);
    }

    id v6 = 0;
  }
  v20 = v5;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v15 = [v14 value];
        v16 = v15;
        if (!v15)
        {
          v3 = [MEMORY[0x263EFF9D0] null];
          v16 = v3;
        }
        v17 = [v14 characteristic];
        v18 = [v17 instanceID];
        [v8 setObject:v16 forKeyedSubscript:v18];

        if (!v15) {
      }
        }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  return v8;
}

- (void)completedRequests:(id)a3 withResponse:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 values];

  if (v7)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v21 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
          v14 = [v6 values];
          v15 = [v13 characteristic];
          v16 = [v15 instanceID];
          v17 = [v14 objectForKeyedSubscript:v16];

          if (v17)
          {
            v18 = [v13 characteristic];
            v19 = [v13 characteristic];
            v20 = [v19 instanceID];
            [v18 handleWrite:v20 value:v17];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    id v5 = v21;
  }
}

- (void)groupRequestValueForRequests:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_249710000, log, OS_LOG_TYPE_ERROR, "Generating group write request value failed", v1, 2u);
}

@end