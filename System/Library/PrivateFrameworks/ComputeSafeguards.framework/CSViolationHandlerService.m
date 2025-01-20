@interface CSViolationHandlerService
+ (id)_sharedInstance;
+ (void)run;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CSExcessiveCPUViolationHandler)cpuViolationHandler;
- (OS_dispatch_queue)queue;
- (OS_os_log)logger;
- (id)_init;
- (void)_start;
- (void)initializeHandlers;
- (void)reportExcessiveCPUUseBy:(id)a3 pid:(unint64_t)a4 path:(id)a5 endTime:(mach_timespec)a6 observedValue:(int64_t)a7 observationWindow:(int64_t)a8 limitValue:(int64_t)a9 limitWindow:(int64_t)a10 fatal:(BOOL)a11;
- (void)setCpuViolationHandler:(id)a3;
- (void)setLogger:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSViolationHandlerService

+ (void)run
{
  if (run_onceToken != -1) {
    dispatch_once(&run_onceToken, &__block_literal_global_1);
  }
}

void __32__CSViolationHandlerService_run__block_invoke()
{
  id v0 = +[CSViolationHandlerService _sharedInstance];
  [v0 _start];
}

+ (id)_sharedInstance
{
  if (_sharedInstance_onceToken != -1) {
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)_sharedInstance___sharedInstance;
  return v2;
}

uint64_t __44__CSViolationHandlerService__sharedInstance__block_invoke()
{
  _sharedInstance___sharedInstance = [[CSViolationHandlerService alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)CSViolationHandlerService;
  v2 = [(CSViolationHandlerService *)&v10 initWithMachServiceName:@"com.apple.computesafeguards.violationhandler"];
  if (v2)
  {
    uint64_t v3 = +[CSLogger logForCategory:@"ViolationHandler"];
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.computesafeguards.violationhandler", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    [(CSViolationHandlerService *)v2 setDelegate:v2];
    [(CSViolationHandlerService *)v2 initializeHandlers];
    v8 = v2;
  }

  return v2;
}

- (void)_start
{
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_24A698000, logger, OS_LOG_TYPE_INFO, "Started CSViolationHandlerService", v4, 2u);
  }
  [(CSViolationHandlerService *)self activate];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  dispatch_queue_t v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FE37510];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    v8 = logger;
    v10[0] = 67109120;
    v10[1] = [v5 processIdentifier];
    _os_log_impl(&dword_24A698000, v8, OS_LOG_TYPE_INFO, "Accepted new connection from pid %d", (uint8_t *)v10, 8u);
  }
  [v5 resume];

  return 1;
}

- (void)initializeHandlers
{
  self->_cpuViolationHandler = +[CSExcessiveCPUViolationHandler sharedInstance];
  MEMORY[0x270F9A758]();
}

- (void)reportExcessiveCPUUseBy:(id)a3 pid:(unint64_t)a4 path:(id)a5 endTime:(mach_timespec)a6 observedValue:(int64_t)a7 observationWindow:(int64_t)a8 limitValue:(int64_t)a9 limitWindow:(int64_t)a10 fatal:(BOOL)a11
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a5;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v16;
    __int16 v23 = 2048;
    unint64_t v24 = a4;
    _os_log_impl(&dword_24A698000, logger, OS_LOG_TYPE_INFO, "Received CPU violation for process: %@, pid: %llu.", buf, 0x16u);
  }
  LOBYTE(v19) = a11;
  [(CSExcessiveCPUViolationHandler *)self->_cpuViolationHandler handleViolationByProcess:v16 pid:a4 path:v17 endTime:a6 observedValue:a7 observationWindow:a8 limitValue:a9 limitWindow:a10 fatal:v19];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (CSExcessiveCPUViolationHandler)cpuViolationHandler
{
  return self->_cpuViolationHandler;
}

- (void)setCpuViolationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cpuViolationHandler, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end