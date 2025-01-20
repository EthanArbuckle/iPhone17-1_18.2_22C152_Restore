@interface TDLogger
+ (id)defaultLogger;
+ (id)logger;
- (BOOL)isVerbosityLogErrorsOnly;
- (BOOL)isVerbosityLogEverything;
- (BOOL)isVerbosityLogWarningsAndErrors;
- (TDLogger)init;
- (int)verbosity;
- (void)dealloc;
- (void)logError:(id)a3;
- (void)logErrorWithFormat:(id)a3;
- (void)logExtra:(id)a3;
- (void)logExtraWithFormat:(id)a3;
- (void)logInfo:(id)a3;
- (void)logInfoWithFormat:(id)a3;
- (void)logMessage:(id)a3 whenVerbosity:(int)a4;
- (void)logWarning:(id)a3;
- (void)logWarningWithFormat:(id)a3;
- (void)setVerbosity:(int)a3;
- (void)waitForLoggingToComplete;
@end

@implementation TDLogger

+ (id)logger
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (TDLogger)init
{
  v5.receiver = self;
  v5.super_class = (Class)TDLogger;
  id v2 = [(TDLogger *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_verbosity = 1;
    if (getenv("CoreUI_LogDistill")) {
      v3->_verbosity = 3;
    }
    else {
      v3->_loggingQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreThemeDefinition.logger", 0);
    }
  }
  return v3;
}

+ (id)defaultLogger
{
  if (defaultLogger_onceToken != -1) {
    dispatch_once(&defaultLogger_onceToken, &__block_literal_global_6);
  }
  return (id)defaultLogger_instance;
}

TDLogger *__25__TDLogger_defaultLogger__block_invoke()
{
  result = objc_alloc_init(TDLogger);
  defaultLogger_instance = (uint64_t)result;
  return result;
}

- (void)setVerbosity:(int)a3
{
  if (self->_verbosity != a3) {
    self->_verbosity = a3;
  }
}

- (int)verbosity
{
  if (self->_logMaxVerbosity) {
    return 3;
  }
  else {
    return self->_verbosity;
  }
}

- (void)dealloc
{
  loggingQueue = self->_loggingQueue;
  if (loggingQueue) {
    dispatch_release(loggingQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)TDLogger;
  [(TDLogger *)&v4 dealloc];
}

- (void)logMessage:(id)a3 whenVerbosity:(int)a4
{
  if ([(TDLogger *)self verbosity] >= a4)
  {
    loggingQueue = self->_loggingQueue;
    if (loggingQueue)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __37__TDLogger_logMessage_whenVerbosity___block_invoke;
      block[3] = &unk_264C44E90;
      block[4] = a3;
      dispatch_async(loggingQueue, block);
    }
    else
    {
      NSLog(&cfstr_Distill.isa, a3);
    }
  }
}

uint64_t __37__TDLogger_logMessage_whenVerbosity___block_invoke(uint64_t a1)
{
  v1 = (const char *)[*(id *)(a1 + 32) UTF8String];

  return puts(v1);
}

- (void)logExtra:(id)a3
{
}

- (void)logInfo:(id)a3
{
}

- (void)logWarning:(id)a3
{
}

- (void)logError:(id)a3
{
}

- (void)logExtraWithFormat:(id)a3
{
  objc_super v4 = (void *)[[NSString alloc] initWithFormat:a3 arguments:&v5];
  [(TDLogger *)self logExtra:v4];
}

- (void)logInfoWithFormat:(id)a3
{
  objc_super v4 = (void *)[[NSString alloc] initWithFormat:a3 arguments:&v5];
  [(TDLogger *)self logInfo:v4];
}

- (void)logWarningWithFormat:(id)a3
{
  objc_super v4 = (void *)[[NSString alloc] initWithFormat:a3 arguments:&v5];
  [(TDLogger *)self logWarning:v4];
}

- (void)logErrorWithFormat:(id)a3
{
  objc_super v4 = (void *)[[NSString alloc] initWithFormat:a3 arguments:&v5];
  [(TDLogger *)self logError:v4];
}

- (BOOL)isVerbosityLogErrorsOnly
{
  return self->_logMaxVerbosity != 1 && [(TDLogger *)self verbosity] == 0;
}

- (BOOL)isVerbosityLogWarningsAndErrors
{
  return self->_logMaxVerbosity != 1 && [(TDLogger *)self verbosity] == 1;
}

- (BOOL)isVerbosityLogEverything
{
  return self->_logMaxVerbosity == 1 || [(TDLogger *)self verbosity] == 3;
}

- (void)waitForLoggingToComplete
{
  loggingQueue = self->_loggingQueue;
  if (loggingQueue) {
    dispatch_sync(loggingQueue, &__block_literal_global_9);
  }
}

@end