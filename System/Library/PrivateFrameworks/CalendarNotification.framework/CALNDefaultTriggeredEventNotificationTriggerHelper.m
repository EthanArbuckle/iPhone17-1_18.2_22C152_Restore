@interface CALNDefaultTriggeredEventNotificationTriggerHelper
- (BOOL)_eventWillEndBeforeUserArrivesForHypothesis:(id)a3 eventEndDate:(id)a4;
- (BOOL)_exceededMaximumTravelTimeThresholdForHypothesis:(id)a3;
- (BOOL)_shouldTriggerForTimeToLeaveRefreshForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5;
- (BOOL)_shouldTriggerForTimeToLeaveRefreshGivenImmediateDepartureTimelinessStatusForSourceClientIdentifier:(id)a3 oldNotificationData:(id)a4;
- (BOOL)_shouldTriggerForTravelAdviceReceivedForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5;
- (BOOL)_shouldTriggerForTravelAdviceReceivedGivenHasExistingNotificationDataForSourceClientIdentifier:(id)a3 hypothesis:(id)a4 sourceNotificationInfo:(id)a5 oldNotificationData:(id)a6 hasExistingTravelAdvice:(BOOL)a7 satisfiesMinimumTravelTimeThreshold:(BOOL)a8;
- (BOOL)shouldTriggerForSourceClientIdentifier:(id)a3 trigger:(unint64_t)a4 sourceNotificationInfo:(id)a5 oldNotificationData:(id)a6;
- (CALNDefaultTriggeredEventNotificationTriggerHelper)initWithTravelAdvisoryAuthority:(id)a3 dateProvider:(id)a4;
- (CALNTravelAdvisoryAuthority)travelAdvisoryAuthority;
- (CalDateProvider)dateProvider;
@end

@implementation CALNDefaultTriggeredEventNotificationTriggerHelper

- (CALNDefaultTriggeredEventNotificationTriggerHelper)initWithTravelAdvisoryAuthority:(id)a3 dateProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CALNDefaultTriggeredEventNotificationTriggerHelper;
  v9 = [(CALNDefaultTriggeredEventNotificationTriggerHelper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_travelAdvisoryAuthority, a3);
    objc_storeStrong((id *)&v10->_dateProvider, a4);
  }

  return v10;
}

- (BOOL)shouldTriggerForSourceClientIdentifier:(id)a3 trigger:(unint64_t)a4 sourceNotificationInfo:(id)a5 oldNotificationData:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [NSNumber numberWithUnsignedInteger:a4];
    int v19 = 138544130;
    id v20 = v10;
    __int16 v21 = 2114;
    v22 = v14;
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_impl(&dword_2216BB000, v13, OS_LOG_TYPE_DEFAULT, "Determining whether or not to trigger for source client identifier = %{public}@, trigger = %{public}@, source notification info = %@, old notification data = %@", (uint8_t *)&v19, 0x2Au);
  }
  if (a4 == 2)
  {
    BOOL v17 = [(CALNDefaultTriggeredEventNotificationTriggerHelper *)self _shouldTriggerForTimeToLeaveRefreshForSourceClientIdentifier:v10 sourceNotificationInfo:v11 oldNotificationData:v12];
LABEL_11:
    BOOL v16 = v17;
    goto LABEL_13;
  }
  if (a4 == 1)
  {
    BOOL v17 = [(CALNDefaultTriggeredEventNotificationTriggerHelper *)self _shouldTriggerForTravelAdviceReceivedForSourceClientIdentifier:v10 sourceNotificationInfo:v11 oldNotificationData:v12];
    goto LABEL_11;
  }
  if (a4)
  {
    BOOL v16 = 0;
  }
  else
  {
    v15 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = v10;
      _os_log_impl(&dword_2216BB000, v15, OS_LOG_TYPE_DEFAULT, "Should trigger for alarm. source client identifier = %{public}@", (uint8_t *)&v19, 0xCu);
    }

    BOOL v16 = 1;
  }
LABEL_13:

  return v16;
}

