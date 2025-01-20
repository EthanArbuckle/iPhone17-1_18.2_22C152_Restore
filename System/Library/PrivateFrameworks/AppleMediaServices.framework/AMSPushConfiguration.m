@interface AMSPushConfiguration
- (AMSPushConfiguration)initWithEnabledActionTypes:(id)a3;
- (AMSPushHandlerDelegate)delegate;
- (NSSet)enabledActionTypes;
- (NSString)engagementPushTopic;
- (NSString)userNotificationExtensionId;
- (void)setDelegate:(id)a3;
- (void)setEnabledActionTypes:(id)a3;
- (void)setEngagementPushTopic:(id)a3;
- (void)setUserNotificationExtensionId:(id)a3;
@end

@implementation AMSPushConfiguration

- (void)setUserNotificationExtensionId:(id)a3
{
}

- (void)setEnabledActionTypes:(id)a3
{
}

- (NSSet)enabledActionTypes
{
  return self->_enabledActionTypes;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)engagementPushTopic
{
  return self->_engagementPushTopic;
}

- (AMSPushConfiguration)initWithEnabledActionTypes:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSPushConfiguration;
  v6 = [(AMSPushConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_enabledActionTypes, a3);
  }

  return v7;
}

- (void)setEngagementPushTopic:(id)a3
{
}

- (NSString)userNotificationExtensionId
{
  return self->_userNotificationExtensionId;
}

- (AMSPushHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSPushHandlerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_enabledActionTypes, 0);
  objc_storeStrong((id *)&self->_userNotificationExtensionId, 0);
  objc_storeStrong((id *)&self->_engagementPushTopic, 0);
}

@end