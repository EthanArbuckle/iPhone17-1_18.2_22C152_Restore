@interface NSError(HealthKit)
+ (id)hk_error:()HealthKit class:selector:format:;
+ (id)hk_error:()HealthKit description:;
+ (id)hk_error:()HealthKit description:underlyingError:;
+ (id)hk_error:()HealthKit format:;
+ (id)hk_errorForInvalidArgument:()HealthKit class:selector:;
+ (id)hk_errorForInvalidArgument:()HealthKit class:selector:format:;
+ (id)hk_errorForNilArgument:()HealthKit class:selector:;
+ (uint64_t)hk_assignError:()HealthKit code:description:;
+ (uint64_t)hk_assignError:()HealthKit code:description:underlyingError:;
+ (uint64_t)hk_assignError:()HealthKit code:format:;
+ (uint64_t)hk_assignError:()HealthKit code:userInfo:;
+ (uint64_t)hk_assignError:()HealthKit invalidArgument:class:selector:;
+ (uint64_t)hk_assignError:()HealthKit nilArgument:class:selector:;
+ (uint64_t)hk_databaseInaccessibleBeforeFirstUnlockError;
+ (uint64_t)hk_databaseSchemaRolledBackError;
+ (uint64_t)hk_error:()HealthKit userInfo:;
+ (uint64_t)hk_featureUnavailableForProfileError;
+ (uint64_t)hk_healthDataUnavailableError;
+ (uint64_t)hk_healthStoreUnavailableError;
+ (uint64_t)hk_invalidProfileError;
+ (uint64_t)hk_protectedDataInaccessibilityError;
+ (uint64_t)hk_transactionInterruptedError;
- (BOOL)hk_isErrorInDomain:()HealthKit code:;
- (BOOL)hk_isXPCConnectionError;
- (id)hk_errorByAddingEntriesToUserInfo:()HealthKit;
- (id)hk_sanitizedErrorForDomain:()HealthKit;
- (id)hk_underlyingErrorWithDomain:()HealthKit;
- (uint64_t)hk_isAuthorizationDeniedError;
- (uint64_t)hk_isAuthorizationNotDeterminedError;
- (uint64_t)hk_isCocoaFileExistsError;
- (uint64_t)hk_isCocoaNoSuchFileError;
- (uint64_t)hk_isDatabaseAccessibilityError;
- (uint64_t)hk_isDatabaseSchemaRolledBackError;
- (uint64_t)hk_isDatabaseTransactionError;
- (uint64_t)hk_isDuplicateObjectError;
- (uint64_t)hk_isFeatureDisabledError;
- (uint64_t)hk_isHFDUnsupportedError;
- (uint64_t)hk_isHealthKitError;
- (uint64_t)hk_isHealthKitErrorWithCode:()HealthKit;
- (uint64_t)hk_isHealthStoreUnavailableError;
- (uint64_t)hk_isInternalFailureError;
- (uint64_t)hk_isInvalidArgumentError;
- (uint64_t)hk_isObjectNotFoundError;
- (uint64_t)hk_isOntologyConceptNotFoundError;
- (uint64_t)hk_isRequiredAuthorizationError;
- (uint64_t)hk_isServiceDeviceNotFoundError;
- (uint64_t)hk_isStreamFailureError;
- (uint64_t)hk_isTimeoutError;
- (uint64_t)hk_isTransactionInterruptedError;
- (uint64_t)hk_isUserCanceledError;
- (uint64_t)hk_isXPCConnectionInterruptedError;
- (uint64_t)hk_sanitizedError;
@end

@implementation NSError(HealthKit)

+ (uint64_t)hk_protectedDataInaccessibilityError
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 6, @"Protected health data is inaccessible");
}

+ (id)hk_error:()HealthKit description:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = v6;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v9 = [a1 errorWithDomain:@"com.apple.healthkit" code:a3 userInfo:v8];
  }
  else
  {
    v9 = [a1 errorWithDomain:@"com.apple.healthkit" code:a3 userInfo:0];
  }

  return v9;
}

- (uint64_t)hk_isDatabaseAccessibilityError
{
  uint64_t result = objc_msgSend(a1, "hk_isHealthKitError");
  if (result)
  {
    uint64_t v3 = [a1 code];
    return v3 == 6 || v3 == 101;
  }
  return result;
}

