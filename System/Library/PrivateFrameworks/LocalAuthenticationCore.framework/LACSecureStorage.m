@interface LACSecureStorage
+ (BOOL)checkKey:(int64_t)a3 supportsOperation:(int64_t)a4;
+ (BOOL)isKeyAvailable:(int64_t)a3;
+ (BOOL)isKeyAvailable:(int64_t)a3 operation:(int64_t)a4;
+ (BOOL)isKeyAvailableForDataExchange:(int64_t)a3;
+ (Class)classForKey:(int64_t)a3;
+ (id)additionalBoolEntitlementForKey:(int64_t)a3 operation:(int64_t)a4 value:(id)a5;
+ (id)maxDataLengthForKey:(int64_t)a3;
+ (id)minDataLengthForKey:(int64_t)a3;
+ (int64_t)policyForKey:(int64_t)a3 operation:(int64_t)a4 value:(id)a5;
- (BOOL)_checkEntitlementForKey:(int64_t)a3 operation:(int64_t)a4 value:(id)a5 connection:(id)a6 failureHandler:(id)a7;
- (LACSecureStorage)initWithConfig:(id)a3;
- (LACSecureStorageConfiguration)config;
- (LACSecureStorageDelegate)delegate;
- (__ACMHandle)_acmContextForUUID:(id)a3 failureHandler:(id)a4;
- (id)_errorNotSupported;
- (id)_storageObjectForKey:(int64_t)a3 data:(id)a4 error:(id *)a5;
- (void)_acmSEPControlForKey:(int64_t)a3 completionHandler:(id)a4;
- (void)_acmVariableForKey:(int64_t)a3 completionHandler:(id)a4;
- (void)_exchangeObject:(id)a3 request:(id)a4 connection:(id)a5 completionHandler:(id)a6;
- (void)_protectedDataWithBundleId:(id)a3 contextID:(id)a4 completionHandler:(id)a5;
- (void)_sepControl:(unsigned int)a3 value:(id)a4 contextID:(id)a5 completionHandler:(id)a6;
- (void)_setProtectedData:(id)a3 acl:(id)a4 contextID:(id)a5 completionHandler:(id)a6;
- (void)_setSecureBootModeForACMVariable:(unsigned int)a3 completionHandler:(id)a4;
- (void)_setStandardSecureBootModeCompletionHandler:(id)a3;
- (void)_setVariable:(unsigned int)a3 value:(id)a4 contextID:(id)a5 completionHandler:(id)a6;
- (void)_variable:(unsigned int)a3 withcontextID:(id)a4 completionHandler:(id)a5;
- (void)aclForRequest:(id)a3 connection:(id)a4 completionHandler:(id)a5;
- (void)objectForRequest:(id)a3 connection:(id)a4 completionHandler:(id)a5;
- (void)removeObjectForRequest:(id)a3 connection:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setObject:(id)a3 forRequest:(id)a4 connection:(id)a5 completionHandler:(id)a6;
@end

@implementation LACSecureStorage

- (void)_setVariable:(unsigned int)a3 value:(id)a4 contextID:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v29 = 0uLL;
  if (!v11)
  {
    v14 = 0;
LABEL_7:
    id v18 = v10;
    uint64_t v19 = ACMSetEnvironmentVariableWithAccessPolicy(v8, v14, &v29, 16, (const void *)[v18 bytes], objc_msgSend(v18, "length"));
    if (v19 == -17) {
      goto LABEL_15;
    }
    if (!v19)
    {
      if (v8 > 0x3C || ((1 << v8) & 0x10C0000000000000) == 0)
      {
        (*((void (**)(id, void, void))v12 + 2))(v12, MEMORY[0x263EFFA88], 0);
        goto LABEL_17;
      }
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __67__LACSecureStorage__setVariable_value_contextID_completionHandler___block_invoke;
      v27[3] = &unk_2653B6C10;
      id v28 = v12;
      [(LACSecureStorage *)self _setStandardSecureBootModeCompletionHandler:v27];
      v20 = v28;
      goto LABEL_12;
    }
    if (!v11 && v19 == -3)
    {
LABEL_15:
      uint64_t v21 = +[LACStorageError errorWithCode:0 debugDescription:@"Storage policy not satisfied."];
    }
    else
    {
      if (v19 == -27)
      {
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __67__LACSecureStorage__setVariable_value_contextID_completionHandler___block_invoke_2;
        v25[3] = &unk_2653B6C10;
        id v26 = v12;
        [(LACSecureStorage *)self _setSecureBootModeForACMVariable:v8 completionHandler:v25];
        v20 = v26;
LABEL_12:

        goto LABEL_17;
      }
      if (v19 != -14)
      {
        v23 = "store";
        if (!v18) {
          v23 = "remove";
        }
        objc_msgSend(NSString, "stringWithFormat:", @"ACM failed to %s the value: %d", v23, v19);
        goto LABEL_5;
      }
      uint64_t v21 = [(LACSecureStorage *)self _errorNotSupported];
    }
    v22 = (void *)v21;
    (*((void (**)(id, void, uint64_t))v12 + 2))(v12, 0, v21);

    goto LABEL_17;
  }
  v13 = [(LACSecureStorage *)self _acmContextForUUID:v11 failureHandler:v12];
  if (v13)
  {
    v14 = v13;
    uint64_t bag_uuid = aks_get_bag_uuid(0, &v29);
    if (bag_uuid)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"AKS failed to get the keybag UUID: %x", bag_uuid, v24);
      v16 = LABEL_5:;
      v17 = +[LACStorageError errorWithCode:2 debugDescription:v16];
      (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v17);

      goto LABEL_17;
    }
    goto LABEL_7;
  }
