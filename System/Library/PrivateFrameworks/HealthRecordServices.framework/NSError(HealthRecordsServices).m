@interface NSError(HealthRecordsServices)
+ (id)hrs_accumulatedErrorWithAuthorizationFailures:()HealthRecordsServices resourceFetchFailures:otherErrors:;
+ (id)hrs_authorizationOrResourceFetchErrorFromError:()HealthRecordsServices;
+ (id)hrs_cocoaErrorWithCode:()HealthRecordsServices;
+ (id)hrs_errorWithAccumulatedErrors:()HealthRecordsServices;
+ (id)hrs_resourceParsingErrorWithUnderlyingError:()HealthRecordsServices;
+ (uint64_t)hrs_cocoaInvalidValueError;
+ (uint64_t)hrs_cocoaValueNotFoundError;
- (BOOL)hrs_hasResourceFetchErrorsIndicatingRateLimitation;
- (BOOL)hrs_hasResourceFetchFailure;
- (BOOL)hrs_isReloginRequiredError;
- (id)_hrs_accumulatedErrorsForUserInfoKey:()HealthRecordsServices;
- (id)hrs_completeDescriptionRedactingSensitiveItemsIfNecessary:()HealthRecordsServices;
- (id)hrs_userInfoValueForKey:()HealthRecordsServices prefixedWith:redactIfNecessary:;
- (uint64_t)hrs_accumulatedAuthorizationFailures;
- (uint64_t)hrs_accumulatedOtherErrors;
- (uint64_t)hrs_accumulatedResourceFetchFailures;
- (uint64_t)hrs_completeDescription;
- (uint64_t)hrs_hasAuthorizationFailure;
- (uint64_t)hrs_safelyLoggableDescription;
@end

@implementation NSError(HealthRecordsServices)

- (BOOL)hrs_isReloginRequiredError
{
  if (objc_msgSend(a1, "hk_OAuth2_isOAuth2Error"))
  {
    unint64_t v2 = [a1 code];
    if (v2 >= 0xB) {
      return 0;
    }
    else {
      return (0x4A8u >> v2) & 1;
    }
  }
  else
  {
    v4 = [a1 domain];
    int v5 = [v4 isEqualToString:@"com.apple.healthkit.healthrecords.private"];

    if (v5)
    {
      return [a1 code] == 1;
    }
    else
    {
      v6 = objc_msgSend(a1, "hrs_accumulatedAuthorizationFailures");
      v7 = objc_msgSend(v6, "hk_filter:", &__block_literal_global_2);
      BOOL v3 = [v7 count] != 0;
    }
  }
  return v3;
}

- (id)_hrs_accumulatedErrorsForUserInfoKey:()HealthRecordsServices
{
  id v4 = a3;
  int v5 = [a1 domain];
  if (![v5 isEqualToString:@"HRSAccumulatedIngestionErrorDomain"])
  {
    id v12 = 0;
LABEL_8:

    goto LABEL_10;
  }
  v6 = [a1 userInfo];
  v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    v8 = [a1 userInfo];
    v9 = [v8 objectForKeyedSubscript:v4];
    objc_opt_class();
    int v5 = HKSafeObject();

    v10 = objc_msgSend(v5, "hk_filter:", &__block_literal_global_295);
    if ([v10 count]) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    goto LABEL_8;
  }
  id v12 = 0;
LABEL_10:

  return v12;
}

- (uint64_t)hrs_accumulatedAuthorizationFailures
{
  return objc_msgSend(a1, "_hrs_accumulatedErrorsForUserInfoKey:", @"AuthorizationFailures");
}

- (uint64_t)hrs_hasAuthorizationFailure
{
  if (objc_msgSend(a1, "hk_OAuth2_isOAuth2Error")) {
    return 1;
  }
  BOOL v3 = objc_msgSend(a1, "hrs_accumulatedAuthorizationFailures");
  BOOL v2 = [v3 count] != 0;

  return v2;
}

- (uint64_t)hrs_accumulatedResourceFetchFailures
{
  return objc_msgSend(a1, "_hrs_accumulatedErrorsForUserInfoKey:", @"ResourceFetchFailures");
}

