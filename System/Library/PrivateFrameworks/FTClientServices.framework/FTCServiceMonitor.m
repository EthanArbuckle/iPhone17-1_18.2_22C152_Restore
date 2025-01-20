@interface FTCServiceMonitor
- (FTCServiceMonitor)initWithServiceType:(int64_t)a3;
- (int64_t)serviceAvailability;
- (int64_t)serviceType;
- (void)_postAvailability:(int64_t)a3;
- (void)_updateAvailability;
- (void)dealloc;
- (void)updateAvailability;
@end

@implementation FTCServiceMonitor

- (FTCServiceMonitor)initWithServiceType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FTCServiceMonitor;
  v4 = [(FTCServiceMonitor *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    if ((unint64_t)a3 <= 2) {
      IMUserScopedNotification();
    }
    [MEMORY[0x263F33230] weakRefWithObject:v5];
    v5->_token = IMDispatchForNotify();
    [(FTCServiceMonitor *)v5 _updateAvailability];
  }
  return v5;
}

- (void)dealloc
{
  notify_cancel(self->_token);
  v3.receiver = self;
  v3.super_class = (Class)FTCServiceMonitor;
  [(FTCServiceMonitor *)&v3 dealloc];
}

- (void)_postAvailability:(int64_t)a3
{
  id v5 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  v4 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v5, @"availability", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "__mainThreadPostNotificationName:object:userInfo:", @"__kFTCServiceMonitorAvailabilityDidChangeNotification", self, v4);
}

- (void)_updateAvailability
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  p_int64_t availability = &self->_availability;
  int64_t availability = self->_availability;
  uint64_t state64 = 0;
  notify_get_state(self->_token, &state64);
  int64_t v5 = state64 != 0;
  int64_t *p_availability = v5;
  if (availability != v5)
  {
    v6 = OSLogHandleForRegistrationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v7 = [(FTCServiceMonitor *)self serviceType];
      if ((unint64_t)(v7 + 1) > 3) {
        v8 = @"Unknown";
      }
      else {
        v8 = off_264237CE0[v7 + 1];
      }
      if ((unint64_t)(availability + 2) > 3) {
        v9 = @"Unknown";
      }
      else {
        v9 = off_264237D00[availability + 2];
      }
      unint64_t v10 = self->_availability + 2;
      if (v10 > 3) {
        v11 = @"Unknown";
      }
      else {
        v11 = off_264237D00[v10];
      }
      *(_DWORD *)buf = 138413058;
      v20 = self;
      __int16 v21 = 2112;
      v22 = v8;
      __int16 v23 = 2112;
      v24 = v9;
      __int16 v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_215216000, v6, OS_LOG_TYPE_DEFAULT, "%@ updating availability for %@   => from %@ to %@", buf, 0x2Au);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLogRegistration())
      {
        [(FTCServiceMonitor *)self serviceType];
        sub_215217B5C(@"ServiceAvailability", @"%@ updating availability for %@   => from %@ to %@", v12, v13, v14, v15, v16, v17, (uint64_t)self);
      }
    }
    [(FTCServiceMonitor *)self _postAvailability:self->_availability];
  }
}

- (void)updateAvailability
{
}

- (int64_t)serviceAvailability
{
  return self->_availability;
}

- (int64_t)serviceType
{
  return self->_type;
}

@end