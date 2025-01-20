@interface ATXBMBookmark
+ (BOOL)_fileExistsAtPath:(id)a3;
+ (BOOL)_fileSizeWithinLimitsForPath:(id)a3 maxFileSize:(unint64_t)a4;
+ (BOOL)supportsSecureCoding;
+ (id)_dataFromPath:(id)a3;
+ (id)bookmarkFromData:(id)a3 bookmarkLocation:(id)a4 versionNumber:(id)a5;
+ (id)bookmarkFromURLPath:(id)a3 maxFileSize:(unint64_t)a4 versionNumber:(id)a5;
- (ATXBMBookmark)initWithCoder:(id)a3;
- (ATXBMBookmark)initWithURLPath:(id)a3 versionNumber:(id)a4 bookmark:(id)a5 metadata:(id)a6;
- (BMBookmark)bookmark;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXBMBookmark:(id)a3;
- (BOOL)saveBookmarkWithError:(id *)a3;
- (NSDictionary)metadata;
- (NSNumber)versionNumber;
- (NSURL)urlPath;
- (id)allowedClassesForBookmarkSecureCoding;
- (id)serializeBookmark:(id *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBookmark:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation ATXBMBookmark

+ (id)bookmarkFromData:(id)a3 bookmarkLocation:(id)a4 versionNumber:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1D25F3B80]();
  id v25 = 0;
  v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v25];
  id v13 = v25;
  if (v13 || !v12)
  {
    v17 = __atxlog_handle_default();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (!v9)
    {
      if (v18) {
        +[ATXBMBookmark bookmarkFromData:bookmarkLocation:versionNumber:]();
      }
      goto LABEL_17;
    }
    if (v18)
    {
      v19 = NSStringFromClass((Class)a1);
      *(_DWORD *)buf = 138412802;
      v27 = v19;
      __int16 v28 = 2112;
      id v29 = v9;
      __int16 v30 = 2112;
      id v31 = v13;
      _os_log_error_impl(&dword_1D0F2B000, v17, OS_LOG_TYPE_ERROR, "%@ - failed to unarchive bookmark at %@ with error: %@", buf, 0x20u);
LABEL_16:
    }
  }
  else
  {
    v14 = [v12 versionNumber];
    char v15 = [v14 isEqualToNumber:v10];

    if (v15)
    {
      id v16 = v12;
      goto LABEL_18;
    }
    v17 = __atxlog_handle_default();
    BOOL v20 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v20)
      {
        v19 = NSStringFromClass((Class)a1);
        *(_DWORD *)buf = 138412546;
        v27 = v19;
        __int16 v28 = 2112;
        id v29 = v9;
        v21 = "%@ - version number changed for bookmark at %@";
        v22 = v17;
        uint32_t v23 = 22;
LABEL_15:
        _os_log_impl(&dword_1D0F2B000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
        goto LABEL_16;
      }
    }
    else if (v20)
    {
      v19 = NSStringFromClass((Class)a1);
      *(_DWORD *)buf = 138412290;
      v27 = v19;
      v21 = "%@ - version number changed for bookmark";
      v22 = v17;
      uint32_t v23 = 12;
      goto LABEL_15;
    }
  }
LABEL_17:

  id v16 = 0;
LABEL_18:

  return v16;
}

+ (id)bookmarkFromURLPath:(id)a3 maxFileSize:(unint64_t)a4 versionNumber:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 path];
  if ([a1 _fileExistsAtPath:v10])
  {
    if ([a1 _fileSizeWithinLimitsForPath:v10 maxFileSize:a4])
    {
      v11 = (void *)MEMORY[0x1D25F3B80]();
      v12 = [a1 _dataFromPath:v10];
      if (v12)
      {
        id v13 = [a1 bookmarkFromData:v12 bookmarkLocation:v10 versionNumber:v9];
        goto LABEL_13;
      }
      v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[ATXBMBookmark bookmarkFromURLPath:maxFileSize:versionNumber:]();
      }
    }
    else
    {
      v12 = __atxlog_handle_default();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        +[ATXBMBookmark bookmarkFromURLPath:maxFileSize:versionNumber:]();
      }
    }
  }
  else
  {
    v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[ATXBMBookmark bookmarkFromURLPath:maxFileSize:versionNumber:]();
    }
  }
  id v13 = 0;
LABEL_13:

  return v13;
}

- (ATXBMBookmark)initWithURLPath:(id)a3 versionNumber:(id)a4 bookmark:(id)a5 metadata:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ATXBMBookmark;
  v14 = [(ATXBMBookmark *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    urlPath = v14->_urlPath;
    v14->_urlPath = (NSURL *)v15;

    objc_storeStrong((id *)&v14->_versionNumber, a4);
    objc_storeStrong((id *)&v14->_bookmark, a5);
    uint64_t v17 = [v13 copy];
    metadata = v14->_metadata;
    v14->_metadata = (NSDictionary *)v17;
  }
  return v14;
}

