@interface NSKeyedUnarchiver(HMFDeprecated)
+ (id)deserializeObjectWithData:()HMFDeprecated allowedClass:frameworkClasses:;
+ (id)deserializeObjectWithData:()HMFDeprecated allowedClasses:;
@end

@implementation NSKeyedUnarchiver(HMFDeprecated)

+ (id)deserializeObjectWithData:()HMFDeprecated allowedClasses:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v17 = 0;
  v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v7 fromData:v6 error:&v17];
  id v9 = v17;
  v10 = v9;
  if (v8) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (!v11)
  {
    v12 = (void *)MEMORY[0x19F3A87A0]();
    id v13 = a1;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = HMFGetLogIdentifier(v13);
      *(_DWORD *)buf = 138543618;
      v19 = v15;
      __int16 v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_19D57B000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to unarchive with error: %@", buf, 0x16u);
    }
  }

  return v8;
}

+ (id)deserializeObjectWithData:()HMFDeprecated allowedClass:frameworkClasses:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v34 = 0;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v8 error:&v34];
  id v11 = v34;
  if (!v10)
  {
    uint64_t v22 = (void *)MEMORY[0x19F3A87A0]();
    id v26 = a1;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier(v26);
      *(_DWORD *)buf = 138543618;
      v37 = v27;
      __int16 v38 = 2112;
      id v39 = v11;
      _os_log_impl(&dword_19D57B000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive due to invalid data: %@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  [v10 setDecodingFailurePolicy:1];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        [v10 setClass:a4 forClassName:*(void *)(*((void *)&v30 + 1) + 8 * i)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v14);
  }

  uint64_t v17 = *MEMORY[0x1E4F284E8];
  id v29 = v11;
  v18 = [v10 decodeTopLevelObjectOfClass:a4 forKey:v17 error:&v29];
  id v19 = v29;

  uint64_t v20 = [v10 finishDecoding];
  if (v18) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = v19 == 0;
  }
  if (!v21)
  {
    uint64_t v22 = (void *)MEMORY[0x19F3A87A0](v20);
    id v23 = a1;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = HMFGetLogIdentifier(v23);
      *(_DWORD *)buf = 138543618;
      v37 = v25;
      __int16 v38 = 2112;
      id v39 = v19;
      _os_log_impl(&dword_19D57B000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to unarchive with error: %@", buf, 0x16u);
    }
    id v11 = v19;
LABEL_18:

    v18 = 0;
    id v19 = v11;
  }

  return v18;
}

@end