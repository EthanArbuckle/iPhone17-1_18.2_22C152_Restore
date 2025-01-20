@interface BuddySystemTimeUpdateManager
- (int64_t)status;
- (void)setStatus:(int64_t)a3;
- (void)updateSystemTime;
@end

@implementation BuddySystemTimeUpdateManager

- (void)updateSystemTime
{
  v10 = self;
  location[1] = (id)a2;
  if (!self->_status)
  {
    v10->_status = 1;
    location[0] = (id)_BYLoggingFacility();
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      v2 = location[0];
      os_log_type_t v3 = v8;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "SetupAssistant Updating Time Now!", buf, 2u);
    }
    objc_storeStrong(location, 0);
    v4 = &_dispatch_main_q;
    v6 = v10;
    TMSetupTime();

    v5 = &_dispatch_main_q;
    TMSetupTimeZone();

    objc_storeStrong((id *)&v6, 0);
  }
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

@end