- (id)serializeBookmark:(id *)a3
{
  v5 = (void *)MEMORY[0x1D25F3B80](self, a2);
  id v12 = 0;
  v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:0 error:&v12];
  id v7 = v12;
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    id v10 = v6;
  }
  else
  {
    id v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[ATXBMBookmark serializeBookmark:]();
    }

    id v10 = 0;
    if (a3) {
      *a3 = v7;
    }
  }

  return v10;
}

- (BOOL)saveBookmarkWithError:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  urlPath = self->_urlPath;
  if (urlPath)
  {
    v6 = [(NSURL *)urlPath URLByDeletingLastPathComponent];
    id v7 = self->_urlPath;
    BOOL v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412546;
      id v29 = v10;
      __int16 v30 = 2112;
      id v31 = (NSURL *)v6;
      _os_log_impl(&dword_1D0F2B000, v8, OS_LOG_TYPE_DEFAULT, "%@ - attempting to save bookmark with directoryURL: %@", buf, 0x16u);
    }
    id v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138412546;
      id v29 = v13;
      __int16 v30 = 2112;
      id v31 = v7;
      _os_log_impl(&dword_1D0F2B000, v11, OS_LOG_TYPE_DEFAULT, "%@ - attempting to save bookmark with fileURL: %@", buf, 0x16u);
    }
    v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v27 = 0;
    int v15 = [v14 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v27];
    id v16 = v27;

    if (!v15 || v16)
    {
      v22 = __atxlog_handle_default();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v24 = (objc_class *)objc_opt_class();
        id v25 = NSStringFromClass(v24);
        *(_DWORD *)buf = 138412802;
        id v29 = v25;
        __int16 v30 = 2112;
        id v31 = (NSURL *)v6;
        __int16 v32 = 2112;
        id v33 = v16;
        _os_log_error_impl(&dword_1D0F2B000, v22, OS_LOG_TYPE_ERROR, "%@ - could not create directory at path: %@ with err: %@", buf, 0x20u);
      }
      char v19 = 0;
      if (a3) {
        *a3 = v16;
      }
    }
    else
    {
      uint64_t v17 = [(ATXBMBookmark *)self serializeBookmark:a3];
      BOOL v18 = v17;
      if (v17)
      {
        id v26 = 0;
        char v19 = [v17 writeToURL:v7 options:1073741825 error:&v26];
        id v20 = v26;
        if ((v19 & 1) == 0)
        {
          v21 = __atxlog_handle_default();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[ATXBMBookmark saveBookmarkWithError:]();
          }

          if (a3) {
            *a3 = v20;
          }
        }
      }
      else
      {
        char v19 = 0;
      }
    }
  }
  else
  {
    v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[ATXBMBookmark saveBookmarkWithError:]((uint64_t)self, v6);
    }
    char v19 = 0;
  }

  return v19;
}

+ (BOOL)_fileExistsAtPath:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  v5 = [v3 defaultManager];
  char v6 = [v5 fileExistsAtPath:v4];

  return v6;
}

+ (BOOL)_fileSizeWithinLimitsForPath:(id)a3 maxFileSize:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v17 = 0;
  BOOL v8 = [v7 attributesOfItemAtPath:v6 error:&v17];
  id v9 = v17;

  if (!v8)
  {
    id v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[ATXBMBookmark _fileSizeWithinLimitsForPath:maxFileSize:]();
    }
    goto LABEL_7;
  }
  if (v9)
  {
    id v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = NSStringFromClass((Class)a1);
      *(_DWORD *)buf = 138412802;
      char v19 = v11;
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      unint64_t v23 = (unint64_t)v9;
      _os_log_error_impl(&dword_1D0F2B000, v10, OS_LOG_TYPE_ERROR, "%@ - file manager error for path %@, err: %@", buf, 0x20u);
    }
LABEL_7:

    BOOL v12 = 0;
    goto LABEL_11;
  }
  unint64_t v13 = [v8 fileSize];
  v14 = __atxlog_handle_default();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = NSStringFromClass((Class)a1);
    *(_DWORD *)buf = 138412802;
    char v19 = v15;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2048;
    unint64_t v23 = v13;
    _os_log_impl(&dword_1D0F2B000, v14, OS_LOG_TYPE_DEFAULT, "%@ - file size on disk for path %@ is %llu", buf, 0x20u);
  }
  BOOL v12 = v13 <= a4;
