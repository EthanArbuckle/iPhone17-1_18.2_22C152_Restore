@interface MLNNLayerComputeUnitSelectionUtils
+ (BOOL)undoLastHintUpdate:(id)a3 error:(id *)a4;
+ (BOOL)updateHints:(id)a3 hints:(id)a4 error:(id *)a5;
+ (id)getLayerHints:(id)a3 error:(id *)a4;
+ (id)getLayerTypes:(id)a3 error:(id *)a4;
+ (id)getNetJson:(id)a3 error:(id *)a4;
@end

@implementation MLNNLayerComputeUnitSelectionUtils

+ (BOOL)undoLastHintUpdate:(id)a3 error:(id *)a4
{
  v5 = [a3 URLByAppendingPathComponent:@"model.espresso.net"];
  v6 = [v5 path];

  v7 = [v6 stringByAppendingString:@".bckp"];
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v8 fileExistsAtPath:v7])
  {
    [v8 removeItemAtPath:v6 error:a4];
    if (*a4)
    {
      BOOL v9 = 0;
    }
    else
    {
      [v8 moveItemAtPath:v7 toPath:v6 error:a4];
      BOOL v9 = *a4 == 0;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

+ (BOOL)updateHints:(id)a3 hints:(id)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v45 = a4;
  id v48 = 0;
  v43 = [a1 getNetJson:v44 error:&v48];
  id v8 = v48;
  BOOL v9 = v8;
  if (!v8)
  {
    v42 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v47 = 0;
    v11 = [v44 path];
    v41 = a5;
    [v42 fileExistsAtPath:v11 isDirectory:&v47];

    if (v47)
    {
      v12 = [v44 path];
      char v13 = [v42 isWritableFileAtPath:v12];

      if (v13)
      {
        v14 = [v44 URLByAppendingPathComponent:@"model.espresso.net"];
        id v39 = [v14 path];

        uint64_t v15 = [v39 stringByAppendingString:@".bckp"];
        id v37 = (id)v15;
        if ([v42 fileExistsAtPath:v15]) {
          [v42 removeItemAtPath:v15 error:0];
        }
        v16 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v50 = v37;
          _os_log_impl(&dword_19E58B000, v16, OS_LOG_TYPE_INFO, "Creating a backup of .net file at location %@", buf, 0xCu);
        }

        id v40 = v39;
        v17 = (const char *)[v40 UTF8String];
        id v38 = v37;
        if (clonefile(v17, (const char *)[v38 UTF8String], 1u))
        {
          v18 = NSString;
          v19 = __error();
          v20 = objc_msgSend(v18, "stringWithCString:encoding:", strerror(*v19), objc_msgSend(NSString, "defaultCStringEncoding"));
          if (a5)
          {
            +[MLModelErrorUtils genericErrorWithFormat:@"Unable to create backup of .net file at compiled model directory, with error: %@", v20];
            BOOL v10 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            BOOL v10 = 0;
          }
        }
        else
        {
          v20 = [v43 objectForKeyedSubscript:@"layers"];
          for (unint64_t i = 0; i < [v20 count]; ++i)
          {
            v23 = [v20 objectAtIndexedSubscript:i];
            v24 = [v23 objectForKeyedSubscript:@"name"];
            v25 = [v45 objectForKey:v24];
            BOOL v26 = v25 == 0;

            if (!v26)
            {
              v27 = [v23 objectForKeyedSubscript:@"name"];
              v28 = [v45 objectForKeyedSubscript:v27];

              v29 = [v28 objectForKey:@"kMLLayerComputeUnitHintFallbackFromCPU"];
              v30 = [v28 objectForKey:@"kMLLayerComputeUnitHintFallbackFromGPU"];
              v31 = [v28 objectForKey:@"kMLLayerComputeUnitHintFallbackFromNE"];
              if (v29)
              {
                if ([v29 BOOLValue]) {
                  [v23 setObject:&unk_1EF11A5F8 forKey:@"hint_fallback_from_cpu"];
                }
                else {
                  [v23 removeObjectForKey:@"hint_fallback_from_cpu"];
                }
              }
              if (v30)
              {
                if ([v30 BOOLValue]) {
                  [v23 setObject:&unk_1EF11A5F8 forKey:@"hint_fallback_from_metal"];
                }
                else {
                  [v23 removeObjectForKey:@"hint_fallback_from_metal"];
                }
              }
              if (v31)
              {
                if ([v31 BOOLValue]) {
                  [v23 setObject:&unk_1EF11A5F8 forKey:@"hint_fallback_from_ane"];
                }
                else {
                  [v23 removeObjectForKey:@"hint_fallback_from_ane"];
                }
              }
            }
          }
          [v42 removeItemAtPath:v40 error:0];
          id v46 = 0;
          v32 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v43 options:1 error:&v46];
          id v33 = v46;
          v34 = v33;
          BOOL v10 = v33 == 0;
          if (v33)
          {
            if (v41)
            {
              v35 = [v33 localizedDescription];
              id *v41 = +[MLModelErrorUtils genericErrorWithFormat:@"Failed to serialize new .net data after updating schedule hints, underlying error message: %@", v35];
            }
          }
          else
          {
            [v32 writeToFile:v40 atomically:1];
          }
        }
        goto LABEL_44;
      }
      if (a5)
      {
        id v40 = [v44 path];
        id v21 = +[MLModelErrorUtils genericErrorWithFormat:@"Compiled model path: '%@', must be a writable directory.", v40];
        goto LABEL_18;
      }
    }
    else if (a5)
    {
      id v40 = [v44 path];
      id v21 = +[MLModelErrorUtils genericErrorWithFormat:@"Compiled model path: '%@', must be a directory.", v40];
LABEL_18:
      BOOL v10 = 0;
      *a5 = v21;
LABEL_44:

      goto LABEL_45;
    }
    BOOL v10 = 0;
LABEL_45:

    goto LABEL_46;
  }
  BOOL v10 = 0;
  if (a5) {
    *a5 = v8;
  }
