@interface AMSDeviceOffersStore
+ (id)serialsBySubtractingAGroups:(id)a3 fromBGroups:(id)a4;
+ (id)serialsFromGroups:(id)a3;
+ (id)splitGroups:(id)a3 byItem:(id)a4;
- (NSArray)cachedRegistrationGroups;
- (NSArray)companionSerialNumbers;
- (NSArray)deviceOffers;
- (NSArray)deviceRegistrationDenyList;
- (NSDictionary)deviceOfferEligibility;
- (void)_dbSetNullableValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (void)removeCachedRegistrationItem:(id)a3;
- (void)setCachedRegistrationGroups:(id)a3;
- (void)setDeviceOfferEligibility:(id)a3;
- (void)setDeviceOffers:(id)a3;
- (void)setDeviceRegistrationDenyList:(id)a3;
@end

@implementation AMSDeviceOffersStore

- (NSArray)cachedRegistrationGroups
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (+[AMSDefaults migratedStorageToDefaultsForNonAMSInternal])
  {
    v2 = +[AMSDefaults deviceGroups];
    if (v2)
    {
LABEL_3:
      v3 = objc_msgSend(v2, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_44);
      goto LABEL_12;
    }
  }
  else
  {
    v4 = [[AMSStorageDatabase alloc] initWithDomain:@"com.apple.AppleMediaServices"];
    id v12 = 0;
    v2 = [(AMSStorageDatabase *)v4 valueForKey:@"deviceGroups" error:&v12];
    id v5 = v12;
    if (v5)
    {
      v6 = +[AMSLogConfig sharedDeviceOffersConfig];
      if (!v6)
      {
        v6 = +[AMSLogConfig sharedConfig];
      }
      v7 = [v6 OSLogObject];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = objc_opt_class();
        v9 = AMSLogKey();
        v10 = AMSLogableError(v5);
        *(_DWORD *)buf = 138543874;
        uint64_t v14 = v8;
        __int16 v15 = 2114;
        v16 = v9;
        __int16 v17 = 2114;
        v18 = v10;
        _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] There was an error fetching cached device groups: %{public}@", buf, 0x20u);
      }
    }

    if (v2) {
      goto LABEL_3;
    }
  }
  v3 = 0;
LABEL_12:

  return (NSArray *)v3;
}

AMSDeviceOfferRegistrationGroup *__48__AMSDeviceOffersStore_cachedRegistrationGroups__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[AMSDeviceOfferRegistrationGroup alloc] initWithDatabaseEntry:v2];

  return v3;
}

- (NSArray)companionSerialNumbers
{
  id v2 = [(AMSDeviceOffersStore *)self deviceOfferEligibility];
  v3 = [v2 objectForKeyedSubscript:@"companionSerialNumbers"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (NSDictionary)deviceOfferEligibility
{
  BOOL v2 = +[AMSDefaults migratedStorageToDefaultsForNonAMSInternal];
  v3 = off_1E559C350;
  if (v2) {
    v3 = off_1E559BE48;
  }
  id v4 = [(__objc2_class *)*v3 deviceOfferEligibility];
  return (NSDictionary *)v4;
}

- (NSArray)deviceOffers
{
  BOOL v2 = [(AMSDeviceOffersStore *)self deviceOfferEligibility];
  v3 = [v2 objectForKeyedSubscript:@"deviceOffers"];

  return (NSArray *)v3;
}

- (NSArray)deviceRegistrationDenyList
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!+[AMSDefaults migratedStorageToDefaultsForNonAMSInternal])
  {
    id v5 = [[AMSStorageDatabase alloc] initWithDomain:@"com.apple.AppleMediaServices"];
    id v17 = 0;
    BOOL v2 = [(AMSStorageDatabase *)v5 valueForKey:@"deviceRegistrationBlacklist" error:&v17];
    id v6 = v17;
    if (v6)
    {
      v7 = +[AMSLogConfig sharedDeviceOffersConfig];
      if (!v7)
      {
        v7 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = objc_opt_class();
        v10 = AMSLogKey();
        v11 = AMSLogableError(v6);
        *(_DWORD *)buf = 138543874;
        uint64_t v19 = v9;
        __int16 v20 = 2114;
        v21 = v10;
        __int16 v22 = 2114;
        id v23 = v11;
        _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] There was an error fetching denylist: %{public}@", buf, 0x20u);
      }
    }

    if (v2) {
      goto LABEL_3;
    }
LABEL_12:
    id v4 = 0;
    goto LABEL_15;
  }
  BOOL v2 = +[AMSDefaults deviceRegistrationDenyList];
  if (!v2) {
    goto LABEL_12;
  }
