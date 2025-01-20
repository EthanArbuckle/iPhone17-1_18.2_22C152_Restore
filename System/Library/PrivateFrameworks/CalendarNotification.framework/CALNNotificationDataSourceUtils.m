@interface CALNNotificationDataSourceUtils
+ (id)calendarWithSourceClientIdentifier:(id)a3 inEventStore:(id)a4;
+ (id)eventWithSourceClientIdentifier:(id)a3 inEventStore:(id)a4;
+ (id)notificationReferenceOfType:(int)a3 withSourceClientIdentifier:(id)a4 inEventStore:(id)a5 withNotificationReferenceProvider:(id)a6;
+ (id)objectIDWithSourceClientIdentifier:(id)a3;
+ (id)sourceClientIdentifierForNotification:(id)a3;
+ (void)clearSharedCalendarInvitationResponseWithSourceClientIdentifier:(id)a3 inEventStore:(id)a4;
+ (void)hideCalendarFromNotificationCenter:(id)a3 inEventStore:(id)a4;
+ (void)reportSharedCalendarInvitationAsJunkWithSourceClientIdentifier:(id)a3 inEventStore:(id)a4;
+ (void)respondToSharedCalendarInvitationWithSourceClientIdentifier:(id)a3 inEventStore:(id)a4 withDataAccessExpressConnection:(id)a5 accept:(BOOL)a6;
@end

@implementation CALNNotificationDataSourceUtils

+ (id)objectIDWithSourceClientIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [NSURL URLWithString:v3];
  if (v4)
  {
    v5 = [MEMORY[0x263F04BA8] objectIDWithURL:v4];
    if (v5) {
      goto LABEL_9;
    }
    v6 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[CALNNotificationDataSourceUtils objectIDWithSourceClientIdentifier:]();
    }
  }
  else
  {
    v6 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[CALNNotificationDataSourceUtils objectIDWithSourceClientIdentifier:]();
    }
    v5 = 0;
  }

LABEL_9:
  return v5;
}

+ (id)sourceClientIdentifierForNotification:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 type];
  if (v4 > 0xE)
  {
    v6 = 0;
  }
  else
  {
    if (((1 << v4) & 0x7EF0) != 0)
    {
      v5 = [v3 objectID];
      [v5 stringRepresentation];
    }
    else
    {
      v5 = [v3 URL];
      [v5 absoluteString];
    v6 = };
  }
  return v6;
}

+ (id)notificationReferenceOfType:(int)a3 withSourceClientIdentifier:(id)a4 inEventStore:(id)a5 withNotificationReferenceProvider:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((v8 - 3) < 3)
  {
    v14 = [a1 objectIDWithSourceClientIdentifier:v10];
    if (v14) {
      goto LABEL_13;
    }
  }
  else
  {
    if (v8 >= 2)
    {
      if (v8 != 2) {
        goto LABEL_17;
      }
      v13 = [NSURL URLWithString:v10];
      if (v13)
      {
        v15 = [a1 calendarWithSourceClientIdentifier:v10 inEventStore:v11];
        v14 = [v15 objectID];
      }
      else
      {
        v16 = +[CALNLogSubsystem calendar];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          +[CALNNotificationDataSourceUtils notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:]();
        }

        v14 = 0;
      }
    }
    else
    {
      v13 = [a1 eventWithSourceClientIdentifier:v10 inEventStore:v11];
      v14 = [v13 objectID];
    }

    if (v14)
    {
LABEL_13:
      v17 = [v12 notificationReferenceForObjectID:v14 withType:v8 inEventStore:v11];
      if (!v17)
      {
        v18 = +[CALNLogSubsystem defaultCategory];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          +[CALNNotificationDataSourceUtils notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:]();
        }
      }
      goto LABEL_20;
    }
  }
LABEL_17:
  v14 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    +[CALNNotificationDataSourceUtils notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:]((uint64_t)v10, v8, v14);
  }
  v17 = 0;
LABEL_20:

  return v17;
}

+ (id)eventWithSourceClientIdentifier:(id)a3 inEventStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [NSURL URLWithString:v5];
  if (v7)
  {
    uint64_t v8 = [v6 _eventWithURI:v7 checkValid:0];
  }
  else
  {
    v9 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[CALNNotificationDataSourceUtils eventWithSourceClientIdentifier:inEventStore:]();
    }

    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)calendarWithSourceClientIdentifier:(id)a3 inEventStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = [NSURL URLWithString:v5];
    if (v7)
    {
      uint64_t v8 = [v6 calendarWithExternalURI:v7];
      v9 = v8;
      if (v8)
      {
        v9 = v8;
        id v10 = v9;
      }
      else
      {
        id v11 = +[CALNLogSubsystem defaultCategory];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          +[CALNNotificationDataSourceUtils calendarWithSourceClientIdentifier:inEventStore:]();
        }

        id v10 = 0;
      }
    }
    else
    {
      v9 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[CALNNotificationDataSourceUtils calendarWithSourceClientIdentifier:inEventStore:]();
      }
      id v10 = 0;
    }
  }
  else
  {
    v7 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CALNNotificationDataSourceUtils calendarWithSourceClientIdentifier:inEventStore:](v7);
    }
    id v10 = 0;
  }

  return v10;
}

