@interface CKShare(HealthDaemon)
+ (id)hd_shareWithSystemData:()HealthDaemon error:;
- (uint64_t)hd_isCKShare;
@end

@implementation CKShare(HealthDaemon)

- (uint64_t)hd_isCKShare
{
  return 1;
}

+ (id)hd_shareWithSystemData:()HealthDaemon error:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)_recordClasses;
  if (!_recordClasses) {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v6;
  v8 = [v7 arrayByAddingObject:objc_opt_class()];

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
        [v18 _enableStrictSecureDecodingMode];
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

  v20 = objc_msgSend(v9, "hk_map:", &__block_literal_global_39);
  v21 = (void *)MEMORY[0x1E4F28C58];
  v22 = [NSString stringWithFormat:@"Failed to unarchive data for classes %@", v20];
  objc_msgSend(v21, "hk_assignError:code:description:", a4, 100, v22);
LABEL_16:

  v19 = 0;
LABEL_18:

  return v19;
}

@end