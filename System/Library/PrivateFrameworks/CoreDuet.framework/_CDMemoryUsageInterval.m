@interface _CDMemoryUsageInterval
- (NSString)client;
- (NSString)name;
- (_CDMemoryUsageInterval)initWithName:(id)a3 client:(id)a4;
- (void)begin;
- (void)dealloc;
- (void)end;
@end

@implementation _CDMemoryUsageInterval

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[10];
  v5 = [a1 name];
  v6 = [a1 client];
  int v7 = 134218498;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  v10 = v5;
  __int16 v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "[error] id=%lu name=%@ client=%@ not explicitly ended, this can lead to incorrect measurements", (uint8_t *)&v7, 0x20u);
}

- (_CDMemoryUsageInterval)initWithName:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_CDMemoryUsageInterval;
  uint64_t v8 = [(_CDMemoryUsageInterval *)&v15 init];
  __int16 v9 = v8;
  if (v8)
  {
    v8->_num = 0;
    uint64_t v10 = [v6 copy];
    name = v9->_name;
    v9->_name = (NSString *)v10;

    uint64_t v12 = [v7 copy];
    client = v9->_client;
    v9->_client = (NSString *)v12;

    v9->_state = 0;
    v9->_startTime = 0;
  }

  return v9;
}

- (void)begin
{
  if (!self->_state)
  {
    self->_startTime = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW_APPROX);
    v3 = +[_CDMemoryUsageIntervalTracker sharedInstance]();
    -[_CDMemoryUsageIntervalTracker beginInterval:]((uint64_t)v3, self);

    legacy_log_signpost(self, 1);
    self->_state = 1;
  }
}

- (void)end
{
  if (self->_state == 1)
  {
    v3 = +[_CDMemoryUsageIntervalTracker sharedInstance]();
    -[_CDMemoryUsageIntervalTracker endInterval:]((uint64_t)v3, self);

    legacy_log_signpost(self, 0);
    self->_state = 2;
  }
}

- (NSString)client
{
  return self->_client;
}

@end