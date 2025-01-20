@interface DKUtilities
+ (Class)diagnosticInputsClassAttribute;
+ (id)_fetchItemProviderFromItems:(id)a3 withError:(id *)a4;
+ (id)_sharedParsingFailedError;
+ (id)acceptableDecoderClasses;
+ (id)extensionAttributes;
+ (id)inputsForDiagnostic:(id)a3 predicates:(id)a4 specifications:(id)a5 parameters:(id)a6;
+ (id)inputsUsingClass:(Class)a3 diagnostic:(id)a4 predicates:(id)a5 specifications:(id)a6 parameters:(id)a7;
+ (void)moveFilesToSharedContainerInMutableResult:(id)a3;
@end

@implementation DKUtilities

+ (id)acceptableDecoderClasses
{
  if (acceptableDecoderClasses_onceToken != -1) {
    dispatch_once(&acceptableDecoderClasses_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)acceptableDecoderClasses_singleton;
  return v2;
}

uint64_t __39__DKUtilities_acceptableDecoderClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  acceptableDecoderClasses_singleton = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  return MEMORY[0x270F9A758]();
}

+ (id)extensionAttributes
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v3 = [v2 infoDictionary];

  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v8 = 0;
    goto LABEL_16;
  }
  uint64_t v4 = [v3 objectForKeyedSubscript:@"NSExtension"];

  if (v4)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"NSExtension"];
    uint64_t v6 = v5;
    uint64_t v7 = @"NSExtensionAttributes";
  }
  else
  {
    uint64_t v6 = [v3 objectForKeyedSubscript:@"DKDiagnosticService"];

    if (!v6)
    {
      id v9 = 0;
LABEL_14:
      uint64_t v8 = 0;
      goto LABEL_15;
    }
    uint64_t v5 = [v3 objectForKeyedSubscript:@"DKDiagnosticService"];
    uint64_t v6 = v5;
    uint64_t v7 = @"DKDiagnosticServiceAttributes";
  }
  id v9 = [v5 objectForKeyedSubscript:v7];
  if (!v6) {
    goto LABEL_14;
  }
  objc_opt_class();
  uint64_t v8 = 0;
  if ((objc_opt_isKindOfClass() & 1) == 0 || !v9) {
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  id v9 = v9;
  uint64_t v8 = v9;
LABEL_15:

LABEL_16:
  return v8;
}

+ (Class)diagnosticInputsClassAttribute
{
  uint64_t v2 = [a1 extensionAttributes];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKeyedSubscript:@"DKDiagnosticInputsClass"];
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      Class v5 = NSClassFromString(v4);
    }
    else {
      Class v5 = 0;
    }
  }
  else
  {
    Class v5 = 0;
  }
  uint64_t v6 = v5;

  return v6;
}

+ (id)inputsForDiagnostic:(id)a3 predicates:(id)a4 specifications:(id)a5 parameters:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_msgSend(a1, "inputsUsingClass:diagnostic:predicates:specifications:parameters:", objc_msgSend(a1, "diagnosticInputsClassAttribute"), v13, v12, v11, v10);

  return v14;
}

+ (id)inputsUsingClass:(Class)a3 diagnostic:(id)a4 predicates:(id)a5 specifications:(id)a6 parameters:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (a3)
  {
    a3 = (Class)objc_opt_new();
    if (a3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([(objc_class *)a3 validateAndInitializePredicates:v12] & 1) == 0)
      {
        v15 = [v11 result];
        v16 = v15;
        v17 = &unk_26F0DBA38;
        goto LABEL_12;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([(objc_class *)a3 validateAndInitializeSpecifications:v13] & 1) == 0)
      {
        v15 = [v11 result];
        v16 = v15;
        v17 = &unk_26F0DBA50;
        goto LABEL_12;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([(objc_class *)a3 validateAndInitializeParameters:v14] & 1) == 0)
      {
        v15 = [v11 result];
        v16 = v15;
        v17 = &unk_26F0DBA68;
LABEL_12:
        [v15 setStatusCode:v17];

        [v11 setFinished:1];
      }
    }
  }

  return a3;
}

