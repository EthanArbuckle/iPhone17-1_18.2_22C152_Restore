@interface DDSAssertionDataHandler
- (DDSAssertionDataHandler)initWithAssertionStorageFileURL:(id)a3;
- (NSURL)assertionStorageFileURL;
- (id)loadAssertionData;
- (void)loadAssertionData;
- (void)saveAssertionData:(id)a3;
@end

@implementation DDSAssertionDataHandler

- (DDSAssertionDataHandler)initWithAssertionStorageFileURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDSAssertionDataHandler;
  v5 = [(DDSAssertionDataHandler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    assertionStorageFileURL = v5->_assertionStorageFileURL;
    v5->_assertionStorageFileURL = (NSURL *)v6;
  }
  return v5;
}

- (id)loadAssertionData
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C9B8];
  v3 = [(DDSAssertionDataHandler *)self assertionStorageFileURL];
  id v15 = 0;
  id v4 = [v2 dataWithContentsOfURL:v3 options:0 error:&v15];
  id v5 = v15;

  if (v4)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    v8 = [v6 setWithArray:v7];

    id v14 = 0;
    objc_super v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v8 fromData:v4 error:&v14];
    v10 = v14;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      v12 = DefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[DDSAssertionDataHandler loadAssertionData]();
      }

      id v11 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v10 = DefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DDSAssertionDataHandler loadAssertionData]();
    }
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (void)saveAssertionData:(id)a3
{
  id v4 = a3;
  id v13 = 0;
  id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v13];
  id v6 = v13;
  if (v5)
  {
    v7 = [(DDSAssertionDataHandler *)self assertionStorageFileURL];
    id v12 = 0;
    char v8 = [v5 writeToURL:v7 options:1 error:&v12];
    objc_super v9 = v12;

    v10 = DefaultLog();
    id v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[DDSAssertionDataHandler saveAssertionData:](self, v11);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[DDSAssertionDataHandler saveAssertionData:]();
    }
  }
  else
  {
    objc_super v9 = DefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DDSAssertionDataHandler saveAssertionData:]();
    }
  }
}

- (NSURL)assertionStorageFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

- (void)loadAssertionData
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1E41D6000, v0, v1, "Failed to unarchive assertion content: (%{public}@)", v2, v3, v4, v5, v6);
}

- (void)saveAssertionData:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1E41D6000, v0, v1, "Failed to archive assertions : %{public}@", v2, v3, v4, v5, v6);
}

- (void)saveAssertionData:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 assertionStorageFileURL];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_DEBUG, "Saved assertion data to URL: (%{public}@)", v4, 0xCu);
}

- (void)saveAssertionData:.cold.3()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1E41D6000, v1, OS_LOG_TYPE_ERROR, "Error (%{public}@) writing content: %{public}@", v2, 0x16u);
}

@end