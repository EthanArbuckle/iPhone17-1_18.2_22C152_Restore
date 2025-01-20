@interface SecXPCHelper
+ (id)cleanDictionaryForXPC:(id)a3;
+ (id)cleanObjectForXPC:(id)a3;
+ (id)cleanseErrorForXPC:(id)a3;
+ (id)encodedDataFromError:(id)a3;
+ (id)errorFromEncodedData:(id)a3;
+ (id)safeCKErrorPrimitiveClasses;
+ (id)safeErrorClasses;
+ (id)safeErrorCollectionClasses;
+ (id)safeErrorPrimitiveClasses;
@end

@implementation SecXPCHelper

+ (id)safeErrorClasses
{
  if (safeErrorClasses_onceToken != -1) {
    dispatch_once(&safeErrorClasses_onceToken, &__block_literal_global_26);
  }
  v2 = (void *)safeErrorClasses_errorClasses;

  return v2;
}

Class __42__SecXPCHelper_safeErrorCollectionClasses__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  v1 = (void *)safeErrorCollectionClasses_errorClasses;
  safeErrorCollectionClasses_errorClasses = v0;

  for (uint64_t i = 0; i != 6; ++i)
  {
    Class result = objc_getClass(off_1E54775F8[i]);
    if (result) {
      Class result = (Class)[(id)safeErrorCollectionClasses_errorClasses addObject:result];
    }
  }
  return result;
}

void __32__SecXPCHelper_safeErrorClasses__block_invoke()
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  v1 = (void *)safeErrorClasses_errorClasses;
  safeErrorClasses_errorClasses = v0;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v2 = +[SecXPCHelper safeErrorPrimitiveClasses];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v26;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v2);
        }
        [(id)safeErrorClasses_errorClasses addObject:*(void *)(*((void *)&v25 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v4);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v7 = +[SecXPCHelper safeCKErrorPrimitiveClasses];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(id)safeErrorClasses_errorClasses addObject:*(void *)(*((void *)&v21 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v30 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v12 = +[SecXPCHelper safeErrorCollectionClasses];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [(id)safeErrorClasses_errorClasses addObject:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v29 count:16];
    }
    while (v14);
  }
}

Class __41__SecXPCHelper_safeErrorPrimitiveClasses__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  v1 = (void *)safeErrorPrimitiveClasses_errorClasses;
  safeErrorPrimitiveClasses_errorClasses = v0;

  for (uint64_t i = 0; i != 6; ++i)
  {
    Class result = objc_getClass(off_1E5477598[i]);
    if (result) {
      Class result = (Class)[(id)safeErrorPrimitiveClasses_errorClasses addObject:result];
    }
  }
  return result;
}

Class __43__SecXPCHelper_safeCKErrorPrimitiveClasses__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  v1 = (void *)safeCKErrorPrimitiveClasses_errorClasses;
  safeCKErrorPrimitiveClasses_errorClasses = v0;

  for (uint64_t i = 0; i != 6; ++i)
  {
    Class result = objc_getClass(off_1E54775C8[i]);
    if (result) {
      Class result = (Class)[(id)safeCKErrorPrimitiveClasses_errorClasses addObject:result];
    }
  }
  return result;
}

+ (id)safeErrorPrimitiveClasses
{
  if (safeErrorPrimitiveClasses_onceToken != -1) {
    dispatch_once(&safeErrorPrimitiveClasses_onceToken, &__block_literal_global_4241);
  }
  v2 = (void *)safeErrorPrimitiveClasses_errorClasses;

  return v2;
}

+ (id)safeErrorCollectionClasses
{
  if (safeErrorCollectionClasses_onceToken != -1) {
    dispatch_once(&safeErrorCollectionClasses_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)safeErrorCollectionClasses_errorClasses;

  return v2;
}

+ (id)safeCKErrorPrimitiveClasses
{
  if (safeCKErrorPrimitiveClasses_onceToken != -1) {
    dispatch_once(&safeCKErrorPrimitiveClasses_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)safeCKErrorPrimitiveClasses_errorClasses;

  return v2;
}

+ (id)encodedDataFromError:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F28DB0];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initRequiringSecureCoding:1];
  [v5 encodeObject:v4 forKey:@"error"];

  uint64_t v6 = [v5 encodedData];

  return v6;
}

