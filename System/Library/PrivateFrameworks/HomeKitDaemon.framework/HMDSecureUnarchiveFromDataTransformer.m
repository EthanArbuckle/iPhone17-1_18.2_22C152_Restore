@interface HMDSecureUnarchiveFromDataTransformer
+ (BOOL)isEncodedNilValue:(id)a3;
+ (id)allowedTopLevelClasses;
- (id)transformedValue:(id)a3;
@end

@implementation HMDSecureUnarchiveFromDataTransformer

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  if (+[HMDSecureUnarchiveFromDataTransformer isEncodedNilValue:v4])
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HMDSecureUnarchiveFromDataTransformer;
    v5 = [(NSSecureUnarchiveFromDataTransformer *)&v7 transformedValue:v4];
  }

  return v5;
}

+ (BOOL)isEncodedNilValue:(id)a3
{
  id v3 = a3;
  if (isEncodedNilValue__once != -1) {
    dispatch_once(&isEncodedNilValue__once, &__block_literal_global_29_211096);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (uint64_t v4 = [v3 length], v4 == isEncodedNilValue__encodedNilSize))
  {
    v5 = [MEMORY[0x263F08AC0] propertyListWithData:v3 options:0 format:0 error:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (uint64_t v6 = [v5 count], v6 == objc_msgSend((id)isEncodedNilValue__encodedNilPList, "count")))
    {
      uint64_t v10 = 0;
      v11 = &v10;
      uint64_t v12 = 0x2020000000;
      char v13 = 1;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __59__HMDSecureUnarchiveFromDataTransformer_isEncodedNilValue___block_invoke_2;
      v9[3] = &unk_264A27268;
      v9[4] = &v10;
      [v5 enumerateKeysAndObjectsUsingBlock:v9];
      BOOL v7 = *((unsigned char *)v11 + 24) != 0;
      _Block_object_dispose(&v10, 8);
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __59__HMDSecureUnarchiveFromDataTransformer_isEncodedNilValue___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  if (![v11 isEqual:@"$top"])
  {
    v9 = [(id)isEncodedNilValue__encodedNilPList objectForKeyedSubscript:v11];
    char v10 = [v7 isEqual:v9];

    if (v10) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_5:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
LABEL_6:
}

void __59__HMDSecureUnarchiveFromDataTransformer_isEncodedNilValue___block_invoke()
{
  v0 = [MEMORY[0x263F08910] archivedDataWithRootObject:0];
  if (!v0)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v5 = v0;
  isEncodedNilValue__encodedNilSize = [v0 length];
  uint64_t v1 = [MEMORY[0x263F08AC0] propertyListWithData:v5 options:0 format:0 error:0];
  v2 = (void *)isEncodedNilValue__encodedNilPList;
  isEncodedNilValue__encodedNilPList = v1;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    id v3 = (void *)_HMFPreconditionFailure();
    +[HMDSecureUnarchiveFromDataTransformer allowedTopLevelClasses];
    return;
  }
}

+ (id)allowedTopLevelClasses
{
  if ((id)objc_opt_class() == a1)
  {
    if (allowedTopLevelClasses__hmf_once_t0 != -1) {
      dispatch_once(&allowedTopLevelClasses__hmf_once_t0, &__block_literal_global_211111);
    }
    id v3 = (id)allowedTopLevelClasses__hmf_once_v1;
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___HMDSecureUnarchiveFromDataTransformer;
    objc_msgSendSuper2(&v5, sel_allowedTopLevelClasses);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

void __63__HMDSecureUnarchiveFromDataTransformer_allowedTopLevelClasses__block_invoke()
{
  v2[26] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  v2[12] = objc_opt_class();
  v2[13] = objc_opt_class();
  v2[14] = objc_opt_class();
  v2[15] = objc_opt_class();
  v2[16] = objc_opt_class();
  v2[17] = objc_opt_class();
  v2[18] = objc_opt_class();
  v2[19] = objc_opt_class();
  v2[20] = objc_opt_class();
  v2[21] = objc_opt_class();
  v2[22] = objc_opt_class();
  v2[23] = objc_opt_class();
  v2[24] = objc_opt_class();
  v2[25] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:26];
  uint64_t v1 = (void *)allowedTopLevelClasses__hmf_once_v1;
  allowedTopLevelClasses__hmf_once_uint64_t v1 = v0;
}

@end