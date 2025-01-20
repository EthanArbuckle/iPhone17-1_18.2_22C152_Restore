@interface BBSectionInfoSettings(protobuf)
- (id)blt_protobuf;
- (void)applySectionInfoSettingsFromProtobuf:()protobuf;
@end

@implementation BBSectionInfoSettings(protobuf)

- (void)applySectionInfoSettingsFromProtobuf:()protobuf
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 hasAnnounceSetting]) {
    objc_msgSend(a1, "setAnnounceSetting:", (int)objc_msgSend(v4, "announceSetting"));
  }
  if ([v4 hasScheduledDeliverySetting]) {
    objc_msgSend(a1, "setScheduledDeliverySetting:", (int)objc_msgSend(v4, "scheduledDeliverySetting"));
  }
  if (![v4 hasMuteAssertion])
  {
    [a1 setMuteAssertion:0];
    goto LABEL_19;
  }
  v5 = [v4 muteAssertion];
  int v6 = [v5 hasExpirationDate];

  if (v6)
  {
    v7 = (void *)MEMORY[0x263EFF910];
    v8 = [v4 muteAssertion];
    [v8 expirationDate];
    v9 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");

    v10 = [MEMORY[0x263F2BCB0] sectionMuteAssertionUntilDate:v9];
    [a1 setMuteAssertion:v10];
  }
  else
  {
    v11 = [v4 muteAssertion];
    v12 = [v11 sectionBulletinLists];
    uint64_t v13 = [v12 count];

    if (!v13) {
      goto LABEL_19;
    }
    v9 = [MEMORY[0x263F2BCD0] threadsMuteAssertion];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v14 = objc_msgSend(v4, "muteAssertion", 0);
    v15 = [v14 sectionBulletinLists];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v21 = (void *)MEMORY[0x263EFF910];
          [v20 expirationDate];
          v22 = objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
          v23 = [v20 threadID];
          [v9 setMutedUntilDate:v22 forThreadIdentifier:v23];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v17);
    }

    [a1 setMuteAssertion:v9];
  }

LABEL_19:
  if ([v4 hasTimeSensitiveSetting]) {
    objc_msgSend(a1, "setTimeSensitiveSetting:", (int)objc_msgSend(v4, "timeSensitiveSetting"));
  }
  if ([v4 hasUserConfiguredTimeSensitiveSetting]) {
    objc_msgSend(a1, "setUserConfiguredTimeSensitiveSetting:", objc_msgSend(v4, "userConfiguredTimeSensitiveSetting"));
  }
}

- (id)blt_protobuf
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  objc_msgSend(v2, "setAnnounceSetting:", objc_msgSend(a1, "announceSetting"));
  objc_msgSend(v2, "setTimeSensitiveSetting:", objc_msgSend(a1, "timeSensitiveSetting"));
  objc_msgSend(v2, "setScheduledDeliverySetting:", objc_msgSend(a1, "scheduledDeliverySetting"));
  v3 = [a1 muteAssertion];

  if (v3)
  {
    id v4 = objc_opt_new();
    [v2 setMuteAssertion:v4];

    v5 = [a1 muteAssertion];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v7 = [a1 muteAssertion];
    v8 = v7;
    if (isKindOfClass)
    {
      v9 = [v7 expirationDate];

      [v9 timeIntervalSinceReferenceDate];
      double v11 = v10;
      v12 = [v2 muteAssertion];
      [v12 setExpirationDate:v11];
    }
    else
    {
      objc_opt_class();
      char v13 = objc_opt_isKindOfClass();

      if (v13)
      {
        v14 = [a1 muteAssertion];
        v15 = [v14 expirationDateByThreadID];

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v27 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              v22 = objc_opt_new();
              objc_msgSend(v22, "setThreadID:", v21, (void)v26);
              v23 = [v16 objectForKeyedSubscript:v21];
              [v23 timeIntervalSinceReferenceDate];
              objc_msgSend(v22, "setExpirationDate:");

              long long v24 = [v2 muteAssertion];
              [v24 addSectionBulletinList:v22];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v18);
        }
      }
    }
  }
  if (objc_msgSend(a1, "hasUserConfiguredTimeSensitiveSetting", (void)v26)) {
    objc_msgSend(v2, "setUserConfiguredTimeSensitiveSetting:", objc_msgSend(a1, "hasUserConfiguredTimeSensitiveSetting"));
  }
  return v2;
}

@end