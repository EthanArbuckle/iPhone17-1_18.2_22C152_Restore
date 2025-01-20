@interface IMSatelliteSuppressedNotificationChatItem
- (IMHandle)handle;
- (id)_initWithHandle:(id)a3;
@end

@implementation IMSatelliteSuppressedNotificationChatItem

- (id)_initWithHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMSatelliteSuppressedNotificationChatItem;
  v6 = [(IMChatItem *)&v9 _initWithItem:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong(v6 + 7, a3);
  }

  return v7;
}

- (IMHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
}

@end