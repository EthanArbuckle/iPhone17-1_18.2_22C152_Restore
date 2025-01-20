@interface MCCommunicationServiceRulesUtilities
+ (id)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4;
+ (id)restrictionsForValidatedCommunicationServiceRules:(id)a3;
+ (id)validServiceTypes;
+ (id)validatedCommunicationServiceRules:(id)a3 outError:(id *)a4;
@end

@implementation MCCommunicationServiceRulesUtilities

+ (id)validServiceTypes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"AudioCall";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)validatedCommunicationServiceRules:(id)a3 outError:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v6 = (void *)[a3 mutableCopy];
  id v33 = 0;
  v7 = [v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"DefaultServiceHandlers" isRequired:0 outError:&v33];
  id v8 = v33;
  v9 = (void *)[v7 mutableCopy];

  if (v8)
  {

    id v10 = 0;
  }
  else
  {
    v26 = v6;
    v27 = a4;
    v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v13 = [a1 validServiceTypes];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v19 = objc_opt_class();
          id v28 = 0;
          v20 = [v9 MCValidateAndRemoveObjectOfClass:v19 withKey:v18 isRequired:0 outError:&v28];
          id v21 = v28;
          if (v21)
          {
            id v8 = v21;

            id v10 = 0;
            v11 = 0;
            v6 = v26;
            a4 = v27;
            goto LABEL_23;
          }
          if (v20) {
            [v12 setObject:v20 forKeyedSubscript:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v38 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    if ([v9 count])
    {
      v22 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v37 = v9;
        _os_log_impl(&dword_1A13F0000, v22, OS_LOG_TYPE_ERROR, "The following communication service default handlers were not understood & ignored: %{public}@", buf, 0xCu);
      }
    }
    if ([v12 count])
    {
      v34 = @"DefaultServiceHandlers";
      v35 = v12;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    }
    else
    {
      id v10 = 0;
    }
    v6 = v26;

    a4 = v27;
    if ([v10 count])
    {
      id v10 = v10;
      id v8 = 0;
      v11 = v10;
      goto LABEL_23;
    }
    id v8 = 0;
  }
  v11 = 0;
LABEL_23:
  if ([v6 count])
  {
    v23 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v37 = v6;
      _os_log_impl(&dword_1A13F0000, v23, OS_LOG_TYPE_ERROR, "The following communication service rules were not understood & ignored: %{public}@", buf, 0xCu);
    }
  }
  if (a4) {
    *a4 = v8;
  }
  id v24 = v11;

  return v24;
}

+ (id)restrictionsForValidatedCommunicationServiceRules:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 objectForKey:@"DefaultServiceHandlers"];

  uint64_t v6 = [v5 objectForKey:@"AudioCall"];
  v7 = (void *)v6;
  if (v6)
  {
    v10[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v4 MCSetUnionRestriction:@"audioCallDefaultHandlerAppBundleIDs" values:v8];
  }
  if (![v4 count])
  {

    v4 = 0;
  }

  return v4;
}

+ (id)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F179C8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 defaultStore];
  v9 = [v8 accountWithIdentifier:v6];

  id v10 = [v9 communicationServiceRules];
  v11 = [v10 objectForKeyedSubscript:@"DefaultServiceHandlers"];
  v12 = [v11 objectForKeyedSubscript:v7];

  return v12;
}

@end