@interface HDNotificationSyncDiagnosticOperation
- (id)reportFilename;
- (void)_appendCSVLine:(id)a3;
- (void)_appendNotificationInstructions:(id)a3;
- (void)run;
@end

@implementation HDNotificationSyncDiagnosticOperation

- (id)reportFilename
{
  return @"HealthNotificationSync.csv";
}

- (void)run
{
  id v3 = objc_alloc_init(MEMORY[0x263F0A410]);
  v4 = dispatch_semaphore_create(0);
  id v5 = objc_alloc(MEMORY[0x263F0A570]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__HDNotificationSyncDiagnosticOperation_run__block_invoke;
  v8[3] = &unk_264866DB8;
  v8[4] = self;
  v6 = (void *)[v5 initWithResultsHandler:v8];
  [v3 executeQuery:v6];
  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v4, v7)) {
    [(HDDiagnosticOperation *)self log:@"ERROR: Timed out attempting collect Notification Sync instructions"];
  }
}

void __44__HDNotificationSyncDiagnosticOperation_run__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  dispatch_time_t v7 = *(void **)(a1 + 32);
  id v9 = v6;
  if (v6)
  {
    v8 = [MEMORY[0x263F0A568] propertyNames];
    [v7 _appendCSVLine:v8];

    [*(id *)(a1 + 32) _appendNotificationInstructions:v9];
  }
  else
  {
    [v7 log:@"ERROR: Failed to collect Notification Sync instructions: %@", a4];
  }
}

- (void)_appendNotificationInstructions:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x22A6B8D40](v5);
        v11 = objc_msgSend(v9, "propertyValues", (void)v12);
        [(HDNotificationSyncDiagnosticOperation *)self _appendCSVLine:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }
}

- (void)_appendCSVLine:(id)a3
{
  objc_msgSend(a3, "hk_map:", &__block_literal_global);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v5 componentsJoinedByString:@","];
  [(HDDiagnosticOperation *)self appendString:v4];
}

id __56__HDNotificationSyncDiagnosticOperation__appendCSVLine___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 stringByReplacingOccurrencesOfString:@"\" withString:@"\\\"];
  id v3 = [NSString stringWithFormat:@"\"%@\"", v2];

  return v3;
}

@end