- (BOOL)_shouldTriggerForTravelAdviceReceivedForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = (unint64_t)a5;
  id v11 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v52 = 138543362;
    id v53 = v8;
    _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Determining if notification source should trigger for source client identifier = %{public}@", (uint8_t *)&v52, 0xCu);
  }

  if (![v9 forceDisplayOfNewTravelAdvisoryHypotheses])
  {
    if (([v9 allowsLocationAlerts] & 1) == 0)
    {
      id v12 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v52 = 138543362;
        id v53 = v8;
        v14 = "Should not trigger because location alerts are disabled. source client identifier = %{public}@";
        goto LABEL_13;
      }
LABEL_14:
      BOOL v13 = 0;
      goto LABEL_34;
    }
    if ([v9 travelAdvisoryDisabled])
    {
      id v12 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v52 = 138543362;
        id v53 = v8;
        v14 = "Should not trigger because event had its Time To Leave alarm removed. source client identifier = %{public}@";
LABEL_13:
        _os_log_impl(&dword_2216BB000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v52, 0xCu);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    uint64_t v15 = [v9 hypothesis];
    id v12 = v15;
    if (!(v10 | v15))
    {
      BOOL v16 = +[CALNLogSubsystem calendar];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:
        BOOL v13 = 0;
LABEL_33:

        goto LABEL_34;
      }
      int v52 = 138543362;
      id v53 = v8;
      BOOL v17 = "Should not trigger because nil hypothesis received and no existing notification data, source client identifier = %{public}@";
LABEL_18:
      _os_log_impl(&dword_2216BB000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v52, 0xCu);
      goto LABEL_19;
    }
    BOOL v13 = v10 != 0;
    if (v10 && !v15)
    {
      v18 = [(id)v10 hypothesis];

      if (!v18)
      {
        BOOL v16 = +[CALNLogSubsystem calendar];
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        int v52 = 138543362;
        id v53 = v8;
        BOOL v17 = "Should not trigger because nil hypothesis received and existing notification data has no travel advice, so"
              "urce client identifier = %{public}@";
        goto LABEL_18;
      }
      goto LABEL_29;
    }
    if (!v15)
    {
LABEL_29:
      BOOL v16 = +[CALNLogSubsystem calendar];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_32:
        BOOL v13 = 1;
        goto LABEL_33;
      }
      int v52 = 138543362;
      id v53 = v8;
      id v20 = "Should trigger because nil hypothesis received and notification data has existing travel advice for source c"
            "lient identifier = %{public}@";
LABEL_31:
      _os_log_impl(&dword_2216BB000, v16, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v52, 0xCu);
      goto LABEL_32;
    }
    if ([(id)v15 travelState] == 5)
    {
      BOOL v16 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = [NSNumber numberWithBool:v10 != 0];
        int v52 = 138543618;
        id v53 = v8;
        __int16 v54 = 2114;
        v55 = v19;
        _os_log_impl(&dword_2216BB000, v16, OS_LOG_TYPE_DEFAULT, "We've detected that the user has arrived at the event's location. source client url = %{public}@, has existing notification data = %{public}@", (uint8_t *)&v52, 0x16u);
      }
      goto LABEL_33;
    }
    if (v10)
    {
      v22 = [(id)v10 hypothesis];

      if (v22)
      {
        BOOL v16 = +[CALNLogSubsystem calendar];
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_32;
        }
        int v52 = 138543362;
        id v53 = v8;
        id v20 = "Should trigger because notification has existing travel advice. source client identifier = %{public}@";
        goto LABEL_31;
      }
    }
    BOOL v16 = [v9 endDate];
    if ([(CALNDefaultTriggeredEventNotificationTriggerHelper *)self _eventWillEndBeforeUserArrivesForHypothesis:v12 eventEndDate:v16])
    {
      __int16 v23 = +[CALNLogSubsystem calendar];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
LABEL_43:

        goto LABEL_19;
      }
      id v24 = NSNumber;
      [v12 aggressiveTravelTime];
      __int16 v25 = objc_msgSend(v24, "numberWithDouble:");
      int v52 = 138543874;
      id v53 = v8;
      __int16 v54 = 2114;
      v55 = v25;
      __int16 v56 = 2114;
      v57 = v16;
      _os_log_impl(&dword_2216BB000, v23, OS_LOG_TYPE_DEFAULT, "Should not trigger because the user has not seen travel advisory information for this event yet and we've detected the user will not arrive until the event is over. Will not show travel advisory information. source client identifier = %{public}@ \nAggressive travel time: [%{public}@] is after event end date: [%{public}@].", (uint8_t *)&v52, 0x20u);
