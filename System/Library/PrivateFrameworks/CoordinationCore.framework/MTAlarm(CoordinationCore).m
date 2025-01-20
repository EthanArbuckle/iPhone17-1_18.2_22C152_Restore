@interface MTAlarm(CoordinationCore)
- (id)COPreferredAlarm:()CoordinationCore;
- (id)co_HomeKitAlarmCopy;
- (id)co_HomeKitSaveDate;
- (id)co_alarmUpdatedWithHomeKitAlarm:()CoordinationCore;
- (id)co_sanitizedHomeKitAlarm;
- (id)co_targetReference;
- (uint64_t)co_isMediaSystemOriginating;
- (void)co_sanitizedHomeKitAlarm;
@end

@implementation MTAlarm(CoordinationCore)

- (id)COPreferredAlarm:()CoordinationCore
{
  id v4 = a3;
  if (!v4 || [a1 isFiring]) {
    goto LABEL_6;
  }
  if ([v4 isFiring])
  {
LABEL_4:
    id v5 = v4;
LABEL_7:
    id v6 = v5;
    goto LABEL_8;
  }
  if ([a1 isSnoozed])
  {
LABEL_6:
    id v5 = a1;
    goto LABEL_7;
  }
  if ([v4 isSnoozed]) {
    goto LABEL_4;
  }
  id v6 = a1;
  uint64_t v8 = [v4 lastModifiedDate];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [v4 lastModifiedDate];
    v11 = [v6 lastModifiedDate];
    if ([v10 compare:v11] == 1)
    {
    }
    else
    {
      v12 = [v6 lastModifiedDate];

      if (v12) {
        goto LABEL_8;
      }
    }
    id v13 = v4;

    id v6 = v13;
  }
LABEL_8:

  return v6;
}

- (id)co_sanitizedHomeKitAlarm
{
  v2 = [a1 siriContext];
  uint64_t v3 = *MEMORY[0x263F33D90];
  uint64_t v4 = [v2 objectForKey:*MEMORY[0x263F33D90]];
  uint64_t v5 = [v2 objectForKey:@"COAlarmSiriContextIsMediaSystemKey"];
  if (v4 | v5 || ([a1 isFiring] & 1) != 0 || (objc_msgSend(a1, "isSnoozed") & 1) != 0)
  {
    id v6 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(MTAlarm(CoordinationCore) *)a1 co_sanitizedHomeKitAlarm];
    }

    id v7 = (id)[a1 mutableCopy];
    [v7 setFiredDate:0];
    [v7 setSnoozeFireDate:0];
    [v7 setDismissedDate:0];
    if (v4)
    {
      uint64_t v8 = (void *)[v2 mutableCopy];
      [v8 removeObjectForKey:v3];
      [v8 removeObjectForKey:@"COAlarmSiriContextIsMediaSystemKey"];
      [v7 setSiriContext:v8];
    }
  }
  else
  {
    id v7 = a1;
  }

  return v7;
}

- (id)co_targetReference
{
  v1 = [a1 siriContext];
  v2 = [v1 objectForKey:*MEMORY[0x263F33D90]];

  return v2;
}

- (uint64_t)co_isMediaSystemOriginating
{
  v1 = [a1 siriContext];
  v2 = [v1 objectForKey:@"COAlarmSiriContextIsMediaSystemKey"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (id)co_HomeKitAlarmCopy
{
  id v2 = objc_alloc_init(MEMORY[0x263F55D68]);
  objc_msgSend(v2, "setHour:", objc_msgSend(a1, "hour"));
  objc_msgSend(v2, "setMinute:", objc_msgSend(a1, "minute"));
  objc_msgSend(v2, "setEnabled:", objc_msgSend(a1, "isEnabled"));
  objc_msgSend(v2, "setRepeatSchedule:", objc_msgSend(a1, "repeatSchedule"));
  uint64_t v3 = [a1 title];
  [v2 setTitle:v3];

  uint64_t v4 = [a1 sound];
  [v2 setSound:v4];

  uint64_t v5 = [a1 siriContext];
  [v2 setSiriContext:v5];

  return v2;
}

- (id)co_HomeKitSaveDate
{
  return objc_getAssociatedObject(a1, sel_co_HomeKitSaveDate);
}

- (id)co_alarmUpdatedWithHomeKitAlarm:()CoordinationCore
{
  id v4 = a3;
  uint64_t v5 = [a1 lastModifiedDate];
  id v6 = objc_msgSend(v4, "co_HomeKitSaveDate");
  id v7 = v6;
  uint64_t v8 = 0;
  if (!v5 || !v6) {
    goto LABEL_36;
  }
  if ([v6 compare:v5] == -1)
  {
    uint64_t v8 = 0;
    goto LABEL_36;
  }
  uint64_t v9 = [v4 isEnabled];
  uint64_t v10 = [v4 hour];
  uint64_t v11 = [v4 minute];
  v12 = [v4 title];
  uint64_t v24 = [v4 repeatSchedule];
  id v13 = [v4 sound];
  if (v9 == [a1 isEnabled])
  {
    if ([a1 hour] == v10)
    {
      if ([a1 minute] == v11)
      {
        uint64_t v8 = 0;
        goto LABEL_18;
      }
LABEL_16:
      uint64_t v8 = (void *)[a1 mutableCopy];
      goto LABEL_17;
    }
LABEL_12:
    uint64_t v8 = (void *)[a1 mutableCopy];
    goto LABEL_13;
  }
  uint64_t v8 = (void *)[a1 mutableCopy];
  [v8 setEnabled:v9];
  if ([a1 hour] == v10) {
    goto LABEL_14;
  }
  if (!v8) {
    goto LABEL_12;
  }
LABEL_13:
  [v8 setHour:v10];
LABEL_14:
  if ([a1 minute] == v11) {
    goto LABEL_18;
  }
  if (!v8) {
    goto LABEL_16;
  }
LABEL_17:
  [v8 setMinute:v11];
LABEL_18:
  uint64_t v14 = [a1 title];
  if (v12 == (void *)v14)
  {
  }
  else
  {
    v15 = (void *)v14;
    v16 = [a1 title];
    char v17 = [v12 isEqual:v16];

    if ((v17 & 1) == 0)
    {
      uint64_t v18 = v24;
      if (!v8) {
        uint64_t v8 = (void *)[a1 mutableCopy];
      }
      [v8 setTitle:v12];
      goto LABEL_25;
    }
  }
  uint64_t v18 = v24;
LABEL_25:
  if ([a1 repeatSchedule] != v18)
  {
    if (!v8) {
      uint64_t v8 = (void *)[a1 mutableCopy];
    }
    [v8 setRepeatSchedule:v18];
  }
  uint64_t v19 = [a1 sound];
  if (v13 == (void *)v19)
  {
  }
  else
  {
    v20 = (void *)v19;
    v21 = [a1 sound];
    char v22 = [v13 isEqual:v21];

    if ((v22 & 1) == 0)
    {
      if (!v8) {
        uint64_t v8 = (void *)[a1 mutableCopy];
      }
      [v8 setSound:v13];
    }
  }

LABEL_36:
  return v8;
}

- (void)co_sanitizedHomeKitAlarm
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 alarmID];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_2217C1000, a2, OS_LOG_TYPE_ERROR, "%@ required sanitizing!", (uint8_t *)&v4, 0xCu);
}

@end