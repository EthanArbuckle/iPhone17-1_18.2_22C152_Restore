@interface CALNTriggeredEventNotificationFeedbackHelper
+ (void)recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:(id)a3 event:(id)a4 hypothesis:(id)a5 travelAdvisoryTimelinessPeriod:(unint64_t)a6 foundInAppsEventTracker:(id)a7 suggestionsServiceLogger:(id)a8 ttlEventTracker:(id)a9;
+ (void)sendFeedbackForPostingNotificationWithTravelAdvisoryTimelinessPeriod:(unint64_t)a3 sourceClientIdentifier:(id)a4 travelEngine:(id)a5;
@end

@implementation CALNTriggeredEventNotificationFeedbackHelper

+ (void)recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:(id)a3 event:(id)a4 hypothesis:(id)a5 travelAdvisoryTimelinessPeriod:(unint64_t)a6 foundInAppsEventTracker:(id)a7 suggestionsServiceLogger:(id)a8 ttlEventTracker:(id)a9
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  if (a6)
  {
    v20 = +[CALNTimeToLeaveEventTrackerUtilities ttlEventTrackerAlertTypeForTravelAdvisoryTimelinessPeriod:a6];
    v21 = v20;
    if (v20)
    {
      uint64_t v22 = [v20 unsignedIntegerValue];
      uint64_t v23 = v22;
      if (v15)
      {
        uint64_t v48 = v22;
        v24 = [v15 suggestionInfo];

        if (v24)
        {
          [v17 trackPseudoEventInitialTimeToLeaveFired];
          v25 = [v15 suggestionInfo];
          v26 = [v25 uniqueKey];

          [v18 logEventShowedTimeToLeaveNotificationWithUniqueKey:v26];
          v27 = +[CALNLogSubsystem calendar];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v51 = v14;
            __int16 v52 = 2112;
            v53 = v26;
            _os_log_impl(&dword_2216BB000, v27, OS_LOG_TYPE_DEFAULT, "Tracked pseudo event initial time to leave fired and logged event showed time to leave notification for source client identifier = %{public}@, unique key = %@", buf, 0x16u);
          }
        }
        if (v16)
        {
          id v45 = v18;
          id v46 = v17;
          id v44 = v14;
          unint64_t v28 = +[CALNTimeToLeaveEventTrackerUtilities ttlEventTrackerTransportTypeForGEOTransportType:](CALNTimeToLeaveEventTrackerUtilities, "ttlEventTrackerTransportTypeForGEOTransportType:", [v16 transportType]);
          unint64_t v29 = +[CALNTimeToLeaveEventTrackerUtilities ttlEventTrackerETATypeForHypothesis:v16];
          v30 = v19;
          unint64_t v31 = +[CALNTimeToLeaveEventTrackerUtilities ttlEventTrackerTravelStateForHypothesisTravelState:](CALNTimeToLeaveEventTrackerUtilities, "ttlEventTrackerTravelStateForHypothesisTravelState:", [v16 travelState]);
          uint64_t v32 = [v15 hasPredictedLocation];
          v33 = [v15 calendar];
          uint64_t v34 = [v33 sharingStatus];
          unint64_t v41 = v28;
          v43 = v30;
          unint64_t v35 = v28;
          id v14 = v44;
          unint64_t v39 = v31;
          [v30 trackEventFiredTTLAlertWithAlertType:v48 transportType:v35 etaType:v29 travelState:v31 hasSuggestedLocation:v32 isOnSharedCalendar:v34 != 0];
          v47 = +[CALNLogSubsystem calendar];
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            v49 = [NSNumber numberWithUnsignedInteger:v48];
            v42 = [NSNumber numberWithUnsignedInteger:v41];
            v36 = [NSNumber numberWithUnsignedInteger:v29];
            v40 = [NSNumber numberWithUnsignedInteger:v39];
            v37 = [NSNumber numberWithBool:v32];
            v38 = [NSNumber numberWithBool:v34 != 0];
            *(_DWORD *)buf = 138544898;
            id v51 = v44;
            __int16 v52 = 2114;
            v53 = v49;
            __int16 v54 = 2114;
            v55 = v42;
            __int16 v56 = 2114;
            v57 = v36;
            __int16 v58 = 2114;
            v59 = v40;
            __int16 v60 = 2114;
            v61 = v37;
            __int16 v62 = 2114;
            v63 = v38;
            _os_log_impl(&dword_2216BB000, v47, OS_LOG_TYPE_DEFAULT, "Tracked event fired ttl alert with source client identifier = %{public}@, alert type = %{public}@, transport type = %{public}@, eta type = %{public}@, travel state = %{public}@, has suggested location = %{public}@, is on shared calendar = %{public}@", buf, 0x48u);
          }
          id v18 = v45;
          id v17 = v46;
          id v19 = v43;
        }
        else
        {
          v33 = +[CALNLogSubsystem calendar];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            +[CALNTriggeredEventNotificationFeedbackHelper recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:event:hypothesis:travelAdvisoryTimelinessPeriod:foundInAppsEventTracker:suggestionsServiceLogger:ttlEventTracker:].cold.4((uint64_t)v14, v48);
          }
        }
      }
      else
      {
        v33 = +[CALNLogSubsystem calendar];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          +[CALNTriggeredEventNotificationFeedbackHelper recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:event:hypothesis:travelAdvisoryTimelinessPeriod:foundInAppsEventTracker:suggestionsServiceLogger:ttlEventTracker:]((uint64_t)v14, v23);
        }
      }
    }
    else
    {
      v33 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        +[CALNTriggeredEventNotificationFeedbackHelper recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:event:hypothesis:travelAdvisoryTimelinessPeriod:foundInAppsEventTracker:suggestionsServiceLogger:ttlEventTracker:](a6);
      }
    }
  }
  else
  {
    v21 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[CALNTriggeredEventNotificationFeedbackHelper recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:event:hypothesis:travelAdvisoryTimelinessPeriod:foundInAppsEventTracker:suggestionsServiceLogger:ttlEventTracker:]();
    }
  }
}

