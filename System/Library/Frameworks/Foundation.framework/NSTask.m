@interface NSTask
+ (NSTask)allocWithZone:(_NSZone *)a3;
+ (NSTask)launchedTaskWithExecutableURL:(NSURL *)url arguments:(NSArray *)arguments error:(NSError *)error terminationHandler:(void *)terminationHandler;
+ (NSTask)launchedTaskWithLaunchPath:(NSString *)path arguments:(NSArray *)arguments;
+ (id)currentTaskDictionary;
+ (id)launchedTaskWithDictionary:(id)a3;
- (BOOL)isRunning;
- (BOOL)isSpawnedProcessDisclaimed;
- (BOOL)launchAndReturnError:(NSError *)error;
- (BOOL)resume;
- (BOOL)suspend;
- (NSArray)arguments;
- (NSData)launchRequirementData;
- (NSDictionary)environment;
- (NSQualityOfService)qualityOfService;
- (NSString)currentDirectoryPath;
- (NSString)launchPath;
- (NSTask)init;
- (NSTaskTerminationReason)terminationReason;
- (NSURL)currentDirectoryURL;
- (NSURL)executableURL;
- (id)standardError;
- (id)standardInput;
- (id)standardOutput;
- (int)processIdentifier;
- (int)terminationStatus;
- (int64_t)suspendCount;
- (void)interrupt;
- (void)launch;
- (void)setArguments:(NSArray *)arguments;
- (void)setCurrentDirectoryPath:(NSString *)currentDirectoryPath;
- (void)setCurrentDirectoryURL:(NSURL *)currentDirectoryURL;
- (void)setEnvironment:(NSDictionary *)environment;
- (void)setExecutableURL:(NSURL *)executableURL;
- (void)setLaunchPath:(NSString *)launchPath;
- (void)setStandardError:(id)standardError;
- (void)setStandardInput:(id)standardInput;
- (void)setStandardOutput:(id)standardOutput;
- (void)setTerminationHandler:(void *)terminationHandler;
- (void)terminate;
- (void)terminationHandler;
@end

@implementation NSTask

- (void)terminationHandler
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setTerminationHandler:(void *)terminationHandler
{
  v5 = NSClassFromString((NSString *)@"NSTask");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (int)terminationStatus
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSTaskTerminationReason)terminationReason
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)isRunning
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)launch
{
  v4 = NSClassFromString((NSString *)@"NSTask");

  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)launchAndReturnError:(NSError *)error
{
  v5 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setArguments:(NSArray *)arguments
{
  v5 = NSClassFromString((NSString *)@"NSTask");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setCurrentDirectoryPath:(NSString *)currentDirectoryPath
{
  v5 = NSClassFromString((NSString *)@"NSTask");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setCurrentDirectoryURL:(NSURL *)currentDirectoryURL
{
  if (currentDirectoryURL)
  {
    if (![(NSURL *)currentDirectoryURL isFileURL])
    {
      v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: non-file URL argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
      objc_exception_throw(v7);
    }
    v6 = (NSString *)objc_msgSend(-[NSURL standardizedURL](currentDirectoryURL, "standardizedURL"), "path");
  }
  else
  {
    v6 = [+[NSFileManager defaultManager] currentDirectoryPath];
  }

  [(NSTask *)self setCurrentDirectoryPath:v6];
}

- (NSURL)currentDirectoryURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = [(NSTask *)self currentDirectoryPath];

  return (NSURL *)[v2 fileURLWithPath:v3 isDirectory:1];
}

- (void)setEnvironment:(NSDictionary *)environment
{
  v5 = NSClassFromString((NSString *)@"NSTask");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setLaunchPath:(NSString *)launchPath
{
  v5 = NSClassFromString((NSString *)@"NSTask");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSURL)executableURL
{
  result = [(NSTask *)self launchPath];
  if (result)
  {
    v3 = result;
    v4 = (void *)MEMORY[0x1E4F1CB10];
    return (NSURL *)[v4 fileURLWithPath:v3 isDirectory:0];
  }
  return result;
}

- (void)setExecutableURL:(NSURL *)executableURL
{
  if (executableURL)
  {
    v4 = executableURL;
    if (![(NSURL *)executableURL isFileURL])
    {
      v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: non-file URL argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
      objc_exception_throw(v6);
    }
    executableURL = (NSURL *)objc_msgSend(-[NSURL standardizedURL](v4, "standardizedURL"), "path");
  }

  [(NSTask *)self setLaunchPath:executableURL];
}

- (void)interrupt
{
  v4 = NSClassFromString((NSString *)@"NSTask");

  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)terminate
{
  v4 = NSClassFromString((NSString *)@"NSTask");

  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)suspend
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)resume
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (int64_t)suspendCount
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (int)processIdentifier
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)launchPath
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSDictionary)environment
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSArray)arguments
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)currentDirectoryPath
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSData)launchRequirementData
{
  return 0;
}

