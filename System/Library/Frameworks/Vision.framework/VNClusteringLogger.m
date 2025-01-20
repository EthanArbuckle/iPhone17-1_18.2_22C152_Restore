@interface VNClusteringLogger
+ (BOOL)isLogEnabled;
+ (id)currentDateTime;
+ (id)padStringWithSpaces:(id)a3 toSize:(int64_t)a4;
+ (void)appendString:(id)a3 toLogFile:(id)a4;
- (BOOL)logEnabled;
- (NSString)fileNameBase;
- (NSURL)logFileURL;
- (NSURL)logFolderURL;
- (VNClusteringLogger)initWithOptions:(id)a3 logEnabled:(BOOL)a4;
- (VNClusteringLogger)initWithOptions:(id)a3 logEnabled:(BOOL)a4 logFileNameBase:(id)a5;
- (void)logClusterLookupMapL0:(const void *)a3;
- (void)logClusterLookupMapL1:(const void *)a3;
- (void)logClusterMap:(const void *)a3 level:(id)a4;
- (void)logClusterMapL0:(const void *)a3;
- (void)logClusterMapL1:(const void *)a3;
- (void)logString:(id)a3;
- (void)resetFileNameURLWithCurentDateTime;
@end

@implementation VNClusteringLogger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileNameBase, 0);
  objc_storeStrong((id *)&self->_logFileURL, 0);

  objc_storeStrong((id *)&self->_logFolderURL, 0);
}

- (NSString)fileNameBase
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)logEnabled
{
  return self->_logEnabled;
}

- (NSURL)logFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSURL)logFolderURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)logClusterLookupMapL1:(const void *)a3
{
}

- (void)logClusterMapL1:(const void *)a3
{
}

- (void)logClusterLookupMapL0:(const void *)a3
{
}

- (void)logClusterMapL0:(const void *)a3
{
}

- (void)logClusterMap:(const void *)a3 level:(id)a4
{
  id v17 = a4;
  v5 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Level %@ cluster map:\n", v17];
  v8 = *(char **)a3;
  v7 = (char *)a3 + 8;
  v6 = v8;
  if (v8 != v7)
  {
    do
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"ClusterId: %lld", *((void *)v6 + 4));
      v10 = +[VNClusteringLogger padStringWithSpaces:v9 toSize:20];
      [v5 appendFormat:@"%@Faces: ", v10];
      v11 = (void *)*((void *)v6 + 5);
      v12 = (void *)*((void *)v6 + 6);
      while (v11 != v12)
      {
        objc_msgSend(v5, "appendFormat:", @"%lld", *v11);
        if (v11 != (void *)(*((void *)v6 + 6) - 8)) {
          [v5 appendFormat:@", "];
        }
        ++v11;
      }
      [v5 appendFormat:@"\n"];

      v13 = (char *)*((void *)v6 + 1);
      if (v13)
      {
        do
        {
          v14 = v13;
          v13 = *(char **)v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          v14 = (char *)*((void *)v6 + 2);
          BOOL v15 = *(void *)v14 == (void)v6;
          v6 = v14;
        }
        while (!v15);
      }
      v6 = v14;
    }
    while (v14 != v7);
  }
  [(VNClusteringLogger *)self logString:v5];
}

- (void)logString:(id)a3
{
  id v5 = a3;
  v4 = [(NSURL *)self->_logFileURL path];
  +[VNClusteringLogger appendString:v5 toLogFile:v4];
}

- (void)resetFileNameURLWithCurentDateTime
{
  logFolderURL = self->_logFolderURL;
  v4 = NSString;
  fileNameBase = self->_fileNameBase;
  id v9 = +[VNClusteringLogger currentDateTime];
  v6 = [v4 stringWithFormat:@"%@_%@.log", fileNameBase, v9];
  v7 = [(NSURL *)logFolderURL URLByAppendingPathComponent:v6];
  logFileURL = self->_logFileURL;
  self->_logFileURL = v7;
}

- (VNClusteringLogger)initWithOptions:(id)a3 logEnabled:(BOOL)a4
{
  return [(VNClusteringLogger *)self initWithOptions:a3 logEnabled:a4 logFileNameBase:@"VNClusteringLog"];
}

- (VNClusteringLogger)initWithOptions:(id)a3 logEnabled:(BOOL)a4 logFileNameBase:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VNClusteringLogger;
  v11 = [(VNClusteringLogger *)&v15 init];
  p_isa = (id *)&v11->super.isa;
  v13 = 0;
  if (v9 && v11)
  {
    v11->_logEnabled = a4;
    objc_storeStrong((id *)&v11->_logFolderURL, a3);
    objc_storeStrong(p_isa + 4, a5);
    [p_isa resetFileNameURLWithCurentDateTime];
    v13 = p_isa;
  }

  return v13;
}

+ (id)currentDateTime
{
  v2 = objc_opt_new();
  v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyy-MM-dd_HH-mm-ss-SSS"];
  v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v2 stringFromDate:v4];

  return v5;
}

+ (id)padStringWithSpaces:(id)a3 toSize:(int64_t)a4
{
  id v5 = a3;
  if ([v5 length] >= (unint64_t)a4)
  {
    v8 = [MEMORY[0x1E4F28E78] stringWithString:v5];
  }
  else
  {
    v6 = [MEMORY[0x1E4F28E78] stringWithCapacity:a4];
    uint64_t v7 = 0;
    do
      [v6 insertString:@" " atIndex:v7++];
    while (a4 != v7);
    v8 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@", v6];
    objc_msgSend(v8, "replaceCharactersInRange:withString:", 0, objc_msgSend(v5, "length"), v5);
  }

  return v8;
}

+ (void)appendString:(id)a3 toLogFile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v15 = 0;
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [v6 stringByDeletingLastPathComponent];
  char v9 = [v7 fileExistsAtPath:v8 isDirectory:&v15];

  if (v15) {
    char v10 = v9;
  }
  else {
    char v10 = 0;
  }
  if (v10)
  {
    v11 = [MEMORY[0x1E4F28CB0] fileHandleForUpdatingAtPath:v6];
    v12 = v11;
    if (v11)
    {
      [v11 seekToEndOfFile];
      v13 = [@"\n\n" stringByAppendingString:v5];
      v14 = [v13 dataUsingEncoding:4];
      [v12 writeData:v14];

      [v12 closeFile];
    }
    else
    {
      [v5 writeToFile:v6 atomically:1 encoding:4 error:0];
    }
  }
}

+ (BOOL)isLogEnabled
{
  if (+[VNClusteringLogger isLogEnabled]::onceToken != -1) {
    dispatch_once(&+[VNClusteringLogger isLogEnabled]::onceToken, &__block_literal_global_197);
  }
  return +[VNClusteringLogger isLogEnabled]::logEnabled;
}

void __34__VNClusteringLogger_isLogEnabled__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  +[VNClusteringLogger isLogEnabled]::logEnabled = [v0 BOOLForKey:@"CVML_debug_enable_cluster_log"];
}

@end