LABEL_11:

  return v12;
}

+ (id)_dataFromPath:(id)a3
{
  v3 = [MEMORY[0x1E4F28CB0] fileHandleForReadingAtPath:a3];
  id v4 = v3;
  if (v3)
  {
    id v12 = 0;
    v5 = [v3 readDataToEndOfFileAndReturnError:&v12];
    id v6 = v12;
    id v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v10 = v5;
    }
    else
    {
      id v9 = __atxlog_handle_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[ATXBMBookmark _dataFromPath:v9];
      }

      id v10 = 0;
    }
  }
  else
  {
    id v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F2B000, v7, OS_LOG_TYPE_DEFAULT, "Unable to acquire readonly handle to cache file.", buf, 2u);
    }
    id v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXBMBookmark *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXBMBookmark *)self isEqualToATXBMBookmark:v5];

  return v6;
}

- (BOOL)isEqualToATXBMBookmark:(id)a3
{
  id v4 = (id *)a3;
  urlPath = self->_urlPath;
  BOOL v6 = (NSURL *)v4[1];
  if (urlPath == v6)
  {
  }
  else
  {
    id v7 = v6;
    BOOL v8 = urlPath;
    char v9 = [(NSURL *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_7;
    }
  }
  versionNumber = self->_versionNumber;
  id v11 = (NSNumber *)v4[2];
  if (versionNumber == v11)
  {
  }
  else
  {
    id v12 = v11;
    unint64_t v13 = versionNumber;
    char v14 = [(NSNumber *)v13 isEqual:v12];

    if ((v14 & 1) == 0)
    {
LABEL_7:
      char v15 = 0;
      goto LABEL_13;
    }
  }
  id v16 = self->_metadata;
  id v17 = v16;
  if (v16 == v4[4]) {
    char v15 = 1;
  }
  else {
    char v15 = -[NSDictionary isEqual:](v16, "isEqual:");
  }

LABEL_13:
  return v15;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_urlPath hash];
  uint64_t v4 = [(NSNumber *)self->_versionNumber hash] - v3 + 32 * v3;
  return [(NSDictionary *)self->_metadata hash] - v4 + 32 * v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)allowedClassesForBookmarkSecureCoding
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28B90], "bm_allowedClassesForSecureCodingBMBookmark");
  uint64_t v4 = (void *)[v2 initWithSet:v3];

  __54__ATXBMBookmark_allowedClassesForBookmarkSecureCoding__block_invoke(v5, v4, &cfstr_Atxfakebookmar.isa);
  __54__ATXBMBookmark_allowedClassesForBookmarkSecureCoding__block_invoke(v6, v4, &cfstr_Bmstorebookmar.isa);
  __54__ATXBMBookmark_allowedClassesForBookmarkSecureCoding__block_invoke(v7, v4, &cfstr_Atxblendingbio.isa);
  __54__ATXBMBookmark_allowedClassesForBookmarkSecureCoding__block_invoke(v8, v4, &cfstr_Atxuifeedbackp.isa);
  __54__ATXBMBookmark_allowedClassesForBookmarkSecureCoding__block_invoke(v9, v4, &cfstr_Atxsecurecoded.isa);
  __54__ATXBMBookmark_allowedClassesForBookmarkSecureCoding__block_invoke(v10, v4, &cfstr_Atxproactivesu_0.isa);
  __54__ATXBMBookmark_allowedClassesForBookmarkSecureCoding__block_invoke(v11, v4, &cfstr_Atxproactivesu.isa);
  id v12 = (void *)MEMORY[0x1E4F28B90];
  unint64_t v13 = [v4 allObjects];
  objc_msgSend(v12, "bm_allowClassesForSecureCodingBMBookmark:", v13);

  char v14 = (void *)[v4 copy];
  return v14;
}

void __54__ATXBMBookmark_allowedClassesForBookmarkSecureCoding__block_invoke(uint64_t a1, void *a2, NSString *a3)
{
  id v5 = a2;
  Class v4 = NSClassFromString(a3);
  if (v4) {
    [v5 addObject:v4];
  }
}

- (void)encodeWithCoder:(id)a3
{
  urlPath = self->_urlPath;
  id v5 = a3;
  [v5 encodeObject:urlPath forKey:@"urlPath"];
  [v5 encodeObject:self->_versionNumber forKey:@"versionNumber"];
  [v5 encodeObject:self->_bookmark forKey:@"bookmark"];
  [v5 encodeObject:self->_metadata forKey:@"metadata"];
}

