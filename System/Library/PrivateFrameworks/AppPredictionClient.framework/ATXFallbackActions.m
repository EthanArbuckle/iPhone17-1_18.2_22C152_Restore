@interface ATXFallbackActions
+ (id)dateWithoutMinutesAndSeconds:(id)a3;
+ (id)fallbackActionsBundle;
+ (id)stringForFallbackActionType:(unint64_t)a3;
+ (unint64_t)fallbackActionTypeForString:(id)a3;
+ (void)fallbackActionsBundle;
- (ATXFallbackActions)initWithClientModelSpec:(id)a3;
- (id)createAnEventForCurrentDate:(id)a3;
- (id)localizedStringForKey:(id)a3;
- (id)proactiveSuggestionForAction:(id)a3;
- (id)searchSafari;
- (id)sendAMessage;
- (id)startATimer;
- (id)suggestionforSpecifiedFallbackActionType:(unint64_t)a3;
- (id)suggestionsForAllFallbackActions;
- (id)viewPhotos;
@end

@implementation ATXFallbackActions

- (ATXFallbackActions)initWithClientModelSpec:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXFallbackActions;
  v6 = [(ATXFallbackActions *)&v10 init];
  if (v6)
  {
    uint64_t v7 = +[ATXFallbackActions fallbackActionsBundle];
    bundle = v6->_bundle;
    v6->_bundle = (NSBundle *)v7;

    objc_storeStrong((id *)&v6->_clientModelSpec, a3);
  }

  return v6;
}

+ (id)fallbackActionsBundle
{
  v2 = +[ATXAssets2 pathForResource:@"ATXFallbackActions" ofType:&stru_1EFD9B408 isDirectory:1];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] bundleWithPath:v2];
    v4 = v3;
    if (v3)
    {
      v4 = v3;
      id v5 = v4;
    }
    else
    {
      v6 = __atxlog_handle_default();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        +[ATXFallbackActions fallbackActionsBundle]();
      }

      id v5 = 0;
    }
  }
  else
  {
    v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      +[ATXFallbackActions fallbackActionsBundle]();
    }
    id v5 = 0;
  }

  return v5;
}

- (id)localizedStringForKey:(id)a3
{
  return [(NSBundle *)self->_bundle localizedStringForKey:a3 value:0 table:@"ATXFallbackActions"];
}

- (id)viewPhotos
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.apple.placeholder.activity.type"];
  uint64_t v4 = [(ATXFallbackActions *)self localizedStringForKey:@"VIEW_PHOTOS_TITLE"];
  id v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = @"View photos";
  }
  [v3 setTitle:v6];

  [v3 setUserInfo:MEMORY[0x1E4F1CC08]];
  uint64_t v7 = [ATXAction alloc];
  v8 = objc_opt_new();
  LOBYTE(v12) = 0;
  v9 = [(ATXAction *)v7 initWithNSUserActivity:v3 actionUUID:v8 bundleId:@"com.apple.mobileslideshow" contentAttributeSet:0 itemIdentifier:0 heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v12 title:0 subtitle:0];

  objc_super v10 = [(ATXFallbackActions *)self proactiveSuggestionForAction:v9];

  return v10;
}

- (id)searchSafari
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"NSUserActivityTypeBrowsingWeb"];
  uint64_t v4 = [(ATXFallbackActions *)self localizedStringForKey:@"SEARCH_SAFARI_TITLE"];
  id v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = @"Search Safari";
  }
  [v3 setTitle:v6];

  [v3 setUserInfo:MEMORY[0x1E4F1CC08]];
  uint64_t v7 = [ATXAction alloc];
  v8 = objc_opt_new();
  LOBYTE(v12) = 0;
  v9 = [(ATXAction *)v7 initWithNSUserActivity:v3 actionUUID:v8 bundleId:@"com.apple.mobilesafari" contentAttributeSet:0 itemIdentifier:0 heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v12 title:0 subtitle:0];

  objc_super v10 = [(ATXFallbackActions *)self proactiveSuggestionForAction:v9];

  return v10;
}

