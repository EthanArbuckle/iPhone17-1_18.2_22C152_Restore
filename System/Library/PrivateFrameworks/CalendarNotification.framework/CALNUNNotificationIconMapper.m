@interface CALNUNNotificationIconMapper
- (CALNNotificationIconCache)notificationIconCache;
- (CALNUNNotificationIconMapper)initWithNotificationIconCache:(id)a3;
- (id)iconIdentifierFromUNNotificationIcon:(id)a3;
- (id)unNotificationIconFromIconIdentifier:(id)a3;
@end

@implementation CALNUNNotificationIconMapper

- (CALNUNNotificationIconMapper)initWithNotificationIconCache:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNUNNotificationIconMapper;
  v6 = [(CALNUNNotificationIconMapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_notificationIconCache, a3);
  }

  return v7;
}

- (id)iconIdentifierFromUNNotificationIcon:(id)a3
{
  id v4 = a3;
  id v5 = [v4 path];
  v6 = [(CALNUNNotificationIconMapper *)self notificationIconCache];
  v7 = [v6 iconIdentifierForCachedIconPath:v5];

  if (!v7)
  {
    v8 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(CALNUNNotificationIconMapper *)(uint64_t)v5 iconIdentifierFromUNNotificationIcon:v8];
    }
  }
  return v7;
}

- (id)unNotificationIconFromIconIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNUNNotificationIconMapper *)self notificationIconCache];
  v6 = [v5 cachedIconPathForIconIdentifier:v4];

  if (v6)
  {
    v7 = [MEMORY[0x263F1DF40] iconAtPath:v6];
  }
  else
  {
    v8 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CALNUNNotificationIconMapper unNotificationIconFromIconIdentifier:]((uint64_t)v4, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (CALNNotificationIconCache)notificationIconCache
{
  return self->_notificationIconCache;
}

- (void).cxx_destruct
{
}

- (void)iconIdentifierFromUNNotificationIcon:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2216BB000, log, OS_LOG_TYPE_ERROR, "Could not get icon identifier from icon path = %{public}@, notification icon = %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)unNotificationIconFromIconIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Could not get icon path for icon identifier = %{public}@", (uint8_t *)&v2, 0xCu);
}

@end