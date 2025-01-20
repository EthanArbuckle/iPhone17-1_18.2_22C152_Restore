@interface FMDataArchiver
+ (id)defaultClasses;
- (BOOL)backedUp;
- (BOOL)createDirectories;
- (BOOL)saveArray:(id)a3 error:(id *)a4;
- (BOOL)saveDictionary:(id)a3 error:(id *)a4;
- (FMDataArchiver)initWithFileURL:(id)a3;
- (NSData)unitTestData;
- (NSURL)fileURL;
- (id)readArrayAndClasses:(id)a3 error:(id *)a4;
- (id)readDataOfClasses:(id)a3 error:(id *)a4;
- (id)readDictionaryAndClasses:(id)a3 error:(id *)a4;
- (id)saveObject:(id)a3;
- (id)underlyingDataWithError:(id *)a3;
- (int64_t)dataProtectionClass;
- (unint64_t)dataWritingOptionForDataProtectionClass:(int64_t)a3;
- (void)setBackedUp:(BOOL)a3;
- (void)setCreateDirectories:(BOOL)a3;
- (void)setDataProtectionClass:(int64_t)a3;
- (void)setFileURL:(id)a3;
- (void)setUnitTestData:(id)a3;
@end

@implementation FMDataArchiver

- (FMDataArchiver)initWithFileURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDataArchiver;
  v5 = [(FMDataArchiver *)&v9 init];
  if (!v5) {
    goto LABEL_4;
  }
  if ([v4 isFileURL])
  {
    [(FMDataArchiver *)v5 setFileURL:v4];
    [(FMDataArchiver *)v5 setDataProtectionClass:3];
    [(FMDataArchiver *)v5 setBackedUp:0];
    [(FMDataArchiver *)v5 setCreateDirectories:0];
LABEL_4:
    v6 = v5;
    goto LABEL_8;
  }
  v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[FMDataArchiver initWithFileURL:](v7);
  }

  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)defaultClasses
{
  if (defaultClasses_onceToken != -1) {
    dispatch_once(&defaultClasses_onceToken, &__block_literal_global);
  }
  v2 = (void *)defaultClasses_set;
  return v2;
}

uint64_t __32__FMDataArchiver_defaultClasses__block_invoke()
{
  v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  defaultClasses_set = objc_msgSend(v15, "setWithObjects:", v14, v13, v12, v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  return MEMORY[0x1F41817F8]();
}

- (id)readDictionaryAndClasses:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() defaultClasses];
  uint64_t v8 = [v6 setByAddingObjectsFromSet:v7];

  id v17 = 0;
  uint64_t v9 = [(FMDataArchiver *)self readDataOfClasses:v8 error:&v17];
  id v10 = v17;
  id v11 = v10;
  if (!v9 || v10) {
    goto LABEL_7;
  }
  uint64_t v12 = objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28588];
    uint64_t v14 = [NSString stringWithFormat:@"Expected class %@ got %@.", v12, objc_opt_class()];
    v19[0] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v11 = [v13 errorWithDomain:@"com.apple.icloud.FMCore.FMDataArchiver" code:2 userInfo:v15];

LABEL_7:
    if (!a4) {
      goto LABEL_11;
    }
    if (v11)
    {

      uint64_t v9 = 0;
    }
    goto LABEL_10;
  }
  id v11 = 0;
  if (a4)
  {
LABEL_10:
    id v11 = v11;
    *a4 = v11;
  }
LABEL_11:

  return v9;
}

- (id)readArrayAndClasses:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() defaultClasses];
  uint64_t v8 = [v6 setByAddingObjectsFromSet:v7];

  id v17 = 0;
  uint64_t v9 = [(FMDataArchiver *)self readDataOfClasses:v8 error:&v17];
  id v10 = v17;
  id v11 = v10;
  if (!v9 || v10) {
    goto LABEL_7;
  }
  uint64_t v12 = objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28588];
    uint64_t v14 = [NSString stringWithFormat:@"Expected class %@ got %@.", v12, objc_opt_class()];
    v19[0] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v11 = [v13 errorWithDomain:@"com.apple.icloud.FMCore.FMDataArchiver" code:2 userInfo:v15];

