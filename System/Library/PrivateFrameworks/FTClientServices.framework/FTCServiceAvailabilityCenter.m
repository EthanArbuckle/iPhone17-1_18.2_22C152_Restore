@interface FTCServiceAvailabilityCenter
+ (id)sharedInstance;
- (BOOL)_isValidServiceType:(int64_t)a3;
- (BOOL)addListenerID:(id)a3 forService:(int64_t)a4;
- (BOOL)hasListenerID:(id)a3 forService:(int64_t)a4;
- (BOOL)removeListenerID:(id)a3 forService:(int64_t)a4;
- (FTCServiceAvailabilityCenter)init;
- (id)containerForService:(int64_t)a3 create:(BOOL)a4;
- (int64_t)availabilityForListenerID:(id)a3 forService:(int64_t)a4;
- (void)_handleServiceMonitorNotification:(id)a3;
- (void)_postNotificationForService:(int64_t)a3 availability:(int64_t)a4;
- (void)_startListeningToMonitor:(id)a3;
- (void)_stopListeningToMonitor:(id)a3;
- (void)dealloc;
@end

@implementation FTCServiceAvailabilityCenter

+ (id)sharedInstance
{
  if (qword_26AA5F6D0 != -1) {
    dispatch_once(&qword_26AA5F6D0, &unk_26C5DD070);
  }
  return (id)qword_26AA5F6D8;
}

- (id)containerForService:(int64_t)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (!-[FTCServiceAvailabilityCenter _isValidServiceType:](self, "_isValidServiceType:")) {
    return 0;
  }
  v7 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
  v8 = (FTCServiceContainer *)[(NSMutableDictionary *)self->_availabilityHandlers objectForKey:v7];
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !v4;
  }
  if (!v9)
  {
    v10 = OSLogHandleForRegistrationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = self;
      __int16 v22 = 2112;
      v23 = FTCServiceNameForServiceType(a3);
      _os_log_impl(&dword_215216000, v10, OS_LOG_TYPE_DEFAULT, "%@ creating monitor for service: %@", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && MarcoShouldLogRegistration())
    {
      FTCServiceNameForServiceType(a3);
      sub_215217B5C(@"ServiceAvailability", @"%@ creating monitor for service: %@", v11, v12, v13, v14, v15, v16, (uint64_t)self);
    }
    v17 = [[FTCServiceContainer alloc] initWithServiceType:a3];
    v18 = v17;
    if (v17)
    {
      [(FTCServiceAvailabilityCenter *)self _startListeningToMonitor:[(FTCServiceContainer *)v17 monitor]];
      [(NSMutableDictionary *)self->_availabilityHandlers setObject:v18 forKey:v7];
    }
    v8 = v18;
  }
  return v8;
}

- (FTCServiceAvailabilityCenter)init
{
  v4.receiver = self;
  v4.super_class = (Class)FTCServiceAvailabilityCenter;
  v2 = [(FTCServiceAvailabilityCenter *)&v4 init];
  if (v2) {
    v2->_availabilityHandlers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  return v2;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, 0, 0);

  v3.receiver = self;
  v3.super_class = (Class)FTCServiceAvailabilityCenter;
  [(FTCServiceAvailabilityCenter *)&v3 dealloc];
}

- (BOOL)_isValidServiceType:(int64_t)a3
{
  return (unint64_t)a3 < 3;
}

- (void)_postNotificationForService:(int64_t)a3 availability:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v7 = OSLogHandleForRegistrationCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v18 = self;
    __int16 v19 = 2112;
    v20 = FTCServiceNameForServiceType(a3);
    __int16 v21 = 2048;
    int64_t v22 = a4;
    _os_log_impl(&dword_215216000, v7, OS_LOG_TYPE_DEFAULT, "%@ posting availability change notification (%@) - available: %ld", buf, 0x20u);
  }
  if (os_log_shim_legacy_logging_enabled() && MarcoShouldLogRegistration())
  {
    FTCServiceNameForServiceType(a3);
    sub_215217B5C(@"ServiceAvailability", @"%@ posting availability change notification (%@) - available: %ld", v8, v9, v10, v11, v12, v13, (uint64_t)self);
  }
  uint64_t v14 = (void *)[objc_alloc(NSNumber) initWithInteger:a4];
  uint64_t v15 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
  uint64_t v16 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v14, @"availability", v15, @"servicetype", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "__mainThreadPostNotificationName:object:userInfo:", @"__FTCServiceAvailabilityDidChangeNotification", self, v16);
}

