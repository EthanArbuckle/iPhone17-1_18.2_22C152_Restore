@interface CALNEventInvitationNotificationDataSourceUtils
+ (id)eventForEventInvitation:(id)a3 inEventStore:(id)a4;
+ (id)eventForNotificationOfType:(int)a3 withSourceClientIdentifier:(id)a4 inEventStore:(id)a5 withNotificationReferenceProvider:(id)a6;
+ (id)expirationDateForEventInvitation:(id)a3;
+ (void)clearEventInvitationOfType:(int)a3 withSourceClientIdentifier:(id)a4 inEventStore:(id)a5 withNotificationReferenceProvider:(id)a6;
@end

@implementation CALNEventInvitationNotificationDataSourceUtils

+ (id)eventForNotificationOfType:(int)a3 withSourceClientIdentifier:(id)a4 inEventStore:(id)a5 withNotificationReferenceProvider:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[CALNNotificationDataSourceUtils notificationReferenceOfType:v8 withSourceClientIdentifier:v9 inEventStore:v10 withNotificationReferenceProvider:a6];
  v12 = v11;
  if (v11)
  {
    v13 = [v11 notification];
    v14 = v13;
    if (v13)
    {
      v15 = [v13 URL];
      v16 = [v10 _eventWithURI:v15 checkValid:1];

      goto LABEL_10;
    }
    v17 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[CALNEventInvitationNotificationDataSourceUtils eventForNotificationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:]();
    }
  }
  else
  {
    v14 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[CALNEventInvitationNotificationDataSourceUtils eventForNotificationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:]();
    }
  }
  v16 = 0;
LABEL_10:

  return v16;
}

+ (id)eventForEventInvitation:(id)a3 inEventStore:(id)a4
{
  id v5 = a4;
  v6 = [a3 URL];
  v7 = [v5 _eventWithURI:v6 checkValid:1];

  if (!v7)
  {
    uint64_t v8 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CALNEventInvitationNotificationDataSourceUtils eventForEventInvitation:inEventStore:]();
    }
  }
  return v7;
}

+ (id)expirationDateForEventInvitation:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 hasRecurrenceRules])
  {
    v4 = [MEMORY[0x263EFF910] distantFuture];
  }
  else
  {
    id v5 = [MEMORY[0x263EFF910] CalSimulatedDateForNow];
    v6 = [v3 endDate];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v7 = objc_msgSend(v3, "attendees", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) proposedStartDate];
          if ([v12 isAfterDate:v6])
          {
            id v13 = v12;

            v6 = v13;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [v6 timeIntervalSinceDate:v5];
    double v15 = v14;
    v16 = [MEMORY[0x263EFF910] date];
    v4 = [v16 dateByAddingTimeInterval:v15];
  }
  return v4;
}

+ (void)clearEventInvitationOfType:(int)a3 withSourceClientIdentifier:(id)a4 inEventStore:(id)a5 withNotificationReferenceProvider:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  v11 = +[CALNEventInvitationNotificationDataSourceUtils eventForNotificationOfType:v8 withSourceClientIdentifier:v9 inEventStore:v10 withNotificationReferenceProvider:a6];
  v12 = v11;
  if (v11)
  {
    if ([v11 invitationStatus])
    {
      id v16 = 0;
      char v13 = [v10 setInvitationStatus:1 forEvent:v12 error:&v16];
      double v14 = v16;
      if ((v13 & 1) == 0)
      {
        double v15 = +[CALNLogSubsystem calendar];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          +[CALNEventInvitationNotificationDataSourceUtils clearEventInvitationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:]();
        }
      }
    }
    else
    {
      double v14 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v9;
        _os_log_impl(&dword_2216BB000, v14, OS_LOG_TYPE_DEFAULT, "Not clearing invitation status for sourceClientIdentifier %{public}@ because it is set to none", buf, 0xCu);
      }
    }
  }
  else
  {
    double v14 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[CALNEventInvitationNotificationDataSourceUtils clearEventInvitationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:]();
    }
  }
}

+ (void)eventForNotificationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to get notification reference with sourceClientIdentifier %{public}@", v2, v3, v4, v5, v6);
}

+ (void)eventForNotificationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to get notification from notification reference. sourceClientIdentifier = %{public}@", v2, v3, v4, v5, v6);
}

+ (void)eventForEventInvitation:inEventStore:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to find event for notification using url (%{public}@)", v2, v3, v4, v5, v6);
}

+ (void)clearEventInvitationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to get event (%{public}@) when attempting to clear invitation notification", v2, v3, v4, v5, v6);
}

+ (void)clearEventInvitationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2216BB000, v1, OS_LOG_TYPE_ERROR, "Failed to clear invitation status for event (%{public}@): %@", v2, 0x16u);
}

@end