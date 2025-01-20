@interface IDSCKRecordZoneSubscription
+ (Class)__class;
+ (id)alloc;
- (IDSCKNotificationInfo)notificationInfo;
- (void)setNotificationInfo:(id)a3;
@end

@implementation IDSCKRecordZoneSubscription

+ (Class)__class
{
  if (qword_1E944F5F0 != -1) {
    dispatch_once(&qword_1E944F5F0, &unk_1EEFCE358);
  }
  v2 = (void *)qword_1E944F5E8;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

- (IDSCKNotificationInfo)notificationInfo
{
  return self->_notificationInfo;
}

- (void)setNotificationInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end