+ (void)sendFeedbackForPostingNotificationWithTravelAdvisoryTimelinessPeriod:(unint64_t)a3 sourceClientIdentifier:(id)a4 travelEngine:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [NSNumber numberWithUnsignedInteger:a3];
    int v14 = 138543618;
    id v15 = v7;
    __int16 v16 = 2114;
    id v17 = v10;
    _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Preparing to send feedback for posting notification with source client identifier = %{public}@, travel advisory timeliness status = %{public}@", (uint8_t *)&v14, 0x16u);
  }
  switch(a3)
  {
    case 0uLL:
    case 3uLL:
      v11 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [NSNumber numberWithUnsignedInteger:a3];
        int v14 = 138543618;
        id v15 = v7;
        __int16 v16 = 2114;
        id v17 = v12;
        _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Determined not to send feedback for added notification with source client identifier = %{public}@, travel advisory timeliness status = %{public}@", (uint8_t *)&v14, 0x16u);
      }
      goto LABEL_11;
    case 1uLL:
      [v8 sendFeedbackForPostingLeaveByNotificationForEventWithExternalURL:v7];
      v11 = +[CALNLogSubsystem calendar];
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      int v14 = 138543362;
      id v15 = v7;
      v13 = "Sent feedback for posting leave by notification for event with external URL = %{public}@";
      break;
    case 2uLL:
      [v8 sendFeedbackForPostingLeaveNowNotificationForEventWithExternalURL:v7];
      v11 = +[CALNLogSubsystem calendar];
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      int v14 = 138543362;
      id v15 = v7;
      v13 = "Sent feedback for posting leave now notification for event with external URL = %{public}@";
      break;
    default:
      goto LABEL_12;
  }
  _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v14, 0xCu);
LABEL_11:

LABEL_12:
}

+ (void)recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:event:hypothesis:travelAdvisoryTimelinessPeriod:foundInAppsEventTracker:suggestionsServiceLogger:ttlEventTracker:.cold.1()
{
  v0 = [NSNumber numberWithUnsignedInteger:0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2216BB000, v1, v2, "Cannot record display of initial time to leave alert with travel advisory status = %{public}@, source client identifier = %{public}@", v3, v4, v5, v6, v7);
}

+ (void)recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:(uint64_t)a1 event:hypothesis:travelAdvisoryTimelinessPeriod:foundInAppsEventTracker:suggestionsServiceLogger:ttlEventTracker:.cold.2(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2216BB000, v2, v3, "Could not get ttl event tracker alert type for travel advisory timeliness status = %{public}@, source client identifier = %{public}@", v4, v5, v6, v7, v8);
}

+ (void)recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:(uint64_t)a1 event:(uint64_t)a2 hypothesis:travelAdvisoryTimelinessPeriod:foundInAppsEventTracker:suggestionsServiceLogger:ttlEventTracker:.cold.3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:a2];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2216BB000, v3, v4, "Cannot record display of initial time to leave alert because could not get event to compute required supporting metrics for source client identifier = %{public}@, alert type = %{public}@", v5, v6, v7, v8, v9);
}

+ (void)recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:(uint64_t)a1 event:(uint64_t)a2 hypothesis:travelAdvisoryTimelinessPeriod:foundInAppsEventTracker:suggestionsServiceLogger:ttlEventTracker:.cold.4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:a2];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2216BB000, v3, v4, "Cannot record display of initial time to leave alert because no hypothesis available to compute required supporting metrics for source client identifier = %{public}@, alert type = %{public}@", v5, v6, v7, v8, v9);
}

@end