+ (id)errorFromEncodedData:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initForReadingFromData:v4 error:0];

  if (v5)
  {
    uint64_t v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)cleanseErrorForXPC:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [v3 userInfo];
    uint64_t v5 = +[SecXPCHelper cleanDictionaryForXPC:v4];

    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    v7 = [v3 domain];
    uint64_t v8 = [v3 code];

    uint64_t v9 = [v6 errorWithDomain:v7 code:v8 userInfo:v5];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)cleanObjectForXPC:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    id v14 = 0;
    goto LABEL_53;
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v4 = +[SecXPCHelper safeErrorPrimitiveClasses];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v59 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_opt_isKindOfClass())
        {
          id v14 = v3;

          goto LABEL_53;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v58 objects:v66 count:16];
    }
    while (v6);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = +[SecXPCHelper safeErrorCollectionClasses];
  uint64_t v9 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (!v9) {
    goto LABEL_23;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v55;
  while (2)
  {
    for (uint64_t j = 0; j != v10; ++j)
    {
      if (*(void *)v55 != v11) {
        objc_enumerationMutation(obj);
      }
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
          id v16 = v3;
          long long v17 = [v16 domain];
          uint64_t v18 = [v16 code];
          long long v19 = [v16 userInfo];

          long long v20 = +[SecXPCHelper cleanDictionaryForXPC:v19];
          id v14 = [v15 errorWithDomain:v17 code:v18 userInfo:v20];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v14 = +[SecXPCHelper cleanDictionaryForXPC:v3];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v21 = v3;
              objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v21, "count"));
              id v14 = (id)objc_claimAutoreleasedReturnValue();
              long long v50 = 0u;
              long long v51 = 0u;
              long long v52 = 0u;
              long long v53 = 0u;
              id v22 = v21;
              uint64_t v23 = [v22 countByEnumeratingWithState:&v50 objects:v64 count:16];
              if (v23)
              {
                uint64_t v24 = v23;
                uint64_t v25 = *(void *)v51;
                do
                {
                  for (uint64_t k = 0; k != v24; ++k)
                  {
                    if (*(void *)v51 != v25) {
                      objc_enumerationMutation(v22);
                    }
                    long long v27 = +[SecXPCHelper cleanObjectForXPC:*(void *)(*((void *)&v50 + 1) + 8 * k)];
                    [v14 addObject:v27];
                  }
                  uint64_t v24 = [v22 countByEnumeratingWithState:&v50 objects:v64 count:16];
                }
                while (v24);
              }
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v28 = v3;
                objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v28, "count"));
                id v14 = (id)objc_claimAutoreleasedReturnValue();
                long long v46 = 0u;
                long long v47 = 0u;
                long long v48 = 0u;
                long long v49 = 0u;
                id v22 = v28;
                uint64_t v29 = [v22 countByEnumeratingWithState:&v46 objects:v63 count:16];
                if (v29)
                {
                  uint64_t v30 = v29;
                  uint64_t v31 = *(void *)v47;
                  do
                  {
                    for (uint64_t m = 0; m != v30; ++m)
                    {
                      if (*(void *)v47 != v31) {
                        objc_enumerationMutation(v22);
                      }
                      v33 = +[SecXPCHelper cleanObjectForXPC:*(void *)(*((void *)&v46 + 1) + 8 * m)];
                      [v14 addObject:v33];
                    }
                    uint64_t v30 = [v22 countByEnumeratingWithState:&v46 objects:v63 count:16];
                  }
                  while (v30);
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                id v34 = v3;
                objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v34, "count"));
                id v14 = (id)objc_claimAutoreleasedReturnValue();
                long long v42 = 0u;
                long long v43 = 0u;
                long long v44 = 0u;
                long long v45 = 0u;
                id v22 = v34;
                uint64_t v35 = [v22 countByEnumeratingWithState:&v42 objects:v62 count:16];
                if (v35)
                {
                  uint64_t v36 = v35;
                  uint64_t v37 = *(void *)v43;
                  do
                  {
                    for (uint64_t n = 0; n != v36; ++n)
                    {
                      if (*(void *)v43 != v37) {
                        objc_enumerationMutation(v22);
                      }
                      v39 = +[SecXPCHelper cleanObjectForXPC:*(void *)(*((void *)&v42 + 1) + 8 * n)];
                      [v14 addObject:v39];
                    }
                    uint64_t v36 = [v22 countByEnumeratingWithState:&v42 objects:v62 count:16];
                  }
                  while (v36);
                }
              }
            }
          }
        }

        goto LABEL_53;
      }
    }
    uint64_t v10 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_23:

  uint64_t v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:

  return v14;
}

+ (id)cleanDictionaryForXPC:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v15 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v5 = [v4 allKeys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v11 = [v4 objectForKeyedSubscript:v10];
          v12 = +[SecXPCHelper cleanObjectForXPC:v11];

          uint64_t v13 = [a1 cleanObjectForXPC:v10];
          if (v13) {
            [v15 setObject:v12 forKeyedSubscript:v13];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

@end