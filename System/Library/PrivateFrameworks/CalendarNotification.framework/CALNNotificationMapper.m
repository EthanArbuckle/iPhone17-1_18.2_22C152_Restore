@interface CALNNotificationMapper
+ (id)notificationFromNotificationRecord:(id)a3;
+ (id)notificationRecordFromNotificationRequest:(id)a3;
+ (id)notificationRecordsFromNotifications:(id)a3;
+ (id)notificationRequestFromNotificationRecord:(id)a3;
@end

@implementation CALNNotificationMapper

+ (id)notificationRequestFromNotificationRecord:(id)a3
{
  id v3 = a3;
  v4 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[CALNNotificationMapper notificationRequestFromNotificationRecord:]((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  v11 = [CALNNotificationIdentifier alloc];
  v12 = [v3 sourceIdentifier];
  v13 = [v3 sourceClientIdentifier];
  v14 = [(CALNNotificationIdentifier *)v11 initWithSourceIdentifier:v12 sourceClientIdentifier:v13];

  v15 = [(CALNNotificationIdentifier *)v14 stringRepresentation];
  v16 = [v3 content];
  if (!v16)
  {
    v17 = objc_alloc_init(CALNMutableNotificationContent);
    v16 = (void *)[(CALNMutableNotificationContent *)v17 copy];
  }
  v18 = +[CALNNotificationRequest requestWithIdentifier:v15 content:v16];
  v19 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    +[CALNNotificationMapper notificationRequestFromNotificationRecord:]();
  }

  return v18;
}

+ (id)notificationRecordFromNotificationRequest:(id)a3
{
  id v3 = a3;
  v4 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[CALNNotificationMapper notificationRecordFromNotificationRequest:]((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  v11 = [CALNNotificationIdentifier alloc];
  v12 = [v3 identifier];
  v13 = [(CALNNotificationIdentifier *)v11 initWithStringRepresentation:v12];

  if (v13)
  {
    v14 = [(CALNNotificationIdentifier *)v13 sourceIdentifier];
    v15 = [(CALNNotificationIdentifier *)v13 sourceClientIdentifier];
    v16 = [CALNNotificationRecord alloc];
    v17 = [v3 content];
    v18 = [(CALNNotificationRecord *)v16 initWithSourceIdentifier:v14 sourceClientIdentifier:v15 content:v17];

    v19 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      +[CALNNotificationMapper notificationRecordFromNotificationRequest:]();
    }
  }
  else
  {
    v14 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[CALNNotificationMapper notificationRecordFromNotificationRequest:](v14);
    }
    v18 = 0;
  }

  return v18;
}

+ (id)notificationFromNotificationRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[CALNNotificationMapper notificationFromNotificationRecord:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

  v12 = [a1 notificationRequestFromNotificationRecord:v4];
  v13 = [v4 content];
  v14 = [v13 date];

  v15 = +[CALNNotification notificationWithRequest:v12 date:v14];
  v16 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    +[CALNNotificationMapper notificationFromNotificationRecord:]();
  }

  return v15;
}

+ (id)notificationRecordsFromNotifications:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a3;
  uint64_t v6 = [v4 array];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __63__CALNNotificationMapper_notificationRecordsFromNotifications___block_invoke;
  v13 = &unk_2645C0F80;
  id v14 = v6;
  id v15 = a1;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v10];

  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

void __63__CALNNotificationMapper_notificationRecordsFromNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  id v4 = [a2 request];
  id v5 = [v3 notificationRecordFromNotificationRequest:v4];

  [*(id *)(a1 + 32) addObject:v5];
}

+ (void)notificationRequestFromNotificationRecord:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_2(&dword_2216BB000, v0, v1, "Transformed notification record to notification request. Record: %@. Request: %@.");
}

+ (void)notificationRequestFromNotificationRecord:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)notificationRecordFromNotificationRequest:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_2216BB000, log, OS_LOG_TYPE_ERROR, "Cannot transform notification request to notification record since notification identifier is nil.", v1, 2u);
}

+ (void)notificationRecordFromNotificationRequest:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_2(&dword_2216BB000, v0, v1, "Transformed notification request to notification record. Request: %@. Record: %@.");
}

+ (void)notificationRecordFromNotificationRequest:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)notificationFromNotificationRecord:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_2(&dword_2216BB000, v0, v1, "Transformed notification record to notification. Record: %@. Notification: %@.");
}

+ (void)notificationFromNotificationRecord:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end