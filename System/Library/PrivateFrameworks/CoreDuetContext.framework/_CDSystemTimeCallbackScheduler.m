@interface _CDSystemTimeCallbackScheduler
+ (_CDSystemTimeCallbackScheduler)sharedInstance;
- (NSString)eventNameRoot;
- (_CDSystemTimeCallbackScheduler)initWithEventNameRoot:(id)a3;
- (void)_handleCallbackAtDate:(id)a3;
- (void)scheduleCallbackAtDate:(id)a3 identifier:(id)a4 requiringDeviceWake:(BOOL)a5;
- (void)unscheduleCallbackAtDate:(id)a3 identifier:(id)a4 requiringDeviceWake:(BOOL)a5;
@end

@implementation _CDSystemTimeCallbackScheduler

- (_CDSystemTimeCallbackScheduler)initWithEventNameRoot:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CDSystemTimeCallbackScheduler;
  v5 = [(_CDSystemTimeCallbackScheduler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    eventNameRoot = v5->_eventNameRoot;
    v5->_eventNameRoot = (NSString *)v6;
  }
  return v5;
}

+ (_CDSystemTimeCallbackScheduler)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_37);
  }
  v2 = (void *)sharedInstance_scheduler;
  return (_CDSystemTimeCallbackScheduler *)v2;
}

- (void)scheduleCallbackAtDate:(id)a3 identifier:(id)a4 requiringDeviceWake:(BOOL)a5
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(_CDSystemTimeCallbackScheduler *)self eventNameRoot];
  if (v9 && v10)
  {

    if (v8 && a5)
    {
      v11 = NSString;
      v12 = NSNumber;
      [v8 timeIntervalSince1970];
      v13 = objc_msgSend(v12, "numberWithDouble:");
      v14 = [v11 stringWithFormat:@"%@", v13];

      v15 = [(_CDSystemTimeCallbackScheduler *)self eventNameRoot];
      v30[0] = v15;
      v30[1] = v9;
      v30[2] = v14;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
      v17 = [v16 componentsJoinedByString:@"."];

      v18 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v19 = [v18 compare:v8];

      v20 = [MEMORY[0x1E4F5B418] contextChannel];
      v21 = v20;
      if (v19 == 1)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[_CDSystemTimeCallbackScheduler scheduleCallbackAtDate:identifier:requiringDeviceWake:]((uint64_t)v8, (uint64_t)v17, v21);
        }
      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v22 = _CDFormattedDate();
          *(_DWORD *)buf = 138412546;
          v27 = v22;
          __int16 v28 = 2112;
          v29 = v17;
          _os_log_impl(&dword_18EC9B000, v21, OS_LOG_TYPE_INFO, "Setting com.apple.alarm xpc event with date %@ for %@", buf, 0x16u);
        }
        char v23 = [v9 hasPrefix:@"com.apple.softwareupdateservicesd"] ^ 1;
        [v8 timeIntervalSince1970];
        int64_t v25 = (uint64_t)(ceil(v24) * 1000000000.0);
        v21 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_date(v21, "Date", v25);
        xpc_dictionary_set_BOOL(v21, "UserVisible", v23);
        [v17 UTF8String];
        xpc_set_event();
      }
    }
  }
  else
  {
  }
}

- (void)unscheduleCallbackAtDate:(id)a3 identifier:(id)a4 requiringDeviceWake:(BOOL)a5
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(_CDSystemTimeCallbackScheduler *)self eventNameRoot];
  if (v9 && v10)
  {

    if (v8 && a5)
    {
      v11 = NSString;
      v12 = NSNumber;
      [v8 timeIntervalSince1970];
      v13 = objc_msgSend(v12, "numberWithDouble:");
      v14 = [v11 stringWithFormat:@"%@", v13];

      v15 = [(_CDSystemTimeCallbackScheduler *)self eventNameRoot];
      v25[0] = v15;
      v25[1] = v9;
      v25[2] = v14;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
      v17 = [v16 componentsJoinedByString:@"."];

      v18 = [MEMORY[0x1E4F5B418] contextChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = _CDFormattedDate();
        *(_DWORD *)buf = 138412546;
        v22 = v19;
        __int16 v23 = 2112;
        double v24 = v17;
        _os_log_impl(&dword_18EC9B000, v18, OS_LOG_TYPE_INFO, "Removing com.apple.alarm xpc event with date %@ for %@", buf, 0x16u);
      }
      id v20 = v17;
      [v20 UTF8String];
      xpc_set_event();
    }
  }
  else
  {
  }
}

- (void)_handleCallbackAtDate:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  uint64_t v6 = [v4 defaultCenter];
  id v8 = @"_CDSystemTimeCallbackDateKey";
  v9[0] = v5;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v6 postNotificationName:@"_CDSystemTimeCallbackNotification" object:self userInfo:v7];
}

- (NSString)eventNameRoot
{
  return self->_eventNameRoot;
}

- (void).cxx_destruct
{
}

- (void)scheduleCallbackAtDate:(uint64_t)a1 identifier:(uint64_t)a2 requiringDeviceWake:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = _CDFormattedDate();
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_18EC9B000, a3, OS_LOG_TYPE_ERROR, "Setting com.apple.alarm xpc event to a past date %@ for %@", (uint8_t *)&v6, 0x16u);
}

@end