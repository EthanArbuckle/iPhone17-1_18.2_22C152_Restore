@interface ATXUserNotificationDigest
@end

@implementation ATXUserNotificationDigest

uint64_t __75__ATXUserNotificationDigest_EngagementTracking__computeNumDigestExpansions__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  if (!v3) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __75__ATXUserNotificationDigest_EngagementTracking__computeNumDigestExpansions__block_invoke_cold_1((uint64_t)v3, v7);
    }

    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3B8];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v8 raise:v9, @"Encountered unknown event, expected ATXNotificationGroupEvent. Received: %@", v11 format];

    goto LABEL_8;
  }
  if ([v3 eventType] != 10)
  {
LABEL_8:
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  v4 = [v3 uuid];
  v5 = [*(id *)(a1 + 32) uuid];
  uint64_t v6 = [v4 isEqual:v5];

LABEL_9:
  return v6;
}

void __75__ATXUserNotificationDigest_EngagementTracking__computeNumDigestExpansions__block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 error];

  if (v4)
  {
    v5 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [*(id *)(a1 + 32) uuid];
      v7 = [v3 error];
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Could not compute digest expansions for: %{public}@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t __75__ATXUserNotificationDigest_EngagementTracking__computeNumDigestExpansions__block_invoke_28(uint64_t result)
{
  return result;
}

void __75__ATXUserNotificationDigest_EngagementTracking__computeNumDigestExpansions__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Encountered unknown event, expected ATXNotificationGroupEvent. Received: %@", (uint8_t *)&v5, 0xCu);
}

@end