- (BOOL)hrs_hasResourceFetchFailure
{
  BOOL v2 = [a1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x263F09848]];

  if (!v3)
  {
    int v5 = [a1 domain];
    if ([v5 isEqualToString:@"com.apple.healthkit.healthrecords.private"])
    {
      uint64_t v6 = [a1 code];

      if (v6 == 2) {
        return 1;
      }
    }
    else
    {
    }
    v7 = objc_msgSend(a1, "hrs_accumulatedResourceFetchFailures");
    BOOL v4 = [v7 count] != 0;

    return v4;
  }
  return [a1 code] > 399;
}

- (BOOL)hrs_hasResourceFetchErrorsIndicatingRateLimitation
{
  BOOL v2 = [a1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x263F09848]];

  if (v3)
  {
    return [a1 code] == 429 || objc_msgSend(a1, "code") == 425;
  }
  else
  {
    int v5 = objc_msgSend(a1, "hrs_accumulatedResourceFetchFailures");
    uint64_t v6 = objc_msgSend(v5, "hk_filter:", &__block_literal_global_298);
    BOOL v4 = [v6 count] != 0;
  }
  return v4;
}

- (uint64_t)hrs_accumulatedOtherErrors
{
  return objc_msgSend(a1, "_hrs_accumulatedErrorsForUserInfoKey:", @"OtherErrors");
}

- (uint64_t)hrs_completeDescription
{
  return objc_msgSend(a1, "hrs_completeDescriptionRedactingSensitiveItemsIfNecessary:", 0);
}

- (uint64_t)hrs_safelyLoggableDescription
{
  return objc_msgSend(a1, "hrs_completeDescriptionRedactingSensitiveItemsIfNecessary:", 1);
}

- (id)hrs_completeDescriptionRedactingSensitiveItemsIfNecessary:()HealthRecordsServices
{
  uint64_t v5 = [a1 localizedDescription];
  uint64_t v6 = (void *)v5;
  if (a3)
  {
    uint64_t v7 = HKSensitiveLogItem();

    v37 = (void *)v7;
  }
  else
  {
    v37 = (void *)v5;
  }
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v9 = objc_msgSend(a1, "hrs_userInfoValueForKey:prefixedWith:redactIfNecessary:", *MEMORY[0x263F08588], @"failing URL", a3);
  uint64_t v10 = objc_msgSend(a1, "hrs_userInfoValueForKey:prefixedWith:redactIfNecessary:", *MEMORY[0x263F07FA8], @"failing URL", a3);
  uint64_t v11 = objc_msgSend(a1, "hrs_userInfoValueForKey:prefixedWith:redactIfNecessary:", *MEMORY[0x263F09850], @"failing URL", a3);
  v40 = (void *)v11;
  v41 = (void *)v10;
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v11;
  }
  v42 = (void *)v9;
  if (v9) {
    uint64_t v13 = v9;
  }
  else {
    uint64_t v13 = v12;
  }
  objc_msgSend(v8, "hk_addNonNilObject:", v13);
  v14 = objc_msgSend(a1, "hrs_userInfoValueForKey:prefixedWith:redactIfNecessary:", *MEMORY[0x263F09858], @"response headers", a3);
  objc_msgSend(v8, "hk_addNonNilObject:", v14);

  v15 = objc_msgSend(a1, "hrs_userInfoValueForKey:prefixedWith:redactIfNecessary:", *MEMORY[0x263F09B30], @"bearer auth error", 0);
  objc_msgSend(v8, "hk_addNonNilObject:", v15);

  v16 = objc_msgSend(a1, "hrs_userInfoValueForKey:prefixedWith:redactIfNecessary:", *MEMORY[0x263F09B40], @"server error description", a3);
  objc_msgSend(v8, "hk_addNonNilObject:", v16);

  v17 = objc_msgSend(a1, "hrs_userInfoValueForKey:prefixedWith:redactIfNecessary:", *MEMORY[0x263F09B48], @"server error name", 0);
  objc_msgSend(v8, "hk_addNonNilObject:", v17);

  v18 = objc_msgSend(a1, "hrs_userInfoValueForKey:prefixedWith:redactIfNecessary:", *MEMORY[0x263F09B38], @"HTTP status", 0);
  objc_msgSend(v8, "hk_addNonNilObject:", v18);

  v19 = [a1 underlyingErrors];
  v20 = (void *)[v19 mutableCopy];

  v21 = objc_msgSend(a1, "hrs_accumulatedAuthorizationFailures");
  if ([v21 count]) {
    [v20 addObjectsFromArray:v21];
  }
  v22 = objc_msgSend(a1, "hrs_accumulatedResourceFetchFailures");
  if ([v22 count]) {
    [v20 addObjectsFromArray:v22];
  }
  v23 = objc_msgSend(a1, "hrs_accumulatedOtherErrors");
  if ([v23 count]) {
    [v20 addObjectsFromArray:v23];
  }
  v38 = v22;
  v39 = v21;
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __92__NSError_HealthRecordsServices__hrs_completeDescriptionRedactingSensitiveItemsIfNecessary___block_invoke;
  v43[3] = &__block_descriptor_33_e17__16__0__NSError_8l;
  char v44 = a3;
  v24 = objc_msgSend(v20, "hk_map:", v43);
  if ([v8 count])
  {
    v25 = NSString;
    v26 = [v8 componentsJoinedByString:@", "];
    v27 = [v25 stringWithFormat:@", %@", v26];
  }
  else
  {
    v27 = &stru_26D44DC88;
  }
  if ([v24 count])
  {
    v28 = NSString;
    v29 = [v24 componentsJoinedByString:@", "];
    v30 = [v28 stringWithFormat:@", underlying errors: [%@]", v29];
  }
  else
  {
    v30 = &stru_26D44DC88;
  }
  v31 = NSString;
  v32 = (objc_class *)objc_opt_class();
  v33 = NSStringFromClass(v32);
  v34 = [a1 domain];
  v35 = [v31 stringWithFormat:@"<%@ %@: %ld, \"%@\"%@%@>", v33, v34, objc_msgSend(a1, "code"), v37, v27, v30];

  return v35;
}