- (void)setStandardInput:(id)standardInput
{
  v5 = NSClassFromString((NSString *)@"NSTask");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setStandardOutput:(id)standardOutput
{
  v5 = NSClassFromString((NSString *)@"NSTask");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setStandardError:(id)standardError
{
  v5 = NSClassFromString((NSString *)@"NSTask");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (id)standardInput
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)standardOutput
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)standardError
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSQualityOfService)qualityOfService
{
  return 0;
}

- (BOOL)isSpawnedProcessDisclaimed
{
  return 0;
}

- (NSTask)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSTask;
  return [(NSTask *)&v3 init];
}

+ (NSTask)allocWithZone:(_NSZone *)a3
{
  if (NSTask == a1) {
    a1 = self;
  }

  return (NSTask *)NSAllocateObject((Class)a1, 0, a3);
}

+ (id)currentTaskDictionary
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", -[NSFileManager currentDirectoryPath](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "currentDirectoryPath"), @"_NSTaskDirectoryPath", +[NSFileHandle fileHandleWithStandardInput](NSFileHandle, "fileHandleWithStandardInput"), @"_NSTaskInputFileHandle", +[NSFileHandle fileHandleWithStandardOutput](NSFileHandle, "fileHandleWithStandardOutput"), @"_NSTaskOutputFileHandle", +[NSFileHandle fileHandleWithStandardError](NSFileHandle, "fileHandleWithStandardError"), @"_NSTaskDiagnosticFileHandle", 0);
}

+ (id)launchedTaskWithDictionary:(id)a3
{
  uint64_t v4 = (void *)[objc_allocWithZone((Class)a1) init];
  [v4 launchWithDictionary:a3 error:0];

  return v4;
}

+ (NSTask)launchedTaskWithLaunchPath:(NSString *)path arguments:(NSArray *)arguments
{
  v6 = (NSTask *)(id)[objc_allocWithZone((Class)a1) init];
  id v7 = +[NSTask currentTaskDictionary];
  if (!arguments) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"must provide array of arguments" userInfo:0]);
  }
  v8 = v7;
  [v7 setObject:path forKey:@"_NSTaskExecutablePath"];
  [v8 setObject:arguments forKey:@"_NSTaskArgumentArray"];
  [(NSTask *)v6 launchWithDictionary:v8 error:0];
  return v6;
}

+ (NSTask)launchedTaskWithExecutableURL:(NSURL *)url arguments:(NSArray *)arguments error:(NSError *)error terminationHandler:(void *)terminationHandler
{
  v25[1] = *MEMORY[0x1E4F143B8];
  if (!url)
  {
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    v21 = @"must provide a launch url";
    goto LABEL_18;
  }
  if (![(NSURL *)url isFileURL])
  {
    if (error)
    {
      v24 = @"NSURL";
      v25[0] = url;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      uint64_t v18 = 262;
LABEL_13:
      *error = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:v18 userInfo:v17];
    }
    return 0;
  }
  id v11 = [(NSURL *)url path];
  if (!v11)
  {
    if (error)
    {
      v22 = @"NSURL";
      v23 = url;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      uint64_t v18 = 260;
      goto LABEL_13;
    }
    return 0;
  }
  id v12 = v11;
  id v13 = objc_alloc_init((Class)a1);
  if (!arguments)
  {
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    v21 = @"must provide array of arguments";
LABEL_18:
    objc_exception_throw((id)objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v21, 0, terminationHandler));
  }
  v14 = v13;
  id v15 = +[NSTask currentTaskDictionary];
  [v15 setObject:v12 forKey:@"_NSTaskExecutablePath"];
  [v15 setObject:arguments forKey:@"_NSTaskArgumentArray"];
  [v15 setObject:MEMORY[0x1E4F1CC38] forKey:@"_NSTaskUseErrorsForRuntimeFailures"];
  [v14 setTerminationHandler:terminationHandler];
  if (([v14 launchWithDictionary:v15 error:error] & 1) == 0)
  {

    return 0;
  }

  return (NSTask *)v14;
}

@end