LABEL_17:
}

void __70__LACSecureStorage_setObject_forRequest_connection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v5 = a3;
  id v6 = a2;
  v7 = LACLogStorage();
  uint64_t v8 = v7;
  if (v6) {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v7, v9))
  {
    int v10 = [*(id *)(a1 + 32) identifier];
    id v11 = @"success";
    if (v5) {
      id v11 = v5;
    }
    v12[0] = 67109378;
    v12[1] = v10;
    __int16 v13 = 2114;
    v14 = v11;
    _os_log_impl(&dword_254F14000, v8, v9, "setObject rid:%u returned %{public}@", (uint8_t *)v12, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setObject:(id)a3 forRequest:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v11 key];
  if ([(id)objc_opt_class() isKeyAvailableForDataExchange:v14])
  {
    [(LACSecureStorage *)self _exchangeObject:v10 request:v11 connection:v12 completionHandler:v13];
  }
  else
  {
    uint64_t v15 = LACLogStorage();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v40 = v10;
      __int16 v41 = 1024;
      int v42 = v14;
      __int16 v43 = 2114;
      v44 = self;
      __int16 v45 = 1024;
      int v46 = [v11 identifier];
      _os_log_impl(&dword_254F14000, v15, OS_LOG_TYPE_DEFAULT, "setObject:%@ forKey:%d on %{public}@ rid:%u", buf, 0x22u);
    }

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__LACSecureStorage_setObject_forRequest_connection_completionHandler___block_invoke;
    aBlock[3] = &unk_2653B7448;
    id v16 = v11;
    id v37 = v16;
    id v17 = v13;
    id v38 = v17;
    id v18 = _Block_copy(aBlock);
    if ([(LACSecureStorage *)self _checkEntitlementForKey:v14 operation:2 value:v10 connection:v12 failureHandler:v18])
    {
      v31 = v18;
      if ([(id)objc_opt_class() checkKey:v14 supportsOperation:2])
      {
        uint64_t v19 = (void *)[(id)objc_opt_class() classForKey:v14];
        if ([v19 isEqual:objc_opt_class()] && objc_msgSend(v10, "length") != 1)
        {
          v20 = +[LACStorageError errorWithCode:1 debugDescription:@"Expected BOOL in NSNumber."];
          (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v20);
        }
        else
        {
          v20 = [(id)objc_opt_class() maxDataLengthForKey:v14];
          if (v20 && (unint64_t v21 = [v10 length], v21 > objc_msgSend(v20, "unsignedIntegerValue")))
          {
            v22 = objc_msgSend(NSString, "stringWithFormat:", @"Expected max %u bytes.", objc_msgSend(v20, "unsignedIntValue"));
            v23 = +[LACStorageError errorWithCode:1 debugDescription:v22];
            (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v23);
          }
          else
          {
            uint64_t v30 = [(id)objc_opt_class() minDataLengthForKey:v14];
            if (v30 && (unint64_t v25 = [v10 length], v25 < objc_msgSend(v20, "unsignedIntegerValue")))
            {
              v22 = v30;
              id v26 = objc_msgSend(NSString, "stringWithFormat:", @"Expected min %u bytes.", objc_msgSend(v30, "unsignedIntValue"));
              v27 = +[LACStorageError errorWithCode:1 debugDescription:v26];
              (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v27);
            }
            else
            {
              if (v14 == 2)
              {
                id v28 = [v16 acl];
                long long v29 = [v16 contextID];
                [(LACSecureStorage *)self _setProtectedData:v10 acl:v28 contextID:v29 completionHandler:v31];
              }
              else
              {
                v32[0] = MEMORY[0x263EF8330];
                v32[1] = 3221225472;
                v32[2] = __70__LACSecureStorage_setObject_forRequest_connection_completionHandler___block_invoke_21;
                v32[3] = &unk_2653B74E8;
                v32[4] = self;
                id v33 = v10;
                id v34 = v16;
                id v35 = v31;
                [(LACSecureStorage *)self _acmVariableForKey:v14 completionHandler:v32];
              }
              v22 = v30;
            }
          }
        }
      }
      else
      {
        v20 = objc_msgSend(NSString, "stringWithFormat:", @"Operation not supported for key: %d.", v14);
        uint64_t v24 = +[LACStorageError errorWithCode:3 debugDescription:v20];
        (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v24);
      }
      id v18 = v31;
    }
  }
}

+ (id)minDataLengthForKey:(int64_t)a3
{
  if (a3 == 4 || a3 == 1) {
    return &unk_270432130;
  }
  else {
    return 0;
  }
}