+ (id)hrs_resourceParsingErrorWithUnderlyingError:()HealthRecordsServices
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v8 = *MEMORY[0x263F08608];
    v9[0] = v3;
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.healthkit.healthrecords.private" code:2 userInfo:v5];

  return v6;
}

+ (id)hrs_authorizationOrResourceFetchErrorFromError:()HealthRecordsServices
{
  v18[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"NSError+HealthRecordServices.m", 194, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  uint64_t v6 = [v5 domain];
  int v7 = [v6 isEqualToString:@"HRSAccumulatedIngestionErrorDomain"];

  if (v7)
  {
    uint64_t v8 = (void *)[v5 copy];
  }
  else
  {
    int v9 = objc_msgSend(v5, "hk_OAuth2_isOAuth2Error");
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    if (v9)
    {
      v18[0] = v5;
      uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
      uint64_t v12 = v10;
      uint64_t v13 = v11;
      v14 = 0;
    }
    else
    {
      id v17 = v5;
      uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
      uint64_t v12 = v10;
      uint64_t v13 = 0;
      v14 = v11;
    }
    uint64_t v8 = objc_msgSend(v12, "hrs_accumulatedErrorWithAuthorizationFailures:resourceFetchFailures:otherErrors:", v13, v14, 0);
  }

  return v8;
}

+ (id)hrs_errorWithAccumulatedErrors:()HealthRecordsServices
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v32 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    uint64_t v9 = MEMORY[0x263EFFA68];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [v11 domain];
          int v13 = [v12 isEqualToString:@"HRSAccumulatedIngestionErrorDomain"];

          if (v13)
          {
            uint64_t v14 = objc_msgSend(v11, "hrs_accumulatedAuthorizationFailures");
            v15 = (void *)v14;
            if (v14) {
              uint64_t v16 = v14;
            }
            else {
              uint64_t v16 = v9;
            }
            [v4 addObjectsFromArray:v16];

            uint64_t v17 = objc_msgSend(v11, "hrs_accumulatedResourceFetchFailures");
            v18 = (void *)v17;
            if (v17) {
              uint64_t v19 = v17;
            }
            else {
              uint64_t v19 = v9;
            }
            [v32 addObjectsFromArray:v19];

            uint64_t v20 = objc_msgSend(v11, "hrs_accumulatedOtherErrors");
            v21 = (void *)v20;
            if (v20) {
              uint64_t v22 = v20;
            }
            else {
              uint64_t v22 = v9;
            }
            [v31 addObjectsFromArray:v22];
          }
          else
          {
            if (objc_msgSend(v11, "hrs_hasAuthorizationFailure"))
            {
              v26 = v4;
            }
            else if (objc_msgSend(v11, "hrs_hasResourceFetchFailure"))
            {
              v26 = v32;
            }
            else
            {
              v26 = v31;
            }
            [v26 addObject:v11];
          }
        }
        else
        {
          _HKInitializeLogging();
          v23 = (void *)*MEMORY[0x263F09908];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
          {
            v24 = v23;
            v25 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138543618;
            v38 = v25;
            __int16 v39 = 2114;
            v40 = v11;
            _os_log_error_impl(&dword_221D38000, v24, OS_LOG_TYPE_ERROR, "%{public}@ only expecting NSError entries in the array but got %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v7);
  }

  v27 = objc_msgSend(a1, "hrs_accumulatedErrorWithAuthorizationFailures:resourceFetchFailures:otherErrors:", v4, v32, v31);

  return v27;
}

+ (id)hrs_accumulatedErrorWithAuthorizationFailures:()HealthRecordsServices resourceFetchFailures:otherErrors:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ([v7 count])
  {
    uint64_t v11 = (void *)[v7 copy];
    [v10 setObject:v11 forKeyedSubscript:@"AuthorizationFailures"];
  }
  if ([v8 count])
  {
    uint64_t v12 = (void *)[v8 copy];
    [v10 setObject:v12 forKeyedSubscript:@"ResourceFetchFailures"];
  }
  if ([v9 count])
  {
    int v13 = (void *)[v9 copy];
    [v10 setObject:v13 forKeyedSubscript:@"OtherErrors"];
  }
  uint64_t v14 = [NSString stringWithFormat:@"%lu authorization failures, %lu resource fetch failures, %lu other errors", objc_msgSend(v7, "count"), objc_msgSend(v8, "count"), objc_msgSend(v9, "count")];
  v15 = [NSString stringWithFormat:@"Accumulated errors: %@", v14];
  [v10 setObject:v15 forKeyedSubscript:*MEMORY[0x263F08320]];
  uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:@"HRSAccumulatedIngestionErrorDomain" code:0 userInfo:v10];

  return v16;
}

