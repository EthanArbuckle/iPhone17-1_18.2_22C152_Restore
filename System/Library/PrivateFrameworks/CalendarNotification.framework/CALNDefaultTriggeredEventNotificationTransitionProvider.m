@interface CALNDefaultTriggeredEventNotificationTransitionProvider
- (BOOL)_shouldAddNotificationForTravelAdviceReceivedForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5;
- (BOOL)_shouldModifyForAlarmFiredForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5;
- (BOOL)_shouldRemoveNotificationForTravelAdviceReceivedForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5;
- (BOOL)_timeToLeaveStateAlreadyDisplayedBasedOnSourceNotificationInfo:(id)a3 oldNotificationData:(id)a4;
- (CALNDefaultTriggeredEventNotificationTransitionProvider)initWithTravelAdvisoryAuthority:(id)a3 dateProvider:(id)a4;
- (CALNTravelAdvisoryAuthority)travelAdvisoryAuthority;
- (CalDateProvider)dateProvider;
- (unint64_t)_transitionForAlarmFiredForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5;
- (unint64_t)_transitionForTimeToLeaveRefreshTimerFiredForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5;
- (unint64_t)_transitionForTravelAdviceReceivedForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5;
- (unint64_t)transitionForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5 trigger:(unint64_t)a6;
@end

@implementation CALNDefaultTriggeredEventNotificationTransitionProvider

- (CALNDefaultTriggeredEventNotificationTransitionProvider)initWithTravelAdvisoryAuthority:(id)a3 dateProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CALNDefaultTriggeredEventNotificationTransitionProvider;
  v9 = [(CALNDefaultTriggeredEventNotificationTransitionProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_travelAdvisoryAuthority, a3);
    objc_storeStrong((id *)&v10->_dateProvider, a4);
  }

  return v10;
}

- (unint64_t)transitionForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5 trigger:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == 2)
  {
    unint64_t v13 = [(CALNDefaultTriggeredEventNotificationTransitionProvider *)self _transitionForTimeToLeaveRefreshTimerFiredForSourceClientIdentifier:v10 sourceNotificationInfo:v11 oldNotificationData:v12];
  }
  else if (a6 == 1)
  {
    unint64_t v13 = [(CALNDefaultTriggeredEventNotificationTransitionProvider *)self _transitionForTravelAdviceReceivedForSourceClientIdentifier:v10 sourceNotificationInfo:v11 oldNotificationData:v12];
  }
  else
  {
    if (a6)
    {
      unint64_t v14 = 0;
      goto LABEL_9;
    }
    unint64_t v13 = [(CALNDefaultTriggeredEventNotificationTransitionProvider *)self _transitionForAlarmFiredForSourceClientIdentifier:v10 sourceNotificationInfo:v11 oldNotificationData:v12];
  }
  unint64_t v14 = v13;
LABEL_9:

  return v14;
}

- (unint64_t)_transitionForAlarmFiredForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 alarmID];
  if (v11)
  {
    if ([(CALNDefaultTriggeredEventNotificationTransitionProvider *)self _shouldModifyForAlarmFiredForSourceClientIdentifier:v8 sourceNotificationInfo:v9 oldNotificationData:v10])
    {
      unint64_t v12 = 2;
    }
    else
    {
      unint64_t v12 = 1;
    }
  }
  else
  {
    unint64_t v13 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CALNDefaultTriggeredEventNotificationTransitionProvider _transitionForAlarmFiredForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:](v13);
    }

    unint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)_shouldModifyForAlarmFiredForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v11 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      id v19 = v8;
      v16 = "Should not modify for alarm fired because old notification data is nil. source client identifier = %{public}@";
LABEL_11:
      _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v18, 0xCu);
    }
LABEL_12:
    BOOL v14 = 0;
    goto LABEL_17;
  }
  if (([v9 isOffsetFromTravelTimeStart] & 1) == 0)
  {
    id v11 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      id v19 = v8;
      v16 = "Should not modify for alarm fired that is not offset from travel time start. source client identifier = %{public}@";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v11 = [v10 lastTimeNotificationAdded];
  if (v11)
  {
    unint64_t v12 = [(CALNDefaultTriggeredEventNotificationTransitionProvider *)self dateProvider];
    unint64_t v13 = [v12 now];

    BOOL v14 = +[CALNTravelAdvisoryUtilities isLastFireTimeOfAlert:v11 withinEightMinutesOfDate:v13];
    v15 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      id v19 = v8;
      _os_log_impl(&dword_2216BB000, v15, OS_LOG_TYPE_DEFAULT, "Should modify for alarm fired that is offset from travel time start because last fire time of alert is within eight minutes. source client identifier = %{public}@", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    unint64_t v13 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      id v19 = v8;
      _os_log_impl(&dword_2216BB000, v13, OS_LOG_TYPE_DEFAULT, "Should not modify for alarm fired that is offset from travel time start because last time notification added is nil. source client identifier = %{public}@", (uint8_t *)&v18, 0xCu);
    }
    BOOL v14 = 0;
  }

LABEL_17:
  return v14;
}

