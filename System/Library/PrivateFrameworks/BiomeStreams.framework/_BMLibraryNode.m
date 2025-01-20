@interface _BMLibraryNode
+ (id)allStreamIdentifiers;
+ (id)allStreams;
+ (id)allValidEventClasses;
+ (id)allValidKeyPaths;
+ (id)identifier;
+ (id)streamNames;
+ (id)streamWithIdentifier:(id)a3 error:(id *)a4;
+ (id)streamWithName:(id)a3;
+ (id)streams;
+ (id)sublibraries;
+ (id)validKeyPaths;
@end

@implementation _BMLibraryNode

+ (id)streamWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 componentsSeparatedByString:@"."];
  id v45 = a1;
  if ([v7 count] == 1)
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = [a1 streamNames];
    uint64_t v8 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v55;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v55 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          v13 = [v6 lowercaseString];
          v14 = [v12 lowercaseString];
          char v15 = [v13 isEqualToString:v14];

          if (v15)
          {
            v20 = [v45 streamWithName:v12];
            goto LABEL_32;
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    if (a4)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v61 = *MEMORY[0x1E4F28568];
      id v17 = [NSString alloc];
      id obja = [v45 identifier];
      v18 = (void *)[v17 initWithFormat:@"Stream %@ could not be found, it is not a member of %@", v6, obja];
      v62 = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
      *a4 = (id)[v16 initWithDomain:@"BMLibraryErrorDomain" code:1 userInfo:v19];

      v20 = 0;
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v44 = a4;
    id obj = [v7 firstObject];
    v46 = objc_msgSend(v7, "subarrayWithRange:", 1, objc_msgSend(v7, "count") - 1);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v21 = [a1 sublibraries];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v50 objects:v60 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      v42 = v7;
      id v43 = v6;
      v24 = 0;
      uint64_t v25 = *(void *)v51;
LABEL_14:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v51 != v25) {
          objc_enumerationMutation(v21);
        }
        v27 = *(void **)(*((void *)&v50 + 1) + 8 * v26);
        v28 = [obj lowercaseString];
        v29 = [v27 identifier];
        v30 = [v29 lowercaseString];
        int v31 = [v28 isEqualToString:v30];

        if (v31)
        {
          v32 = [v46 componentsJoinedByString:@"."];
          id v49 = v24;
          v20 = [v27 streamWithIdentifier:v32 error:&v49];
          id v33 = v49;

          if (v20)
          {

            goto LABEL_27;
          }
          v24 = v33;
        }
        if (v23 == ++v26)
        {
          uint64_t v23 = [v21 countByEnumeratingWithState:&v50 objects:v60 count:16];
          if (v23) {
            goto LABEL_14;
          }

          v34 = v44;
          if (v44)
          {
            v7 = v42;
            id v6 = v43;
            if (!v24) {
              goto LABEL_29;
            }
            id v33 = v24;
            v20 = 0;
            id *v44 = v33;
            goto LABEL_31;
          }
          v20 = 0;
          id v33 = v24;
LABEL_27:
          v7 = v42;
          id v6 = v43;
          goto LABEL_31;
        }
      }
    }

    v34 = a4;
    if (a4)
    {
LABEL_29:
      id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v58 = *MEMORY[0x1E4F28568];
      id v36 = [NSString alloc];
      v37 = [v45 identifier];
      v38 = (void *)[v36 initWithFormat:@"Library %@ could not be found, it is not a member of %@", obj, v37];
      v59 = v38;
      v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      id v40 = (id) [v35 initWithDomain:@"BMLibraryErrorDomain" code:1 userInfo:v39];
      id *v34 = v40;
    }
    id v33 = 0;
    v20 = 0;
LABEL_31:

LABEL_32:
  }

  return v20;
}

+ (id)allStreams
{
  v3 = (void *)MEMORY[0x192FB0D60](a1, a2);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a1, 0);
  id v6 = v5;
  while ([v5 count])
  {
    v7 = [v6 lastObject];
    [v6 removeLastObject];
    uint64_t v8 = [v7 sublibraries];
    [v6 addObjectsFromArray:v8];

    uint64_t v9 = [v7 streams];
    [v4 addObjectsFromArray:v9];

    v5 = v6;
  }
  uint64_t v10 = (void *)[v4 copy];

  return v10;
}