LABEL_42:

      goto LABEL_43;
    }
    if ([(CALNDefaultTriggeredEventNotificationTriggerHelper *)self _exceededMaximumTravelTimeThresholdForHypothesis:v12])
    {
      id v26 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = NSNumber;
        [v12 conservativeTravelTime];
        v28 = objc_msgSend(v27, "numberWithDouble:");
        v29 = NSNumber;
        v30 = [(CALNDefaultTriggeredEventNotificationTriggerHelper *)self travelAdvisoryAuthority];
        [v30 maximumAllowableTravelTime];
        v31 = objc_msgSend(v29, "numberWithDouble:");
        int v52 = 138543618;
        id v53 = v28;
        __int16 v54 = 2114;
        v55 = v31;
        _os_log_impl(&dword_2216BB000, v26, OS_LOG_TYPE_DEFAULT, "Conservative Travel time [%{public}@] does not satisfy the initial emission travel time requirement since it is more than the maximum allowable travel time: [%{public}@]. Will not emit hypothesis as a result.", (uint8_t *)&v52, 0x16u);
      }
      goto LABEL_19;
    }
    v32 = [(CALNDefaultTriggeredEventNotificationTriggerHelper *)self travelAdvisoryAuthority];
    uint64_t v33 = [v32 doesHypothesisSatisfyMinimumAllowableTravelTime:v12];

    if (v10)
    {
      v34 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        int v52 = 138543362;
        id v53 = v8;
        _os_log_impl(&dword_2216BB000, v34, OS_LOG_TYPE_DEFAULT, "Found existing notification data for event. source client identifier = %{public}@", (uint8_t *)&v52, 0xCu);
      }

      BOOL v13 = [(CALNDefaultTriggeredEventNotificationTriggerHelper *)self _shouldTriggerForTravelAdviceReceivedGivenHasExistingNotificationDataForSourceClientIdentifier:v8 hypothesis:v12 sourceNotificationInfo:v9 oldNotificationData:v10 hasExistingTravelAdvice:0 satisfiesMinimumTravelTimeThreshold:v33];
      goto LABEL_33;
    }
    if ((v33 & 1) == 0)
    {
      [v12 estimatedTravelTime];
      double v42 = v41;
      v43 = [(CALNDefaultTriggeredEventNotificationTriggerHelper *)self travelAdvisoryAuthority];
      [v43 minimumAllowableTravelTime];
      double v45 = v44;

      __int16 v23 = +[CALNLogSubsystem calendar];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      __int16 v25 = [NSNumber numberWithDouble:v42];
      v46 = [NSNumber numberWithDouble:v45];
      int v52 = 138543874;
      id v53 = v8;
      __int16 v54 = 2114;
      v55 = v25;
      __int16 v56 = 2114;
      v57 = v46;
      _os_log_impl(&dword_2216BB000, v23, OS_LOG_TYPE_DEFAULT, "Should not trigger because the predicated travel time is less than the minimum allowable travel time threshold so we can't provide a time to leave alert. source client identifier = %{public}@, predicated travel time = %{public}@, minimum allowable travel time threshold = %{public}@", (uint8_t *)&v52, 0x20u);

      goto LABEL_42;
    }
    v35 = [v9 startDate];
    v36 = [(CALNDefaultTriggeredEventNotificationTriggerHelper *)self dateProvider];
    v37 = [v36 now];
    int v38 = [v35 CalIsBeforeDate:v37];

    if (v38)
    {
      v39 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        int v52 = 138543362;
        id v53 = v8;
        v40 = "Should not trigger because the event's start date is before now and we don't have any existing notificatio"
              "n data. source client identifier = %{public}@";
LABEL_56:
        _os_log_impl(&dword_2216BB000, v39, OS_LOG_TYPE_DEFAULT, v40, (uint8_t *)&v52, 0xCu);
      }
    }
    else
    {
      uint64_t v47 = [v12 travelState];
      if (v47 == 2)
      {
        v39 = +[CALNLogSubsystem calendar];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v48 = [NSNumber numberWithInteger:2];
          int v52 = 138543618;
          id v53 = v8;
          __int16 v54 = 2114;
          v55 = v48;
          _os_log_impl(&dword_2216BB000, v39, OS_LOG_TYPE_DEFAULT, "Should not trigger because the user is definitely traveling to the destination and we don't have any existing notification data for this event. source client identifier = %{public}@, travel state = %{public}@", (uint8_t *)&v52, 0x16u);
        }
        goto LABEL_66;
      }
      uint64_t v49 = v47;
      int v50 = [v9 eventHasAlarms];
      v39 = +[CALNLogSubsystem calendar];
      BOOL v51 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
      if (v49 != 3 || !v50)
      {
        if (v51)
        {
          int v52 = 138543362;
          id v53 = v8;
          _os_log_impl(&dword_2216BB000, v39, OS_LOG_TYPE_DEFAULT, "Should trigger because new travel advice received and no existing notification data for this event exists already. source client identifier = %{public}@", (uint8_t *)&v52, 0xCu);
        }
        BOOL v13 = 1;
        goto LABEL_67;
      }
      if (v51)
      {
        int v52 = 138543362;
        id v53 = v8;
        v40 = "Should not trigger because the user is traveling towards the destination, we don't have any existing notif"
              "ication data for this event and the event already has normal alarms on it, so the user will be alerted of "
              "this event at some point. source client identifier = %{public}@";
        goto LABEL_56;
      }
    }
