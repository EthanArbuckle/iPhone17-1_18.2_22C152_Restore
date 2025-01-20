void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

__CFString *ATXNEventTypeToString(unint64_t a1)
{
  if (a1 < 0x1C) {
    return off_264E3B728[a1];
  }
  v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    ATXNEventTypeToString_cold_1();
  }

  objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF498], @"ATXNEventTypeToString called with invalid ATXNEventType value of %lu", a1);
  return @"Error";
}

uint64_t ATXNEventTypeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Receive"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"DefaultAction"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"SuppAction"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Clear"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"ClearAll"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"IndirectClear"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"Hidden"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"Orb"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"Dismiss"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"AppLaunch"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"Expired"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"Pulldown"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"TapCoalesce"])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:@"TapExpand"])
  {
    uint64_t v2 = 19;
  }
  else if ([v1 isEqualToString:@"Deduped"])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:@"DevActivated"])
  {
    uint64_t v2 = 14;
  }
  else if ([v1 isEqualToString:@"DevUnlocked"])
  {
    uint64_t v2 = 15;
  }
  else if ([v1 isEqualToString:@"ReceivedAndDeliveredProminently"])
  {
    uint64_t v2 = 16;
  }
  else if ([v1 isEqualToString:@"ReceivedAndDeliveredNonprominently"])
  {
    uint64_t v2 = 17;
  }
  else if ([v1 isEqualToString:@"Modified"])
  {
    uint64_t v2 = 18;
  }
  else
  {
    if (([v1 isEqualToString:@"Undefined"] & 1) == 0)
    {
      v3 = __atxlog_handle_default();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        ATXNEventTypeFromString_cold_1();
      }

      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"ATXNEventTypeFromString called with invalid string %@", v1 format];
    }
    uint64_t v2 = 27;
  }

  return v2;
}

__CFString *ATXNSettingResponseToString(unint64_t a1)
{
  if (a1 < 5) {
    return off_264E3B808[a1];
  }
  v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    ATXNSettingResponseToString_cold_1();
  }

  objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF498], @"ATXNSettingResponseToString called with invalid ATXNSettingResponse value of %lu", a1);
  return @"Error";
}

uint64_t ATXNRTOutcomeToSettingResponse(unint64_t a1)
{
  if (a1 < 5) {
    return qword_23C275168[a1];
  }
  v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    ATXNRTOutcomeToSettingResponse_cold_1();
  }

  objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF498], @"ATXNRTOutcomeToSettingResponse called with invalid ATXNotificationsRTOutcome value of %lu", a1);
  return 4;
}

uint64_t ATXNSettingResponseToNEvent(unint64_t a1)
{
  if (a1 < 5) {
    return qword_23C275190[a1];
  }
  v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    ATXNSettingResponseToNEvent_cold_1();
  }

  objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF498], @"ATXNSettingResponseToNEvent called with invalid ATXNSettingResponse value of %lu", a1);
  return 27;
}

__CFString *ATXUserNotificationDeliveryReasonToString(uint64_t a1)
{
  if (a1 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_264E3B830[(int)a1];
  }

  return v1;
}

