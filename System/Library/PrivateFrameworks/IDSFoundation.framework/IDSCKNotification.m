@interface IDSCKNotification
+ (Class)__class;
+ (id)notificationFromRemoteNotificationDictionary:(id)a3;
- (NSString)subscriptionID;
- (int64_t)notificationType;
@end

@implementation IDSCKNotification

+ (Class)__class
{
  if (qword_1E944F5B0 != -1) {
    dispatch_once(&qword_1E944F5B0, &unk_1EEFCE218);
  }
  v2 = (void *)qword_1E944F5A8;
  return (Class)v2;
}

+ (id)notificationFromRemoteNotificationDictionary:(id)a3
{
  id v3 = a3;
  v4 = (void *)CUTWeakLinkClass();
  v7 = objc_msgSend_notificationFromRemoteNotificationDictionary_(v4, v5, (uint64_t)v3, v6);

  return v7;
}

- (int64_t)notificationType
{
  return self->_notificationType;
}

- (NSString)subscriptionID
{
  return self->_subscriptionID;
}

- (void).cxx_destruct
{
}

@end