LABEL_66:
    BOOL v13 = 0;
LABEL_67:

    goto LABEL_33;
  }
  id v12 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v52 = 138543362;
    id v53 = v8;
    _os_log_impl(&dword_2216BB000, v12, OS_LOG_TYPE_DEFAULT, "Should trigger because forcing display of new travel advisory hypotheses for source client identifier = %{public}@", (uint8_t *)&v52, 0xCu);
  }
  BOOL v13 = 1;
LABEL_34:

  return v13;
}

- (BOOL)_shouldTriggerForTravelAdviceReceivedGivenHasExistingNotificationDataForSourceClientIdentifier:(id)a3 hypothesis:(id)a4 sourceNotificationInfo:(id)a5 oldNotificationData:(id)a6 hasExistingTravelAdvice:(BOOL)a7 satisfiesMinimumTravelTimeThreshold:(BOOL)a8
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  int v16 = [a5 isOffsetFromTravelTimeStart];
  BOOL v17 = [v15 lastFireTimeOfAlertOffsetFromTravelTime];

  if (v17)
  {
    v18 = [(CALNDefaultTriggeredEventNotificationTriggerHelper *)self dateProvider];
    int v19 = [v18 now];
    BOOL v20 = +[CALNTravelAdvisoryUtilities isLastFireTimeOfAlert:v17 withinEightMinutesOfDate:v19];

    if ((v16 & v20) == 1)
    {
      __int16 v21 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 138543362;
        id v28 = v13;
        v22 = "Should trigger because notification recently fired due to a travel time alert. source client identifier = %{public}@";
LABEL_8:
        _os_log_impl(&dword_2216BB000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v27, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  uint64_t v23 = [v14 travelState];
  id v24 = [(CALNDefaultTriggeredEventNotificationTriggerHelper *)self travelAdvisoryAuthority];
  LODWORD(v23) = [v24 travelStateIndicatesTravelingTowardDestination:v23];

  if (v23)
  {
    __int16 v21 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138543362;
      id v28 = v13;
      v22 = "Should trigger because an alert was already fired for the event and the user is traveling to the destination"
            ". source client identifier = %{public}@";
      goto LABEL_8;
    }
LABEL_9:
    BOOL v25 = 1;
LABEL_15:

    goto LABEL_16;
  }
  if (!a8)
  {
    __int16 v21 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138543362;
      id v28 = v13;
      _os_log_impl(&dword_2216BB000, v21, OS_LOG_TYPE_DEFAULT, "Should not trigger because new travel hypothesis received for event that does not satisfy minimum travel time threshold. source client identifier = %{public}@", (uint8_t *)&v27, 0xCu);
    }
    BOOL v25 = 0;
    goto LABEL_15;
  }
  BOOL v25 = 1;
LABEL_16:

  return v25;
}

