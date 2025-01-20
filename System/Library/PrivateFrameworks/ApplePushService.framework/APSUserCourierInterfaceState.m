@interface APSUserCourierInterfaceState
- (APSUserCourierInterfaceState)init;
- (id)aps_prettyDescription;
- (id)description;
- (unint64_t)filterMode;
- (unint64_t)trackingState;
- (unint64_t)userState;
- (void)setFilterMode:(unint64_t)a3;
- (void)setTrackingState:(unint64_t)a3;
- (void)setUserState:(unint64_t)a3;
@end

@implementation APSUserCourierInterfaceState

- (APSUserCourierInterfaceState)init
{
  v3.receiver = self;
  v3.super_class = (Class)APSUserCourierInterfaceState;
  result = [(APSUserCourierInterfaceState *)&v3 init];
  if (result)
  {
    result->_trackingState = 0;
    result->_filterMode = 0;
    result->_userState = 3;
  }
  return result;
}

- (void)setUserState:(unint64_t)a3
{
  if (self->_userState != a3)
  {
    v5 = +[APSLog courier];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_opt_class();
      unint64_t userState = self->_userState;
      int v8 = 138413058;
      uint64_t v9 = v6;
      __int16 v10 = 2048;
      v11 = self;
      __int16 v12 = 2048;
      unint64_t v13 = userState;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p> Setting user state from: %llu to: %llu", (uint8_t *)&v8, 0x2Au);
    }

    self->_unint64_t userState = a3;
  }
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t userState = self->_userState;
  CFStringRef v5 = @"<unknown>";
  CFStringRef v6 = @"<unknown>";
  if (userState <= 4) {
    CFStringRef v6 = off_100129D48[userState];
  }
  CFStringRef v7 = @"Sent";
  unint64_t trackingState = self->_trackingState;
  unint64_t filterMode = self->_filterMode;
  if (trackingState != 1) {
    CFStringRef v7 = @"<unknown>";
  }
  if (!trackingState) {
    CFStringRef v7 = @"NotSent";
  }
  if (filterMode <= 2) {
    CFStringRef v5 = off_100129D70[filterMode];
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; userState: %@; trackingState: %@; filterMode: %@>",
           v3,
           self,
           v6,
           v7,
           v5);
}

- (id)aps_prettyDescription
{
  unint64_t userState = self->_userState;
  CFStringRef v3 = @"<unknown>";
  CFStringRef v4 = @"<unknown>";
  if (userState <= 4) {
    CFStringRef v4 = off_100129D48[userState];
  }
  unint64_t trackingState = self->_trackingState;
  unint64_t filterMode = self->_filterMode;
  if (trackingState == 1) {
    CFStringRef v7 = @"Sent";
  }
  else {
    CFStringRef v7 = @"<unknown>";
  }
  if (!trackingState) {
    CFStringRef v7 = @"NotSent";
  }
  if (filterMode <= 2) {
    CFStringRef v3 = off_100129D70[filterMode];
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<userState: %@; trackingState: %@; filterMode: %@>",
           v4,
           v7,
           v3);
}

- (unint64_t)userState
{
  return self->_userState;
}

- (unint64_t)trackingState
{
  return self->_trackingState;
}

- (void)setTrackingState:(unint64_t)a3
{
  self->_unint64_t trackingState = a3;
}

- (unint64_t)filterMode
{
  return self->_filterMode;
}

- (void)setFilterMode:(unint64_t)a3
{
  self->_unint64_t filterMode = a3;
}

@end