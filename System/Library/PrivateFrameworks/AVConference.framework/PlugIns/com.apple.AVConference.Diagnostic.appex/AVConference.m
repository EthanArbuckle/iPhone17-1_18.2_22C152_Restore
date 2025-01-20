@interface AVConference
@end

@implementation AVConference

BOOL __89__com_apple_AVConference_DiagnosticExtension_copyDirectory_withPredicate_toSubDirectory___block_invoke(id a1, NSURL *a2, NSError *a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    id v5 = [(NSError *)a3 localizedDescription];
    int v7 = 138412546;
    v8 = a2;
    __int16 v9 = 2080;
    id v10 = [v5 cStringUsingEncoding:4];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[AVCDiagnosticExtension] error enumerating directory url=%@: %s", (uint8_t *)&v7, 0x16u);
  }
  return 1;
}

@end