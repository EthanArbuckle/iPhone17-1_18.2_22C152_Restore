@interface CAFGroupReadRequest
- (id)groupRequestValueForRequests:(id)a3;
- (id)requestForCharacteristic:(id)a3;
- (void)completedRequests:(id)a3 withResponse:(id)a4;
@end

@implementation CAFGroupReadRequest

- (id)requestForCharacteristic:(id)a3
{
  id v3 = a3;
  if ([v3 readable])
  {
    v4 = +[CAFRequest requestWithCharacteristic:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)groupRequestValueForRequests:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (!v4 || (v5 = v4, (objc_opt_isKindOfClass() & 1) == 0))
  {

    v6 = CAFGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CAFGroupReadRequest groupRequestValueForRequests:](v6);
    }

    v5 = 0;
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "characteristic", (void)v16);
        v14 = [v13 readInstanceIDs];
        [v7 addObjectsFromArray:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
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
          long long v16 = [v15 instanceID];
          long long v17 = [v14 objectForKeyedSubscript:v16];

          if (v17)
          {
            long long v18 = [v13 characteristic];
            long long v19 = [v13 characteristic];
            v20 = [v19 instanceID];
            [v18 handleRead:v20 value:v17];
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
  _os_log_error_impl(&dword_249710000, log, OS_LOG_TYPE_ERROR, "Generating group read request value failed", v1, 2u);
}

@end