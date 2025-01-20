@interface PHImportExceptionRecorder
- (NSMutableArray)exceptions;
- (PHImportExceptionRecorder)init;
- (id)addExceptionWithType:(int64_t)a3 path:(id)a4 underlyingError:(id)a5 file:(char *)a6 line:(unint64_t)a7;
- (id)logForExceptions;
- (void)addException:(id)a3;
- (void)addExceptions:(id)a3;
- (void)logErrors;
@end

@implementation PHImportExceptionRecorder

- (void).cxx_destruct
{
}

- (NSMutableArray)exceptions
{
  return self->_exceptions;
}

- (void)logErrors
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_exceptions count])
  {
    v3 = [MEMORY[0x1E4F28E78] stringWithString:@"\n\n\t========= Import Errors ========="];
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"\n\t%lu files had issues", -[NSMutableArray count](self->_exceptions, "count"));
    [v3 appendString:v4];

    [v3 appendString:@"\n\t--------- Error Detail ----------"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = self->_exceptions;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [NSString stringWithFormat:@"\n\t%@", *(void *)(*((void *)&v12 + 1) + 8 * v9)];
          [v3 appendString:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 appendString:@"\n\t=================================\n"];
    v11 = PLImportGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v3;
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
}

- (id)logForExceptions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(PHImportExceptionRecorder *)self exceptions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    uint64_t v6 = &stru_1EEAC1950;
    do
    {
      uint64_t v7 = 0;
      uint64_t v8 = v6;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [NSString stringWithFormat:@"%@\n%@", v8, *(void *)(*((void *)&v10 + 1) + 8 * v7)];

        ++v7;
        uint64_t v8 = v6;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v6 = &stru_1EEAC1950;
  }

  return v6;
}

- (id)addExceptionWithType:(int64_t)a3 path:(id)a4 underlyingError:(id)a5 file:(char *)a6 line:(unint64_t)a7
{
  id v12 = a5;
  id v13 = a4;
  long long v14 = [[PHImportException alloc] initWithType:a3 path:v13 underlyingError:v12 file:a6 line:a7];

  [(PHImportExceptionRecorder *)self addException:v14];

  return v14;
}

- (void)addExceptions:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(PHImportExceptionRecorder *)self addException:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addException:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self->_exceptions, "addObject:");
  }
}

- (PHImportExceptionRecorder)init
{
  v6.receiver = self;
  v6.super_class = (Class)PHImportExceptionRecorder;
  v2 = [(PHImportExceptionRecorder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    exceptions = v2->_exceptions;
    v2->_exceptions = (NSMutableArray *)v3;
  }
  return v2;
}

@end