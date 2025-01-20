@interface UIViewController(AuthenticationServicesExtrasIPI)
- (void)setAs_navigationItem:()AuthenticationServicesExtrasIPI;
@end

@implementation UIViewController(AuthenticationServicesExtrasIPI)

- (void)setAs_navigationItem:()AuthenticationServicesExtrasIPI
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    -[UIViewController(AuthenticationServicesExtrasIPI) setAs_navigationItem:](v0);
  }
}

- (void)setAs_navigationItem:()AuthenticationServicesExtrasIPI .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "Attempted to set ASNavigationItem on iOS. ASNavigationItem is UINavigationItem on iOS and is a readonly property.", v1, 2u);
}

@end