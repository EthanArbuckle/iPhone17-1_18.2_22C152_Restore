@interface _DDUIiOSPresentedNotification
- (DDUIApplicationInfo)applicationInfo;
- (NSString)notificationID;
- (NSString)remoteDeviceIdentifier;
- (id)completion;
- (void)setApplicationInfo:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setNotificationID:(id)a3;
- (void)setRemoteDeviceIdentifier:(id)a3;
@end

@implementation _DDUIiOSPresentedNotification

- (DDUIApplicationInfo)applicationInfo
{
  return self->_applicationInfo;
}

- (void)setApplicationInfo:(id)a3
{
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (void)setNotificationID:(id)a3
{
}

- (NSString)remoteDeviceIdentifier
{
  return self->_remoteDeviceIdentifier;
}

- (void)setRemoteDeviceIdentifier:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_remoteDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
  objc_storeStrong((id *)&self->_applicationInfo, 0);
}

@end