+ (id)maxDataLengthForKey:(int64_t)a3
{
  if ((unint64_t)a3 <= 0x14)
  {
    if (((1 << a3) & 0x1E1052) != 0) {
      return &unk_270432130;
    }
    if (a3 == 3) {
      return &unk_270432148;
    }
    if (a3 == 7) {
      return &unk_270432130;
    }
  }
  if (a3 == 1001) {
    return &unk_270432130;
  }
  return 0;
}

+ (BOOL)isKeyAvailableForDataExchange:(int64_t)a3
{
  return a3 == 13;
}

+ (Class)classForKey:(int64_t)a3
{
  if ((unint64_t)a3 <= 0x1A && (((1 << a3) & 0x43E58D2) != 0 || ((1 << a3) & 0xC1800C) != 0) || a3 == 1001)
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

+ (BOOL)checkKey:(int64_t)a3 supportsOperation:(int64_t)a4
{
  switch(a3)
  {
    case 12:
    case 14:
    case 15:
    case 21:
    case 22:
      v4 = &LACStorageOperationQuery;
      goto LABEL_3;
    case 13:
      v4 = &LACStorageOperationDataExchange;
LABEL_3:
      BOOL result = *v4 == a4;
      break;
    default:
      BOOL result = a4 != 4;
      break;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (LACSecureStorage)initWithConfig:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACSecureStorage;
  id v6 = [(LACSecureStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_config, a3);
  }

  return v7;
}

- (BOOL)_checkEntitlementForKey:(int64_t)a3 operation:(int64_t)a4 value:(id)a5 connection:(id)a6 failureHandler:(id)a7
{
  id v12 = a6;
  id v13 = (void (**)(id, void, void *))a7;
  id v14 = a5;
  uint64_t v15 = [(id)objc_opt_class() additionalBoolEntitlementForKey:a3 operation:a4 value:v14];

  if (!v15
    || [(LACSecureStorageConfiguration *)self->_config bypassEntitlementChecks]
    || ([v12 valueForEntitlement:v15],
        id v16 = objc_claimAutoreleasedReturnValue(),
        char v17 = [v16 BOOLValue],
        v16,
        (v17 & 1) != 0))
  {
    BOOL v18 = 1;
  }
  else
  {
    v20 = +[LACError missingEntitlementError:v15];
    v13[2](v13, 0, v20);

    BOOL v18 = 0;
  }

  return v18;
}

+ (id)additionalBoolEntitlementForKey:(int64_t)a3 operation:(int64_t)a4 value:(id)a5
{
  id v5 = 0;
  switch(a3)
  {
    case 4:
      BOOL v7 = a4 == 3 || a4 == 2;
      uint64_t v8 = LACEntitlementStorageSetOwnerPresence;
      goto LABEL_29;
    case 5:
    case 8:
    case 9:
    case 10:
    case 11:
    case 22:
    case 23:
    case 24:
    case 25:
      goto LABEL_32;
    case 6:
      BOOL v7 = a4 == 3 || a4 == 2;
      uint64_t v8 = LACEntitlementStorageSetLockdownMode;
      goto LABEL_29;
    case 7:
      BOOL v7 = a4 == 3 || a4 == 2;
      uint64_t v8 = LACEntitlementStorageSetDSLModeEnabled;
      goto LABEL_29;
    case 12:
      id v6 = LACEntitlementStorageBiometricLivenessFlag;
      goto LABEL_24;
    case 13:
    case 15:
      id v6 = LACEntitlementStorageUPP;
      goto LABEL_24;
    case 14:
      id v6 = LACEntitlementStorageBiometricSuccessAge;
      goto LABEL_24;
    case 16:
      id v6 = LACEntitlementStoragePSSO;
      goto LABEL_24;
    case 17:
    case 18:
    case 19:
    case 20:
      id v6 = &LACEntitlementStoragePreboard;
      goto LABEL_24;
    case 21:
      id v6 = LACEntitlementStoragePasscodeSuccessAge;
      goto LABEL_24;
    case 26:
      BOOL v7 = a4 == 3 || a4 == 2;
      uint64_t v8 = LACEntitlementStorageSetDSLStrictModeEnabled;
LABEL_29:
      objc_super v9 = *v8;
      if (!v7) {
        objc_super v9 = 0;
      }
      goto LABEL_31;
    default:
      if (a3 != 1001) {
        goto LABEL_32;
      }
      if (a4 == 1) {
        id v6 = LACEntitlementStorageGetDSLMode;
      }
      else {
        id v6 = LACEntitlementStorageSetDSLMode;
      }
LABEL_24:
      objc_super v9 = *v6;
LABEL_31:
      id v5 = v9;
LABEL_32:
      return v5;
  }
}

- (void)_acmVariableForKey:(int64_t)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(id, void, void *))a4;
  BOOL v7 = v5;
  switch(a3)
  {
    case 1:
      v5[2](v5, 13, 0);
      break;
    case 2:
    case 5:
    case 8:
    case 9:
    case 10:
    case 13:
    case 21:
    case 24:
    case 25:
      goto LABEL_5;
    case 3:
      v5[2](v5, 37, 0);
      break;
    case 4:
      v5[2](v5, 38, 0);
      break;
    case 6:
      v5[2](v5, 41, 0);
      break;
    case 7:
      v5[2](v5, 43, 0);
      break;
    case 11:
      v5[2](v5, 46, 0);
      break;
    case 12:
    case 14:
      v5[2](v5, 51, 0);
      break;
    case 15:
      v5[2](v5, 50, 0);
      break;
    case 16:
      v5[2](v5, 52, 0);
      break;
    case 17:
      v5[2](v5, 53, 0);
      break;
    case 18:
      v5[2](v5, 54, 0);
      break;
    case 19:
      v5[2](v5, 55, 0);
      break;
    case 20:
      v5[2](v5, 60, 0);
      break;
    case 22:
      v5[2](v5, 62, 0);
      break;
    case 23:
      v5[2](v5, 63, 0);
      break;
    case 26:
      v5[2](v5, 61, 0);
      break;
    default:
      if (a3 == 1001)
      {
        v5[2](v5, 42, 0);
      }
      else
      {
LABEL_5:
        id v6 = +[LACStorageError errorWithCode:2 debugDescription:@"Unknown storage"];
        v7[2](v7, 0, v6);
      }
      break;
  }
}

