@interface ATXLockScreenNotificationRanker
+ (id)rankNewNotificationIntoNotificationArrays:(id)a3 newNotification:(id)a4 notificationArrayIndex:(unint64_t)a5 error:(id *)a6;
+ (id)rankNewNotificationIntoNotificationArrays:(id)a3 newNotificationArray:(id)a4 newNotification:(id)a5 error:(id *)a6;
+ (id)rankNotificationArrays:(id)a3 error:(id *)a4;
@end

@implementation ATXLockScreenNotificationRanker

+ (id)rankNotificationArrays:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[ATXLockScreenNotificationRanker rankNotificationArrays:error:]();
  }

  if (v5 || !a4)
  {
    v11 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_51_0);
    v9 = [v11 sortedArrayUsingComparator:&__block_literal_global_55_1];

    v10 = objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_58_0);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28798];
    uint64_t v13 = *MEMORY[0x1E4F28228];
    v14[0] = @"Missing notificationArrays argument";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v7 errorWithDomain:v8 code:22 userInfo:v9];
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

ATXUserNotificationGroup *__64__ATXLockScreenNotificationRanker_rankNotificationArrays_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[ATXUserNotificationGroup alloc] initWithNotifications:v2];

  return v3;
}

uint64_t __64__ATXLockScreenNotificationRanker_rankNotificationArrays_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __64__ATXLockScreenNotificationRanker_rankNotificationArrays_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 notifications];
}

+ (id)rankNewNotificationIntoNotificationArrays:(id)a3 newNotification:(id)a4 notificationArrayIndex:(unint64_t)a5 error:(id *)a6
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (v10)
  {
    if ([v10 count] > a5)
    {
      v12 = [v10 objectAtIndexedSubscript:a5];
      uint64_t v13 = (void *)[v10 mutableCopy];
      [v13 removeObjectAtIndex:a5];
      a6 = [a1 rankNewNotificationIntoNotificationArrays:v13 newNotificationArray:v12 newNotification:v11 error:a6];

      goto LABEL_10;
    }
    uint64_t v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"notificationArrayIndex=%ld is out of bounds for notificationArrays length=%ld", a5, objc_msgSend(v10, "count"));
    v18 = (void *)v17;
    if (a6)
    {
      v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28798];
      uint64_t v23 = *MEMORY[0x1E4F28228];
      uint64_t v24 = v17;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      *a6 = [v19 errorWithDomain:v20 code:22 userInfo:v21];
    }
  }
  else
  {
    if (!a6) {
      goto LABEL_10;
    }
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28798];
    uint64_t v25 = *MEMORY[0x1E4F28228];
    v26[0] = @"Missing notificationArrays argument";
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    *a6 = [v14 errorWithDomain:v15 code:22 userInfo:v16];
  }
  a6 = 0;
LABEL_10:

  return a6;
}

+ (id)rankNewNotificationIntoNotificationArrays:(id)a3 newNotificationArray:(id)a4 newNotification:(id)a5 error:(id *)a6
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    +[ATXLockScreenNotificationRanker rankNewNotificationIntoNotificationArrays:newNotificationArray:newNotification:error:]();
  }

  if (v9 || !a6)
  {
    if (v11 || !a6)
    {
      if (v10 || !a6)
      {
        uint64_t v23 = [v10 arrayByAddingObject:v11];

        uint64_t v24 = [[ATXUserNotificationGroup alloc] initWithNotifications:v23];
        uint64_t v25 = objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_70_2);
        v26 = [v25 arrayByAddingObject:v24];
        v27 = [v26 sortedArrayUsingComparator:&__block_literal_global_72_0];

        v28 = (void *)MEMORY[0x1E4F93BB8];
        v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "indexOfObject:", v24));
        v30 = NSNumber;
        v31 = [(ATXUserNotificationGroup *)v24 notifications];
        v32 = objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v31, "indexOfObject:", v11));
        v19 = [v28 tupleWithFirst:v29 second:v32];

        id v10 = (id)v23;
      }
      else
      {
        v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *MEMORY[0x1E4F28798];
        uint64_t v33 = *MEMORY[0x1E4F28228];
        v34 = @"Missing newNotificationArray argument";
        id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        [v21 errorWithDomain:v22 code:22 userInfo:v10];
        v19 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_10;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28798];
    uint64_t v35 = *MEMORY[0x1E4F28228];
    v36 = @"Missing newNotification argument";
    uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
    v16 = &v36;
    uint64_t v17 = &v35;
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28798];
    uint64_t v37 = *MEMORY[0x1E4F28228];
    v38[0] = @"Missing notificationArrays argument";
    uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
    v16 = (__CFString **)v38;
    uint64_t v17 = &v37;
  }
  v18 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
  *a6 = [v13 errorWithDomain:v14 code:22 userInfo:v18];

  v19 = 0;
LABEL_10:

  return v19;
}

ATXUserNotificationGroup *__120__ATXLockScreenNotificationRanker_rankNewNotificationIntoNotificationArrays_newNotificationArray_newNotification_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[ATXUserNotificationGroup alloc] initWithNotifications:v2];

  return v3;
}

uint64_t __120__ATXLockScreenNotificationRanker_rankNewNotificationIntoNotificationArrays_newNotificationArray_newNotification_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

+ (void)rankNotificationArrays:error:.cold.1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "[%@] Generating lock screen notification ranking", v3, v4, v5, v6, 2u);
}

+ (void)rankNewNotificationIntoNotificationArrays:newNotificationArray:newNotification:error:.cold.1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "[%@] Sorting newNotification into notificationArray", v3, v4, v5, v6, 2u);
}

@end