@interface IMDaemonVCRequestHandler
- (void)clearPendingVCRequestsWithPerson:(id)a3 forAccount:(id)a4;
@end

@implementation IMDaemonVCRequestHandler

- (void)clearPendingVCRequestsWithPerson:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      v9 = "-[IMDaemonVCRequestHandler clearPendingVCRequestsWithPerson:forAccount:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s no longer supported", (uint8_t *)&v8, 0xCu);
    }
  }
}

@end