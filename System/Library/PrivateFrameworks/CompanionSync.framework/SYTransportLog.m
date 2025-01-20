@interface SYTransportLog
+ (id)sharedInstance;
- (NSString)facility;
- (OS_os_log)oslog;
- (SYTransportLog)init;
- (void)_createLog;
- (void)_logOSMessage:(const char *)a3 args:(char *)a4 returnAddress:(void *)a5;
- (void)logMessage:(id)a3;
- (void)logMessage:(id)a3 args:(char *)a4;
- (void)setFacility:(id)a3;
@end

@implementation SYTransportLog

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_14);
  }
  v2 = (void *)sharedInstance___singleton_0;
  return v2;
}

uint64_t __32__SYTransportLog_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance___singleton_0;
  sharedInstance___singleton_0 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (SYTransportLog)init
{
  v6.receiver = self;
  v6.super_class = (Class)SYTransportLog;
  v2 = [(SYTransportLog *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(SYTransportLog *)v2 _createLog];
    v4 = v3;
  }

  return v3;
}

- (void)_createLog
{
  v3 = (OS_os_log *)os_log_create("com.apple.companionsync", "transport-errors");
  log = self->_log;
  self->_log = v3;
  MEMORY[0x270F9A758](v3, log);
}

- (void)logMessage:(id)a3
{
  [(SYTransportLog *)self logMessage:a3 args:&v3];
}

- (void)logMessage:(id)a3 args:(char *)a4
{
}

- (void)_logOSMessage:(const char *)a3 args:(char *)a4 returnAddress:(void *)a5
{
}

- (NSString)facility
{
  return self->_facility;
}

- (void)setFacility:(id)a3
{
}

- (OS_os_log)oslog
{
  return self->_oslog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oslog, 0);
  objc_storeStrong((id *)&self->_facility, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end