@interface IDSServiceMonitor
- (IDSServiceMonitor)initWithService:(id)a3;
- (NSString)service;
- (id)description;
- (int64_t)serviceAvailability;
- (void)_postAvailability:(int64_t)a3;
- (void)_updateAvailability;
- (void)dealloc;
- (void)updateAvailability;
@end

@implementation IDSServiceMonitor

- (IDSServiceMonitor)initWithService:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!_IDSRunningInDaemon())
  {
    v13.receiver = self;
    v13.super_class = (Class)IDSServiceMonitor;
    v8 = [(IDSServiceMonitor *)&v13 init];
    v9 = v8;
    if (!v8)
    {
LABEL_14:
      self = v9;
      v7 = self;
      goto LABEL_15;
    }
    objc_storeStrong((id *)&v8->_service, a3);
    v10 = +[IDSLogging ServiceAvailability];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v15 = v9;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "-[IDSServiceMonitor init] {self: %p, service: %@}", buf, 0x16u);
    }

    if (([v5 isEqualToString:@"com.apple.madrid"] & 1) != 0
      || ([v5 isEqualToString:@"com.apple.ess"] & 1) != 0
      || ([v5 isEqualToString:@"com.apple.private.ac"] & 1) != 0)
    {
      goto LABEL_11;
    }
    if (([v5 isEqualToString:@"com.apple.private.alloy.bulletinboard"] & 1) == 0)
    {
      if ([v5 isEqualToString:@"com.apple.private.alloy.screensharing"])
      {
LABEL_11:
        if (IMUserScopedNotification())
        {
          v12 = v9;
          v12->_token = IMDispatchForNotify();
        }
        goto LABEL_13;
      }
      [v5 isEqualToString:@"com.apple.private.alloy.photostream"];
    }
LABEL_13:
    [(IDSServiceMonitor *)v9 _updateAvailability];
    goto LABEL_14;
  }
  v6 = +[IDSLogging ServiceAvailability];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_191A2A590((uint64_t)self, v6);
  }

  v7 = 0;
LABEL_15:

  return v7;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = +[IDSLogging ServiceAvailability];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "-[IDSServiceMonitor dealloc] {self: %p}", buf, 0xCu);
  }

  notify_cancel(self->_token);
  v4.receiver = self;
  v4.super_class = (Class)IDSServiceMonitor;
  [(IDSServiceMonitor *)&v4 dealloc];
}

- (void)_postAvailability:(int64_t)a3
{
  id v6 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  objc_super v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"availability", 0);
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v5, "__mainThreadPostNotificationName:object:userInfo:", @"__kIDSServiceMonitorAvailabilityDidChangeNotification", self, v4);
}

- (void)_updateAvailability
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int64_t availability = self->_availability;
  uint64_t state64 = 0;
  notify_get_state(self->_token, &state64);
  uint64_t v4 = state64;
  id v5 = +[IDSLogging ServiceAvailability];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v9 = self;
    __int16 v10 = 2048;
    uint64_t v11 = state64;
    __int16 v12 = 2048;
    int64_t v13 = availability;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "-[IDSServiceMonitor _updateAvailability] {self: %p, state: %llu, previousAvailability: %llu}", buf, 0x20u);
  }
  int64_t v6 = v4 != 0;

  self->_int64_t availability = v6;
  if (availability != v6) {
    [(IDSServiceMonitor *)self _postAvailability:v6];
  }
}

- (void)updateAvailability
{
}

- (int64_t)serviceAvailability
{
  return self->_availability;
}

- (NSString)service
{
  return self->_service;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int64_t v6 = [v3 stringWithFormat:@"<%@: %p service:%@, serviceAvailability: %llu>", v5, self, self->_service, self->_availability];

  return v6;
}

- (void).cxx_destruct
{
}

@end