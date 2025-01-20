@interface IDSServiceAvailabilityController
+ (id)sharedInstance;
- (BOOL)_isValidServiceType:(id)a3;
- (BOOL)addListenerID:(id)a3 forService:(id)a4;
- (BOOL)hasListenerID:(id)a3 forService:(id)a4;
- (BOOL)removeListenerID:(id)a3 forService:(id)a4;
- (IDSServiceAvailabilityController)init;
- (id)containerForService:(id)a3 create:(BOOL)a4;
- (int64_t)availabilityForListenerID:(id)a3 forService:(id)a4;
- (void)_handleServiceMonitorNotification:(id)a3;
- (void)_postNotificationForService:(id)a3 availability:(int64_t)a4;
- (void)_startListeningToMonitor:(id)a3;
- (void)_stopListeningToMonitor:(id)a3;
- (void)dealloc;
@end

@implementation IDSServiceAvailabilityController

+ (id)sharedInstance
{
  if (qword_1EB2BD840 != -1) {
    dispatch_once(&qword_1EB2BD840, &unk_1EE246328);
  }
  v2 = (void *)qword_1EB2BD800;

  return v2;
}

- (IDSServiceAvailabilityController)init
{
  if (_IDSRunningInDaemon())
  {
    v3 = +[IDSLogging ServiceAvailability];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_191A2A590((uint64_t)self, v3);
    }

    v4 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)IDSServiceAvailabilityController;
    v5 = [(IDSServiceAvailabilityController *)&v9 init];
    if (v5)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      availabilityHandlers = v5->_availabilityHandlers;
      v5->_availabilityHandlers = v6;
    }
    self = v5;
    v4 = self;
  }

  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:0 object:0];

  v4.receiver = self;
  v4.super_class = (Class)IDSServiceAvailabilityController;
  [(IDSServiceAvailabilityController *)&v4 dealloc];
}

- (BOOL)_isValidServiceType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.apple.madrid"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.private.ac"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.ess"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.private.alloy.bulletinboard"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"com.apple.private.alloy.photostream"];
  }

  return v4;
}

- (void)_postNotificationForService:(id)a3 availability:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[IDSLogging ServiceAvailability];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 1024;
    int v16 = a4;
    _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "%@ posting availability change notification (%@) - available: %d", buf, 0x1Cu);
  }

  v8 = (void *)[objc_alloc(NSNumber) initWithInteger:a4];
  objc_super v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"availability", v6, @"service", 0);
  v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v10, "__mainThreadPostNotificationName:object:userInfo:", @"__IDSServiceAvailabilityDidChangeNotification", self, v9);
}

- (void)_handleServiceMonitorNotification:(id)a3
{
  id v4 = a3;
  id v8 = [v4 object];
  v5 = [v4 userInfo];

  id v6 = [v5 objectForKey:@"availability"];

  v7 = [v8 service];
  -[IDSServiceAvailabilityController _postNotificationForService:availability:](self, "_postNotificationForService:availability:", v7, [v6 integerValue]);
}

- (void)_startListeningToMonitor:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F28EB8];
    id v5 = a3;
    id v6 = [v4 defaultCenter];
    [v6 addObserver:self selector:sel__handleServiceMonitorNotification_ name:@"__kIDSServiceMonitorAvailabilityDidChangeNotification" object:v5];
  }
}

- (void)_stopListeningToMonitor:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F28EB8];
    id v5 = a3;
    id v6 = [v4 defaultCenter];
    [v6 removeObserver:self name:@"__kIDSServiceMonitorAvailabilityDidChangeNotification" object:v5];
  }
}

- (id)containerForService:(id)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(IDSServiceAvailabilityController *)self _isValidServiceType:v6])
  {
    v7 = [(NSMutableDictionary *)self->_availabilityHandlers objectForKey:v6];
    if (v7) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = !v4;
    }
    if (!v8)
    {
      objc_super v9 = +[IDSLogging ServiceAvailability];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412546;
        id v14 = self;
        __int16 v15 = 2112;
        id v16 = v6;
        _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "%@ creating monitor for service: %@", (uint8_t *)&v13, 0x16u);
      }

      v10 = [[IDSServiceContainer alloc] initWithService:v6];
      v7 = v10;
      if (v10)
      {
        v11 = [(IDSServiceContainer *)v10 monitor];
        [(IDSServiceAvailabilityController *)self _startListeningToMonitor:v11];

        [(NSMutableDictionary *)self->_availabilityHandlers setObject:v7 forKey:v6];
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasListenerID:(id)a3 forService:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = [(IDSServiceAvailabilityController *)self containerForService:a4 create:0];
    BOOL v8 = v7;
    if (v7) {
      char v9 = [v7 hasListenerID:v6];
    }
    else {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)addListenerID:(id)a3 forService:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 length])
  {
    BOOL v8 = +[IDSLogging ServiceAvailability];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412802;
      id v14 = self;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
    }

    char v9 = [(IDSServiceAvailabilityController *)self containerForService:v7 create:1];
    v10 = v9;
    if (v9) {
      char v11 = [v9 addListenerID:v6];
    }
    else {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)removeListenerID:(id)a3 forService:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    BOOL v8 = +[IDSLogging ServiceAvailability];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412802;
      __int16 v17 = self;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
    }

    char v9 = [(IDSServiceAvailabilityController *)self containerForService:v7 create:0];
    v10 = v9;
    if (v9)
    {
      [v9 removeListenerID:v6];
      char v11 = [v10 listeners];
      uint64_t v12 = [v11 count];

      if (!v12)
      {
        int v13 = +[IDSLogging ServiceAvailability];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412546;
          __int16 v17 = self;
          __int16 v18 = 2112;
          id v19 = v7;
          _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "%@ no more listeners for service: %@", (uint8_t *)&v16, 0x16u);
        }

        id v14 = [v10 monitor];
        [(IDSServiceAvailabilityController *)self _stopListeningToMonitor:v14];

        [(NSMutableDictionary *)self->_availabilityHandlers removeObjectForKey:v7];
      }
    }
  }
  return v6 != 0;
}

- (int64_t)availabilityForListenerID:(id)a3 forService:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    BOOL v8 = [(IDSServiceAvailabilityController *)self containerForService:v7 create:0];
    char v9 = v8;
    if (v8)
    {
      if ([v8 hasListenerID:v6])
      {
        v10 = [v9 monitor];
        int64_t v11 = [v10 serviceAvailability];

LABEL_10:
        goto LABEL_11;
      }
      uint64_t v12 = +[IDSLogging ServiceAvailability];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412802;
        __int16 v15 = self;
        __int16 v16 = 2112;
        id v17 = v6;
        __int16 v18 = 2112;
        id v19 = v7;
      }
    }
    int64_t v11 = -2;
    goto LABEL_10;
  }
  int64_t v11 = -2;
LABEL_11:

  return v11;
}

- (void).cxx_destruct
{
}

@end