@interface ATXActivity
- (ATXActivity)initWithBMInferredModeEvent:(id)a3;
- (ATXActivity)initWithBiomeInferredModeEvent:(id)a3;
- (ATXActivity)initWithModeUUID:(id)a3 userModeName:(id)a4 activityType:(unint64_t)a5 origin:(int64_t)a6 originBundleId:(id)a7 originAnchorType:(id)a8 allowsSmartEntry:(BOOL)a9 suggestionUUID:(id)a10 triggers:(id)a11 location:(unint64_t)a12 shouldSuggestTriggers:(BOOL)a13;
- (BOOL)allowsSmartEntry;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXActivity:(id)a3;
- (BOOL)shouldSuggestTriggers;
- (NSArray)triggers;
- (NSString)identifier;
- (NSString)localizedSuggestionReason;
- (NSString)modeUUID;
- (NSString)originAnchorType;
- (NSString)originBundleId;
- (NSString)suggestionUUID;
- (NSString)userModeName;
- (id)_anchorSuggestionReasonLocalizationKey;
- (id)_heuristicSuggestionReasonLocalizationKey;
- (id)_suggestionReasonLocalizationKey;
- (int64_t)origin;
- (unint64_t)activityType;
- (unint64_t)hash;
- (unint64_t)location;
- (void)_anchorSuggestionReasonLocalizationKey;
- (void)_heuristicSuggestionReasonLocalizationKey;
- (void)_suggestionReasonLocalizationKey;
- (void)localizedSuggestionReason;
@end

@implementation ATXActivity

- (ATXActivity)initWithBMInferredModeEvent:(id)a3
{
  id v3 = a3;
  v19 = [v3 modeUUID];
  v18 = [v3 userModeName];
  [v3 modeType];
  uint64_t v17 = BMInferredModeTypeToActivity();
  uint64_t v4 = [v3 origin];
  v5 = [v3 originBundleId];
  v6 = [v3 originAnchorType];
  char v7 = [v3 isAutomationEnabled];
  v8 = [v3 suggestionUUID];
  v9 = [v3 serializedTriggers];
  v10 = ATXDeserializeTriggers();
  uint64_t v11 = [v3 uiLocation];
  char v12 = [v3 shouldSuggestTriggers];

  LOBYTE(v16) = v12;
  LOBYTE(v15) = v7;
  v13 = [(ATXActivity *)self initWithModeUUID:v19 userModeName:v18 activityType:v17 origin:v4 originBundleId:v5 originAnchorType:v6 allowsSmartEntry:v15 suggestionUUID:v8 triggers:v10 location:v11 shouldSuggestTriggers:v16];

  return v13;
}

- (ATXActivity)initWithBiomeInferredModeEvent:(id)a3
{
  id v3 = a3;
  v19 = [v3 modeIdentifier];
  v18 = [v3 userModeName];
  [v3 modeType];
  uint64_t v17 = BMUserFocusInferredModeTypeToActivity();
  [v3 origin];
  uint64_t v4 = BMUserFocusInferredModeOriginToLegacy();
  v5 = [v3 originBundleID];
  v6 = [v3 originAnchorType];
  char v7 = [v3 isAutomationEnabled];
  v8 = [v3 uuid];
  v9 = [v3 serializedTriggers];
  v10 = ATXDeserializeTriggers();
  uint64_t v11 = [v3 uiLocation];
  char v12 = [v3 shouldSuggestTriggers];

  LOBYTE(v16) = v12;
  LOBYTE(v15) = v7;
  v13 = [(ATXActivity *)self initWithModeUUID:v19 userModeName:v18 activityType:v17 origin:v4 originBundleId:v5 originAnchorType:v6 allowsSmartEntry:v15 suggestionUUID:v8 triggers:v10 location:v11 shouldSuggestTriggers:v16];

  return v13;
}

