@interface CHRecentCall(PhoneKit)
- (void)handle;
@end

@implementation CHRecentCall(PhoneKit)

- (void)handle
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "-[CHRecentCall handleType] returned a value of CHHandleTypeUnknown", v1, 2u);
}

@end