- (void)_handleServiceMonitorNotification:(id)a3
{
  v5 = (void *)[a3 object];
  v6 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"availability");
  [v5 serviceType];
  [v6 integerValue];
  MEMORY[0x270F9A6D0](self, sel__postNotificationForService_availability_);
}

- (void)_startListeningToMonitor:(id)a3
{
  if (a3)
  {
    uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
    MEMORY[0x270F9A6D0](v3, sel_addObserver_selector_name_object_);
  }
}

- (void)_stopListeningToMonitor:(id)a3
{
  if (a3)
  {
    v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v5 removeObserver:self name:@"__kFTCServiceMonitorAvailabilityDidChangeNotification" object:a3];
  }
}

- (BOOL)hasListenerID:(id)a3 forService:(int64_t)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = [(FTCServiceAvailabilityCenter *)self containerForService:a4 create:0];
  if (!v5) {
    return 0;
  }
  return [v5 hasListenerID:a3];
}

- (BOOL)addListenerID:(id)a3 forService:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v7 = (id)[a3 length];
    if (v7)
    {
      uint64_t v8 = OSLogHandleForRegistrationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v17 = self;
        __int16 v18 = 2112;
        id v19 = a3;
        __int16 v20 = 2112;
        __int16 v21 = FTCServiceNameForServiceType(a4);
      }
      if (os_log_shim_legacy_logging_enabled() && MarcoShouldLogRegistration())
      {
        FTCServiceNameForServiceType(a4);
      }
      id v7 = [(FTCServiceAvailabilityCenter *)self containerForService:a4 create:1];
      if (v7) {
        LOBYTE(v7) = [v7 addListenerID:a3];
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return (char)v7;
}

- (BOOL)removeListenerID:(id)a3 forService:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v7 = OSLogHandleForRegistrationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v27 = self;
      __int16 v28 = 2112;
      id v29 = a3;
      __int16 v30 = 2112;
      v31 = FTCServiceNameForServiceType(a4);
    }
    if (os_log_shim_legacy_logging_enabled() && MarcoShouldLogRegistration())
    {
      FTCServiceNameForServiceType(a4);
    }
    id v14 = [(FTCServiceAvailabilityCenter *)self containerForService:a4 create:0];
    uint64_t v15 = v14;
    if (v14)
    {
      [v14 removeListenerID:a3];
      if (!objc_msgSend((id)objc_msgSend(v15, "listeners"), "count"))
      {
        uint64_t v16 = OSLogHandleForRegistrationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = FTCServiceNameForServiceType(a4);
          *(_DWORD *)buf = 138412546;
          v27 = self;
          __int16 v28 = 2112;
          id v29 = v17;
          _os_log_impl(&dword_215216000, v16, OS_LOG_TYPE_DEFAULT, "%@ no more listeners for service: %@", buf, 0x16u);
        }
        if (os_log_shim_legacy_logging_enabled() && MarcoShouldLogRegistration())
        {
          FTCServiceNameForServiceType(a4);
          sub_215217B5C(@"ServiceAvailability", @"%@ no more listeners for service: %@", v18, v19, v20, v21, v22, v23, (uint64_t)self);
        }
        -[FTCServiceAvailabilityCenter _stopListeningToMonitor:](self, "_stopListeningToMonitor:", [v15 monitor]);
        uint64_t v24 = (void *)[objc_alloc(NSNumber) initWithInteger:a4];
        [(NSMutableDictionary *)self->_availabilityHandlers removeObjectForKey:v24];
      }
    }
  }
  return a3 != 0;
}

- (int64_t)availabilityForListenerID:(id)a3 forService:(int64_t)a4
{
  if (!a3) {
    return -2;
  }
  id v5 = [(FTCServiceAvailabilityCenter *)self containerForService:a4 create:0];
  if (!v5) {
    return -2;
  }
  v6 = v5;
  if (![v5 hasListenerID:a3]) {
    return -2;
  }
  uint64_t v7 = [v6 monitor];
  return MEMORY[0x270F9A6D0](v7, sel_serviceAvailability);
}

@end