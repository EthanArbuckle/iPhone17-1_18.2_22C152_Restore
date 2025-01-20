@interface AAUniversalLinkHelper
+ (id)infoForComponents:(id)a3;
+ (id)stringForBenefiaryMessagesURLWithUUID:(id)a3;
+ (id)stringForCustodianMessagesURLWithUUID:(id)a3;
@end

@implementation AAUniversalLinkHelper

+ (id)infoForComponents:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 queryItems];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v5)
  {
    v7 = 0;
    v27 = 0;
    v26 = 0;
    goto LABEL_26;
  }
  uint64_t v6 = v5;
  id v30 = v3;
  v31 = 0;
  v32 = 0;
  v7 = 0;
  v8 = 0;
  uint64_t v9 = *(void *)v34;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v34 != v9) {
        objc_enumerationMutation(v4);
      }
      v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      v12 = [v11 name];
      int v13 = [v12 isEqualToString:@"id"];

      if (v13)
      {
        uint64_t v14 = [v11 value];
        v15 = v7;
        v7 = (void *)v14;
      }
      else
      {
        v16 = [v11 name];
        int v17 = [v16 isEqualToString:@"flow"];

        if (v17)
        {
          uint64_t v18 = [v11 value];
          v15 = v8;
          v8 = (void *)v18;
        }
        else
        {
          v19 = [v11 name];
          int v20 = [v19 isEqualToString:@"domainState"];

          if (v20)
          {
            uint64_t v21 = [v11 value];
            v15 = v32;
            v32 = (void *)v21;
          }
          else
          {
            v22 = [v11 name];
            int v23 = [v22 isEqualToString:@"state"];

            if (!v23) {
              continue;
            }
            uint64_t v24 = [v11 value];
            v15 = v31;
            v31 = (void *)v24;
          }
        }
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
  }
  while (v6);
  if (v8)
  {
    v25 = [MEMORY[0x1E4F1CA60] dictionary];
    [v25 setValue:v8 forKey:@"flow"];
    id v3 = v30;
    v26 = v31;
    v27 = v32;
    if (v7) {
      [v25 setValue:v7 forKey:@"id"];
    }
    if (v32) {
      [v25 setValue:v32 forKey:@"domainState"];
    }
    if (v31) {
      [v25 setValue:v31 forKey:@"state"];
    }
    goto LABEL_29;
  }
  id v3 = v30;
  v26 = v31;
  v27 = v32;
LABEL_26:
  v28 = _AALogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    +[AAUniversalLinkHelper infoForComponents:](v28);
  }

  v8 = 0;
  v25 = 0;
LABEL_29:

  return v25;
}

+ (id)stringForCustodianMessagesURLWithUUID:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"AAUniversalLinkHelper.m", 65, @"Invalid parameter not satisfying: %@", @"uuid" object file lineNumber description];
  }
  uint64_t v6 = NSString;
  v7 = [v5 UUIDString];
  v8 = [v6 stringWithFormat:@"https://setup.icloud.com/private/trustedcontact?%@=%@&%@=%@", @"flow", @"custodian", @"id", v7];

  return v8;
}

+ (id)stringForBenefiaryMessagesURLWithUUID:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"AAUniversalLinkHelper.m", 70, @"Invalid parameter not satisfying: %@", @"uuid" object file lineNumber description];
  }
  uint64_t v6 = NSString;
  v7 = [v5 UUIDString];
  v8 = [v6 stringWithFormat:@"https://setup.icloud.com/private/trustedcontact?%@=%@&%@=%@", @"flow", @"digitalLegacy", @"id", v7];

  return v8;
}

+ (void)infoForComponents:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A11D8000, log, OS_LOG_TYPE_ERROR, "Flow was nil.", v1, 2u);
}

@end