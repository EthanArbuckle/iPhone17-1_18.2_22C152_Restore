@interface _IDSRegistrationAccountManager
- (NSMutableArray)knownDevices;
- (NSMutableArray)knownRegistrations;
- (NSMutableDictionary)accountIDToAccounts;
- (_IDSRegistrationAccountManager)init;
- (id)_findOrCreateDeviceForDictionary:(id)a3;
- (id)_findOrCreateRegistrationInfoForDictionary:(id)a3;
- (id)accountIDToRegistrationMapping;
- (id)allAccountIDs;
- (id)registeredDeviceInfoForAccountID:(id)a3;
- (void)_deleteUnusedRegistrationData;
- (void)removeAllRecords;
- (void)setAccountIDToAccounts:(id)a3;
- (void)setKnownDevices:(id)a3;
- (void)setKnownRegistrations:(id)a3;
- (void)updateAccount:(id)a3 withRegistration:(id)a4;
@end

@implementation _IDSRegistrationAccountManager

- (_IDSRegistrationAccountManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)_IDSRegistrationAccountManager;
  v2 = [(_IDSRegistrationAccountManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    knownDevices = v2->_knownDevices;
    v2->_knownDevices = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    knownRegistrations = v2->_knownRegistrations;
    v2->_knownRegistrations = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    accountIDToAccounts = v2->_accountIDToAccounts;
    v2->_accountIDToAccounts = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (void)updateAccount:(id)a3 withRegistration:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v11 = 0;
    uint64_t v12 = *(void *)v25;
    uint64_t v13 = *MEMORY[0x1E4F6AEB8];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v16 = [(_IDSRegistrationAccountManager *)self _findOrCreateRegistrationInfoForDictionary:v15];
        [v7 addObject:v16];
        if (!v11)
        {
          v11 = [v15 objectForKeyedSubscript:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  v17 = [[_IDSRegisteredAccount alloc] initWithAccountID:v23 service:v11 registeredDeviceInfo:v7];
  v18 = [(_IDSRegistrationAccountManager *)self accountIDToAccounts];
  v19 = [v18 allValues];
  char v20 = [v19 containsObject:v17];

  if ((v20 & 1) == 0)
  {
    v21 = +[IDSLogging RegistrationManager];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_191A3F574();
    }

    v22 = [(_IDSRegistrationAccountManager *)self accountIDToAccounts];
    [v22 setObject:v17 forKeyedSubscript:v23];
  }
  [(_IDSRegistrationAccountManager *)self _deleteUnusedRegistrationData];
}

- (id)_findOrCreateRegistrationInfoForDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(_IDSRegistrationAccountManager *)self knownRegistrations];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 isEqualToDictionary:v4])
        {
          v11 = v10;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v5 = [(_IDSRegistrationAccountManager *)self _findOrCreateDeviceForDictionary:v4];
  v11 = [[_IDSRegisteredDeviceInfo alloc] initWithDictionary:v4 device:v5];
  uint64_t v12 = +[IDSLogging RegistrationManager];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_191A3F5E0(v11, v12);
  }

  uint64_t v13 = [(_IDSRegistrationAccountManager *)self knownRegistrations];
  [v13 addObject:v11];

LABEL_13:

  return v11;
}

- (void)_deleteUnusedRegistrationData
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(_IDSRegistrationAccountManager *)self knownRegistrations];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(_IDSRegistrationAccountManager *)self knownDevices];
  uint64_t v6 = (void *)[v5 mutableCopy];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v28 = self;
  uint64_t v7 = [(_IDSRegistrationAccountManager *)self accountIDToAccounts];
  uint64_t v8 = [v7 allKeys];

  obuint64_t j = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v27 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v13 = [(_IDSRegistrationAccountManager *)v28 accountIDToAccounts];
        v14 = [v13 objectForKeyedSubscript:v12];

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v15 = [v14 registeredDeviceInfo];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v30 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void **)(*((void *)&v29 + 1) + 8 * j);
              [v4 removeObject:v20];
              v21 = [v20 device];
              [v6 removeObject:v21];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v17);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v10);
  }

  if ([v4 count])
  {
    v22 = +[IDSLogging RegistrationManager];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_191A3F6D8();
    }

    id v23 = [(_IDSRegistrationAccountManager *)v28 knownRegistrations];
    [v23 removeObjectsInArray:v4];
  }
  if ([v6 count])
  {
    long long v24 = +[IDSLogging RegistrationManager];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_191A3F66C();
    }

    long long v25 = [(_IDSRegistrationAccountManager *)v28 knownDevices];
    [v25 removeObjectsInArray:v6];
  }
}