+ (void)moveFilesToSharedContainerInMutableResult:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 files];
  if (v4)
  {
    Class v5 = (void *)v4;
    uint64_t v6 = [v3 files];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      v37 = DKTemporaryDirectoryURL();
      uint64_t v8 = [v3 files];
      id v9 = (void *)[v8 copy];

      v35 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v10 = [v3 files];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v50 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        v33 = v9;
        v34 = v3;
        char v13 = 0;
        uint64_t v14 = *(void *)v41;
        unint64_t v15 = 0x263F08000uLL;
        do
        {
          uint64_t v16 = 0;
          uint64_t v36 = v12;
          do
          {
            if (*(void *)v41 != v14) {
              objc_enumerationMutation(v10);
            }
            v17 = *(void **)(*((void *)&v40 + 1) + 8 * v16);
            v18 = objc_msgSend(v17, "path", v33, v34);
            v19 = [v37 path];
            char v20 = [v18 hasPrefix:v19];

            if ((v20 & 1) == 0)
            {
              v21 = v10;
              v22 = [v17 lastPathComponent];
              v23 = [v37 URLByAppendingPathComponent:v22];
              v24 = [*(id *)(v15 + 2128) defaultManager];
              id v39 = 0;
              int v25 = [v24 copyItemAtURL:v17 toURL:v23 error:&v39];
              id v26 = v39;

              if (v25)
              {

                v27 = [*(id *)(v15 + 2128) defaultManager];
                id v38 = 0;
                char v28 = [v27 removeItemAtURL:v17 error:&v38];
                id v26 = v38;

                if ((v28 & 1) == 0)
                {
                  v29 = DiagnosticsKitLogHandleForCategory(2);
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v45 = v17;
                    __int16 v46 = 2112;
                    id v47 = v26;
                    _os_log_error_impl(&dword_23D039000, v29, OS_LOG_TYPE_ERROR, "Could not delete file at [%@]: %@", buf, 0x16u);
                  }
                }
                v30 = DiagnosticsKitLogHandleForCategory(2);
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v45 = v17;
                  __int16 v46 = 2112;
                  id v47 = v23;
                  _os_log_impl(&dword_23D039000, v30, OS_LOG_TYPE_DEFAULT, "Moved file at [%@] to [%@].", buf, 0x16u);
                }

                [v35 addObject:v23];
              }
              else
              {
                v31 = DiagnosticsKitLogHandleForCategory(2);
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412802;
                  v45 = v17;
                  __int16 v46 = 2112;
                  id v47 = v23;
                  __int16 v48 = 2112;
                  id v49 = v26;
                  _os_log_error_impl(&dword_23D039000, v31, OS_LOG_TYPE_ERROR, "Could not copy file from [%@] to [%@]: %@", buf, 0x20u);
                }
              }
              char v13 = 1;
              id v10 = v21;
              unint64_t v15 = 0x263F08000;
              uint64_t v12 = v36;
            }
            ++v16;
          }
          while (v12 != v16);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v50 count:16];
        }
        while (v12);

        id v9 = v33;
        id v3 = v34;
        if (v13)
        {
          v32 = [v35 copy];
          [v34 setFiles:v32];
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {
      }
      v32 = DiagnosticsKitLogHandleForCategory(2);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23D039000, v32, OS_LOG_TYPE_DEFAULT, "Files already in shared container. Leaving unchanged.", buf, 2u);
      }
      goto LABEL_28;
    }
  }
LABEL_29:
}

+ (id)_fetchItemProviderFromItems:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6 || ![v6 count])
  {
    uint64_t v8 = [a1 _sharedParsingFailedError];
    if (v8)
    {
      id v9 = (void *)v8;
      id v10 = 0;
      goto LABEL_9;
    }
  }
  id v10 = [v7 firstObject];
  uint64_t v11 = [v10 attachments];
  if (!v11
    || (uint64_t v12 = (void *)v11,
        [v10 attachments],
        char v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 count],
        v13,
        v12,
        !v14))
  {
    uint64_t v15 = [a1 _sharedParsingFailedError];
    if (v15)
    {
      id v9 = (void *)v15;
LABEL_9:
      uint64_t v16 = 0;
      if (!a4) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  v18 = [v10 attachments];
  uint64_t v16 = [v18 firstObject];

  id v9 = 0;
  if (a4) {
LABEL_10:
  }
    *a4 = v9;
LABEL_11:

  return v16;
}

+ (id)_sharedParsingFailedError
{
  if (_sharedParsingFailedError_onceToken != -1) {
    dispatch_once(&_sharedParsingFailedError_onceToken, &__block_literal_global_35);
  }
  uint64_t v2 = (void *)_sharedParsingFailedError_singleton;
  return v2;
}

void __40__DKUtilities__sharedParsingFailedError__block_invoke()
{
  v6[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F08320];
  uint64_t v1 = DKErrorLocalizedDescriptionForCode(-1004);
  v6[0] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v3 = [v0 errorWithDomain:@"DKErrorDomain" code:-1004 userInfo:v2];
  uint64_t v4 = (void *)_sharedParsingFailedError_singleton;
  _sharedParsingFailedError_singleton = v3;
}

@end