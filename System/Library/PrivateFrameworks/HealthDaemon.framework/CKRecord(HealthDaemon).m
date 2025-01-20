@interface CKRecord(HealthDaemon)
+ (id)hd_recordWithSystemData:()HealthDaemon error:;
- (BOOL)hd_setEncryptedValue:()HealthDaemon ifChangedForKey:;
- (id)hd_optionalEncryptedValueForKey:()HealthDaemon type:error:;
- (id)hd_optionalValueForKey:()HealthDaemon type:error:;
- (id)hd_requiredEncryptedValueForKey:()HealthDaemon type:error:;
- (id)hd_requiredValueForKey:()HealthDaemon type:error:;
- (id)hd_systemData;
- (uint64_t)hd_equivalentRecord:()HealthDaemon;
- (uint64_t)hd_isCKShare;
- (uint64_t)hd_setEncryptedValuesIfChanged:()HealthDaemon;
- (uint64_t)hd_setValue:()HealthDaemon ifChangedForKey:;
- (uint64_t)hd_setValuesIfChanged:()HealthDaemon;
@end

@implementation CKRecord(HealthDaemon)

- (uint64_t)hd_equivalentRecord:()HealthDaemon
{
  id v4 = a3;
  v5 = [a1 recordID];
  v6 = [v4 recordID];
  int v7 = [v5 isEqual:v6];

  if (!v7) {
    goto LABEL_4;
  }
  v8 = [a1 valueStore];
  v9 = [v8 values];
  v10 = [v4 valueStore];
  v11 = [v10 values];
  int v12 = [v9 isEqual:v11];

  if (v12)
  {
    v13 = [a1 encryptedValueStore];
    v14 = [v13 values];
    v15 = [v4 encryptedValueStore];
    v16 = [v15 values];
    uint64_t v17 = [v14 isEqual:v16];
  }
  else
  {
LABEL_4:
    uint64_t v17 = 0;
  }

  return v17;
}

- (uint64_t)hd_isCKShare
{
  return 0;
}

- (uint64_t)hd_setValue:()HealthDaemon ifChangedForKey:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 objectForKeyedSubscript:v7];
  if (v8 == v6)
  {
  }
  else
  {
    v9 = v8;
    if (!v6)
    {

LABEL_8:
      [a1 setObject:v6 forKeyedSubscript:v7];
      uint64_t v12 = 1;
      goto LABEL_9;
    }
    v10 = [a1 objectForKeyedSubscript:v7];
    char v11 = [v10 isEqual:v6];

    if ((v11 & 1) == 0) {
      goto LABEL_8;
    }
  }
  uint64_t v12 = 0;
LABEL_9:

  return v12;
}

- (uint64_t)hd_setValuesIfChanged:()HealthDaemon
{
  id v4 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CKRecord_HealthDaemon__hd_setValuesIfChanged___block_invoke;
  v7[3] = &unk_1E6306DD0;
  v7[4] = a1;
  v7[5] = &v8;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (BOOL)hd_setEncryptedValue:()HealthDaemon ifChangedForKey:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 encryptedValues];
  id v9 = [v8 objectForKeyedSubscript:v7];
  BOOL v10 = v9 != v6;
  if (v9 == v6)
  {

LABEL_8:
    goto LABEL_9;
  }
  char v11 = v9;
  if (!v6)
  {

    goto LABEL_7;
  }
  uint64_t v12 = [a1 encryptedValues];
  v13 = [v12 objectForKeyedSubscript:v7];
  char v14 = [v13 isEqual:v6];

  if ((v14 & 1) == 0)
  {
LABEL_7:
    uint64_t v8 = [a1 encryptedValues];
    [v8 setObject:v6 forKeyedSubscript:v7];
    goto LABEL_8;
  }
  BOOL v10 = 0;
LABEL_9:

  return v10;
}

- (uint64_t)hd_setEncryptedValuesIfChanged:()HealthDaemon
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__CKRecord_HealthDaemon__hd_setEncryptedValuesIfChanged___block_invoke;
  v7[3] = &unk_1E6306DD0;
  v7[4] = a1;
  v7[5] = &v8;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)hd_requiredValueForKey:()HealthDaemon type:error:
{
  id v7 = a3;
  uint64_t v8 = [a1 objectForKeyedSubscript:v7];
  if (v8)
  {
    id v9 = HKSafeObject();
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    char v11 = [a1 recordID];
    uint64_t v12 = [v11 recordName];
    objc_msgSend(v10, "hk_assignError:code:format:", a5, 3, @"record %@ does not have value for key (%@)", v12, v7);

    id v9 = 0;
  }

  return v9;
}

- (id)hd_requiredEncryptedValueForKey:()HealthDaemon type:error:
{
  id v7 = a3;
  uint64_t v8 = [a1 encryptedValues];
  id v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    uint64_t v10 = HKSafeObject();
  }
  else
  {
    char v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = [a1 recordID];
    v13 = [v12 recordName];
    objc_msgSend(v11, "hk_assignError:code:format:", a5, 3, @"record %@ does not have encrypted value for key (%@)", v13, v7);

    uint64_t v10 = 0;
  }

  return v10;
}

- (id)hd_optionalValueForKey:()HealthDaemon type:error:
{
  id v4 = a3;
  uint64_t v5 = [a1 objectForKeyedSubscript:v4];
  if (v5)
  {
    id v6 = HKSafeObject();
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)hd_optionalEncryptedValueForKey:()HealthDaemon type:error:
{
  id v4 = a3;
  uint64_t v5 = [a1 encryptedValues];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = HKSafeObject();
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)hd_recordWithSystemData:()HealthDaemon error:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)_recordClasses;
  if (!_recordClasses) {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v6;
  uint64_t v8 = [v7 arrayByAddingObject:objc_opt_class()];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v30;
    uint64_t v27 = a4;
    while (2)
    {
      uint64_t v14 = 0;
      v15 = v12;
      do
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v9);
        }
        v16 = *(objc_class **)(*((void *)&v29 + 1) + 8 * v14);
        id v17 = objc_alloc(MEMORY[0x1E4F28DC0]);
        id v28 = v15;
        v18 = (void *)[v17 initForReadingFromData:v5 error:&v28];
        id v12 = v28;

        if (!v18)
        {
          v23 = (void *)MEMORY[0x1E4F28C58];
          v24 = NSString;
          v22 = NSStringFromClass(v16);
          v25 = [v24 stringWithFormat:@"Failed to initialize unarchiver for class %@", v22];
          objc_msgSend(v23, "hk_assignError:code:description:underlyingError:", v27, 100, v25, v12);

          v20 = v9;
          goto LABEL_16;
        }
        v19 = (void *)[[v16 alloc] initWithCoder:v18];
        [v18 finishDecoding];

        if (v19)
        {
          v20 = v9;
          goto LABEL_18;
        }
        ++v14;
        v15 = v12;
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      a4 = v27;
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v12 = 0;
  }

  v20 = objc_msgSend(v9, "hk_map:", &__block_literal_global_179);
  v21 = (void *)MEMORY[0x1E4F28C58];
  v22 = [NSString stringWithFormat:@"Failed to unarchive data for classes %@", v20];
  objc_msgSend(v21, "hk_assignError:code:description:", a4, 100, v22);
LABEL_16:

  v19 = 0;
LABEL_18:

  return v19;
}

- (id)hd_systemData
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [a1 encodeSystemFieldsWithCoder:v2];
  [v2 finishEncoding];
  v3 = [v2 encodedData];

  return v3;
}

@end