void __70__LACSecureStorage_setObject_forRequest_connection_completionHandler___block_invoke_21(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 48) contextID];
    [v4 _setVariable:a2 value:v5 contextID:v7 completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v6();
  }
}

- (void)objectForRequest:(id)a3 connection:(id)a4 completionHandler:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [v8 key];
  id v12 = LACLogStorage();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v33 = v11;
    __int16 v34 = 2114;
    id v35 = self;
    __int16 v36 = 1024;
    int v37 = [v8 identifier];
    _os_log_impl(&dword_254F14000, v12, OS_LOG_TYPE_DEFAULT, "objectForKey:%d on %{public}@ rid:%u", buf, 0x18u);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__LACSecureStorage_objectForRequest_connection_completionHandler___block_invoke;
  aBlock[3] = &unk_2653B7448;
  id v13 = v8;
  id v30 = v13;
  id v14 = v9;
  id v31 = v14;
  uint64_t v15 = _Block_copy(aBlock);
  BOOL v16 = [(LACSecureStorage *)self _checkEntitlementForKey:v11 operation:1 value:0 connection:v10 failureHandler:v15];

  if (v16)
  {
    if (v11 == 2)
    {
      char v17 = [(LACSecureStorage *)self delegate];
      BOOL v18 = [v17 bundleIDForRequest:v13];

      uint64_t v19 = [v13 contextID];
      [(LACSecureStorage *)self _protectedDataWithBundleId:v18 contextID:v19 completionHandler:v15];
    }
    else if (v11 == 21)
    {
      v20 = +[LACPasscodeHelper sharedInstance];
      [v20 passcodeSuccessAge];
      double v22 = v21;

      if (v22 <= 0.0)
      {
        (*((void (**)(void *, void, void))v15 + 2))(v15, 0, 0);
      }
      else
      {
        v23 = [NSNumber numberWithUnsignedInteger:(unint64_t)(v22 * 1000.0)];
        (*((void (**)(void *, void *, void))v15 + 2))(v15, v23, 0);
      }
    }
    else
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __66__LACSecureStorage_objectForRequest_connection_completionHandler___block_invoke_2;
      v24[3] = &unk_2653B7498;
      v24[4] = self;
      id v25 = v13;
      uint64_t v28 = v11;
      id v26 = v14;
      id v27 = v15;
      [(LACSecureStorage *)self _acmVariableForKey:v11 completionHandler:v24];
    }
  }
}

void __66__LACSecureStorage_objectForRequest_connection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LACLogStorage();
  id v8 = v7;
  if (v6) {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  if (os_log_type_enabled(v7, v9))
  {
    int v10 = [*(id *)(a1 + 32) identifier];
    if (v6) {
      id v11 = v6;
    }
    else {
      id v11 = v5;
    }
    v12[0] = 67109378;
    v12[1] = v10;
    __int16 v13 = 2114;
    id v14 = v11;
    _os_log_impl(&dword_254F14000, v8, v9, "objectForKey rid:%u returned %{public}@", (uint8_t *)v12, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __66__LACSecureStorage_objectForRequest_connection_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) contextID];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66__LACSecureStorage_objectForRequest_connection_completionHandler___block_invoke_2;
    v8[3] = &unk_2653B7470;
    uint64_t v6 = *(void *)(a1 + 64);
    v8[4] = *(void *)(a1 + 32);
    uint64_t v10 = v6;
    id v9 = *(id *)(a1 + 48);
    [v4 _variable:a2 withcontextID:v5 completionHandler:v8];
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v7();
  }
}

void __66__LACSecureStorage_objectForRequest_connection_completionHandler___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  id v5 = (void *)a1[4];
  uint64_t v6 = a1[6];
  id v11 = 0;
  id v7 = a3;
  id v8 = [v5 _storageObjectForKey:v6 data:a2 error:&v11];
  id v9 = v11;
  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = v7;
  }
  (*(void (**)(void, void *, id))(a1[5] + 16))(a1[5], v8, v10);
}

