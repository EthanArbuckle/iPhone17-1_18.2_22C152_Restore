@interface DOCFileRenamingSupport
+ (BOOL)_validateFileName:(id)a3 error:(id *)a4;
+ (id)_filteredNameForName:(id)a3 error:(id *)a4;
+ (id)_urlForProposedName:(id)a3 originalURL:(id)a4 error:(id *)a5;
+ (id)fallbackRename:(id)a3 toProposedName:(id)a4 error:(id *)a5;
@end

@implementation DOCFileRenamingSupport

+ (id)fallbackRename:(id)a3 toProposedName:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v22 = 0;
  v9 = [(id)objc_opt_class() _urlForProposedName:v8 originalURL:v7 error:&v22];

  id v10 = v22;
  v11 = v10;
  if (!v9 || v10)
  {
    v18 = (NSObject **)MEMORY[0x263F3AC28];
    v19 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      v19 = *v18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      +[DOCFileRenamingSupport fallbackRename:toProposedName:error:]((uint64_t)v11, v19);
    }
    id v17 = 0;
    if (a5 && v11)
    {
      id v17 = 0;
      *a5 = v11;
    }
  }
  else
  {
    v12 = [MEMORY[0x263F08850] defaultManager];
    id v21 = 0;
    int v13 = [v12 moveItemAtURL:v7 toURL:v9 error:&v21];
    id v14 = v21;

    v15 = (NSObject **)MEMORY[0x263F3AC28];
    v16 = *MEMORY[0x263F3AC28];
    if (v13)
    {
      if (!v16)
      {
        DOCInitLogging();
        v16 = *v15;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v24 = v7;
        __int16 v25 = 2112;
        v26 = v9;
        _os_log_impl(&dword_21361D000, v16, OS_LOG_TYPE_INFO, "Renamed: %@ to: %@", buf, 0x16u);
      }
      id v17 = v9;
    }
    else
    {
      if (!v16)
      {
        DOCInitLogging();
        v16 = *v15;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        +[DOCFileRenamingSupport fallbackRename:toProposedName:error:](v16, v14);
      }
      id v17 = 0;
      if (a5 && v14)
      {
        id v17 = 0;
        *a5 = v14;
      }
    }
  }
  return v17;
}

+ (BOOL)_validateFileName:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 hasPrefix:@"."])
  {
    v6 = _DocumentManagerBundle();
    id v7 = v6;
    id v8 = @"You can’t use a name that begins with a dot “.”, because these names are reserved for the system. Please choose another name.";
  }
  else if ([v5 containsString:@":"])
  {
    v6 = _DocumentManagerBundle();
    id v7 = v6;
    id v8 = @"You can’t use a name that contains “:”. Please choose another name.";
  }
  else
  {
    if ([v5 length])
    {
      id v9 = 0;
      BOOL v10 = 1;
      goto LABEL_11;
    }
    v6 = _DocumentManagerBundle();
    id v7 = v6;
    id v8 = @"You can’t use an empty name. Please choose another name.";
  }
  v11 = [v6 localizedStringForKey:v8 value:v8 table:@"Localizable"];

  __50__DOCFileRenamingSupport__validateFileName_error___block_invoke(v12, v11, (void *)*MEMORY[0x263F07F70], 258);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v10 = v9 == 0;
  if (a4 && v9)
  {
    id v9 = v9;
    BOOL v10 = 0;
    *a4 = v9;
  }
LABEL_11:

  return v10;
}

