@interface NSError(EKAdditions)
+ (BOOL)_cal_serializedEntryForKey:()EKAdditions value:outKey:outValue:;
- (id)cal_serializableError;
- (id)cal_serializableUserInfo;
- (uint64_t)cal_isCertificateError;
- (void)cal_trustInfoCopy;
@end

@implementation NSError(EKAdditions)

- (uint64_t)cal_isCertificateError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F289A0]])
  {
    if ([a1 code] == -1203 || objc_msgSend(a1, "code") == -1201 || objc_msgSend(a1, "code") == -1204)
    {

      return 1;
    }
    uint64_t v7 = [a1 code];

    if (v7 == -1202) {
      return 1;
    }
  }
  else
  {
  }
  v4 = [a1 domain];
  v5 = v4;
  if (v4 == @"kEKAccountErrorDomain")
  {
    uint64_t v6 = [a1 code];

    if (v6 == 6) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (void)cal_trustInfoCopy
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Deserialization of trust error [%@]", (uint8_t *)&v3, 0xCu);
}

+ (BOOL)_cal_serializedEntryForKey:()EKAdditions value:outKey:outValue:
{
  id v9 = a3;
  id v10 = a4;
  if (![v9 isEqualToString:@"NSErrorPeerCertificateChainKey"])
  {
    if ([v9 isEqualToString:*MEMORY[0x1E4F289B8]])
    {
      uint64_t v21 = 0;
      v15 = (void *)SecTrustSerialize();
      id v16 = v15;
      BOOL v14 = v15 != 0;
      if (v15)
      {
        *a6 = v15;
        *a5 = (id) *MEMORY[0x1E4F57548];
      }
      else
      {
        v19 = EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
          +[NSError(EKAdditions) _cal_serializedEntryForKey:value:outKey:outValue:](&v21, v19);
        }
      }
    }
    else
    {
      v17 = (void *)*MEMORY[0x1E4F28A50];
      if (![v9 isEqualToString:*MEMORY[0x1E4F28A50]])
      {
        BOOL v14 = 0;
        goto LABEL_14;
      }
      id v16 = v10;
      objc_msgSend(v16, "cal_serializableError");
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v14 = v18 != v16;
      if (v18 != v16)
      {
        *a5 = v17;
        *a6 = v18;
      }
    }
    goto LABEL_14;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__NSError_EKAdditions___cal_serializedEntryForKey_value_outKey_outValue___block_invoke;
  v22[3] = &unk_1E5B97A78;
  id v23 = v11;
  id v12 = v11;
  [v10 enumerateObjectsUsingBlock:v22];
  *a5 = v9;
  id v13 = v12;
  *a6 = v13;

  BOOL v14 = 1;
LABEL_14:

  return v14;
}

- (id)cal_serializableUserInfo
{
  v22[7] = *MEMORY[0x1E4F143B8];
  v1 = [a1 userInfo];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  id v21 = 0;
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = *MEMORY[0x1E4F289C0];
  v22[0] = *MEMORY[0x1E4F289B0];
  v22[1] = v3;
  v22[2] = *MEMORY[0x1E4F289B8];
  v22[3] = @"NSErrorPeerCertificateChainKey";
  uint64_t v4 = *MEMORY[0x1E4F285A0];
  void v22[4] = *MEMORY[0x1E4F28568];
  v22[5] = v4;
  v22[6] = *MEMORY[0x1E4F28A50];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:7];
  uint64_t v6 = [v2 setWithArray:v5];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__NSError_EKAdditions__cal_serializableUserInfo__block_invoke;
  v12[3] = &unk_1E5B97AA0;
  id v7 = v6;
  id v13 = v7;
  v15 = &v16;
  id v8 = v1;
  id v14 = v8;
  [v8 enumerateKeysAndObjectsUsingBlock:v12];
  id v9 = (void *)v17[5];
  if (!v9) {
    id v9 = v8;
  }
  id v10 = v9;

  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)cal_serializableError
{
  uint64_t v2 = [a1 userInfo];
  uint64_t v3 = objc_msgSend(a1, "cal_serializableUserInfo");
  if (v2 == v3)
  {
    id v6 = a1;
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = [a1 domain];
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, objc_msgSend(a1, "code"), v3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (void)_cal_serializedEntryForKey:()EKAdditions value:outKey:outValue:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "We were unable to serialize the trust for a certificate error [%@].", (uint8_t *)&v3, 0xCu);
}

@end