- (ATXActivity)initWithModeUUID:(id)a3 userModeName:(id)a4 activityType:(unint64_t)a5 origin:(int64_t)a6 originBundleId:(id)a7 originAnchorType:(id)a8 allowsSmartEntry:(BOOL)a9 suggestionUUID:(id)a10 triggers:(id)a11 location:(unint64_t)a12 shouldSuggestTriggers:(BOOL)a13
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a7;
  id v22 = a8;
  id v23 = a10;
  id v24 = a11;
  v39.receiver = self;
  v39.super_class = (Class)ATXActivity;
  v25 = [(ATXActivity *)&v39 init];
  if (v25)
  {
    uint64_t v26 = [v19 copy];
    modeUUID = v25->_modeUUID;
    v25->_modeUUID = (NSString *)v26;

    uint64_t v28 = [v20 copy];
    userModeName = v25->_userModeName;
    v25->_userModeName = (NSString *)v28;

    v25->_activityType = a5;
    v25->_origin = a6;
    uint64_t v30 = [v21 copy];
    originBundleId = v25->_originBundleId;
    v25->_originBundleId = (NSString *)v30;

    uint64_t v32 = [v22 copy];
    originAnchorType = v25->_originAnchorType;
    v25->_originAnchorType = (NSString *)v32;

    uint64_t v34 = [v23 copy];
    suggestionUUID = v25->_suggestionUUID;
    v25->_suggestionUUID = (NSString *)v34;

    v25->_allowsSmartEntry = a9;
    v25->_location = a12;
    uint64_t v36 = [v24 copy];
    triggers = v25->_triggers;
    v25->_triggers = (NSArray *)v36;

    v25->_shouldSuggestTriggers = a13;
  }

  return v25;
}

- (NSString)identifier
{
  return self->_modeUUID;
}

- (NSString)localizedSuggestionReason
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = __atxlog_handle_modes();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t activityType = self->_activityType;
    int64_t origin = self->_origin;
    originAnchorType = self->_originAnchorType;
    int v11 = 134218498;
    unint64_t v12 = activityType;
    __int16 v13 = 2048;
    int64_t v14 = origin;
    __int16 v15 = 2112;
    uint64_t v16 = originAnchorType;
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "ATXActivity - Generating localizedSuggestionReason for activity type %ld, origin %ld, and origin anchor type %@", (uint8_t *)&v11, 0x20u);
  }

  char v7 = [(ATXActivity *)self _suggestionReasonLocalizationKey];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:v7 value:0 table:0];
  }
  else
  {
    v8 = __atxlog_handle_modes();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[ATXActivity localizedSuggestionReason]();
    }
    v9 = 0;
  }

  return (NSString *)v9;
}

- (id)_suggestionReasonLocalizationKey
{
  p_int64_t origin = &self->_origin;
  unint64_t v3 = self->_origin + 1;
  if (v3 > 0x11)
  {
    v5 = __atxlog_handle_modes();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXActivity *)(uint64_t)p_origin _suggestionReasonLocalizationKey];
    }
  }
  else
  {
    if (((1 << v3) & 0x3E7FC) != 0)
    {
      uint64_t v4 = [(ATXActivity *)self _heuristicSuggestionReasonLocalizationKey];
      goto LABEL_10;
    }
    if (((1 << v3) & 0x1003) == 0)
    {
      uint64_t v4 = [(ATXActivity *)self _anchorSuggestionReasonLocalizationKey];
      goto LABEL_10;
    }
  }
  uint64_t v4 = 0;
LABEL_10:

  return v4;
}