- (void)removeObjectForRequest:(id)a3 connection:(id)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [v8 key];
  id v12 = LACLogStorage();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v27 = v11;
    __int16 v28 = 2114;
    long long v29 = self;
    __int16 v30 = 1024;
    int v31 = [v8 identifier];
    _os_log_impl(&dword_254F14000, v12, OS_LOG_TYPE_DEFAULT, "removeObjectForKey:%d on %{public}@ rid:%u", buf, 0x18u);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__LACSecureStorage_removeObjectForRequest_connection_completionHandler___block_invoke;
  aBlock[3] = &unk_2653B7448;
  id v13 = v8;
  id v24 = v13;
  id v14 = v9;
  id v25 = v14;
  uint64_t v15 = _Block_copy(aBlock);
  BOOL v16 = [(LACSecureStorage *)self _checkEntitlementForKey:v11 operation:3 value:0 connection:v10 failureHandler:v15];

  if (v16)
  {
    if ([(id)objc_opt_class() checkKey:v11 supportsOperation:3])
    {
      if (v11 == 2)
      {
        char v17 = [v13 contextID];
        [(LACSecureStorage *)self _setProtectedData:0 acl:0 contextID:v17 completionHandler:v15];
      }
      else
      {
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __72__LACSecureStorage_removeObjectForRequest_connection_completionHandler___block_invoke_11;
        v20[3] = &unk_2653B74C0;
        v20[4] = self;
        id v21 = v13;
        id v22 = v15;
        [(LACSecureStorage *)self _acmVariableForKey:v11 completionHandler:v20];
      }
    }
    else
    {
      BOOL v18 = objc_msgSend(NSString, "stringWithFormat:", @"Operation not supported for key: %d.", v11);
      uint64_t v19 = +[LACStorageError errorWithCode:3 debugDescription:v18];
      (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v19);
    }
  }
}

void __72__LACSecureStorage_removeObjectForRequest_connection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  id v7 = LACLogStorage();
  id v8 = v7;
  if (v5) {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  if (os_log_type_enabled(v7, v9))
  {
    int v10 = [*(id *)(a1 + 32) identifier];
    uint64_t v11 = @"success";
    if (v5) {
      uint64_t v11 = v5;
    }
    v12[0] = 67109378;
    v12[1] = v10;
    __int16 v13 = 2114;
    id v14 = v11;
    _os_log_impl(&dword_254F14000, v8, v9, "removeObjectForKey rid:%u returned %{public}@", (uint8_t *)v12, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72__LACSecureStorage_removeObjectForRequest_connection_completionHandler___block_invoke_11(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v4 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) contextID];
    [v4 _setVariable:a2 value:0 contextID:v6 completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

- (void)aclForRequest:(id)a3 connection:(id)a4 completionHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v8 key];
  id v12 = LACLogStorage();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = v11;
    LOWORD(v27) = 2114;
    *(void *)((char *)&v27 + 2) = self;
    WORD5(v27) = 1024;
    HIDWORD(v27) = [v8 identifier];
    _os_log_impl(&dword_254F14000, v12, OS_LOG_TYPE_DEFAULT, "aclForKey:%d on %{public}@ rid:%u", buf, 0x18u);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__LACSecureStorage_aclForRequest_connection_completionHandler___block_invoke;
  aBlock[3] = &unk_2653B7448;
  id v13 = v8;
  id v24 = v13;
  id v14 = v10;
  id v25 = v14;
  uint64_t v15 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  BOOL v16 = [v13 contextID];
  char v17 = [(LACSecureStorage *)self _acmContextForUUID:v16 failureHandler:v15];

  if (v17)
  {
    *(void *)buf = 0;
    *(void *)&long long v27 = buf;
    *((void *)&v27 + 1) = 0x3032000000;
    __int16 v28 = __Block_byref_object_copy__8;
    long long v29 = __Block_byref_object_dispose__8;
    id v30 = 0;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __63__LACSecureStorage_aclForRequest_connection_completionHandler___block_invoke_22;
    v22[3] = &unk_2653B6C38;
    v22[4] = buf;
    uint64_t DataProperty = ACMContextGetDataProperty(v17, 7u, 2u, (uint64_t)v22);
    if (DataProperty == -7) {
      goto LABEL_8;
    }
    if (DataProperty)
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"ACM failed to retrieve the ACL: %d", DataProperty);
      id v21 = +[LACStorageError errorWithCode:2 debugDescription:v20];
      v15[2](v15, 0, v21);

      goto LABEL_10;
    }
    uint64_t v19 = *(void *)(v27 + 40);
    if (!v19) {
LABEL_8:
    }
      v15[2](v15, 0, 0);
    else {
      v15[2](v15, v19, 0);
    }
LABEL_10:
    _Block_object_dispose(buf, 8);
  }
}

