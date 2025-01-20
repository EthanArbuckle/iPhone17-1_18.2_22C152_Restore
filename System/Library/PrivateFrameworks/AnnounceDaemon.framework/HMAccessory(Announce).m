@interface HMAccessory(Announce)
- (id)an_announceSettingFromAccessorySettings;
@end

@implementation HMAccessory(Announce)

- (id)an_announceSettingFromAccessorySettings
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 settings];
  v3 = [v2 rootGroup];
  v4 = [v3 groups];
  v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_30);

  if (v5)
  {
    v6 = [v5 settings];
    v7 = objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_11);

    if (v7)
    {
      v8 = [v7 value];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    if (ANLogHandleAccessory_Announce_once != -1) {
      dispatch_once(&ANLogHandleAccessory_Announce_once, &__block_literal_global_15);
    }
    v9 = (id)ANLogHandleAccessory_Announce_logger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412546;
      v12 = &stru_1F34A0E10;
      __int16 v13 = 2112;
      v14 = a1;
      _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_ERROR, "%@Failed to find Announce Setting Group in Accessory Settings %@", (uint8_t *)&v11, 0x16u);
    }

    v8 = 0;
  }

  return v8;
}

@end