LABEL_3:
  id v3 = v2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

LABEL_15:
  id v12 = +[AMSLogConfig sharedConfig];
  if (!v12)
  {
    id v12 = +[AMSLogConfig sharedConfig];
  }
  v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = objc_opt_class();
    __int16 v15 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v14;
    __int16 v20 = 2114;
    v21 = v15;
    __int16 v22 = 2114;
    id v23 = v4;
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Looking up denylist: %{public}@", buf, 0x20u);
  }
  return (NSArray *)v4;
}

- (void)setCachedRegistrationGroups:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(a3, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_21_1);
  if (+[AMSDefaults migratedStorageToDefaultsForNonAMSInternal])
  {
    +[AMSDefaults setDeviceGroups:v4];
  }
  else
  {
    id v11 = 0;
    [(AMSDeviceOffersStore *)self _dbSetNullableValue:v4 forKey:@"deviceGroups" error:&v11];
    id v5 = v11;
    if (v5)
    {
      id v6 = +[AMSLogConfig sharedDeviceOffersConfig];
      if (!v6)
      {
        id v6 = +[AMSLogConfig sharedConfig];
      }
      v7 = [v6 OSLogObject];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = objc_opt_class();
        uint64_t v9 = AMSLogKey();
        v10 = AMSLogableError(v5);
        *(_DWORD *)buf = 138543874;
        uint64_t v13 = v8;
        __int16 v14 = 2114;
        __int16 v15 = v9;
        __int16 v16 = 2114;
        id v17 = v10;
        _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] There was an error writing device groups to db: %{public}@", buf, 0x20u);
      }
    }
  }
}

uint64_t __52__AMSDeviceOffersStore_setCachedRegistrationGroups___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeToDictionary];
}

- (void)setDeviceOfferEligibility:(id)a3
{
  id v5 = a3;
  BOOL v3 = +[AMSDefaults migratedStorageToDefaultsForNonAMSInternal];
  id v4 = off_1E559C350;
  if (v3) {
    id v4 = off_1E559BE48;
  }
  [(__objc2_class *)*v4 setDeviceOfferEligibility:v5];
}

- (void)setDeviceOffers:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  uint64_t v6 = [(AMSDeviceOffersStore *)self deviceOfferEligibility];
  v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F1CC08];
  }
  id v10 = [v4 dictionaryWithDictionary:v8];

  [v10 setObject:v5 forKeyedSubscript:@"deviceOffers"];
  uint64_t v9 = (void *)[v10 copy];
  [(AMSDeviceOffersStore *)self setDeviceOfferEligibility:v9];
}

