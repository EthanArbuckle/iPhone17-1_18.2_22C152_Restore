@interface CRRecentContactsLibrary(CloudRecentsExtensions)
- (void)recordContactEventsForHeaders:()CloudRecentsExtensions recentsDomain:;
@end

@implementation CRRecentContactsLibrary(CloudRecentsExtensions)

- (void)recordContactEventsForHeaders:()CloudRecentsExtensions recentsDomain:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v32 = a4;
  context = (void *)MEMORY[0x1B3E86D20]();
  v7 = (void *)MEMORY[0x1E4F1CA80];
  v33 = v6;
  v8 = (void *)[v6 copyAddressListForTo];
  v34 = [v7 setWithArray:v8];

  v9 = (void *)[v6 copyAddressListForCc];
  [v34 addObjectsFromArray:v9];

  v10 = (void *)[v6 copyAddressListForBcc];
  [v34 addObjectsFromArray:v10];

  v11 = (void *)[v6 copyAddressListForReplyTo];
  [v34 addObjectsFromArray:v11];

  v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v34, "count"));
  v37 = [MEMORY[0x1E4F1C9C8] date];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v34;
  uint64_t v12 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v39;
    uint64_t v14 = *MEMORY[0x1E4F5CC60];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(id *)(*((void *)&v38 + 1) + 8 * i);
        v17 = [v16 emailAddressValue];
        v18 = [v17 simpleAddress];
        v19 = v18;
        if (v18)
        {
          id v20 = v18;
        }
        else
        {
          id v20 = [v16 stringValue];
        }
        v21 = v20;

        v22 = objc_msgSend(v16, "mf_copyDisplayableAddressComment");
        v23 = [MEMORY[0x1E4F5CCE0] recentEventForAddress:v21 displayName:v22 kind:v14 date:v37 weight:0 metadata:0 options:1];
        if (v23) {
          [v36 addObject:v23];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v12);
  }

  v24 = (void *)[v33 copyAddressListForSender];
  id v25 = [v24 firstObject];
  v26 = [v25 emailAddressValue];
  v27 = [v26 simpleAddress];
  v28 = v27;
  if (v27)
  {
    id v29 = v27;
  }
  else
  {
    id v29 = [v25 stringValue];
  }
  v30 = v29;

  [a1 recordContactEvents:v36 recentsDomain:v32 sendingAddress:v30 completion:0];
}

@end