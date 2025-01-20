@interface IOKPowerManager
+ (BOOL)isSleepEnabled;
+ (id)powerManager;
- (BOOL)sleepSystemWithError:(id *)a3;
- (IOKPowerManager)init;
- (void)dealloc;
@end

@implementation IOKPowerManager

+ (id)powerManager
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (IOKPowerManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)IOKPowerManager;
  id v2 = [(IOKPowerManager *)&v5 init];
  if (v2)
  {
    io_connect_t v3 = IOPMFindPowerManagement(0);
    v2->_connection = v3;
    if (!v3)
    {

      return 0;
    }
  }
  return v2;
}

+ (BOOL)isSleepEnabled
{
  return IOPMSleepEnabled() != 0;
}

- (BOOL)sleepSystemWithError:(id *)a3
{
  IOReturn v6 = IOPMSleepSystem(self->_connection);
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      [(IOKPowerManager *)(uint64_t)self sleepSystemWithError:v6];
      if (!a3) {
        return v6 == 0;
      }
      goto LABEL_4;
    }
    if (a3)
    {
LABEL_4:
      *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v6 userInfo:0];
    }
  }
  return v6 == 0;
}

- (void)dealloc
{
  io_connect_t connection = self->_connection;
  if (connection) {
    IOServiceClose(connection);
  }
  v4.receiver = self;
  v4.super_class = (Class)IOKPowerManager;
  [(IOKPowerManager *)&v4 dealloc];
}

- (void)sleepSystemWithError:(int)a3 .cold.1(uint64_t a1, const char *a2, int a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_super v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 UTF8String];
  NSStringFromSelector(a2);
  id v8 = objc_claimAutoreleasedReturnValue();
  int v9 = 136315650;
  uint64_t v10 = v7;
  __int16 v11 = 2080;
  uint64_t v12 = [v8 UTF8String];
  __int16 v13 = 1024;
  int v14 = a3;
  _os_log_error_impl(&dword_220957000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s %s failed with error 0x%08x", (uint8_t *)&v9, 0x1Cu);
}

@end