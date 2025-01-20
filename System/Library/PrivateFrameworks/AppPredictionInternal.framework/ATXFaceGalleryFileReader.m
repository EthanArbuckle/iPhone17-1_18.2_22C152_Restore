@interface ATXFaceGalleryFileReader
+ (id)_loadConfigurationFromPath:(id)a3;
+ (id)_pathForSource:(int64_t)a3;
- (ATXFaceGalleryConfiguration)configuration;
- (ATXFaceGalleryFileReader)initWithSource:(int64_t)a3;
- (BOOL)writeConfiguration:(id)a3 error:(id *)a4;
- (void)configuration;
@end

@implementation ATXFaceGalleryFileReader

- (ATXFaceGalleryFileReader)initWithSource:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXFaceGalleryFileReader;
  result = [(ATXFaceGalleryFileReader *)&v5 init];
  if (result) {
    result->_source = a3;
  }
  return result;
}

- (ATXFaceGalleryConfiguration)configuration
{
  v2 = +[ATXFaceGalleryFileReader _pathForSource:self->_source];
  v3 = +[ATXFaceGalleryFileReader _loadConfigurationFromPath:v2];
  if (!v3)
  {
    v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[ATXFaceGalleryFileReader configuration]();
    }
  }
  return (ATXFaceGalleryConfiguration *)v3;
}

- (BOOL)writeConfiguration:(id)a3 error:(id *)a4
{
  int64_t source = self->_source;
  id v6 = a3;
  v7 = +[ATXFaceGalleryFileReader _pathForSource:source];
  v8 = (void *)MEMORY[0x1E4F28D90];
  v9 = [v6 jsonDictionary];

  v10 = [v8 dataWithJSONObject:v9 options:1 error:a4];

  if (!v10)
  {
    v12 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXFaceGalleryFileReader writeConfiguration:error:]((uint64_t)a4, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_8;
  }
  if (([v10 writeToFile:v7 options:0 error:a4] & 1) == 0)
  {
    v12 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXFaceGalleryFileReader writeConfiguration:error:](v12);
    }
LABEL_8:

    BOOL v11 = 0;
    goto LABEL_9;
  }
  BOOL v11 = 1;
LABEL_9:

  return v11;
}

+ (id)_loadConfigurationFromPath:(id)a3
{
  id v3 = a3;
  id v12 = 0;
  v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3 options:0 error:&v12];
  id v5 = v12;
  if (v4)
  {
    id v11 = v5;
    id v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v11];
    id v7 = v11;

    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = [MEMORY[0x1E4F4B028] configurationFromJSONDictionary:v6];
        goto LABEL_13;
      }
      v9 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[ATXFaceGalleryFileReader _loadConfigurationFromPath:]();
      }
    }
    else
    {
      v9 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[ATXFaceGalleryFileReader _loadConfigurationFromPath:]();
      }
    }

    v8 = 0;
  }
  else
  {
    id v6 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[ATXFaceGalleryFileReader _loadConfigurationFromPath:]();
    }
    v8 = 0;
    id v7 = v5;
  }
LABEL_13:

  return v8;
}

+ (id)_pathForSource:(int64_t)a3
{
  if (a3)
  {
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F4B650], "faceGalleryDemoConfigurationFilePath", v3);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)configuration
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "%s: failed to parse configuration from path: %@", v2, v3, v4, v5, 2u);
}

- (void)writeConfiguration:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)writeConfiguration:(os_log_t)log error:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[ATXFaceGalleryFileReader writeConfiguration:error:]";
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "%s: could not write data to file", (uint8_t *)&v1, 0xCu);
}

+ (void)_loadConfigurationFromPath:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_4_8();
  OUTLINED_FUNCTION_2_10(&dword_1D0FA3000, v0, v1, "%s: could not load data from path: %@; error: %@", v2);
}

+ (void)_loadConfigurationFromPath:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_4_8();
  OUTLINED_FUNCTION_2_10(&dword_1D0FA3000, v0, v1, "%s: could not parse JSON from contents of path: %@; error: %@", v2);
}

+ (void)_loadConfigurationFromPath:.cold.3()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "%s: parsed JSON is not a dictionary at path: %@", v2, v3, v4, v5, 2u);
}

@end