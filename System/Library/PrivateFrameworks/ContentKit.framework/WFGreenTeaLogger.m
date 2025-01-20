@interface WFGreenTeaLogger
+ (id)sharedLogger;
+ (void)log:(id)a3;
- (WFGreenTeaLogger)init;
- (ct_green_tea_logger_s)logger;
- (void)dealloc;
- (void)log:(id)a3;
@end

@implementation WFGreenTeaLogger

- (ct_green_tea_logger_s)logger
{
  return self->_logger;
}

- (void)log:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(WFGreenTeaLogger *)self logger];
  v5 = getCTGreenTeaOsLogHandle();
  v6 = v5;
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_216505000, v6, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)dealloc
{
  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)WFGreenTeaLogger;
  [(WFGreenTeaLogger *)&v3 dealloc];
}

- (WFGreenTeaLogger)init
{
  v5.receiver = self;
  v5.super_class = (Class)WFGreenTeaLogger;
  v2 = [(WFGreenTeaLogger *)&v5 init];
  if (v2)
  {
    v2->_logger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
    objc_super v3 = v2;
  }

  return v2;
}

+ (void)log:(id)a3
{
  id v3 = a3;
  id v4 = +[WFGreenTeaLogger sharedLogger];
  [v4 log:v3];
}

+ (id)sharedLogger
{
  if (sharedLogger_onceToken != -1) {
    dispatch_once(&sharedLogger_onceToken, &__block_literal_global_3879);
  }
  v2 = (void *)sharedLogger_sharedLogger;
  return v2;
}

uint64_t __32__WFGreenTeaLogger_sharedLogger__block_invoke()
{
  sharedLogger_sharedLogger = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

@end