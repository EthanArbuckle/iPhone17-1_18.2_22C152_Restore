@interface SAPerson
- (BOOL)ad_transcriptionResultRequiresAddressBook;
- (id)_ad_personContactHandlesWithAddressBookManager:(id)a3;
- (id)ad_transcriptionResultWithAddressBookManager:(id)a3;
@end

@implementation SAPerson

- (id)_ad_personContactHandlesWithAddressBookManager:(id)a3
{
  id v25 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v5 = [(SAPerson *)self emails];
  id v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v11 = [v10 label];
        v12 = [v10 emailAddress];
        if (v12)
        {
          id v13 = objc_alloc_init((Class)STPersonContactHandle);
          [v13 setType:0];
          [v13 setLabel:v11];
          [v13 setHandle:v12];
          [v4 addObject:v13];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v14 = [(SAPerson *)self phones];
  id v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
        v20 = [v19 label];
        v21 = [v19 number];
        if (v21)
        {
          id v22 = objc_alloc_init((Class)STPersonContactHandle);
          [v22 setType:1];
          [v22 setLabel:v20];
          [v22 setHandle:v21];
          [v4 addObject:v22];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v16);
  }

  v23 = [v25 contactHandlesForPerson:self];
  [v4 unionSet:v23];

  return v4;
}

- (BOOL)ad_transcriptionResultRequiresAddressBook
{
  return 1;
}

- (id)ad_transcriptionResultWithAddressBookManager:(id)a3
{
  id v4 = (ADAddressBookManager *)a3;
  if (!v4) {
    id v4 = objc_alloc_init(ADAddressBookManager);
  }
  id v5 = objc_alloc_init((Class)STPerson);
  id v6 = [(SAPerson *)self fullName];
  [v5 setFullName:v6];

  id v7 = [(SAPerson *)self _ad_personContactHandlesWithAddressBookManager:v4];
  [v5 setContactHandles:v7];

  return v5;
}

@end