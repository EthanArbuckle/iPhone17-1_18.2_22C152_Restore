@interface ATXActivityTriggerSuggestion
- (ATXActivity)activity;
- (ATXActivityTriggerSuggestion)initWithActivity:(id)a3 activitySuggestionClient:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXActivityTriggerSuggestion:(id)a3;
- (NSArray)triggers;
- (NSString)localizedTriggerSuggestionText;
- (NSString)suggestionUUID;
- (NSString)uuidString;
- (id)_localizableStringForModeSemanticType:(int64_t)a3;
- (id)_localizedStringForDrivingTriggerFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5;
- (id)_localizedStringForGameControllerTriggerFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5;
- (id)_localizedStringForLocationTriggerFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5;
- (id)_localizedStringForScreenActivityTriggerFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5;
- (id)_localizedStringForSleepingTriggerFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5;
- (id)_localizedStringForSmartActivationFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5;
- (id)_localizedStringForWorkoutTriggerFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5;
- (unint64_t)hash;
- (unint64_t)location;
- (void)localizedTriggerSuggestionText;
@end

@implementation ATXActivityTriggerSuggestion

- (ATXActivityTriggerSuggestion)initWithActivity:(id)a3 activitySuggestionClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXActivityTriggerSuggestion;
  v9 = [(ATXActivityTriggerSuggestion *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activity, a3);
    objc_storeStrong((id *)&v10->_activitySuggestionClient, a4);
  }

  return v10;
}

- (NSString)uuidString
{
  return [(ATXActivity *)self->_activity modeUUID];
}

- (unint64_t)location
{
  return [(ATXActivity *)self->_activity location];
}

- (NSArray)triggers
{
  return [(ATXActivity *)self->_activity triggers];
}

- (NSString)localizedTriggerSuggestionText
{
  activitySuggestionClient = self->_activitySuggestionClient;
  v4 = [(ATXActivity *)self->_activity triggers];
  v5 = [(ATXActivitySuggestionClient *)activitySuggestionClient triggersToDNDModeConfigurationTriggers:v4];

  if (![v5 count])
  {
    v6 = __atxlog_handle_modes();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      [(ATXActivityTriggerSuggestion *)v6 localizedTriggerSuggestionText];
    }
    goto LABEL_11;
  }
  if ((unint64_t)[v5 count] >= 2)
  {
    v6 = __atxlog_handle_modes();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      [(ATXActivityTriggerSuggestion *)v6 localizedTriggerSuggestionText];
    }
    goto LABEL_11;
  }
  [(ATXActivity *)self->_activity activityType];
  v6 = ATXActivityTypeToDNDModeSemanticType();
  if (!v6)
  {
LABEL_11:
    v26 = 0;
    goto LABEL_12;
  }
  v21 = [(ATXActivity *)self->_activity userModeName];
  if (![v21 length])
  {
    v23 = __atxlog_handle_modes();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      [(ATXActivityTriggerSuggestion *)v23 localizedTriggerSuggestionText];
    }
    v26 = 0;
    goto LABEL_30;
  }
  uint64_t v22 = [v6 integerValue];
  v23 = [v5 firstObject];
  v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v25 = [(ATXActivityTriggerSuggestion *)self _localizedStringForSmartActivationFromBundle:v24 semanticType:v22 userModeName:v21];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v25 = [(ATXActivityTriggerSuggestion *)self _localizedStringForLocationTriggerFromBundle:v24 semanticType:v22 userModeName:v21];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v25 = [(ATXActivityTriggerSuggestion *)self _localizedStringForSleepingTriggerFromBundle:v24 semanticType:v22 userModeName:v21];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v25 = [(ATXActivityTriggerSuggestion *)self _localizedStringForDrivingTriggerFromBundle:v24 semanticType:v22 userModeName:v21];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v25 = [(ATXActivityTriggerSuggestion *)self _localizedStringForWorkoutTriggerFromBundle:v24 semanticType:v22 userModeName:v21];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v35 = __atxlog_handle_modes();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
                [(ATXActivityTriggerSuggestion *)(uint64_t)v23 localizedTriggerSuggestionText];
              }

              v26 = 0;
              goto LABEL_29;
            }
            uint64_t v25 = [(ATXActivityTriggerSuggestion *)self _localizedStringForGameControllerTriggerFromBundle:v24 semanticType:v22 userModeName:v21];
          }
        }
      }
    }
  }
  v26 = (void *)v25;
LABEL_29:

LABEL_30:
LABEL_12:

  return (NSString *)v26;
}

- (id)_localizableStringForModeSemanticType:(int64_t)a3
{
  int64_t v4 = a3 + 1;
  if (unint64_t)(a3 + 1) < 0xB && ((0x5FFu >> v4)) {
    return (id)qword_1E5D087C0[v4];
  }
  v5 = __atxlog_handle_modes();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[ATXActivityTriggerSuggestion _localizableStringForModeSemanticType:](a3, v5);
  }

  return 0;
}

- (id)_localizedStringForSmartActivationFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(ATXActivityTriggerSuggestion *)self _localizableStringForModeSemanticType:a4];
  uint64_t v11 = (void *)v10;
  uint64_t v12 = NSString;
  if (v10)
  {
    uint64_t v13 = [NSString stringWithFormat:@"Use Smart Activation to turn on %@ automatically based on signals like your location, app usage, and others.", v10];
    [v8 localizedStringForKey:v13 value:&stru_1EFD9B408 table:0];
  }
  else
  {
    uint64_t v13 = [v8 localizedStringForKey:@"Use Smart Activation to turn on %@ Focus automatically based on signals like your location, app usage, and others.", &stru_1EFD9B408, 0 value table];
    objc_msgSend(v12, "localizedStringWithFormat:", v13, v9);
  uint64_t v14 = };

  return v14;
}

- (id)_localizedStringForLocationTriggerFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5
{
  id v7 = a3;
  id v8 = [(ATXActivityTriggerSuggestion *)self _localizableStringForModeSemanticType:a4];
  if (a4 == 5)
  {
    id v9 = @"Allow %@ to automatically turn on when you are at home?";
    goto LABEL_5;
  }
  if (a4 == 4)
  {
    id v9 = @"Allow %@ to automatically turn on when you are at work?";
LABEL_5:
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", v9, v8);
    uint64_t v11 = [v7 localizedStringForKey:v10 value:&stru_1EFD9B408 table:0];

    goto LABEL_7;
  }
  uint64_t v11 = 0;
LABEL_7:

  return v11;
}

- (id)_localizedStringForSleepingTriggerFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5
{
  id v7 = a3;
  id v8 = [(ATXActivityTriggerSuggestion *)self _localizableStringForModeSemanticType:a4];
  if (a4 == 1)
  {
    id v9 = [NSString stringWithFormat:@"Allow %@ to automatically turn on during your scheduled bedtime?", v8];
    uint64_t v10 = [v7 localizedStringForKey:v9 value:&stru_1EFD9B408 table:0];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_localizedStringForDrivingTriggerFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(ATXActivityTriggerSuggestion *)self _localizableStringForModeSemanticType:a4];
  if (a4 == -1)
  {
    uint64_t v13 = NSString;
    uint64_t v11 = [v8 localizedStringForKey:@"Allow %@ Focus to automatically turn on when you are driving?" value:&stru_1EFD9B408 table:0];
    uint64_t v12 = objc_msgSend(v13, "localizedStringWithFormat:", v11, v9);
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    uint64_t v11 = [NSString stringWithFormat:@"Allow %@ to automatically turn on when you are driving?", v10];
    uint64_t v12 = [v8 localizedStringForKey:v11 value:&stru_1EFD9B408 table:0];
LABEL_5:
    uint64_t v14 = (void *)v12;

    goto LABEL_7;
  }
  uint64_t v14 = 0;
LABEL_7:

  return v14;
}

- (id)_localizedStringForWorkoutTriggerFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(ATXActivityTriggerSuggestion *)self _localizableStringForModeSemanticType:a4];
  if (a4 == -1)
  {
    uint64_t v13 = NSString;
    uint64_t v11 = [v8 localizedStringForKey:@"Allow %@ Focus to automatically turn on when you start a workout on your Apple Watch?" value:&stru_1EFD9B408 table:0];
    uint64_t v12 = objc_msgSend(v13, "localizedStringWithFormat:", v11, v9);
    goto LABEL_5;
  }
  if (a4 == 3)
  {
    uint64_t v11 = [NSString stringWithFormat:@"Allow %@ to automatically turn on when you start a workout on your Apple Watch?", v10];
    uint64_t v12 = [v8 localizedStringForKey:v11 value:&stru_1EFD9B408 table:0];
LABEL_5:
    uint64_t v14 = (void *)v12;

    goto LABEL_7;
  }
  uint64_t v14 = 0;
LABEL_7:

  return v14;
}

- (id)_localizedStringForGameControllerTriggerFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5
{
  id v7 = a3;
  id v8 = [(ATXActivityTriggerSuggestion *)self _localizableStringForModeSemanticType:a4];
  if (a4 == 7)
  {
    id v9 = [NSString stringWithFormat:@"Allow %@ to automatically turn on when you connect a game controller?", v8];
    uint64_t v10 = [v7 localizedStringForKey:v9 value:&stru_1EFD9B408 table:0];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_localizedStringForScreenActivityTriggerFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5
{
  id v7 = a3;
  id v8 = [(ATXActivityTriggerSuggestion *)self _localizableStringForModeSemanticType:a4];
  if (a4)
  {
    id v9 = 0;
  }
  else
  {
    uint64_t v10 = [NSString stringWithFormat:@"Allow %@ to automatically turn on when you share or record your screen?", v8];
    id v9 = [v7 localizedStringForKey:v10 value:&stru_1EFD9B408 table:0];
  }

  return v9;
}

- (NSString)suggestionUUID
{
  return [(ATXActivity *)self->_activity suggestionUUID];
}

- (unint64_t)hash
{
  return [(ATXActivity *)self->_activity hash];
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (ATXActivityTriggerSuggestion *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXActivityTriggerSuggestion *)self isEqualToATXActivityTriggerSuggestion:v5];

  return v6;
}

- (BOOL)isEqualToATXActivityTriggerSuggestion:(id)a3
{
  activity = self->_activity;
  int64_t v4 = [a3 activity];
  LOBYTE(activity) = [(ATXActivity *)activity isEqual:v4];

  return (char)activity;
}

- (ATXActivity)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);

  objc_storeStrong((id *)&self->_activitySuggestionClient, 0);
}

- (void)localizedTriggerSuggestionText
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  int64_t v4 = NSStringFromClass(v3);
  int v5 = 138543362;
  BOOL v6 = v4;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "The trigger %{public}@ was not handled", (uint8_t *)&v5, 0xCu);
}

- (void)_localizableStringForModeSemanticType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "Unhandled DND semantic type: %ld", (uint8_t *)&v2, 0xCu);
}

@end