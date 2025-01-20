@interface _DPTransparencyLogMaintainer
+ (BOOL)checkAndRemoveFile:(id)a3;
+ (double)lifetimeOfFile:(id)a3;
- (BOOL)doMaintenance;
- (NSString)reportsDirectoryPath;
- (_DPTransparencyLogMaintainer)init;
- (_DPTransparencyLogMaintainer)initWithDirectoryPath:(id)a3;
- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4;
- (void)setReportsDirectoryPath:(id)a3;
@end

@implementation _DPTransparencyLogMaintainer

- (_DPTransparencyLogMaintainer)initWithDirectoryPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DPTransparencyLogMaintainer;
  v6 = [(_DPTransparencyLogMaintainer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reportsDirectoryPath, a3);
  }

  return v7;
}

- (_DPTransparencyLogMaintainer)init
{
  v3 = +[_DPStrings transparencyLogDirectoryPath];
  v4 = [(_DPTransparencyLogMaintainer *)self initWithDirectoryPath:v3];

  return v4;
}

+ (double)lifetimeOfFile:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = kSecondsIn3Day;
  id v22 = 0;
  id v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3 options:1 error:&v22];
  id v6 = v22;
  if (v5)
  {
    id v21 = v6;
    v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v21];
    id v8 = v21;

    if (!v7)
    {
      objc_super v9 = +[_DPLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[_DPTransparencyLogMaintainer lifetimeOfFile:].cold.4((uint64_t)v3, v8);
      }
    }
    if (![v7 count])
    {
      double v18 = 0.0;
      goto LABEL_28;
    }
    v10 = [v7 objectAtIndexedSubscript:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v12 = 0;
    if (isKindOfClass)
    {
      v13 = [v7 objectAtIndexedSubscript:0];
      v12 = [v13 objectForKeyedSubscript:@"key"];
    }
    uint64_t v14 = [v12 length];
    v15 = +[_DPLog framework];
    v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v12;
        __int16 v25 = 2112;
        id v26 = v3;
        _os_log_impl(&dword_1DC55E000, v16, OS_LOG_TYPE_INFO, "Found the key %@ in transparency log %@", buf, 0x16u);
      }

      v17 = +[_DPKeyNames keyPropertiesForKey:v12];
      if (v17) {
        goto LABEL_24;
      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[_DPTransparencyLogMaintainer lifetimeOfFile:]((uint64_t)v3, v16);
      }
    }
    v19 = +[_DPLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[_DPTransparencyLogMaintainer lifetimeOfFile:]();
    }

    v17 = 0;
LABEL_24:
    if ([v17 transparencyLogLifetime]) {
      double v18 = (double)(unint64_t)[v17 transparencyLogLifetime] * 24.0 * 3600.0;
    }
    else {
      double v18 = (double)v4;
    }

    goto LABEL_28;
  }
  v7 = +[_DPLog framework];
  double v18 = 0.0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    +[_DPTransparencyLogMaintainer lifetimeOfFile:]((uint64_t)v3, v6);
  }
  id v8 = v6;
LABEL_28:

  return v18;
}

+ (BOOL)checkAndRemoveFile:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [(id)objc_opt_class() lifetimeOfFile:v3];
  double v5 = v4;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v7 = [MEMORY[0x1E4F1C9C8] date];
  id v20 = 0;
  uint64_t v8 = *MEMORY[0x1E4F1C540];
  id v19 = 0;
  char v9 = [v3 getResourceValue:&v20 forKey:v8 error:&v19];
  id v10 = v20;
  id v11 = v19;
  if ((v9 & 1) == 0)
  {
    v12 = +[_DPLog framework];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[_DPTransparencyLogMaintainer checkAndRemoveFile:]();
    }
    goto LABEL_9;
  }
  if (!v10)
  {
    v12 = +[_DPLog framework];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[_DPTransparencyLogMaintainer checkAndRemoveFile:]((uint64_t)v3, v12);
    }
LABEL_9:
    char v13 = 0;
    goto LABEL_10;
  }
  v12 = [v10 dateByAddingTimeInterval:v5];
  if ([v12 compare:v7] == -1)
  {
    id v18 = 0;
    char v13 = [v6 removeItemAtURL:v3 error:&v18];
    id v15 = v18;
    v16 = +[_DPLog framework];
    v17 = v16;
    if (v13)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v3;
        _os_log_impl(&dword_1DC55E000, v17, OS_LOG_TYPE_INFO, "Successfully removed transparency log %@.", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      +[_DPTransparencyLogMaintainer checkAndRemoveFile:]((uint64_t)v3, v15);
    }
  }
  else
  {
    char v13 = 1;
  }
LABEL_10:

  return v13;
}

- (BOOL)doMaintenance
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(_DPTransparencyLogMaintainer *)self reportsDirectoryPath];
  id v3 = +[_DPReportFilesMaintainer reportsInDirectory:v2];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        id v10 = (void *)MEMORY[0x1E019F810](v5);
        objc_msgSend((id)objc_opt_class(), "checkAndRemoveFile:", v9, (void)v12);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }

  return 1;
}

- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69___DPTransparencyLogMaintainer_scheduleMaintenanceWithName_database___block_invoke;
  v7[3] = &unk_1E6C43BE0;
  v7[4] = self;
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E019FA60](v7);
  uint64_t v6 = +[_DPPeriodicTask taskWithName:v4 period:kSecondsIn24Hours handler:v5];

  +[_DPPeriodicTaskManager registerTask:v6];
}

- (NSString)reportsDirectoryPath
{
  return self->_reportsDirectoryPath;
}

- (void)setReportsDirectoryPath:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)lifetimeOfFile:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  v2 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v3, v4, "Failed to read transparency log file %@ with error %@.", v5, v6, v7, v8, v9);
}

+ (void)lifetimeOfFile:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1DC55E000, v0, v1, "No key properties was found for key %@ in file %@");
}

+ (void)lifetimeOfFile:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "No key found in the transparency log %@", (uint8_t *)&v2, 0xCu);
}

+ (void)lifetimeOfFile:(uint64_t)a1 .cold.4(uint64_t a1, void *a2)
{
  int v2 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v3, v4, "Failed to parse the JSON transparency log for file %@ with error %@.", v5, v6, v7, v8, v9);
}

+ (void)checkAndRemoveFile:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "No value for NSURLCreationDateKey from %@.", (uint8_t *)&v2, 0xCu);
}

+ (void)checkAndRemoveFile:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  int v2 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v3, v4, "Failed to remove transparency log %@ with error %@.", v5, v6, v7, v8, v9);
}

+ (void)checkAndRemoveFile:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1DC55E000, v0, v1, "Failed to read NSURLCreationDateKey from %@ with error %@.");
}

@end