uint64_t ATXUserNotificationDeliveryReasonFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"None"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"Other"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Application"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Contact"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"MatchedContact"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Urgency"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"MessageBreakthrough"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"Total"])
  {
    uint64_t v2 = 7;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *ATXNotificationDeliveryUIToString(uint64_t a1)
{
  if (a1 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_264E3B870[(int)a1];
  }

  return v1;
}

uint64_t ATXNotificationDeliveryUIFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Digest"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"MissedNotificationBundle"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"NotificationCenter"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Banner"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"LockScreen"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Other"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"PriorityNotification"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"Total"])
  {
    uint64_t v2 = 7;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id __atxlog_handle_default()
{
  if (__atxlog_handle_default_onceToken != -1) {
    dispatch_once(&__atxlog_handle_default_onceToken, &__block_literal_global);
  }
  v0 = (void *)__atxlog_handle_default_log;

  return v0;
}

uint64_t ____atxlog_handle_default_block_invoke()
{
  __atxlog_handle_default_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "general");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_xpc()
{
  if (__atxlog_handle_xpc_onceToken != -1) {
    dispatch_once(&__atxlog_handle_xpc_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)__atxlog_handle_xpc_log;

  return v0;
}

uint64_t ____atxlog_handle_xpc_block_invoke()
{
  __atxlog_handle_xpc_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "xpc");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_heuristic()
{
  if (__atxlog_handle_heuristic_onceToken != -1) {
    dispatch_once(&__atxlog_handle_heuristic_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)__atxlog_handle_heuristic_log;

  return v0;
}

uint64_t ____atxlog_handle_heuristic_block_invoke()
{
  __atxlog_handle_heuristic_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "heuristic");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_notifications()
{
  if (__atxlog_handle_notifications_onceToken != -1) {
    dispatch_once(&__atxlog_handle_notifications_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)__atxlog_handle_notifications_log;

  return v0;
}

uint64_t ____atxlog_handle_notifications_block_invoke()
{
  __atxlog_handle_notifications_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notifications");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_pmm()
{
  if (__atxlog_handle_pmm_onceToken != -1) {
    dispatch_once(&__atxlog_handle_pmm_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)__atxlog_handle_pmm_log;

  return v0;
}

uint64_t ____atxlog_handle_pmm_block_invoke()
{
  __atxlog_handle_pmm_log = (uint64_t)os_log_create("com.apple.duetexpertd.mm", "GENERAL");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_dailyroutines()
{
  if (__atxlog_handle_dailyroutines_onceToken != -1) {
    dispatch_once(&__atxlog_handle_dailyroutines_onceToken, &__block_literal_global_17);
  }
  v0 = (void *)__atxlog_handle_dailyroutines_log;

  return v0;
}

uint64_t ____atxlog_handle_dailyroutines_block_invoke()
{
  __atxlog_handle_dailyroutines_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "dailyroutines");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_feedback()
{
  if (__atxlog_handle_feedback_onceToken != -1) {
    dispatch_once(&__atxlog_handle_feedback_onceToken, &__block_literal_global_20);
  }
  v0 = (void *)__atxlog_handle_feedback_log;

  return v0;
}

uint64_t ____atxlog_handle_feedback_block_invoke()
{
  __atxlog_handle_feedback_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "feedback");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_modes()
{
  if (__atxlog_handle_modes_onceToken != -1) {
    dispatch_once(&__atxlog_handle_modes_onceToken, &__block_literal_global_23);
  }
  v0 = (void *)__atxlog_handle_modes_log;

  return v0;
}

uint64_t ____atxlog_handle_modes_block_invoke()
{
  __atxlog_handle_modes_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "modes");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_hero()
{
  if (__atxlog_handle_hero_onceToken != -1) {
    dispatch_once(&__atxlog_handle_hero_onceToken, &__block_literal_global_26);
  }
  v0 = (void *)__atxlog_handle_hero_log;

  return v0;
}

uint64_t ____atxlog_handle_hero_block_invoke()
{
  __atxlog_handle_hero_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "hero");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_deletions()
{
  if (__atxlog_handle_deletions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_deletions_onceToken, &__block_literal_global_29);
  }
  v0 = (void *)__atxlog_handle_deletions_log;

  return v0;
}

uint64_t ____atxlog_handle_deletions_block_invoke()
{
  __atxlog_handle_deletions_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "deletions");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_gi()
{
  if (__atxlog_handle_gi_onceToken != -1) {
    dispatch_once(&__atxlog_handle_gi_onceToken, &__block_literal_global_32);
  }
  v0 = (void *)__atxlog_handle_gi_log;

  return v0;
}

uint64_t ____atxlog_handle_gi_block_invoke()
{
  __atxlog_handle_gi_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "information");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_timeline()
{
  if (__atxlog_handle_timeline_onceToken != -1) {
    dispatch_once(&__atxlog_handle_timeline_onceToken, &__block_literal_global_35);
  }
  v0 = (void *)__atxlog_handle_timeline_log;

  return v0;
}

uint64_t ____atxlog_handle_timeline_block_invoke()
{
  __atxlog_handle_timeline_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "timeline");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_relevant_shortcut()
{
  if (__atxlog_handle_relevant_shortcut_onceToken != -1) {
    dispatch_once(&__atxlog_handle_relevant_shortcut_onceToken, &__block_literal_global_38);
  }
  v0 = (void *)__atxlog_handle_relevant_shortcut_log;

  return v0;
}

uint64_t ____atxlog_handle_relevant_shortcut_block_invoke()
{
  __atxlog_handle_relevant_shortcut_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "relevant_shortcut");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_relevance_model()
{
  if (__atxlog_handle_relevance_model_onceToken != -1) {
    dispatch_once(&__atxlog_handle_relevance_model_onceToken, &__block_literal_global_41);
  }
  v0 = (void *)__atxlog_handle_relevance_model_log;

  return v0;
}

uint64_t ____atxlog_handle_relevance_model_block_invoke()
{
  __atxlog_handle_relevance_model_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "relevance_model");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_watch()
{
  if (__atxlog_handle_watch_onceToken != -1) {
    dispatch_once(&__atxlog_handle_watch_onceToken, &__block_literal_global_44);
  }
  v0 = (void *)__atxlog_handle_watch_log;

  return v0;
}

uint64_t ____atxlog_handle_watch_block_invoke()
{
  __atxlog_handle_watch_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "watch");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_ui()
{
  if (__atxlog_handle_ui_onceToken != -1) {
    dispatch_once(&__atxlog_handle_ui_onceToken, &__block_literal_global_47);
  }
  v0 = (void *)__atxlog_handle_ui_log;

  return v0;
}

uint64_t ____atxlog_handle_ui_block_invoke()
{
  __atxlog_handle_ui_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "UI");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_blending()
{
  if (__atxlog_handle_blending_onceToken != -1) {
    dispatch_once(&__atxlog_handle_blending_onceToken, &__block_literal_global_50);
  }
  v0 = (void *)__atxlog_handle_blending_log;

  return v0;
}

uint64_t ____atxlog_handle_blending_block_invoke()
{
  __atxlog_handle_blending_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_blending_internal_cache()
{
  if (__atxlog_handle_blending_internal_cache_onceToken != -1) {
    dispatch_once(&__atxlog_handle_blending_internal_cache_onceToken, &__block_literal_global_53);
  }
  v0 = (void *)__atxlog_handle_blending_internal_cache_log;

  return v0;
}

uint64_t ____atxlog_handle_blending_internal_cache_block_invoke()
{
  __atxlog_handle_blending_internal_cache_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending_internal_cache");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_blending_ecosystem()
{
  if (__atxlog_handle_blending_ecosystem_onceToken != -1) {
    dispatch_once(&__atxlog_handle_blending_ecosystem_onceToken, &__block_literal_global_56);
  }
  v0 = (void *)__atxlog_handle_blending_ecosystem_log;

  return v0;
}

uint64_t ____atxlog_handle_blending_ecosystem_block_invoke()
{
  __atxlog_handle_blending_ecosystem_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending_ecosystem");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_home_screen()
{
  if (__atxlog_handle_home_screen_onceToken != -1) {
    dispatch_once(&__atxlog_handle_home_screen_onceToken, &__block_literal_global_59);
  }
  v0 = (void *)__atxlog_handle_home_screen_log;

  return v0;
}

uint64_t ____atxlog_handle_home_screen_block_invoke()
{
  __atxlog_handle_home_screen_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "homescreen");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_sleep_schedule()
{
  if (__atxlog_handle_sleep_schedule_onceToken != -1) {
    dispatch_once(&__atxlog_handle_sleep_schedule_onceToken, &__block_literal_global_62);
  }
  v0 = (void *)__atxlog_handle_sleep_schedule_log;

  return v0;
}

uint64_t ____atxlog_handle_sleep_schedule_block_invoke()
{
  __atxlog_handle_sleep_schedule_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "sleepschedule");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_lock_screen()
{
  if (__atxlog_handle_lock_screen_onceToken != -1) {
    dispatch_once(&__atxlog_handle_lock_screen_onceToken, &__block_literal_global_65);
  }
  v0 = (void *)__atxlog_handle_lock_screen_log;

  return v0;
}

uint64_t ____atxlog_handle_lock_screen_block_invoke()
{
  __atxlog_handle_lock_screen_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "lockscreen");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_anchor()
{
  if (__atxlog_handle_anchor_onceToken != -1) {
    dispatch_once(&__atxlog_handle_anchor_onceToken, &__block_literal_global_68);
  }
  v0 = (void *)__atxlog_handle_anchor_log;

  return v0;
}

uint64_t ____atxlog_handle_anchor_block_invoke()
{
  __atxlog_handle_anchor_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "anchor");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_app_prediction()
{
  if (__atxlog_handle_app_prediction_onceToken != -1) {
    dispatch_once(&__atxlog_handle_app_prediction_onceToken, &__block_literal_global_71);
  }
  v0 = (void *)__atxlog_handle_app_prediction_log;

  return v0;
}

uint64_t ____atxlog_handle_app_prediction_block_invoke()
{
  __atxlog_handle_app_prediction_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_prediction");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_action_prediction()
{
  if (__atxlog_handle_action_prediction_onceToken != -1) {
    dispatch_once(&__atxlog_handle_action_prediction_onceToken, &__block_literal_global_74);
  }
  v0 = (void *)__atxlog_handle_action_prediction_log;

  return v0;
}

uint64_t ____atxlog_handle_action_prediction_block_invoke()
{
  __atxlog_handle_action_prediction_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "action_prediction");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_app_library()
{
  if (__atxlog_handle_app_library_onceToken != -1) {
    dispatch_once(&__atxlog_handle_app_library_onceToken, &__block_literal_global_77);
  }
  v0 = (void *)__atxlog_handle_app_library_log;

  return v0;
}

uint64_t ____atxlog_handle_app_library_block_invoke()
{
  __atxlog_handle_app_library_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_library");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_app_install()
{
  if (__atxlog_handle_app_install_onceToken != -1) {
    dispatch_once(&__atxlog_handle_app_install_onceToken, &__block_literal_global_80);
  }
  v0 = (void *)__atxlog_handle_app_install_log;

  return v0;
}

uint64_t ____atxlog_handle_app_install_block_invoke()
{
  __atxlog_handle_app_install_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_install");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_backup()
{
  if (__atxlog_handle_backup_onceToken != -1) {
    dispatch_once(&__atxlog_handle_backup_onceToken, &__block_literal_global_83);
  }
  v0 = (void *)__atxlog_handle_backup_log;

  return v0;
}

uint64_t ____atxlog_handle_backup_block_invoke()
{
  __atxlog_handle_backup_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "backup");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_metrics()
{
  if (__atxlog_handle_metrics_onceToken != -1) {
    dispatch_once(&__atxlog_handle_metrics_onceToken, &__block_literal_global_86);
  }
  v0 = (void *)__atxlog_handle_metrics_log;

  return v0;
}

uint64_t ____atxlog_handle_metrics_block_invoke()
{
  __atxlog_handle_metrics_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "metrics");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_trial_assets()
{
  if (__atxlog_handle_trial_assets_onceToken != -1) {
    dispatch_once(&__atxlog_handle_trial_assets_onceToken, &__block_literal_global_89);
  }
  v0 = (void *)__atxlog_handle_trial_assets_log;

  return v0;
}

uint64_t ____atxlog_handle_trial_assets_block_invoke()
{
  __atxlog_handle_trial_assets_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "trial_assets");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_notification_management()
{
  if (__atxlog_handle_notification_management_onceToken != -1) {
    dispatch_once(&__atxlog_handle_notification_management_onceToken, &__block_literal_global_92);
  }
  v0 = (void *)__atxlog_handle_notification_management_log;

  return v0;
}

uint64_t ____atxlog_handle_notification_management_block_invoke()
{
  __atxlog_handle_notification_management_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notification_management");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_contextual_actions()
{
  if (__atxlog_handle_contextual_actions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_contextual_actions_onceToken, &__block_literal_global_95);
  }
  v0 = (void *)__atxlog_handle_contextual_actions_log;

  return v0;
}

uint64_t ____atxlog_handle_contextual_actions_block_invoke()
{
  __atxlog_handle_contextual_actions_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "contextual_actions");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_intents_helper()
{
  if (__atxlog_handle_intents_helper_onceToken != -1) {
    dispatch_once(&__atxlog_handle_intents_helper_onceToken, &__block_literal_global_98);
  }
  v0 = (void *)__atxlog_handle_intents_helper_log;

  return v0;
}

uint64_t ____atxlog_handle_intents_helper_block_invoke()
{
  __atxlog_handle_intents_helper_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "intents_helper");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_context_heuristic()
{
  if (__atxlog_handle_context_heuristic_onceToken != -1) {
    dispatch_once(&__atxlog_handle_context_heuristic_onceToken, &__block_literal_global_101);
  }
  v0 = (void *)__atxlog_handle_context_heuristic_log;

  return v0;
}

uint64_t ____atxlog_handle_context_heuristic_block_invoke()
{
  __atxlog_handle_context_heuristic_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "context_heuristic");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_zkw_hide()
{
  if (__atxlog_handle_zkw_hide_onceToken != -1) {
    dispatch_once(&__atxlog_handle_zkw_hide_onceToken, &__block_literal_global_104);
  }
  v0 = (void *)__atxlog_handle_zkw_hide_log;

  return v0;
}

uint64_t ____atxlog_handle_zkw_hide_block_invoke()
{
  __atxlog_handle_zkw_hide_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "zkw_hide");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_context_user_education_suggestions()
{
  if (__atxlog_handle_context_user_education_suggestions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_context_user_education_suggestions_onceToken, &__block_literal_global_107);
  }
  v0 = (void *)__atxlog_handle_context_user_education_suggestions_log;

  return v0;
}

uint64_t ____atxlog_handle_context_user_education_suggestions_block_invoke()
{
  __atxlog_handle_context_user_education_suggestions_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "user_education_suggestions");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_time_intelligence()
{
  if (__atxlog_handle_time_intelligence_onceToken != -1) {
    dispatch_once(&__atxlog_handle_time_intelligence_onceToken, &__block_literal_global_110);
  }
  v0 = (void *)__atxlog_handle_time_intelligence_log;

  return v0;
}

uint64_t ____atxlog_handle_time_intelligence_block_invoke()
{
  __atxlog_handle_time_intelligence_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "time");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_contextual_engine()
{
  if (__atxlog_handle_contextual_engine_onceToken != -1) {
    dispatch_once(&__atxlog_handle_contextual_engine_onceToken, &__block_literal_global_113);
  }
  v0 = (void *)__atxlog_handle_contextual_engine_log;

  return v0;
}

uint64_t ____atxlog_handle_contextual_engine_block_invoke()
{
  __atxlog_handle_contextual_engine_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "contextualengine");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_usage_insights()
{
  if (__atxlog_handle_usage_insights_onceToken != -1) {
    dispatch_once(&__atxlog_handle_usage_insights_onceToken, &__block_literal_global_116);
  }
  v0 = (void *)__atxlog_handle_usage_insights_log;

  return v0;
}

uint64_t ____atxlog_handle_usage_insights_block_invoke()
{
  __atxlog_handle_usage_insights_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "usage_insights");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_notification_categorization()
{
  if (__atxlog_handle_notification_categorization_onceToken != -1) {
    dispatch_once(&__atxlog_handle_notification_categorization_onceToken, &__block_literal_global_119);
  }
  v0 = (void *)__atxlog_handle_notification_categorization_log;

  return v0;
}

uint64_t ____atxlog_handle_notification_categorization_block_invoke()
{
  __atxlog_handle_notification_categorization_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notification_categorization");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_settings_actions()
{
  if (__atxlog_handle_settings_actions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_settings_actions_onceToken, &__block_literal_global_122);
  }
  v0 = (void *)__atxlog_handle_settings_actions_log;

  return v0;
}

uint64_t ____atxlog_handle_settings_actions_block_invoke()
{
  __atxlog_handle_settings_actions_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "settings_actions");

  return MEMORY[0x270F9A758]();
}

id ATXNotificationsLoggingInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EFEA9C0];
  id v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_activeSuggestionsWithReply_ argumentIndex:0 ofReply:1];

  v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v4 forSelector:sel_logNotificationEvent_notification_ argumentIndex:1 ofReply:0];

  v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v5 forSelector:sel_logNotificationEvent_notification_reason_ argumentIndex:1 ofReply:0];

  v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v6 forSelector:sel_logNotificationEvent_notification_reason_interactionUI_ argumentIndex:1 ofReply:0];

  v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v7 forSelector:sel_logNotificationGroupEvent_eventIdentifier_ argumentIndex:1 ofReply:0];

  v8 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v8 forSelector:sel_logNotificationGroupEvent_eventIdentifier_timestamp_ argumentIndex:1 ofReply:0];

  uint64_t v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v9 forSelector:sel_logSuggestionEvent_suggestionType_suggestionIdentifier_timestamp_ argumentIndex:2 ofReply:0];

  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [v0 setClasses:v12 forSelector:sel_logNotificationDeliveryUI_notificationUUIDs_ argumentIndex:1 ofReply:0];

  return v0;
}

void sub_23C272FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23C2732B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23C2734F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void ATXNEventTypeToString_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C26F000, v0, v1, "ATXNEventTypeToString called with invalid ATXNEventType value of %lu", v2, v3, v4, v5, v6);
}

void ATXNEventTypeFromString_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C26F000, v0, v1, "ATXNEventTypeFromString called with invalid string %@", v2, v3, v4, v5, v6);
}

void ATXNSettingResponseToString_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C26F000, v0, v1, "ATXNSettingResponseToString called with invalid ATXNSettingResponse value of %lu", v2, v3, v4, v5, v6);
}

void ATXNRTOutcomeToSettingResponse_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C26F000, v0, v1, "ATXNRTOutcomeToSettingResponse called with invalid ATXNotificationsRTOutcome value of %lu", v2, v3, v4, v5, v6);
}

void ATXNSettingResponseToNEvent_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C26F000, v0, v1, "ATXNSettingResponseToNEvent called with invalid ATXNSettingResponse value of %lu", v2, v3, v4, v5, v6);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}