@interface EKSSLogger
+ (BOOL)supportsSecureCoding;
+ (id)log;
- (EKSSLogger)initWithCoder:(id)a3;
- (EKSSLogger)initWithString:(id)a3;
- (NSString)logText;
- (id)writeLogFileWithDirectory:(id)a3 andFileName:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)mergeLogger:(id)a3;
- (void)setLogText:(id)a3;
- (void)timestampLogForString:(id)a3;
@end

@implementation EKSSLogger

+ (id)log
{
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, &__block_literal_global_1);
  }
  v2 = (void *)log_log_0;
  return v2;
}

uint64_t __17__EKSSLogger_log__block_invoke()
{
  log_log_0 = (uint64_t)os_log_create("EventKitSyncServices", "EKSSLogger");
  return MEMORY[0x270F9A758]();
}

- (EKSSLogger)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKSSLogger;
  v5 = [(EKSSLogger *)&v9 init];
  v6 = v5;
  if (v5)
  {
    logText = v5->_logText;
    v5->_logText = (NSString *)&stru_26FF80560;

    [(EKSSLogger *)v6 timestampLogForString:v4];
  }

  return v6;
}

- (void)dealloc
{
  logText = self->_logText;
  self->_logText = 0;

  v4.receiver = self;
  v4.super_class = (Class)EKSSLogger;
  [(EKSSLogger *)&v4 dealloc];
}

- (void)timestampLogForString:(id)a3
{
  objc_super v4 = NSString;
  v5 = (void *)MEMORY[0x263EFF910];
  id v6 = a3;
  v7 = [v5 now];
  id v10 = [v4 stringWithFormat:@"%@\t%@\n", v7, v6];

  v8 = [(NSString *)self->_logText stringByAppendingString:v10];
  logText = self->_logText;
  self->_logText = v8;
}

- (void)mergeLogger:(id)a3
{
  logText = self->_logText;
  id v7 = [a3 logText];
  v5 = [(NSString *)logText stringByAppendingString:v7];
  id v6 = self->_logText;
  self->_logText = v5;
}

- (id)writeLogFileWithDirectory:(id)a3 andFileName:(id)a4
{
  id v6 = NSString;
  id v7 = a3;
  v8 = [v6 stringWithFormat:@"Companion-%@.txt", a4];
  objc_super v9 = [v7 URLByAppendingPathComponent:v8];

  if (v9)
  {
    id v10 = [NSString stringWithFormat:@"Writing logs to URL: %@", v9];
    [(EKSSLogger *)self timestampLogForString:v10];

    logText = self->_logText;
    id v15 = 0;
    [(NSString *)logText writeToURL:v9 atomically:1 encoding:4 error:&v15];
    v12 = v15;
    if (v12)
    {
      v13 = +[EKSSLogger log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[EKSSLogger writeLogFileWithDirectory:andFileName:]((uint64_t)v12, v13);
      }
    }
  }
  else
  {
    v12 = +[EKSSLogger log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[EKSSLogger writeLogFileWithDirectory:andFileName:](v12);
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EKSSLogger)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EKSSLogger;
  v5 = [(EKSSLogger *)&v12 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"logText"];
    logText = v5->_logText;
    v5->_logText = (NSString *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)logText
{
  return self->_logText;
}

- (void)setLogText:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)writeLogFileWithDirectory:(os_log_t)log andFileName:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24D299000, log, OS_LOG_TYPE_ERROR, "Log file URL: NULL", v1, 2u);
}

- (void)writeLogFileWithDirectory:(uint64_t)a1 andFileName:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24D299000, a2, OS_LOG_TYPE_ERROR, "Log file written with error: %@", (uint8_t *)&v2, 0xCu);
}

@end