- (id)_anchorSuggestionReasonLocalizationKey
{
  p_originAnchorType = &self->_originAnchorType;
  if ([(NSString *)self->_originAnchorType isEqualToString:@"BluetoothConnectedAnchor"]) {
    return @"FOCUS_SUGGESTION_REASON_Anchor_BluetoothConnected";
  }
  if ([(NSString *)*p_originAnchorType isEqualToString:@"BluetoothDisconnectedAnchor"]) {
    return @"FOCUS_SUGGESTION_REASON_Anchor_BluetoothDisconnected";
  }
  if ([(NSString *)*p_originAnchorType isEqualToString:@"IdleTimeBeginAnchor"]) {
    return @"FOCUS_SUGGESTION_REASON_Anchor_IdleTimeBegin";
  }
  if ([(NSString *)*p_originAnchorType isEqualToString:@"IdleTimeEndAnchor"]) {
    return @"FOCUS_SUGGESTION_REASON_Anchor_IdleTimeEnd";
  }
  if ([(NSString *)*p_originAnchorType isEqualToString:@"CarPlayConnectedAnchor"]) {
    return @"FOCUS_SUGGESTION_REASON_Anchor_CarPlayConnected";
  }
  if ([(NSString *)*p_originAnchorType isEqualToString:@"CarPlayDisconnectedAnchor"]) {
    return @"FOCUS_SUGGESTION_REASON_Anchor_CarPlayDisconnected";
  }
  if ([(NSString *)*p_originAnchorType isEqualToString:@"LOIEntranceAnchor"]) {
    return @"FOCUS_SUGGESTION_REASON_Anchor_LOIEntrance";
  }
  if ([(NSString *)*p_originAnchorType isEqualToString:@"LOIExitAnchor"]) {
    return @"FOCUS_SUGGESTION_REASON_Anchor_LOIExit";
  }
  if ([(NSString *)*p_originAnchorType isEqualToString:@"WiredAudioDeviceConnectedAnchor"]) {
    return @"FOCUS_SUGGESTION_REASON_Anchor_WiredAudioDeviceConnected";
  }
  if ([(NSString *)*p_originAnchorType isEqualToString:@"WiredAudioDeviceDisconnectedAnchor"])
  {
    return @"FOCUS_SUGGESTION_REASON_Anchor_WiredAudioDeviceDisconnected";
  }
  if ([(NSString *)*p_originAnchorType isEqualToString:@"ChargerConnectedAnchor"]) {
    return @"FOCUS_SUGGESTION_REASON_Anchor_ChargerConnected";
  }
  if ([(NSString *)*p_originAnchorType isEqualToString:@"MicrolocationVisitAnchor"]) {
    return @"FOCUS_SUGGESTION_REASON_Anchor_MicrolocationVisit";
  }
  if ([(NSString *)*p_originAnchorType isEqualToString:@"UpcomingCommuteToWorkAnchor"]) {
    return @"FOCUS_SUGGESTION_REASON_Anchor_UpcomingCommuteToWork";
  }
  if ([(NSString *)*p_originAnchorType isEqualToString:@"UpcomingCommuteFromWorkAnchor"]) {
    return @"FOCUS_SUGGESTION_REASON_Anchor_UpcomingCommuteFromWork";
  }
  if ([(NSString *)*p_originAnchorType isEqualToString:@"GymArrivalAnchor"]) {
    return @"FOCUS_SUGGESTION_REASON_Anchor_GymArrival";
  }
  uint64_t v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    [(ATXActivity *)(uint64_t)p_originAnchorType _anchorSuggestionReasonLocalizationKey];
  }

  return 0;
}