void __63__LACSecureStorage_aclForRequest_connection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  id v7 = LACLogStorage();
  id v8 = v7;
  if (v6) {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v7, v9))
  {
    int v10 = [*(id *)(a1 + 32) identifier];
    int v11 = @"success";
    if (v5) {
      int v11 = v5;
    }
    v12[0] = 67109378;
    v12[1] = v10;
    __int16 v13 = 2114;
    id v14 = v11;
    _os_log_impl(&dword_254F14000, v8, v9, "setObject rid:%u returned %{public}@", (uint8_t *)v12, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __63__LACSecureStorage_aclForRequest_connection_completionHandler___block_invoke_22(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = a2;
  if (a2)
  {
    a2 = [MEMORY[0x263EFF8F8] dataWithBytes:a2 length:a3];
  }
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v3)
  {
  }
}

+ (BOOL)isKeyAvailable:(int64_t)a3 operation:(int64_t)a4
{
  int v7 = objc_msgSend(a1, "isKeyAvailable:");
  if (v7)
  {
    LOBYTE(v7) = [a1 checkKey:a3 supportsOperation:a4];
  }
  return v7;
}

+ (BOOL)isKeyAvailable:(int64_t)a3
{
  BOOL result = 1;
  if ((unint64_t)a3 > 0x1A) {
    return a3 == 1001;
  }
  if (((1 << a3) & 0x4E358DE) != 0) {
    return result;
  }
  if (((1 << a3) & 0x1C0000) != 0 || ((1 << a3) & 0xA000) != 0) {
    return +[LACSysUtility isTXMDevice];
  }
  else {
    return a3 == 1001;
  }
}

+ (int64_t)policyForKey:(int64_t)a3 operation:(int64_t)a4 value:(id)a5
{
  id v7 = a5;
  int64_t v8 = 0;
  switch(a3)
  {
    case 1:
    case 17:
      if (a4 != 2) {
        goto LABEL_29;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_29;
      }
      int v9 = [v7 BOOLValue];
      int v10 = &LACPolicyDoublePressBypass;
      goto LABEL_8;
    case 2:
    case 4:
    case 5:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
      goto LABEL_30;
    case 3:
      if (a4 != 2) {
        goto LABEL_29;
      }
      __int16 v13 = [MEMORY[0x263EFF8F8] data];
      if ([v7 isEqual:v13]) {
        int64_t v8 = 0;
      }
      else {
        int64_t v8 = 1024;
      }

      goto LABEL_30;
    case 6:
      if (a4 != 3)
      {
        if (a4 != 2) {
          goto LABEL_29;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) == 0 || ([v7 BOOLValue]) {
          goto LABEL_29;
        }
      }
      id v12 = &LACPolicyDeviceOwnerAuthentication;
      goto LABEL_21;
    case 7:
      goto LABEL_12;
    case 18:
    case 19:
    case 20:
      if (a4 != 2) {
        goto LABEL_29;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_29;
      }
      int v9 = [v7 BOOLValue];
      int v10 = &LACPolicyTouchIDEnrollment;
LABEL_8:
      int64_t v11 = *v10;
      if (v9) {
        int64_t v8 = v11;
      }
      else {
        int64_t v8 = 0;
      }
      goto LABEL_30;
    default:
      if (a3 != 26) {
        goto LABEL_30;
      }
LABEL_12:
      if (a4 == 3
        || a4 == 2
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && ([v7 BOOLValue] & 1) == 0)
      {
        id v12 = &LACPolicyLocationBasedDeviceOwnerAuthenticationWithBiometricRatchet;
LABEL_21:
        int64_t v8 = *v12;
      }
      else
      {
LABEL_29:
        int64_t v8 = 0;
      }
LABEL_30:

      return v8;
  }
}

- (void)_exchangeObject:(id)a3 request:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  uint64_t v14 = [v11 key];
  uint64_t v15 = LACLogStorage();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v30 = v10;
    __int16 v31 = 1024;
    int v32 = v14;
    __int16 v33 = 2114;
    __int16 v34 = self;
    __int16 v35 = 1024;
    int v36 = [v11 identifier];
    _os_log_impl(&dword_254F14000, v15, OS_LOG_TYPE_DEFAULT, "exchangeObject:%@ forKey:%d on %{public}@ rid:%u", buf, 0x22u);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__LACSecureStorage__exchangeObject_request_connection_completionHandler___block_invoke;
  aBlock[3] = &unk_2653B7448;
  id v16 = v11;
  id v27 = v16;
  id v17 = v12;
  id v28 = v17;
  BOOL v18 = _Block_copy(aBlock);
  BOOL v19 = [(LACSecureStorage *)self _checkEntitlementForKey:v14 operation:4 value:v10 connection:v13 failureHandler:v18];

  if (v19)
  {
    if ((unint64_t)[v10 length] < 0x101)
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __73__LACSecureStorage__exchangeObject_request_connection_completionHandler___block_invoke_33;
      v22[3] = &unk_2653B74E8;
      v22[4] = self;
      id v23 = v10;
      id v24 = v16;
      id v25 = v18;
      [(LACSecureStorage *)self _acmSEPControlForKey:v14 completionHandler:v22];
    }
    else
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"Expected max %u bytes.", 256);
      id v21 = +[LACStorageError errorWithCode:1 debugDescription:v20];
      (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v21);
    }
  }
}

