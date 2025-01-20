@interface NSDictionary(HMFoundation)
+ (NSString)shortDescription;
- (id)hmf_URLForKey:()HMFoundation;
- (id)hmf_UUIDForKey:()HMFoundation;
- (id)hmf_arrayForKey:()HMFoundation;
- (id)hmf_arrayForKey:()HMFoundation ofClasses:;
- (id)hmf_base64EncodedDataForKey:()HMFoundation;
- (id)hmf_calendarForKey:()HMFoundation;
- (id)hmf_dataForKey:()HMFoundation;
- (id)hmf_dateComponentsForKey:()HMFoundation;
- (id)hmf_dateForKey:()HMFoundation;
- (id)hmf_dictionaryForKey:()HMFoundation;
- (id)hmf_errorForKey:()HMFoundation;
- (id)hmf_fileHandleForKey:()HMFoundation;
- (id)hmf_flowForKey:()HMFoundation;
- (id)hmf_mutableArrayForKey:()HMFoundation;
- (id)hmf_mutableDictionaryForKey:()HMFoundation;
- (id)hmf_mutableSetForKey:()HMFoundation;
- (id)hmf_nullForKey:()HMFoundation;
- (id)hmf_numberForKey:()HMFoundation;
- (id)hmf_setForKey:()HMFoundation;
- (id)hmf_stringForKey:()HMFoundation;
- (id)hmf_timeZoneForKey:()HMFoundation;
- (id)hmf_unarchivedObjectForKey:()HMFoundation ofClasses:;
- (id)hmf_valueForKey:()HMFoundation;
- (id)privateDescription;
- (id)shortDescription;
- (uint64_t)hmf_BOOLForKey:()HMFoundation;
- (uint64_t)hmf_BOOLForKey:()HMFoundation error:;
- (uint64_t)hmf_BOOLForKey:()HMFoundation isPresent:;
- (uint64_t)hmf_integerForKey:()HMFoundation error:;
- (void)hmf_enumerateKeysAndObjectsWithAutoreleasePoolUsingBlock:()HMFoundation;
@end

@implementation NSDictionary(HMFoundation)

- (id)hmf_mutableDictionaryForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)privateDescription
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [a1 keyEnumerator];
  uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v8 = [a1 objectForKeyedSubscript:v7];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v9 = v8;
        }
        else {
          v9 = 0;
        }
        id v10 = v9;
        v11 = v10;
        if (v10) {
          [v10 privateDescription];
        }
        else {
        v12 = [v8 description];
        }

        [v2 setObject:v12 forKeyedSubscript:v7];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  v13 = [v2 description];

  return v13;
}

- (id)hmf_dataForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (uint64_t)hmf_BOOLForKey:()HMFoundation isPresent:
{
  uint64_t v5 = objc_msgSend(a1, "hmf_numberForKey:");
  v6 = v5;
  if (a4) {
    *a4 = v5 != 0;
  }
  if (v5) {
    uint64_t v7 = [v5 BOOLValue];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)hmf_arrayForKey:()HMFoundation ofClasses:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = objc_msgSend(a1, "hmf_arrayForKey:", a3);
  v8 = v7;
  if (v7)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      uint64_t v21 = v8;
      while (1)
      {
        uint64_t v13 = 0;
LABEL_5:
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v14 = v6;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (!v15) {
          break;
        }
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v23;
LABEL_9:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          if (objc_opt_isKindOfClass()) {
            break;
          }
          if (v16 == ++v18)
          {
            uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v16) {
              goto LABEL_9;
            }
            goto LABEL_19;
          }
        }

        if (++v13 != v11) {
          goto LABEL_5;
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
        v8 = v21;
        if (!v11) {
          goto LABEL_18;
        }
      }
LABEL_19:

      id v19 = 0;
      v8 = v21;
    }
    else
    {
LABEL_18:

      id v19 = v9;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)hmf_dateForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)hmf_stringForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)hmf_arrayForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)hmf_numberForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)hmf_dictionaryForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)hmf_setForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)shortDescription
{
  v2 = [MEMORY[0x1E4F1CAD0] set];
  id v3 = [a1 secureDescriptionWithIndent:0 newLine:1 blacklistedKeys:v2];

  return v3;
}

- (id)hmf_unarchivedObjectForKey:()HMFoundation ofClasses:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  id v9 = objc_msgSend(a1, "hmf_dataForKey:", v6);
  if (v9)
  {
    id v18 = 0;
    uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v8 fromData:v9 error:&v18];
    id v11 = v18;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x19F3A87A0]();
      id v14 = a1;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = HMFGetLogIdentifier(v14);
        *(_DWORD *)buf = 138544130;
        v20 = v16;
        __int16 v21 = 2112;
        long long v22 = v8;
        __int16 v23 = 2112;
        long long v24 = v9;
        __int16 v25 = 2112;
        id v26 = v11;
        _os_log_impl(&dword_19D57B000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize object of classes: %@, from data %@, with error: %@", buf, 0x2Au);
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (uint64_t)hmf_BOOLForKey:()HMFoundation
{
  return objc_msgSend(a1, "hmf_BOOLForKey:isPresent:", a3, 0);
}

- (id)hmf_mutableArrayForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)hmf_UUIDForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  if (v1)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      id v3 = v1;
    }
    else {
      id v3 = 0;
    }
    id v4 = v3;
    if (isKindOfClass)
    {
      id v5 = v1;
    }
    else
    {
      id v6 = v1;
      objc_opt_class();
      char v7 = objc_opt_isKindOfClass();
      if (v7) {
        v8 = v6;
      }
      else {
        v8 = 0;
      }
      id v9 = v8;

      id v5 = 0;
      if (v7) {
        id v5 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)hmf_errorForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

+ (NSString)shortDescription
{
  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

- (id)hmf_base64EncodedDataForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "hmf_stringForKey:");
  if (v1) {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v1 options:1];
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (uint64_t)hmf_BOOLForKey:()HMFoundation error:
{
  id v5 = objc_msgSend(a1, "objectForKeyedSubscript:");
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
    v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 BOOLValue];
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
      uint64_t v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    uint64_t v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)hmf_calendarForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)hmf_dateComponentsForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)hmf_flowForKey:()HMFoundation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v3 = objc_msgSend(a1, "hmf_unarchivedObjectForKey:ofClasses:", @"HMFMessageFlowKey", v2);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)hmf_nullForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (uint64_t)hmf_integerForKey:()HMFoundation error:
{
  id v5 = objc_msgSend(a1, "objectForKeyedSubscript:");
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
    v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 integerValue];
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
      uint64_t v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    uint64_t v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)hmf_mutableSetForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)hmf_timeZoneForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)hmf_URLForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)hmf_valueForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)hmf_fileHandleForKey:()HMFoundation
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (void)hmf_enumerateKeysAndObjectsWithAutoreleasePoolUsingBlock:()HMFoundation
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__NSDictionary_HMFoundation__hmf_enumerateKeysAndObjectsWithAutoreleasePoolUsingBlock___block_invoke;
  v6[3] = &unk_1E5957D70;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v6];
}

@end