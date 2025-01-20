@interface ASDDSPGraphLoader
+ (BOOL)applyAUStrip:(id)a3 toGraph:(id)a4;
+ (BOOL)applyPropertyStrip:(id)a3 toGraph:(id)a4;
+ (id)graphWithConfiguration:(id)a3;
+ (id)graphWithGraphInfo:(id)a3;
@end

@implementation ASDDSPGraphLoader

+ (id)graphWithConfiguration:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v29 = a3;
  v3 = [v29 dspItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v4) {
    goto LABEL_28;
  }
  uint64_t v5 = v4;
  v6 = 0;
  uint64_t v7 = *(void *)v31;
  while (2)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v31 != v7) {
        objc_enumerationMutation(v3);
      }
      v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = +[ASDDSPGraphLoader graphWithGraphInfo:v9];

        v6 = (void *)v10;
        if (!v10) {
          goto LABEL_29;
        }
        continue;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v6)
        {
          if (+[ASDDSPGraphLoader applyAUStrip:v9 toGraph:v6])
          {
            continue;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            +[ASDDSPGraphLoader graphWithConfiguration:](v9, v6);
          }
LABEL_27:

          goto LABEL_28;
        }
        BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v11) {
          +[ASDDSPGraphLoader graphWithConfiguration:](v11, v12, v13, v14, v15, v16, v17, v18);
        }
LABEL_28:
        v6 = 0;
        goto LABEL_29;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        continue;
      }
      if (!v6)
      {
        BOOL v20 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v20) {
          +[ASDDSPGraphLoader graphWithConfiguration:](v20, v21, v22, v23, v24, v25, v26, v27);
        }
        goto LABEL_28;
      }
      if (!+[ASDDSPGraphLoader applyPropertyStrip:v9 toGraph:v6])
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          +[ASDDSPGraphLoader graphWithConfiguration:].cold.4(v9, v6);
        }
        goto LABEL_27;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v5) {
      continue;
    }
    break;
  }
LABEL_29:

  return v6;
}

+ (id)graphWithGraphInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 text];

  if (v4)
  {
    uint64_t v5 = [v3 text];
    v6 = [v3 substitutions];
    uint64_t v7 = [v3 includePaths];
    uint64_t v8 = +[ASDDSPGraphInterpreter compileText:v5 withSubstitutions:v6 includingPaths:v7];
LABEL_5:
    uint64_t v10 = (void *)v8;

    goto LABEL_6;
  }
  v9 = [v3 path];

  if (v9)
  {
    uint64_t v5 = [v3 path];
    v6 = [v3 substitutions];
    uint64_t v7 = [v3 includePaths];
    uint64_t v8 = +[ASDDSPGraphInterpreter compileFile:v5 withSubstitutions:v6 includingPaths:v7];
    goto LABEL_5;
  }
  BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v12) {
    +[ASDDSPGraphLoader graphWithGraphInfo:](v12, v13, v14, v15, v16, v17, v18, v19);
  }
  uint64_t v10 = 0;
LABEL_6:

  return v10;
}

+ (BOOL)applyAUStrip:(id)a3 toGraph:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 value];
    uint64_t v8 = [v5 path];
    int v25 = 138412546;
    uint64_t v26 = v7;
    __int16 v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "AUStripInfo value:%@ path:%@", (uint8_t *)&v25, 0x16u);
  }
  v9 = [v5 value];

  if (v9)
  {
    uint64_t v10 = [v5 value];
    char v11 = [v6 setAUStrip:v10];
  }
  else
  {
    BOOL v12 = [v5 path];

    if (v12)
    {
      uint64_t v13 = NSDictionary;
      uint64_t v14 = [v5 path];
      uint64_t v15 = [v13 dictionaryWithContentsOfFile:v14];

      char v11 = [v6 setAUStrip:v15];
    }
    else
    {
      BOOL v16 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v16) {
        +[ASDDSPGraphLoader applyAUStrip:toGraph:](v16, v17, v18, v19, v20, v21, v22, v23);
      }
      char v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)applyPropertyStrip:(id)a3 toGraph:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 value];

  if (v7)
  {
    uint64_t v8 = [v5 value];
    char v9 = [v6 setPropertyStrip:v8];
  }
  else
  {
    uint64_t v10 = [v5 path];

    if (v10)
    {
      char v11 = NSDictionary;
      BOOL v12 = [v5 path];
      uint64_t v13 = [v11 dictionaryWithContentsOfFile:v12];

      char v9 = [v6 setPropertyStrip:v13];
    }
    else
    {
      BOOL v14 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v14) {
        +[ASDDSPGraphLoader applyPropertyStrip:toGraph:](v14, v15, v16, v17, v18, v19, v20, v21);
      }
      char v9 = 0;
    }
  }

  return v9;
}

+ (void)graphWithConfiguration:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)graphWithConfiguration:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 path];
  uint64_t v4 = [a2 name];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Applying AUStrip %@ to graph %@ failed", v5, 0x16u);
}

+ (void)graphWithConfiguration:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)graphWithConfiguration:(void *)a1 .cold.4(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 path];
  uint64_t v4 = [a2 name];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Applying PropertyStrip %@ to graph %@ failed", v5, 0x16u);
}

+ (void)graphWithGraphInfo:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)applyAUStrip:(uint64_t)a3 toGraph:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)applyPropertyStrip:(uint64_t)a3 toGraph:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end