- (id)_findOrCreateDeviceForDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[_IDSRegisteredDevice alloc] initWithDictionary:v4];

  uint64_t v6 = [(_IDSRegistrationAccountManager *)self knownDevices];
  uint64_t v7 = [v6 indexOfObject:v5];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = +[IDSLogging RegistrationManager];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_191A3F744(v5, v8);
    }

    uint64_t v9 = [(_IDSRegistrationAccountManager *)self knownDevices];
    [v9 addObject:v5];

    uint64_t v10 = v5;
  }
  else
  {
    v11 = [(_IDSRegistrationAccountManager *)self knownDevices];
    uint64_t v10 = [v11 objectAtIndexedSubscript:v7];
  }

  return v10;
}

- (id)registeredDeviceInfoForAccountID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(_IDSRegistrationAccountManager *)self accountIDToAccounts];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = objc_msgSend(v7, "registeredDeviceInfo", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    uint64_t v12 = *MEMORY[0x1E4F6AEB8];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
        long long v15 = (void *)[v14 mutableCopy];

        uint64_t v16 = [v7 service];
        [v15 setObject:v16 forKeyedSubscript:v12];

        [v5 addObject:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v5;
}

- (id)accountIDToRegistrationMapping
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1CA60] dictionary];
  v22 = self;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v3 = [(_IDSRegistrationAccountManager *)self accountIDToAccounts];
  id v4 = [v3 allKeys];

  obuint64_t j = v4;
  uint64_t v24 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v21 = *(void *)v31;
    uint64_t v5 = *MEMORY[0x1E4F6AEB8];
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v9 = [(_IDSRegistrationAccountManager *)v22 accountIDToAccounts];
        uint64_t v25 = v7;
        uint64_t v10 = [v9 objectForKeyedSubscript:v7];

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v11 = [v10 registeredDeviceInfo];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v27 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = [*(id *)(*((void *)&v26 + 1) + 8 * j) dictionaryRepresentation];
              uint64_t v17 = (void *)[v16 mutableCopy];

              long long v18 = [v10 service];
              [v17 setObject:v18 forKeyedSubscript:v5];

              [v8 addObject:v17];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v13);
        }

        [v23 setObject:v8 forKeyedSubscript:v25];
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v24);
  }

  return v23;
}

- (id)allAccountIDs
{
  v2 = [(_IDSRegistrationAccountManager *)self accountIDToAccounts];
  uint64_t v3 = [v2 allKeys];

  return v3;
}

- (void)removeAllRecords
{
  id v2 = [(_IDSRegistrationAccountManager *)self accountIDToAccounts];
  [v2 removeAllObjects];
}

- (NSMutableArray)knownDevices
{
  return self->_knownDevices;
}

- (void)setKnownDevices:(id)a3
{
}

- (NSMutableArray)knownRegistrations
{
  return self->_knownRegistrations;
}

- (void)setKnownRegistrations:(id)a3
{
}

- (NSMutableDictionary)accountIDToAccounts
{
  return self->_accountIDToAccounts;
}

- (void)setAccountIDToAccounts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIDToAccounts, 0);
  objc_storeStrong((id *)&self->_knownRegistrations, 0);

  objc_storeStrong((id *)&self->_knownDevices, 0);
}

@end