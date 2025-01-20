@interface PHImportException
+ (id)logForAllExceptions:(id)a3;
- (NSDate)createDate;
- (NSError)underlyingError;
- (NSString)path;
- (NSString)sourceCodeFile;
- (PHImportException)initWithType:(int64_t)a3 path:(id)a4 underlyingError:(id)a5 file:(char *)a6 line:(unint64_t)a7;
- (id)description;
- (int64_t)type;
- (unint64_t)lineNumber;
@end

@implementation PHImportException

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_sourceCodeFile, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_createDate, 0);
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (unint64_t)lineNumber
{
  return self->_lineNumber;
}

- (NSString)sourceCodeFile
{
  return self->_sourceCodeFile;
}

- (NSString)path
{
  return self->_path;
}

- (int64_t)type
{
  return self->_type;
}

- (NSDate)createDate
{
  return self->_createDate;
}

- (id)description
{
  v3 = NSString;
  unint64_t type = self->_type;
  if (type > 8) {
    v5 = 0;
  }
  else {
    v5 = off_1E5848500[type];
  }
  underlyingError = self->_underlyingError;
  if (underlyingError)
  {
    v7 = [NSString stringWithFormat:@" (NSError: %@)", self->_underlyingError];
  }
  else
  {
    v7 = &stru_1EEAC1950;
  }
  path = self->_path;
  if (path)
  {
    v9 = [NSString stringWithFormat:@", path: %@", self->_path];
  }
  else
  {
    v9 = &stru_1EEAC1950;
  }
  if (self->_sourceCodeFile)
  {
    uint64_t v10 = [NSString stringWithFormat:@", source: %@", self->_sourceCodeFile];
    v11 = (void *)v10;
    if (self->_sourceCodeFile)
    {
      v12 = [NSString stringWithFormat:@", line: %lu", self->_lineNumber];
      v13 = [v3 stringWithFormat:@"%@:%@%@%@%@", v5, v7, v9, v11, v12];
    }
    else
    {
      v13 = [v3 stringWithFormat:@"%@:%@%@%@%@", v5, v7, v9, v10, &stru_1EEAC1950];
    }

    if (path) {
      goto LABEL_17;
    }
  }
  else
  {
    v13 = [v3 stringWithFormat:@"%@:%@%@%@%@", v5, v7, v9, &stru_1EEAC1950, &stru_1EEAC1950];
    if (path) {
LABEL_17:
    }
  }
  if (underlyingError) {

  }
  return v13;
}

- (PHImportException)initWithType:(int64_t)a3 path:(id)a4 underlyingError:(id)a5 file:(char *)a6 line:(unint64_t)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  v30.receiver = self;
  v30.super_class = (Class)PHImportException;
  v15 = [(PHImportException *)&v30 init];
  if (v15)
  {
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
    createDate = v15->_createDate;
    v15->_createDate = (NSDate *)v16;

    v15->_unint64_t type = a3;
    objc_storeStrong((id *)&v15->_path, a4);
    objc_storeStrong((id *)&v15->_underlyingError, a5);
    v18 = [NSString stringWithUTF8String:a6];
    uint64_t v19 = [v18 lastPathComponent];
    sourceCodeFile = v15->_sourceCodeFile;
    v15->_sourceCodeFile = (NSString *)v19;

    v15->_unint64_t lineNumber = a7;
    v21 = PLImportGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = [v14 localizedDescription];
      v23 = (void *)v22;
      v24 = &stru_1EEAC1950;
      if (v22) {
        v24 = (__CFString *)v22;
      }
      unint64_t type = v15->_type;
      if (type > 8) {
        v26 = 0;
      }
      else {
        v26 = off_1E5848500[type];
      }
      v27 = v15->_sourceCodeFile;
      unint64_t lineNumber = v15->_lineNumber;
      *(_DWORD *)buf = 138413314;
      v32 = v24;
      __int16 v33 = 2112;
      v34 = v26;
      __int16 v35 = 2112;
      id v36 = v13;
      __int16 v37 = 2112;
      v38 = v27;
      __int16 v39 = 2048;
      unint64_t v40 = lineNumber;
      _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_ERROR, "ERROR: %@ (type: %@, path: %@), file: %@, line: %lu", buf, 0x34u);
    }
  }

  return v15;
}

+ (id)logForAllExceptions:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [a3 exceptions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    v7 = &stru_1EEAC1950;
    do
    {
      uint64_t v8 = 0;
      v9 = v7;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v7 = [NSString stringWithFormat:@"%@\n%@", v9, *(void *)(*((void *)&v11 + 1) + 8 * v8)];

        ++v8;
        v9 = v7;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    v7 = &stru_1EEAC1950;
  }

  return v7;
}

@end