LABEL_7:
    if (!a4) {
      goto LABEL_11;
    }
    if (v11)
    {

      uint64_t v9 = 0;
    }
    goto LABEL_10;
  }
  id v11 = 0;
  if (a4)
  {
LABEL_10:
    id v11 = v11;
    *a4 = v11;
  }
LABEL_11:

  return v9;
}

- (id)readDataOfClasses:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(FMDataArchiver *)self underlyingDataWithError:a4];
  if (*a4)
  {
    uint64_t v8 = 0;
  }
  else
  {
    id v13 = 0;
    uint64_t v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v6 fromData:v7 error:&v13];
    id v9 = v13;
    id v10 = v9;
    if (v9)
    {
      *a4 = v9;
      id v11 = LogCategory_Unspecified();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[FMDataArchiver readDataOfClasses:error:]();
      }
    }
  }

  return v8;
}

- (id)underlyingDataWithError:(id *)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(FMDataArchiver *)self unitTestData];
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v7 = [(FMDataArchiver *)self fileURL];
    uint64_t v8 = [v7 path];
    char v9 = [v6 fileExistsAtPath:v8];

    if (v9)
    {
      id v10 = (void *)MEMORY[0x1E4F1C9B8];
      id v11 = [(FMDataArchiver *)self fileURL];
      id v19 = 0;
      id v12 = [v10 dataWithContentsOfURL:v11 options:0 error:&v19];
      id v13 = v19;

      if (!v13)
      {
        id v12 = v12;
        uint64_t v5 = v12;
        goto LABEL_10;
      }
      if (a3)
      {
        id v13 = v13;
        uint64_t v5 = 0;
        *a3 = v13;
LABEL_10:

        goto LABEL_11;
      }
LABEL_8:
      uint64_t v5 = 0;
      goto LABEL_10;
    }
    if (a3)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28588];
      v15 = NSString;
      id v13 = [(FMDataArchiver *)self fileURL];
      id v12 = [v15 stringWithFormat:@"Could not find the file %@.", v13];
      v21[0] = v12;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      *a3 = [v14 errorWithDomain:@"com.apple.icloud.FMCore.FMDataArchiver" code:4 userInfo:v16];

      goto LABEL_8;
    }
    uint64_t v5 = 0;
  }
LABEL_11:
  id v17 = v5;

  return v17;
}

- (BOOL)saveArray:(id)a3 error:(id *)a4
{
  uint64_t v5 = [(FMDataArchiver *)self saveObject:a3];
  id v6 = v5;
  if (a4) {
    *a4 = v5;
  }

  return v6 == 0;
}

- (BOOL)saveDictionary:(id)a3 error:(id *)a4
{
  uint64_t v5 = [(FMDataArchiver *)self saveObject:a3];
  id v6 = v5;
  if (a4) {
    *a4 = v5;
  }

  return v6 == 0;
}

