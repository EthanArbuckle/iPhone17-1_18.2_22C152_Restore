@interface NSDictionary(JsonUtils)
- (id)initWithJSON:()JsonUtils;
- (void)toJsonInDocumentDirectoryWith:()JsonUtils;
@end

@implementation NSDictionary(JsonUtils)

- (void)toJsonInDocumentDirectoryWith:()JsonUtils
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [v5 URLsForDirectory:9 inDomains:1];

  if (![v6 count])
  {
    v18 = QRLoggerForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[NSDictionary(JsonUtils) toJsonInDocumentDirectoryWith:]";
      _os_log_error_impl(&dword_1C9555000, v18, OS_LOG_TYPE_ERROR, "%s [ERR]: Cannot get an URL for Document directory", buf, 0xCu);
    }

    exception = __cxa_allocate_exception(0x30uLL);
    std::string::basic_string[abi:ne180100]<0>(buf, "Error creating directory");
    std::string::basic_string[abi:ne180100]<0>(v22, "QueryRewrite");
    ConfigLoadingError::ConfigLoadingError(exception, (uint64_t)buf, (uint64_t)v22, "/Library/Caches/com.apple.xbs/Sources/Marrs/Common/NSDictionary+JsonUtils.mm", 35);
  }
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [v6 objectAtIndexedSubscript:0];
  v9 = [v8 path];
  id v21 = 0;
  [v7 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v21];
  id v10 = v21;

  if (v10)
  {
    v15 = QRLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [v10 debugDescription];
      *(_DWORD *)buf = 136315394;
      v24 = "-[NSDictionary(JsonUtils) toJsonInDocumentDirectoryWith:]";
      __int16 v25 = 2112;
      v26 = v16;
      _os_log_error_impl(&dword_1C9555000, v15, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }
    v17 = __cxa_allocate_exception(0x30uLL);
    std::string::basic_string[abi:ne180100]<0>(buf, "Error creating directory");
    std::string::basic_string[abi:ne180100]<0>(v22, "QueryRewrite");
    ConfigLoadingError::ConfigLoadingError(v17, (uint64_t)buf, (uint64_t)v22, "/Library/Caches/com.apple.xbs/Sources/Marrs/Common/NSDictionary+JsonUtils.mm", 44);
  }
  v11 = [v6 objectAtIndexedSubscript:0];
  v12 = [v11 URLByAppendingPathComponent:v4];

  v13 = [MEMORY[0x1E4F1CAA8] outputStreamWithURL:v12 append:0];
  [v13 open];
  id v20 = 0;
  [MEMORY[0x1E4F28D90] writeJSONObject:a1 toStream:v13 options:1 error:&v20];
  id v14 = v20;
  [v13 close];
}

- (id)initWithJSON:()JsonUtils
{
  v2 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfFile:");
  id v7 = 0;
  v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v2 options:0 error:&v7];
  id v4 = v7;
  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    a1 = (id)[a1 initWithDictionary:v3];
    id v5 = a1;
  }

  return v5;
}

@end