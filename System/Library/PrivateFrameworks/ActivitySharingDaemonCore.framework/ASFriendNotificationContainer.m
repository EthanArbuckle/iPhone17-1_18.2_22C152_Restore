@interface ASFriendNotificationContainer
+ (id)containerWithNotificationRequest:(id)a3 friendUUID:(id)a4 bulletinType:(int64_t)a5;
- (ASFriendNotificationContainer)initWithNotificationRequest:(id)a3 friendUUID:(id)a4 bulletinType:(int64_t)a5;
- (NSString)friendUUID;
- (UNNotificationRequest)notificationRequest;
- (int64_t)notificationRequestType;
@end

@implementation ASFriendNotificationContainer

+ (id)containerWithNotificationRequest:(id)a3 friendUUID:(id)a4 bulletinType:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[ASFriendNotificationContainer alloc] initWithNotificationRequest:v8 friendUUID:v7 bulletinType:a5];

  return v9;
}

- (ASFriendNotificationContainer)initWithNotificationRequest:(id)a3 friendUUID:(id)a4 bulletinType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASFriendNotificationContainer;
  v11 = [(ASFriendNotificationContainer *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_notificationRequest, a3);
    objc_storeStrong((id *)&v12->_friendUUID, a4);
    v12->_notificationRequestType = a5;
  }

  return v12;
}

- (UNNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (NSString)friendUUID
{
  return self->_friendUUID;
}

- (int64_t)notificationRequestType
{
  return self->_notificationRequestType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friendUUID, 0);
  objc_storeStrong((id *)&self->_notificationRequest, 0);
}

@end