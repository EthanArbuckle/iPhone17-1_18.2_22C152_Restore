@interface PKTextInputDebugSharpenerLog
+ (BOOL)canLoadFromFileAtURL:(id)a3;
+ (id)_environmentMetadataDictionary;
+ (id)_recommendedFileNameForLogWithDate:(id)a3;
- (BOOL)_loadFromFileURL:(id)a3 error:(id *)a4;
- (BOOL)hasContent;
- (BOOL)writeToURL:(id)a3 withContentLevel:(int64_t)a4 excludeEntyIndexes:(id)a5 error:(id *)a6;
- (NSArray)logEntries;
- (NSDictionary)metadataDictionary;
- (PKTextInputDebugSharpenerLog)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (PKTextInputDebugSharpenerLog)initWithLogEntries:(id)a3;
- (id)_dictionaryRepresentationWithContentLevel:(int64_t)a3 excludeEntyIndexes:(id)a4;
- (id)description;
- (id)writeLogToTemporaryDirectoryWithContentLevel:(int64_t)a3 excludeEntyIndexes:(id)a4 error:(id *)a5;
@end

@implementation PKTextInputDebugSharpenerLog

- (PKTextInputDebugSharpenerLog)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKTextInputDebugSharpenerLog;
  v7 = [(PKTextInputDebugSharpenerLog *)&v10 init];
  v8 = v7;
  if (v7 && ![(PKTextInputDebugSharpenerLog *)v7 _loadFromFileURL:v6 error:a4])
  {

    v8 = 0;
  }

  return v8;
}

- (PKTextInputDebugSharpenerLog)initWithLogEntries:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTextInputDebugSharpenerLog;
  v5 = [(PKTextInputDebugSharpenerLog *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    logEntries = v5->_logEntries;
    v5->_logEntries = (NSArray *)v6;

    uint64_t v8 = [(id)objc_opt_class() _environmentMetadataDictionary];
    metadataDictionary = v5->_metadataDictionary;
    v5->_metadataDictionary = (NSDictionary *)v8;
  }
  return v5;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PKTextInputDebugSharpenerLog;
  v3 = [(PKTextInputDebugSharpenerLog *)&v8 description];
  id v4 = [(PKTextInputDebugSharpenerLog *)self metadataDictionary];
  v5 = [(PKTextInputDebugSharpenerLog *)self logEntries];
  uint64_t v6 = [v3 stringByAppendingFormat:@" metadata: %@, entries: %@", v4, v5];

  return v6;
}

- (BOOL)hasContent
{
  v2 = [(PKTextInputDebugSharpenerLog *)self logEntries];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)_dictionaryRepresentationWithContentLevel:(int64_t)a3 excludeEntyIndexes:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F1CA48];
  objc_super v8 = [(PKTextInputDebugSharpenerLog *)self logEntries];
  v9 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  objc_super v10 = [(PKTextInputDebugSharpenerLog *)self logEntries];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v6 containsIndex:v13 + i] & 1) == 0)
        {
          v17 = [v16 dictionaryRepresentationWithTargetContentLevel:a3];
          [v9 addObject:v17];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
      v13 += i;
    }
    while (v12);
  }

  v25[0] = @"metadata";
  v18 = [(PKTextInputDebugSharpenerLog *)self metadataDictionary];
  v25[1] = @"entries";
  v26[0] = v18;
  v26[1] = v9;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

  return v19;
}

+ (id)_environmentMetadataDictionary
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  id v4 = (void *)v3;
  v5 = &stru_1F1FB2C00;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  id v6 = v5;

  v7 = (void *)MGCopyAnswer();
  objc_super v8 = (void *)_CFCopySystemVersionDictionaryValue();
  v11[0] = @"formatVersion";
  v11[1] = @"build";
  v12[0] = @"2.0";
  v12[1] = v8;
  v11[2] = @"device";
  v11[3] = @"appIdentifier";
  v12[2] = v7;
  v12[3] = v6;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

+ (BOOL)canLoadFromFileAtURL:(id)a3
{
  uint64_t v3 = [a3 pathExtension];
  BOOL v4 = [v3 caseInsensitiveCompare:@"plist"] == 0;

  return v4;
}

- (id)writeLogToTemporaryDirectoryWithContentLevel:(int64_t)a3 excludeEntyIndexes:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [(PKTextInputDebugSharpenerLog *)self logEntries];
  objc_super v10 = [v9 lastObject];
  uint64_t v11 = [v10 entryDate];

  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
  }
  uint64_t v12 = +[PKTextInputDebugSharpenerLog _recommendedFileNameForLogWithDate:v11];
  uint64_t v13 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v14 = NSTemporaryDirectory();
  v15 = [v14 stringByAppendingPathComponent:v12];
  v16 = [v13 fileURLWithPath:v15 isDirectory:0];

  BOOL v17 = [(PKTextInputDebugSharpenerLog *)self writeToURL:v16 withContentLevel:a3 excludeEntyIndexes:v8 error:a5];
  if (!v17)
  {

    v16 = 0;
  }

  return v16;
}