- (unint64_t)_transitionForTravelAdviceReceivedForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = [(CALNDefaultTriggeredEventNotificationTransitionProvider *)self _shouldRemoveNotificationForTravelAdviceReceivedForSourceClientIdentifier:v10 sourceNotificationInfo:v9 oldNotificationData:v8];
  LODWORD(self) = [(CALNDefaultTriggeredEventNotificationTransitionProvider *)self _shouldAddNotificationForTravelAdviceReceivedForSourceClientIdentifier:v10 sourceNotificationInfo:v9 oldNotificationData:v8];

  unint64_t v12 = 1;
  if (!self) {
    unint64_t v12 = 2;
  }
  if (v11) {
    return 3;
  }
  else {
    return v12;
  }
}

- (BOOL)_shouldAddNotificationForTravelAdviceReceivedForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [v9 hypothesis];

  unint64_t v12 = [v9 hypothesis];
  unint64_t v13 = v12;
  if (!v11)
  {
    BOOL v14 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138543362;
      id v27 = v8;
      v15 = "Should not add notification because no new travel advice received, source client identifier = %{public}@";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (v12 && [v12 travelState] == 5)
  {
    BOOL v14 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138543362;
      id v27 = v8;
      v15 = "We've detected that the user has arrived at the event's location, source client identifier = %{public}@";
LABEL_12:
      _os_log_impl(&dword_2216BB000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v26, 0xCu);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (v10)
  {
    if ([(CALNDefaultTriggeredEventNotificationTransitionProvider *)self _timeToLeaveStateAlreadyDisplayedBasedOnSourceNotificationInfo:v9 oldNotificationData:v10])
    {
      BOOL v14 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 138543362;
        id v27 = v8;
        v15 = "Should not add notification because time to leave status has already been displayed. source client identif"
              "ier = %{public}@";
        goto LABEL_12;
      }
LABEL_13:
      BOOL v16 = 0;
      goto LABEL_14;
    }
    int v18 = [v10 isOffsetFromTravelTimeStart];
    BOOL v14 = [v10 lastFireTimeOfAlertOffsetFromTravelTime];
    if (v14
      && ([(CALNDefaultTriggeredEventNotificationTransitionProvider *)self dateProvider],
          id v19 = objc_claimAutoreleasedReturnValue(),
          [v19 now],
          uint64_t v20 = objc_claimAutoreleasedReturnValue(),
          BOOL v21 = +[CALNTravelAdvisoryUtilities isLastFireTimeOfAlert:v14 withinEightMinutesOfDate:v20], v20, v19, (v18 & v21) == 1))
    {
      v22 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 138543362;
        id v27 = v8;
        v23 = "Should not add notification because notification recently fired due to a travel time alert. source client "
              "identifier = %{public}@";
LABEL_26:
        _os_log_impl(&dword_2216BB000, v22, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v26, 0xCu);
      }
    }
    else
    {
      if (!v13
        || (uint64_t v24 = [v13 travelState],
            -[CALNDefaultTriggeredEventNotificationTransitionProvider travelAdvisoryAuthority](self, "travelAdvisoryAuthority"), v25 = objc_claimAutoreleasedReturnValue(), LODWORD(v24) = [v25 travelStateIndicatesTravelingTowardDestination:v24], v25, !v24))
      {
        v22 = +[CALNLogSubsystem calendar];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 138543362;
          id v27 = v8;
          _os_log_impl(&dword_2216BB000, v22, OS_LOG_TYPE_DEFAULT, "Should add notification because new travel advice received for existing alert. source client identifier = %{public}@", (uint8_t *)&v26, 0xCu);
        }
        BOOL v16 = 1;
        goto LABEL_31;
      }
      v22 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 138543362;
        id v27 = v8;
        v23 = "Should not add notification because an alert already fired for the event and the user is traveling to the "
              "destination. source client identifier = %{public}@";
        goto LABEL_26;
      }
    }
    BOOL v16 = 0;
LABEL_31:

    goto LABEL_14;
  }
  BOOL v14 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138543362;
    id v27 = v8;
    _os_log_impl(&dword_2216BB000, v14, OS_LOG_TYPE_DEFAULT, "Should add notification because new travel advice received and no associated notification data exists already, source client identifier = %{public}@", (uint8_t *)&v26, 0xCu);
  }
  BOOL v16 = 1;
LABEL_14:

  return v16;
}

