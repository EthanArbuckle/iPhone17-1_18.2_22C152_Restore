@interface IMSimulatedAccountController
- (IMSimulatedAccountController)init;
- (id)activeAccounts;
- (id)activeIMessageAccount;
- (id)activeSMSAccount;
- (void)setSimulatedAccounts:(id)a3 forServiceNamed:(id)a4;
@end

@implementation IMSimulatedAccountController

- (void)setSimulatedAccounts:(id)a3 forServiceNamed:(id)a4
{
}

- (id)activeAccounts
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = self->_simulatedAccountsPerService;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v4);
        }
        v12 = objc_msgSend_objectForKey_(self->_simulatedAccountsPerService, v7, *(void *)(*((void *)&v16 + 1) + 8 * i), v8, (void)v16);
        objc_msgSend_addObjectsFromArray_(v3, v13, (uint64_t)v12, v14);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v16, (uint64_t)v20, 16);
    }
    while (v9);
  }

  return v3;
}

- (id)activeIMessageAccount
{
  id v3 = objc_msgSend_objectForKey_(self->_simulatedAccountsPerService, a2, *MEMORY[0x1E4F6E1B0], v2);
  v7 = objc_msgSend_firstObject(v3, v4, v5, v6);

  return v7;
}

- (id)activeSMSAccount
{
  id v3 = objc_msgSend_objectForKey_(self->_simulatedAccountsPerService, a2, *MEMORY[0x1E4F6E1A0], v2);
  v7 = objc_msgSend_firstObject(v3, v4, v5, v6);

  return v7;
}

- (IMSimulatedAccountController)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMSimulatedAccountController;
  uint64_t v2 = [(IMAccountController *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    simulatedAccountsPerService = v2->_simulatedAccountsPerService;
    v2->_simulatedAccountsPerService = v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end