- (BOOL)_shouldTriggerForTimeToLeaveRefreshForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (([v9 allowsLocationAlerts] & 1) == 0)
    {
      id v11 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138543362;
        id v22 = v8;
        id v12 = "Should not trigger for time to leave refresh timer fired because location alerts are disabled. source clie"
              "nt identifier = %{public}@";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    if ([v9 travelAdvisoryDisabled])
    {
      id v11 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138543362;
        id v22 = v8;
        id v12 = "Should not trigger because event had its Time To Leave alarm removed. source client identifier = %{public}@";
LABEL_10:
        _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v21, 0xCu);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
    id v15 = [v9 hypothesis];
    id v11 = v15;
    if (v15)
    {
      uint64_t v16 = [v15 travelState];
      BOOL v17 = [(CALNDefaultTriggeredEventNotificationTriggerHelper *)self travelAdvisoryAuthority];
      char v18 = [v17 travelStateIndicatesTravelingTowardDestination:v16];

      if ((v18 & 1) == 0 && v16 != 5)
      {
        if ([v9 travelAdvisoryTimelinessPeriod] == 2)
        {
          BOOL v13 = [(CALNDefaultTriggeredEventNotificationTriggerHelper *)self _shouldTriggerForTimeToLeaveRefreshGivenImmediateDepartureTimelinessStatusForSourceClientIdentifier:v8 oldNotificationData:v10];
          goto LABEL_12;
        }
LABEL_24:
        BOOL v13 = 1;
        goto LABEL_12;
      }
      int v19 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138543362;
        id v22 = v8;
        BOOL v20 = "Should trigger because the user is traveling to the destination or has arrived. source client identifier = %{public}@";
        goto LABEL_22;
      }
    }
    else
    {
      int v19 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138543362;
        id v22 = v8;
        BOOL v20 = "Should trigger for time to leave refresh timer fired because we have no travel advice. source client ident"
              "ifier = %{public}@";
LABEL_22:
        _os_log_impl(&dword_2216BB000, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v21, 0xCu);
      }
    }

    goto LABEL_24;
  }
  id v11 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138543362;
    id v22 = v8;
    id v12 = "Should not trigger for time to leave refresh timer fired because no existing notification data. source client "
          "identifier = %{public}@";
    goto LABEL_10;
  }
LABEL_11:
  BOOL v13 = 0;
LABEL_12:

  return v13;
}

- (BOOL)_shouldTriggerForTimeToLeaveRefreshGivenImmediateDepartureTimelinessStatusForSourceClientIdentifier:(id)a3 oldNotificationData:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = [a4 hasDisplayedLeaveNowMessage];
  id v7 = +[CALNLogSubsystem calendar];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v11 = 138543362;
      id v12 = v5;
      id v9 = "Should not trigger for time to leave because an alert was already fired for this event and showed a 'Leave No"
           "w' message. source client identifier = %{public}@";
LABEL_6:
      _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (v8)
  {
    int v11 = 138543362;
    id v12 = v5;
    id v9 = "Should trigger for time to leave because the user needs to see the 'Leave Now' alert. source client identifier = %{public}@";
    goto LABEL_6;
  }

  return v6 ^ 1;
}

- (BOOL)_eventWillEndBeforeUserArrivesForHypothesis:(id)a3 eventEndDate:(id)a4
{
  id v6 = a4;
  [a3 aggressiveTravelTime];
  double v8 = v7;
  id v9 = [(CALNDefaultTriggeredEventNotificationTriggerHelper *)self dateProvider];
  id v10 = [v9 now];
  int v11 = [v10 dateByAddingTimeInterval:v8];

  LOBYTE(v9) = [v11 CalIsAfterDate:v6];
  return (char)v9;
}

- (BOOL)_exceededMaximumTravelTimeThresholdForHypothesis:(id)a3
{
  [a3 conservativeTravelTime];
  double v5 = v4;
  id v6 = [(CALNDefaultTriggeredEventNotificationTriggerHelper *)self travelAdvisoryAuthority];
  [v6 maximumAllowableTravelTime];
  double v8 = v7;

  return v5 > v8;
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

@end