- (BOOL)writeToURL:(id)a3 withContentLevel:(int64_t)a4 excludeEntyIndexes:(id)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = [(PKTextInputDebugSharpenerLog *)self _dictionaryRepresentationWithContentLevel:a4 excludeEntyIndexes:a5];
  id v21 = 0;
  uint64_t v12 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v11 format:100 options:0 error:&v21];
  id v13 = v21;
  uint64_t v14 = v13;
  if (v12)
  {
    id v20 = v13;
    char v15 = [v12 writeToURL:v10 options:0 error:&v20];
    id v16 = v20;

    if (v15)
    {
      BOOL v17 = 1;
      if (!a6) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else
  {
    id v16 = v13;
  }
  v18 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v16;
    _os_log_error_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_ERROR, "Couldn't write PencilSharpener log to %@; Error: %@",
      buf,
      0x16u);
  }

  BOOL v17 = 0;
  if (a6) {
LABEL_9:
  }
    *a6 = v16;
LABEL_10:

  return v17;
}

- (BOOL)_loadFromFileURL:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v43 = 0;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v6 error:&v43];
  id v8 = v43;
  if (!v7)
  {
    uint64_t v12 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v45 = v6;
      __int16 v46 = 2112;
      id v47 = v8;
      _os_log_error_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_ERROR, "Error reading PencilSharpener log from %@; error: %@",
        buf,
        0x16u);
    }

    BOOL v11 = 0;
    if (a4) {
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  v9 = [v7 objectForKeyedSubscript:@"metadata"];
  metadataDictionary = self->_metadataDictionary;
  self->_metadataDictionary = v9;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v11 = 1;
  }
  else
  {
    id v13 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v45 = v29;
      id v30 = v29;
      _os_log_error_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_ERROR, "Error loading metadata dictionary with object of class: %@", buf, 0xCu);
    }
    uint64_t v14 = self->_metadataDictionary;
    self->_metadataDictionary = (NSDictionary *)MEMORY[0x1E4F1CC08];

    BOOL v11 = 0;
  }
  char v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  id v16 = [v7 objectForKeyedSubscript:@"entries"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_30;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v16;
  uint64_t v17 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (!v17) {
    goto LABEL_29;
  }
  uint64_t v18 = v17;
  v35 = v16;
  v36 = v7;
  v33 = a4;
  id v34 = v6;
  uint64_t v19 = *(void *)v40;
  while (2)
  {
    uint64_t v20 = 0;
    id v21 = v8;
    do
    {
      if (*(void *)v40 != v19) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void *)(*((void *)&v39 + 1) + 8 * v20);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v25 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v31 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          id v45 = v31;
          id v32 = v31;
          _os_log_error_impl(&dword_1C44F8000, v25, OS_LOG_TYPE_ERROR, "Error loading log entry with object of class: %@", buf, 0xCu);
        }
        goto LABEL_28;
      }
      id v23 = [PKTextInputDebugArchivedLogEntry alloc];
      id v38 = v21;
      __int16 v24 = [(PKTextInputDebugArchivedLogEntry *)v23 initWithDictionary:v22 error:&v38];
      id v8 = v38;

      if (!v24)
      {
        id v25 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v45 = v8;
          _os_log_error_impl(&dword_1C44F8000, v25, OS_LOG_TYPE_ERROR, "Error loading log entry: %@", buf, 0xCu);
        }
        id v21 = v8;
LABEL_28:
        a4 = v33;
        id v6 = v34;

        BOOL v11 = 0;
        id v8 = v21;
        id v16 = v35;
        v7 = v36;
        goto LABEL_29;
      }
      [v15 addObject:v24];

      ++v20;
      id v21 = v8;
    }
    while (v18 != v20);
    uint64_t v18 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v18) {
      continue;
    }
    break;
  }
  a4 = v33;
  id v6 = v34;
  id v16 = v35;
  v7 = v36;
LABEL_29:

LABEL_30:
  uint64_t v26 = (NSArray *)[v15 copy];
  logEntries = self->_logEntries;
  self->_logEntries = v26;

  if (a4) {
LABEL_31:
  }
    *a4 = v8;
LABEL_32:

  return v11;
}

+ (id)_recommendedFileNameForLogWithDate:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F28C10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v5 setLocale:v6];

  [v5 setDateFormat:@"yyyy-MM-dd-HHmmss"];
  v7 = NSString;
  id v8 = [v5 stringFromDate:v4];

  v9 = [v7 stringWithFormat:@"PencilSharpener-%@", v8];
  id v10 = [v9 stringByAppendingPathExtension:@"plist"];

  return v10;
}

- (NSArray)logEntries
{
  return self->_logEntries;
}

- (NSDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataDictionary, 0);

  objc_storeStrong((id *)&self->_logEntries, 0);
}

@end