- (void)setDeviceRegistrationDenyList:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[AMSLogConfig sharedDeviceOffersConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = AMSLogKey();
    *(_DWORD *)buf = 138544130;
    uint64_t v18 = v7;
    __int16 v19 = 2114;
    __int16 v20 = v8;
    __int16 v21 = 1024;
    LODWORD(v22[0]) = +[AMSDefaults migratedStorageToDefaultsForNonAMSInternal];
    WORD2(v22[0]) = 2114;
    *(void *)((char *)v22 + 6) = v4;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating device offer denylist (%d): %{public}@", buf, 0x26u);
  }
  if (+[AMSDefaults migratedStorageToDefaultsForNonAMSInternal])
  {
    id v9 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    +[AMSDefaults setDeviceRegistrationDenyList:v10];
  }
  else
  {
    id v16 = 0;
    [(AMSDeviceOffersStore *)self _dbSetNullableValue:v4 forKey:@"deviceRegistrationBlacklist" error:&v16];
    id v10 = v16;
    if (v10)
    {
      id v11 = +[AMSLogConfig sharedDeviceOffersConfig];
      if (!v11)
      {
        id v11 = +[AMSLogConfig sharedConfig];
      }
      id v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = objc_opt_class();
        __int16 v14 = AMSLogKey();
        __int16 v15 = AMSLogableError(v10);
        *(_DWORD *)buf = 138543874;
        uint64_t v18 = v13;
        __int16 v19 = 2114;
        __int16 v20 = v14;
        __int16 v21 = 2114;
        v22[0] = v15;
        _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] There was an error writing the device registration denylist to db: %{public}@", buf, 0x20u);
      }
    }
  }
}

- (void)_dbSetNullableValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v10 = a3;
  id v7 = a4;
  uint64_t v8 = [[AMSStorageDatabase alloc] initWithDomain:@"com.apple.AppleMediaServices"];
  id v9 = v8;
  if (v10) {
    [(AMSStorageDatabase *)v8 setValue:v10 forKey:v7 error:a5];
  }
  else {
    [(AMSStorageDatabase *)v8 deleteForKey:v7 error:a5];
  }
}

- (void)removeCachedRegistrationItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  uint64_t v6 = [(AMSDeviceOffersStore *)self cachedRegistrationGroups];
  id v7 = [v5 splitGroups:v6 byItem:v4];

  uint64_t v8 = [v7 first];
  id v16 = [v7 second];
  [(AMSDeviceOffersStore *)self setCachedRegistrationGroups:v16];
  id v9 = [(id)objc_opt_class() serialsBySubtractingAGroups:v16 fromBGroups:v8];
  id v10 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v11 = [(AMSDeviceOffersStore *)self deviceRegistrationDenyList];
  id v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = MEMORY[0x1E4F1CBF0];
  }
  __int16 v14 = [v10 setWithArray:v13];

  [v14 minusSet:v9];
  __int16 v15 = [v14 allObjects];
  [(AMSDeviceOffersStore *)self setDeviceRegistrationDenyList:v15];
}

+ (id)splitGroups:(id)a3 byItem:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        __int16 v14 = [v13 registrationItems];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __43__AMSDeviceOffersStore_splitGroups_byItem___block_invoke;
        v20[3] = &unk_1E55A2088;
        id v21 = v6;
        int v15 = objc_msgSend(v14, "ams_anyWithTest:", v20);

        if (v15) {
          id v16 = v7;
        }
        else {
          id v16 = v8;
        }
        [v16 addObject:v13];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  id v17 = [[AMSPair alloc] initWithFirst:v7 second:v8];
  return v17;
}

uint64_t __43__AMSDeviceOffersStore_splitGroups_byItem___block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 serialNumber];
  id v5 = [v3 serialNumber];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

+ (id)serialsBySubtractingAGroups:(id)a3 fromBGroups:(id)a4
{
  id v6 = a4;
  id v7 = [a1 serialsFromGroups:a3];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v9 = [a1 serialsFromGroups:v6];

  uint64_t v10 = [v8 setWithSet:v9];

  [v10 minusSet:v7];
  uint64_t v11 = (void *)[v10 copy];

  return v11;
}

+ (id)serialsFromGroups:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "registrationItems", (void)v14);
        uint64_t v11 = objc_msgSend(v10, "ams_mapWithTransform:", &__block_literal_global_29_0);

        [v4 addObjectsFromArray:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = (void *)[v4 copy];
  return v12;
}

uint64_t __42__AMSDeviceOffersStore_serialsFromGroups___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serialNumber];
}

@end