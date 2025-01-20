@interface ANAnnouncementCoordinator(AnnouncementSend)
@end

@implementation ANAnnouncementCoordinator(AnnouncementSend)

- (void)sendRequest:()AnnouncementSend sentHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA5ED000, log, OS_LOG_TYPE_ERROR, "WARNING: Home App is not installed.", v1, 2u);
}

@end