- (id)_heuristicSuggestionReasonLocalizationKey
{
  p_unint64_t activityType = &self->_activityType;
  uint64_t v4 = ATXActivityTypeToDNDModeSemanticType();
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 integerValue];
    uint64_t v7 = 0;
    switch(v6)
    {
      case -1:
      case 8:
      case 9:
        goto LABEL_33;
      case 0:
        int64_t origin = self->_origin;
        if (origin == 13)
        {
          uint64_t v7 = @"FOCUS_SUGGESTION_REASON_Heuristic_Default_ScreenRecording";
        }
        else
        {
          if (origin != 12) {
            goto LABEL_29;
          }
          uint64_t v7 = @"FOCUS_SUGGESTION_REASON_Heuristic_Default_ScreenShare";
        }
        goto LABEL_33;
      case 1:
        int64_t v22 = self->_origin;
        if (v22 == 5)
        {
          uint64_t v7 = @"FOCUS_SUGGESTION_REASON_Heuristic_Sleep_Sleep";
        }
        else
        {
          if (v22 != 16) {
            goto LABEL_29;
          }
          uint64_t v7 = @"FOCUS_SUGGESTION_REASON_Heuristic_Sleep_BacklightData";
        }
        goto LABEL_33;
      case 2:
        if ((unint64_t)(self->_origin - 1) >= 3) {
          goto LABEL_29;
        }
        uint64_t v7 = @"FOCUS_SUGGESTION_REASON_Heuristic_Driving_CoreMotion_OR_DNDWD_OR_CarPlay";
        goto LABEL_33;
      case 3:
        int64_t v23 = self->_origin;
        if (v23 == 7)
        {
          uint64_t v7 = @"FOCUS_SUGGESTION_REASON_Heuristic_Exercise_WatchWorkout";
        }
        else
        {
          if (v23 != 15) {
            goto LABEL_29;
          }
          uint64_t v7 = @"FOCUS_SUGGESTION_REASON_Heuristic_Exercise_NearbyGym";
        }
        goto LABEL_33;
      case 4:
        int64_t v24 = self->_origin;
        switch(v24)
        {
          case 4:
            uint64_t v7 = @"FOCUS_SUGGESTION_REASON_Heuristic_Work_CoreRoutine";
            goto LABEL_33;
          case 8:
            uint64_t v7 = @"FOCUS_SUGGESTION_REASON_Heuristic_Work_WFHClassifier";
            goto LABEL_33;
          case 9:
            uint64_t v7 = @"FOCUS_SUGGESTION_REASON_Heuristic_Work_Calendar";
            goto LABEL_33;
        }
LABEL_29:
        v25 = __atxlog_handle_modes();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
          -[ATXActivity _heuristicSuggestionReasonLocalizationKey]();
        }

        break;
      case 5:
        if (self->_origin != 4) {
          goto LABEL_29;
        }
        uint64_t v7 = @"FOCUS_SUGGESTION_REASON_Heuristic_PersonalTime_CoreRoutine";
        goto LABEL_33;
      case 6:
        if (self->_origin != 6) {
          goto LABEL_29;
        }
        uint64_t v7 = @"FOCUS_SUGGESTION_REASON_Heuristic_Reading_AppLaunch";
        goto LABEL_33;
      case 7:
        if (self->_origin != 6) {
          goto LABEL_29;
        }
        uint64_t v7 = @"FOCUS_SUGGESTION_REASON_Heuristic_Gaming_AppLaunch";
        goto LABEL_33;
      default:
        uint64_t v9 = __atxlog_handle_modes();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          [(ATXActivity *)v6 _heuristicSuggestionReasonLocalizationKey];
        }
        goto LABEL_8;
    }
  }
  else
  {
    uint64_t v9 = __atxlog_handle_modes();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      [(ATXActivity *)(uint64_t)p_activityType _heuristicSuggestionReasonLocalizationKey];
    }
LABEL_8:
  }
  uint64_t v7 = 0;
LABEL_33:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_modeUUID hash];
  NSUInteger v4 = [(NSString *)self->_suggestionUUID hash];
  unint64_t v5 = self->_activityType - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  uint64_t v6 = self->_allowsSmartEntry - v5 + 32 * v5;
  int64_t v7 = self->_origin - v6 + 32 * v6;
  unint64_t v8 = self->_location - v7 + 32 * v7;
  NSUInteger v9 = [(NSString *)self->_originBundleId hash] - v8 + 32 * v8;
  NSUInteger v10 = [(NSString *)self->_originAnchorType hash];
  return self->_shouldSuggestTriggers - (v10 - v9 + 32 * v9) + 32 * (v10 - v9 + 32 * v9);
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (ATXActivity *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXActivity *)self isEqualToATXActivity:v5];

  return v6;
}

