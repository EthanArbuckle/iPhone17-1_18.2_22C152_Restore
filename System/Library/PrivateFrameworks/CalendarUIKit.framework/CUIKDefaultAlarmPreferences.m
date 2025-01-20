@interface CUIKDefaultAlarmPreferences
+ (NSNumber)defaultAllDayAlarmOffset;
+ (NSNumber)defaultTimedAlarmOffset;
+ (id)defaultAlarmOffsetForAlarmType:(int)a3 eventStore:(id)a4;
+ (id)defaultBirthdayAlarmOffsetWithEventStore:(id)a3;
+ (void)setDefaultAlarmOffset:(id)a3 forAlarmType:(int)a4 eventStore:(id)a5;
@end

@implementation CUIKDefaultAlarmPreferences

+ (id)defaultAlarmOffsetForAlarmType:(int)a3 eventStore:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 0:
      uint64_t v7 = [a1 defaultTimedAlarmOffset];
      goto LABEL_7;
    case 1:
      uint64_t v7 = [a1 defaultAllDayAlarmOffset];
      goto LABEL_7;
    case 2:
      uint64_t v7 = [a1 defaultBirthdayAlarmOffsetWithEventStore:v6];
LABEL_7:
      v8 = (void *)v7;
      goto LABEL_9;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

+ (void)setDefaultAlarmOffset:(id)a3 forAlarmType:(int)a4 eventStore:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([v7 integerValue] == 0x7FFFFFFFFFFFFFFFLL)
  {

    id v7 = 0;
  }
  if (a4 == 2)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v9 = [v8 sources];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v14 sourceType] == 5)
          {
            [v14 setDefaultAlarmOffset:v7];
            v17 = [v14 eventStore];
            id v20 = 0;
            int v18 = [v17 saveSource:v14 commit:1 error:&v20];
            id v19 = v20;

            if (v18)
            {
              v15 = (__CFString *)(id)*MEMORY[0x1E4F57860];
            }
            else
            {
              NSLog(&cfstr_AnErrorOccurre.isa, v14, v19);
              v15 = 0;
            }

            goto LABEL_24;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    v15 = 0;
LABEL_24:

    if (v15) {
      goto LABEL_18;
    }
  }
  else
  {
    if (a4 == 1)
    {
      CalAlarmSetDefaultAllDayAlarmOffset();
    }
    else
    {
      if (a4) {
        goto LABEL_19;
      }
      CalAlarmSetDefaultTimedAlarmOffset();
    }
    v15 = (__CFString *)(id)*MEMORY[0x1E4F25698];
    if (v15)
    {
LABEL_18:
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, v15, 0, 0, 1u);
    }
  }
LABEL_19:
}

+ (NSNumber)defaultTimedAlarmOffset
{
  v2 = (void *)CalAlarmCopyDefaultTimedAlarmOffset();
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [NSNumber numberWithInteger:0x7FFFFFFFFFFFFFFFLL];
  }
  v5 = v4;

  return (NSNumber *)v5;
}

+ (NSNumber)defaultAllDayAlarmOffset
{
  v2 = (void *)CalAlarmCopyDefaultAllDayAlarmOffset();
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [NSNumber numberWithInteger:0x7FFFFFFFFFFFFFFFLL];
  }
  v5 = v4;

  return (NSNumber *)v5;
}

+ (id)defaultBirthdayAlarmOffsetWithEventStore:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a3, "sources", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
      if ([v8 sourceType] == 5) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v9 = [v8 defaultAlarmOffset];

    if (v9) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  v9 = [NSNumber numberWithInteger:0x7FFFFFFFFFFFFFFFLL];
LABEL_12:

  return v9;
}

@end