- (uint64_t)hk_isHealthKitError
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.healthkit"];

  return v2;
}

+ (uint64_t)hk_assignError:()HealthKit code:format:
{
  v12 = (objc_class *)NSString;
  id v13 = a5;
  v14 = (void *)[[v12 alloc] initWithFormat:v13 arguments:&a9];

  uint64_t v15 = objc_msgSend(a1, "hk_assignError:code:description:", a3, a4, v14);
  return v15;
}

+ (uint64_t)hk_assignError:()HealthKit code:description:
{
  objc_msgSend(a1, "hk_error:description:", a4, a5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (a3) {
      *a3 = v6;
    }
    else {
      _HKLogDroppedError(v6);
    }
  }

  return 1;
}

+ (id)hk_error:()HealthKit description:underlyingError:
{
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v11 = v10;
  if (v8) {
    [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  if (v9) {
    [v11 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  v12 = [a1 errorWithDomain:@"com.apple.healthkit" code:a3 userInfo:v11];

  return v12;
}

+ (id)hk_error:()HealthKit format:
{
  uint64_t v11 = (objc_class *)NSString;
  id v12 = a4;
  id v13 = (void *)[[v11 alloc] initWithFormat:v12 arguments:&a9];

  v14 = objc_msgSend(a1, "hk_error:description:", a3, v13);

  return v14;
}

+ (uint64_t)hk_error:()HealthKit userInfo:
{
  return [a1 errorWithDomain:@"com.apple.healthkit" code:a3 userInfo:a4];
}

+ (id)hk_error:()HealthKit class:selector:format:
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v12 = (objc_class *)NSString;
  id v13 = a6;
  v14 = (void *)[[v12 alloc] initWithFormat:v13 arguments:&a9];

  uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
  v21[0] = @"HKErrorClass";
  v16 = NSStringFromClass(a4);
  v22[0] = v16;
  v21[1] = @"HKErrorSelector";
  v17 = NSStringFromSelector(a5);
  v21[2] = *MEMORY[0x1E4F28568];
  v22[1] = v17;
  v22[2] = v14;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  v19 = objc_msgSend(v15, "hk_error:userInfo:", a3, v18);

  return v19;
}

+ (id)hk_errorForInvalidArgument:()HealthKit class:selector:
{
  v17[4] = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1E4F28C58];
  v16[0] = @"HKErrorClass";
  id v8 = a3;
  id v9 = NSStringFromClass(a4);
  v17[0] = v9;
  v16[1] = @"HKErrorSelector";
  v10 = NSStringFromSelector(a5);
  v17[1] = v10;
  v17[2] = v8;
  uint64_t v11 = *MEMORY[0x1E4F28568];
  id v12 = (void *)[[NSString alloc] initWithFormat:@"Invalid argument: %@", v8, @"HKErrorClass", @"HKErrorSelector", @"HKErrorParameter", v11, v9, v10, v8];
  v17[3] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  v14 = objc_msgSend(v7, "hk_error:userInfo:", 3, v13);

  return v14;
}

+ (id)hk_errorForInvalidArgument:()HealthKit class:selector:format:
{
  v23[4] = *MEMORY[0x1E4F143B8];
  id v12 = (void *)MEMORY[0x1E4F28C58];
  v22[0] = @"HKErrorClass";
  id v13 = a6;
  id v14 = a3;
  uint64_t v15 = NSStringFromClass(a4);
  v23[0] = v15;
  v22[1] = @"HKErrorSelector";
  v16 = NSStringFromSelector(a5);
  v23[1] = v16;
  v23[2] = v14;
  uint64_t v17 = *MEMORY[0x1E4F28568];
  v22[2] = @"HKErrorParameter";
  v22[3] = v17;
  v18 = (void *)[[NSString alloc] initWithFormat:v13 arguments:&a9];

  v23[3] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
  v20 = objc_msgSend(v12, "hk_error:userInfo:", 3, v19);

  return v20;
}

+ (id)hk_errorForNilArgument:()HealthKit class:selector:
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1E4F28C58];
  v15[0] = @"HKErrorClass";
  id v8 = a3;
  id v9 = NSStringFromClass(a4);
  v16[0] = v9;
  v15[1] = @"HKErrorSelector";
  v10 = NSStringFromSelector(a5);
  uint64_t v11 = [NSString stringWithFormat:@"Argument %@ must not be nil", v8, @"HKErrorClass", @"HKErrorSelector", @"HKErrorParameter", *MEMORY[0x1E4F28568], v9, v10, v8];
  v16[3] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  id v13 = objc_msgSend(v7, "hk_error:userInfo:", 3, v12);

  return v13;
}

