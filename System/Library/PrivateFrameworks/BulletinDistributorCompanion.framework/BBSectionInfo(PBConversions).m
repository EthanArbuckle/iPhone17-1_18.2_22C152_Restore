@interface BBSectionInfo(PBConversions)
- (id)dataProviderIDs;
- (id)factorySectionID;
- (uint64_t)blt_overrideSendToNotificationCenter;
- (uint64_t)enableAlertsForGizmo:()PBConversions;
- (uint64_t)setDataProviderIDs:()PBConversions;
- (uint64_t)setSubsections:()PBConversions;
- (uint64_t)updateAlertingStatusForGizmoWithAlertsEnabled:()PBConversions NCEnabled:;
- (unint64_t)blt_overrideShowsAlerts;
- (void)applyKeypaths:()PBConversions from:;
- (void)setDisplayName:()PBConversions;
- (void)setFactorySectionID:()PBConversions;
- (void)setIcon:()PBConversions;
@end

@implementation BBSectionInfo(PBConversions)

- (void)setDisplayName:()PBConversions
{
}

- (void)setIcon:()PBConversions
{
}

- (uint64_t)setSubsections:()PBConversions
{
  uint64_t v4 = [a3 copy];
  *(void *)(a1 + (int)*MEMORY[0x263F2BD00]) = v4;
  return MEMORY[0x270F9A758]();
}

- (void)setFactorySectionID:()PBConversions
{
}

- (id)factorySectionID
{
  return *(id *)(a1 + (int)*MEMORY[0x263F2BCE8]);
}

- (uint64_t)setDataProviderIDs:()PBConversions
{
  uint64_t v4 = [a3 copy];
  *(void *)(a1 + (int)*MEMORY[0x263F2BCD8]) = v4;
  return MEMORY[0x270F9A758]();
}

- (id)dataProviderIDs
{
  return *(id *)(a1 + (int)*MEMORY[0x263F2BCD8]);
}

- (uint64_t)enableAlertsForGizmo:()PBConversions
{
  uint64_t v5 = [a1 pushSettings];
  if (a3)
  {
    uint64_t v6 = 2;
    [a1 setAlertType:2];
    unint64_t v7 = v5 | 0x20;
  }
  else
  {
    [a1 setAlertType:0];
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFDFLL;
    uint64_t v6 = 1;
  }
  [a1 setPushSettings:v7];
  [a1 setLockScreenSetting:v6];
  uint64_t result = [a1 setShowsOnExternalDevices:a3];
  if (a3)
  {
    return [a1 setNotificationCenterSetting:2];
  }
  return result;
}

- (uint64_t)updateAlertingStatusForGizmoWithAlertsEnabled:()PBConversions NCEnabled:
{
  if (a4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  if (a3) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = v5;
  }
  objc_msgSend(a1, "enableAlertsForGizmo:");
  [a1 setNotificationCenterSetting:v5];
  return [a1 setAuthorizationStatus:v6];
}

- (unint64_t)blt_overrideShowsAlerts
{
  unint64_t result = [a1 allowsNotifications];
  if (result)
  {
    if ([a1 alertType]) {
      return 1;
    }
    else {
      return ((unint64_t)[a1 suppressedSettings] >> 5) & 1;
    }
  }
  return result;
}

- (uint64_t)blt_overrideSendToNotificationCenter
{
  uint64_t result = [a1 allowsNotifications];
  if (result) {
    return (objc_msgSend(a1, "blt_overrideShowsAlerts") & 1) == 0 && objc_msgSend(a1, "notificationCenterSetting") == 2;
  }
  return result;
}

- (void)applyKeypaths:()PBConversions from:
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D607C30];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v8, "containsObject:", v14, (void)v16))
        {
          v15 = [v7 valueForKeyPath:v14];
          [a1 setValue:v15 forKeyPath:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

@end