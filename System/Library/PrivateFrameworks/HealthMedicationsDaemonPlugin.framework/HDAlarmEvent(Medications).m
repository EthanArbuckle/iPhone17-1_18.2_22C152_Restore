@interface HDAlarmEvent(Medications)
- (id)scheduleItemIdentifier;
- (uint64_t)isCriticalNotificationEvent;
- (uint64_t)isFollowUpNotificationEvent;
@end

@implementation HDAlarmEvent(Medications)

- (uint64_t)isFollowUpNotificationEvent
{
  v4 = [a1 eventIdentifier];
  v5 = [v4 componentsSeparatedByString:@","];
  uint64_t v6 = [v5 count];

  if (v6 != 3)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = [a1 eventIdentifier];
    [v10 handleFailureInMethod:a2, a1, @"HDRestorableAlarm+Medications.m", 53, @"Invalid Event Identifier '%@' called with '%s'", v11, "-[HDAlarmEvent(Medications) isFollowUpNotificationEvent]" object file lineNumber description];
  }
  v7 = [a1 eventIdentifier];
  uint64_t v8 = BoolValueFromIdentifierForKey(v7, @"isFollowUp");

  return v8;
}

- (uint64_t)isCriticalNotificationEvent
{
  v4 = [a1 eventIdentifier];
  v5 = [v4 componentsSeparatedByString:@","];
  uint64_t v6 = [v5 count];

  if (v6 != 3)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = [a1 eventIdentifier];
    [v10 handleFailureInMethod:a2, a1, @"HDRestorableAlarm+Medications.m", 59, @"Invalid Event Identifier '%@' called with '%s'", v11, "-[HDAlarmEvent(Medications) isCriticalNotificationEvent]" object file lineNumber description];
  }
  v7 = [a1 eventIdentifier];
  uint64_t v8 = BoolValueFromIdentifierForKey(v7, @"isCritical");

  return v8;
}

- (id)scheduleItemIdentifier
{
  v4 = [a1 eventIdentifier];
  v5 = [a1 eventIdentifier];
  if ([v5 containsString:@","])
  {
  }
  else
  {
    uint64_t v6 = [a1 eventIdentifier];
    [v6 doubleValue];
    double v8 = v7;

    if (v8 > 0.0)
    {
      id v9 = v4;
      goto LABEL_8;
    }
  }
  v10 = [a1 eventIdentifier];
  v11 = [v10 componentsSeparatedByString:@","];
  uint64_t v12 = [v11 count];

  if (v12 != 3)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = [a1 eventIdentifier];
    [v17 handleFailureInMethod:a2, a1, @"HDRestorableAlarm+Medications.m", 73, @"Invalid Event identifier '%@' called with '%s'", v18, "-[HDAlarmEvent(Medications) scheduleItemIdentifier]" object file lineNumber description];
  }
  v13 = [v4 componentsSeparatedByString:@","];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __KeyValuePairFromIdentifierForKey_block_invoke;
  v19[3] = &unk_1E6337E90;
  v20 = @"scheduleItemId";
  v14 = objc_msgSend(v13, "hk_firstObjectPassingTest:", v19);

  v15 = [v14 componentsSeparatedByString:@":"];
  id v9 = [v15 lastObject];

LABEL_8:
  return v9;
}

@end