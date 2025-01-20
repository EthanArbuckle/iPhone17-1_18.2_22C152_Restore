@interface BMSQLProtoUDFs
+ (void)_addEventClass:(Class)a3 toProtoRegistry:(id)a4;
+ (void)registerProtoUDFsWithDatabase:(id)a3 eventClasses:(id)a4 error:(id *)a5;
@end

@implementation BMSQLProtoUDFs

+ (void)_addEventClass:(Class)a3 toProtoRegistry:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = NSStringFromClass(a3);
  v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    v9 = [(objc_class *)a3 protoFields];
    [v6 setObject:v9 forKeyedSubscript:v7];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v10 = [(objc_class *)a3 protoFields];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v15 subMessageClass]) {
            objc_msgSend(a1, "_addEventClass:toProtoRegistry:", objc_msgSend(v15, "subMessageClass"), v6);
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

+ (void)registerProtoUDFsWithDatabase:(id)a3 eventClasses:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(a1, "_addEventClass:toProtoRegistry:", *(void *)(*((void *)&v23 + 1) + 8 * v15++), v10, (void)v23);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  [v8 registerFunctionWithName:@"biome_extract" numArgs:3 function:&__block_literal_global_2 userData:v10 error:a5];
  long long v16 = (id *)bm_sqlite3_malloc(8);
  if (v16)
  {
    long long v17 = v16;
    objc_storeStrong(v16, v10);
    uint64_t module_v2 = sqlite3_create_module_v2((sqlite3 *)[v8 db], "biome_each", &biome_each_module, v17, (void (__cdecl *)(void *))biome_each_vtab_destroy);
    if (a5)
    {
      uint64_t v19 = module_v2;
      if (module_v2)
      {
        v20 = (sqlite3 *)[v8 db];
        uint64_t v21 = "Unable to create biome_each module";
        uint64_t v22 = v19;
LABEL_14:
        BMSQLDatabaseError(v22, v20, v21);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else if (a5)
  {
    v20 = (sqlite3 *)[v8 db];
    uint64_t v21 = "Unable to alloc memory for biome_each_vtab_metadata";
    uint64_t v22 = 7;
    goto LABEL_14;
  }
}

id __67__BMSQLProtoUDFs_registerProtoUDFsWithDatabase_eventClasses_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = [v6 objectAtIndexedSubscript:0];
  id v9 = [MEMORY[0x1E4F1CA98] null];

  if (v8 == v9)
  {
    v32 = 0;
    goto LABEL_23;
  }
  v10 = [v6 objectAtIndexedSubscript:1];
  id v11 = [MEMORY[0x1E4F1CA98] null];

  if (v10 == v11)
  {
    v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v50 = *MEMORY[0x1E4F28568];
    id v17 = (id)[[NSString alloc] initWithFormat:@"biome_extract(): eventClassName is null"];
    id v51 = v17;
    v34 = (void *)MEMORY[0x1E4F1C9E8];
    v35 = &v51;
    v36 = &v50;
  }
  else
  {
    uint64_t v12 = [v6 objectAtIndexedSubscript:2];
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];

    if (v12 != v13)
    {
      uint64_t v14 = [v6 objectAtIndexedSubscript:0];
      uint64_t v15 = [v6 objectAtIndexedSubscript:1];
      long long v16 = [v6 objectAtIndexedSubscript:2];
      id v17 = v14;
      id v18 = v15;
      uint64_t v19 = BMFieldPathFromKeyPath(v16, v18, v7);
      v46 = (void *)v19;
      if (v19)
      {
        v20 = (void *)v19;
        v43 = v16;
        id v44 = v18;
        v42 = a4;
        id v45 = v7;
        id v21 = v17;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v22 = v20;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v52 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v54;
          while (2)
          {
            uint64_t v26 = 0;
            v27 = v21;
            do
            {
              if (*(void *)v54 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v28 = *(void **)(*((void *)&v53 + 1) + 8 * v26);
              uint64_t v29 = [v28 number];
              uint64_t v30 = [v28 type];
              id v47 = 0;
              id v21 = +[BMPoirotSchematizerShim searchValueIn:v27 withFieldNumber:v29 typeRawValue:v30 error:&v47];
              id v31 = v47;

              if (v31)
              {
                id v37 = v31;
                void *v42 = v37;

                v32 = 0;
                goto LABEL_19;
              }
              ++v26;
              v27 = v21;
            }
            while (v24 != v26);
            uint64_t v24 = [v22 countByEnumeratingWithState:&v53 objects:v52 count:16];
            if (v24) {
              continue;
            }
            break;
          }
        }

        id v21 = v21;
        v32 = v21;
LABEL_19:
        id v7 = v45;
        v38 = v43;
        id v18 = v44;
      }
      else
      {
        v39 = (void *)MEMORY[0x1E4F28C58];
        *(void *)&long long v53 = *MEMORY[0x1E4F28568];
        id v21 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"Field path is not valid: %@; eventClass: %@",
                    v16,
                    v18);
        v52[0] = v21;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v53 count:1];
        v40 = v38 = v16;
        *a4 = [v39 errorWithDomain:@"BMSQLDatabaseErrorDomain" code:0 userInfo:v40];

        v32 = 0;
      }

      goto LABEL_22;
    }
    v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v48 = *MEMORY[0x1E4F28568];
    id v17 = (id)[[NSString alloc] initWithFormat:@"biome_extract(): key path is null"];
    id v49 = v17;
    v34 = (void *)MEMORY[0x1E4F1C9E8];
    v35 = &v49;
    v36 = &v48;
  }
  id v18 = [v34 dictionaryWithObjects:v35 forKeys:v36 count:1];
  [v33 errorWithDomain:@"BMSQLDatabaseErrorDomain" code:0 userInfo:v18];
  v32 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

LABEL_23:

  return v32;
}

@end