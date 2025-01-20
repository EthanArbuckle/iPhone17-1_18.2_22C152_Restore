@interface NMSSHLogger
+ (id)logger;
+ (id)sharedLogger;
- (BOOL)isEnabled;
- (OS_dispatch_queue)loggerQueue;
- (id)logBlock;
- (unint64_t)logLevel;
- (void)log:(id)a3 level:(unint64_t)a4 flag:(unint64_t)a5;
- (void)logError:(id)a3;
- (void)logInfo:(id)a3;
- (void)logVerbose:(id)a3;
- (void)logWarn:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLogBlock:(id)a3;
- (void)setLogLevel:(unint64_t)a3;
- (void)setLoggerQueue:(id)a3;
@end

@implementation NMSSHLogger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggerQueue, 0);
  objc_storeStrong(&self->_logBlock, 0);
}

- (void)setLoggerQueue:(id)a3
{
}

- (OS_dispatch_queue)loggerQueue
{
  return self->_loggerQueue;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setLogLevel:(unint64_t)a3
{
  self->_logLevel = a3;
}

- (unint64_t)logLevel
{
  return self->_logLevel;
}

- (void)setLogBlock:(id)a3
{
}

- (id)logBlock
{
  return self->_logBlock;
}

- (void)logError:(id)a3
{
}

- (void)logWarn:(id)a3
{
}

- (void)logInfo:(id)a3
{
}

- (void)logVerbose:(id)a3
{
}

- (void)log:(id)a3 level:(unint64_t)a4 flag:(unint64_t)a5
{
  id v8 = a3;
  if (([(NMSSHLogger *)self logLevel] & a5) != 0)
  {
    if ([(NMSSHLogger *)self isEnabled])
    {
      v9 = [(NMSSHLogger *)self logBlock];

      if (v9)
      {
        v10 = [(NMSSHLogger *)self loggerQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __30__NMSSHLogger_log_level_flag___block_invoke;
        block[3] = &unk_264E5DA30;
        block[4] = self;
        unint64_t v13 = a4;
        id v12 = v8;
        dispatch_async(v10, block);
      }
    }
  }
}

void __30__NMSSHLogger_log_level_flag___block_invoke(uint64_t a1)
{
  v4 = [*(id *)(a1 + 32) logBlock];
  uint64_t v2 = *(void *)(a1 + 48);
  v3 = [NSString stringWithFormat:@"NMSSH: %@", *(void *)(a1 + 40)];
  v4[2](v4, v2, v3);
}

+ (id)sharedLogger
{
  return +[NMSSHLogger logger];
}

+ (id)logger
{
  if (logger_onceToken != -1) {
    dispatch_once(&logger_onceToken, &__block_literal_global_51778);
  }
  uint64_t v2 = (void *)logger_logger;
  return v2;
}

void __21__NMSSHLogger_logger__block_invoke()
{
  v0 = objc_alloc_init(NMSSHLogger);
  v1 = (void *)logger_logger;
  logger_logger = (uint64_t)v0;

  [(id)logger_logger setEnabled:1];
  [(id)logger_logger setLogLevel:15];
  [(id)logger_logger setLogBlock:&__block_literal_global_3];
  uint64_t v2 = (void *)logger_logger;
  dispatch_queue_t v3 = dispatch_queue_create("NMSSH.loggerQueue", 0);
  [v2 setLoggerQueue:v3];
}

void __21__NMSSHLogger_logger__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

@end