@interface _CDHomeManagerUtilities
+ (id)sharedInstance;
- (_CDHomeManagerUtilities)init;
- (id)contactKeysToFetch;
- (id)contactsInHome;
@end

@implementation _CDHomeManagerUtilities

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken5_1 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken5_1, &__block_literal_global_66);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_4;
  return v2;
}

- (_CDHomeManagerUtilities)init
{
  v9.receiver = self;
  v9.super_class = (Class)_CDHomeManagerUtilities;
  v2 = [(_CDHomeManagerUtilities *)&v9 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc((Class)getHMHomeManagerConfigurationClass()) initWithOptions:8 cachePolicy:2];
    uint64_t v4 = [objc_alloc((Class)getHMHomeManagerClass()) initWithHomeMangerConfiguration:v3];
    homeManager = v2->_homeManager;
    v2->_homeManager = (HMHomeManager *)v4;

    v6 = (CNContactStore *)objc_alloc_init((Class)getCNContactStoreClass());
    contactStore = v2->_contactStore;
    v2->_contactStore = v6;
  }
  return v2;
}

- (id)contactsInHome
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v28 = objc_opt_new();
  [(HMHomeManager *)self->_homeManager setDelegate:self];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v29 = self;
  obuint64_t j = [(HMHomeManager *)self->_homeManager homes];
  uint64_t v4 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        objc_super v9 = [v8 users];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v44 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v36;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v36 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v35 + 1) + 8 * j);
              v15 = [v14 userID];

              if (v15)
              {
                v16 = [v14 userID];
                [v3 addObject:v16];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v44 count:16];
          }
          while (v11);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v5);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = v3;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [getCNContactClass() predicateForContactsMatchingEmailAddress:*(void *)(*((void *)&v31 + 1) + 8 * k)];
        contactStore = v29->_contactStore;
        v24 = [(_CDHomeManagerUtilities *)v29 contactKeysToFetch];
        v25 = [(CNContactStore *)contactStore unifiedContactsMatchingPredicate:v22 keysToFetch:v24 error:0];
        v26 = [v25 firstObject];

        if (v26) {
          [v28 addObject:v26];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v19);
  }

  return v28;
}

- (id)contactKeysToFetch
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = getCNContactIdentifierKey();
  v13[0] = v2;
  v3 = getCNContactBirthdayKey();
  v13[1] = v3;
  uint64_t v4 = getCNContactRelationsKey();
  v13[2] = v4;
  uint64_t v5 = getCNContactGivenNameKey();
  v13[3] = v5;
  uint64_t v6 = getCNContactMiddleNameKey();
  v13[4] = v6;
  v7 = getCNContactFamilyNameKey();
  v13[5] = v7;
  v8 = getCNContactNicknameKey();
  v13[6] = v8;
  objc_super v9 = getCNContactPhoneNumbersKey();
  v13[7] = v9;
  uint64_t v10 = getCNContactEmailAddressesKey();
  v13[8] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
}

@end