+ (uint64_t)hk_healthDataUnavailableError
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 1, @"Health data is unavailable on this device");
}

+ (uint64_t)hk_databaseInaccessibleBeforeFirstUnlockError
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 101, @"Database inaccessible before first unlock");
}

+ (uint64_t)hk_featureUnavailableForProfileError
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Feature unavailable for profile");
}

+ (uint64_t)hk_invalidProfileError
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = objc_opt_class();

  return objc_msgSend(v3, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v4, a2, @"The HKProfileIdentifier associated with this health store is invalid."");
}

+ (uint64_t)hk_healthStoreUnavailableError
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 1500, @"The requested HKHealthStore is not available");
}

+ (uint64_t)hk_databaseSchemaRolledBackError
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 116, @"Rolling back the health database is unsupported");
}

+ (uint64_t)hk_transactionInterruptedError
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 117, @"The current transaction has been interrupted.");
}

+ (uint64_t)hk_assignError:()HealthKit code:description:underlyingError:
{
  objc_msgSend(a1, "hk_error:description:underlyingError:", a4, a5, a6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v7)
  {
    if (a3) {
      *a3 = v7;
    }
    else {
      _HKLogDroppedError(v7);
    }
  }

  return 1;
}

+ (uint64_t)hk_assignError:()HealthKit code:userInfo:
{
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", @"com.apple.healthkit");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (a3) {
      *a3 = v4;
    }
    else {
      _HKLogDroppedError(v4);
    }
  }

  return 1;
}

+ (uint64_t)hk_assignError:()HealthKit invalidArgument:class:selector:
{
  objc_msgSend(a1, "hk_errorForInvalidArgument:class:selector:", a4, a5, a6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v7)
  {
    if (a3) {
      *a3 = v7;
    }
    else {
      _HKLogDroppedError(v7);
    }
  }

  return 1;
}

+ (uint64_t)hk_assignError:()HealthKit nilArgument:class:selector:
{
  objc_msgSend(a1, "hk_errorForNilArgument:class:selector:", a4, a5, a6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v7)
  {
    if (a3) {
      *a3 = v7;
    }
    else {
      _HKLogDroppedError(v7);
    }
  }

  return 1;
}

- (uint64_t)hk_isHealthKitErrorWithCode:()HealthKit
{
  uint64_t result = objc_msgSend(a1, "hk_isHealthKitError");
  if (result) {
    return [a1 code] == a3;
  }
  return result;
}

- (uint64_t)hk_isDatabaseTransactionError
{
  return objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 107);
}

- (uint64_t)hk_isHealthStoreUnavailableError
{
  return objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 1500);
}

- (uint64_t)hk_isDatabaseSchemaRolledBackError
{
  return objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 116);
}

- (uint64_t)hk_isDuplicateObjectError
{
  return objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 115);
}

- (uint64_t)hk_isObjectNotFoundError
{
  return objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 118);
}

- (uint64_t)hk_isTransactionInterruptedError
{
  return objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 117);
}

- (uint64_t)hk_isServiceDeviceNotFoundError
{
  uint64_t result = objc_msgSend(a1, "hk_isHealthKitError");
  if (result) {
    return [a1 code] == 313;
  }
  return result;
}

- (uint64_t)hk_isAuthorizationDeniedError
{
  uint64_t result = objc_msgSend(a1, "hk_isHealthKitError");
  if (result) {
    return [a1 code] == 4;
  }
  return result;
}

- (uint64_t)hk_isAuthorizationNotDeterminedError
{
  uint64_t result = objc_msgSend(a1, "hk_isHealthKitError");
  if (result) {
    return [a1 code] == 5;
  }
  return result;
}

- (uint64_t)hk_isInvalidArgumentError
{
  uint64_t result = objc_msgSend(a1, "hk_isHealthKitError");
  if (result) {
    return [a1 code] == 3;
  }
  return result;
}

