@interface CRRecentContactsLibrary(CloudRecentsExtensions)
- (void)recordContactEventsForHeaders:()CloudRecentsExtensions recentsDomain:;
@end

@implementation CRRecentContactsLibrary(CloudRecentsExtensions)

- (void)recordContactEventsForHeaders:()CloudRecentsExtensions recentsDomain:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v27 = a4;
  context = (void *)MEMORY[0x1BA9A6250]();
  v6 = (void *)MEMORY[0x1E4F1CA80];
  v7 = (void *)[v5 copyAddressListForTo];
  v8 = [v6 setWithArray:v7];

  v9 = (void *)[v5 copyAddressListForCc];
  [v8 addObjectsFromArray:v9];

  v10 = (void *)[v5 copyAddressListForBcc];
  [v8 addObjectsFromArray:v10];

  v11 = (void *)[v5 copyAddressListForReplyTo];
  [v8 addObjectsFromArray:v11];

  v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v12 = [MEMORY[0x1E4F1C9C8] date];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v8;
  uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    uint64_t v16 = *MEMORY[0x1E4F5CC60];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "ea_uncommentedAddress");
        v20 = objc_msgSend(v18, "cnaui_copyDisplayableAddressComment");
        v21 = [MEMORY[0x1E4F5CCE0] recentEventForAddress:v19 displayName:v20 kind:v16 date:v12 weight:0 metadata:0 options:1];
        if (v21) {
          [v29 addObject:v21];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v14);
  }

  v22 = (void *)[v5 copyAddressListForSender];
  v23 = [v22 firstObject];
  v24 = objc_msgSend(v23, "ea_uncommentedAddress");

  [a1 recordContactEvents:v29 recentsDomain:v27 sendingAddress:v24 completion:0];
}

@end