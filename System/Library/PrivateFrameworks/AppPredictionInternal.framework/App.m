@interface App
@end

@implementation App

id __40___App_getGroupsFromNotificationStacks___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 count])
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F4B418]) initWithNotifications:v2 useDigestOrder:1];
  }
  else
  {
    v4 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      int v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_INFO, "[%@] Empty notification stack. Skipping.", (uint8_t *)&v8, 0xCu);
    }
    v3 = 0;
  }

  return v3;
}

id __19___App_setBundleId__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = [v2 bundleId];

  if (v3)
  {
    v4 = [v2 bundleId];
  }
  else
  {
    v5 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      int v8 = [v2 groupId];
      int v10 = 138412546;
      v11 = v7;
      __int16 v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_INFO, "[%@] Missing bundle ID for group with ID %@", (uint8_t *)&v10, 0x16u);
    }
    v4 = 0;
  }

  return v4;
}

uint64_t __46___App_setRankedGroupsFromNotificationGroups___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a2;
  [a3 appSpecifiedScore];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  v7 = NSNumber;
  [v5 appSpecifiedScore];
  double v9 = v8;

  int v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

uint64_t __46___App_setRankedGroupsFromNotificationGroups___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isCommunicationGroup];
}

uint64_t __46___App_setRankedGroupsFromNotificationGroups___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isCommunicationGroup] ^ 1;
}

uint64_t __46___App_setRankedGroupsFromNotificationGroups___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 hasPreviewableAttachment];
}

uint64_t __46___App_setRankedGroupsFromNotificationGroups___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 hasPreviewableAttachment] ^ 1;
}

uint64_t __46___App_setRankedGroupsFromNotificationGroups___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 hasPreviewableAttachment];
}

uint64_t __46___App_setRankedGroupsFromNotificationGroups___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 hasPreviewableAttachment] ^ 1;
}

uint64_t __46___App_setRankedGroupsFromNotificationGroups___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) containsObject:a2] ^ 1;
}

@end