void __73__LACSecureStorage__exchangeObject_request_connection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LACLogStorage();
  int64_t v8 = v7;
  if (v5) {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v7, v9))
  {
    int v10 = [*(id *)(a1 + 32) identifier];
    id v11 = @"success";
    v12[0] = 67109634;
    v12[1] = v10;
    if (v6) {
      id v11 = v6;
    }
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2114;
    id v16 = v11;
    _os_log_impl(&dword_254F14000, v8, v9, "exchangeObject rid:%u returned %@, error: %{public}@", (uint8_t *)v12, 0x1Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

void __73__LACSecureStorage__exchangeObject_request_connection_completionHandler___block_invoke_33(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 48) contextID];
    [v4 _sepControl:a2 value:v5 contextID:v7 completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v6();
  }
}

- (void)_acmSEPControlForKey:(int64_t)a3 completionHandler:(id)a4
{
  if (a3 == 13)
  {
    uint64_t v5 = (void (*)(void))*((void *)a4 + 2);
    id v7 = a4;
    v5();
  }
  else
  {
    id v6 = a4;
    id v7 = +[LACStorageError errorWithCode:2 debugDescription:@"Unknown storage for data exchange"];
    (*((void (**)(id, void))a4 + 2))(v6, 0);
  }
}

- (void)_setStandardSecureBootModeCompletionHandler:(id)a3
{
  id v3 = a3;
  AMFIGetSecurityBootModeArmed();
  (*((void (**)(id, void, void))v3 + 2))(v3, MEMORY[0x263EFFA88], 0);
}

- (void)_setSecureBootModeForACMVariable:(unsigned int)a3 completionHandler:(id)a4
{
  os_log_type_t v9 = (void (**)(id, void, void *))a4;
  if (a3 == 54 || a3 == 60 || a3 == 55)
  {
    uint64_t v5 = AMFIArmSecurityBootMode();
    if (v5)
    {
      id v6 = [NSString stringWithFormat:@"Unexpected AMFI error when setting boot mode, amfiErr: %u", v5];
      id v7 = +[LACStorageError errorWithCode:2 debugDescription:v6];
      v9[2](v9, 0, v7);
    }
    else
    {
      v9[2](v9, MEMORY[0x263EFFA88], 0);
    }
  }
  else
  {
    int64_t v8 = +[LACStorageError errorWithCode:2 debugDescription:@"Unexpected ACM var when reboot is requested"];
    v9[2](v9, 0, v8);
  }
}

uint64_t __67__LACSecureStorage__setVariable_value_contextID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__LACSecureStorage__setVariable_value_contextID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    v4 = *(void (**)(uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5);
  }
  else
  {
    id v6 = +[LACStorageError errorWithCode:5 debugDescription:@"Storage requires reboot"];
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v6);
  }
}

- (void)_sepControl:(unsigned int)a3 value:(id)a4 contextID:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void, void *))a6;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__8;
  id v24 = __Block_byref_object_dispose__8;
  id v25 = [MEMORY[0x263EFF8F8] data];
  if (v10) {
    id v12 = [(LACSecureStorage *)self _acmContextForUUID:v10 failureHandler:v11];
  }
  else {
    id v12 = 0;
  }
  id v13 = v9;
  id v14 = (const void *)[v13 bytes];
  size_t v15 = [v13 length];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __66__LACSecureStorage__sepControl_value_contextID_completionHandler___block_invoke;
  v19[3] = &unk_2653B6C38;
  v19[4] = &v20;
  uint64_t v16 = ACMSEPControlEx((uint64_t)v12, 0, 0, v14, v15, (uint64_t)v19);
  if (v16 == -17) {
    goto LABEL_9;
  }
  if (v16)
  {
    if (v10 || v16 != -3)
    {
      if (v16 == -14)
      {
        uint64_t v17 = [(LACSecureStorage *)self _errorNotSupported];
        v11[2](v11, 0, v17);
      }
      else
      {
        uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"ACMSEPControl failed: %d", v16);
        BOOL v18 = +[LACStorageError errorWithCode:2 debugDescription:v17];
        v11[2](v11, 0, v18);
      }
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v17 = +[LACStorageError errorWithCode:0 debugDescription:@"Storage policy not satisfied."];
    v11[2](v11, 0, v17);
LABEL_10:

    goto LABEL_11;
  }
  v11[2](v11, v21[5], 0);
LABEL_11:
  _Block_object_dispose(&v20, 8);
}

uint64_t __66__LACSecureStorage__sepControl_value_contextID_completionHandler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2 && a3)
  {
    uint64_t v3 = result;
    *(void *)(*(void *)(*(void *)(v3 + 32) + 8) + 40) = [MEMORY[0x263EFF8F8] dataWithBytes:a2 length:a3];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)_variable:(unsigned int)a3 withcontextID:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  BOOL v18 = __Block_byref_object_copy__8;
  BOOL v19 = __Block_byref_object_dispose__8;
  id v20 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62__LACSecureStorage__variable_withcontextID_completionHandler___block_invoke;
  v14[3] = &unk_2653B6C38;
  v14[4] = &v15;
  uint64_t v10 = ACMGetEnvironmentVariable(a3, (uint64_t)v14);
  if (v10 == -14)
  {
    id v12 = [(LACSecureStorage *)self _errorNotSupported];
    v9[2](v9, 0, v12);
LABEL_9:

    goto LABEL_10;
  }
  if (v10 == -7)
  {
LABEL_6:
    v9[2](v9, 0, 0);
    goto LABEL_10;
  }
  if (v10)
  {
    id v12 = objc_msgSend(NSString, "stringWithFormat:", @"ACM failed to query the value: %d", v10);
    id v13 = +[LACStorageError errorWithCode:2 debugDescription:v12];
    v9[2](v9, 0, v13);

    goto LABEL_9;
  }
  uint64_t v11 = v16[5];
  if (!v11) {
    goto LABEL_6;
  }
  v9[2](v9, v11, 0);
