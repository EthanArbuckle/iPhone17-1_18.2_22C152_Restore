@interface DSGeneralLogCollector
+ (id)latestRootLog;
+ (id)latestUserLog;
- (DSGeneralLogCollector)initWithLogIDs:(id)a3;
- (NSArray)logFiles;
- (NSArray)logIDs;
- (NSDictionary)friendlyAppNamesDictionary;
- (id)logFilesFromEnumerator:(id)a3;
- (void)enumerateLogLinesWithBlock:(id)a3;
- (void)getLogFiles;
- (void)setFriendlyAppNamesDictionary:(id)a3;
- (void)setLogFiles:(id)a3;
- (void)setLogIDs:(id)a3;
@end

@implementation DSGeneralLogCollector

+ (id)latestUserLog
{
  v2 = [@"/private/var/mobile/Library/Logs/AppleSupport" stringByAppendingPathComponent:@"general.log"];
  v3 = [DSGeneralLogFile alloc];
  v4 = [NSURL fileURLWithPath:v2];
  v5 = [(DSGeneralLogFile *)v3 initWithURL:v4];

  return v5;
}

+ (id)latestRootLog
{
  v2 = [@"/private/var/logs/AppleSupport" stringByAppendingPathComponent:@"general.log"];
  v3 = [DSGeneralLogFile alloc];
  v4 = [NSURL fileURLWithPath:v2];
  v5 = [(DSGeneralLogFile *)v3 initWithURL:v4];

  return v5;
}

- (DSGeneralLogCollector)initWithLogIDs:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DSGeneralLogCollector;
  v6 = [(DSGeneralLogCollector *)&v11 init];
  if (!v5) {
    goto LABEL_7;
  }
  v7 = [MEMORY[0x263EFF9D0] null];
  if ([v5 isEqual:v7])
  {

LABEL_7:
    v9 = DiagnosticLogHandleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DSGeneralLogCollector initWithLogIDs:](v9);
    }

    v6 = 0;
    goto LABEL_10;
  }
  uint64_t v8 = [v5 count];

  if (!v8) {
    goto LABEL_7;
  }
  if (v6)
  {
    objc_storeStrong((id *)&v6->_logIDs, a3);
    [(DSGeneralLogCollector *)v6 getLogFiles];
  }
LABEL_10:

  return v6;
}

- (void)getLogFiles
{
  v16[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = [NSURL URLWithString:@"/private/var/logs/AppleSupport"];
  v6 = [v4 enumeratorAtURL:v5 includingPropertiesForKeys:0 options:4 errorHandler:0];

  v7 = [(DSGeneralLogCollector *)self logFilesFromEnumerator:v6];
  [v3 addObjectsFromArray:v7];

  uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
  v9 = [NSURL URLWithString:@"/private/var/mobile/Library/Logs/AppleSupport"];
  v10 = [v8 enumeratorAtURL:v9 includingPropertiesForKeys:0 options:4 errorHandler:0];

  objc_super v11 = [(DSGeneralLogCollector *)self logFilesFromEnumerator:v10];
  [v3 addObjectsFromArray:v11];

  v12 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"logStartDate" ascending:1];
  v16[0] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  v14 = [v3 sortedArrayUsingDescriptors:v13];
  logFiles = self->_logFiles;
  self->_logFiles = v14;
}

- (id)logFilesFromEnumerator:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_super v11 = [DSGeneralLogFile alloc];
        v12 = -[DSGeneralLogFile initWithURL:](v11, "initWithURL:", v10, (void)v14);
        if (v12) {
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)enumerateLogLinesWithBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DiagnosticLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(DSGeneralLogCollector *)self logIDs];
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_22CA94000, v5, OS_LOG_TYPE_DEFAULT, "Requesting log lines for: %@", buf, 0xCu);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(DSGeneralLogCollector *)self logFiles];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
      v13 = [(DSGeneralLogCollector *)self logIDs];
      LOBYTE(v12) = [v12 enumerateLogLinesWithIDs:v13 usingBlock:v4];

      if (v12) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

- (NSArray)logFiles
{
  return self->_logFiles;
}

- (void)setLogFiles:(id)a3
{
}

- (NSDictionary)friendlyAppNamesDictionary
{
  return self->_friendlyAppNamesDictionary;
}

- (void)setFriendlyAppNamesDictionary:(id)a3
{
}

- (NSArray)logIDs
{
  return self->_logIDs;
}

- (void)setLogIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIDs, 0);
  objc_storeStrong((id *)&self->_friendlyAppNamesDictionary, 0);
  objc_storeStrong((id *)&self->_logFiles, 0);
}

- (void)initWithLogIDs:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22CA94000, log, OS_LOG_TYPE_ERROR, "logIDs must contain values", v1, 2u);
}

@end