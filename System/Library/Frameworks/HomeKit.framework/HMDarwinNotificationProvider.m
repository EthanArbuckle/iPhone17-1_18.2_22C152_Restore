@interface HMDarwinNotificationProvider
- (BOOL)notifyIsValidToken:(int)a3;
- (unsigned)notifyCancel:(int)a3;
- (unsigned)notifyGetState:(int)a3 state:(unint64_t *)a4;
- (unsigned)notifyPost:(const char *)a3;
- (unsigned)notifyRegisterCheck:(const char *)a3 outToken:(int *)a4;
- (unsigned)notifyRegisterDispatch:(const char *)a3 outToken:(int *)a4 queue:(id)a5 handler:(id)a6;
- (unsigned)notifySetState:(int)a3 state:(unint64_t)a4;
@end

@implementation HMDarwinNotificationProvider

- (unsigned)notifyGetState:(int)a3 state:(unint64_t *)a4
{
  return notify_get_state(a3, a4);
}

- (unsigned)notifyRegisterCheck:(const char *)a3 outToken:(int *)a4
{
  return notify_register_check(a3, a4);
}

- (BOOL)notifyIsValidToken:(int)a3
{
  return notify_is_valid_token(a3);
}

- (unsigned)notifyPost:(const char *)a3
{
  return notify_post(a3);
}

- (unsigned)notifyCancel:(int)a3
{
  return notify_cancel(a3);
}

- (unsigned)notifySetState:(int)a3 state:(unint64_t)a4
{
  return notify_set_state(a3, a4);
}

- (unsigned)notifyRegisterDispatch:(const char *)a3 outToken:(int *)a4 queue:(id)a5 handler:(id)a6
{
  return notify_register_dispatch(a3, a4, (dispatch_queue_t)a5, a6);
}

@end