- (ATXBMBookmark)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = __atxlog_handle_default();
  uint64_t v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"urlPath" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXBMBookmark" errorCode:-1 logHandle:v7];

  uint64_t v9 = [v4 error];

  if (v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    unint64_t v13 = __atxlog_handle_default();
    char v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"versionNumber" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXBMBookmark" errorCode:-1 logHandle:v13];

    char v15 = [v4 error];

    uint64_t v10 = 0;
    if (!v15 && v14)
    {
      id v16 = (void *)MEMORY[0x1E4F93B90];
      id v17 = [(ATXBMBookmark *)self allowedClassesForBookmarkSecureCoding];
      BOOL v18 = __atxlog_handle_default();
      char v19 = [v16 robustDecodeObjectOfClasses:v17 forKey:@"bookmark" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXBMBookmark" errorCode:-1 logHandle:v18];

      __int16 v20 = [v4 error];

      if (v20)
      {
        id v21 = __atxlog_handle_default();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[ATXBMBookmark initWithCoder:]();
        }

        uint64_t v10 = 0;
      }
      else
      {
        v35 = v19;
        context = (void *)MEMORY[0x1D25F3B80]();
        id v33 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        uint64_t v22 = objc_opt_class();
        uint64_t v23 = objc_opt_class();
        uint64_t v24 = objc_opt_class();
        uint64_t v25 = objc_opt_class();
        uint64_t v26 = objc_opt_class();
        id v27 = objc_msgSend(v33, "initWithObjects:", v22, v23, v24, v25, v26, objc_opt_class(), 0);
        __int16 v28 = (void *)MEMORY[0x1E4F93B90];
        id v29 = __atxlog_handle_default();
        __int16 v30 = [v28 robustDecodeObjectOfClasses:v27 forKey:@"metadata" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXBMBookmark" errorCode:-1 logHandle:v29];

        id v31 = [v4 error];

        if (v31)
        {
          uint64_t v10 = 0;
          char v19 = v35;
        }
        else
        {
          char v19 = v35;
          self = [(ATXBMBookmark *)self initWithURLPath:v8 versionNumber:v14 bookmark:v35 metadata:v30];
          uint64_t v10 = self;
        }
      }
    }
  }
  return v10;
}

- (NSURL)urlPath
{
  return self->_urlPath;
}

- (NSNumber)versionNumber
{
  return self->_versionNumber;
}

- (BMBookmark)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_urlPath, 0);
}

+ (void)bookmarkFromData:bookmarkLocation:versionNumber:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1D0F2B000, v2, v3, "%@ - failed to unarchive bookmark with error: %@", v4, v5, v6, v7, v8);
}

+ (void)bookmarkFromURLPath:maxFileSize:versionNumber:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1D0F2B000, v2, v3, "%@ - could not read serialized data for bookmark at path %@", v4, v5, v6, v7, v8);
}

+ (void)bookmarkFromURLPath:maxFileSize:versionNumber:.cold.2()
{
  OUTLINED_FUNCTION_2_3();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2(&dword_1D0F2B000, v2, v3, "%@ - bookmark larger than maxFileSize at path %@", v4, v5, v6, v7, v8);
}

+ (void)bookmarkFromURLPath:maxFileSize:versionNumber:.cold.3()
{
  OUTLINED_FUNCTION_2_3();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1D0F2B000, v2, v3, "%@ - bookmark file doesn't exist at path %@", v4, v5, v6, v7, v8);
}

- (void)serializeBookmark:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  Class v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2(&dword_1D0F2B000, v2, v3, "%@ - could not archive self with error: %@", v4, v5, v6, v7, v8);
}

- (void)saveBookmarkWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_fault_impl(&dword_1D0F2B000, a2, OS_LOG_TYPE_FAULT, "%@ – Attempting to save a bookmark without a path is forbidden.", (uint8_t *)&v5, 0xCu);
}

- (void)saveBookmarkWithError:.cold.2()
{
  OUTLINED_FUNCTION_2_3();
  Class v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1D0F2B000, v2, v3, "%@ - could not write bookmark file with error: %@", v4, v5, v6, v7, v8);
}

+ (void)_fileSizeWithinLimitsForPath:maxFileSize:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1D0F2B000, v2, v3, "%@ - failed to retrieve attributes for path %@", v4, v5, v6, v7, v8);
}

+ (void)_dataFromPath:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0F2B000, log, OS_LOG_TYPE_ERROR, "Unable to read data from file handle %@ - %@", (uint8_t *)&v3, 0x16u);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  v1 = (objc_class *)objc_opt_class();
  uint64_t v2 = NSStringFromClass(v1);
  uint64_t v9 = [v0 error];
  OUTLINED_FUNCTION_1_2(&dword_1D0F2B000, v3, v4, "%@ - failed to decode id<BMBookmark> with error: %@", v5, v6, v7, v8, 2u);
}

@end