- (id)hrs_userInfoValueForKey:()HealthRecordsServices prefixedWith:redactIfNecessary:
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [a1 userInfo];
  uint64_t v11 = [v10 objectForKeyedSubscript:v9];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __89__NSError_HealthRecordsServices__hrs_userInfoValueForKey_prefixedWith_redactIfNecessary___block_invoke;
      v19[3] = &unk_2645EEBC8;
      id v20 = v12;
      id v13 = v12;
      [v11 enumerateKeysAndObjectsUsingBlock:v19];
      uint64_t v14 = [v13 componentsJoinedByString:@", "];

      uint64_t v11 = (void *)v14;
    }
    v15 = NSString;
    if (a5)
    {
      uint64_t v16 = HKSensitiveLogItem();
      uint64_t v17 = [v15 stringWithFormat:@"%@: %@", v8, v16];
    }
    else
    {
      uint64_t v17 = [NSString stringWithFormat:@"%@: %@", v8, v11];
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

+ (id)hrs_cocoaErrorWithCode:()HealthRecordsServices
{
  id v4 = objc_alloc(MEMORY[0x263F087E8]);
  id v5 = (void *)[v4 initWithDomain:*MEMORY[0x263F07F70] code:a3 userInfo:0];

  return v5;
}

+ (uint64_t)hrs_cocoaValueNotFoundError
{
  return objc_msgSend(a1, "hrs_cocoaErrorWithCode:", 4865);
}

+ (uint64_t)hrs_cocoaInvalidValueError
{
  return objc_msgSend(a1, "hrs_cocoaErrorWithCode:", 4866);
}

@end