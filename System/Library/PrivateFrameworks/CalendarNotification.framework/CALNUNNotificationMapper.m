@interface CALNUNNotificationMapper
- (CALNUNNotificationMapper)initWithNotificationRequestMapper:(id)a3;
- (CALNUNNotificationRequestMapper)notificationRequestMapper;
- (id)_calnNotificationFromUNNotification:(id)a3;
- (id)calnNotificationFromUNNotification:(id)a3;
- (id)calnNotificationsFromUNNotifications:(id)a3;
@end

@implementation CALNUNNotificationMapper

- (CALNUNNotificationMapper)initWithNotificationRequestMapper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNUNNotificationMapper;
  v6 = [(CALNUNNotificationMapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_notificationRequestMapper, a3);
  }

  return v7;
}

- (id)calnNotificationFromUNNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNUNNotificationMapper *)self notificationRequestMapper];
  v6 = [v4 request];
  v7 = [v5 calnNotificationRequestFromUNNotificationRequest:v6];

  v8 = [v4 date];

  objc_super v9 = +[CALNNotification notificationWithRequest:v7 date:v8];

  return v9;
}

- (id)calnNotificationsFromUNNotifications:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a3;
  v6 = [v4 array];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __65__CALNUNNotificationMapper_calnNotificationsFromUNNotifications___block_invoke;
  v13 = &unk_2645C0EB8;
  v14 = self;
  id v15 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v10];

  v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  return v8;
}

void __65__CALNUNNotificationMapper_calnNotificationsFromUNNotifications___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _calnNotificationFromUNNotification:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)_calnNotificationFromUNNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNUNNotificationMapper *)self notificationRequestMapper];
  v6 = [v4 request];
  id v7 = [v5 calnNotificationRequestFromUNNotificationRequest:v6];

  v8 = [v4 date];

  objc_super v9 = +[CALNNotification notificationWithRequest:v7 date:v8];

  return v9;
}

- (CALNUNNotificationRequestMapper)notificationRequestMapper
{
  return self->_notificationRequestMapper;
}

- (void).cxx_destruct
{
}

@end