- (id)startATimer
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.apple.clock.timer"];
  uint64_t v4 = [(ATXFallbackActions *)self localizedStringForKey:@"START_TIMER_TITLE"];
  id v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = @"Start a timer";
  }
  [v3 setTitle:v6];

  [v3 setUserInfo:MEMORY[0x1E4F1CC08]];
  uint64_t v7 = [ATXAction alloc];
  v8 = objc_opt_new();
  LOBYTE(v12) = 0;
  v9 = [(ATXAction *)v7 initWithNSUserActivity:v3 actionUUID:v8 bundleId:@"com.apple.mobiletimer" contentAttributeSet:0 itemIdentifier:0 heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v12 title:0 subtitle:0];

  objc_super v10 = [(ATXFallbackActions *)self proactiveSuggestionForAction:v9];

  return v10;
}

- (id)createAnEventForCurrentDate:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() dateWithoutMinutesAndSeconds:v4];

  v6 = [v5 dateByAddingTimeInterval:3600.0];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F304D0], "atx_createEventIntentWithStartDate:endDate:", v5, v6);
  if (!v7)
  {
    v16 = __atxlog_handle_default();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ATXFallbackActions createAnEventForCurrentDate:]();
    }

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = __atxlog_handle_default();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ATXFallbackActions createAnEventForCurrentDate:]();
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Generic intent created from EKUICreateEventIntent is not an INIntent object."];
LABEL_12:
    v15 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(ATXFallbackActions *)self localizedStringForKey:@"CREATE_CALENDAR_EVENT_TITLE"];
  v9 = (void *)v8;
  objc_super v10 = @"Create a new calendar event";
  if (v8) {
    objc_super v10 = (__CFString *)v8;
  }
  v11 = v10;

  uint64_t v12 = [ATXAction alloc];
  v13 = objc_opt_new();
  LOBYTE(v19) = 0;
  v14 = [(ATXAction *)v12 initWithIntent:v7 actionUUID:v13 bundleId:@"com.apple.mobilecal" heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v19 title:v11 subtitle:@" "];

  v15 = [(ATXFallbackActions *)self proactiveSuggestionForAction:v14];

LABEL_13:

  return v15;
}

+ (id)dateWithoutMinutesAndSeconds:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  v6 = [v5 components:62 fromDate:v4];

  uint64_t v7 = [v5 dateFromComponents:v6];

  return v7;
}

- (id)sendAMessage
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F305B8]) initWithValue:&stru_1EFD9B408 type:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F305B0]) initWithPersonHandle:v3 nameComponents:0 displayName:0 image:0 contactIdentifier:0 customIdentifier:0];
  id v5 = objc_alloc(MEMORY[0x1E4F306D0]);
  v18[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  uint64_t v7 = (void *)[v5 initWithRecipients:v6 outgoingMessageType:0 content:0 speakableGroupName:0 conversationIdentifier:0 serviceName:0 sender:0 attachments:0];

  uint64_t v8 = [(ATXFallbackActions *)self localizedStringForKey:@"SEND_A_MESSAGE_TITLE"];
  v9 = (void *)v8;
  objc_super v10 = @"Send a message";
  if (v8) {
    objc_super v10 = (__CFString *)v8;
  }
  v11 = v10;

  uint64_t v12 = [ATXAction alloc];
  v13 = objc_opt_new();
  LOBYTE(v17) = 0;
  v14 = [(ATXAction *)v12 initWithIntent:v7 actionUUID:v13 bundleId:@"com.apple.MobileSMS" heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v17 title:v11 subtitle:@" "];

  v15 = [(ATXFallbackActions *)self proactiveSuggestionForAction:v14];

  return v15;
}

- (id)suggestionsForAllFallbackActions
{
  v3 = objc_opt_new();
  for (uint64_t i = 0; i != 5; ++i)
  {
    id v5 = [(ATXFallbackActions *)self suggestionforSpecifiedFallbackActionType:i];
    if (v5) {
      [v3 addObject:v5];
    }
  }
  v6 = (void *)[v3 copy];

  return v6;
}