LABEL_46:

  return v10;
}

+ (id)getLayerHints:(id)a3 error:(id *)a4
{
  v33[3] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  v29 = objc_msgSend(a1, "getNetJson:error:");
  id v30 = 0;
  if (v30)
  {
    id v31 = 0;
    if (a4) {
      *a4 = v30;
    }
  }
  else
  {
    v6 = [v29 objectForKeyedSubscript:@"layers"];
    id v31 = (id)objc_opt_new();
    for (unint64_t i = 0; i < [v6 count]; ++i)
    {
      id v8 = [v6 objectAtIndexedSubscript:i];
      BOOL v9 = (void *)MEMORY[0x1E4F1CA60];
      v32[0] = @"kMLLayerComputeUnitHintFallbackFromCPU";
      BOOL v10 = [NSNumber numberWithInteger:0];
      v33[0] = v10;
      v32[1] = @"kMLLayerComputeUnitHintFallbackFromGPU";
      v11 = [NSNumber numberWithInteger:0];
      v33[1] = v11;
      v32[2] = @"kMLLayerComputeUnitHintFallbackFromNE";
      v12 = [NSNumber numberWithInteger:0];
      v33[2] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
      v14 = [v9 dictionaryWithDictionary:v13];

      uint64_t v15 = [v8 objectForKey:@"hint_fallback_from_metal"];
      LOBYTE(v13) = v15 == 0;

      if ((v13 & 1) == 0)
      {
        v16 = [v8 objectForKeyedSubscript:@"hint_fallback_from_metal"];
        if ([v16 BOOLValue])
        {
          v17 = [NSNumber numberWithInteger:1];
          [v14 setObject:v17 forKeyedSubscript:@"kMLLayerComputeUnitHintFallbackFromGPU"];
        }
      }
      v18 = [v8 objectForKey:@"hint_fallback_from_cpu"];
      BOOL v19 = v18 == 0;

      if (!v19)
      {
        v20 = [v8 objectForKeyedSubscript:@"hint_fallback_from_cpu"];
        if ([v20 BOOLValue])
        {
          id v21 = [NSNumber numberWithInteger:1];
          [v14 setObject:v21 forKeyedSubscript:@"kMLLayerComputeUnitHintFallbackFromCPU"];
        }
      }
      v22 = [v8 objectForKey:@"hint_fallback_from_ane"];
      BOOL v23 = v22 == 0;

      if (!v23)
      {
        v24 = [v8 objectForKeyedSubscript:@"hint_fallback_from_ane"];
        if ([v24 BOOLValue])
        {
          v25 = [NSNumber numberWithInteger:1];
          [v14 setObject:v25 forKeyedSubscript:@"kMLLayerComputeUnitHintFallbackFromNE"];
        }
      }
      BOOL v26 = [v8 objectForKeyedSubscript:@"name"];
      [v31 setObject:v14 forKey:v26];
    }
  }

  return v31;
}

+ (id)getLayerTypes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v20 = 0;
  v7 = [a1 getNetJson:v6 error:&v20];
  id v8 = v20;
  BOOL v9 = v8;
  BOOL v19 = v7;
  if (v8)
  {
    BOOL v10 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    v11 = objc_msgSend(v7, "objectForKeyedSubscript:", @"layers", v7);
    BOOL v10 = objc_opt_new();
    for (unint64_t i = 0; i < [v11 count]; ++i)
    {
      uint64_t v13 = [v11 objectAtIndexedSubscript:i];
      v14 = [v13 objectForKeyedSubscript:@"type"];
      if (v14)
      {
        uint64_t v15 = [v13 objectForKeyedSubscript:@"name"];

        if (v15)
        {
          v16 = [v13 objectForKeyedSubscript:@"type"];
          v17 = [v13 objectForKeyedSubscript:@"name"];
          [v10 setObject:v16 forKey:v17];
        }
      }
    }
  }

  return v10;
}

+ (id)getNetJson:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 URLByAppendingPathComponent:@"model.espresso.net"];
  v7 = [v6 path];

  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v8 fileExistsAtPath:v7])
  {
    BOOL v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v7];
    BOOL v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v9 options:1 error:a4];
    v11 = v10;
    if (v9 && v10)
    {
      id v12 = v10;
    }
    else if (a4)
    {
      +[MLModelErrorUtils genericErrorWithFormat:@"Unable to load information from compiled model path %@.", v7];
      id v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    if (!a4)
    {
      id v12 = 0;
      goto LABEL_13;
    }
    BOOL v9 = [v5 path];
    +[MLModelErrorUtils genericErrorWithFormat:@"'model.espresso.net' file not found at the given compiled model path: %@.", v9];
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_13:

  return v12;
}

@end