@interface BBSectionInfo(BLTSettingSyncLevel)
- (void)bltApplyNotificationLevel:()BLTSettingSyncLevel;
@end

@implementation BBSectionInfo(BLTSettingSyncLevel)

- (void)bltApplyNotificationLevel:()BLTSettingSyncLevel
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a3 == 3)
  {
    [a1 setCriticalAlertSetting:1];
  }
  else if (a3)
  {
    [a1 setAuthorizationStatus:2];
    [a1 setNotificationCenterSetting:2];
    if (a3 == 2) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
    [a1 setLockScreenSetting:v5];
    [a1 setAlertType:a3 == 2];
    uint64_t v6 = [a1 pushSettings];
    uint64_t v7 = (8 * (int)v6) & 0x28;
    if (v7)
    {
      uint64_t v8 = v7 | v6;
      uint64_t v9 = v6 & ~v7;
      if (a3 == 2) {
        uint64_t v10 = v8;
      }
      else {
        uint64_t v10 = v9;
      }
      [a1 setPushSettings:v10];
    }
  }
  else
  {
    [a1 setAuthorizationStatus:1];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = objc_msgSend(a1, "subsections", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) bltApplyNotificationLevel:a3];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

@end