- (id)saveObject:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v5 = LogCategory_Unspecified();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2FB9000, v5, OS_LOG_TYPE_DEFAULT, "FMDataArchiver : calling saveObject from the main thread is bad for performance.", buf, 2u);
    }
  }
  id v35 = 0;
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v35];
  id v7 = v35;
  if (!v7)
  {
    if (!v6)
    {
      id v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v40 = *MEMORY[0x1E4F28588];
      v41[0] = @"Could not convert object.";
      char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
      id v8 = [v19 errorWithDomain:@"com.apple.icloud.FMCore.FMDataArchiver" code:2 userInfo:v9];
      goto LABEL_38;
    }
    id v10 = [(FMDataArchiver *)self fileURL];
    id v11 = LogCategory_Unspecified();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[FMDataArchiver saveObject:].cold.5();
    }

    id v12 = [v10 URLByDeletingLastPathComponent];
    id v13 = [v12 path];
    uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v15 = [v14 fileExistsAtPath:v13];

    if (v15) {
      goto LABEL_12;
    }
    if ([(FMDataArchiver *)self createDirectories])
    {
      uint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v34 = 0;
      [v20 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v34];
      id v8 = v34;

      if (!v8)
      {
LABEL_12:
        id v33 = 0;
        objc_msgSend(v6, "writeToURL:options:error:", v10, -[FMDataArchiver dataWritingOptionForDataProtectionClass:](self, "dataWritingOptionForDataProtectionClass:", -[FMDataArchiver dataProtectionClass](self, "dataProtectionClass")) | 1, &v33);
        v16 = v33;
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = LogCategory_Unspecified();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[FMDataArchiver saveObject:]();
          }
        }
        else
        {
          id v32 = 0;
          objc_msgSend(MEMORY[0x1E4F28CB8], "fm_setDataProtectionClass:forFileURL:error:", -[FMDataArchiver dataProtectionClass](self, "dataProtectionClass"), v10, &v32);
          uint64_t v18 = v32;
          if (v18)
          {
            v25 = LogCategory_Unspecified();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              -[FMDataArchiver saveObject:]();
            }

            uint64_t v18 = v18;
            id v17 = v18;
          }
          else if ([(FMDataArchiver *)self backedUp])
          {
            id v17 = 0;
          }
          else
          {
            v26 = [NSNumber numberWithBool:1];
            uint64_t v27 = *MEMORY[0x1E4F1C630];
            id v31 = 0;
            [v10 setResourceValue:v26 forKey:v27 error:&v31];
            id v17 = v31;

            if (v17)
            {
              v28 = LogCategory_Unspecified();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                [(FMDataArchiver *)v10 saveObject:v28];
              }

              v29 = v17;
            }
          }
        }

        char v9 = v17;
        id v8 = v9;
        goto LABEL_37;
      }
      v21 = LogCategory_Unspecified();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[FMDataArchiver saveObject:].cold.4();
      }
    }
    else
    {
      v22 = LogCategory_Unspecified();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v13;
        _os_log_impl(&dword_1B2FB9000, v22, OS_LOG_TYPE_DEFAULT, "FMDataArchiver Error : no directory %@", buf, 0xCu);
      }

      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F28588];
      v37 = @"Could not find specified directory";
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      id v8 = [v23 errorWithDomain:@"com.apple.icloud.FMCore.FMDataArchiver" code:0 userInfo:v24];
    }
    char v9 = 0;
LABEL_37:

    goto LABEL_38;
  }
  id v8 = v7;
  char v9 = LogCategory_Unspecified();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[FMDataArchiver saveObject:].cold.6();
  }
LABEL_38:

  return v8;
}

- (unint64_t)dataWritingOptionForDataProtectionClass:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0x10000000;
  }
  else {
    return ((a3 - 1) << 28) + 0x20000000;
  }
}

- (int64_t)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void)setDataProtectionClass:(int64_t)a3
{
  self->_dataProtectionClass = a3;
}

- (BOOL)backedUp
{
  return self->_backedUp;
}

- (void)setBackedUp:(BOOL)a3
{
  self->_backedUp = a3;
}

- (BOOL)createDirectories
{
  return self->_createDirectories;
}

- (void)setCreateDirectories:(BOOL)a3
{
  self->_createDirectories = a3;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSData)unitTestData
{
  return self->_unitTestData;
}

- (void)setUnitTestData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTestData, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)initWithFileURL:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B2FB9000, log, OS_LOG_TYPE_ERROR, "FMDataArchiver must be initialized with a file url", v1, 2u);
}

- (void)readDataOfClasses:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FB9000, v0, v1, "FMDataArchiver: Error unarchiving object %@", v2, v3, v4, v5, v6);
}

- (void)saveObject:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 lastPathComponent];
  OUTLINED_FUNCTION_1();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1B2FB9000, a3, OS_LOG_TYPE_ERROR, "FMDataArchiver Error excluding %@ from backup %@", v6, 0x16u);
}

- (void)saveObject:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FB9000, v0, v1, "FMDataArchiver Error : could set data protection %@", v2, v3, v4, v5, v6);
}

- (void)saveObject:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FB9000, v0, v1, "FMDataArchiver Error : could not write to file %@", v2, v3, v4, v5, v6);
}

- (void)saveObject:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FB9000, v0, v1, "FMDataArchiver Error creating the directory %@", v2, v3, v4, v5, v6);
}

- (void)saveObject:.cold.5()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1B2FB9000, v0, OS_LOG_TYPE_DEBUG, "FMDataArchiver saveData to file %@", v1, 0xCu);
}

- (void)saveObject:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FB9000, v0, v1, "FMDataArchiver Error creating archive: %@", v2, v3, v4, v5, v6);
}

@end