- (BOOL)isEqualToATXActivity:(id)a3
{
  id v4 = a3;
  modeUUID = self->_modeUUID;
  BOOL v6 = [v4 modeUUID];
  LODWORD(modeUUID) = [(NSString *)modeUUID isEqualToString:v6];

  if (!modeUUID) {
    goto LABEL_21;
  }
  suggestionUUID = self->_suggestionUUID;
  unint64_t v8 = [v4 suggestionUUID];
  LODWORD(suggestionUUID) = [(NSString *)suggestionUUID isEqualToString:v8];

  if (!suggestionUUID) {
    goto LABEL_21;
  }
  unint64_t activityType = self->_activityType;
  if (activityType != [v4 activityType]) {
    goto LABEL_21;
  }
  int allowsSmartEntry = self->_allowsSmartEntry;
  if (allowsSmartEntry != [v4 allowsSmartEntry]) {
    goto LABEL_21;
  }
  int64_t origin = self->_origin;
  if (origin != [v4 origin]) {
    goto LABEL_21;
  }
  location = (void *)self->_location;
  if (location != (void *)[v4 location]) {
    goto LABEL_21;
  }
  originBundleId = self->_originBundleId;
  uint64_t v14 = originBundleId;
  if (!originBundleId)
  {
    uint64_t v15 = [v4 originBundleId];
    if (!v15) {
      goto LABEL_14;
    }
    location = (void *)v15;
    uint64_t v14 = self->_originBundleId;
  }
  uint64_t v16 = [v4 originBundleId];
  BOOL v17 = [(NSString *)v14 isEqualToString:v16];

  if (originBundleId)
  {
    if (!v17) {
      goto LABEL_21;
    }
  }
  else
  {

    if (!v17) {
      goto LABEL_21;
    }
  }
LABEL_14:
  originAnchorType = self->_originAnchorType;
  uint64_t v19 = originAnchorType;
  if (originAnchorType) {
    goto LABEL_17;
  }
  uint64_t v20 = [v4 originAnchorType];
  if (v20)
  {
    location = (void *)v20;
    uint64_t v19 = self->_originAnchorType;
LABEL_17:
    uint64_t v21 = [v4 originAnchorType];
    BOOL v22 = [(NSString *)v19 isEqualToString:v21];

    if (originAnchorType)
    {
      if (v22) {
        goto LABEL_19;
      }
    }
    else
    {

      if (v22) {
        goto LABEL_19;
      }
    }
LABEL_21:
    BOOL v24 = 0;
    goto LABEL_22;
  }
LABEL_19:
  int shouldSuggestTriggers = self->_shouldSuggestTriggers;
  BOOL v24 = shouldSuggestTriggers == [v4 shouldSuggestTriggers];
LABEL_22:

  return v24;
}

- (NSString)modeUUID
{
  return self->_modeUUID;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (unint64_t)location
{
  return self->_location;
}

- (BOOL)shouldSuggestTriggers
{
  return self->_shouldSuggestTriggers;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (NSString)suggestionUUID
{
  return self->_suggestionUUID;
}

- (BOOL)allowsSmartEntry
{
  return self->_allowsSmartEntry;
}

- (int64_t)origin
{
  return self->_origin;
}

- (NSString)originBundleId
{
  return self->_originBundleId;
}

- (NSString)originAnchorType
{
  return self->_originAnchorType;
}

- (NSString)userModeName
{
  return self->_userModeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userModeName, 0);
  objc_storeStrong((id *)&self->_originAnchorType, 0);
  objc_storeStrong((id *)&self->_originBundleId, 0);
  objc_storeStrong((id *)&self->_suggestionUUID, 0);
  objc_storeStrong((id *)&self->_triggers, 0);

  objc_storeStrong((id *)&self->_modeUUID, 0);
}

- (void)localizedSuggestionReason
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_8();
  uint64_t v4 = v0;
  __int16 v5 = 2112;
  uint64_t v6 = v1;
  _os_log_fault_impl(&dword_1A790D000, v2, OS_LOG_TYPE_FAULT, "ATXActivity - Nil localization key found for activity type %ld, origin %ld, and origin anchor type %@", v3, 0x20u);
}

- (void)_suggestionReasonLocalizationKey
{
}

- (void)_anchorSuggestionReasonLocalizationKey
{
}

- (void)_heuristicSuggestionReasonLocalizationKey
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_8();
  uint64_t v3 = v0;
  _os_log_fault_impl(&dword_1A790D000, v1, OS_LOG_TYPE_FAULT, "Unexpected origin %ld found for DND semantic type: %ld", v2, 0x16u);
}

@end