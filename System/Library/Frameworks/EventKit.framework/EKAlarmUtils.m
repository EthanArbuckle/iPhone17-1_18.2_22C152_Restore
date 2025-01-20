@interface EKAlarmUtils
+ (id)adjustedRelativeAlarmOffset:(double)a3 isAllDay:(BOOL)a4;
+ (id)adjustedRelativeAlarmOffsetFromAllDayToTimed:(double)a3;
+ (id)adjustedRelativeAlarmOffsetFromTimedToAllDay:(double)a3;
+ (void)adjustRelativeAlarmsForEvent:(id)a3 whenConvertingToIsAllDay:(BOOL)a4;
@end

@implementation EKAlarmUtils

+ (void)adjustRelativeAlarmsForEvent:(id)a3 whenConvertingToIsAllDay:(BOOL)a4
{
  uint64_t v4 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v28 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v26 = v5;
  v6 = [v5 alarms];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    unsigned int v25 = v4;
    v24 = v6;
    uint64_t v27 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (([v11 isAbsolute] & 1) == 0)
        {
          [v11 relativeOffset];
          v12 = +[EKAlarmUtils adjustedRelativeAlarmOffset:isAllDay:](EKAlarmUtils, "adjustedRelativeAlarmOffset:isAllDay:", v4);
          if (v12)
          {
            long long v31 = 0u;
            long long v32 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            id v13 = v28;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              int v16 = 0;
              uint64_t v17 = *(void *)v30;
              do
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v30 != v17) {
                    objc_enumerationMutation(v13);
                  }
                  v19 = *(void **)(*((void *)&v29 + 1) + 8 * j);
                  [v19 relativeOffset];
                  double v21 = v20;
                  [v12 floatValue];
                  if (v21 == v22)
                  {
                    int v23 = [v19 isDefaultAlarm];
                    v16 |= v23 ^ [v11 isDefaultAlarm] ^ 1;
                  }
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
              }
              while (v15);

              uint64_t v4 = v25;
              v6 = v24;
              if (v16)
              {
                [v26 removeAlarm:v11];
                goto LABEL_22;
              }
            }
            else
            {
            }
            [v12 doubleValue];
            objc_msgSend(v11, "setRelativeOffset:");
            [v13 addObject:v11];
LABEL_22:
            uint64_t v9 = v27;
          }
          else
          {
            [v26 removeAlarm:v11];
          }

          continue;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v8);
  }
}

+ (id)adjustedRelativeAlarmOffset:(double)a3 isAllDay:(BOOL)a4
{
  if (a4) {
    [a1 adjustedRelativeAlarmOffsetFromTimedToAllDay:a3];
  }
  else {
  uint64_t v4 = [a1 adjustedRelativeAlarmOffsetFromAllDayToTimed:a3];
  }

  return v4;
}

+ (id)adjustedRelativeAlarmOffsetFromTimedToAllDay:(double)a3
{
  if (a3 >= -43200.0 && a3 < 43200.0) {
    return &unk_1EF952B08;
  }
  if (a3 >= -129600.0 && a3 < -43200.0) {
    return &unk_1EF952B20;
  }
  if (a3 >= -216000.0 && a3 < -129600.0) {
    return &unk_1EF952B38;
  }
  if (a3 >= -561600.0 || a3 < -648000.0) {
    return 0;
  }
  else {
    return &unk_1EF952B50;
  }
}

+ (id)adjustedRelativeAlarmOffsetFromAllDayToTimed:(double)a3
{
  if (fabs(a3 + -32400.0) < 0.0000001) {
    return &unk_1EF952B68;
  }
  if (fabs(a3 + 54000.0) < 0.0000001) {
    return &unk_1EF952B80;
  }
  if (fabs(a3 + 140400.0) < 0.0000001) {
    return &unk_1EF952B98;
  }
  if (fabs(a3 + 572400.0) >= 0.0000001) {
    return 0;
  }
  return &unk_1EF952BB0;
}

@end