+ (id)streams
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x192FB0D60](a1, a2);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [a1 streamNames];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [a1 streamWithName:v9];
        if (v10)
        {
          [v3 addObject:v10];
        }
        else
        {
          v11 = __biome_log_for_category();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            v12 = [a1 identifier];
            *(_DWORD *)buf = 138412802;
            uint64_t v21 = v9;
            __int16 v22 = 2112;
            uint64_t v23 = v12;
            __int16 v24 = 2112;
            uint64_t v25 = 0;
            _os_log_fault_impl(&dword_18E67D000, v11, OS_LOG_TYPE_FAULT, "Failure to fetch stream for known name %@ in library node %@, %@", buf, 0x20u);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v6);
  }

  v13 = (void *)[v3 copy];

  return v13;
}

+ (id)allStreamIdentifiers
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x192FB0D60](a1, a2);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = a1;
  uint64_t v5 = [v4 identifier];
  if ([v5 isEqualToString:@"BMLibrary"])
  {
    uint64_t v6 = &stru_1EDD7E578;
  }
  else
  {
    id v7 = [NSString alloc];
    uint64_t v8 = [v4 identifier];
    uint64_t v6 = (__CFString *)[v7 initWithFormat:@"%@.", v8];
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v9 = [v4 streamNames];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [(__CFString *)v6 stringByAppendingString:*(void *)(*((void *)&v39 + 1) + 8 * i)];
        [v3 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v11);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v28 = v4;
  id obj = [v4 sublibraries];
  uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(obj);
        }
        long long v19 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v20 = [v19 allStreamIdentifiers];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v43 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v32;
          do
          {
            for (uint64_t k = 0; k != v22; ++k)
            {
              if (*(void *)v32 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = [(__CFString *)v6 stringByAppendingString:*(void *)(*((void *)&v31 + 1) + 8 * k)];
              [v3 addObject:v25];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v43 count:16];
          }
          while (v22);
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v16);
  }

  uint64_t v26 = (void *)[v3 copy];

  return v26;
}

+ (id)allValidKeyPaths
{
  id v3 = (void *)MEMORY[0x192FB0D60](a1, a2);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v5 = [MEMORY[0x1E4F4FA38] genericValidKeyPaths];
  [v4 unionSet:v5];

  uint64_t v6 = +[BMEventBase validKeyPaths];
  [v4 addObjectsFromArray:v6];

  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a1, 0);
  uint64_t v8 = v7;
  while ([v7 count])
  {
    uint64_t v9 = [v8 firstObject];
    [v8 removeObjectAtIndex:0];
    uint64_t v10 = [v9 validKeyPaths];
    uint64_t v11 = [v10 allObjects];
    [v4 addObjectsFromArray:v11];

    uint64_t v12 = [v9 sublibraries];
    [v8 addObjectsFromArray:v12];

    id v7 = v8;
  }
  v13 = (void *)[v4 copy];

  return v13;
}

+ (id)allValidEventClasses
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x192FB0D60]();
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v4 = [(id)objc_opt_class() allStreams];
  uint64_t v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = objc_msgSend((id)objc_opt_class(), "allStreams", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) configuration];
        objc_msgSend(v5, "addObject:", objc_msgSend(v11, "eventClass"));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = (void *)[v5 copy];

  return v12;
}

+ (id)identifier
{
  OUTLINED_FUNCTION_1_3();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0_5(v2);
  return 0;
}

+ (id)streamNames
{
  OUTLINED_FUNCTION_1_3();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0_5(v2);
  return 0;
}

+ (id)validKeyPaths
{
  OUTLINED_FUNCTION_1_3();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0_5(v2);
  return 0;
}

+ (id)streamWithName:(id)a3
{
  OUTLINED_FUNCTION_1_3();
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_0_5(v3);
  return 0;
}

+ (id)sublibraries
{
  OUTLINED_FUNCTION_1_3();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0_5(v2);
  return 0;
}

@end