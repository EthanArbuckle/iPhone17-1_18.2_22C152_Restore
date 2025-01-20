@interface BLSHDisableFlipbookPowerSavingAttributeHandler
+ (id)registerHandlerForService:(id)a3 provider:(id)a4;
- (id)initForService:(id)a3 provider:(id)a4;
- (void)activateAttributes:(id)a3 fromAssertion:(id)a4 forService:(id)a5;
- (void)deactivateAttributes:(id)a3 fromAssertion:(id)a4 forService:(id)a5;
@end

@implementation BLSHDisableFlipbookPowerSavingAttributeHandler

+ (id)registerHandlerForService:(id)a3 provider:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initForService:v7 provider:v6];

  v11[0] = objc_opt_class();
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  [v7 registerAttributeHandler:v8 forAttributeClasses:v9];

  return v8;
}

- (id)initForService:(id)a3 provider:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BLSHDisableFlipbookPowerSavingAttributeHandler;
  id v7 = [(BLSHDisableFlipbookPowerSavingAttributeHandler *)&v10 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_provider, a4);
  }

  return v8;
}

- (void)activateAttributes:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          -[BLSHFlipbookPowerSavingProviding incrementDisablePowerSavingUsageCountForReason:](self->_provider, "incrementDisablePowerSavingUsageCountForReason:", [v11 reason]);
        }
        else
        {
          v12 = bls_assertions_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            v13 = objc_opt_class();
            *(_DWORD *)buf = 134218498;
            v20 = self;
            __int16 v21 = 2112;
            v22 = v11;
            __int16 v23 = 2112;
            v24 = v13;
            id v14 = v13;
            _os_log_fault_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_FAULT, "%p cannot activate invalid attribute:%@ not of class:%@", buf, 0x20u);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v8);
  }
}

- (void)deactivateAttributes:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          -[BLSHFlipbookPowerSavingProviding decrementDisablePowerSavingUsageCountForReason:](self->_provider, "decrementDisablePowerSavingUsageCountForReason:", [v11 reason]);
        }
        else
        {
          v12 = bls_assertions_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            v13 = objc_opt_class();
            *(_DWORD *)buf = 134218498;
            v20 = self;
            __int16 v21 = 2112;
            v22 = v11;
            __int16 v23 = 2112;
            v24 = v13;
            id v14 = v13;
            _os_log_fault_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_FAULT, "%p cannot deactivate invalid attribute:%@ not of class:%@", buf, 0x20u);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
}

@end