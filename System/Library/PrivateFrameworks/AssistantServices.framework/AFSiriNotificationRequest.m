@interface AFSiriNotificationRequest
- (AFSiriNotificationRequest)initWithNotifications:(id)a3 sourceAppId:(id)a4;
@end

@implementation AFSiriNotificationRequest

- (AFSiriNotificationRequest)initWithNotifications:(id)a3 sourceAppId:(id)a4
{
  id v6 = a4;
  v7 = [a3 firstObject];
  v10.receiver = self;
  v10.super_class = (Class)AFSiriNotificationRequest;
  v8 = [(AFSiriUserNotificationRequest *)&v10 initWithUserNotification:v7 sourceAppId:v6];

  return v8;
}

@end