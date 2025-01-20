@interface _BLNotificationAllowedType
- (NSString)notificationReason;
- (NSString)notificationSubtype;
- (NSString)userDefaultsKey;
- (_BLNotificationAllowedType)initWithNotificationType:(int64_t)a3 notificationReason:(id)a4 notificationSubtype:(id)a5 userDefaultsKey:(id)a6;
- (int64_t)notificationType;
@end

@implementation _BLNotificationAllowedType

- (_BLNotificationAllowedType)initWithNotificationType:(int64_t)a3 notificationReason:(id)a4 notificationSubtype:(id)a5 userDefaultsKey:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_BLNotificationAllowedType;
  v13 = [(_BLNotificationAllowedType *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_notificationType = a3;
    v15 = (NSString *)[v10 copy];
    notificationReason = v14->_notificationReason;
    v14->_notificationReason = v15;

    v17 = (NSString *)[v11 copy];
    notificationSubtype = v14->_notificationSubtype;
    v14->_notificationSubtype = v17;

    v19 = (NSString *)[v12 copy];
    userDefaultsKey = v14->_userDefaultsKey;
    v14->_userDefaultsKey = v19;
  }
  return v14;
}

- (int64_t)notificationType
{
  return self->_notificationType;
}

- (NSString)notificationReason
{
  return self->_notificationReason;
}

- (NSString)notificationSubtype
{
  return self->_notificationSubtype;
}

- (NSString)userDefaultsKey
{
  return self->_userDefaultsKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultsKey, 0);
  objc_storeStrong((id *)&self->_notificationSubtype, 0);

  objc_storeStrong((id *)&self->_notificationReason, 0);
}

@end