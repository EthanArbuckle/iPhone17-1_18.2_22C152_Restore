@interface CHLogger
- (CHLogger)initWithDomain:(const char *)a3;
- (OS_os_log)logHandle;
@end

@implementation CHLogger

- (void).cxx_destruct
{
}

- (CHLogger)initWithDomain:(const char *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CHLogger;
  v4 = [(CHLogger *)&v9 init];
  if (v4)
  {
    v5 = +[CHLogServer sharedInstance];
    uint64_t v6 = [v5 logHandleForDomain:a3];
    logHandle = v4->_logHandle;
    v4->_logHandle = (OS_os_log *)v6;
  }
  return v4;
}

- (OS_os_log)logHandle
{
  return self->_logHandle;
}

@end