- (id)suggestionforSpecifiedFallbackActionType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v5 = objc_opt_new();
      v6 = [(ATXFallbackActions *)self createAnEventForCurrentDate:v5];

      break;
    case 1uLL:
      uint64_t v8 = [(ATXFallbackActions *)self sendAMessage];
      goto LABEL_10;
    case 2uLL:
      uint64_t v8 = [(ATXFallbackActions *)self startATimer];
      goto LABEL_10;
    case 3uLL:
      uint64_t v8 = [(ATXFallbackActions *)self searchSafari];
      goto LABEL_10;
    case 4uLL:
      uint64_t v8 = [(ATXFallbackActions *)self viewPhotos];
LABEL_10:
      v6 = (void *)v8;
      break;
    default:
      uint64_t v7 = __atxlog_handle_default();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[ATXFallbackActions suggestionforSpecifiedFallbackActionType:](a3, v7);
      }

      v6 = 0;
      break;
  }

  return v6;
}

- (id)proactiveSuggestionForAction:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:2 suggestedConfidenceCategory:-1000.0];
    id v6 = [NSString alloc];
    uint64_t v7 = [v4 json];
    uint64_t v8 = (void *)[v6 initWithFormat:@"%@", v7];

    id v9 = [NSString alloc];
    objc_super v10 = [v4 actionKey];
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "paramHash"));
    uint64_t v12 = (void *)[v9 initWithFormat:@"%@:%lld", v10, objc_msgSend(v11, "longLongValue")];

    v13 = (void *)[objc_alloc(MEMORY[0x1E4F93950]) initWithExecutableObject:v4 executableDescription:v8 executableIdentifier:v12 suggestionExecutableType:2];
    if (v13)
    {
      v14 = [MEMORY[0x1E4F93960] layoutConfigurationsForLayoutOptions:44];
      id v15 = objc_alloc(MEMORY[0x1E4F93978]);
      v16 = [v4 actionTitle];
      uint64_t v17 = [v4 actionSubtitle];
      LOWORD(v21) = 0;
      v18 = objc_msgSend(v15, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", v16, v17, 0, v14, 0, 1, v21);

      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:self->_clientModelSpec executableSpecification:v13 uiSpecification:v18 scoreSpecification:v5];
    }
    else
    {
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

+ (unint64_t)fallbackActionTypeForString:(id)a3
{
  id v4 = a3;
  unint64_t v5 = 0;
  while (1)
  {
    id v6 = [a1 stringForFallbackActionType:v5];
    char v7 = [v4 isEqualToString:v6];

    if (v7) {
      break;
    }
    if (++v5 == 5)
    {
      uint64_t v8 = __atxlog_handle_default();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        +[ATXFallbackActions fallbackActionTypeForString:]((uint64_t)v4, v8);
      }

      unint64_t v5 = 5;
      break;
    }
  }

  return v5;
}

+ (id)stringForFallbackActionType:(unint64_t)a3
{
  if (a3 < 5) {
    return off_1E5D08468[a3];
  }
  unint64_t v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[ATXFallbackActions stringForFallbackActionType:](a3, v5);
  }

  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"stringForFallbackActionType called with invalid ATXFallbackActionType value of %lu", a3);
  return @"Error";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelSpec, 0);

  objc_storeStrong((id *)&self->_bundle, 0);
}

+ (void)fallbackActionsBundle
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1A790D000, v0, OS_LOG_TYPE_FAULT, "ATXFallbackActions Bundle is nil!", v1, 2u);
}

- (void)createAnEventForCurrentDate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A790D000, v0, OS_LOG_TYPE_ERROR, "Failed to create generic intent from EKUICreateEventIntent", v1, 2u);
}

- (void)createAnEventForCurrentDate:.cold.2()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A790D000, v0, OS_LOG_TYPE_ERROR, "Generic intent created from EKUICreateEventIntent is not an INIntent object.", v1, 2u);
}

- (void)suggestionforSpecifiedFallbackActionType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "stringForFallbackActionType called with invalid ATXFallbackActionType value of %lu", (uint8_t *)&v2, 0xCu);
}

+ (void)fallbackActionTypeForString:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "fallbackActionTypeForString called with invalid fallbackAction value of %@", (uint8_t *)&v2, 0xCu);
}

+ (void)stringForFallbackActionType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "stringForFallbackActionType called with invalid ATXFallbackActionType value of %lu", (uint8_t *)&v2, 0xCu);
}

@end