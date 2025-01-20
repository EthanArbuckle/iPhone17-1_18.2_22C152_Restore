@interface HDRemoteCompanionUserNotificationRequestContext
@end

@implementation HDRemoteCompanionUserNotificationRequestContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end