id __50__DOCFileRenamingSupport__validateFileName_error___block_invoke(uint64_t a1, __CFString *a2, void *a3, uint64_t a4)
{
  v14[1] = *MEMORY[0x263EF8340];
  if (a2) {
    v6 = a2;
  }
  else {
    v6 = @"UNLOCALIZED";
  }
  uint64_t v13 = *MEMORY[0x263F08320];
  v14[0] = v6;
  id v7 = NSDictionary;
  id v8 = a3;
  id v9 = a2;
  BOOL v10 = [v7 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v11 = [MEMORY[0x263F087E8] errorWithDomain:v8 code:a4 userInfo:v10];

  return v11;
}

+ (id)_filteredNameForName:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v13 = 0;
  char v6 = [(id)objc_opt_class() _validateFileName:v5 error:&v13];
  id v7 = v13;
  id v8 = v7;
  if (v6)
  {
    id v9 = [v5 stringByReplacingOccurrencesOfString:@"/" withString:@":"];
    BOOL v10 = [NSURL fileURLWithPath:v9];
    v11 = [v10 lastPathComponent];
  }
  else
  {
    v11 = 0;
    if (a4 && v7)
    {
      v11 = 0;
      *a4 = v7;
    }
  }

  return v11;
}

+ (id)_urlForProposedName:(id)a3 originalURL:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 pathExtension];
  uint64_t v10 = [v9 length];
  v11 = [v7 URLByDeletingLastPathComponent];

  id v25 = 0;
  uint64_t v12 = [(id)objc_opt_class() _filteredNameForName:v8 error:&v25];

  id v13 = v25;
  id v14 = v13;
  if (v12)
  {
    v15 = [v12 pathExtension];
    uint64_t v16 = [v15 length];
    id v17 = (NSObject **)MEMORY[0x263F3AC28];
    if (v16 && v10)
    {
      if (([v9 isEqualToString:v15] & 1) == 0)
      {
        v18 = *v17;
        if (!*v17)
        {
          DOCInitLogging();
          v18 = *v17;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          +[DOCFileRenamingSupport _urlForProposedName:originalURL:error:]();
        }
      }
    }
    else if (!v16 || v10)
    {
      if (!v16 && v10)
      {
        id v21 = *MEMORY[0x263F3AC28];
        if (!*MEMORY[0x263F3AC28])
        {
          DOCInitLogging();
          id v21 = *v17;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          +[DOCFileRenamingSupport _urlForProposedName:originalURL:error:]();
        }
      }
    }
    else
    {
      v20 = *MEMORY[0x263F3AC28];
      if (!*MEMORY[0x263F3AC28])
      {
        DOCInitLogging();
        v20 = *v17;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        +[DOCFileRenamingSupport _urlForProposedName:originalURL:error:]();
      }
    }
    id v22 = [v12 stringByAppendingPathExtension:v9];
    v19 = [v11 URLByAppendingPathComponent:v22];
    v23 = *v17;
    if (!*v17)
    {
      DOCInitLogging();
      v23 = *v17;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v9;
      __int16 v28 = 2112;
      v29 = v15;
      _os_log_impl(&dword_21361D000, v23, OS_LOG_TYPE_INFO, "Prepared new url from: %@ to: %@", buf, 0x16u);
    }
  }
  else
  {
    v19 = 0;
    if (a5 && v13)
    {
      v19 = 0;
      *a5 = v13;
    }
  }

  return v19;
}

+ (void)fallbackRename:(uint64_t)a1 toProposedName:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21361D000, a2, OS_LOG_TYPE_DEBUG, "Rename failed validation with error: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)fallbackRename:(void *)a1 toProposedName:(void *)a2 error:.cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  int v5 = 138412290;
  char v6 = v4;
  _os_log_debug_impl(&dword_21361D000, v3, OS_LOG_TYPE_DEBUG, "Rename operation failed: %@", (uint8_t *)&v5, 0xCu);
}

+ (void)_urlForProposedName:originalURL:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_21361D000, v0, v1, "Removing file extension from: %@ to: %@");
}

+ (void)_urlForProposedName:originalURL:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_21361D000, v0, v1, "Adding file extension from: %@ to: %@");
}

+ (void)_urlForProposedName:originalURL:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_21361D000, v0, v1, "Changing file extension from: %@ to: %@");
}

@end