+ (void)respondToSharedCalendarInvitationWithSourceClientIdentifier:(id)a3 inEventStore:(id)a4 withDataAccessExpressConnection:(id)a5 accept:(BOOL)a6
{
  BOOL v6 = a6;
  id v21 = a4;
  id v10 = a5;
  id v11 = [a1 calendarWithSourceClientIdentifier:a3 inEventStore:v21];
  id v12 = v11;
  if (v11)
  {
    uint64_t v13 = v6 ? 1 : 2;
    v14 = [v11 calendarIdentifier];
    v15 = [v12 source];
    v16 = [v15 externalID];
    [v10 respondToSharedCalendarInvite:v13 forCalendarWithID:v14 accountID:v16 queue:MEMORY[0x263EF83A0] completionBlock:0];

    if (v6)
    {
      [a1 hideCalendarFromNotificationCenter:v12 inEventStore:v21];
      v17 = (void *)MEMORY[0x263F04BB8];
      v18 = [v12 sharedOwnerName];
      v19 = [v12 sharedOwnerEmail];
      v20 = [v12 sharedOwnerPhoneNumber];
      [v17 recordRecentForContactWithName:v18 emailAddress:v19 phoneNumber:v20];
    }
  }
}

+ (void)reportSharedCalendarInvitationAsJunkWithSourceClientIdentifier:(id)a3 inEventStore:(id)a4
{
  unint64_t v4 = [a1 calendarWithSourceClientIdentifier:a3 inEventStore:a4];
  if (v4)
  {
    id v5 = v4;
    [v4 setIsJunk:1];
    unint64_t v4 = v5;
  }
}

+ (void)hideCalendarFromNotificationCenter:(id)a3 inEventStore:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v13[0] = v5;
  BOOL v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  uint64_t v8 = [v6 arrayWithObjects:v13 count:1];
  id v12 = 0;
  char v9 = [v7 hideCalendarsFromNotificationCenter:v8 error:&v12];

  id v10 = v12;
  if ((v9 & 1) == 0)
  {
    id v11 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[CALNNotificationDataSourceUtils hideCalendarFromNotificationCenter:inEventStore:](v5);
    }
  }
}

+ (void)clearSharedCalendarInvitationResponseWithSourceClientIdentifier:(id)a3 inEventStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 objectIDWithSourceClientIdentifier:v6];
  char v9 = v8;
  if (v8)
  {
    if ([v8 entityType] == 16)
    {
      id v10 = [v7 publicObjectWithObjectID:v9];
      if (v10)
      {
        id v14 = 0;
        char v11 = [v7 removeInviteReplyNotification:v10 error:&v14];
        id v12 = v14;
        if ((v11 & 1) == 0)
        {
          uint64_t v13 = +[CALNLogSubsystem defaultCategory];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            +[CALNNotificationDataSourceUtils clearSharedCalendarInvitationResponseWithSourceClientIdentifier:inEventStore:]();
          }
        }
      }
      else
      {
        id v12 = +[CALNLogSubsystem defaultCategory];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          +[CALNNotificationDataSourceUtils clearSharedCalendarInvitationResponseWithSourceClientIdentifier:inEventStore:]();
        }
      }
    }
    else
    {
      id v10 = +[CALNLogSubsystem defaultCategory];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[CALNNotificationDataSourceUtils clearSharedCalendarInvitationResponseWithSourceClientIdentifier:inEventStore:](v9);
      }
    }
  }
}

+ (void)objectIDWithSourceClientIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to construct URL from sourceClientIdentifier (%{public}@)", v2, v3, v4, v5, v6);
}

+ (void)objectIDWithSourceClientIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to construct objectID from sourceClientIdentifier (%{public}@)", v2, v3, v4, v5, v6);
}

+ (void)notificationReferenceOfType:(os_log_t)log withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2216BB000, log, OS_LOG_TYPE_ERROR, "Failed to get objectID for notification of type %d with sourceClientIdentifier %{public}@", (uint8_t *)v3, 0x12u);
}

+ (void)notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to load notification reference for sourceClientIdentifier (%{public}@", v2, v3, v4, v5, v6);
}

+ (void)notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to construct calendarURI for shared calendar invitation with sourceClientIdentifier = %{public}@", v2, v3, v4, v5, v6);
}

+ (void)eventWithSourceClientIdentifier:inEventStore:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to construct eventURI with sourceClientIdentifier %{public}@", v2, v3, v4, v5, v6);
}

+ (void)calendarWithSourceClientIdentifier:(os_log_t)log inEventStore:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2216BB000, log, OS_LOG_TYPE_ERROR, "sourceClientIdentifier was nil. Bailing.", v1, 2u);
}

+ (void)calendarWithSourceClientIdentifier:inEventStore:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to construct calendarURI for sourceClientIdentifier (%{public}@)", v2, v3, v4, v5, v6);
}

+ (void)calendarWithSourceClientIdentifier:inEventStore:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to get calendar for sourceClientIdentifier (%{public}@).", v2, v3, v4, v5, v6);
}

+ (void)hideCalendarFromNotificationCenter:(void *)a1 inEventStore:.cold.1(void *a1)
{
  uint64_t v1 = [a1 objectID];
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0(&dword_2216BB000, v2, v3, "Failed to hide calendar (%{public}@) from notification center: %@", v4, v5, v6, v7, v8);
}

+ (void)clearSharedCalendarInvitationResponseWithSourceClientIdentifier:inEventStore:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to get invite reply notification with sourceClientIdentifier %{public}@", v2, v3, v4, v5, v6);
}

+ (void)clearSharedCalendarInvitationResponseWithSourceClientIdentifier:inEventStore:.cold.2()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_4();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_2216BB000, v1, OS_LOG_TYPE_ERROR, "Failed to remove invite reply notification with sourceClientIdentifier %{public}@: %@", v2, 0x16u);
}

+ (void)clearSharedCalendarInvitationResponseWithSourceClientIdentifier:(void *)a1 inEventStore:.cold.3(void *a1)
{
  os_log_t v1 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "entityType"));
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2216BB000, v2, v3, "Unexpected entity type %{public}@ when trying to get EKInviteReplyNotification with sourceClientIdentifier %{public}@", v4, v5, v6, v7, v8);
}

@end