- (uint64_t)hk_isInternalFailureError
{
  uint64_t result = objc_msgSend(a1, "hk_isHealthKitError");
  if (result) {
    return [a1 code] == 100;
  }
  return result;
}

- (uint64_t)hk_isFeatureDisabledError
{
  return objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 111);
}

- (uint64_t)hk_isRequiredAuthorizationError
{
  uint64_t result = objc_msgSend(a1, "hk_isHealthKitError");
  if (result) {
    return [a1 code] == 10;
  }
  return result;
}

- (uint64_t)hk_isStreamFailureError
{
  uint64_t result = objc_msgSend(a1, "hk_isHealthKitError");
  if (result) {
    return [a1 code] == 104;
  }
  return result;
}

- (uint64_t)hk_isTimeoutError
{
  uint64_t result = objc_msgSend(a1, "hk_isHealthKitError");
  if (result) {
    return [a1 code] == 103;
  }
  return result;
}

- (uint64_t)hk_isUserCanceledError
{
  uint64_t result = objc_msgSend(a1, "hk_isHealthKitError");
  if (result) {
    return [a1 code] == 7;
  }
  return result;
}

- (uint64_t)hk_isCocoaNoSuchFileError
{
  uint64_t v2 = [a1 code];
  uint64_t v3 = [a1 domain];
  unsigned int v4 = [v3 isEqualToString:*MEMORY[0x1E4F281F8]];
  if ((v2 & 0xFFFFFFFFFFFFFEFFLL) == 4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)hk_isCocoaFileExistsError
{
  uint64_t v2 = [a1 code];
  uint64_t v3 = [a1 domain];
  unsigned int v4 = [v3 isEqualToString:*MEMORY[0x1E4F281F8]];
  if (v2 == 516) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)hk_isXPCConnectionError
{
  uint64_t v2 = [a1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F281F8]];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [a1 code];
  return v4 == 4099 || (v4 & 0xFFFFFFFFFFFFFFFBLL) == 4097;
}

- (uint64_t)hk_isXPCConnectionInterruptedError
{
  return objc_msgSend(a1, "hk_isErrorInDomain:code:", *MEMORY[0x1E4F281F8], 4097);
}

- (uint64_t)hk_isOntologyConceptNotFoundError
{
  return objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 1004);
}

- (uint64_t)hk_isHFDUnsupportedError
{
  return objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 1104);
}

- (BOOL)hk_isErrorInDomain:()HealthKit code:
{
  id v6 = a3;
  id v7 = [a1 domain];
  int v8 = [v7 isEqualToString:v6];

  if (v8) {
    BOOL v9 = [a1 code] == a4;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)hk_underlyingErrorWithDomain:()HealthKit
{
  id v4 = a3;
  id v5 = a1;
  if (v5)
  {
    uint64_t v6 = *MEMORY[0x1E4F28A50];
    do
    {
      id v7 = [v5 domain];
      char v8 = [v7 isEqualToString:v4];

      if (v8) {
        break;
      }
      BOOL v9 = [v5 userInfo];
      uint64_t v10 = [v9 objectForKeyedSubscript:v6];

      id v5 = (id)v10;
    }
    while (v10);
  }

  return v5;
}

- (uint64_t)hk_sanitizedError
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"%@", a1);
}

- (id)hk_sanitizedErrorForDomain:()HealthKit
{
  id v4 = a3;
  id v5 = [a1 domain];
  if ([v5 isEqualToString:v4])
  {

LABEL_4:
    objc_msgSend(a1, "hk_sanitizedError");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  uint64_t v6 = objc_msgSend(a1, "hk_underlyingErrorWithDomain:", v4);

  if (v6) {
    goto LABEL_4;
  }
  id v7 = a1;
LABEL_6:
  char v8 = v7;

  return v8;
}

- (id)hk_errorByAddingEntriesToUserInfo:()HealthKit
{
  id v4 = a3;
  id v5 = [a1 userInfo];
  uint64_t v6 = objc_msgSend(v5, "hk_dictionaryByAddingEntriesFromDictionary:", v4);

  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
  char v8 = [a1 domain];
  BOOL v9 = objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, objc_msgSend(a1, "code"), v6);

  return v9;
}

@end