LABEL_10:
  _Block_object_dispose(&v15, 8);
}

uint64_t __62__LACSecureStorage__variable_withcontextID_completionHandler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v3 = result;
    *(void *)(*(void *)(*(void *)(v3 + 32) + 8) + 40) = [MEMORY[0x263EFF8F8] dataWithBytes:a2 length:a3];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)_setProtectedData:(id)a3 acl:(id)a4 contextID:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void, void *))a6;
  id v13 = [(LACSecureStorage *)self _acmContextForUUID:a5 failureHandler:v12];
  if (v13)
  {
    id v14 = v13;
    v23[0] = 11;
    id v15 = v11;
    v23[1] = [v15 bytes];
    v23[2] = [v15 length];
    BOOL v16 = v15 == 0;
    unsigned int v17 = v15 != 0;
    if (v16) {
      BOOL v18 = 0;
    }
    else {
      BOOL v18 = v23;
    }
    id v19 = v10;
    uint64_t v20 = ACMContextSetDataEx(v14, 7, v18, v17, (const void *)[v19 bytes], objc_msgSend(v19, "length"));
    if (v20)
    {
      id v21 = objc_msgSend(NSString, "stringWithFormat:", @"ACM failed to set protected data: %d", v20, v23[0]);
      uint64_t v22 = +[LACStorageError errorWithCode:2 debugDescription:v21];
      v12[2](v12, 0, v22);
    }
    else
    {
      v12[2](v12, MEMORY[0x263EFFA88], 0);
    }
  }
}

- (void)_protectedDataWithBundleId:(id)a3 contextID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = [(LACSecureStorage *)self _acmContextForUUID:v9 failureHandler:v10];
  if (v11)
  {
    id v12 = v11;
    __int16 v28 = 4620;
    id v13 = [MEMORY[0x263EFF990] dataWithBytes:&v28 length:2];
    id v14 = [v8 dataUsingEncoding:4];
    [v13 appendData:v14];

    v27[0] = 3;
    id v15 = v13;
    v27[1] = [v15 bytes];
    v27[2] = [v15 length];
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__8;
    id v25 = __Block_byref_object_dispose__8;
    id v26 = 0;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __75__LACSecureStorage__protectedDataWithBundleId_contextID_completionHandler___block_invoke;
    v20[3] = &unk_2653B6C38;
    v20[4] = &v21;
    uint64_t Data = ACMContextGetDataEx(v12, 7, v27, 1u, (uint64_t)v20);
    if (Data == -7) {
      goto LABEL_6;
    }
    if (Data)
    {
      BOOL v18 = objc_msgSend(NSString, "stringWithFormat:", @"ACM failed to retrieve protected data: %d", Data);
      id v19 = +[LACStorageError errorWithCode:2 debugDescription:v18];
      v10[2](v10, 0, v19);

      goto LABEL_8;
    }
    uint64_t v17 = v22[5];
    if (!v17) {
LABEL_6:
    }
      v10[2](v10, 0, 0);
    else {
      v10[2](v10, v17, 0);
    }
LABEL_8:
    _Block_object_dispose(&v21, 8);
  }
}

void __75__LACSecureStorage__protectedDataWithBundleId_contextID_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = a2;
  if (a2)
  {
    a2 = [MEMORY[0x263EFF8F8] dataWithBytes:a2 length:a3];
  }
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v3)
  {
  }
}

- (id)_errorNotSupported
{
  return +[LACStorageError errorWithCode:3 debugDescription:@"Storage not supported on this device."];
}

- (__ACMHandle)_acmContextForUUID:(id)a3 failureHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v8 = [(LACSecureStorage *)self delegate];

  if (v8)
  {
    id v9 = [(LACSecureStorage *)self delegate];
    id v16 = 0;
    id v10 = [v9 acmContextForUUID:v6 error:&v16];
    id v11 = v16;

    if (v11)
    {
      v7[2](v7, 0, v11);
      id v12 = 0;
    }
    else
    {
      id v14 = v10;
      id v12 = (__ACMHandle *)ACMContextCreateWithExternalForm((_OWORD *)[v14 bytes], objc_msgSend(v14, "length"));
    }
  }
  else
  {
    id v13 = +[LACError errorWithCode:-1000 debugDescription:@"Missing delegate"];
    v7[2](v7, 0, v13);

    id v12 = 0;
  }

  return v12;
}

- (id)_storageObjectForKey:(int64_t)a3 data:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = objc_alloc_init(LACStorageObjectEncoder);
  id v9 = [(LACStorageObjectEncoder *)v8 encodeValue:v7 forKey:a3 error:a5];

  return v9;
}

- (LACSecureStorageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (LACSecureStorageDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (LACSecureStorageConfiguration)config
{
  return self->_config;
}

@end