- (BOOL)_shouldRemoveNotificationForTravelAdviceReceivedForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v9 = [a4 hypothesis];
  uint64_t v10 = [v9 travelState];
  BOOL v11 = 0;
  if (v8 && v10 == 5)
  {
    unint64_t v12 = [v8 alarmID];

    if (v12)
    {
      BOOL v11 = 0;
    }
    else
    {
      unint64_t v13 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543362;
        id v16 = v7;
        _os_log_impl(&dword_2216BB000, v13, OS_LOG_TYPE_DEFAULT, "Should remove notification because the user has arrived and we've only shown pure 'Time to Leave' alerts and no manual alerts for this event. Source client identifier to remove = %{public}@", (uint8_t *)&v15, 0xCu);
      }

      BOOL v11 = 1;
    }
  }

  return v11;
}

- (unint64_t)_transitionForTimeToLeaveRefreshTimerFiredForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    BOOL v11 = [v9 hypothesis];
    unint64_t v12 = v11;
    if (!v11) {
      goto LABEL_12;
    }
    uint64_t v13 = [v11 travelState];
    BOOL v14 = [(CALNDefaultTriggeredEventNotificationTransitionProvider *)self travelAdvisoryAuthority];
    char v15 = [v14 travelStateIndicatesTravelingTowardDestination:v13];

    unint64_t v16 = 2;
    if ((v15 & 1) != 0 || v13 == 5) {
      goto LABEL_13;
    }
    if ([v9 travelAdvisoryTimelinessPeriod] == 2)
    {
      if ([v10 hasDisplayedLeaveNowMessage]) {
        unint64_t v16 = 2;
      }
      else {
        unint64_t v16 = 1;
      }
    }
    else
    {
LABEL_12:
      unint64_t v16 = 2;
    }
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v17 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[CALNDefaultTriggeredEventNotificationTransitionProvider _transitionForTimeToLeaveRefreshTimerFiredForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:]((uint64_t)v8, v17);
  }

  unint64_t v16 = 0;
LABEL_14:

  return v16;
}

- (BOOL)_timeToLeaveStateAlreadyDisplayedBasedOnSourceNotificationInfo:(id)a3 oldNotificationData:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (!v5)
  {
    LOBYTE(v9) = 0;
    goto LABEL_26;
  }
  uint64_t v6 = [a3 travelAdvisoryTimelinessPeriod];
  uint64_t v7 = v6;
  switch(v6)
  {
    case 3:
      int v8 = [v5 hasDisplayedRunningLateMessage];
      break;
    case 2:
      int v8 = [v5 hasDisplayedLeaveNowMessage];
      break;
    case 1:
      int v8 = [v5 hasDisplayedLeaveByMessage];
      break;
    default:
      BOOL v9 = 0;
      goto LABEL_11;
  }
  BOOL v9 = v8;
LABEL_11:
  id v10 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v9) {
      BOOL v11 = @"Yes";
    }
    else {
      BOOL v11 = @"No";
    }
    if ([v5 hasDisplayedLeaveByMessage]) {
      unint64_t v12 = @"Yes";
    }
    else {
      unint64_t v12 = @"No";
    }
    if ([v5 hasDisplayedLeaveNowMessage]) {
      uint64_t v13 = @"Yes";
    }
    else {
      uint64_t v13 = @"No";
    }
    int v16 = 138544386;
    if ([v5 hasDisplayedRunningLateMessage]) {
      BOOL v14 = @"Yes";
    }
    else {
      BOOL v14 = @"No";
    }
    uint64_t v17 = v11;
    __int16 v18 = 2048;
    uint64_t v19 = v7;
    __int16 v20 = 2114;
    BOOL v21 = v12;
    __int16 v22 = 2114;
    v23 = v13;
    __int16 v24 = 2114;
    v25 = v14;
    _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, "Time to leave status already displayed based on travel advisory timeliness period: (%{public}@), period = %lu, hasDisplayedLeaveByMessage = (%{public}@), hasDisplayedLeaveNowMessage = (%{public}@), hasDisplayedRunningLateMessage = (%{public}@)", (uint8_t *)&v16, 0x34u);
  }

LABEL_26:
  return v9;
}

- (CALNTravelAdvisoryAuthority)travelAdvisoryAuthority
{
  return self->_travelAdvisoryAuthority;
}

- (CalDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_travelAdvisoryAuthority, 0);
}

- (void)_transitionForAlarmFiredForSourceClientIdentifier:(os_log_t)log sourceNotificationInfo:oldNotificationData:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2216BB000, log, OS_LOG_TYPE_ERROR, "Could not get alarm ID for triggered alarm", v1, 2u);
}

- (void)_transitionForTimeToLeaveRefreshTimerFiredForSourceClientIdentifier:(uint64_t)a1 sourceNotificationInfo:(NSObject *)a2 oldNotificationData:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Could not compute transition for time to leave refresh timer fired because could not find existing notification data. source client identifier = %{public}@", (uint8_t *)&v2, 0xCu);
}

@end