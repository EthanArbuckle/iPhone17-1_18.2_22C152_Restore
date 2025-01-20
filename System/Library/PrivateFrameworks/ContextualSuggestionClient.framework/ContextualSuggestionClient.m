void hashIt(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  long long v11;
  long long v12;
  long long v13;
  long long v14;
  unsigned char v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x263EF8340];
  v3 = a1;
  v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v3;
    v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      v7 = v6;
      v8 = *(void *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          hashIt(*(void *)(*((void *)&v11 + 1) + 8 * v9++), v4);
        }
        while (v7 != v9);
        v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    v10 = [v3 hash];
    [v4 appendBytes:&v10 length:8];
  }
}

void sub_24A77FDC8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id __atxlog_handle_default()
{
  if (__atxlog_handle_default_onceToken != -1) {
    dispatch_once(&__atxlog_handle_default_onceToken, &__block_literal_global_1);
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
  if (__atxlog_handle_settings_actions_onceToken[0] != -1) {
    dispatch_once(__atxlog_handle_settings_actions_onceToken, &__block_literal_global_122);
  }
  v0 = (void *)__atxlog_handle_settings_actions_log;
  return v0;
}

uint64_t ____atxlog_handle_settings_actions_block_invoke()
{
  __atxlog_handle_settings_actions_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "settings_actions");
  return MEMORY[0x270F9A758]();
}

BOOL sub_24A781914(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_24A781924()
{
  return sub_24A7B3908();
}

uint64_t sub_24A781950()
{
  return 2;
}

uint64_t sub_24A781958()
{
  return sub_24A7B3918();
}

uint64_t sub_24A7819A0()
{
  return 0;
}

uint64_t sub_24A7819AC(char a1)
{
  if (a1) {
    return 0x6974736567677573;
  }
  else {
    return 0x6E65736572706572;
  }
}

BOOL sub_24A7819F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24A781A10()
{
  return sub_24A7B3918();
}

uint64_t sub_24A781A58()
{
  return sub_24A7B3908();
}

uint64_t sub_24A781A84()
{
  return sub_24A7B3918();
}

uint64_t sub_24A781AC8()
{
  return sub_24A7819AC(*v0);
}

uint64_t sub_24A781AD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24A78237C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24A781AF8(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24A781B04(uint64_t a1)
{
  unint64_t v2 = sub_24A78289C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24A781B40(uint64_t a1)
{
  unint64_t v2 = sub_24A78289C();
  return MEMORY[0x270FA00B8](a1, v2);
}

id ContextualSuggestionContext.representation.getter()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_representation));
}

uint64_t ContextualSuggestionContext.suggestions.getter()
{
  return swift_bridgeObjectRetain();
}

id ContextualSuggestionContext.__allocating_init(representation:suggestions:)(uint64_t a1, uint64_t a2)
{
  v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_representation] = a1;
  *(void *)&v5[OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_suggestions] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id ContextualSuggestionContext.init(representation:suggestions:)(uint64_t a1, uint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v2[OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_representation] = a1;
  *(void *)&v2[OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_suggestions] = a2;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

id ContextualSuggestionContext.__allocating_init(coder:)(NSObject *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ContextualSuggestionContext.init(coder:)(a1);
}

id ContextualSuggestionContext.init(coder:)(NSObject *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_24A7B32F8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v10 = (char *)&v26 - v9;
  type metadata accessor for ContextRepresentation();
  id v11 = v1;
  uint64_t v12 = sub_24A7B35A8();
  if (!v12)
  {

    uint64_t v18 = sub_24A7AA57C();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v18, v4);
    v13 = sub_24A7B32E8();
    os_log_type_t v19 = sub_24A7B34F8();
    if (os_log_type_enabled(v13, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_24A77B000, v13, v19, "coder missing representation", v20, 2u);
      MEMORY[0x24C5D05E0](v20, -1, -1);
    }
    v21 = a1;
    v8 = v10;
    goto LABEL_13;
  }
  v13 = v12;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697B9E30);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_24A7B4BB0;
  *(void *)(v14 + 32) = type metadata accessor for ContextualSuggestion();
  *(void *)(v14 + 40) = sub_24A7824D4();
  sub_24A7B35B8();
  swift_bridgeObjectRelease();
  if (!v30)
  {

    sub_24A782514((uint64_t)v29);
LABEL_10:
    uint64_t v22 = sub_24A7AA57C();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v22, v4);
    v21 = sub_24A7B32E8();
    os_log_type_t v23 = sub_24A7B34F8();
    if (os_log_type_enabled(v21, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_24A77B000, v21, v23, "coder missing suggestions", v24, 2u);
      MEMORY[0x24C5D05E0](v24, -1, -1);
    }

LABEL_13:
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697B9E48);
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_10;
  }
  uint64_t v15 = v28;

  v16 = (char *)objc_allocWithZone(ObjectType);
  *(void *)&v16[OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_representation] = v13;
  *(void *)&v16[OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_suggestions] = v15;
  v27.receiver = v16;
  v27.super_class = ObjectType;
  id v17 = [&v27 init];

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v17;
}

void *sub_24A78209C()
{
  return &unk_24A7B4BC0;
}

uint64_t static ContextualSuggestionContext.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall ContextualSuggestionContext.encode(with:)(NSCoder with)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_representation);
  uint64_t v4 = (void *)sub_24A7B3378();
  [(objc_class *)with.super.isa encodeObject:v3 forKey:v4];

  type metadata accessor for ContextualSuggestion();
  uint64_t v5 = (void *)sub_24A7B3408();
  id v6 = (id)sub_24A7B3378();
  [(objc_class *)with.super.isa encodeObject:v5 forKey:v6];
}

uint64_t sub_24A78221C(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = (void *)(*(void *)(a1
                            + OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_representation)
                + OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_identifier);
  uint64_t v3 = (void *)(*(void *)(a2
                            + OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_representation)
                + OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_identifier);
  if (*v2 == *v3 && v2[1] == v3[1]) {
    return 1;
  }
  else {
    return sub_24A7B3878();
  }
}

id ContextualSuggestionContext.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ContextualSuggestionContext.init()()
{
}

id ContextualSuggestionContext.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24A78237C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E65736572706572 && a2 == 0xEE006E6F69746174;
  if (v3 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6974736567677573 && a2 == 0xEB00000000736E6FLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24A7B3878();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_24A7824D4()
{
  unint64_t result = qword_26B17A3E0;
  if (!qword_26B17A3E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B17A3E0);
  }
  return result;
}

uint64_t sub_24A782514(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697B9E40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24A782578()
{
  unint64_t result = qword_2697B9E50;
  if (!qword_2697B9E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B9E50);
  }
  return result;
}

unint64_t sub_24A7825D0()
{
  unint64_t result = qword_2697B9E58;
  if (!qword_2697B9E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B9E58);
  }
  return result;
}

unint64_t sub_24A782628()
{
  unint64_t result = qword_2697B9E60;
  if (!qword_2697B9E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B9E60);
  }
  return result;
}

uint64_t type metadata accessor for ContextualSuggestionContext()
{
  return self;
}

uint64_t method lookup function for ContextualSuggestionContext(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ContextualSuggestionContext);
}

uint64_t dispatch thunk of ContextualSuggestionContext.__allocating_init(representation:suggestions:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of ContextualSuggestionContext.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ContextualSuggestionContext.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ContextualSuggestionContext.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24A78284CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_24A782874(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24A782880(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ContextualSuggestionContext.CodingKeys()
{
  return &type metadata for ContextualSuggestionContext.CodingKeys;
}

unint64_t sub_24A78289C()
{
  unint64_t result = qword_2697B9ED0;
  if (!qword_2697B9ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B9ED0);
  }
  return result;
}

id sub_24A782900()
{
  id v1 = *(void **)(v0 + 112);
  if (v1)
  {
    id v2 = *(id *)(v0 + 112);
  }
  else
  {
    sub_24A79ED54();
    id v3 = objc_allocWithZone(MEMORY[0x263F08D68]);
    swift_bridgeObjectRetain();
    unsigned int v4 = (void *)sub_24A7B3378();
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(v3, sel_initWithMachServiceName_options_, v4, 0);

    unsigned int v6 = (void *)contextualEngineInternalInterface.getter();
    objc_msgSend(v5, sel_setRemoteObjectInterface_, v6);

    objc_msgSend(v5, sel_resume);
    BOOL v7 = *(void **)(v0 + 112);
    *(void *)(v0 + 112) = v5;
    id v2 = v5;

    id v1 = 0;
  }
  id v8 = v1;
  return v2;
}

uint64_t sub_24A7829DC()
{
  return 0;
}

id sub_24A7829E4()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = 0;
  id v1 = (void **)(v0 + 16);
  id v2 = sub_24A782900();
  aBlock[4] = sub_24A785F9C;
  aBlock[5] = v0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A782DE0;
  aBlock[3] = &block_descriptor_80;
  id v3 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v4 = objc_msgSend(v2, sel_remoteObjectProxyWithErrorHandler_, v3);
  _Block_release(v3);

  sub_24A7B3628();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA088);
  if (swift_dynamicCast())
  {
    id v2 = v8;
    swift_release();
  }
  else
  {
    swift_beginAccess();
    id v5 = *v1;
    if (!*v1)
    {
      sub_24A785FBC();
      swift_allocError();
      id v5 = 0;
    }
    id v6 = v5;
    swift_willThrow();
    swift_release();
  }
  return v2;
}

id sub_24A782BA0(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24A7B32F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24A7AA57C();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  v10 = sub_24A7B32E8();
  os_log_type_t v11 = sub_24A7B34F8();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v23 = a2;
    v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v22 = v4;
    uint64_t v15 = (void *)v14;
    *(_DWORD *)v13 = 138412290;
    uint64_t v16 = sub_24A7B31E8();
    uint64_t v24 = v16;
    sub_24A7B3608();
    *uint64_t v15 = v16;

    _os_log_impl(&dword_24A77B000, v10, v11, "ContextualEngineInternalClient: Error grabbing remote object proxy: %@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1D0);
    swift_arrayDestroy();
    id v17 = v15;
    uint64_t v4 = v22;
    MEMORY[0x24C5D05E0](v17, -1, -1);
    uint64_t v18 = v13;
    a2 = v23;
    MEMORY[0x24C5D05E0](v18, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_beginAccess();
  os_log_type_t v19 = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = a1;

  return a1;
}

void sub_24A782DE0(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_24A782E48()
{
  *(void *)(v1 + 128) = v0;
  return MEMORY[0x270FA2498](sub_24A782E68, v0, 0);
}

uint64_t sub_24A782E68()
{
  id v1 = sub_24A7829E4();
  v0[17] = v1;
  id v2 = v1;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24A782FB0;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24A7831B0;
  v0[13] = &block_descriptor;
  v0[14] = v3;
  objc_msgSend(v2, sel_fetchAllSnapshotsWithCompletion_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24A782FB0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 144) = v2;
  uint64_t v3 = *(void *)(v1 + 128);
  if (v2) {
    id v4 = sub_24A78313C;
  }
  else {
    id v4 = sub_24A7830D0;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24A7830D0()
{
  uint64_t v1 = *(void *)(v0 + 120);
  swift_unknownObjectRelease();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24A78313C()
{
  swift_willThrow();
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A7831B0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA080);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    type metadata accessor for ContextualSuggestionSnapshot();
    **(void **)(*(void *)(v3 + 64) + 40) = sub_24A7B3368();
    return MEMORY[0x270FA2408](v3);
  }
}

uint64_t sub_24A7833F8(const void *a1, uint64_t a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24A7834BC;
  v4[16] = a2;
  return MEMORY[0x270FA2498](sub_24A782E68, a2, 0);
}

uint64_t sub_24A7834BC()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1;
  swift_task_dealloc();
  swift_release();
  if (v2)
  {
    uint64_t v5 = sub_24A7B31E8();

    uint64_t v6 = 0;
    id v7 = (void *)v5;
  }
  else
  {
    type metadata accessor for ContextualSuggestionSnapshot();
    uint64_t v6 = sub_24A7B3358();
    swift_bridgeObjectRelease();
    uint64_t v5 = 0;
    id v7 = (void *)v6;
  }
  uint64_t v8 = *(void (***)(void, void, void))(v3 + 24);
  v8[2](v8, v6, v5);

  _Block_release(v8);
  id v9 = *(uint64_t (**)(void))(v4 + 8);
  return v9();
}

uint64_t sub_24A783660()
{
  *(void *)(v1 + 128) = v0;
  return MEMORY[0x270FA2498](sub_24A783680, v0, 0);
}

uint64_t sub_24A783680()
{
  id v1 = sub_24A7829E4();
  v0[17] = v1;
  uint64_t v2 = v1;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24A7837C8;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24A7838E8;
  v0[13] = &block_descriptor_2;
  v0[14] = v3;
  objc_msgSend(v2, sel_fetchSnapshotOverrideWithCompletion_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24A7837C8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 144) = v2;
  uint64_t v3 = *(void *)(v1 + 128);
  if (v2) {
    uint64_t v4 = sub_24A786038;
  }
  else {
    uint64_t v4 = sub_24A78603C;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24A7838E8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA080);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA2408](a1);
  }
}

uint64_t sub_24A783B14(const void *a1, uint64_t a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24A783BD8;
  v4[16] = a2;
  return MEMORY[0x270FA2498](sub_24A783680, a2, 0);
}

uint64_t sub_24A783BD8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *v2;
  swift_task_dealloc();
  swift_release();
  id v7 = *(void (***)(void, void, void))(v5 + 24);
  if (v3)
  {
    id v8 = (void *)sub_24A7B31E8();

    ((void (**)(void, void, void *))v7)[2](v7, 0, v8);
    _Block_release(v7);
  }
  else
  {
    ((void (**)(void, void *, void))v7)[2](v7, a1, 0);
    _Block_release(v7);
  }
  id v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t sub_24A783D7C(uint64_t a1)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = v1;
  return MEMORY[0x270FA2498](sub_24A783D9C, v1, 0);
}

uint64_t sub_24A783D9C()
{
  id v1 = sub_24A7829E4();
  v0[17] = v1;
  uint64_t v2 = v1;
  uint64_t v3 = v0[15];
  v0[2] = v0;
  v0[3] = sub_24A783EF0;
  uint64_t v4 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24A784074;
  v0[13] = &block_descriptor_4;
  v0[14] = v4;
  objc_msgSend(v2, sel_overrideWithSnapshot_completion_, v3, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24A783EF0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 144) = v2;
  uint64_t v3 = *(void *)(v1 + 128);
  if (v2) {
    uint64_t v4 = sub_24A78313C;
  }
  else {
    uint64_t v4 = sub_24A784010;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24A784010()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A784074(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA080);
    uint64_t v4 = swift_allocError();
    void *v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return MEMORY[0x270FA2408](v7);
  }
}

uint64_t sub_24A78428C(void *a1, void *aBlock, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24A784368;
  v7[15] = v6;
  v7[16] = a3;
  return MEMORY[0x270FA2498](sub_24A783D9C, a3, 0);
}

uint64_t sub_24A784368()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  swift_release();
  uint64_t v7 = *(void *)(v3 + 32);
  if (v2)
  {
    id v8 = (void *)sub_24A7B31E8();

    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 32));
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t sub_24A784508()
{
  *(void *)(v1 + 120) = v0;
  return MEMORY[0x270FA2498](sub_24A784528, v0, 0);
}

uint64_t sub_24A784528()
{
  id v1 = sub_24A7829E4();
  v0[16] = v1;
  uint64_t v2 = v1;
  v0[2] = v0;
  v0[3] = sub_24A784668;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24A784074;
  v0[13] = &block_descriptor_6;
  v0[14] = v3;
  objc_msgSend(v2, sel_updateWithCompletion_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24A784668()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 136) = v2;
  uint64_t v3 = *(void *)(v1 + 120);
  if (v2) {
    uint64_t v4 = sub_24A7847EC;
  }
  else {
    uint64_t v4 = sub_24A784788;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24A784788()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A7847EC()
{
  swift_willThrow();
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A7849CC(const void *a1, uint64_t a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24A784A90;
  v4[15] = a2;
  return MEMORY[0x270FA2498](sub_24A784528, a2, 0);
}

uint64_t sub_24A784A90()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_release();
  uint64_t v6 = *(void *)(v3 + 24);
  if (v2)
  {
    uint64_t v7 = (void *)sub_24A7B31E8();

    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  id v8 = *(uint64_t (**)(void))(v5 + 8);
  return v8();
}

id ContextualEngineInternalClient.__allocating_init()()
{
  uint64_t v1 = (void *)swift_allocObject();
  swift_defaultActor_initialize();
  v1[14] = 0;
  v3.receiver = v1;
  v3.super_class = v0;
  return objc_msgSendSuper2(&v3, sel_init);
}

id ContextualEngineInternalClient.init()()
{
  swift_defaultActor_initialize();
  v0[14] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContextualEngineInternalClient();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ContextualEngineInternalClient()
{
  return self;
}

uint64_t ContextualEngineInternalClient.deinit()
{
  swift_defaultActor_destroy();
  return v0;
}

uint64_t ContextualEngineInternalClient.__deallocating_deinit()
{
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t ContextualEngineInternalClient.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24A784D84()
{
  return v0;
}

uint64_t method lookup function for ContextualEngineInternalClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ContextualEngineInternalClient);
}

uint64_t dispatch thunk of ContextualEngineInternalClient.fetchAllSnapshots()()
{
  objc_super v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x80);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  objc_super v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *objc_super v3 = v1;
  v3[1] = sub_24A784EAC;
  return v5();
}

uint64_t sub_24A784EAC(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  objc_super v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of ContextualEngineInternalClient.fetchSnapshotOverride()()
{
  objc_super v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x88);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  objc_super v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *objc_super v3 = v1;
  v3[1] = sub_24A786040;
  return v5();
}

uint64_t dispatch thunk of ContextualEngineInternalClient.override(with:)(uint64_t a1)
{
  uint64_t v4 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x90);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24A786034;
  return v7(a1);
}

uint64_t dispatch thunk of ContextualEngineInternalClient.update()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x98);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  objc_super v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *objc_super v3 = v1;
  v3[1] = sub_24A7852C4;
  return v5();
}

uint64_t sub_24A7852C4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of ContextualEngineInternalClient.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t sub_24A7853D0()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24A786034;
  uint64_t v5 = (uint64_t (*)(const void *, uint64_t))((char *)&dword_2697B9FE0 + dword_2697B9FE0);
  return v5(v2, v3);
}

uint64_t sub_24A78547C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_24A786034;
  return v6();
}

uint64_t sub_24A78554C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_24A786034;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2697B9FF0 + dword_2697B9FF0);
  return v6(v2, v3, v4);
}

uint64_t sub_24A78560C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_24A786034;
  return v7();
}

uint64_t sub_24A7856DC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24A786034;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2697BA000 + dword_2697BA000);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_24A7857A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A7B3498();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24A7B3488();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24A78594C(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24A7B3478();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24A78594C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A390);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A7859AC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24A785A88;
  return v6(a1);
}

uint64_t sub_24A785A88()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24A785B80()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A785BB8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24A786034;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2697BA010 + dword_2697BA010);
  return v6(a1, v4);
}

uint64_t sub_24A785C70()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24A785CB8()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_24A786034;
  uint64_t v6 = (uint64_t (*)(void *, void *, uint64_t))((char *)&dword_2697BA020 + dword_2697BA020);
  return v6(v2, v3, v4);
}

uint64_t sub_24A785D78()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24A786034;
  uint64_t v5 = (uint64_t (*)(const void *, uint64_t))((char *)&dword_2697BA040 + dword_2697BA040);
  return v5(v2, v3);
}

uint64_t objectdestroyTm()
{
  _Block_release(*(const void **)(v0 + 16));
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A785E70()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24A7852C4;
  uint64_t v5 = (uint64_t (*)(const void *, uint64_t))((char *)&dword_2697BA060 + dword_2697BA060);
  return v5(v2, v3);
}

uint64_t objectdestroy_17Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24A785F64()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_24A785F9C(void *a1)
{
  return sub_24A782BA0(a1, v1);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_24A785FBC()
{
  unint64_t result = qword_2697BAD50[0];
  if (!qword_2697BAD50[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697BAD50);
  }
  return result;
}

ValueMetadata *type metadata accessor for UnknownXPCError()
{
  return &type metadata for UnknownXPCError;
}

void sub_24A786020()
{
}

uint64_t sub_24A786044()
{
  return 1;
}

uint64_t sub_24A78604C()
{
  return sub_24A7B3908();
}

uint64_t sub_24A786074(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24A7B3878();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24A786108()
{
  return sub_24A7B3918();
}

uint64_t sub_24A78614C()
{
  return 0x696669746E656469;
}

uint64_t sub_24A786168()
{
  return sub_24A7B3918();
}

uint64_t sub_24A7861A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24A7B3878();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_24A78624C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24A786258(uint64_t a1)
{
  unint64_t v2 = sub_24A786AB0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24A786294(uint64_t a1)
{
  unint64_t v2 = sub_24A786AB0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ContextualSuggestion.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient20ContextualSuggestion_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

id ContextualSuggestion.__allocating_init(identifier:)(uint64_t a1, uint64_t a2)
{
  char v5 = (char *)objc_allocWithZone(v2);
  uint64_t v6 = &v5[OBJC_IVAR____TtC26ContextualSuggestionClient20ContextualSuggestion_identifier];
  *(void *)uint64_t v6 = a1;
  *((void *)v6 + 1) = a2;
  v8.receiver = v5;
  v8.super_class = v2;
  return objc_msgSendSuper2(&v8, sel_init);
}

id ContextualSuggestion.init(identifier:)(uint64_t a1, uint64_t a2)
{
  char v3 = &v2[OBJC_IVAR____TtC26ContextualSuggestionClient20ContextualSuggestion_identifier];
  *(void *)char v3 = a1;
  *((void *)v3 + 1) = a2;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for ContextualSuggestion();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for ContextualSuggestion()
{
  return self;
}

uint64_t sub_24A7863D4()
{
  return 0;
}

uint64_t ContextualSuggestion.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ContextualSuggestion.init(coder:)(a1);
}

uint64_t ContextualSuggestion.init(coder:)(void *a1)
{
  sub_24A786530();
  id v3 = v1;
  uint64_t v4 = sub_24A7B35A8();
  if (v4)
  {
    objc_super v5 = (void *)v4;
    sub_24A7B3388();
  }
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

unint64_t sub_24A786530()
{
  unint64_t result = qword_2697BA5F0;
  if (!qword_2697BA5F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2697BA5F0);
  }
  return result;
}

void sub_24A786598(void *a1)
{
  unint64_t v2 = (void *)sub_24A7B3378();
  id v3 = (id)sub_24A7B3378();
  objc_msgSend(a1, sel_encodeObject_forKey_, v2, v3);
}

id ContextualSuggestion.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ContextualSuggestion.init()()
{
}

id ContextualSuggestion.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContextualSuggestion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_24A7867C0()
{
  unint64_t result = qword_2697BA0A0;
  if (!qword_2697BA0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA0A0);
  }
  return result;
}

unint64_t sub_24A786818()
{
  unint64_t result = qword_2697BA0A8;
  if (!qword_2697BA0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA0A8);
  }
  return result;
}

unint64_t sub_24A786870()
{
  unint64_t result = qword_2697BA0B0;
  if (!qword_2697BA0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA0B0);
  }
  return result;
}

uint64_t method lookup function for ContextualSuggestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ContextualSuggestion);
}

uint64_t dispatch thunk of ContextualSuggestion.__allocating_init(identifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of ContextualSuggestion.associatedBundleId.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of static ContextualSuggestion.supportsSecureCoding.getter()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of ContextualSuggestion.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of ContextualSuggestion.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t getEnumTagSinglePayload for ContextualSuggestion.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for ContextualSuggestion.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24A786A70);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24A786A98()
{
  return 0;
}

ValueMetadata *type metadata accessor for ContextualSuggestion.CodingKeys()
{
  return &type metadata for ContextualSuggestion.CodingKeys;
}

unint64_t sub_24A786AB0()
{
  unint64_t result = qword_2697BA0C0;
  if (!qword_2697BA0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA0C0);
  }
  return result;
}

uint64_t sub_24A786B04()
{
  return MEMORY[0x270FA2498](sub_24A786B20, 0, 0);
}

uint64_t sub_24A786B20()
{
  id v1 = sub_24A799800();
  uint64_t v2 = *v1;
  v0[2] = *v1;
  uint64_t v3 = (*(void *)v2 + 240) & 0xFFFFFFFFFFFFLL | 0x563E000000000000;
  v0[3] = *(void *)(*(void *)v2 + 240);
  v0[4] = v3;
  swift_retain();
  return MEMORY[0x270FA2498](sub_24A786BB4, v2, 0);
}

uint64_t sub_24A786BB4()
{
  uint64_t v1 = (*(uint64_t (**)(void))(v0 + 24))();
  *(void *)(v0 + 40) = 0;
  uint64_t v2 = v1;
  swift_release();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_24A786C7C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A786E48(const void *a1, void *a2)
{
  *(void *)(v2 + 16) = a2;
  *(void *)(v2 + 24) = _Block_copy(a1);
  id v4 = a2;
  return MEMORY[0x270FA2498](sub_24A786EC0, 0, 0);
}

uint64_t sub_24A786EC0()
{
  uint64_t v1 = sub_24A799800();
  uint64_t v2 = *v1;
  v0[4] = *v1;
  uint64_t v3 = (*(void *)v2 + 240) & 0xFFFFFFFFFFFFLL | 0x563E000000000000;
  v0[5] = *(void *)(*(void *)v2 + 240);
  v0[6] = v3;
  swift_retain();
  return MEMORY[0x270FA2498](sub_24A786F54, v2, 0);
}

uint64_t sub_24A786F54()
{
  uint64_t v1 = (*(uint64_t (**)(void))(v0 + 40))();
  *(void *)(v0 + 56) = 0;
  uint64_t v2 = v1;
  uint64_t v3 = *(void **)(v0 + 16);
  swift_release();

  if (v2)
  {
    sub_24A787494(0, (unint64_t *)&unk_26B17A3B0);
    id v4 = (void *)sub_24A7B3408();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = *(void (***)(void, void, void))(v0 + 24);
  ((void (**)(void, void *, void))v5)[2](v5, v4, 0);

  _Block_release(v5);
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_24A787080()
{
  uint64_t v1 = (void *)v0[7];
  uint64_t v2 = (void *)v0[2];
  swift_release();

  uint64_t v3 = (void *)sub_24A7B31E8();
  id v4 = (void (**)(void, void, void))v0[3];
  ((void (**)(void, void, void *))v4)[2](v4, 0, v3);

  _Block_release(v4);
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

ATXAmbientConfigurationReader __swiftcall ATXAmbientConfigurationReader.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (ATXAmbientConfigurationReader)objc_msgSend(v0, sel_init);
}

id ATXAmbientConfigurationReader.init()()
{
  v1.super_class = (Class)ATXAmbientConfigurationReader;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t type metadata accessor for ATXAmbientConfigurationReader(uint64_t a1)
{
  return sub_24A787494(a1, (unint64_t *)&unk_2697BB060);
}

uint64_t sub_24A7871E4()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A787224()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *id v4 = v1;
  v4[1] = sub_24A786034;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_2697BA0D8 + dword_2697BA0D8);
  return v5(v2, v3);
}

uint64_t sub_24A7872D8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24A7852C4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2697BA000 + dword_2697BA000);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_24A7873A4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A7873DC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24A7852C4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2697BA010 + dword_2697BA010);
  return v6(a1, v4);
}

uint64_t sub_24A787494(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_24A7874D0()
{
  qword_2697BB078 = (uint64_t)&unk_26FE3F780;
}

uint64_t sub_24A7874E8()
{
  return swift_bridgeObjectRetain();
}

void sub_24A787508(void *a1)
{
  uint64_t v3 = *(void **)(v1 + 16);
  if (!objc_msgSend(v3, sel_allowsSmartRotate))
  {
    char v12 = 0;
LABEL_7:
    sub_24A791278();
    swift_allocError();
    char *v13 = v12;
    swift_willThrow();
    return;
  }
  id v4 = objc_msgSend(v3, sel_widgets);
  sub_24A78E9B4();
  unint64_t v5 = sub_24A7B3418();

  uint64_t v6 = a1;
  uint64_t v7 = sub_24A790708(v5, (uint64_t)v6);

  swift_bridgeObjectRelease();
  if (!v7)
  {
    char v12 = 1;
    goto LABEL_7;
  }
  id v8 = objc_msgSend(v3, sel_identifier);
  sub_24A7B3398();

  uint64_t v9 = *(void **)&v6[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification];
  if (v9)
  {
    id v10 = objc_msgSend(v9, sel_clientModelId);
    sub_24A7B3398();

    uint64_t v11 = (void *)sub_24A7B3378();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v14 = objc_msgSend(v7, sel_copyWithSource_, v11);

  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0)
  {
    if (sub_24A7B37A8()) {
      sub_24A790EC8(MEMORY[0x263F8EE78]);
    }
  }
  id v15 = objc_allocWithZone((Class)ATXWidgetStackSuggestion);
  uint64_t v16 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  sub_24A791220();
  id v17 = (void *)sub_24A7B34A8();
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(v15, sel_initWithStackIdentifier_topWidget_suggestedWidgets_, v16, v14, v17);

  os_log_type_t v19 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = v18;
}

void sub_24A787774(uint64_t a1, void *a2)
{
  id v78 = a2;
  uint64_t v5 = sub_24A7B3278();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA120);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA128);
  MEMORY[0x270FA5388](v12 - 8);
  v13 = *(void **)(v2 + 16);
  if (!objc_msgSend(v13, sel_allowsNewWidget))
  {
    sub_24A78E960();
    swift_allocError();
    void *v31 = 0;
    goto LABEL_18;
  }
  uint64_t v74 = v3;
  uint64_t v75 = v2;
  id v14 = objc_msgSend(v13, sel_widgets);
  unint64_t v73 = sub_24A78E9B4();
  unint64_t v15 = sub_24A7B3418();

  id v76 = v13;
  uint64_t v77 = a1;
  uint64_t v71 = v6;
  uint64_t v72 = v5;
  v70 = v8;
  if (v15 >> 62) {
    goto LABEL_39;
  }
  uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v16)
  {
    uint64_t v17 = 4;
    while (1)
    {
      id v18 = (v15 & 0xC000000000000001) != 0
          ? (id)MEMORY[0x24C5CFAE0](v17 - 4, v15)
          : *(id *)(v15 + 8 * v17);
      os_log_type_t v19 = v18;
      uint64_t v20 = v17 - 3;
      if (__OFADD__(v17 - 4, 1)) {
        break;
      }
      if (objc_msgSend(v18, sel_isSuggestedWidget))
      {
        swift_bridgeObjectRelease();
        sub_24A78E960();
        swift_allocError();
        void *v32 = 3;
        swift_willThrow();

        return;
      }

      ++v17;
      if (v20 == v16) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_24A7B37A8();
    swift_bridgeObjectRelease();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  type metadata accessor for WidgetPersonality();
  uint64_t v22 = *(void *)(v77
                  + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier);
  uint64_t v21 = *(void *)(v77
                  + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier
                  + 8);
  uint64_t v23 = *(void **)(v77 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind);
  uint64_t v24 = *(void *)(v77 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v69[1] = v23;
  id v25 = sub_24A79F9F8(v22, v21, (uint64_t)v23, v24);
  id v26 = objc_msgSend(v78, sel_descriptorForPersonality_, v25);
  if (!v26)
  {
    type metadata accessor for SpecialWidgetDescriptor();
    objc_super v27 = (char *)v25;
    uint64_t v28 = sub_24A7A38D8(v27);
    if (v28)
    {
      id v26 = (id)v28;
      goto LABEL_14;
    }
    sub_24A78E960();
    swift_allocError();
    *v37 = v27;
LABEL_18:
    swift_willThrow();
    return;
  }
LABEL_14:
  objc_msgSend(v76, sel_family);
  uint64_t v29 = CHSWidgetFamilyMaskFromWidgetFamily();
  if ((v29 & ~(unint64_t)objc_msgSend(v26, sel_supportedFamilies)) != 0)
  {
    sub_24A78E960();
    swift_allocError();
    uint64_t v34 = 2;
LABEL_24:
    uint64_t *v33 = v34;
    swift_willThrow();

    return;
  }
  if (*(unsigned char *)(v75 + 24)) {
    uint64_t v30 = sub_24A7A3834();
  }
  else {
    uint64_t v30 = sub_24A7A384C();
  }
  if ((v29 & ~(unint64_t)objc_msgSend(v26, sel_disfavoredFamiliesForLocation_, *v30)) == 0)
  {
    sub_24A78E960();
    swift_allocError();
    uint64_t v34 = 5;
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  sub_24A7B32C8();
  uint64_t v35 = *(void *)(v77
                  + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_containerBundleIdentifier
                  + 8);
  v69[0] = v25;
  if (v35)
  {
    swift_bridgeObjectRetain_n();
    sub_24A7B32C8();
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA138);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v11, 0, 1, v36);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA138);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v11, 1, 1, v38);
  }
  sub_24A7B3588();
  v39 = (void *)sub_24A7B3578();
  swift_bridgeObjectRetain();
  id v40 = objc_msgSend(v76, sel_family);
  uint64_t v41 = v77;
  v42 = *(void **)(v77 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent);
  id v43 = objc_allocWithZone(MEMORY[0x263F31E70]);
  id v44 = v42;
  v45 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  id v46 = objc_msgSend(v43, sel_initWithExtensionIdentity_kind_family_intent_activityIdentifier_, v39, v45, v40, v44, 0);

  v47 = v70;
  sub_24A7B3268();
  sub_24A7B3258();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v47, v72);
  v48 = *(void **)(v41
                 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification);
  if (v48)
  {
    id v49 = objc_msgSend(v48, sel_clientModelId, v69[0]);
    sub_24A7B3398();
    uint64_t v51 = v50;
  }
  else
  {
    uint64_t v51 = 0;
  }
  id v52 = v46;
  v53 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  if (v51)
  {
    v54 = (void *)sub_24A7B3378();
    swift_bridgeObjectRelease();
  }
  else
  {
    v54 = 0;
  }
  v55 = v26;
  id v56 = objc_msgSend(objc_allocWithZone((Class)ATXWidget), sel_initWithIdentifier_chsWidget_suggestedWidget_source_, v53, v52, 1, v54);

  id v57 = objc_msgSend(v76, sel_identifier);
  sub_24A7B3398();

  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA140);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A7B4FA0;
  *(void *)(inited + 32) = v56;
  unint64_t v79 = inited;
  sub_24A7B3438();
  unint64_t v59 = v79;
  if (v79 >> 62)
  {
    id v62 = v56;
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_24A7B37A8();
    swift_bridgeObjectRelease();
    if (!v63) {
      goto LABEL_42;
    }
    goto LABEL_37;
  }
  uint64_t v60 = *(void *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v61 = v56;
  if (v60) {
LABEL_37:
  }
    sub_24A790EC8(v59);
LABEL_42:
  swift_bridgeObjectRelease();
  id v64 = objc_allocWithZone((Class)ATXWidgetStackSuggestion);
  v65 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  sub_24A791220();
  v66 = (void *)sub_24A7B34A8();
  swift_bridgeObjectRelease();
  id v67 = objc_msgSend(v64, sel_initWithStackIdentifier_topWidget_suggestedWidgets_, v65, v56, v66);

  v68 = *(void **)(v75 + 32);
  *(void *)(v75 + 32) = v67;
}

uint64_t sub_24A787FF8()
{
  return MEMORY[0x270FA0228](v0, 40, 7);
}

id sub_24A788038()
{
  id v0 = objc_allocWithZone((Class)ATXWidgetLocationAuthorizationTracker);
  return objc_msgSend(v0, sel_init);
}

uint64_t sub_24A788070()
{
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t sub_24A788078@<X0>(char a1@<W0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v9 = a1 & 1;
  id v10 = objc_msgSend(objc_allocWithZone((Class)ATXWidgetLocationAuthorizationTracker), sel_init);
  if (!(a2 >> 62))
  {
    uint64_t v11 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v11) {
      goto LABEL_3;
    }
LABEL_12:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v21 = MEMORY[0x263F8EE78];
LABEL_13:
    *(void *)a5 = v21;
    *(void *)(a5 + 8) = a3;
    *(void *)(a5 + 16) = 0;
    *(void *)(a5 + 24) = 0;
    *(void *)(a5 + 32) = a4;
    *(void *)(a5 + 40) = v10;
    *(unsigned char *)(a5 + 48) = v9;
    return result;
  }
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_24A7B37A8();
  swift_bridgeObjectRelease();
  if (!v11) {
    goto LABEL_12;
  }
LABEL_3:
  uint64_t v23 = MEMORY[0x263F8EE78];
  uint64_t result = sub_24A7B3748();
  if ((v11 & 0x8000000000000000) == 0)
  {
    uint64_t v22 = a4;
    if ((a2 & 0xC000000000000001) != 0)
    {
      uint64_t v13 = 0;
      do
      {
        uint64_t v14 = v13 + 1;
        uint64_t v15 = MEMORY[0x24C5CFAE0]();
        type metadata accessor for WidgetStackSuggestionGenerator.StackState();
        uint64_t v16 = swift_allocObject();
        *(void *)(v16 + 32) = 0;
        *(void *)(v16 + 16) = v15;
        *(unsigned char *)(v16 + 24) = v9;
        sub_24A7B3728();
        sub_24A7B3758();
        sub_24A7B3768();
        sub_24A7B3738();
        uint64_t v13 = v14;
      }
      while (v11 != v14);
    }
    else
    {
      uint64_t v17 = (void **)(a2 + 32);
      type metadata accessor for WidgetStackSuggestionGenerator.StackState();
      do
      {
        id v18 = *v17++;
        uint64_t v19 = swift_allocObject();
        *(void *)(v19 + 32) = 0;
        *(void *)(v19 + 16) = v18;
        *(unsigned char *)(v19 + 24) = v9;
        id v20 = v18;
        sub_24A7B3728();
        sub_24A7B3758();
        sub_24A7B3768();
        sub_24A7B3738();
        --v11;
      }
      while (v11);
    }
    uint64_t v21 = v23;
    uint64_t result = swift_bridgeObjectRelease();
    a4 = v22;
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for WidgetStackSuggestionGenerator.StackState()
{
  return self;
}

uint64_t sub_24A788298()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 16);
  }
  else
  {
    uint64_t v3 = v0;
    sub_24A788340();
    uint64_t v2 = v4;
    uint64_t v5 = sub_24A78A390();
    *(void *)(v3 + 16) = v2;
    *(void *)(v3 + 24) = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  sub_24A78AFBC(v1);
  return v2;
}

void sub_24A788340()
{
  uint64_t v0 = (id *)sub_24A7B32F8();
  uint64_t v1 = (uint64_t)*(v0 - 1);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)v175 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  unint64_t v7 = (unint64_t)v175 - v6;
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  id v10 = (char *)v175 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  unint64_t v13 = (unint64_t)v175 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)v175 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)v175 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)v175 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)v175 - v23;
  sub_24A78B0AC((uint64_t)&v212);
  v199 = v0;
  uint64_t v192 = v1;
  if (v213)
  {
    unint64_t v206 = v213;
    unint64_t v25 = v212;
    uint64_t v26 = v214;
    uint64_t v27 = v215;
    uint64_t v28 = v216;
    uint64_t v29 = v217;
    LODWORD(v207) = v218;
    LODWORD(v205) = v218 & 1;
    uint64_t v30 = sub_24A796BD0();
    (*(void (**)(char *, uint64_t, id *))(v1 + 16))(v24, v30, v0);
    v31 = sub_24A7B32E8();
    os_log_type_t v32 = sub_24A7B3508();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_24A77B000, v31, v32, "Loaded debug rotation", v33, 2u);
      MEMORY[0x24C5D05E0](v33, -1, -1);
    }

    (*(void (**)(char *, id *))(v192 + 8))(v24, v199);
    uint64_t v34 = v25;
    unint64_t v212 = v25;
    uint64_t v35 = v206;
    unint64_t v213 = v206;
    uint64_t v214 = v26;
    uint64_t v215 = v27;
    uint64_t v216 = v28;
    uint64_t v217 = v29;
    unsigned __int8 v218 = v205;
    sub_24A78B498((uint64_t)&v212);
    sub_24A791624(v34, v35);
    return;
  }
  v175[3] = v4;
  unint64_t v206 = (unint64_t)v22;
  v184 = v19;
  v185 = v16;
  unint64_t v176 = v13;
  v177 = v10;
  v175[2] = v7;
  unint64_t v36 = v198[1];
  v220[0] = v36;
  unint64_t v212 = MEMORY[0x263F8EE78];
  if (v36 >> 62) {
    goto LABEL_143;
  }
  uint64_t v37 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
LABEL_7:
  uint64_t v38 = v0;
  uint64_t v39 = v1;
  if (v37)
  {
    if (v37 < 1)
    {
      __break(1u);
LABEL_168:
      v130 = (char *)MEMORY[0x24C5CFAE0](0);
      goto LABEL_101;
    }
    for (uint64_t i = 0; i != v37; ++i)
    {
      if ((v36 & 0xC000000000000001) != 0) {
        id v41 = (id)MEMORY[0x24C5CFAE0](i, v36);
      }
      else {
        id v41 = *(id *)(v36 + 8 * i + 32);
      }
      v42 = v41;
      type metadata accessor for ContextualWidgetSuggestion();
      if (swift_dynamicCastClass())
      {
        MEMORY[0x24C5CF7E0]();
        if (*(void *)((v212 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v212 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_24A7B3448();
        }
        sub_24A7B3458();
        sub_24A7B3438();
      }
      else
      {
      }
    }
    uint64_t v43 = v39;
    sub_24A7912CC((uint64_t)v220);
    unint64_t v44 = v212;
    uint64_t v38 = v0;
  }
  else
  {
    uint64_t v43 = v1;
    sub_24A7912CC((uint64_t)v220);
    unint64_t v44 = MEMORY[0x263F8EE78];
  }
  sub_24A7912CC((uint64_t)v220);
  uint64_t v45 = sub_24A796BD0();
  id v46 = *(void (**)(char *, uint64_t, id *))(v43 + 16);
  unint64_t v47 = v206;
  uint64_t v190 = v45;
  uint64_t v189 = v43 + 16;
  v188 = v46;
  ((void (*)(unint64_t))v46)(v206);
  swift_bridgeObjectRetain_n();
  v48 = sub_24A7B32E8();
  os_log_type_t v49 = sub_24A7B3508();
  unint64_t v7 = v49;
  BOOL v50 = os_log_type_enabled(v48, v49);
  unint64_t v36 = MEMORY[0x263F8EE58];
  uint64_t v207 = v44;
  if (v50)
  {
    uint64_t v51 = (uint8_t *)swift_slowAlloc();
    unint64_t v52 = swift_slowAlloc();
    unint64_t v212 = v52;
    *(_DWORD *)uint64_t v51 = 136315138;
    v205 = v51 + 4;
    uint64_t v53 = type metadata accessor for ContextualWidgetSuggestion();
    uint64_t v54 = swift_bridgeObjectRetain();
    uint64_t v55 = MEMORY[0x24C5CF810](v54, v53);
    unint64_t v57 = v56;
    swift_bridgeObjectRelease();
    uint64_t v58 = v55;
    uint64_t v38 = v0;
    uint64_t v219 = sub_24A78F4E0(v58, v57, (uint64_t *)&v212);
    unint64_t v36 = MEMORY[0x263F8EE58];
    sub_24A7B3608();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A77B000, v48, (os_log_type_t)v7, "Suggestions: %s", v51, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v52, -1, -1);
    MEMORY[0x24C5D05E0](v51, -1, -1);

    unint64_t v59 = *(void (**)(unint64_t, id *))(v43 + 8);
    unint64_t v60 = v206;
    id v61 = v0;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    unint64_t v59 = *(void (**)(unint64_t, id *))(v43 + 8);
    unint64_t v60 = v47;
    id v61 = v38;
  }
  v187 = v59;
  v59(v60, v61);
  unint64_t v13 = *v198;
  uint64_t v219 = v13;
  unint64_t v181 = v13 >> 62;
  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v36 = MEMORY[0x263F8EE58];
    uint64_t v39 = sub_24A7B37A8();
  }
  else
  {
    uint64_t v39 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v197 = (unint64_t *)((unint64_t)v207 >> 62);
  unint64_t v202 = v13;
  uint64_t v194 = v39;
  if (v39)
  {
    uint64_t v1 = 0;
    v191 = 0;
    v203 = (id *)(v13 & 0xC000000000000001);
    *(void *)&long long v196 = v13 & 0xFFFFFFFFFFFFFF8;
    *(void *)&long long v195 = v13 + 32;
    uint64_t v63 = v207 & 0xFFFFFFFFFFFFFF8;
    uint64_t v193 = v207 & 0xFFFFFFFFFFFFFF8;
    if (v207 < 0) {
      uint64_t v63 = v207;
    }
    v175[1] = v63;
    unint64_t v206 = v207 & 0xC000000000000001;
    uint64_t v186 = v192 + 8;
    v180 = &v211;
    v179 = (uint64_t *)&v209;
    unint64_t v64 = 0x26528E000uLL;
    *(void *)&long long v62 = 136315394;
    long long v182 = v62;
    unint64_t v178 = v36 + 8;
    long long v183 = xmmword_24A7B4FA0;
LABEL_32:
    if (v203)
    {
      uint64_t v65 = MEMORY[0x24C5CFAE0](v1, v13);
      BOOL v66 = __OFADD__(v1++, 1);
      if (v66) {
        goto LABEL_139;
      }
    }
    else
    {
      if ((unint64_t)v1 >= *(void *)(v196 + 16)) {
        goto LABEL_141;
      }
      uint64_t v65 = swift_retain();
      BOOL v66 = __OFADD__(v1++, 1);
      if (v66) {
        goto LABEL_139;
      }
    }
    unint64_t v204 = v1;
    v205 = (uint8_t *)v65;
    unint64_t v7 = *(void *)(v65 + 16);
    unint64_t v36 = (unint64_t)objc_msgSend((id)v7, sel_widgets);
    unint64_t v67 = sub_24A78E9B4();
    uint64_t v1 = sub_24A7B3418();

    if ((unint64_t)v1 >> 62)
    {
      if (v1 < 0) {
        unint64_t v36 = v1;
      }
      else {
        unint64_t v36 = v1 & 0xFFFFFFFFFFFFFF8;
      }
      swift_bridgeObjectRetain();
      uint64_t v0 = (id *)sub_24A7B37A8();
      if (!v0)
      {
LABEL_30:
        swift_bridgeObjectRelease_n();
        swift_release();
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v0 = *(id **)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v0) {
        goto LABEL_30;
      }
    }
    v200 = (void *)v7;
    v201 = (char *)v67;
    uint64_t v68 = 4;
    while (1)
    {
      id v69 = (v1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24C5CFAE0](v68 - 4, v1) : *(id *)(v1 + 8 * v68);
      unint64_t v7 = (unint64_t)v69;
      unint64_t v36 = v68 - 3;
      if (__OFADD__(v68 - 4, 1)) {
        break;
      }
      if ([v69 *(SEL *)(v64 + 2776)])
      {
        swift_bridgeObjectRelease_n();
        if (!v197)
        {
          uint64_t v70 = *(void *)(v193 + 16);
          uint64_t v1 = v207;
          swift_bridgeObjectRetain();
          if (v70) {
            goto LABEL_50;
          }
LABEL_82:
          swift_bridgeObjectRelease();
          sub_24A78E960();
          unint64_t v36 = (unint64_t)&type metadata for WidgetStackSuggestionGenerator.StackState.NewWidgetSuggestionFailure;
          v99 = (void *)swift_allocError();
          void *v100 = 4;
          swift_willThrow();
          v191 = 0;

          unint64_t v212 = (unint64_t)v99;
          id v101 = v99;
          __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA080);
          if (swift_dynamicCast())
          {

            id v102 = v210;
            unint64_t v36 = (unint64_t)v184;
            uint64_t v38 = v199;
            v188(v184, v190, v199);
            uint64_t v0 = (id *)v205;
            swift_retain();
            sub_24A791604(v102);
            swift_retain();
            sub_24A791604(v102);
            v103 = sub_24A7B32E8();
            os_log_type_t v104 = sub_24A7B3508();
            if (os_log_type_enabled(v103, v104))
            {
              unint64_t v7 = swift_slowAlloc();
              v200 = (void *)swift_slowAlloc();
              v201 = (char *)swift_slowAlloc();
              v209 = v201;
              *(_DWORD *)unint64_t v7 = v182;
              id v105 = objc_msgSend(v0[2], sel_identifier);
              uint64_t v106 = sub_24A7B3398();
              unint64_t v108 = v107;

              uint64_t v208 = sub_24A78F4E0(v106, v108, (uint64_t *)&v209);
              sub_24A7B3608();
              swift_release_n();
              unint64_t v64 = 0x26528E000;
              swift_bridgeObjectRelease();
              *(_WORD *)(v7 + 12) = 2112;
              swift_allocError();
              void *v109 = v102;
              sub_24A791604(v102);
              uint64_t v0 = (id *)_swift_stdlib_bridgeErrorToNSError();
              uint64_t v208 = (uint64_t)v0;
              sub_24A7B3608();
              v110 = v200;
              void *v200 = v0;
              sub_24A791614(v102);
              sub_24A791614(v102);
              _os_log_impl(&dword_24A77B000, v103, v104, "Removing previously suggested new widget in stack <%s>: %@", (uint8_t *)v7, 0x16u);
              __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1D0);
              swift_arrayDestroy();
              MEMORY[0x24C5D05E0](v110, -1, -1);
              unint64_t v36 = (unint64_t)v201;
              swift_arrayDestroy();
              MEMORY[0x24C5D05E0](v36, -1, -1);
              MEMORY[0x24C5D05E0](v7, -1, -1);

              sub_24A791614(v102);
              swift_release();
              unint64_t v111 = (unint64_t)v184;
              uint64_t v38 = v199;
            }
            else
            {
              swift_release();
              sub_24A791614(v102);
              swift_release_n();
              sub_24A791614(v102);
              sub_24A791614(v102);

              unint64_t v111 = v36;
            }
            v187(v111, v38);
          }
          else
          {

            v112 = v185;
            uint64_t v38 = v199;
            v188(v185, v190, v199);
            id v113 = v99;
            uint64_t v0 = (id *)v205;
            swift_retain();
            id v114 = v99;
            swift_retain();
            v115 = sub_24A7B32E8();
            os_log_type_t v116 = sub_24A7B34F8();
            if (os_log_type_enabled(v115, v116))
            {
              unint64_t v7 = swift_slowAlloc();
              v117 = (void *)swift_slowAlloc();
              v201 = (char *)swift_slowAlloc();
              unint64_t v212 = (unint64_t)v201;
              *(_DWORD *)unint64_t v7 = v182;
              id v118 = objc_msgSend(v0[2], sel_identifier);
              uint64_t v119 = sub_24A7B3398();
              unint64_t v121 = v120;

              uint64_t v38 = v199;
              id v210 = (id)sub_24A78F4E0(v119, v121, (uint64_t *)&v212);
              sub_24A7B3608();
              swift_release_n();
              swift_bridgeObjectRelease();
              *(_WORD *)(v7 + 12) = 2112;
              id v122 = v99;
              uint64_t v0 = (id *)_swift_stdlib_bridgeErrorToNSError();
              id v210 = v0;
              sub_24A7B3608();
              void *v117 = v0;

              _os_log_impl(&dword_24A77B000, v115, v116, "Removing previously suggested new widget in stack <%s>: unknown failure: %@", (uint8_t *)v7, 0x16u);
              __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1D0);
              swift_arrayDestroy();
              v123 = v117;
              unint64_t v64 = 0x26528E000;
              MEMORY[0x24C5D05E0](v123, -1, -1);
              unint64_t v36 = (unint64_t)v201;
              swift_arrayDestroy();
              MEMORY[0x24C5D05E0](v36, -1, -1);
              MEMORY[0x24C5D05E0](v7, -1, -1);

              swift_release();
              v124 = v185;
            }
            else
            {
              swift_release();

              swift_release_n();
              v124 = v112;
            }
            v187((unint64_t)v124, v38);
          }
          unint64_t v13 = v202;
          uint64_t v39 = v194;
          goto LABEL_31;
        }
        uint64_t v1 = v207;
        swift_bridgeObjectRetain();
        uint64_t v70 = sub_24A7B37A8();
        if (!v70) {
          goto LABEL_82;
        }
LABEL_50:
        unint64_t v13 = 4;
        while (2)
        {
          unint64_t v36 = v13 - 4;
          if (v206) {
            uint64_t v71 = (char *)MEMORY[0x24C5CFAE0](v13 - 4, v1);
          }
          else {
            uint64_t v71 = (char *)*(id *)(v1 + 8 * v13);
          }
          uint64_t v72 = v71;
          unint64_t v73 = v13 - 3;
          if (__OFADD__(v36, 1)) {
            goto LABEL_138;
          }
          uint64_t v74 = *(void *)&v71[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier];
          uint64_t v0 = *(id **)&v71[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier
                          + 8];
          id v75 = objc_msgSend((id)v7, sel_chsWidget);
          id v76 = objc_msgSend(v75, sel_extensionIdentity);

          swift_beginAccess();
          __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA128);
          uint64_t v77 = sub_24A7B32D8();
          unint64_t v79 = v78;
          swift_endAccess();

          if (v74 != v77 || v0 != v79)
          {
            char v81 = sub_24A7B3878();
            swift_bridgeObjectRelease();
            unint64_t v64 = 0x26528E000;
            if (v81) {
              goto LABEL_63;
            }
LABEL_51:

            ++v13;
            uint64_t v1 = v207;
            if (v73 == v70) {
              goto LABEL_82;
            }
            continue;
          }
          break;
        }
        swift_bridgeObjectRelease();
LABEL_63:
        uint64_t v83 = *(void *)&v72[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind];
        v82 = *(id **)&v72[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind + 8];
        id v84 = objc_msgSend((id)v7, sel_chsWidget);
        id v85 = objc_msgSend(v84, sel_kind);

        uint64_t v86 = sub_24A7B3398();
        uint64_t v0 = v87;

        if (v83 == v86 && v82 == v0)
        {
          swift_bridgeObjectRelease();
          unint64_t v64 = 0x26528E000;
        }
        else
        {
          char v88 = sub_24A7B3878();
          swift_bridgeObjectRelease();
          unint64_t v64 = 0x26528E000;
          if ((v88 & 1) == 0) {
            goto LABEL_51;
          }
        }
        id v89 = objc_msgSend((id)v7, sel_chsWidget);
        id v90 = objc_msgSend(v89, sel_intentReference);

        if (!v90 || (id v91 = objc_msgSend(v90, sel_intent), v90, !v91))
        {
LABEL_71:

          swift_bridgeObjectRelease();
          goto LABEL_73;
        }
        uint64_t v92 = *(void *)&v72[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent];
        if (v92)
        {
          unsigned __int8 v93 = objc_msgSend(self, sel_intent_isEqualToIntent_, v91, v92);

          if (v93) {
            goto LABEL_71;
          }
          goto LABEL_51;
        }

        swift_bridgeObjectRelease();
LABEL_73:
        id v94 = objc_msgSend(v200, sel_identifier);
        sub_24A7B3398();

        __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA140);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v183;
        *(void *)(inited + 32) = v7;
        unint64_t v212 = inited;
        sub_24A7B3438();
        unint64_t v96 = v212;
        uint64_t v38 = v199;
        unint64_t v13 = v202;
        uint64_t v39 = v194;
        if (v212 >> 62)
        {
          id v125 = (id)v7;
          swift_bridgeObjectRetain();
          uint64_t v126 = sub_24A7B37A8();
          swift_bridgeObjectRelease();
          if (v126) {
LABEL_75:
          }
            sub_24A790EC8(v96);
        }
        else
        {
          uint64_t v97 = *(void *)((v212 & 0xFFFFFFFFFFFFFF8) + 0x10);
          id v98 = (id)v7;
          if (v97) {
            goto LABEL_75;
          }
        }
        swift_bridgeObjectRelease();
        id v127 = objc_allocWithZone((Class)ATXWidgetStackSuggestion);
        v128 = (void *)sub_24A7B3378();
        swift_bridgeObjectRelease();
        sub_24A791220();
        uint64_t v0 = (id *)sub_24A7B34A8();
        swift_bridgeObjectRelease();
        unint64_t v36 = (unint64_t)objc_msgSend(v127, sel_initWithStackIdentifier_topWidget_suggestedWidgets_, v128, v7, v0);

        v129 = (void *)*((void *)v205 + 4);
        *((void *)v205 + 4) = v36;
        swift_release();

LABEL_31:
        uint64_t v1 = v204;
        if (v204 == v39)
        {
          sub_24A7912CC((uint64_t)&v219);
          goto LABEL_96;
        }
        goto LABEL_32;
      }

      ++v68;
      if ((id *)v36 == v0) {
        goto LABEL_30;
      }
    }
    __break(1u);
LABEL_138:
    __break(1u);
LABEL_139:
    __break(1u);
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
    goto LABEL_142;
  }
  sub_24A7912CC((uint64_t)&v219);
  v191 = 0;
LABEL_96:
  if (v197)
  {
    if (v207 < 0) {
      unint64_t v36 = v207;
    }
    else {
      unint64_t v36 = v207 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_24A7B37A8();
    swift_bridgeObjectRelease();
    if (!v37)
    {
LABEL_149:
      swift_bridgeObjectRelease();
      goto LABEL_150;
    }
  }
  else
  {
    uint64_t v37 = *(void *)((v207 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v37) {
      goto LABEL_149;
    }
  }
  unint64_t v7 = v207 & 0xC000000000000001;
  if ((v207 & 0xC000000000000001) != 0) {
    goto LABEL_168;
  }
  if (!*(void *)((v207 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_170;
  }
  v130 = (char *)*(id *)(v207 + 32);
LABEL_101:
  v132 = v130;
  uint64_t v1 = (uint64_t)v198;
  if (!v39) {
    goto LABEL_136;
  }
  unint64_t v133 = v13 & 0xC000000000000001;
  unint64_t v134 = v13 + 32;
  v197 = &v213;
  v205 = (uint8_t *)(v192 + 8);
  v203 = &v210;
  v201 = (char *)(v207 & 0xFFFFFFFFFFFFFF8);
  v200 = (void *)(v207 + 32);
  unint64_t v206 = 1;
  *(void *)&long long v131 = 138412546;
  long long v196 = v131;
  *(void *)&long long v131 = 138412290;
  long long v195 = v131;
  unint64_t v204 = v13 & 0xC000000000000001;
  do
  {
    if (!v133)
    {
      uint64_t v136 = 0;
      while (1)
      {
        uint64_t v137 = v136 + 1;
        if (__OFADD__(v136, 1)) {
          break;
        }
        if (!*(void *)(*(void *)(v134 + 8 * v136) + 32)) {
          goto LABEL_115;
        }
        ++v136;
        if (v137 == v39) {
          goto LABEL_136;
        }
      }
LABEL_142:
      __break(1u);
LABEL_143:
      swift_bridgeObjectRetain_n();
      uint64_t v37 = sub_24A7B37A8();
      goto LABEL_7;
    }
    swift_bridgeObjectRetain_n();
    unint64_t v36 = 0;
    while (1)
    {
      uint64_t v135 = MEMORY[0x24C5CFAE0](v36, v13);
      uint64_t v1 = v36 + 1;
      if (__OFADD__(v36, 1)) {
        goto LABEL_140;
      }
      uint64_t v0 = *(id **)(v135 + 32);
      swift_unknownObjectRelease();
      if (!v0) {
        break;
      }
      ++v36;
      if (v1 == v39) {
        goto LABEL_135;
      }
    }
    sub_24A7912CC((uint64_t)&v219);
    sub_24A7912CC((uint64_t)&v219);
LABEL_115:
    uint64_t v0 = v191;
    sub_24A78B9B0(v132);
    if (v0)
    {
      id v210 = v0;
      v138 = v0;
      uint64_t v192 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA080);
      int v139 = swift_dynamicCast();
      v140 = v177;
      if (v139)
      {

        unint64_t v141 = v212;
        LODWORD(v191) = v213;
        unint64_t v142 = v176;
        v188((char *)v176, v190, v38);
        v143 = v132;
        v144 = sub_24A7B32E8();
        os_log_type_t v145 = sub_24A7B3508();
        LODWORD(v186) = v145;
        if (os_log_type_enabled(v144, v145))
        {
          uint64_t v146 = swift_slowAlloc();
          v147 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v146 = v196;
          v185 = (char *)v141;
          v209 = v143;
          v148 = v143;
          uint64_t v193 = v37;
          v149 = v148;
          sub_24A7B3608();
          void *v147 = v143;

          *(_WORD *)(v146 + 12) = 2112;
          sub_24A78B058();
          swift_allocError();
          *(void *)uint64_t v150 = v185;
          *(unsigned char *)(v150 + 8) = (_BYTE)v191;
          uint64_t v151 = _swift_stdlib_bridgeErrorToNSError();
          v209 = (char *)v151;
          sub_24A7B3608();
          v147[1] = v151;
          uint64_t v37 = v193;
          _os_log_impl(&dword_24A77B000, v144, (os_log_type_t)v186, "Can't smart rotate to suggestion: %@: %@", (uint8_t *)v146, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1D0);
          swift_arrayDestroy();
          v152 = v147;
          uint64_t v39 = v194;
          uint64_t v38 = v199;
          MEMORY[0x24C5D05E0](v152, -1, -1);
          uint64_t v153 = v146;
          unint64_t v142 = v176;
          MEMORY[0x24C5D05E0](v153, -1, -1);
        }
        else
        {

          v144 = v143;
        }

        v187(v142, v38);
      }
      else
      {
        v191 = v0;

        v188(v140, v190, v38);
        v154 = v132;
        v155 = sub_24A7B32E8();
        os_log_type_t v156 = sub_24A7B34F8();
        if (os_log_type_enabled(v155, v156))
        {
          v157 = (uint8_t *)swift_slowAlloc();
          uint64_t v158 = swift_slowAlloc();
          uint64_t v193 = v37;
          v159 = (void *)v158;
          uint64_t v186 = v7;
          *(_DWORD *)v157 = v195;
          unint64_t v212 = (unint64_t)v154;
          v160 = v154;
          unint64_t v7 = v186;
          sub_24A7B3608();
          void *v159 = v154;

          uint64_t v39 = v194;
          uint64_t v38 = v199;
          _os_log_impl(&dword_24A77B000, v155, v156, "Can't smart rotate to suggestion: %@: unknown failure", v157, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1D0);
          swift_arrayDestroy();
          v161 = v159;
          uint64_t v37 = v193;
          MEMORY[0x24C5D05E0](v161, -1, -1);
          MEMORY[0x24C5D05E0](v157, -1, -1);
        }
        else
        {
        }
        v187((unint64_t)v177, v38);
      }
      uint64_t v0 = 0;
      sub_24A78CB1C((uint64_t)v132);

      v191 = 0;
      unint64_t v13 = v202;
    }
    else
    {
      v191 = 0;
    }
    unint64_t v162 = v206;
    if (v206 == v37) {
      goto LABEL_149;
    }
    if (v7)
    {
      v163 = (char *)MEMORY[0x24C5CFAE0](v206, v207);
    }
    else
    {
      if (v206 >= *((void *)v201 + 2)) {
        goto LABEL_171;
      }
      v163 = (char *)(id)v200[v206];
    }
    v132 = v163;
    BOOL v66 = __OFADD__(v162, 1);
    unint64_t v36 = v162 + 1;
    unint64_t v206 = v36;
    uint64_t v1 = (uint64_t)v198;
    unint64_t v133 = v204;
  }
  while (!v66);
  __break(1u);
LABEL_135:
  sub_24A7912CC((uint64_t)&v219);
  sub_24A7912CC((uint64_t)&v219);
LABEL_136:
  swift_bridgeObjectRelease();

LABEL_150:
  if (v181)
  {
    swift_bridgeObjectRetain();
    uint64_t v164 = sub_24A7B37A8();
  }
  else
  {
    uint64_t v164 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (!v164)
  {
LABEL_166:
    sub_24A7912CC((uint64_t)&v219);
    return;
  }
  unint64_t v212 = MEMORY[0x263F8EE78];
  sub_24A7B3748();
  if ((v164 & 0x8000000000000000) == 0)
  {
    uint64_t v165 = 0;
    unint64_t v166 = v13 & 0xC000000000000001;
    while (1)
    {
      if (v166)
      {
        uint64_t v168 = MEMORY[0x24C5CFAE0](v165, v13);
        v169 = *(void **)(v168 + 32);
        if (!v169) {
          goto LABEL_161;
        }
      }
      else
      {
        uint64_t v168 = *(void *)(v13 + 8 * v165 + 32);
        swift_retain();
        v169 = *(void **)(v168 + 32);
        if (!v169)
        {
LABEL_161:
          id v170 = objc_msgSend(*(id *)(v168 + 16), sel_identifier);
          sub_24A7B3398();

          if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0)
          {
            unint64_t v174 = MEMORY[0x263F8EE78];
            if (sub_24A7B37A8()) {
              sub_24A790EC8(v174);
            }
          }
          id v171 = objc_allocWithZone((Class)ATXWidgetStackSuggestion);
          v172 = (void *)sub_24A7B3378();
          swift_bridgeObjectRelease();
          sub_24A78E9B4();
          sub_24A791220();
          v173 = (void *)sub_24A7B34A8();
          swift_bridgeObjectRelease();
          objc_msgSend(v171, sel_initWithStackIdentifier_topWidget_suggestedWidgets_, v172, 0, v173);

          v169 = 0;
          unint64_t v13 = v202;
        }
      }
      ++v165;
      id v167 = v169;
      swift_release();
      sub_24A7B3728();
      sub_24A7B3758();
      sub_24A7B3768();
      sub_24A7B3738();
      if (v164 == v165) {
        goto LABEL_166;
      }
    }
  }
LABEL_170:
  __break(1u);
LABEL_171:
  __break(1u);
}

uint64_t sub_24A78A390()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24A7B32F8();
  uint64_t v100 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  v99 = (char *)&v93 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v5 = (unint64_t)v0[1];
  v112[0] = v5;
  v108[0] = MEMORY[0x263F8EE78];
  uint64_t v94 = v3;
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v6 = sub_24A7B37A8();
    if (!v6) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (!v6) {
      goto LABEL_19;
    }
  }
  if (v6 < 1) {
    goto LABEL_125;
  }
  if ((v5 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      MEMORY[0x24C5CFAE0](i, v5);
      type metadata accessor for ContextualActionSuggestion();
      if (swift_dynamicCastClass())
      {
        MEMORY[0x24C5CF7E0]();
        if (*(void *)((v108[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v108[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_24A7B3448();
        }
        sub_24A7B3458();
        sub_24A7B3438();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    uint64_t v8 = (void **)(v5 + 32);
    type metadata accessor for ContextualActionSuggestion();
    do
    {
      uint64_t v9 = *v8;
      if (swift_dynamicCastClass())
      {
        MEMORY[0x24C5CF7E0](v9);
        if (*(void *)((v108[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v108[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_24A7B3448();
        }
        sub_24A7B3458();
        sub_24A7B3438();
      }
      ++v8;
      --v6;
    }
    while (v6);
  }
LABEL_19:
  sub_24A7912CC((uint64_t)v112);
  unint64_t v10 = v108[0];
  sub_24A7912CC((uint64_t)v112);
  unint64_t v110 = v10;
  unint64_t v109 = sub_24A78DF7C(MEMORY[0x263F8EE78]);
  unint64_t v111 = (unint64_t)*v1;
  unint64_t v11 = v111;
  uint64_t v12 = v111 & 0xFFFFFFFFFFFFFF8;
  if (v111 >> 62) {
    goto LABEL_121;
  }
  uint64_t v13 = *(void *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v13)
  {
LABEL_122:
    sub_24A7912CC((uint64_t)&v111);
    swift_bridgeObjectRelease();
    return v109;
  }
LABEL_21:
  unint64_t v14 = 0;
  unint64_t v15 = v11 & 0xC000000000000001;
  unsigned __int8 v93 = (char *)(v11 + 32);
  uint64_t v105 = *MEMORY[0x263F25148];
  unint64_t v16 = 0x26528E000;
  unint64_t v17 = 0x26528E000uLL;
  long long v103 = xmmword_24A7B4FA0;
  uint64_t v97 = v12;
  unint64_t v98 = v11;
  uint64_t v96 = v13;
  unint64_t v95 = v11 & 0xC000000000000001;
  while (1)
  {
    if (!v15)
    {
      if (v14 >= *(void *)(v12 + 16))
      {
        __break(1u);
LABEL_125:
        __break(1u);
LABEL_126:
        uint64_t result = sub_24A7B3898();
        __break(1u);
        return result;
      }
      uint64_t v18 = *(void *)&v93[8 * v14];
      swift_retain();
      BOOL v19 = __OFADD__(v14++, 1);
      if (!v19) {
        goto LABEL_30;
      }
LABEL_117:
      __break(1u);
LABEL_118:
      __break(1u);
LABEL_119:
      __break(1u);
LABEL_120:
      __break(1u);
LABEL_121:
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_24A7B37A8();
      if (!v13) {
        goto LABEL_122;
      }
      goto LABEL_21;
    }
    uint64_t v18 = MEMORY[0x24C5CFAE0](v14, v11);
    BOOL v19 = __OFADD__(v14++, 1);
    if (v19) {
      goto LABEL_117;
    }
LABEL_30:
    id v20 = objc_msgSend(*(id *)(v18 + 16), *(SEL *)(v16 + 2904), v93);
    sub_24A78E9B4();
    unint64_t v21 = sub_24A7B3418();

    unint64_t v104 = v21;
    if (!(v21 >> 62))
    {
      uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v22) {
        break;
      }
      goto LABEL_101;
    }
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_24A7B37A8();
    swift_bridgeObjectRelease();
    if (v22) {
      break;
    }
LABEL_101:
    swift_release();
LABEL_23:
    swift_bridgeObjectRelease();
    if (v14 == v13) {
      goto LABEL_122;
    }
  }
  unint64_t v101 = v14;
  uint64_t v102 = v18;
  unint64_t v23 = v104;
  uint64_t v106 = v22;
  unint64_t v107 = v104 & 0xC000000000000001;
  uint64_t v24 = 4;
  while (1)
  {
    if (v107) {
      id v25 = (id)MEMORY[0x24C5CFAE0](v24 - 4, v23);
    }
    else {
      id v25 = *(id *)(v23 + 8 * v24);
    }
    unint64_t v11 = (unint64_t)v25;
    uint64_t v26 = v24 - 3;
    if (__OFADD__(v24 - 4, 1))
    {
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
      goto LABEL_117;
    }
    id v27 = [v25 *(SEL *)(v17 + 2464)];
    id v28 = objc_msgSend(v27, sel_extensionIdentity);

    swift_beginAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA128);
    uint64_t v29 = sub_24A7B32D8();
    uint64_t v31 = v30;
    swift_endAccess();

    if (v29 == sub_24A7B3398() && v31 == v32)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      uint64_t v12 = sub_24A7B3878();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {

        goto LABEL_34;
      }
    }
    id v34 = [(id)v11 *(SEL *)(v17 + 2464)];
    id v35 = objc_msgSend(v34, sel_kind);

    uint64_t v36 = sub_24A7B3398();
    uint64_t v38 = v37;

    id v39 = (id)ATXSpecialWidgetKindSiriSuggestions();
    uint64_t v40 = sub_24A7B3398();
    uint64_t v42 = v41;

    if (v36 == v40 && v38 == v42) {
      break;
    }
    uint64_t v12 = sub_24A7B3878();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_50;
    }

    unint64_t v23 = v104;
LABEL_34:
    ++v24;
    if (v26 == v106)
    {
      swift_release();
      uint64_t v12 = v97;
      unint64_t v11 = v98;
      uint64_t v13 = v96;
      unint64_t v14 = v101;
      unint64_t v15 = v95;
      unint64_t v16 = 0x26528E000uLL;
      goto LABEL_23;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_50:
  unint64_t v43 = v110;
  unint64_t v44 = v110 >> 62;
  if (!(v110 >> 62))
  {
    if (!*(void *)((v110 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_102;
    }
LABEL_52:
    id v45 = objc_msgSend((id)v11, sel_identifier);
    uint64_t v46 = sub_24A7B3398();
    uint64_t v48 = v47;

    if (*(void *)(v109 + 16))
    {
      sub_24A78FB38(v46, v48);
      char v50 = v49;
      swift_bridgeObjectRelease();
      if (v50)
      {
        id v51 = objc_msgSend((id)v11, sel_identifier);
        uint64_t v52 = sub_24A7B3398();
        uint64_t v12 = v53;

        uint64_t v55 = sub_24A78E098(v108, v52, v12);
        if (*v54)
        {
          unint64_t v56 = v54;
          if (v44)
          {
            swift_bridgeObjectRetain();
            uint64_t v65 = sub_24A7B37A8();
            swift_bridgeObjectRelease();
            if (!v65) {
              goto LABEL_119;
            }
            swift_bridgeObjectRetain();
            uint64_t v66 = sub_24A7B37A8();
            swift_bridgeObjectRelease();
            if (!v66) {
              goto LABEL_115;
            }
          }
          else if (!*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            goto LABEL_118;
          }
          if ((v43 & 0xC000000000000001) != 0)
          {
            MEMORY[0x24C5CFAE0](0, v43);
            if (!v44)
            {
LABEL_75:
              uint64_t v68 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_96:
              unint64_t v23 = v104;
              if (!v68) {
                goto LABEL_120;
              }
              uint64_t v86 = sub_24A7912F8(0, 1);
              MEMORY[0x24C5CF7E0](v86);
              if (*(void *)((*v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_24A7B3448();
              }
              sub_24A7B3458();
              sub_24A7B3438();
              ((void (*)(void *, void))v55)(v108, 0);
              swift_bridgeObjectRelease();

              unint64_t v17 = 0x26528E000;
              goto LABEL_34;
            }
          }
          else
          {
            if (!*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_116;
            }
            id v67 = *(id *)(v43 + 32);
            if (!v44) {
              goto LABEL_75;
            }
          }
          swift_bridgeObjectRetain();
          uint64_t v68 = sub_24A7B37A8();
          swift_bridgeObjectRelease();
          goto LABEL_96;
        }
        ((void (*)(void *, void))v55)(v108, 0);
        swift_bridgeObjectRelease();

        goto LABEL_93;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    id v57 = objc_msgSend((id)v11, sel_identifier);
    uint64_t v58 = sub_24A7B3398();
    uint64_t v12 = v59;

    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA140);
    uint64_t v60 = swift_allocObject();
    *(_OWORD *)(v60 + 16) = v103;
    if (v44)
    {
      swift_bridgeObjectRetain();
      uint64_t v61 = sub_24A7B37A8();
      swift_bridgeObjectRelease();
      if (!v61) {
        goto LABEL_112;
      }
      swift_bridgeObjectRetain();
      uint64_t v62 = sub_24A7B37A8();
      swift_bridgeObjectRelease();
      if (!v62) {
        goto LABEL_108;
      }
    }
    else if (!*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_111;
    }
    if ((v43 & 0xC000000000000001) != 0)
    {
      id v63 = (id)MEMORY[0x24C5CFAE0](0, v43);
      if (!v44) {
        goto LABEL_68;
      }
    }
    else
    {
      if (!*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_109;
      }
      id v63 = *(id *)(v43 + 32);
      if (!v44)
      {
LABEL_68:
        uint64_t v64 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
        goto LABEL_80;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v64 = sub_24A7B37A8();
    swift_bridgeObjectRelease();
LABEL_80:
    if (!v64) {
      goto LABEL_113;
    }
    sub_24A7912F8(0, 1);
    *(void *)(v60 + 32) = v63;
    v108[0] = v60;
    sub_24A7B3438();
    uint64_t v70 = v108[0];
    unint64_t v71 = v109;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v108[0] = v71;
    unint64_t v109 = 0x8000000000000000;
    unint64_t v74 = sub_24A78FB38(v58, v12);
    uint64_t v75 = *(void *)(v71 + 16);
    BOOL v76 = (v73 & 1) == 0;
    uint64_t v77 = v75 + v76;
    if (__OFADD__(v75, v76)) {
      goto LABEL_110;
    }
    char v78 = v73;
    if (*(void *)(v71 + 24) >= v77)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        char v81 = (void *)v108[0];
        if ((v73 & 1) == 0) {
          goto LABEL_90;
        }
      }
      else
      {
        sub_24A790378();
        char v81 = (void *)v108[0];
        if ((v78 & 1) == 0) {
          goto LABEL_90;
        }
      }
    }
    else
    {
      sub_24A78FEA4(v77, isUniquelyReferenced_nonNull_native);
      unint64_t v79 = sub_24A78FB38(v58, v12);
      if ((v78 & 1) != (v80 & 1)) {
        goto LABEL_126;
      }
      unint64_t v74 = v79;
      char v81 = (void *)v108[0];
      if ((v78 & 1) == 0)
      {
LABEL_90:
        v81[(v74 >> 6) + 8] |= 1 << v74;
        uint64_t v83 = (uint64_t *)(v81[6] + 16 * v74);
        *uint64_t v83 = v58;
        v83[1] = v12;
        *(void *)(v81[7] + 8 * v74) = v70;
        uint64_t v84 = v81[2];
        BOOL v19 = __OFADD__(v84, 1);
        uint64_t v85 = v84 + 1;
        if (v19) {
          goto LABEL_114;
        }
        v81[2] = v85;
        swift_bridgeObjectRetain();
        goto LABEL_92;
      }
    }
    uint64_t v82 = v81[7];
    swift_bridgeObjectRelease();
    *(void *)(v82 + 8 * v74) = v70;
LABEL_92:
    unint64_t v109 = (unint64_t)v81;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_93:
    unint64_t v17 = 0x26528E000;
    unint64_t v23 = v104;
    goto LABEL_34;
  }
  swift_bridgeObjectRetain();
  uint64_t v69 = sub_24A7B37A8();
  swift_bridgeObjectRelease();
  if (v69) {
    goto LABEL_52;
  }
LABEL_102:
  swift_bridgeObjectRelease();
  sub_24A7912CC((uint64_t)&v111);
  swift_bridgeObjectRelease();
  uint64_t v87 = sub_24A796BD0();
  uint64_t v88 = v94;
  (*(void (**)(char *, uint64_t, uint64_t))(v100 + 16))(v99, v87, v94);
  id v89 = sub_24A7B32E8();
  os_log_type_t v90 = sub_24A7B34F8();
  if (os_log_type_enabled(v89, v90))
  {
    id v91 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v91 = 0;
    _os_log_impl(&dword_24A77B000, v89, v90, "Ran out of action suggestions while assigning suggestions widgets", v91, 2u);
    MEMORY[0x24C5D05E0](v91, -1, -1);
    swift_release();
  }
  else
  {

    swift_release();
  }

  (*(void (**)(char *, uint64_t))(v100 + 8))(v99, v88);
  return v109;
}

uint64_t sub_24A78AFBC(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_24A78B000()
{
  unint64_t result = qword_2697BA100;
  if (!qword_2697BA100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA100);
  }
  return result;
}

unint64_t sub_24A78B058()
{
  unint64_t result = qword_2697BA108;
  if (!qword_2697BA108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA108);
  }
  return result;
}

double sub_24A78B0AC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24A7B32F8();
  MEMORY[0x270FA5388](v2);
  sub_24A7B3398();
  id v3 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v4 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v3, sel_initWithSuiteName_, v4);

  if (v5)
  {
    sub_24A79DE60();
    swift_bridgeObjectRetain();
    uint64_t v6 = (void *)sub_24A7B3378();
    swift_bridgeObjectRelease();
    id v7 = objc_msgSend(v5, sel_dataForKey_, v6);

    if (v7)
    {
      uint64_t v8 = sub_24A7B3218();
      unint64_t v10 = v9;

      sub_24A7B3168();
      swift_allocObject();
      sub_24A7B3158();
      sub_24A7917BC();
      sub_24A7B3148();
      swift_release();

      sub_24A791810(v8, v10);
      double result = *(double *)&v12;
      *(_OWORD *)a1 = v12;
      *(_OWORD *)(a1 + 16) = v13;
      *(void *)(a1 + 32) = v14;
      *(void *)(a1 + 40) = v15;
      *(unsigned char *)(a1 + 48) = v16;
      return result;
    }
  }
  *(unsigned char *)(a1 + 48) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

NSObject *sub_24A78B498(uint64_t a1)
{
  uint64_t v3 = sub_24A7B32F8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  id v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  unint64_t v10 = (char *)&v42 - v9;
  MEMORY[0x270FA5388](v8);
  long long v12 = (char *)&v42 - v11;
  long long v13 = *(_OWORD *)(a1 + 16);
  v49[0] = *(_OWORD *)a1;
  v49[1] = v13;
  v49[2] = *(_OWORD *)(a1 + 32);
  char v50 = *(unsigned char *)(a1 + 48);
  unint64_t v14 = *v1;
  swift_bridgeObjectRetain();
  sub_24A791674((uint64_t)v49);
  uint64_t v15 = sub_24A790D18(v14, (uint64_t)v49);
  sub_24A7916C0((uint64_t)v49);
  swift_bridgeObjectRelease();
  if (!v15)
  {
    uint64_t v35 = sub_24A796BD0();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v35, v3);
    uint64_t v36 = sub_24A7B32E8();
    os_log_type_t v37 = sub_24A7B34F8();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl(&dword_24A77B000, v36, v37, "Debug rotation didn't refer to an existing stack", v38, 2u);
      MEMORY[0x24C5D05E0](v38, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    return MEMORY[0x263F8EE78];
  }
  id v16 = *(id *)(v15 + 16);
  id v17 = objc_msgSend(v16, sel_widgets);
  sub_24A78E9B4();
  unint64_t v18 = sub_24A7B3418();

  sub_24A791674((uint64_t)v49);
  BOOL v19 = sub_24A790A94(v18, (uint64_t *)v49);
  sub_24A7916C0((uint64_t)v49);
  swift_bridgeObjectRelease();
  if (!v19 && (v50 & 1) == 0)
  {
    uint64_t v20 = sub_24A796BD0();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v10, v20, v3);
    unint64_t v21 = sub_24A7B32E8();
    os_log_type_t v22 = sub_24A7B34F8();
    if (os_log_type_enabled(v21, v22))
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v23 = 0;
      _os_log_impl(&dword_24A77B000, v21, v22, "Debug rotation didn't refer to an existing widget, and debug rotation doesn't allow for new widget suggestions", v23, 2u);
      MEMORY[0x24C5D05E0](v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v3);
    swift_release();

    return MEMORY[0x263F8EE78];
  }
  id v24 = sub_24A78E9F4(v19, v16);
  uint64_t v25 = sub_24A796BD0();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v12, v25, v3);
  uint64_t v26 = v24;
  id v27 = sub_24A7B32E8();
  os_log_type_t v28 = sub_24A7B3508();
  if (os_log_type_enabled(v27, v28))
  {
    id v45 = v12;
    uint64_t v29 = swift_slowAlloc();
    id v46 = v16;
    uint64_t v30 = (uint8_t *)v29;
    unint64_t v43 = (void *)swift_slowAlloc();
    uint64_t v47 = v4;
    uint64_t v48 = v26;
    *(_DWORD *)uint64_t v30 = 138412290;
    uint64_t v31 = v26;
    unint64_t v44 = v19;
    uint64_t v32 = v31;
    long long v12 = v45;
    uint64_t v4 = v47;
    sub_24A7B3608();
    v33 = v43;
    *unint64_t v43 = v26;

    BOOL v19 = v44;
    _os_log_impl(&dword_24A77B000, v27, v28, "Applying ambient debug rotation suggestion: %@", v30, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1D0);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v33, -1, -1);
    id v34 = v30;
    id v16 = v46;
    MEMORY[0x24C5D05E0](v34, -1, -1);
  }
  else
  {

    id v27 = v26;
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA140);
  uint64_t v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_24A7B4FA0;
  *(void *)(v40 + 32) = v26;
  uint64_t v48 = v40;
  sub_24A7B3438();
  id v39 = v48;
  swift_release();

  return v39;
}

void sub_24A78B9B0(char *a1)
{
  unint64_t v5 = sub_24A7B32F8();
  os_log_t v115 = *(os_log_t *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (uint64_t)&v108 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v108 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t isa = (uint64_t)&v108 - v12;
  unint64_t v14 = *(void **)&a1[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification];
  uint64_t v126 = v11;
  if (!v14)
  {
    sub_24A78B058();
    uint64_t v23 = swift_allocError();
    *(void *)uint64_t v24 = 0;
    *(unsigned char *)(v24 + 8) = 1;
    goto LABEL_7;
  }
  uint64_t v3 = v2;
  id v15 = objc_msgSend(v14, sel_clientModelId);
  uint64_t v11 = (char *)sub_24A7B3398();
  uint64_t v17 = v16;

  unint64_t v18 = *(void **)&a1[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_scoreSpecification];
  if (!v18)
  {
LABEL_9:
    if (qword_2697BB070 != -1) {
      goto LABEL_94;
    }
    goto LABEL_10;
  }
  id v19 = v18;
  if ((uint64_t)objc_msgSend(v19, sel_suggestedConfidenceCategory) > 2)
  {

    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  sub_24A78B058();
  uint64_t v20 = swift_allocError();
  *(void *)uint64_t v21 = 2;
  *(unsigned char *)(v21 + 8) = 1;
  swift_willThrow();

  uint64_t v22 = v20;
  uint64_t v11 = v126;
  if (v20) {
    return;
  }
LABEL_17:
  unint64_t v1 = *(void *)v1;
  unint64_t v134 = v1;
  uint64_t v17 = v1 & 0xFFFFFFFFFFFFFF8;
  unint64_t v120 = v5;
  uint64_t v116 = v8;
  uint64_t v108 = isa;
  id v125 = (void *)v22;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_24A7B37A8();
    if (!v29)
    {
LABEL_96:
      sub_24A7912CC((uint64_t)&v134);
      sub_24A78B058();
      swift_allocError();
      *(void *)uint64_t v107 = 3;
      *(unsigned char *)(v107 + 8) = 1;
      swift_willThrow();
      return;
    }
  }
  else
  {
    uint64_t v29 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v29) {
      goto LABEL_96;
    }
  }
  unint64_t v5 = 0;
  v128 = (void *)(v1 & 0xC000000000000001);
  id v118 = a1;
  os_log_t v119 = (os_log_t)(v1 + 32);
  uint64_t v123 = v29;
  v124 = v1;
  v117 = (void *)(v1 & 0xFFFFFFFFFFFFFF8);
  do
  {
    if (v128)
    {
      uint64_t isa = MEMORY[0x24C5CFAE0](v5, v1);
      BOOL v30 = __OFADD__(v5++, 1);
      if (v30) {
        goto LABEL_91;
      }
    }
    else
    {
      if (v5 >= *(void *)(v17 + 16)) {
        goto LABEL_93;
      }
      uint64_t isa = (uint64_t)v119[v5].isa;
      swift_retain();
      BOOL v30 = __OFADD__(v5++, 1);
      if (v30) {
        goto LABEL_91;
      }
    }
    if (*(void *)(isa + 32))
    {
      swift_release();
      continue;
    }
    uint64_t v31 = (char *)objc_msgSend(*(id *)(isa + 16), sel_topWidgetIdentifier);
    if (!v31)
    {
      swift_release();
      uint64_t v11 = v126;
      continue;
    }
    uint64_t v11 = v31;
    uint64_t v17 = sub_24A7B3398();
    os_log_t v129 = v32;

    id v33 = objc_msgSend(*(id *)(isa + 16), sel_widgets);
    sub_24A78E9B4();
    unint64_t v1 = sub_24A7B3418();

    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_24A7B37A8();
      uint64_t v121 = isa;
      id v122 = (id)v5;
      if (!v34)
      {
LABEL_44:
        swift_bridgeObjectRelease_n();
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v17 = (uint64_t)v117;
        a1 = v118;
        uint64_t v11 = v126;
        uint64_t v29 = v123;
        unint64_t v1 = (unint64_t)v124;
        unint64_t v5 = (unint64_t)v122;
        continue;
      }
    }
    else
    {
      uint64_t v34 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      uint64_t v121 = isa;
      id v122 = (id)v5;
      if (!v34) {
        goto LABEL_44;
      }
    }
    os_log_t v127 = (os_log_t)(v1 & 0xC000000000000001);
    unint64_t v5 = 4;
    while (1)
    {
      uint64_t v3 = v5 - 4;
      if (v127)
      {
        uint64_t v35 = (objc_class *)MEMORY[0x24C5CFAE0](v5 - 4, v1);
        uint64_t isa = v5 - 3;
        if (__OFADD__(v3, 1)) {
          goto LABEL_90;
        }
      }
      else
      {
        uint64_t v35 = (objc_class *)*(id *)(v1 + 8 * v5);
        uint64_t isa = v5 - 3;
        if (__OFADD__(v3, 1))
        {
LABEL_90:
          __break(1u);
LABEL_91:
          __break(1u);
LABEL_92:
          __break(1u);
LABEL_93:
          __break(1u);
LABEL_94:
          swift_once();
LABEL_10:
          if (sub_24A78E1C4((uint64_t)v11, v17, (void *)qword_2697BB078))
          {
            swift_bridgeObjectRelease();
            uint64_t v11 = v126;
            uint64_t v23 = v3;
          }
          else
          {
            uint64_t v25 = self;
            uint64_t v26 = (void *)sub_24A7B3378();
            swift_bridgeObjectRelease();
            unint64_t v27 = (unint64_t)objc_msgSend(v25, sel_clientModelTypeFromClientModelId_, v26);

            BOOL v28 = v27 > 0x14 || ((1 << v27) & 0x1C1114) == 0;
            uint64_t v11 = v126;
            uint64_t v23 = v3;
            if (v28)
            {
              sub_24A78B058();
              uint64_t v23 = swift_allocError();
              *(void *)uint64_t v106 = v27;
              *(unsigned char *)(v106 + 8) = 0;
LABEL_7:
              swift_willThrow();
            }
          }
          uint64_t v22 = v23;
          if (v23) {
            return;
          }
          goto LABEL_17;
        }
      }
      uint64_t v11 = (char *)v35;
      id v36 = [(objc_class *)v35 identifier];
      a1 = (char *)sub_24A7B3398();
      uint64_t v3 = v37;

      if (a1 == (char *)v17 && v3 == (void)v129) {
        break;
      }
      uint64_t v8 = sub_24A7B3878();
      swift_bridgeObjectRelease();
      if (v8) {
        goto LABEL_47;
      }

      ++v5;
      if (isa == v34) {
        goto LABEL_44;
      }
    }
    swift_bridgeObjectRelease();
LABEL_47:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a1 = v118;
    uint64_t v40 = *(void *)&v118[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier];
    uint64_t v39 = *(void *)&v118[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier
                         + 8];
    id v41 = objc_msgSend(v11, sel_chsWidget);
    uint64_t v8 = (uint64_t)objc_msgSend(v41, sel_extensionIdentity);

    swift_beginAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA128);
    uint64_t v3 = sub_24A7B32D8();
    uint64_t v43 = v42;
    swift_endAccess();

    uint64_t isa = v121;
    unint64_t v5 = (unint64_t)v122;
    if (v40 == v3 && v39 == v43)
    {
      swift_bridgeObjectRelease();
      unint64_t v44 = v11;
LABEL_51:
      uint64_t v47 = *(void *)&a1[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind];
      uint64_t v46 = *(void *)&a1[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind + 8];
      id v48 = objc_msgSend(v44, sel_chsWidget);
      uint64_t v8 = (uint64_t)objc_msgSend(v48, sel_kind);

      uint64_t v3 = sub_24A7B3398();
      uint64_t v50 = v49;

      if (v47 == v3 && v46 == v50)
      {
        swift_bridgeObjectRelease();
        unint64_t v44 = v11;
LABEL_55:
        id v52 = objc_msgSend(v44, sel_chsWidget);
        id v53 = objc_msgSend(v52, sel_intentReference);

        if (v53)
        {
          id v54 = objc_msgSend(v53, sel_intent);

          if (v54)
          {
            uint64_t v55 = *(void *)&a1[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent];
            if (v55)
            {
              unsigned __int8 v56 = objc_msgSend(self, sel_intent_isEqualToIntent_, v54, v55);

              if ((v56 & 1) == 0) {
                goto LABEL_63;
              }
            }
            else
            {
            }
          }
        }
        id v57 = v125;
        sub_24A787508(a1);
        if (v57)
        {
          sub_24A7912CC((uint64_t)&v134);
          swift_release();

          return;
        }
        id v125 = 0;
      }
      else
      {
        char v51 = sub_24A7B3878();
        swift_bridgeObjectRelease();
        unint64_t v44 = v11;
        if (v51) {
          goto LABEL_55;
        }
      }
    }
    else
    {
      char v45 = sub_24A7B3878();
      swift_bridgeObjectRelease();
      unint64_t v44 = v11;
      if (v45) {
        goto LABEL_51;
      }
    }
LABEL_63:

    swift_release();
    uint64_t v11 = v126;
    uint64_t v29 = v123;
    unint64_t v1 = (unint64_t)v124;
    uint64_t v17 = (uint64_t)v117;
  }
  while (v5 != v29);
  sub_24A7912CC((uint64_t)&v134);
  os_log_t v127 = v115 + 2;
  os_log_t v129 = v115 + 1;
  v112 = v132;
  unint64_t v111 = &v131;
  swift_bridgeObjectRetain();
  uint64_t v8 = 4;
  *(void *)&long long v58 = 136315650;
  long long v110 = v58;
  uint64_t v109 = MEMORY[0x263F8EE58] + 8;
  *(void *)&long long v58 = 136315394;
  long long v113 = v58;
  while (1)
  {
    uint64_t v17 = v8 - 4;
    if (v128)
    {
      unint64_t v5 = MEMORY[0x24C5CFAE0](v8 - 4, v1);
      uint64_t v3 = v8 - 3;
      if (__OFADD__(v17, 1)) {
        goto LABEL_92;
      }
    }
    else
    {
      unint64_t v5 = *(void *)(v1 + 8 * v8);
      swift_retain();
      uint64_t v3 = v8 - 3;
      if (__OFADD__(v17, 1)) {
        goto LABEL_92;
      }
    }
    if (!*(void *)(v5 + 32)) {
      break;
    }
    swift_release();
LABEL_68:
    ++v8;
    if (v3 == v29) {
      goto LABEL_96;
    }
  }
  uint64_t v59 = v125;
  sub_24A787508(a1);
  if (v59)
  {
    v133[0] = v59;
    id v60 = v59;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA080);
    int v61 = swift_dynamicCast();
    id v125 = 0;
    if (v61)
    {

      uint64_t isa = v132[7];
      uint64_t v62 = sub_24A796BD0();
      unint64_t v63 = v120;
      ((void (*)(char *, uint64_t, unint64_t))v127->isa)(v11, v62, v120);
      swift_retain_n();
      uint64_t v64 = a1;
      uint64_t v65 = sub_24A7B32E8();
      os_log_type_t v66 = sub_24A7B3508();
      LODWORD(v122) = v66;
      if (os_log_type_enabled(v65, v66))
      {
        uint64_t v67 = swift_slowAlloc();
        v117 = (void *)swift_slowAlloc();
        uint64_t v121 = swift_slowAlloc();
        uint64_t v131 = v121;
        *(_DWORD *)uint64_t v67 = v110;
        os_log_t v119 = v65;
        uint64_t v114 = v67 + 4;
        id v68 = objc_msgSend(*(id *)(v5 + 16), sel_identifier);
        uint64_t v69 = sub_24A7B3398();
        LODWORD(v115) = isa;
        unint64_t v71 = v70;

        uint64_t v72 = v118;
        uint64_t v130 = sub_24A78F4E0(v69, v71, &v131);
        sub_24A7B3608();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v67 + 12) = 2112;
        uint64_t v130 = (uint64_t)v64;
        char v73 = v64;
        sub_24A7B3608();
        uint64_t isa = (uint64_t)v117;
        void *v117 = v72;

        *(_WORD *)(v67 + 22) = 2112;
        sub_24A791278();
        swift_allocError();
        *unint64_t v74 = (_BYTE)v115;
        uint64_t v75 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v130 = v75;
        a1 = v72;
        uint64_t v11 = v126;
        sub_24A7B3608();
        *(void *)(isa + 8) = v75;
        os_log_t v76 = v119;
        _os_log_impl(&dword_24A77B000, v119, (os_log_type_t)v122, "Stack %s could not smart rotate to %@: %@", (uint8_t *)v67, 0x20u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1D0);
        swift_arrayDestroy();
        MEMORY[0x24C5D05E0](isa, -1, -1);
        uint64_t v77 = v121;
        swift_arrayDestroy();
        MEMORY[0x24C5D05E0](v77, -1, -1);
        MEMORY[0x24C5D05E0](v67, -1, -1);
        swift_release();

        ((void (*)(char *, unint64_t))v129->isa)(v11, v120);
      }
      else
      {

        swift_release_n();
        ((void (*)(char *, unint64_t))v129->isa)(v11, v63);
      }
    }
    else
    {
      id v122 = v59;

      uint64_t v78 = sub_24A796BD0();
      uint64_t v79 = v116;
      unint64_t v80 = v120;
      ((void (*)(uint64_t, uint64_t, unint64_t))v127->isa)(v116, v78, v120);
      swift_retain_n();
      uint64_t isa = a1;
      char v81 = sub_24A7B32E8();
      os_log_type_t v82 = sub_24A7B34F8();
      LODWORD(v121) = v82;
      if (os_log_type_enabled(v81, v82))
      {
        uint64_t v83 = swift_slowAlloc();
        v117 = (void *)swift_slowAlloc();
        os_log_t v119 = (os_log_t)swift_slowAlloc();
        v133[0] = v119;
        *(_DWORD *)uint64_t v83 = v113;
        uint64_t v114 = v83 + 4;
        id v84 = objc_msgSend(*(id *)(v5 + 16), sel_identifier);
        uint64_t v85 = sub_24A7B3398();
        os_log_t v115 = v81;
        uint64_t v86 = v85;
        unint64_t v88 = v87;

        uint64_t v131 = sub_24A78F4E0(v86, v88, (uint64_t *)v133);
        sub_24A7B3608();
        swift_release_n();
        a1 = v118;
        swift_bridgeObjectRelease();
        *(_WORD *)(v83 + 12) = 2112;
        uint64_t v131 = isa;
        uint64_t isa = (uint64_t)(id)isa;
        uint64_t v11 = v126;
        sub_24A7B3608();
        id v89 = v117;
        void *v117 = a1;

        os_log_t v90 = v115;
        _os_log_impl(&dword_24A77B000, v115, (os_log_type_t)v121, "Stack %s could not smart rotate to %@: unexpected failure", (uint8_t *)v83, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1D0);
        swift_arrayDestroy();
        MEMORY[0x24C5D05E0](v89, -1, -1);
        os_log_t v91 = v119;
        swift_arrayDestroy();
        MEMORY[0x24C5D05E0](v91, -1, -1);
        MEMORY[0x24C5D05E0](v83, -1, -1);

        swift_release();
        ((void (*)(uint64_t, unint64_t))v129->isa)(v116, v120);
      }
      else
      {

        swift_release_n();
        ((void (*)(uint64_t, unint64_t))v129->isa)(v79, v80);
      }
    }
    uint64_t v29 = v123;
    unint64_t v1 = (unint64_t)v124;
    goto LABEL_68;
  }
  sub_24A7912CC((uint64_t)&v134);
  uint64_t v92 = sub_24A796BD0();
  uint64_t v93 = v108;
  unint64_t v94 = v120;
  ((void (*)(uint64_t, uint64_t, unint64_t))v127->isa)(v108, v92, v120);
  swift_retain_n();
  unint64_t v95 = a1;
  uint64_t v96 = sub_24A7B32E8();
  os_log_type_t v97 = sub_24A7B3508();
  if (os_log_type_enabled(v96, v97))
  {
    uint64_t v98 = swift_slowAlloc();
    os_log_t v127 = (os_log_t)swift_slowAlloc();
    v128 = (void *)swift_slowAlloc();
    v133[0] = v128;
    *(_DWORD *)uint64_t v98 = v113;
    uint64_t v126 = (char *)(v98 + 4);
    id v99 = objc_msgSend(*(id *)(v5 + 16), sel_identifier);
    uint64_t v100 = sub_24A7B3398();
    id v122 = 0;
    unint64_t v102 = v101;

    uint64_t v131 = sub_24A78F4E0(v100, v102, (uint64_t *)v133);
    sub_24A7B3608();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v98 + 12) = 2112;
    uint64_t v131 = (uint64_t)v95;
    long long v103 = v95;
    sub_24A7B3608();
    os_log_t v104 = v127;
    v127->uint64_t isa = (Class)v118;

    _os_log_impl(&dword_24A77B000, v96, v97, "Stack <%s> successfully smart rotated to %@", (uint8_t *)v98, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1D0);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v104, -1, -1);
    uint64_t v105 = v128;
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v105, -1, -1);
    MEMORY[0x24C5D05E0](v98, -1, -1);
    swift_release();

    ((void (*)(uint64_t, unint64_t))v129->isa)(v93, v120);
  }
  else
  {

    swift_release_n();
    ((void (*)(uint64_t, unint64_t))v129->isa)(v93, v94);
  }
}

uint64_t sub_24A78CB1C(uint64_t a1)
{
  v124 = (char *)a1;
  unint64_t v2 = sub_24A7B32F8();
  unint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (uint64_t)&v90 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v90 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v90 - v10;
  long long v113 = v1;
  unint64_t v126 = *v1;
  uint64_t v12 = v126;
  if (v126 >> 62) {
    goto LABEL_87;
  }
  uint64_t v13 = *(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v13)
  {
LABEL_88:
    sub_24A7912CC((uint64_t)&v126);
    sub_24A78E170();
    swift_allocError();
    *(void *)uint64_t v89 = 4;
    *(unsigned char *)(v89 + 8) = 1;
    return swift_willThrow();
  }
LABEL_3:
  unint64_t v119 = v12 & 0xC000000000000001;
  uint64_t v110 = v12 + 32;
  uint64_t v105 = (void (**)(char *, uint64_t, unint64_t))(v3 + 16);
  os_log_t v104 = (void (**)(char *, unint64_t))(v3 + 8);
  unint64_t v3 = 0;
  unint64_t v95 = &v129;
  os_log_t v91 = &v125;
  *(void *)&long long v14 = 136315394;
  long long v94 = v14;
  uint64_t v92 = MEMORY[0x263F8EE58] + 8;
  *(void *)&long long v14 = 136315650;
  long long v90 = v14;
  unint64_t v15 = 0x26528E000uLL;
  unint64_t v109 = v2;
  uint64_t v108 = v6;
  uint64_t v114 = v9;
  v112 = v11;
  uint64_t v107 = v12;
  uint64_t v106 = v13;
  while (1)
  {
    if (v119)
    {
      uint64_t v16 = MEMORY[0x24C5CFAE0](v3, v12);
      BOOL v17 = __OFADD__(v3++, 1);
      if (v17)
      {
LABEL_85:
        __break(1u);
LABEL_86:
        __break(1u);
LABEL_87:
        swift_bridgeObjectRetain();
        uint64_t v13 = sub_24A7B37A8();
        if (!v13) {
          goto LABEL_88;
        }
        goto LABEL_3;
      }
    }
    else
    {
      uint64_t v16 = *(void *)(v110 + 8 * v3);
      swift_retain();
      BOOL v17 = __OFADD__(v3++, 1);
      if (v17) {
        goto LABEL_85;
      }
    }
    if (!*(void *)(v16 + 32)) {
      break;
    }
    swift_release();
LABEL_5:
    if (v3 == v13) {
      goto LABEL_88;
    }
  }
  unint64_t v18 = *(void **)&v124[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification];
  unint64_t v117 = v3;
  if (!v18)
  {
    sub_24A78B058();
    uint64_t v32 = swift_allocError();
    *(void *)uint64_t v34 = 0;
    *(unsigned char *)(v34 + 8) = 1;
LABEL_22:
    swift_willThrow();
    goto LABEL_78;
  }
  id v19 = objc_msgSend(v18, sel_clientModelId, (void)v90, *((void *)&v90 + 1));
  sub_24A7B3398();

  uint64_t v20 = self;
  uint64_t v21 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  uint64_t v22 = (char *)objc_msgSend(v20, sel_clientModelTypeFromClientModelId_, v21);

  *((void *)&v24 + 1) = v22;
  *(void *)&long long v24 = v22 - 2;
  unint64_t v23 = v24 >> 1;
  BOOL v25 = v23 > 9;
  uint64_t v26 = (1 << v23) & 0x32B;
  if (v25 || v26 == 0)
  {
    sub_24A78E170();
    uint64_t v32 = swift_allocError();
    *(void *)uint64_t v67 = v22;
    *(unsigned char *)(v67 + 8) = 0;
    goto LABEL_22;
  }
  uint64_t v28 = (uint64_t)v124;
  uint64_t v29 = *(void **)&v124[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_scoreSpecification];
  if (v29)
  {
    id v30 = v29;
    if ((uint64_t)objc_msgSend(v30, sel_suggestedConfidenceCategory) <= 2)
    {
      sub_24A78E170();
      uint64_t v32 = swift_allocError();
      uint64_t v33 = 3;
LABEL_20:
      *(void *)uint64_t v31 = v33;
      *(unsigned char *)(v31 + 8) = 1;
      swift_willThrow();

      goto LABEL_78;
    }
  }
  unint64_t v3 = *v113;
  uint64_t v128 = v3;
  uint64_t v100 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_24A7B37A8();
    uint64_t v12 = result;
    if (result)
    {
LABEL_26:
      id v36 = 0;
      id v99 = (uint64_t *)(v28
                      + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier);
      id v118 = (uint64_t *)(v28 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind);
      uint64_t v116 = OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent;
      unint64_t v37 = v3 & 0xC000000000000001;
      unint64_t v93 = v3 + 32;
      uint64_t v103 = v16;
      unint64_t v98 = v3;
      os_log_type_t v97 = (char *)v12;
      unint64_t v96 = v3 & 0xC000000000000001;
      while (1)
      {
        if (v37)
        {
          uint64_t v38 = MEMORY[0x24C5CFAE0](v36, v3);
          BOOL v17 = __OFADD__(v36, 1);
          uint64_t v9 = v36 + 1;
          if (v17) {
            goto LABEL_86;
          }
        }
        else
        {
          if ((unint64_t)v36 >= *(void *)(v100 + 16))
          {
            __break(1u);
            return result;
          }
          uint64_t v38 = swift_retain();
          BOOL v17 = __OFADD__(v36, 1);
          uint64_t v9 = v36 + 1;
          if (v17) {
            goto LABEL_86;
          }
        }
        uint64_t v111 = v38;
        id v39 = objc_msgSend(*(id *)(v38 + 16), sel_widgets);
        unint64_t v40 = sub_24A78E9B4();
        unint64_t v2 = sub_24A7B3418();

        if (v2 >> 62)
        {
          swift_bridgeObjectRetain();
          unint64_t v3 = sub_24A7B37A8();
          swift_bridgeObjectRelease();
        }
        else
        {
          unint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        unint64_t v102 = v9;
        unint64_t v101 = v40;
        if (v3) {
          break;
        }
LABEL_58:
        swift_bridgeObjectRelease();
        uint64_t v11 = v112;
        uint64_t v62 = *(void **)(v111 + 32);
        uint64_t v28 = (uint64_t)v124;
        unint64_t v2 = v109;
        uint64_t v6 = v108;
        uint64_t v16 = v103;
        if (v62)
        {
          id v63 = v62;
          id v64 = objc_msgSend(v63, sel_suggestedWidgets);
          sub_24A791220();
          uint64_t v65 = sub_24A7B34C8();

          if ((v65 & 0xC000000000000001) != 0) {
            uint64_t v66 = sub_24A7B3658();
          }
          else {
            uint64_t v66 = *(void *)(v65 + 16);
          }
          swift_bridgeObjectRelease();
          if (v66)
          {
            sub_24A7912CC((uint64_t)&v128);
            sub_24A78E170();
            uint64_t v32 = swift_allocError();
            *(void *)uint64_t v69 = 1;
            *(unsigned char *)(v69 + 8) = 1;
            swift_willThrow();

            swift_release();
            goto LABEL_78;
          }

          uint64_t v28 = (uint64_t)v124;
        }
        uint64_t result = swift_release();
        uint64_t v12 = (uint64_t)v97;
        id v36 = v102;
        unint64_t v3 = v98;
        unint64_t v37 = v96;
        if (v102 == v97) {
          goto LABEL_72;
        }
      }
      uint64_t v12 = *v99;
      id v122 = (void *)v99[1];
      uint64_t v123 = v2 & 0xC000000000000001;
      uint64_t v6 = 4;
      uint64_t v120 = v12;
      uint64_t v121 = (char *)v3;
      while (1)
      {
        if (v123) {
          id v41 = (char *)MEMORY[0x24C5CFAE0](v6 - 4, v2);
        }
        else {
          id v41 = (char *)*(id *)(v2 + 8 * v6);
        }
        uint64_t v9 = v41;
        uint64_t v11 = (char *)(v6 - 3);
        if (__OFADD__(v6 - 4, 1))
        {
          __break(1u);
          goto LABEL_85;
        }
        unint64_t v3 = v2;
        id v42 = [v41 *(SEL *)(v15 + 2464)];
        id v43 = objc_msgSend(v42, sel_extensionIdentity);

        swift_beginAccess();
        __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA128);
        uint64_t v44 = sub_24A7B32D8();
        uint64_t v46 = v45;
        swift_endAccess();

        if (v12 == v44 && v122 == v46)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v48 = sub_24A7B3878();
          swift_bridgeObjectRelease();
          if ((v48 & 1) == 0) {
            goto LABEL_37;
          }
        }
        uint64_t v50 = *v118;
        uint64_t v49 = v118[1];
        id v51 = [v9 *(SEL *)(v15 + 2464)];
        id v52 = objc_msgSend(v51, sel_kind);

        uint64_t v53 = sub_24A7B3398();
        uint64_t v55 = v54;

        if (v50 == v53 && v49 == v55)
        {
          swift_bridgeObjectRelease();
          unint64_t v15 = 0x26528E000;
        }
        else
        {
          char v56 = sub_24A7B3878();
          swift_bridgeObjectRelease();
          unint64_t v15 = 0x26528E000uLL;
          if ((v56 & 1) == 0) {
            goto LABEL_37;
          }
        }
        id v57 = [v9 *(SEL *)(v15 + 2464)];
        id v58 = objc_msgSend(v57, sel_intentReference);

        if (!v58) {
          goto LABEL_69;
        }
        id v59 = objc_msgSend(v58, sel_intent);

        if (!v59) {
          goto LABEL_69;
        }
        uint64_t v60 = *(void *)&v124[v116];
        if (!v60)
        {

LABEL_69:
          swift_bridgeObjectRelease();
          sub_24A7912CC((uint64_t)&v128);
          sub_24A78E170();
          uint64_t v32 = swift_allocError();
          *(void *)uint64_t v68 = 0;
          *(unsigned char *)(v68 + 8) = 1;
          swift_willThrow();
          swift_release();

          unint64_t v2 = v109;
          uint64_t v6 = v108;
          uint64_t v11 = v112;
          uint64_t v16 = v103;
          goto LABEL_78;
        }
        unsigned __int8 v61 = objc_msgSend(self, sel_intent_isEqualToIntent_, v59, v60);

        if (v61) {
          goto LABEL_69;
        }
LABEL_37:

        ++v6;
        uint64_t v12 = v120;
        unint64_t v2 = v3;
        if (v11 == v121) {
          goto LABEL_58;
        }
      }
    }
  }
  else
  {
    uint64_t v12 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v12) {
      goto LABEL_26;
    }
  }
LABEL_72:
  sub_24A7912CC((uint64_t)&v128);
  uint64_t v70 = *(void *)(v28
                  + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_containerBundleIdentifier
                  + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v71 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  if (v70)
  {
    uint64_t v72 = (void *)sub_24A7B3378();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v72 = 0;
  }
  id v30 = objc_msgSend(objc_allocWithZone((Class)ATXWidgetLocationAuthorizationTracker), sel_initWithExtensionBundleIdentifier_containerBundleIdentifier_, v71, v72);

  if (objc_msgSend(v30, sel_widgetWantsLocation)
    && (objc_msgSend(v30, sel_isContainerAuthorizedForWidgetUpdates) & 1) == 0)
  {
    sub_24A78E170();
    uint64_t v32 = swift_allocError();
    uint64_t v33 = 5;
    goto LABEL_20;
  }

  uint64_t v32 = v115;
LABEL_78:
  if (!v32)
  {
    uint64_t v73 = v6;
    unint64_t v74 = v124;
    sub_24A787774((uint64_t)v124, (void *)v113[4]);
    uint64_t v115 = 0;
    uint64_t v75 = sub_24A796BD0();
    (*v105)(v11, v75, v2);
    swift_retain_n();
    id v76 = v74;
    uint64_t v77 = v11;
    uint64_t v78 = sub_24A7B32E8();
    os_log_type_t v79 = sub_24A7B3508();
    if (os_log_type_enabled(v78, v79))
    {
      uint64_t v80 = swift_slowAlloc();
      id v122 = (void *)swift_slowAlloc();
      uint64_t v123 = swift_slowAlloc();
      uint64_t v127 = v123;
      *(_DWORD *)uint64_t v80 = v94;
      id v81 = objc_msgSend(*(id *)(v16 + 16), sel_identifier);
      uint64_t v82 = sub_24A7B3398();
      unint64_t v84 = v83;

      uint64_t v128 = sub_24A78F4E0(v82, v84, &v127);
      sub_24A7B3608();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v80 + 12) = 2112;
      uint64_t v128 = (uint64_t)v76;
      id v85 = v76;
      unint64_t v15 = 0x26528E000;
      uint64_t v12 = v107;
      unint64_t v2 = v109;
      sub_24A7B3608();
      uint64_t v86 = v122;
      *id v122 = v124;

      _os_log_impl(&dword_24A77B000, v78, v79, "Stack <%s> successfully suggested new widget with: %@", (uint8_t *)v80, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1D0);
      swift_arrayDestroy();
      unint64_t v87 = v86;
      uint64_t v6 = v108;
      MEMORY[0x24C5D05E0](v87, -1, -1);
      uint64_t v88 = v123;
      swift_arrayDestroy();
      MEMORY[0x24C5D05E0](v88, -1, -1);
      MEMORY[0x24C5D05E0](v80, -1, -1);
      swift_release();

      uint64_t v11 = v112;
      (*v104)(v112, v2);
      uint64_t v9 = v114;
      uint64_t v13 = v106;
      unint64_t v3 = v117;
    }
    else
    {

      swift_release_n();
      (*v104)(v77, v2);
      uint64_t v9 = v114;
      uint64_t v11 = v77;
      uint64_t v13 = v106;
      unint64_t v3 = v117;
      uint64_t v6 = v73;
      uint64_t v12 = v107;
    }
    goto LABEL_5;
  }
  sub_24A7912CC((uint64_t)&v126);
  return swift_release();
}

unint64_t sub_24A78DF7C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA158);
  unint64_t v2 = (void *)sub_24A7B37D8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_24A78FB38(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void (*sub_24A78E098(void *a1, uint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_24A78FBB0(v6, a2, a3);
  return sub_24A78E118;
}

void sub_24A78E118(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();
  free(v1);
}

unint64_t sub_24A78E170()
{
  unint64_t result = qword_2697BA110;
  if (!qword_2697BA110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA110);
  }
  return result;
}

uint64_t sub_24A78E1C4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_24A7B3878();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  char v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_24A7B3878() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for WidgetStackSuggestionGenerator(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for WidgetStackSuggestionGenerator(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  uint64_t v2 = *(void **)(a1 + 40);
}

uint64_t initializeWithCopy for WidgetStackSuggestionGenerator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v6 = (_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v7 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v5;
    *(void *)(a1 + 24) = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *v6;
  }
  uint64_t v8 = *(void **)(a2 + 32);
  char v9 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  id v10 = v8;
  id v11 = v9;
  return a1;
}

uint64_t assignWithCopy for WidgetStackSuggestionGenerator(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  if (!*(void *)(a1 + 16))
  {
    if (v4)
    {
      *(void *)(a1 + 16) = v4;
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    goto LABEL_8;
  }
  if (!v4)
  {
    sub_24A78E4C4(a1 + 16);
    goto LABEL_7;
  }
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_8:
  uint64_t v5 = *(void **)(a2 + 32);
  uint64_t v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v5;
  id v7 = v5;

  uint64_t v8 = *(void **)(a2 + 40);
  char v9 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v8;
  id v10 = v8;

  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t sub_24A78E4C4(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for WidgetStackSuggestionGenerator(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  if (!*(void *)(a1 + 16)) {
    goto LABEL_5;
  }
  if (!v4)
  {
    sub_24A78E4C4(a1 + 16);
LABEL_5:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    goto LABEL_6;
  }
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
LABEL_6:
  uint64_t v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  uint64_t v6 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetStackSuggestionGenerator(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WidgetStackSuggestionGenerator(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetStackSuggestionGenerator()
{
  return &type metadata for WidgetStackSuggestionGenerator;
}

uint64_t destroy for WidgetStackSuggestionGenerator.Result()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s26ContextualSuggestionClient30WidgetStackSuggestionGeneratorV6ResultVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for WidgetStackSuggestionGenerator.Result(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for WidgetStackSuggestionGenerator.Result(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetStackSuggestionGenerator.Result(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WidgetStackSuggestionGenerator.Result(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetStackSuggestionGenerator.Result()
{
  return &type metadata for WidgetStackSuggestionGenerator.Result;
}

ValueMetadata *type metadata accessor for WidgetStackSuggestionGenerator.Location()
{
  return &type metadata for WidgetStackSuggestionGenerator.Location;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)__n128 result = v2;
  return result;
}

ValueMetadata *type metadata accessor for WidgetStackSuggestionGenerator.SmartRotateFailure()
{
  return &type metadata for WidgetStackSuggestionGenerator.SmartRotateFailure;
}

uint64_t getEnumTagSinglePayload for WidgetStackSuggestionGenerator.NewWidgetSuggestionFailure(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for WidgetStackSuggestionGenerator.NewWidgetSuggestionFailure(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_24A78E8BC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24A78E8D8(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetStackSuggestionGenerator.NewWidgetSuggestionFailure()
{
  return &type metadata for WidgetStackSuggestionGenerator.NewWidgetSuggestionFailure;
}

void type metadata accessor for ATXProactiveSuggestionClientModelType()
{
  if (!qword_2697BA118)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2697BA118);
    }
  }
}

unint64_t sub_24A78E960()
{
  unint64_t result = qword_2697BB380;
  if (!qword_2697BB380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BB380);
  }
  return result;
}

unint64_t sub_24A78E9B4()
{
  unint64_t result = qword_2697BA130;
  if (!qword_2697BA130)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2697BA130);
  }
  return result;
}

id sub_24A78E9F4(void *a1, void *a2)
{
  id v81 = a2;
  char v3 = (uint8_t *)sub_24A7B32F8();
  uint64_t v4 = (char *)*((void *)v3 - 1);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  id v7 = (char *)&v77 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  id v10 = (char *)&v77 - v9;
  MEMORY[0x270FA5388](v8);
  BOOL v12 = (char *)&v77 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA120);
  MEMORY[0x270FA5388](v13 - 8);
  unint64_t v15 = (char *)&v77 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA128);
  MEMORY[0x270FA5388](v16 - 8);
  if (a1)
  {
    id v17 = a1;
    unsigned __int8 v18 = objc_msgSend(v17, sel_isSuggestedWidget);
    uint64_t v19 = sub_24A796BD0();
    uint64_t v20 = (void (*)(char *, uint64_t, uint8_t *))*((void *)v4 + 2);
    if ((v18 & 1) == 0)
    {
      v20(v7, v19, v3);
      uint64_t v21 = v17;
      uint64_t v47 = sub_24A7B32E8();
      os_log_type_t v48 = sub_24A7B3508();
      if (os_log_type_enabled(v47, v48))
      {
        uint64_t v49 = (uint8_t *)swift_slowAlloc();
        uint64_t v50 = (void *)swift_slowAlloc();
        uint64_t v80 = v3;
        uint64_t v78 = v49;
        *(_DWORD *)uint64_t v49 = 138412290;
        unint64_t v82 = (unint64_t)v21;
        id v51 = v21;
        os_log_type_t v79 = v4;
        id v52 = v51;
        char v3 = v80;
        sub_24A7B3608();
        *uint64_t v50 = a1;

        uint64_t v53 = v78;
        uint64_t v4 = v79;
        _os_log_impl(&dword_24A77B000, v47, v48, "Debug widget already in stack, rotating: %@", v78, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1D0);
        swift_arrayDestroy();
        MEMORY[0x24C5D05E0](v50, -1, -1);
        MEMORY[0x24C5D05E0](v53, -1, -1);
      }
      else
      {

        uint64_t v47 = v21;
      }

      (*((void (**)(char *, uint8_t *))v4 + 1))(v7, v3);
      id v66 = objc_msgSend(v81, sel_identifier);
      sub_24A7B3398();

      uint64_t v67 = (void *)sub_24A7B3378();
      unsigned __int8 v61 = [v21 copyWithSource:v67];

      if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_24A7B37A8()) {
        sub_24A790EC8(MEMORY[0x263F8EE78]);
      }
      id v68 = objc_allocWithZone((Class)ATXWidgetStackSuggestion);
      goto LABEL_24;
    }
    v20(v10, v19, v3);
    uint64_t v21 = v17;
    uint64_t v22 = sub_24A7B32E8();
    os_log_type_t v23 = sub_24A7B3508();
    if (os_log_type_enabled(v22, v23))
    {
      long long v24 = (uint8_t *)swift_slowAlloc();
      BOOL v25 = (void *)swift_slowAlloc();
      os_log_type_t v79 = v4;
      uint64_t v80 = v24;
      *(_DWORD *)long long v24 = 138412290;
      uint64_t v78 = v24 + 4;
      unint64_t v82 = (unint64_t)v21;
      uint64_t v26 = v21;
      uint64_t v4 = v79;
      sub_24A7B3608();
      *BOOL v25 = a1;

      unint64_t v27 = v80;
      _os_log_impl(&dword_24A77B000, v22, v23, "Debug widget already suggested, retaining: %@", v80, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1D0);
      swift_arrayDestroy();
      MEMORY[0x24C5D05E0](v25, -1, -1);
      MEMORY[0x24C5D05E0](v27, -1, -1);
    }
    else
    {

      uint64_t v22 = v21;
    }

    (*((void (**)(char *, uint8_t *))v4 + 1))(v10, v3);
    id v59 = objc_msgSend(v81, sel_identifier);
    sub_24A7B3398();

    uint64_t v60 = (void *)sub_24A7B3378();
    unsigned __int8 v61 = [v21 copyWithSource:v60];

    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA140);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24A7B4FA0;
    *(void *)(inited + 32) = v21;
    unint64_t v82 = inited;
    sub_24A7B3438();
    unint64_t v63 = v82;
    if (v82 >> 62)
    {
      unint64_t v74 = v21;
      swift_bridgeObjectRetain();
      uint64_t v75 = sub_24A7B37A8();
      swift_bridgeObjectRelease();
      if (!v75) {
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v64 = *(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v65 = v21;
      if (!v64)
      {
LABEL_23:
        swift_bridgeObjectRelease();
        id v68 = objc_allocWithZone((Class)ATXWidgetStackSuggestion);
LABEL_24:
        uint64_t v72 = (void *)sub_24A7B3378();
        swift_bridgeObjectRelease();
        sub_24A78E9B4();
        sub_24A791220();
        id v39 = sub_24A7B34A8();
        swift_bridgeObjectRelease();
        id v73 = objc_msgSend(v68, sel_initWithStackIdentifier_topWidget_suggestedWidgets_, v72, v61, v39);
        goto LABEL_25;
      }
    }
    sub_24A790EC8(v63);
    goto LABEL_23;
  }
  sub_24A7B3588();
  swift_bridgeObjectRetain();
  sub_24A7B32C8();
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA138);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v15, 1, 1, v28);
  uint64_t v29 = (void *)sub_24A7B3578();
  swift_bridgeObjectRetain();
  uint64_t v30 = *(void *)sub_24A7A37F4();
  id v31 = objc_allocWithZone(MEMORY[0x263F31E70]);
  uint64_t v32 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  id v33 = objc_msgSend(v31, sel_initWithExtensionIdentity_kind_family_intent_activityIdentifier_, v29, v32, v30, 0, 0);

  id v34 = objc_allocWithZone((Class)ATXWidget);
  uint64_t v35 = (void *)sub_24A7B3378();
  id v36 = (void *)sub_24A7B3378();
  id v37 = objc_msgSend(v34, sel_initWithIdentifier_chsWidget_suggestedWidget_source_, v35, v33, 1, v36);

  uint64_t v38 = sub_24A796BD0();
  (*((void (**)(char *, uint64_t, uint8_t *))v4 + 2))(v12, v38, v3);
  id v39 = v37;
  unint64_t v40 = sub_24A7B32E8();
  os_log_type_t v41 = sub_24A7B3508();
  if (os_log_type_enabled(v40, v41))
  {
    id v42 = (uint8_t *)swift_slowAlloc();
    id v43 = (void *)swift_slowAlloc();
    uint64_t v80 = v3;
    *(_DWORD *)id v42 = 138412290;
    unint64_t v82 = (unint64_t)v39;
    uint64_t v44 = v39;
    os_log_type_t v79 = v12;
    char v45 = v4;
    uint64_t v46 = v44;
    char v3 = v80;
    sub_24A7B3608();
    *id v43 = v39;

    uint64_t v4 = v45;
    BOOL v12 = v79;
    _os_log_impl(&dword_24A77B000, v40, v41, "Creating new debug suggested widget: %@", v42, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1D0);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v43, -1, -1);
    MEMORY[0x24C5D05E0](v42, -1, -1);
  }
  else
  {

    unint64_t v40 = v39;
  }

  (*((void (**)(char *, uint8_t *))v4 + 1))(v12, v3);
  id v54 = objc_msgSend(v81, sel_identifier);
  sub_24A7B3398();

  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA140);
  uint64_t v55 = swift_initStackObject();
  *(_OWORD *)(v55 + 16) = xmmword_24A7B4FA0;
  *(void *)(v55 + 32) = v39;
  unint64_t v82 = v55;
  sub_24A7B3438();
  unint64_t v56 = v82;
  if (v82 >> 62)
  {
    uint64_t v69 = v39;
    swift_bridgeObjectRetain();
    uint64_t v70 = sub_24A7B37A8();
    swift_bridgeObjectRelease();
    if (!v70) {
      goto LABEL_21;
    }
    goto LABEL_12;
  }
  uint64_t v57 = *(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v58 = v39;
  if (v57) {
LABEL_12:
  }
    sub_24A790EC8(v56);
LABEL_21:
  swift_bridgeObjectRelease();
  id v71 = objc_allocWithZone((Class)ATXWidgetStackSuggestion);
  uint64_t v21 = sub_24A7B3378();
  swift_bridgeObjectRelease();
  sub_24A78E9B4();
  sub_24A791220();
  uint64_t v72 = (void *)sub_24A7B34A8();
  swift_bridgeObjectRelease();
  id v73 = objc_msgSend(v71, sel_initWithStackIdentifier_topWidget_suggestedWidgets_, v21, v39, v72);
  unsigned __int8 v61 = v39;
LABEL_25:

  return v73;
}

uint64_t sub_24A78F4E0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24A78F5B4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24A79175C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_24A79175C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24A78F5B4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_24A7B3618();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24A78F770(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_24A7B3718();
  if (!v8)
  {
    sub_24A7B3788();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24A7B37E8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_24A78F770(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24A78F808(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24A78F9E8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24A78F9E8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24A78F808(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_24A78F980(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24A7B36E8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24A7B3788();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24A7B33E8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24A7B37E8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24A7B3788();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24A78F980(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BA230);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24A78F9E8(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BA230);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24A7B37E8();
  __break(1u);
  return result;
}

unint64_t sub_24A78FB38(uint64_t a1, uint64_t a2)
{
  sub_24A7B38F8();
  sub_24A7B33C8();
  uint64_t v4 = sub_24A7B3918();
  return sub_24A790294(a1, a2, v4);
}

void (*sub_24A78FBB0(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  unint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_24A78FE68(v6);
  v6[10] = sub_24A78FCD0(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_24A78FC5C;
}

void sub_24A78FC5C(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  v2(v1, 0);
  free(v1);
}

void (*sub_24A78FCD0(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  size_t v5 = v4;
  uint64_t v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v4;
  v10[1] = a2;
  uint64_t v11 = *v4;
  unint64_t v13 = sub_24A78FB38(a2, a3);
  *((unsigned char *)v10 + 40) = v12 & 1;
  uint64_t v14 = *(void *)(v11 + 16);
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    char v17 = v12;
    uint64_t v18 = *(void *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if (v17)
      {
LABEL_8:
        uint64_t v19 = *(void *)(*(void *)(*v5 + 56) + 8 * v13);
LABEL_12:
        void *v10 = v19;
        return sub_24A78FE18;
      }
LABEL_11:
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_24A790378();
      goto LABEL_7;
    }
    sub_24A78FEA4(v16, a4 & 1);
    unint64_t v20 = sub_24A78FB38(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      unint64_t v13 = v20;
      v10[4] = v20;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (void (*)(uint64_t **))sub_24A7B3898();
  __break(1u);
  return result;
}

void sub_24A78FE18(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_24A7901BC(*a1, *((unsigned char *)*a1 + 40), (uint64_t *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t (*sub_24A78FE68(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return sub_24A78FE98;
}

uint64_t sub_24A78FE98(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_24A78FEA4(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA158);
  char v36 = a2;
  uint64_t v6 = sub_24A7B37C8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_24A7B38F8();
    sub_24A7B33C8();
    uint64_t result = sub_24A7B3918();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t *sub_24A7901BC(uint64_t *result, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = *result;
  if (*result)
  {
    uint64_t v9 = (void *)*a3;
    if (a2)
    {
      *(void *)(v9[7] + 8 * a4) = v8;
    }
    else
    {
      v9[(a4 >> 6) + 8] |= 1 << a4;
      unint64_t v10 = (void *)(v9[6] + 16 * a4);
      void *v10 = a5;
      v10[1] = a6;
      *(void *)(v9[7] + 8 * a4) = v8;
      uint64_t v11 = v9[2];
      BOOL v12 = __OFADD__(v11, 1);
      uint64_t v13 = v11 + 1;
      if (v12)
      {
        __break(1u);
        return result;
      }
      v9[2] = v13;
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    sub_24A790530(a4, *a3);
  }
  return (uint64_t *)swift_bridgeObjectRetain();
}

unint64_t sub_24A790294(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24A7B3878() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24A7B3878() & 1) == 0);
    }
  }
  return v6;
}

void *sub_24A790378()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA158);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24A7B37B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_24A790530(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24A7B3648();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24A7B38F8();
        swift_bridgeObjectRetain();
        sub_24A7B33C8();
        uint64_t v9 = sub_24A7B3918();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          unint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *unint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_24A790708(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  unint64_t v4 = a1;
  if (a1 >> 62)
  {
LABEL_28:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24A7B37A8();
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
    {
LABEL_3:
      uint64_t v34 = v3;
      unint64_t v40 = v4 & 0xC000000000000001;
      id v39 = (uint64_t *)(a2 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind);
      uint64_t v35 = OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent;
      uint64_t v6 = 4;
      uint64_t v7 = *(void *)(a2
                     + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier);
      uint64_t v8 = *(void *)(a2
                     + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier
                     + 8);
      uint64_t v37 = v8;
      uint64_t v38 = v7;
      do
      {
        uint64_t v3 = v6 - 4;
        if (v40) {
          id v9 = (id)MEMORY[0x24C5CFAE0](v6 - 4, v4);
        }
        else {
          id v9 = *(id *)(v4 + 8 * v6);
        }
        unint64_t v10 = v9;
        if (__OFADD__(v3, 1))
        {
          __break(1u);
          goto LABEL_28;
        }
        uint64_t v41 = v6 - 3;
        id v11 = objc_msgSend(v9, sel_chsWidget);
        id v12 = objc_msgSend(v11, sel_extensionIdentity);

        swift_beginAccess();
        __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA128);
        uint64_t v13 = sub_24A7B32D8();
        uint64_t v15 = v14;
        swift_endAccess();

        if (v7 == v13 && v8 == v15)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v17 = sub_24A7B3878();
          swift_bridgeObjectRelease();
          if ((v17 & 1) == 0) {
            goto LABEL_4;
          }
        }
        uint64_t v18 = v5;
        unint64_t v19 = v4;
        uint64_t v20 = *v39;
        uint64_t v21 = v39[1];
        id v22 = objc_msgSend(v10, sel_chsWidget, v34);
        id v23 = objc_msgSend(v22, sel_kind);

        uint64_t v24 = sub_24A7B3398();
        uint64_t v26 = v25;

        if (v20 == v24 && v21 == v26)
        {
          swift_bridgeObjectRelease();
          unint64_t v4 = v19;
          uint64_t v5 = v18;
          uint64_t v8 = v37;
          uint64_t v7 = v38;
        }
        else
        {
          char v27 = sub_24A7B3878();
          swift_bridgeObjectRelease();
          unint64_t v4 = v19;
          uint64_t v5 = v18;
          uint64_t v8 = v37;
          uint64_t v7 = v38;
          if ((v27 & 1) == 0) {
            goto LABEL_4;
          }
        }
        id v28 = objc_msgSend(v10, sel_chsWidget);
        id v29 = objc_msgSend(v28, sel_intentReference);

        if (!v29 || (id v30 = objc_msgSend(v29, sel_intent), v29, !v30))
        {
LABEL_24:
          swift_bridgeObjectRelease();
          return v10;
        }
        uint64_t v31 = *(void *)(a2 + v35);
        if (!v31)
        {
          swift_bridgeObjectRelease();

          return v10;
        }
        unsigned __int8 v32 = objc_msgSend(self, sel_intent_isEqualToIntent_, v30, v31);

        if (v32) {
          goto LABEL_24;
        }
LABEL_4:

        ++v6;
      }
      while (v41 != v5);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_24A790A94(unint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = a1;
  if (a1 >> 62)
  {
LABEL_23:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24A7B37A8();
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
    {
LABEL_3:
      uint64_t v23 = v3;
      unint64_t v26 = v4 & 0xC000000000000001;
      uint64_t v6 = *a2;
      uint64_t v7 = a2[1];
      uint64_t v8 = 4;
      uint64_t v25 = v4;
      do
      {
        if (v26) {
          id v9 = (id)MEMORY[0x24C5CFAE0](v8 - 4, v4);
        }
        else {
          id v9 = *(id *)(v4 + 8 * v8);
        }
        unint64_t v10 = v9;
        uint64_t v4 = v8 - 3;
        if (__OFADD__(v8 - 4, 1))
        {
          __break(1u);
          goto LABEL_23;
        }
        id v11 = objc_msgSend(v9, sel_chsWidget);
        id v12 = objc_msgSend(v11, sel_extensionIdentity);

        swift_beginAccess();
        __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA128);
        uint64_t v13 = sub_24A7B32D8();
        uint64_t v15 = v14;
        swift_endAccess();

        BOOL v16 = v13 == v6 && v15 == v7;
        if (v16)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v3 = sub_24A7B3878();
          swift_bridgeObjectRelease();
          if ((v3 & 1) == 0) {
            goto LABEL_5;
          }
        }
        id v17 = objc_msgSend(v10, sel_chsWidget, v23);
        id v18 = objc_msgSend(v17, sel_kind);

        uint64_t v19 = sub_24A7B3398();
        uint64_t v21 = v20;

        if (v19 == a2[2] && v21 == a2[3])
        {
          swift_bridgeObjectRelease();
LABEL_21:
          swift_bridgeObjectRelease();
          return v10;
        }
        uint64_t v3 = sub_24A7B3878();
        swift_bridgeObjectRelease();
        if (v3) {
          goto LABEL_21;
        }
LABEL_5:

        ++v8;
        BOOL v16 = v4 == v5;
        uint64_t v4 = v25;
      }
      while (!v16);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_24A790D18(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  unint64_t v5 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_24A7B37A8();
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6)
    {
LABEL_3:
      uint64_t v21 = v3;
      unint64_t v22 = v5;
      unint64_t v23 = v5 & 0xC000000000000001;
      uint64_t v7 = *(void *)(a2 + 32);
      uint64_t v8 = *(void *)(a2 + 40);
      uint64_t v3 = 4;
      do
      {
        uint64_t v9 = v3 - 4;
        if (v23)
        {
          uint64_t v10 = MEMORY[0x24C5CFAE0](v3 - 4, v5);
          a2 = v3 - 3;
          if (__OFADD__(v9, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          uint64_t v10 = swift_retain();
          a2 = v3 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v11 = v6;
        uint64_t v12 = v10;
        uint64_t v13 = v8;
        id v14 = objc_msgSend(*(id *)(v10 + 16), sel_identifier, v21);
        uint64_t v15 = sub_24A7B3398();
        uint64_t v17 = v16;

        uint64_t v8 = v13;
        BOOL v18 = v15 == v7 && v17 == v13;
        if (v18)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v12;
        }
        char v19 = sub_24A7B3878();
        swift_bridgeObjectRelease();
        if (v19) {
          goto LABEL_18;
        }
        swift_release();
        ++v3;
        uint64_t v6 = v11;
        BOOL v18 = a2 == v11;
        unint64_t v5 = v22;
      }
      while (!v18);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

void sub_24A790EC8(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_24A7B37A8();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA150);
      uint64_t v3 = sub_24A7B36C8();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_24A7B37A8();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v42 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v40 = v1;
    while (1)
    {
      uint64_t v9 = MEMORY[0x24C5CFAE0](v8, v1);
      BOOL v10 = __OFADD__(v8++, 1);
      if (v10)
      {
        __break(1u);
        goto LABEL_37;
      }
      uint64_t v11 = v9;
      uint64_t v12 = sub_24A7B35D8();
      uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v14 = v12 & ~v13;
      unint64_t v15 = v14 >> 6;
      uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
      uint64_t v17 = 1 << v14;
      if (((1 << v14) & v16) != 0)
      {
        sub_24A78E9B4();
        id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
        char v19 = sub_24A7B35E8();

        if (v19)
        {
LABEL_11:
          swift_unknownObjectRelease();
          unint64_t v1 = v40;
          goto LABEL_12;
        }
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = sub_24A7B35E8();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v40;
      }
      *(void *)(v7 + 8 * v15) = v17 | v16;
      *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
      uint64_t v23 = *(void *)(v3 + 16);
      BOOL v10 = __OFADD__(v23, 1);
      uint64_t v24 = v23 + 1;
      if (v10) {
        goto LABEL_38;
      }
      *(void *)(v3 + 16) = v24;
LABEL_12:
      if (v8 == v42) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  uint64_t v41 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v41)
  {
    id v26 = *(id *)(v1 + 32 + 8 * v25);
    uint64_t v27 = sub_24A7B35D8();
    uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v29 = v27 & ~v28;
    unint64_t v30 = v29 >> 6;
    uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
    uint64_t v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      sub_24A78E9B4();
      id v33 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
      char v34 = sub_24A7B35E8();

      if (v34) {
        goto LABEL_24;
      }
      uint64_t v35 = ~v28;
      unint64_t v29 = (v29 + 1) & v35;
      unint64_t v30 = v29 >> 6;
      uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
      uint64_t v32 = 1 << v29;
      if ((v31 & (1 << v29)) != 0)
      {
        while (1)
        {
          id v36 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
          char v37 = sub_24A7B35E8();

          if (v37) {
            break;
          }
          unint64_t v29 = (v29 + 1) & v35;
          unint64_t v30 = v29 >> 6;
          uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
          uint64_t v32 = 1 << v29;
          if ((v31 & (1 << v29)) == 0) {
            goto LABEL_32;
          }
        }
LABEL_24:

        uint64_t v5 = v42;
        goto LABEL_25;
      }
LABEL_32:
      uint64_t v5 = v42;
    }
    *(void *)(v7 + 8 * v30) = v32 | v31;
    *(void *)(*(void *)(v3 + 48) + 8 * v29) = v26;
    uint64_t v38 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v10) {
      goto LABEL_39;
    }
    *(void *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v5) {
      return;
    }
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

unint64_t sub_24A791220()
{
  unint64_t result = qword_2697BA148;
  if (!qword_2697BA148)
  {
    sub_24A78E9B4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA148);
  }
  return result;
}

unint64_t sub_24A791278()
{
  unint64_t result = qword_2697BB388[0];
  if (!qword_2697BB388[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697BB388);
  }
  return result;
}

uint64_t sub_24A7912CC(uint64_t a1)
{
  return a1;
}

uint64_t sub_24A7912F8(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_24A7B37A8();
  swift_bridgeObjectRelease();
  if (v21 < v2) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24A7B37A8();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_24A7B37A8();
    swift_bridgeObjectRelease();
    unint64_t v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62) {
    goto LABEL_36;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v3 = v9;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v7 = 1;
  }
  if (v9 >> 62) {
    goto LABEL_39;
  }
  uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8) {
    uint64_t v12 = v8;
  }
  swift_bridgeObjectRetain();
  *uint64_t v3 = MEMORY[0x24C5CFAF0](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  uint64_t v13 = v11 + 32;
  unint64_t v14 = (char *)(v11 + 32 + 8 * v4);
  type metadata accessor for ContextualActionSuggestion();
  swift_arrayDestroy();
  if (v5)
  {
    if (*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_24A7B37A8();
      swift_bridgeObjectRelease();
      uint64_t v16 = v22 - v2;
      if (!__OFSUB__(v22, v2))
      {
LABEL_21:
        if (v16 < 0)
        {
LABEL_46:
          uint64_t result = sub_24A7B37E8();
          __break(1u);
          return result;
        }
        uint64_t v17 = (char *)(v13 + 8 * v2);
        if (v4 != v2 || v14 >= &v17[8 * v16]) {
          memmove(v14, v17, 8 * v16);
        }
        if (!(*v3 >> 62))
        {
          uint64_t v18 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v19 = v18 + v5;
          if (!__OFADD__(v18, v5))
          {
LABEL_27:
            *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_24A7B37A8();
        swift_bridgeObjectRelease();
        uint64_t v19 = v23 + v5;
        if (!__OFADD__(v23, v5)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v15 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v16 = v15 - v2;
      if (!__OFSUB__(v15, v2)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:
  return sub_24A7B3438();
}

id sub_24A791604(id result)
{
  if ((unint64_t)result >= 6) {
    return result;
  }
  return result;
}

void sub_24A791614(id a1)
{
  if ((unint64_t)a1 >= 6) {
}
  }

uint64_t sub_24A791624(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24A791674(uint64_t a1)
{
  return a1;
}

uint64_t sub_24A7916C0(uint64_t a1)
{
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24A79175C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_24A7917BC()
{
  unint64_t result = qword_2697BA160;
  if (!qword_2697BA160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA160);
  }
  return result;
}

uint64_t sub_24A791810(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

unsigned char *_s26ContextualSuggestionClient30WidgetStackSuggestionGeneratorV8LocationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24A791934);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetStackSuggestionGenerator.StackState.SmartRotateFailure()
{
  return &type metadata for WidgetStackSuggestionGenerator.StackState.SmartRotateFailure;
}

void *initializeBufferWithCopyOfBuffer for WidgetStackSuggestionGenerator.StackState.NewWidgetSuggestionFailure(void *a1, void **a2)
{
  int v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void destroy for WidgetStackSuggestionGenerator.StackState.NewWidgetSuggestionFailure(void **a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **assignWithCopy for WidgetStackSuggestionGenerator.StackState.NewWidgetSuggestionFailure(void **a1, void **a2)
{
  int v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
    {
      *a1 = v4;
      id v6 = v4;
      return a1;
    }
LABEL_7:
    *a1 = v4;
    return a1;
  }
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    id v4 = *a2;
    goto LABEL_7;
  }
  *a1 = v4;
  id v5 = v4;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **assignWithTake for WidgetStackSuggestionGenerator.StackState.NewWidgetSuggestionFailure(void **a1, unint64_t *a2)
{
  int v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF) {
    goto LABEL_6;
  }
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetStackSuggestionGenerator.StackState.NewWidgetSuggestionFailure(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFF9 && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483642);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 5;
  if (v4 >= 7) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for WidgetStackSuggestionGenerator.StackState.NewWidgetSuggestionFailure(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFA)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 2147483642;
    if (a3 >= 0x7FFFFFFA) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFA) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 5;
    }
  }
  return result;
}

uint64_t sub_24A791B5C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_24A791B74(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for WidgetStackSuggestionGenerator.StackState.NewWidgetSuggestionFailure()
{
  return &type metadata for WidgetStackSuggestionGenerator.StackState.NewWidgetSuggestionFailure;
}

unint64_t sub_24A791BB0()
{
  unint64_t result = qword_2697BB490[0];
  if (!qword_2697BB490[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697BB490);
  }
  return result;
}

void *sub_24A791C28()
{
  return &unk_26528E670;
}

unint64_t contextualEngineStartupNotification.getter()
{
  return 0xD00000000000002CLL;
}

uint64_t sub_24A791C50()
{
  type metadata accessor for ContextualSuggestionService();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_24A794F80();
  qword_2697BD3B0 = v0;
  return result;
}

uint64_t sub_24A791C8C()
{
  uint64_t v0 = swift_allocObject();
  sub_24A794F80();
  return v0;
}

uint64_t *sub_24A791CC4()
{
  if (qword_2697BB6A0 != -1) {
    swift_once();
  }
  return &qword_2697BD3B0;
}

uint64_t sub_24A791D10()
{
  if (qword_2697BB6A0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_24A791D88(uint64_t a1)
{
  if (qword_2697BB6A0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_2697BD3B0 = a1;
  return swift_release();
}

uint64_t (*sub_24A791E08())()
{
  if (qword_2697BB6A0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24A791E90()
{
  uint64_t v0 = sub_24A7B3528();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24A7B3518();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_24A7B3348();
  MEMORY[0x270FA5388](v5 - 8);
  sub_24A7951DC();
  sub_24A7B3338();
  v7[1] = MEMORY[0x263F8EE78];
  sub_24A795374(&qword_2697BA178, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA180);
  sub_24A7953BC(&qword_2697BA188, &qword_2697BA180);
  sub_24A7B3638();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v0);
  return sub_24A7B3558();
}

void *sub_24A7920C8()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  return v1;
}

void sub_24A79210C(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = a1;
}

uint64_t (*sub_24A792154())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24A7921A8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A7921E0(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 32) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24A792228())()
{
  return j_j__swift_endAccess;
}

unint64_t sub_24A79227C()
{
  return sub_24A792288(MEMORY[0x263F8EE78]);
}

unint64_t sub_24A792288(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA228);
  id v2 = (void *)sub_24A7B37D8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_24A78FB38(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_24A7923A4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A7923DC(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 40) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24A792424())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24A792478()
{
  swift_beginAccess();
  return *(unsigned int *)(v0 + 48);
}

uint64_t sub_24A7924AC(int a1)
{
  uint64_t result = swift_beginAccess();
  *(_DWORD *)(v1 + 48) = a1;
  return result;
}

uint64_t (*sub_24A7924EC())()
{
  return j__swift_endAccess;
}

uint64_t sub_24A792544()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA190);
  sub_24A7B3538();
  return v1;
}

uint64_t sub_24A7925B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v4;
  uint64_t v9 = sub_24A7B3318();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_24A7B3348();
  uint64_t v13 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = v4[2];
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v4;
  v16[3] = a2;
  v16[4] = a3;
  v16[5] = a1;
  v16[6] = v8;
  aBlock[4] = sub_24A795344;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A792CE8;
  aBlock[3] = &block_descriptor_0;
  uint64_t v17 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  sub_24A7B3338();
  uint64_t v21 = MEMORY[0x263F8EE78];
  sub_24A795374(&qword_2697BA198, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1A0);
  sub_24A7953BC(&qword_2697BA1A8, &qword_2697BA1A0);
  sub_24A7B3638();
  MEMORY[0x24C5CF930](0, v15, v12, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v20);
  return swift_release();
}

uint64_t sub_24A7928B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v36 = a5;
  uint64_t v37 = sub_24A7B32F8();
  uint64_t v9 = *(void *)(v37 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v37);
  uint64_t v38 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 168);
  uint64_t v13 = *(void *)(v12(v10) + 16);
  swift_bridgeObjectRelease();
  uint64_t v14 = swift_bridgeObjectRetain();
  uint64_t v15 = v12(v14);
  if (!*(void *)(v15 + 16) || (unint64_t v16 = sub_24A78FB38(a2, a3), (v17 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v28 = objc_msgSend(self, sel_weakObjectsHashTable, v36);
    objc_msgSend(v28, sel_addObject_, a4);
    unint64_t v29 = *(uint64_t (**)(uint64_t *))(*(void *)a1 + 184);
    swift_bridgeObjectRetain();
    id v30 = v28;
    uint64_t v31 = (void (*)(uint64_t *, void))v29(v40);
    id v33 = v32;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v39 = *v33;
    uint64_t *v33 = 0x8000000000000000;
    sub_24A7959BC((uint64_t)v30, a2, a3, isUniquelyReferenced_nonNull_native);
    uint64_t *v33 = v39;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v31(v40, 0);

    if (!v13) {
      goto LABEL_4;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 296))(a4, a2, a3);
  }
  id v18 = *(id *)(*(void *)(v15 + 56) + 8 * v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_addObject_, a4, v36);

  if (v13) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 296))(a4, a2, a3);
  }
LABEL_4:
  uint64_t v19 = sub_24A7AA57C();
  uint64_t v20 = v37;
  uint64_t v21 = v38;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v38, v19, v37);
  uint64_t v22 = sub_24A7B32E8();
  os_log_type_t v23 = sub_24A7B3508();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    v40[0] = v25;
    *(_DWORD *)uint64_t v24 = 136315394;
    uint64_t v26 = sub_24A7B3998();
    uint64_t v39 = sub_24A78F4E0(v26, v27, v40);
    sub_24A7B3608();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    uint64_t v39 = sub_24A78F4E0(0xD000000000000017, 0x800000024A7B7720, v40);
    sub_24A7B3608();
    _os_log_impl(&dword_24A77B000, v22, v23, "%s: %s: first observer, start listening for server startup", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v25, -1, -1);
    MEMORY[0x24C5D05E0](v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v38, v20);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v21, v20);
  }
  sub_24A793A68();
  return sub_24A79347C();
}

uint64_t sub_24A792CEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v19[0] = a2;
  uint64_t v6 = *v4;
  uint64_t v7 = sub_24A7B3318();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_24A7B3348();
  uint64_t v11 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = v4[2];
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = v19[0];
  v15[2] = v4;
  v15[3] = v16;
  v15[4] = a3;
  v15[5] = v14;
  v15[6] = v6;
  aBlock[4] = sub_24A7954B4;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A792CE8;
  aBlock[3] = &block_descriptor_9;
  char v17 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24A7B3338();
  uint64_t v21 = MEMORY[0x263F8EE78];
  sub_24A795374(&qword_2697BA198, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1A0);
  sub_24A7953BC(&qword_2697BA1A8, &qword_2697BA1A0);
  sub_24A7B3638();
  MEMORY[0x24C5CF930](0, v13, v10, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v20);
  swift_release();
  return swift_release();
}

uint64_t sub_24A793014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v37[1] = a5;
  uint64_t v9 = sub_24A7B32F8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 168);
  uint64_t v14 = swift_bridgeObjectRetain();
  uint64_t v15 = v13(v14);
  if (*(void *)(v15 + 16) && (unint64_t v16 = sub_24A78FB38(a2, a3), (v17 & 1) != 0))
  {
    v37[0] = v10;
    uint64_t v18 = a4 + 16;
    id v19 = *(id *)(*(void *)(v15 + 56) + 8 * v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    uint64_t v20 = MEMORY[0x24C5D0680](v18);
    if (v20)
    {
      objc_msgSend(v19, sel_removeObject_, v20);
      swift_unknownObjectRelease();
    }
    id v21 = objc_msgSend(v19, sel_allObjects);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BA1B8);
    unint64_t v22 = sub_24A7B3418();

    if (v22 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_24A7B37A8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v23 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (!v23)
    {
      uint64_t v24 = (void (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *))(*(void *)a1 + 184))(v38);

      v24(v38, 0);
    }

    uint64_t v10 = v37[0];
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v25 = swift_bridgeObjectRelease();
  }
  uint64_t v26 = *(void *)(v13(v25) + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v26)
  {
    uint64_t v28 = sub_24A7AA57C();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v28, v9);
    unint64_t v29 = sub_24A7B32E8();
    os_log_type_t v30 = sub_24A7B3508();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      v38[0] = v32;
      *(_DWORD *)uint64_t v31 = 136315394;
      v37[0] = v10;
      uint64_t v33 = sub_24A7B3998();
      uint64_t v39 = sub_24A78F4E0(v33, v34, v38);
      sub_24A7B3608();
      swift_bridgeObjectRelease();
      *(_WORD *)(v31 + 12) = 2080;
      uint64_t v39 = sub_24A78F4E0(0xD000000000000019, 0x800000024A7B7700, v38);
      sub_24A7B3608();
      _os_log_impl(&dword_24A77B000, v29, v30, "%s: %s: no more observers, stop listening for server startup", (uint8_t *)v31, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C5D05E0](v32, -1, -1);
      MEMORY[0x24C5D05E0](v31, -1, -1);

      uint64_t v35 = (*(uint64_t (**)(char *, uint64_t))(v37[0] + 8))(v12, v9);
    }
    else
    {

      uint64_t v35 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    }
    int v36 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 192))(v35);
    return notify_cancel(v36);
  }
  return result;
}

uint64_t sub_24A79347C()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = swift_allocObject();
  swift_weakInit();
  v7[4] = sub_24A796860;
  v7[5] = v2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  void v7[2] = sub_24A79372C;
  v7[3] = &block_descriptor_38;
  uint64_t v3 = _Block_copy(v7);
  swift_release();
  uint64_t v4 = (uint64_t (*)(void *, void))(*(uint64_t (**)(void *))(*v0 + 208))(v7);
  notify_register_dispatch("com.apple.proactive.ContextualEngine.startup", v5, v1, v3);
  _Block_release(v3);
  return v4(v7, 0);
}

uint64_t sub_24A793598()
{
  uint64_t v0 = sub_24A7B32F8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24A7AA57C();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_24A7B32E8();
  os_log_type_t v6 = sub_24A7B3508();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_24A77B000, v5, v6, "ContextualSuggestionService: received server startup notification, fetching latest snapshots", v7, 2u);
    MEMORY[0x24C5D05E0](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24A793A68();
    return swift_release();
  }
  return result;
}

uint64_t sub_24A79372C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_24A793780()
{
  uint64_t v1 = (void *)(*(uint64_t (**)(void))(*(void *)v0 + 120))();

  if (!v1)
  {
    sub_24A7B2BEC();
    id v2 = objc_allocWithZone(MEMORY[0x263F08D68]);
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_24A7B3378();
    swift_bridgeObjectRelease();
    id v4 = objc_msgSend(v2, sel_initWithMachServiceName_options_, v3, 0);

    uint64_t v5 = (void *)contextualSuggestionServerInterface.getter();
    objc_msgSend(v4, sel_setRemoteObjectInterface_, v5);

    objc_msgSend(v4, sel_setExportedObject_, v0);
    os_log_type_t v6 = (void *)contextualSuggestionServiceInterface.getter();
    objc_msgSend(v4, sel_setExportedInterface_, v6);

    uint64_t v7 = swift_allocObject();
    swift_weakInit();
    char v17 = sub_24A7967A8;
    uint64_t v18 = v7;
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 1107296256;
    uint64_t v15 = sub_24A792CE8;
    unint64_t v16 = &block_descriptor_30;
    uint64_t v8 = _Block_copy(&v13);
    swift_release();
    objc_msgSend(v4, sel_setInterruptionHandler_, v8);
    _Block_release(v8);
    uint64_t v9 = swift_allocObject();
    swift_weakInit();
    char v17 = sub_24A7967A8;
    uint64_t v18 = v9;
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 1107296256;
    uint64_t v15 = sub_24A792CE8;
    unint64_t v16 = &block_descriptor_34;
    uint64_t v10 = _Block_copy(&v13);
    swift_release();
    objc_msgSend(v4, sel_setInvalidationHandler_, v10);
    _Block_release(v10);
    objc_msgSend(v4, sel_resume);
    uint64_t v11 = *(void (**)(id))(*(void *)v0 + 128);
    id v12 = v4;
    v11(v4);
  }
}

uint64_t sub_24A793A24(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_24A793A68()
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)v0 + 168);
  uint64_t v2 = *(void *)(v1() + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (v2)
  {
    sub_24A793780();
    uint64_t v4 = v1();
    sub_24A793CBC(v4);
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)v0 + 120))();
    if (!v5) {
      return swift_bridgeObjectRelease();
    }
    os_log_type_t v6 = (void *)v5;
    unint64_t v16 = sub_24A793E54;
    uint64_t v17 = 0;
    id v12 = (void *)MEMORY[0x263EF8330];
    uint64_t v13 = 1107296256;
    uint64_t v14 = sub_24A782DE0;
    uint64_t v15 = &block_descriptor_21;
    uint64_t v7 = _Block_copy(&v12);
    id v8 = objc_msgSend(v6, sel_synchronousRemoteObjectProxyWithErrorHandler_, v7);
    _Block_release(v7);

    sub_24A7B3628();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1C8);
    if (swift_dynamicCast())
    {
      uint64_t v9 = v12;
      uint64_t v10 = (void *)sub_24A7B34A8();
      swift_bridgeObjectRelease();
      unint64_t v16 = sub_24A7955D4;
      uint64_t v17 = v0;
      id v12 = (void *)MEMORY[0x263EF8330];
      uint64_t v13 = 1107296256;
      uint64_t v14 = sub_24A794270;
      uint64_t v15 = &block_descriptor_24;
      uint64_t v11 = _Block_copy(&v12);
      swift_retain();
      swift_release();
      objc_msgSend(v9, sel_requestSnapshotsForEndpoints_completion_, v10, v11);
      _Block_release(v11);

      return swift_unknownObjectRelease();
    }
    else
    {
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_24A793CBC(uint64_t a1)
{
  uint64_t result = sub_24A7B34E8();
  int64_t v3 = 0;
  uint64_t v18 = result;
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      int64_t v3 = v14 + 1;
      if (v14 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v4 + 8 * v3);
      if (!v15)
      {
        int64_t v3 = v14 + 2;
        if (v14 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v4 + 8 * v3);
        if (!v15)
        {
          int64_t v3 = v14 + 3;
          if (v14 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v4 + 8 * v3);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    uint64_t v11 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_24A795CE0(&v17, v12, v13);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v3);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_24A793E54()
{
  uint64_t v0 = sub_24A7B32F8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  int64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24A7AA57C();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_24A7B32E8();
  os_log_type_t v6 = sub_24A7B34F8();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v7 = 0;
    _os_log_impl(&dword_24A77B000, v5, v6, "ContextualSuggestionService: error grabbing remote object proxy while fetching latest snapshots from server", v7, 2u);
    MEMORY[0x24C5D05E0](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_24A793FA4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_24A7B32F8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v11 = a2;
    uint64_t v12 = sub_24A7AA57C();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v12, v6);
    id v13 = a2;
    id v14 = a2;
    unint64_t v15 = sub_24A7B32E8();
    os_log_type_t v16 = sub_24A7B34F8();
    if (os_log_type_enabled(v15, v16))
    {
      os_log_t v28 = v15;
      uint64_t v17 = swift_slowAlloc();
      uint64_t v29 = a1;
      uint64_t v18 = (uint8_t *)v17;
      unint64_t v27 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 138412290;
      id v19 = a2;
      uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v30 = v20;
      sub_24A7B3608();
      id v21 = v27;
      *unint64_t v27 = v20;

      os_log_t v22 = v28;
      _os_log_impl(&dword_24A77B000, v28, v16, "ContextualSuggestionService: error requesting snapshots: %@", v18, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1D0);
      swift_arrayDestroy();
      MEMORY[0x24C5D05E0](v21, -1, -1);
      uint64_t v23 = v18;
      a1 = v29;
      MEMORY[0x24C5D05E0](v23, -1, -1);
    }
    else
    {
    }
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  if (a1)
  {
    uint64_t v24 = *(uint64_t (**)(uint64_t))(*(void *)a3 + 152);
    uint64_t v25 = swift_bridgeObjectRetain();
    uint64_t v26 = v24(v25);
    return (*(uint64_t (**)(uint64_t))(*(void *)a3 + 288))(v26);
  }
  return result;
}

uint64_t sub_24A794270(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    type metadata accessor for ContextualSuggestionSnapshot();
    uint64_t v4 = sub_24A7B3368();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24A794314(uint64_t a1)
{
  v2[9] = a1;
  v2[10] = v1;
  uint64_t v3 = sub_24A7B3318();
  v2[11] = v3;
  v2[12] = *(void *)(v3 - 8);
  v2[13] = swift_task_alloc();
  uint64_t v4 = sub_24A7B3348();
  v2[14] = v4;
  v2[15] = *(void *)(v4 - 8);
  v2[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A794430, 0, 0);
}

uint64_t sub_24A794430()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[13];
  uint64_t v11 = v0[15];
  uint64_t v12 = v0[14];
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[12];
  uint64_t v6 = v0[9];
  uint64_t v5 = v0[10];
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  *(void *)(v7 + 24) = v6;
  v0[6] = sub_24A795524;
  v0[7] = v7;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_24A792CE8;
  v0[5] = &block_descriptor_15;
  int64_t v8 = _Block_copy(v0 + 2);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_24A7B3338();
  v0[8] = MEMORY[0x263F8EE78];
  sub_24A795374(&qword_2697BA198, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1A0);
  sub_24A7953BC(&qword_2697BA1A8, &qword_2697BA1A0);
  sub_24A7B3638();
  MEMORY[0x24C5CF930](0, v1, v2, v8);
  _Block_release(v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v12);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_24A7947D0(int a1, void *aBlock, uint64_t a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  type metadata accessor for ContextualSuggestionSnapshot();
  uint64_t v4 = sub_24A7B3368();
  v3[4] = v4;
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  v3[5] = v5;
  void *v5 = v3;
  v5[1] = sub_24A7948B8;
  return sub_24A794314(v4);
}

uint64_t sub_24A7948B8()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v3 + 24);
  if (v2)
  {
    uint64_t v7 = (void *)sub_24A7B31E8();

    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  int64_t v8 = *(uint64_t (**)(void))(v5 + 8);
  return v8();
}

void sub_24A794A5C()
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 144))();
  if (!v1) {
    return;
  }
  if (*(void *)(v1 + 16))
  {
    int64_t v2 = 0;
    uint64_t v27 = v1 + 64;
    uint64_t v3 = 1 << *(unsigned char *)(v1 + 32);
    uint64_t v4 = -1;
    if (v3 < 64) {
      uint64_t v4 = ~(-1 << v3);
    }
    unint64_t v5 = v4 & *(void *)(v1 + 64);
    int64_t v28 = (unint64_t)(v3 + 63) >> 6;
    while (1)
    {
      if (v5)
      {
        unint64_t v6 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        unint64_t v7 = v6 | (v2 << 6);
      }
      else
      {
        int64_t v8 = v2 + 1;
        if (__OFADD__(v2, 1))
        {
          __break(1u);
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
          return;
        }
        if (v8 >= v28) {
          goto LABEL_36;
        }
        unint64_t v9 = *(void *)(v27 + 8 * v8);
        ++v2;
        if (!v9)
        {
          int64_t v2 = v8 + 1;
          if (v8 + 1 >= v28) {
            goto LABEL_36;
          }
          unint64_t v9 = *(void *)(v27 + 8 * v2);
          if (!v9)
          {
            int64_t v2 = v8 + 2;
            if (v8 + 2 >= v28) {
              goto LABEL_36;
            }
            unint64_t v9 = *(void *)(v27 + 8 * v2);
            if (!v9)
            {
              int64_t v10 = v8 + 3;
              if (v10 >= v28)
              {
LABEL_36:
                swift_release();
                return;
              }
              unint64_t v9 = *(void *)(v27 + 8 * v10);
              if (!v9)
              {
                while (1)
                {
                  int64_t v2 = v10 + 1;
                  if (__OFADD__(v10, 1)) {
                    goto LABEL_45;
                  }
                  if (v2 >= v28) {
                    goto LABEL_36;
                  }
                  unint64_t v9 = *(void *)(v27 + 8 * v2);
                  ++v10;
                  if (v9) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v2 = v10;
            }
          }
        }
LABEL_23:
        unint64_t v5 = (v9 - 1) & v9;
        unint64_t v7 = __clz(__rbit64(v9)) + (v2 << 6);
      }
      uint64_t v11 = v1;
      uint64_t v12 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v7);
      uint64_t v14 = *v12;
      uint64_t v13 = v12[1];
      unint64_t v15 = *(void **)(*(void *)(v1 + 56) + 8 * v7);
      os_log_type_t v16 = *(uint64_t (**)(void))(*(void *)v29 + 168);
      swift_bridgeObjectRetain();
      id v17 = v15;
      uint64_t v18 = v16();
      if (!*(void *)(v18 + 16) || (unint64_t v19 = sub_24A78FB38(v14, v13), (v20 & 1) == 0))
      {

        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
      id v21 = *(id *)(*(void *)(v18 + 56) + 8 * v19);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v22 = objc_msgSend(v21, sel_allObjects);

      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BA1B8);
      unint64_t v23 = sub_24A7B3418();

      if (v23 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v24 = sub_24A7B37A8();
        swift_bridgeObjectRelease();
        if (v24)
        {
LABEL_28:
          if (v24 < 1) {
            goto LABEL_44;
          }
          for (uint64_t i = 0; i != v24; ++i)
          {
            if ((v23 & 0xC000000000000001) != 0)
            {
              uint64_t v26 = (void *)MEMORY[0x24C5CFAE0](i, v23);
            }
            else
            {
              uint64_t v26 = *(void **)(v23 + 8 * i + 32);
              swift_unknownObjectRetain();
            }
            objc_msgSend(v26, sel_serviceDidUpdateWithSnapshot_, v17);
            swift_unknownObjectRelease();
          }
        }
      }
      else
      {
        uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v24) {
          goto LABEL_28;
        }
      }

LABEL_7:
      swift_bridgeObjectRelease();
      uint64_t v1 = v11;
    }
  }
  swift_bridgeObjectRelease();
}

void sub_24A794DE0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)v3 + 144))();
  if (!v7) {
    return;
  }
  uint64_t v8 = v7;
  if (*(void *)(v7 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_24A78FB38(a2, a3);
    if (v10)
    {
      id v11 = *(id *)(*(void *)(v8 + 56) + 8 * v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      objc_msgSend(a1, sel_serviceDidUpdateWithSnapshot_, v11);

      return;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
}

uint64_t sub_24A794EF8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24A794F30()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 52, 7);
}

uint64_t sub_24A794F80()
{
  uint64_t v1 = sub_24A7B3528();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24A7B3518();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = sub_24A7B3348();
  MEMORY[0x270FA5388](v6 - 8);
  v9[0] = sub_24A7951DC();
  sub_24A7B3338();
  v9[1] = MEMORY[0x263F8EE78];
  sub_24A795374(&qword_2697BA178, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA180);
  sub_24A7953BC(&qword_2697BA188, &qword_2697BA180);
  sub_24A7B3638();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F130], v1);
  uint64_t v7 = sub_24A7B3558();
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 16) = v7;
  *(void *)(v0 + 40) = sub_24A792288(MEMORY[0x263F8EE78]);
  *(_DWORD *)(v0 + 48) = 0;
  return v0;
}

unint64_t sub_24A7951DC()
{
  unint64_t result = qword_2697BA170;
  if (!qword_2697BA170)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2697BA170);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_24A795264@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(v1 + 16) + 144))();
  if (result)
  {
    uint64_t v6 = result;
    if (*(void *)(result + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v7 = sub_24A78FB38(v3, v4);
      if (v8)
      {
        unint64_t v9 = *(void **)(*(void *)(v6 + 56) + 8 * v7);
        id v10 = v9;
      }
      else
      {
        unint64_t v9 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v9 = 0;
    }
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v9 = 0;
  }
  *a1 = v9;
  return result;
}

uint64_t sub_24A79532C()
{
  return objectdestroyTm_0(MEMORY[0x263F8EEE8]);
}

uint64_t sub_24A795344()
{
  return sub_24A7954CC(sub_24A7928B0);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_24A795374(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24A7953BC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24A79540C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A795444()
{
  return objectdestroyTm_0(MEMORY[0x263F8EED8]);
}

uint64_t objectdestroyTm_0(void (*a1)(void))
{
  swift_release();
  swift_bridgeObjectRelease();
  a1(*(void *)(v1 + 40));
  return MEMORY[0x270FA0238](v1, 56, 7);
}

uint64_t sub_24A7954B4()
{
  return sub_24A7954CC(sub_24A793014);
}

uint64_t sub_24A7954CC(uint64_t (*a1)(void, void, void, void, void))
{
  return a1(v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_24A7954E4()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A795524()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)v1 + 152);
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = v2(v3);
  return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 288))(v4);
}

uint64_t type metadata accessor for ContextualSuggestionService()
{
  return self;
}

uint64_t sub_24A7955D4(uint64_t a1, void *a2)
{
  return sub_24A793FA4(a1, a2, v2);
}

uint64_t sub_24A7955DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24A78FB38(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24A795B2C();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_24A790530(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24A7956AC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA228);
  char v38 = a2;
  uint64_t v6 = sub_24A7B37C8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    id v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_24A7B38F8();
    sub_24A7B33C8();
    uint64_t result = sub_24A7B3918();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  id v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_24A7959BC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_24A78FB38(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_24A795B2C();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_24A7956AC(v15, a4 & 1);
  unint64_t v20 = sub_24A78FB38(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_24A7B3898();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  id v22 = (uint64_t *)(v18[6] + 16 * v12);
  *id v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;
  swift_bridgeObjectRetain();
}

id sub_24A795B2C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA228);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24A7B37B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24A795CE0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24A7B38F8();
  swift_bridgeObjectRetain();
  sub_24A7B33C8();
  uint64_t v8 = sub_24A7B3918();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24A7B3878() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_24A7B3878() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24A796170(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24A795E90()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BA1D8);
  uint64_t v3 = sub_24A7B36B8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_24A7B38F8();
      sub_24A7B33C8();
      uint64_t result = sub_24A7B3918();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_24A796170(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_24A795E90();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24A79630C();
      goto LABEL_22;
    }
    sub_24A7964C0();
  }
  uint64_t v11 = *v4;
  sub_24A7B38F8();
  sub_24A7B33C8();
  uint64_t result = sub_24A7B3918();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24A7B3878(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24A7B3888();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_24A7B3878();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  uint64_t *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_24A79630C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BA1D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24A7B36A8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24A7964C0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BA1D8);
  uint64_t v3 = sub_24A7B36B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_24A7B38F8();
    swift_bridgeObjectRetain();
    sub_24A7B33C8();
    uint64_t result = sub_24A7B3918();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24A796770()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A7967AC()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)result + 120))(result);
    objc_msgSend(v2, sel_invalidate);

    (*(void (**)(void))(*(void *)v1 + 128))(0);
    return swift_release();
  }
  return result;
}

uint64_t sub_24A796860()
{
  return sub_24A793598();
}

uint64_t sub_24A796868()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24A7968B0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_24A7852C4;
  uint64_t v6 = (uint64_t (*)(int, void *, uint64_t))((char *)&dword_2697BA1E8 + dword_2697BA1E8);
  return v6(v2, v3, v4);
}

uint64_t sub_24A79696C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_24A796A3C()
{
  if (qword_26B17B198 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B17B190;
  return v0;
}

uint64_t sub_24A796A98()
{
  sub_24A787494(0, (unint64_t *)&qword_26B17AB60);
  sub_24A7AA2DC();
  swift_bridgeObjectRetain();
  uint64_t result = sub_24A7B35F8();
  qword_26B17B190 = result;
  return result;
}

uint64_t sub_24A796B60()
{
  uint64_t v0 = sub_24A7B32F8();
  __swift_allocate_value_buffer(v0, qword_26B17AF70);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B17AF70);
  id v1 = [self log];
  return sub_24A7B3308();
}

uint64_t sub_24A796BD0()
{
  if (qword_26B17AD90 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24A7B32F8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_26B17AF70);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Logger.ambient.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B17AD90 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A7B32F8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B17AF70);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t type metadata accessor for ATXAmbientLog(uint64_t a1)
{
  return sub_24A787494(a1, &qword_2697BB6A8);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

Swift::Void __swiftcall CoreAnalyticsEvent.send()()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  CoreAnalyticsEvent.createPayload()(v0);
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v3, v2);
  uint64_t v4 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  sub_24A7972B8();
  id v5 = (id)sub_24A7B3358();
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();
}

uint64_t CoreAnalyticsEvent.createPayload()(uint64_t a1)
{
  uint64_t v3 = sub_24A7B3948();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = sub_24A7972F8(MEMORY[0x263F8EE78]);
  *((void *)&v50 + 1) = a1;
  uint64_t v8 = __swift_allocate_boxed_opaque_existential_0(&v48);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16))(v8, v1, a1);
  sub_24A7B3928();
  uint64_t v41 = v6;
  sub_24A7B3938();
  sub_24A7B3778();
  swift_release();
  swift_retain();
  sub_24A7B37F8();
  if (!v51)
  {
LABEL_27:
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v41, v3);
    return v7;
  }
  uint64_t v40 = MEMORY[0x263F8EE58] + 8;
  while (1)
  {
    unint64_t v9 = v7;
    while (1)
    {
      uint64_t v10 = v48;
      uint64_t v11 = v49;
      v46[0] = v48;
      v46[1] = v49;
      sub_24A797478(&v50, v47);
      uint64_t v43 = v10;
      uint64_t v44 = v11;
      sub_24A79175C((uint64_t)v47, (uint64_t)v45);
      if (v11) {
        break;
      }
      sub_24A797488((uint64_t)v46);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v45);
      sub_24A7B37F8();
      if (!v51)
      {
        unint64_t v7 = v9;
        goto LABEL_27;
      }
    }
    swift_bridgeObjectRetain_n();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v45);
    uint64_t v43 = v10;
    uint64_t v44 = v11;
    sub_24A79175C((uint64_t)v47, (uint64_t)v45);
    swift_bridgeObjectRelease();
    sub_24A7972B8();
    if (swift_dynamicCast()) {
      break;
    }
    swift_bridgeObjectRetain();
    uint64_t v23 = v10;
    unint64_t v7 = v9;
    unint64_t v24 = sub_24A78FB38(v23, v11);
    char v26 = v25;
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0) {
      goto LABEL_26;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v42 = (void *)v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_24A7977F8();
      unint64_t v7 = (unint64_t)v42;
    }
    swift_bridgeObjectRelease();
    uint64_t v28 = *(void **)(*(void *)(v7 + 56) + 8 * v24);
    sub_24A790530(v24, v7);

LABEL_25:
    swift_bridgeObjectRelease();
LABEL_26:
    swift_bridgeObjectRelease();
    sub_24A797488((uint64_t)v46);
    sub_24A7B37F8();
    if (!v51) {
      goto LABEL_27;
    }
  }
  uint64_t v37 = v4;
  uint64_t v38 = v3;
  uint64_t v39 = v42;
  unint64_t v12 = v9;
  char v13 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v42 = (void *)v9;
  unint64_t v15 = sub_24A78FB38(v10, v11);
  uint64_t v16 = *(void *)(v12 + 16);
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (!__OFADD__(v16, v17))
  {
    char v19 = v14;
    if (*(void *)(v12 + 24) < v18)
    {
      sub_24A7974E8(v18, v13);
      unint64_t v20 = sub_24A78FB38(v10, v11);
      if ((v19 & 1) != (v21 & 1)) {
        goto LABEL_30;
      }
      unint64_t v15 = v20;
      uint64_t v22 = v42;
      if ((v19 & 1) == 0) {
        goto LABEL_22;
      }
LABEL_20:
      uint64_t v29 = v22[7];
      uint64_t v30 = 8 * v15;

      *(void *)(v29 + v30) = v39;
      uint64_t v3 = v38;
      unint64_t v7 = (unint64_t)v22;
LABEL_24:
      uint64_t v4 = v37;
      goto LABEL_25;
    }
    if (v13)
    {
      uint64_t v22 = v42;
      if (v14) {
        goto LABEL_20;
      }
    }
    else
    {
      sub_24A7977F8();
      uint64_t v22 = v42;
      if (v19) {
        goto LABEL_20;
      }
    }
LABEL_22:
    v22[(v15 >> 6) + 8] |= 1 << v15;
    uint64_t v31 = (uint64_t *)(v22[6] + 16 * v15);
    uint64_t *v31 = v10;
    v31[1] = v11;
    *(void *)(v22[7] + 8 * v15) = v39;
    uint64_t v32 = v22[2];
    BOOL v33 = __OFADD__(v32, 1);
    uint64_t v34 = v32 + 1;
    if (v33) {
      goto LABEL_29;
    }
    unint64_t v7 = (unint64_t)v22;
    v22[2] = v34;
    swift_bridgeObjectRetain();
    uint64_t v3 = v38;
    goto LABEL_24;
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  uint64_t result = sub_24A7B3898();
  __break(1u);
  return result;
}

unint64_t sub_24A7972B8()
{
  unint64_t result = qword_26B17AB58;
  if (!qword_26B17AB58)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B17AB58);
  }
  return result;
}

unint64_t sub_24A7972F8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17AB48);
  uint64_t v2 = (void *)sub_24A7B37D8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    unint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_24A78FB38(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

_OWORD *sub_24A797478(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24A797488(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17AB40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A7974E8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17AB48);
  char v38 = a2;
  uint64_t v6 = sub_24A7B37C8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_24A7B38F8();
    sub_24A7B33C8();
    uint64_t result = sub_24A7B3918();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

id sub_24A7977F8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17AB48);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24A7B37B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t dispatch thunk of static CoreAnalyticsEvent.eventName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of CoreAnalyticsEvent.send()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

void sub_24A7979D8(void *a1, void *a2)
{
}

uint64_t sub_24A797A44()
{
  sub_24A798D00(v0, (uint64_t)v18);
  switch(v22)
  {
    case 2:
      uint64_t v1 = (void *)*((void *)&v18[0] + 1);
      uint64_t v2 = *(void **)&v18[0];
      sub_24A7B36D8();
      swift_bridgeObjectRelease();
      *(void *)&v16[0] = 0xD000000000000020;
      *((void *)&v16[0] + 1) = 0x800000024A7B78F0;
      id v3 = objc_msgSend(v2, sel_description);
      sub_24A7B3398();

      sub_24A7B33D8();
      swift_bridgeObjectRelease();
      sub_24A7B33D8();
      id v4 = objc_msgSend(v1, sel_description);
      goto LABEL_7;
    case 3:
      sub_24A799618((uint64_t)v18, (uint64_t)v16, &qword_2697B9E40);
      v13[0] = 0;
      v13[1] = 0xE000000000000000;
      sub_24A7B36D8();
      swift_bridgeObjectRelease();
      unint64_t v14 = 0xD000000000000018;
      unint64_t v15 = 0x800000024A7B78D0;
      sub_24A798D64((uint64_t)v16, (uint64_t)v13);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697B9E40);
      sub_24A7B33A8();
      sub_24A7B33D8();
      swift_bridgeObjectRelease();
      uint64_t v5 = v14;
      sub_24A782514((uint64_t)v16);
      return v5;
    case 4:
      unint64_t v7 = v20;
      uint64_t v6 = v21;
      v16[0] = v18[0];
      v16[1] = v18[1];
      uint64_t v17 = v19;
      sub_24A7B36D8();
      swift_bridgeObjectRelease();
      sub_24A7B3668();
      sub_24A7B33D8();
      swift_bridgeObjectRelease();
      sub_24A7B33D8();
      id v8 = objc_msgSend(v7, sel_description);
      sub_24A7B3398();

      sub_24A7B33D8();
      swift_bridgeObjectRelease();
      sub_24A7B33D8();
      id v9 = objc_msgSend(v6, sel_description);
      sub_24A7B3398();

      sub_24A7B33D8();
      swift_bridgeObjectRelease();
      uint64_t v5 = 0x6574656D61726170;
      sub_24A798D10((uint64_t)v16);
      return v5;
    case 5:
      uint64_t v1 = (void *)*((void *)&v18[0] + 1);
      uint64_t v2 = *(void **)&v18[0];
      *(void *)&v16[0] = 0;
      *((void *)&v16[0] + 1) = 0xE000000000000000;
      sub_24A7B36D8();
      sub_24A7B33D8();
      id v10 = objc_msgSend(v2, sel_description);
      sub_24A7B3398();

      sub_24A7B33D8();
      swift_bridgeObjectRelease();
      sub_24A7B33D8();
      id v4 = objc_msgSend(v1, sel_description);
LABEL_7:
      id v11 = v4;
      sub_24A7B3398();

      sub_24A7B33D8();
      swift_bridgeObjectRelease();
      return *(void *)&v16[0];
    default:
      sub_24A7B36D8();
      swift_bridgeObjectRelease();
      *(void *)&v16[0] = 0xD000000000000019;
      *((void *)&v16[0] + 1) = 0x800000024A7B7920;
      sub_24A7B33D8();
      swift_bridgeObjectRelease();
      sub_24A7B33D8();
      sub_24A7B33D8();
      swift_bridgeObjectRelease();
      sub_24A7B33D8();
      return *(void *)&v16[0];
  }
}

ATXIntentComparator __swiftcall ATXIntentComparator.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (ATXIntentComparator)objc_msgSend(v0, sel_init);
}

id ATXIntentComparator.init()()
{
  v1.super_class = (Class)ATXIntentComparator;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t sub_24A798028(uint64_t a1)
{
  uint64_t v2 = sub_24A7B3678();
  return sub_24A79806C(a1, v2);
}

unint64_t sub_24A79806C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_24A7995BC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x24C5CFA70](v9, a1);
      sub_24A798D10((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void sub_24A798134(void *a1, void *a2)
{
  id v4 = objc_msgSend(a1, sel_atx_intentType);
  uint64_t v5 = sub_24A7B3398();
  uint64_t v7 = v6;

  id v8 = objc_msgSend(a2, sel_atx_intentType);
  uint64_t v9 = sub_24A7B3398();
  uint64_t v11 = v10;

  if (v5 == v9 && v7 == v11)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v13 = sub_24A7B3878();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
    {
      sub_24A798DD0();
      swift_allocError();
      uint64_t v15 = v14;
      id v16 = objc_msgSend(a1, sel_atx_intentType);
      uint64_t v17 = sub_24A7B3398();
      uint64_t v19 = v18;

      id v20 = objc_msgSend(a2, sel_atx_intentType);
      uint64_t v21 = sub_24A7B3398();
      uint64_t v23 = v22;

      *(void *)uint64_t v15 = v17;
      *(void *)(v15 + 8) = v19;
      *(void *)(v15 + 16) = v21;
      *(void *)(v15 + 24) = v23;
      *(unsigned char *)(v15 + 56) = 0;
LABEL_17:
      swift_willThrow();
      return;
    }
  }
  self;
  uint64_t v24 = swift_dynamicCastObjCClass();
  if (!v24 || (v25 = (void *)v24, self, (uint64_t v26 = swift_dynamicCastObjCClass()) == 0))
  {
    id v33 = objc_msgSend(a1, sel_atx_nonNilParametersByName);
    if (!v33) {
      goto LABEL_85;
    }
    uint64_t v34 = v33;
    id v35 = objc_msgSend(a2, sel_atx_nonNilParametersByName);
    if (v35)
    {
      int64_t v36 = v35;
      if (objc_msgSend(v34, sel_atx_isFuzzyMatch_, v35))
      {

        return;
      }
      sub_24A798DD0();
      swift_allocError();
      *(void *)uint64_t v37 = v34;
      *(void *)(v37 + 8) = v36;
      *(unsigned char *)(v37 + 56) = 5;
      goto LABEL_17;
    }
LABEL_86:
    __break(1u);
    return;
  }
  BOOL v27 = (void *)v26;
  id v91 = a1;
  id v92 = a2;
  id v28 = objc_msgSend(v25, sel_launchId);
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = sub_24A7B3398();
    uint64_t v32 = v31;
  }
  else
  {
    uint64_t v30 = 0;
    uint64_t v32 = 0;
  }
  id v38 = objc_msgSend(v27, sel_launchId);
  if (!v38)
  {
    if (!v32) {
      goto LABEL_37;
    }
    goto LABEL_28;
  }
  uint64_t v39 = v38;
  uint64_t v40 = sub_24A7B3398();
  uint64_t v42 = v41;

  if (!v32)
  {
    if (!v42) {
      goto LABEL_37;
    }
    goto LABEL_28;
  }
  if (!v42)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  if (v30 == v40 && v32 == v42)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  char v55 = sub_24A7B3878();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v55 & 1) == 0)
  {
LABEL_29:
    sub_24A798DD0();
    swift_allocError();
    uint64_t v44 = v43;
    id v45 = objc_msgSend(v25, sel_launchId);
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = sub_24A7B3398();
      uint64_t v49 = v48;
    }
    else
    {
      uint64_t v47 = 0;
      uint64_t v49 = 0;
    }
    id v50 = objc_msgSend(v27, sel_launchId);
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = sub_24A7B3398();
      uint64_t v54 = v53;
    }
    else
    {
      uint64_t v52 = 0;
      uint64_t v54 = 0;
    }
    *(void *)uint64_t v44 = v47;
    *(void *)(v44 + 8) = v49;
    *(void *)(v44 + 16) = v52;
    *(void *)(v44 + 24) = v54;
    *(unsigned char *)(v44 + 56) = 1;
    swift_willThrow();

    goto LABEL_70;
  }
LABEL_37:
  id v56 = objc_msgSend(v25, sel_atx_comparableParameters);
  uint64_t v57 = sub_24A7B3368();

  id v58 = objc_msgSend(v27, sel_atx_comparableParameters);
  uint64_t v59 = sub_24A7B3368();

  if (*(void *)(v57 + 16) != *(void *)(v59 + 16))
  {
    sub_24A798DD0();
    swift_allocError();
    uint64_t v75 = v74;
    uint64_t v76 = sub_24A7B3358();
    swift_bridgeObjectRelease();
    uint64_t v77 = sub_24A7B3358();
    swift_bridgeObjectRelease();
    *(void *)uint64_t v75 = v76;
    *(void *)(v75 + 8) = v77;
    *(unsigned char *)(v75 + 56) = 2;
    swift_willThrow();

LABEL_70:
    return;
  }
  int64_t v60 = 0;
  uint64_t v61 = *(void *)(v57 + 64);
  uint64_t v89 = v57 + 64;
  uint64_t v62 = 1 << *(unsigned char *)(v57 + 32);
  uint64_t v63 = -1;
  if (v62 < 64) {
    uint64_t v63 = ~(-1 << v62);
  }
  unint64_t v64 = v63 & v61;
  int64_t v90 = (unint64_t)(v62 + 63) >> 6;
  if ((v63 & v61) == 0) {
    goto LABEL_43;
  }
LABEL_41:
  unint64_t v65 = __clz(__rbit64(v64));
  v64 &= v64 - 1;
  unint64_t v66 = v65 | (v60 << 6);
LABEL_42:
  sub_24A7995BC(*(void *)(v57 + 48) + 40 * v66, (uint64_t)&v95);
  sub_24A79175C(*(void *)(v57 + 56) + 32 * v66, (uint64_t)v97 + 8);
  while (1)
  {
    sub_24A799618((uint64_t)&v95, (uint64_t)&v99, &qword_26B17AB50);
    if (!*((void *)&v100 + 1))
    {
      swift_bridgeObjectRelease();

      goto LABEL_82;
    }
    long long v95 = v99;
    long long v96 = v100;
    *(void *)&v97[0] = v101;
    sub_24A797478(&v102, v94);
    sub_24A79175C((uint64_t)v94, (uint64_t)v93);
    sub_24A787494(0, (unint64_t *)&qword_26B17AB58);
    if (!swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      sub_24A798DD0();
      swift_allocError();
      uint64_t v86 = v85;
      sub_24A79175C((uint64_t)v94, v85);
      char v87 = 3;
LABEL_78:
      *(unsigned char *)(v86 + 56) = v87;
      swift_willThrow();

      goto LABEL_81;
    }
    uint64_t v70 = v103;
    if (!*(void *)(v59 + 16)) {
      break;
    }
    unint64_t v71 = sub_24A798028((uint64_t)&v95);
    if ((v72 & 1) == 0) {
      break;
    }
    sub_24A79175C(*(void *)(v59 + 56) + 32 * v71, (uint64_t)v93);
    if ((swift_dynamicCast() & 1) == 0) {
      break;
    }
    id v73 = v103;
    if (!objc_msgSend(v70, sel_isEqual_, v103))
    {
      swift_bridgeObjectRelease();
      sub_24A798DD0();
      swift_allocError();
      uint64_t v86 = v88;
      sub_24A7995BC((uint64_t)&v95, v88);
      *(void *)(v86 + 40) = v70;
      *(void *)(v86 + 48) = v73;
      char v87 = 4;
      goto LABEL_78;
    }

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v94);
    sub_24A798D10((uint64_t)&v95);
    if (v64) {
      goto LABEL_41;
    }
LABEL_43:
    int64_t v67 = v60 + 1;
    if (__OFADD__(v60, 1))
    {
      __break(1u);
      goto LABEL_84;
    }
    if (v67 < v90)
    {
      unint64_t v68 = *(void *)(v89 + 8 * v67);
      if (v68) {
        goto LABEL_46;
      }
      int64_t v69 = v60 + 2;
      ++v60;
      if (v67 + 1 < v90)
      {
        unint64_t v68 = *(void *)(v89 + 8 * v69);
        if (v68) {
          goto LABEL_49;
        }
        int64_t v60 = v67 + 1;
        if (v67 + 2 < v90)
        {
          unint64_t v68 = *(void *)(v89 + 8 * (v67 + 2));
          if (v68)
          {
            v67 += 2;
            goto LABEL_46;
          }
          int64_t v69 = v67 + 3;
          int64_t v60 = v67 + 2;
          if (v67 + 3 < v90)
          {
            unint64_t v68 = *(void *)(v89 + 8 * v69);
            if (v68)
            {
LABEL_49:
              int64_t v67 = v69;
LABEL_46:
              unint64_t v64 = (v68 - 1) & v68;
              unint64_t v66 = __clz(__rbit64(v68)) + (v67 << 6);
              int64_t v60 = v67;
              goto LABEL_42;
            }
            while (1)
            {
              int64_t v67 = v69 + 1;
              if (__OFADD__(v69, 1)) {
                break;
              }
              if (v67 >= v90)
              {
                int64_t v60 = v90 - 1;
                goto LABEL_60;
              }
              unint64_t v68 = *(void *)(v89 + 8 * v67);
              ++v69;
              if (v68) {
                goto LABEL_46;
              }
            }
LABEL_84:
            __break(1u);
LABEL_85:
            __break(1u);
            goto LABEL_86;
          }
        }
      }
    }
LABEL_60:
    unint64_t v64 = 0;
    uint64_t v98 = 0;
    memset(v97, 0, sizeof(v97));
    long long v95 = 0u;
    long long v96 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_24A798DD0();
  swift_allocError();
  uint64_t v79 = v78;
  id v80 = objc_msgSend(v27, sel_serializedParameters);
  uint64_t v81 = sub_24A7B3368();

  if (*(void *)(v81 + 16))
  {
    unint64_t v82 = sub_24A798028((uint64_t)&v95);
    unint64_t v83 = v92;
    if (v84)
    {
      sub_24A79175C(*(void *)(v81 + 56) + 32 * v82, v79);
    }
    else
    {
      *(_OWORD *)uint64_t v79 = 0u;
      *(_OWORD *)(v79 + 16) = 0u;
    }
  }
  else
  {
    *(_OWORD *)uint64_t v79 = 0u;
    *(_OWORD *)(v79 + 16) = 0u;
    unint64_t v83 = v92;
  }
  swift_bridgeObjectRelease();
  *(unsigned char *)(v79 + 56) = 3;
  swift_willThrow();

LABEL_81:
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v94);
  sub_24A798D10((uint64_t)&v95);
LABEL_82:
  swift_release();
}

uint64_t sub_24A798A8C(void *a1, void *a2)
{
  uint64_t v4 = sub_24A7B32F8();
  MEMORY[0x270FA5388](v4);
  sub_24A798134(a1, a2);
  return 1;
}

uint64_t sub_24A798D00(uint64_t a1, uint64_t a2)
{
  return _s5ErrorOwcp(a2, a1);
}

uint64_t sub_24A798D10(uint64_t a1)
{
  return a1;
}

uint64_t sub_24A798D64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697B9E40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24A798DD0()
{
  unint64_t result = qword_26B17A408;
  if (!qword_26B17A408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B17A408);
  }
  return result;
}

void _s5ErrorOwxx(uint64_t a1)
{
  unsigned int v2 = *(unsigned __int8 *)(a1 + 56);
  if (v2 >= 6) {
    unsigned int v2 = *(_DWORD *)a1 + 6;
  }
  switch(v2)
  {
    case 2u:
    case 5u:

      uint64_t v3 = *(void **)(a1 + 8);
      goto LABEL_12;
    case 3u:
      if (*(void *)(a1 + 24) >= 0xFFFFFFFFuLL) {
        __swift_destroy_boxed_opaque_existential_0(a1);
      }
      break;
    case 4u:
      __swift_destroy_boxed_opaque_existential_0(a1);

      uint64_t v3 = *(void **)(a1 + 48);
LABEL_12:

      break;
    default:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
  }
}

uint64_t _s5ErrorOwcp(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned __int8 *)(a2 + 56);
  if (v4 >= 6) {
    unsigned int v4 = *(_DWORD *)a2 + 6;
  }
  switch(v4)
  {
    case 1u:
      uint64_t v11 = *(void *)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v11;
      uint64_t v12 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = v12;
      *(unsigned char *)(a1 + 56) = 1;
      goto LABEL_8;
    case 2u:
      uint64_t v7 = *(void **)a2;
      id v8 = *(void **)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v8;
      char v9 = 2;
      goto LABEL_12;
    case 3u:
      unint64_t v13 = *(void *)(a2 + 24);
      if (v13 < 0xFFFFFFFF)
      {
        long long v16 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v16;
      }
      else
      {
        *(void *)(a1 + 24) = v13;
        (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1, a2);
      }
      *(unsigned char *)(a1 + 56) = 3;
      return a1;
    case 4u:
      long long v10 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v10;
      (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1, a2);
      uint64_t v7 = *(void **)(a2 + 40);
      id v8 = *(void **)(a2 + 48);
      *(void *)(a1 + 40) = v7;
      *(void *)(a1 + 48) = v8;
      char v9 = 4;
      goto LABEL_12;
    case 5u:
      uint64_t v7 = *(void **)a2;
      id v8 = *(void **)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v8;
      char v9 = 5;
LABEL_12:
      *(unsigned char *)(a1 + 56) = v9;
      id v14 = v7;
      id v15 = v8;
      break;
    default:
      uint64_t v5 = *(void *)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v5;
      uint64_t v6 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = v6;
      *(unsigned char *)(a1 + 56) = 0;
LABEL_8:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
  }
  return a1;
}

uint64_t _s5ErrorOwca(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 56);
    if (v4 >= 6) {
      unsigned int v4 = *(_DWORD *)a1 + 6;
    }
    switch(v4)
    {
      case 2u:
      case 5u:

        uint64_t v5 = *(void **)(a1 + 8);
        goto LABEL_10;
      case 3u:
        if (*(void *)(a1 + 24) >= 0xFFFFFFFFuLL) {
          __swift_destroy_boxed_opaque_existential_0(a1);
        }
        break;
      case 4u:
        __swift_destroy_boxed_opaque_existential_0(a1);

        uint64_t v5 = *(void **)(a1 + 48);
LABEL_10:

        break;
      default:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        break;
    }
    unsigned int v6 = *(unsigned __int8 *)(a2 + 56);
    if (v6 >= 6) {
      unsigned int v6 = *(_DWORD *)a2 + 6;
    }
    switch(v6)
    {
      case 1u:
        *(void *)a1 = *(void *)a2;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        *(unsigned char *)(a1 + 56) = 1;
        goto LABEL_18;
      case 2u:
        uint64_t v7 = *(void **)a2;
        *(void *)a1 = *(void *)a2;
        id v8 = *(void **)(a2 + 8);
        *(void *)(a1 + 8) = v8;
        char v9 = 2;
        goto LABEL_22;
      case 3u:
        unint64_t v11 = *(void *)(a2 + 24);
        if (v11 < 0xFFFFFFFF)
        {
          long long v14 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_OWORD *)(a1 + 16) = v14;
        }
        else
        {
          *(void *)(a1 + 24) = v11;
          (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1, a2);
        }
        *(unsigned char *)(a1 + 56) = 3;
        return a1;
      case 4u:
        uint64_t v10 = *(void *)(a2 + 24);
        *(void *)(a1 + 24) = v10;
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1, a2);
        uint64_t v7 = *(void **)(a2 + 40);
        *(void *)(a1 + 40) = v7;
        id v8 = *(void **)(a2 + 48);
        *(void *)(a1 + 48) = v8;
        char v9 = 4;
        goto LABEL_22;
      case 5u:
        uint64_t v7 = *(void **)a2;
        *(void *)a1 = *(void *)a2;
        id v8 = *(void **)(a2 + 8);
        *(void *)(a1 + 8) = v8;
        char v9 = 5;
LABEL_22:
        *(unsigned char *)(a1 + 56) = v9;
        id v12 = v7;
        id v13 = v8;
        break;
      default:
        *(void *)a1 = *(void *)a2;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        *(unsigned char *)(a1 + 56) = 0;
LABEL_18:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
    }
  }
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s5ErrorOwta(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 56);
    if (v4 >= 6) {
      unsigned int v4 = *(_DWORD *)a1 + 6;
    }
    switch(v4)
    {
      case 2u:
      case 5u:

        uint64_t v5 = *(void **)(a1 + 8);
        goto LABEL_10;
      case 3u:
        if (*(void *)(a1 + 24) >= 0xFFFFFFFFuLL) {
          __swift_destroy_boxed_opaque_existential_0(a1);
        }
        break;
      case 4u:
        __swift_destroy_boxed_opaque_existential_0(a1);

        uint64_t v5 = *(void **)(a1 + 48);
LABEL_10:

        break;
      default:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        break;
    }
    unsigned int v6 = *(unsigned __int8 *)(a2 + 56);
    if (v6 >= 6) {
      unsigned int v6 = *(_DWORD *)a2 + 6;
    }
    switch(v6)
    {
      case 1u:
        long long v10 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v10;
        char v7 = 1;
        break;
      case 2u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        char v7 = 2;
        break;
      case 3u:
        long long v11 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v11;
        char v7 = 3;
        break;
      case 4u:
        long long v9 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v9;
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        char v7 = 4;
        break;
      case 5u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        char v7 = 5;
        break;
      default:
        char v7 = 0;
        long long v8 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v8;
        break;
    }
    *(unsigned char *)(a1 + 56) = v7;
  }
  return a1;
}

uint64_t _s5ErrorOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB && *(unsigned char *)(a1 + 57)) {
    return (*(_DWORD *)a1 + 251);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 56);
  if (v3 >= 6) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t _s5ErrorOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_OWORD *)(result + 41) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_DWORD *)__n128 result = a2 - 251;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 57) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 57) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 56) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24A799550(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 56);
  if (result >= 6) {
    return (*(_DWORD *)a1 + 6);
  }
  return result;
}

uint64_t sub_24A79956C(uint64_t result, unsigned int a2)
{
  if (a2 > 5)
  {
    *(void *)(result + 48) = 0;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_DWORD *)uint64_t result = a2 - 6;
    LOBYTE(a2) = 6;
  }
  *(unsigned char *)(result + 56) = a2;
  return result;
}

ValueMetadata *_s5ErrorOMa()
{
  return &_s5ErrorON;
}

uint64_t type metadata accessor for ATXIntentComparator(uint64_t a1)
{
  return sub_24A787494(a1, qword_2697BB6B0);
}

uint64_t sub_24A7995BC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24A799618(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A79967C()
{
  swift_beginAccess();
  return *(void *)(v0 + 112);
}

uint64_t sub_24A7996B0(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 112) = a1;
  return result;
}

uint64_t (*sub_24A7996F0())()
{
  return j__swift_endAccess;
}

unint64_t AmbientConfigurationManager.Error.errorDescription.getter()
{
  return 0xD000000000000010;
}

void *sub_24A7997C4()
{
  type metadata accessor for AmbientConfigurationManager();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_24A799B2C();
  qword_26B17AF38 = v0;
  return result;
}

uint64_t *sub_24A799800()
{
  if (qword_26B17AEA0 != -1) {
    swift_once();
  }
  return &qword_26B17AF38;
}

uint64_t static AmbientConfigurationManager.shared.getter()
{
  if (qword_26B17AEA0 != -1) {
    swift_once();
  }
  return swift_retain();
}

id sub_24A7998A8()
{
  id v0 = objc_msgSend(self, sel_weakObjectsHashTable);
  return v0;
}

id sub_24A7998E8()
{
  id v0 = self;
  uint64_t v1 = (void *)sub_24A7B3378();
  id v2 = objc_msgSend(v0, sel_appPredictionDirectoryFile_, v1);

  sub_24A7B3398();
  id v3 = [self log];
  id v4 = objc_allocWithZone(MEMORY[0x263F25150]);
  uint64_t v5 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  unsigned int v6 = (void *)sub_24A7B3378();
  id v7 = objc_msgSend(v4, sel_initWithCacheFilePath_loggingHandle_debugName_, v5, v3, v6);

  return v7;
}

id sub_24A799A10()
{
  id v0 = objc_msgSend(self, sel_defaultCenter);
  return v0;
}

uint64_t sub_24A799A50()
{
  uint64_t v0 = sub_24A7B3278();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A7B3268();
  uint64_t v4 = sub_24A7B3258();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

void *sub_24A799B2C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24A7B3278();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  v1[14] = 0;
  v1[15] = objc_msgSend(self, sel_weakObjectsHashTable);
  v1[16] = 0;
  id v7 = self;
  long long v8 = (void *)sub_24A7B3378();
  id v9 = objc_msgSend(v7, sel_appPredictionDirectoryFile_, v8);

  sub_24A7B3398();
  id v10 = [self log];
  id v11 = objc_allocWithZone(MEMORY[0x263F25150]);
  id v12 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  id v13 = (void *)sub_24A7B3378();
  id v14 = objc_msgSend(v11, sel_initWithCacheFilePath_loggingHandle_debugName_, v12, v10, v13);

  v1[17] = v14;
  v1[18] = objc_msgSend(self, sel_defaultCenter);
  sub_24A7B3268();
  uint64_t v15 = sub_24A7B3258();
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v1[19] = v15;
  v1[20] = v17;
  uint64_t v18 = (void *)v1[18];
  uint64_t v19 = swift_allocObject();
  swift_weakInit();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v19;
  *(void *)(v20 + 24) = v2;
  aBlock[4] = sub_24A79D75C;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A79AA58;
  aBlock[3] = &block_descriptor_46;
  uint64_t v21 = _Block_copy(aBlock);
  id v22 = v18;
  swift_release();
  id v23 = objc_msgSend(v22, sel_addObserverForName_object_queue_usingBlock_, @"com.apple.proactive.contextualengine.AmbientConfigurationManager.cacheDidUpdate", 0, 0, v21);
  _Block_release(v21);
  swift_unknownObjectRelease();

  return v1;
}

uint64_t sub_24A799E9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A390);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24A7B32F8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  id v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v51 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v51 - v16;
  sub_24A7B3188();
  if (!v55[3])
  {
    sub_24A79D764((uint64_t)v55, &qword_2697B9E40);
    goto LABEL_8;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    uint64_t v25 = sub_24A796BD0();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v17, v25, v8);
    uint64_t v26 = sub_24A7B32E8();
    os_log_type_t v27 = sub_24A7B34F8();
    if (os_log_type_enabled(v26, v27))
    {
      id v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      v55[0] = v29;
      *(_DWORD *)id v28 = 136315138;
      uint64_t v30 = sub_24A7B3998();
      v54[0] = sub_24A78F4E0(v30, v31, v55);
      sub_24A7B3608();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24A77B000, v26, v27, "%s: ambientConfigDidUpdateNotification had no sender identifier", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5D05E0](v29, -1, -1);
      MEMORY[0x24C5D05E0](v28, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v17, v8);
  }
  uint64_t v18 = (uint8_t *)(a2 + 16);
  uint64_t v20 = v54[0];
  uint64_t v19 = v54[1];
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v51 = v18;
    uint64_t v52 = a3;
    uint64_t v22 = v8;
    uint64_t v24 = *(void *)(Strong + 152);
    uint64_t v23 = *(void *)(Strong + 160);
    swift_bridgeObjectRetain();
    swift_release();
    if (v20 == v24 && v19 == v23)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v8 = v22;
LABEL_14:
      uint64_t v34 = sub_24A796BD0();
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v34, v8);
      id v35 = sub_24A7B32E8();
      os_log_type_t v36 = sub_24A7B3508();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = (uint8_t *)swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        v54[0] = v38;
        *(_DWORD *)uint64_t v37 = 136315138;
        uint64_t v39 = sub_24A7B3998();
        uint64_t v53 = sub_24A78F4E0(v39, v40, v54);
        sub_24A7B3608();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24A77B000, v35, v36, "%s: ignoring ambientConfigDidUpdateNotification from self", v37, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5D05E0](v38, -1, -1);
        MEMORY[0x24C5D05E0](v37, -1, -1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
    char v33 = sub_24A7B3878();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = v22;
    if (v33) {
      goto LABEL_14;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v41 = sub_24A796BD0();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v15, v41, v8);
  uint64_t v42 = sub_24A7B32E8();
  os_log_type_t v43 = sub_24A7B3508();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v52 = v8;
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    v54[0] = v45;
    *(_DWORD *)uint64_t v44 = 136315138;
    uint64_t v51 = v44 + 4;
    uint64_t v46 = sub_24A7B3998();
    uint64_t v53 = sub_24A78F4E0(v46, v47, v54);
    sub_24A7B3608();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A77B000, v42, v43, "%s: received ambient config did update notification", v44, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v45, -1, -1);
    MEMORY[0x24C5D05E0](v44, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v52);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
  }
  uint64_t v48 = sub_24A7B3498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v7, 1, 1, v48);
  uint64_t v49 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  id v50 = (void *)swift_allocObject();
  v50[2] = 0;
  v50[3] = 0;
  v50[4] = v49;
  sub_24A79A6F8((uint64_t)v7, (uint64_t)&unk_2697BA330, (uint64_t)v50);
  return swift_release();
}

uint64_t sub_24A79A578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a1;
  *(void *)(v4 + 48) = a4;
  return MEMORY[0x270FA2498](sub_24A79A598, 0, 0);
}

uint64_t sub_24A79A598()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 56) = Strong;
  if (Strong)
  {
    return MEMORY[0x270FA2498](sub_24A79A660, Strong, 0);
  }
  else
  {
    **(unsigned char **)(v0 + 40) = 1;
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
}

uint64_t sub_24A79A660()
{
  sub_24A79AB4C();
  swift_release();
  return MEMORY[0x270FA2498](sub_24A79A6D0, 0, 0);
}

uint64_t sub_24A79A6D0()
{
  **(unsigned char **)(v0 + 40) = *(void *)(v0 + 56) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24A79A6F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A7B3498();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24A7B3488();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24A79D764(a1, &qword_26B17A390);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24A7B3478();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA348);
  return swift_task_create();
}

uint64_t sub_24A79A8AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A7B3498();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24A7B3488();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24A79D764(a1, &qword_26B17A390);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24A7B3478();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24A79AA58(uint64_t a1)
{
  uint64_t v2 = sub_24A7B3198();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_24A7B3178();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24A79AB4C()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A390);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24A7B32F8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v36 - v9;
  MEMORY[0x270FA5388](v8);
  id v12 = (char *)&v36 - v11;
  sub_24A79B8FC();
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)(v1 + 128);
  if (v13)
  {
    if (v15)
    {
      swift_bridgeObjectRetain();
      unint64_t v16 = swift_bridgeObjectRetain();
      unsigned __int8 v17 = sub_24A79CF64(v16, v15);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v17)
      {
        swift_bridgeObjectRelease();
LABEL_6:
        uint64_t v18 = sub_24A796BD0();
        (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v10, v18, v5);
        uint64_t v19 = sub_24A7B32E8();
        os_log_type_t v20 = sub_24A7B3508();
        if (os_log_type_enabled(v19, v20))
        {
          uint64_t v21 = swift_slowAlloc();
          uint64_t v22 = swift_slowAlloc();
          v40[0] = v22;
          *(_DWORD *)uint64_t v21 = 136315394;
          uint64_t v23 = sub_24A7B3998();
          uint64_t v39 = sub_24A78F4E0(v23, v24, v40);
          sub_24A7B3608();
          swift_bridgeObjectRelease();
          *(_WORD *)(v21 + 12) = 2080;
          uint64_t v39 = sub_24A78F4E0(0xD000000000000010, 0x800000024A7B7A40, v40);
          sub_24A7B3608();
          _os_log_impl(&dword_24A77B000, v19, v20, "%s: %s: stacks from cache unchanged, not notifying observers", (uint8_t *)v21, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x24C5D05E0](v22, -1, -1);
          MEMORY[0x24C5D05E0](v21, -1, -1);
        }

        return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v10, v5);
      }
    }
  }
  else if (!v15)
  {
    goto LABEL_6;
  }
  *(void *)(v1 + 128) = v14;
  swift_bridgeObjectRelease();
  uint64_t v26 = sub_24A796BD0();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v12, v26, v5);
  os_log_type_t v27 = sub_24A7B32E8();
  os_log_type_t v28 = sub_24A7B3508();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    v40[0] = v37;
    *(_DWORD *)uint64_t v29 = 136315394;
    uint64_t v38 = v5;
    uint64_t v30 = sub_24A7B3998();
    uint64_t v39 = sub_24A78F4E0(v30, v31, v40);
    sub_24A7B3608();
    swift_bridgeObjectRelease();
    *(_WORD *)(v29 + 12) = 2080;
    uint64_t v39 = sub_24A78F4E0(0xD000000000000010, 0x800000024A7B7A40, v40);
    sub_24A7B3608();
    _os_log_impl(&dword_24A77B000, v27, v28, "%s: %s: read new stacks from cache, notifying observers", (uint8_t *)v29, 0x16u);
    uint64_t v32 = v37;
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v32, -1, -1);
    MEMORY[0x24C5D05E0](v29, -1, -1);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v38);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v5);
  }
  uint64_t v33 = sub_24A7B3498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v4, 1, 1, v33);
  unint64_t v34 = sub_24A79C358();
  id v35 = (void *)swift_allocObject();
  v35[2] = v1;
  v35[3] = v34;
  v35[4] = v1;
  swift_retain_n();
  sub_24A79A8AC((uint64_t)v4, (uint64_t)&unk_2697BA2E8, (uint64_t)v35);
  return swift_release();
}

uint64_t sub_24A79B260(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A390);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24A7B3498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = (void *)swift_allocObject();
  void v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  v7[5] = a1;
  swift_retain();
  swift_unknownObjectRetain();
  sub_24A79A8AC((uint64_t)v5, (uint64_t)&unk_2697BA2B0, (uint64_t)v7);
  return swift_release();
}

uint64_t sub_24A79B368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x270FA2498](sub_24A79B388, a4, 0);
}

uint64_t sub_24A79B388()
{
  objc_msgSend(*(id *)(v0[2] + 120), sel_addObject_, v0[3]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24A79B3F4()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24A79B43C()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_24A786034;
  *(_OWORD *)(v2 + 16) = v3;
  return MEMORY[0x270FA2498](sub_24A79B388, v3, 0);
}

uint64_t sub_24A79B4E8()
{
  unint64_t v3 = *(void *)(v0 + 128);
  if (v3)
  {
    unint64_t v2 = *(void *)(v0 + 128);
    if (!(v3 >> 62)) {
      goto LABEL_3;
    }
  }
  else
  {
    sub_24A79B8FC();
    if (v1) {
      return v2;
    }
    unint64_t v2 = v12;
    *(void *)(v0 + 128) = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (!v2) {
      return v2;
    }
    swift_bridgeObjectRetain();
    if (!(v2 >> 62))
    {
LABEL_3:
      uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain_n();
      if (v4) {
        goto LABEL_4;
      }
LABEL_20:
      swift_bridgeObjectRelease();
      return v2;
    }
  }
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_24A7B37A8();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v4) {
    goto LABEL_20;
  }
LABEL_4:
  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v9 = (id)MEMORY[0x24C5CFAE0](i, v2);
      }
      else {
        id v9 = *(id *)(v2 + 8 * i + 32);
      }
      uint64_t v8 = v9;
      id v10 = objc_msgSend(v9, sel_topWidgetIdentifier);
      if (v10)
      {
        uint64_t v7 = v8;
        uint64_t v8 = v10;
      }
      else
      {
        sub_24A79BCC4(v8);
        if (v11)
        {
          uint64_t v7 = (void *)sub_24A7B3378();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v7 = 0;
        }
        objc_msgSend(v8, sel_setTopWidgetIdentifier_, v7);
      }
    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

void sub_24A79B698(uint64_t a1)
{
  v18[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A390);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v1[16]
    || (swift_bridgeObjectRetain(),
        unint64_t v6 = swift_bridgeObjectRetain(),
        unsigned __int8 v7 = sub_24A79CF64(v6, a1),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v7 & 1) == 0))
  {
    v1[16] = a1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v8 = (void *)v1[17];
    sub_24A787494(0, (unint64_t *)&unk_26B17A3B0);
    id v9 = (void *)sub_24A7B3408();
    v18[0] = 0;
    LODWORD(v8) = objc_msgSend(v8, sel_storeSecureCodedObject_error_, v9, v18);

    id v10 = v18[0];
    if (v8)
    {
      uint64_t v11 = sub_24A7B3498();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v5, 1, 1, v11);
      unint64_t v12 = sub_24A79C358();
      uint64_t v13 = (void *)swift_allocObject();
      v13[2] = v1;
      v13[3] = v12;
      void v13[4] = v1;
      swift_retain_n();
      id v14 = v10;
      sub_24A79A8AC((uint64_t)v5, (uint64_t)&unk_2697BA2D0, (uint64_t)v13);
      swift_release();
      uint64_t v15 = (void *)v1[18];
      unint64_t v16 = (void *)sub_24A7B3378();
      objc_msgSend(v15, sel_postNotificationName_object_userInfo_options_, @"com.apple.proactive.contextualengine.AmbientConfigurationManager.cacheDidUpdate", v16, 0, 0);
    }
    else
    {
      id v17 = v18[0];
      sub_24A7B31F8();

      swift_willThrow();
    }
  }
}

void sub_24A79B8FC()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  sub_24A787494(0, (unint64_t *)&unk_26B17A3D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A400);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_24A7B4BB0;
  uint64_t v1 = sub_24A787494(0, (unint64_t *)&qword_26B17A3E0);
  *(void *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B17A3F0);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_24A787494(0, (unint64_t *)&unk_26B17A3B0);
  *(void *)(v0 + 88) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B17A398);
  *(void *)(v0 + 64) = v2;
  MEMORY[0x24C5CF980](v0);
  uint64_t v3 = 0;
  sub_24A7B34B8();
  __break(1u);
}

uint64_t sub_24A79BB50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24A79BB70, a4, 0);
}

void sub_24A79BB70()
{
  id v1 = objc_msgSend(*(id *)(*(void *)(v0 + 16) + 120), sel_allObjects);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA2F8);
  unint64_t v2 = sub_24A7B3418();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24A7B37A8();
    swift_bridgeObjectRelease();
    if (!v3) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v3) {
      goto LABEL_10;
    }
  }
  if (v3 < 1)
  {
    __break(1u);
    return;
  }
  for (uint64_t i = 0; i != v3; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = (void *)MEMORY[0x24C5CFAE0](i, v2);
    }
    else
    {
      uint64_t v5 = *(void **)(v2 + 8 * i + 32);
      swift_unknownObjectRetain();
    }
    objc_msgSend(v5, sel_ambientConfigurationManagerCacheDidUpdate);
    swift_unknownObjectRelease();
  }
LABEL_10:
  swift_bridgeObjectRelease();
  unint64_t v6 = *(void (**)(void))(v0 + 8);
  v6();
}

uint64_t sub_24A79BCC4(void *a1)
{
  uint64_t v48 = *v1;
  uint64_t v49 = a1;
  uint64_t v2 = sub_24A7B32A8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24A7B32B8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA300);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v45 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v44 = (char *)&v43 - v14;
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)&v43 - v15;
  uint64_t v17 = sub_24A7B3248();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  id v50 = (char *)&v43 - v22;
  sub_24A7B3298();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F07870], v2);
  sub_24A7B3238();
  sub_24A7B3288();
  uint64_t v46 = *(void (**)(char *, uint64_t))(v18 + 8);
  uint64_t v47 = v18 + 8;
  v46(v21, v17);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    sub_24A79D764((uint64_t)v16, &qword_2697BA300);
    return 0;
  }
  else
  {
    unint64_t v24 = v50;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v50, v16, v17);
    uint64_t v25 = swift_allocObject();
    sub_24A787494(0, &qword_2697BA308);
    *(void *)(v25 + 24) = 0;
    *(void *)(v25 + 16) = 0;
    uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    uint64_t v27 = (uint64_t)v44;
    v26(v44, 1, 1, v17);
    uint64_t v28 = (uint64_t)v45;
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v45, v24, v17);
    v26((char *)v28, 0, 1, v17);
    id v29 = sub_24A79C47C(v27, v28, 0, 0, 1);
    id v30 = objc_msgSend((id)BiomeLibrary(), sel_SpringBoard);
    swift_unknownObjectRelease();
    id v31 = objc_msgSend(v30, sel_Domino);
    swift_unknownObjectRelease();
    id v32 = objc_msgSend(v31, sel_StackRotation);
    swift_unknownObjectRelease();
    id v33 = objc_msgSend(v32, sel_publisherWithOptions_, v29);

    uint64_t v34 = swift_allocObject();
    uint64_t v35 = v48;
    *(void *)(v34 + 16) = v48;
    char v55 = sub_24A79D590;
    id v56 = (void *)v34;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v52 = 1107296256;
    uint64_t v53 = sub_24A79C8FC;
    uint64_t v54 = &block_descriptor_1;
    uint64_t v36 = _Block_copy(&aBlock);
    swift_release();
    uint64_t v37 = (void *)swift_allocObject();
    uint64_t v38 = v49;
    void v37[2] = v49;
    v37[3] = v25;
    v37[4] = v35;
    char v55 = sub_24A79D5F0;
    id v56 = v37;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v52 = 1107296256;
    uint64_t v53 = sub_24A79CDCC;
    uint64_t v54 = &block_descriptor_32;
    uint64_t v39 = _Block_copy(&aBlock);
    id v40 = v38;
    swift_retain();
    swift_release();
    id v41 = objc_msgSend(v33, sel_sinkWithCompletion_shouldContinue_, v36, v39);
    _Block_release(v39);
    _Block_release(v36);

    v46(v50, v17);
    swift_beginAccess();
    uint64_t v23 = *(void *)(v25 + 16);
    swift_bridgeObjectRetain();
    swift_release();
  }
  return v23;
}

unint64_t sub_24A79C358()
{
  unint64_t result = qword_2697BA2C8;
  if (!qword_2697BA2C8)
  {
    type metadata accessor for AmbientConfigurationManager();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA2C8);
  }
  return result;
}

uint64_t type metadata accessor for AmbientConfigurationManager()
{
  return self;
}

uint64_t sub_24A79C3D4()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24A786034;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_24A79BB70, v2, 0);
}

id sub_24A79C47C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v9 = sub_24A7B3248();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  uint64_t v12 = 0;
  if (v11(a1, 1, v9) != 1)
  {
    uint64_t v12 = (void *)sub_24A7B3228();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  }
  if (v11(a2, 1, v9) == 1)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = (void *)sub_24A7B3228();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a2, v9);
  }
  id v14 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithStartDate_endDate_maxEvents_lastN_reversed_, v12, v13, a3, a4, a5 & 1);

  return v14;
}

id sub_24A79C5FC(void *a1)
{
  uint64_t v2 = sub_24A7B32F8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(a1, sel_error);
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = sub_24A796BD0();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    id v9 = v7;
    uint64_t v10 = sub_24A7B32E8();
    os_log_type_t v11 = sub_24A7B34F8();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v19 = (void *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v22 = v20;
      *(_DWORD *)uint64_t v12 = 136315650;
      uint64_t v13 = sub_24A7B3998();
      uint64_t v21 = sub_24A78F4E0(v13, v14, &v22);
      sub_24A7B3608();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2080;
      uint64_t v21 = sub_24A78F4E0(0xD000000000000031, 0x800000024A7B7A90, &v22);
      sub_24A7B3608();
      *(_WORD *)(v12 + 22) = 2112;
      id v15 = v9;
      uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v21 = v16;
      sub_24A7B3608();
      uint64_t v17 = v19;
      *uint64_t v19 = v16;

      _os_log_impl(&dword_24A77B000, v10, v11, "%s.%s: error reading stack rotation stream: %@", (uint8_t *)v12, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1D0);
      swift_arrayDestroy();
      MEMORY[0x24C5D05E0](v17, -1, -1);
      uint64_t v18 = v20;
      swift_arrayDestroy();
      MEMORY[0x24C5D05E0](v18, -1, -1);
      MEMORY[0x24C5D05E0](v12, -1, -1);
    }
    else
    {
    }
    return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

void sub_24A79C8FC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_24A79C964(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_24A7B32F8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  os_log_type_t v11 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_msgSend(a1, sel_eventBody);
  if (!v12) {
    return 1;
  }
  uint64_t v13 = v12;
  id v14 = objc_msgSend(v12, sel_stackId);
  if (!v14)
  {
LABEL_9:

    return 1;
  }
  id v15 = v14;
  uint64_t v43 = v8;
  uint64_t v16 = sub_24A7B3398();
  unint64_t v18 = v17;

  id v19 = objc_msgSend(a2, sel_identifier);
  uint64_t v20 = sub_24A7B3398();
  uint64_t v22 = v21;

  BOOL v23 = v16 == v20 && v18 == v22;
  uint64_t v42 = v16;
  if (v23)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v24 = sub_24A7B3878();
    swift_bridgeObjectRelease();
    if ((v24 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
  }
  id v26 = objc_msgSend(v13, sel_widget);
  uint64_t v27 = v26;
  v41[1] = a4;
  if (!v26)
  {
    uint64_t v29 = v9;
LABEL_17:
    uint64_t v31 = 0;
    goto LABEL_18;
  }
  id v28 = objc_msgSend(v26, sel_uniqueId);

  uint64_t v29 = v9;
  if (!v28)
  {
    uint64_t v27 = 0;
    goto LABEL_17;
  }
  uint64_t v27 = (void *)sub_24A7B3398();
  uint64_t v31 = v30;

LABEL_18:
  uint64_t v32 = v43;
  swift_beginAccess();
  *(void *)(a3 + 16) = v27;
  *(void *)(a3 + 24) = v31;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  if (*(void *)(a3 + 24))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v33 = sub_24A796BD0();
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v11, v33, v32);
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_24A7B32E8();
    os_log_type_t v35 = sub_24A7B34F8();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      v41[0] = swift_slowAlloc();
      uint64_t v45 = v41[0];
      *(_DWORD *)uint64_t v36 = 136315650;
      uint64_t v37 = sub_24A7B3998();
      uint64_t v39 = sub_24A78F4E0(v37, v38, &v45);
      uint64_t v43 = v29;
      uint64_t v44 = v39;
      sub_24A7B3608();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 12) = 2080;
      uint64_t v44 = sub_24A78F4E0(0xD000000000000031, 0x800000024A7B7A90, &v45);
      sub_24A7B3608();
      *(_WORD *)(v36 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_24A78F4E0(v42, v18, &v45);
      sub_24A7B3608();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24A77B000, v34, v35, "%s.%s: no topWidgetIdentifier found in stack rotation event with id: %s", (uint8_t *)v36, 0x20u);
      uint64_t v40 = v41[0];
      swift_arrayDestroy();
      MEMORY[0x24C5D05E0](v40, -1, -1);
      MEMORY[0x24C5D05E0](v36, -1, -1);

      (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v32);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v32);
    }
  }
  return 0;
}

uint64_t sub_24A79CDCC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

id *AmbientConfigurationManager.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t AmbientConfigurationManager.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t AmbientConfigurationManager.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24A79CED0()
{
  if (qword_26B17AEA0 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_24A79CF2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for AmbientConfigurationManager();
  return MEMORY[0x270FA2150](v3, a2);
}

id sub_24A79CF64(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_24A7B37A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_24A7B37A8();
    swift_bridgeObjectRelease();
    if (v5 == v29) {
      goto LABEL_5;
    }
LABEL_49:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  if (v5 != *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_49;
  }
LABEL_5:
  if (!v5) {
    goto LABEL_38;
  }
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0) {
    uint64_t v6 = v3;
  }
  if (!v4) {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  }
  uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v9 = a2;
  }
  else {
    uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v8 = v9;
  }
  if (v6 == v8)
  {
LABEL_38:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_55;
  }
  unint64_t v30 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0) {
    goto LABEL_56;
  }
  for (id result = *(id *)(v3 + 32); ; id result = (id)MEMORY[0x24C5CFAE0](0, v3))
  {
    os_log_type_t v11 = result;
    if ((a2 & 0xC000000000000001) == 0) {
      break;
    }
    id v12 = (id)MEMORY[0x24C5CFAE0](0, a2);
LABEL_22:
    uint64_t v13 = v12;
    sub_24A787494(0, (unint64_t *)&unk_26B17A3B0);
    char v14 = sub_24A7B35E8();

    if ((v14 & 1) == 0) {
      goto LABEL_49;
    }
    unint64_t v15 = v5 - 1;
    if (v5 == 1) {
      return (id)(v5 & 1);
    }
    if (((a2 | v3) & 0xC000000000000001) != 0)
    {
      uint64_t v16 = 0;
      unint64_t v17 = v5 - 2;
      while (v15 != v16)
      {
        unint64_t v5 = v16 + 1;
        if (v30) {
          id v18 = (id)MEMORY[0x24C5CFAE0](v16 + 1, v3);
        }
        else {
          id v18 = *(id *)(v3 + 40 + 8 * v16);
        }
        id v19 = v18;
        if ((a2 & 0xC000000000000001) != 0)
        {
          id v20 = (id)MEMORY[0x24C5CFAE0](v16 + 1, a2);
        }
        else
        {
          if (v5 >= *(void *)(v7 + 16)) {
            goto LABEL_54;
          }
          id v20 = *(id *)(a2 + 40 + 8 * v16);
        }
        uint64_t v21 = v20;
        unint64_t v5 = sub_24A7B35E8();

        if ((v5 & 1) != 0 && v17 != v16++) {
          continue;
        }
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      unint64_t v23 = *(void *)(v7 + 16);
      if (v23 <= 1) {
        unint64_t v23 = 1;
      }
      unint64_t v24 = v23 - 1;
      uint64_t v25 = (void **)(v3 + 40);
      uint64_t v7 = a2 + 40;
      while (v15)
      {
        if (!v24) {
          goto LABEL_53;
        }
        uint64_t v27 = *v25++;
        id v26 = v27;
        id v28 = *(void **)v7;
        v7 += 8;
        a2 = v26;
        uint64_t v3 = v28;
        unint64_t v5 = sub_24A7B35E8();

        if (v5)
        {
          --v24;
          if (--v15) {
            continue;
          }
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    ;
  }
  if (*(void *)(v7 + 16))
  {
    id v12 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

unint64_t sub_24A79D254()
{
  unint64_t result = qword_2697BA2D8;
  if (!qword_2697BA2D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA2D8);
  }
  return result;
}

uint64_t method lookup function for AmbientConfigurationManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AmbientConfigurationManager);
}

uint64_t dispatch thunk of AmbientConfigurationManager.register(observer:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of AmbientConfigurationManager.readStacks()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of AmbientConfigurationManager.write(stacks:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

void *initializeBufferWithCopyOfBuffer for AmbientConfigurationManager.Error(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AmbientConfigurationManager.Error()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AmbientConfigurationManager.Error(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for AmbientConfigurationManager.Error(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AmbientConfigurationManager.Error(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AmbientConfigurationManager.Error(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AmbientConfigurationManager.Error()
{
  return &type metadata for AmbientConfigurationManager.Error;
}

uint64_t sub_24A79D4A0()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24A7852C4;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_24A79BB70, v2, 0);
}

uint64_t sub_24A79D548()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A79D580()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_24A79D590(void *a1)
{
  return sub_24A79C5FC(a1);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_24A79D5B0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24A79D5F0(void *a1)
{
  return sub_24A79C964(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_24A79D5FC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A79D634(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24A786034;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2697BA310 + dword_2697BA310);
  return v6(a1, v4);
}

uint64_t sub_24A79D6EC()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A79D724()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A79D75C(uint64_t a1)
{
  return sub_24A799E9C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24A79D764(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroy_3Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24A79D804(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24A786034;
  v5[5] = a1;
  v5[6] = v4;
  return MEMORY[0x270FA2498](sub_24A79A598, 0, 0);
}

uint64_t sub_24A79D8B4(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_24A79D994;
  return v5(v2 + 32);
}

uint64_t sub_24A79D994()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_24A79DAA8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24A7852C4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2697BA338 + dword_2697BA338);
  return v6(a1, v4);
}

uint64_t sub_24A79DB78()
{
  return MEMORY[0x263F8EE78];
}

uint64_t ATXSpotlightSuggestions.scores.getter()
{
  return swift_bridgeObjectRetain();
}

id sub_24A79DBCC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  sub_24A787494(0, a4);
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)sub_24A7B3408();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t ATXSpotlightSuggestions.topics.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ATXSpotlightSuggestions.sections.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ATXSpotlightSuggestions.createSections(fromServerResults:)()
{
  return MEMORY[0x263F8EE78];
}

void __swiftcall ATXSpotlightSuggestions.init()(ATXSpotlightSuggestions *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

id ATXSpotlightSuggestions.init()()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)(v0 + OBJC_IVAR___ATXSpotlightSuggestions_scores) = MEMORY[0x263F8EE78];
  *(void *)(v0 + OBJC_IVAR___ATXSpotlightSuggestions_topics) = v1;
  *(void *)(v0 + OBJC_IVAR___ATXSpotlightSuggestions_sections) = v1;
  v3.super_class = (Class)ATXSpotlightSuggestions;
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for ATXSpotlightSuggestions(uint64_t a1)
{
  return sub_24A787494(a1, (unint64_t *)&unk_2697BB840);
}

void *sub_24A79DE38()
{
  return &unk_26528E680;
}

unint64_t disableAmbientRotationSuppressionDefaultsKey.getter()
{
  return 0xD000000000000021;
}

void *sub_24A79DE60()
{
  return &unk_26528E690;
}

unint64_t static AmbientDebugRotation.defaultsKey.getter()
{
  return 0xD000000000000014;
}

void *sub_24A79DE88()
{
  return &unk_26528E6A0;
}

unint64_t static AmbientDebugRotation.notificationName.getter()
{
  return 0xD000000000000039;
}

uint64_t AmbientDebugRotation.extensionBundleIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AmbientDebugRotation.kind.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AmbientDebugRotation.stackIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AmbientDebugRotation.allowsNewWidget.getter()
{
  return *(unsigned __int8 *)(v0 + 48);
}

void __swiftcall AmbientDebugRotation.init(extensionBundleIdentifier:kind:stackIdentifier:allowsNewWidget:)(ContextualSuggestionClient::AmbientDebugRotation *__return_ptr retstr, Swift::String extensionBundleIdentifier, Swift::String kind, Swift::String stackIdentifier, Swift::Bool allowsNewWidget)
{
  retstr->extensionBundleIdentifier = extensionBundleIdentifier;
  retstr->kind = kind;
  retstr->stackIdentifier = stackIdentifier;
  retstr->allowsNewWidget = allowsNewWidget;
}

BOOL sub_24A79DF5C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_24A79DF70()
{
  unint64_t result = 0xD000000000000019;
  switch(*v0)
  {
    case 1:
      unint64_t result = 1684957547;
      break;
    case 2:
      unint64_t result = 0x6564496B63617473;
      break;
    case 3:
      unint64_t result = 0x654E73776F6C6C61;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24A79E014@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24A79EB64(a1, a2);
  *a3 = result;
  return result;
}

void sub_24A79E03C(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_24A79E048(uint64_t a1)
{
  unint64_t v2 = sub_24A79E2F0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24A79E084(uint64_t a1)
{
  unint64_t v2 = sub_24A79E2F0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AmbientDebugRotation.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA380);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + 16);
  v15[2] = *(void *)(v1 + 24);
  v15[3] = v8;
  uint64_t v9 = *(void *)(v1 + 32);
  v15[0] = *(void *)(v1 + 40);
  v15[1] = v9;
  int v16 = *(unsigned __int8 *)(v1 + 48);
  uint64_t v10 = a1[3];
  os_log_type_t v11 = a1;
  uint64_t v13 = v12;
  __swift_project_boxed_opaque_existential_1(v11, v10);
  sub_24A79E2F0();
  sub_24A7B3968();
  char v20 = 0;
  sub_24A7B3848();
  if (!v2)
  {
    char v19 = 1;
    sub_24A7B3848();
    char v18 = 2;
    sub_24A7B3848();
    char v17 = 3;
    sub_24A7B3858();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v13);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24A79E2F0()
{
  unint64_t result = qword_2697BB850[0];
  if (!qword_2697BB850[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697BB850);
  }
  return result;
}

uint64_t AmbientDebugRotation.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA388);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24A79E2F0();
  sub_24A7B3958();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  char v29 = 0;
  uint64_t v9 = sub_24A7B3818();
  uint64_t v11 = v10;
  uint64_t v24 = v9;
  char v28 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_24A7B3818();
  uint64_t v25 = v13;
  uint64_t v23 = v12;
  char v27 = 2;
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_24A7B3818();
  uint64_t v22 = v14;
  char v26 = 3;
  swift_bridgeObjectRetain();
  char v16 = sub_24A7B3828();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  char v17 = v16 & 1;
  uint64_t v18 = v25;
  *(void *)a2 = v24;
  *(void *)(a2 + 8) = v11;
  uint64_t v19 = v22;
  *(void *)(a2 + 16) = v23;
  *(void *)(a2 + 24) = v18;
  *(void *)(a2 + 32) = v21;
  *(void *)(a2 + 40) = v19;
  *(unsigned char *)(a2 + 48) = v17;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A79E64C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AmbientDebugRotation.init(from:)(a1, a2);
}

uint64_t sub_24A79E664(void *a1)
{
  return AmbientDebugRotation.encode(to:)(a1);
}

uint64_t destroy for AmbientDebugRotation()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AmbientDebugRotation(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AmbientDebugRotation(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t assignWithTake for AmbientDebugRotation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for AmbientDebugRotation(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AmbientDebugRotation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AmbientDebugRotation()
{
  return &type metadata for AmbientDebugRotation;
}

uint64_t getEnumTagSinglePayload for AmbientDebugRotation.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AmbientDebugRotation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24A79EA1CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

unsigned char *sub_24A79EA44(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AmbientDebugRotation.CodingKeys()
{
  return &type metadata for AmbientDebugRotation.CodingKeys;
}

unint64_t sub_24A79EA60()
{
  unint64_t result = qword_2697BBA60[0];
  if (!qword_2697BBA60[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697BBA60);
  }
  return result;
}

unint64_t sub_24A79EAB8()
{
  unint64_t result = qword_2697BBB70;
  if (!qword_2697BBB70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BBB70);
  }
  return result;
}

unint64_t sub_24A79EB10()
{
  unint64_t result = qword_2697BBB78;
  if (!qword_2697BBB78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BBB78);
  }
  return result;
}

uint64_t sub_24A79EB64(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000019 && a2 == 0x800000024A7B7C50 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6564496B63617473 && a2 == 0xEF7265696669746ELL || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x654E73776F6C6C61 && a2 == 0xEF74656764695777)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = sub_24A7B3878();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

void *sub_24A79ED54()
{
  return &unk_26528E6B0;
}

unint64_t contextualEngineInternalMachServiceName.getter()
{
  return 0xD000000000000031;
}

uint64_t contextualEngineInternalInterface.getter()
{
  objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26FE464C8);
  sub_24A787494(0, (unint64_t *)&unk_26B17A3D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A400);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_24A7B5890;
  uint64_t v1 = sub_24A787494(0, &qword_2697BA390);
  *(void *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BA7B0);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_24A787494(0, (unint64_t *)&qword_2697BA5F0);
  *(void *)(v0 + 88) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BA7A0);
  *(void *)(v0 + 64) = v2;
  uint64_t v3 = type metadata accessor for ContextualSuggestionSnapshot();
  *(void *)(v0 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA398);
  *(void *)(v0 + 96) = v3;
  MEMORY[0x24C5CF980](v0);
  uint64_t result = sub_24A7B34B8();
  __break(1u);
  __break(1u);
  __break(1u);
  __break(1u);
  return result;
}

uint64_t sub_24A79F170()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___ATXWidgetStackSuggestion_stackIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

void *sub_24A79F1BC()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___ATXWidgetStackSuggestion_topWidget);
  id v2 = v1;
  return v1;
}

uint64_t sub_24A79F274()
{
  return swift_bridgeObjectRetain();
}

id sub_24A79F284(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  char v5 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  sub_24A787494(0, (unint64_t *)&qword_2697BA130);
  sub_24A791220();
  unsigned int v6 = (void *)sub_24A7B34A8();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_initWithStackIdentifier_topWidget_suggestedWidgets_, v5, a3, v6);

  return v7;
}

id sub_24A79F354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v5 = (void *)(v4 + OBJC_IVAR___ATXWidgetStackSuggestion_stackIdentifier);
  void *v5 = a1;
  v5[1] = a2;
  *(void *)(v4 + OBJC_IVAR___ATXWidgetStackSuggestion_topWidget) = a3;
  *(void *)(v4 + OBJC_IVAR___ATXWidgetStackSuggestion_suggestedWidgets) = a4;
  v7.super_class = (Class)ATXWidgetStackSuggestion;
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t ATXWidgetStackSuggestion.description.getter()
{
  uint64_t v1 = v0;
  sub_24A7B36D8();
  sub_24A7B33D8();
  id v2 = objc_msgSend(v0, sel_stackIdentifier);
  sub_24A7B3398();

  sub_24A7B33D8();
  swift_bridgeObjectRelease();
  sub_24A7B33D8();
  objc_msgSend(v1, sel_topWidget);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA3B8);
  sub_24A7B33A8();
  sub_24A7B33D8();
  swift_bridgeObjectRelease();
  sub_24A7B33D8();
  id v3 = objc_msgSend(v1, sel_suggestedWidgets);
  sub_24A787494(0, (unint64_t *)&qword_2697BA130);
  sub_24A791220();
  sub_24A7B34C8();

  sub_24A7B34D8();
  sub_24A7B33D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24A7B33D8();
  return 0;
}

void *sub_24A79F778()
{
  id v1 = objc_msgSend(v0, sel_topWidget);
  id v2 = v1;
  if (v1)
  {
    id v3 = objc_msgSend(v1, sel_identifier);

    id v2 = (void *)sub_24A7B3398();
  }
  return v2;
}

void __swiftcall ATXWidgetStackSuggestion.init()(ATXWidgetStackSuggestion *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void ATXWidgetStackSuggestion.init()()
{
}

uint64_t type metadata accessor for ATXWidgetStackSuggestion(uint64_t a1)
{
  return sub_24A787494(a1, qword_2697BBC00);
}

uint64_t sub_24A79F918()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_extensionBundleIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_24A79F960()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24A79F9BC()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_kind);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_24A79F9F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  uint64_t v10 = &v9[OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_extensionBundleIdentifier];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;
  uint64_t v11 = &v9[OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_kind];
  *(void *)uint64_t v11 = a3;
  *((void *)v11 + 1) = a4;
  v13.receiver = v9;
  v13.super_class = v4;
  return objc_msgSendSuper2(&v13, sel_init);
}

id sub_24A79FA78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v5 = &v4[OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_extensionBundleIdentifier];
  *(void *)char v5 = a1;
  *((void *)v5 + 1) = a2;
  unsigned int v6 = &v4[OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_kind];
  *(void *)unsigned int v6 = a3;
  *((void *)v6 + 1) = a4;
  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for WidgetPersonality();
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t type metadata accessor for WidgetPersonality()
{
  return self;
}

uint64_t sub_24A79FAF0(void *a1)
{
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_extensionBundleIdentifier);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_extensionBundleIdentifier + 8);
  id v5 = objc_msgSend(a1, sel_extensionBundleIdentifier);
  uint64_t v6 = sub_24A7B3398();
  uint64_t v8 = v7;

  if (v4 == v6 && v3 == v8)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v10 = sub_24A7B3878();
    swift_bridgeObjectRelease();
    char v11 = 0;
    if ((v10 & 1) == 0) {
      return v11 & 1;
    }
  }
  uint64_t v13 = *(void *)(v1 + OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_kind);
  uint64_t v12 = *(void *)(v1 + OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_kind + 8);
  id v14 = objc_msgSend(a1, sel_kind);
  uint64_t v15 = sub_24A7B3398();
  uint64_t v17 = v16;

  if (v13 == v15 && v12 == v17) {
    char v11 = 1;
  }
  else {
    char v11 = sub_24A7B3878();
  }
  swift_bridgeObjectRelease();
  return v11 & 1;
}

id sub_24A79FC78()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void sub_24A79FCAC()
{
}

id sub_24A79FD0C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WidgetPersonality();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24A79FD98(char a1)
{
  if (a1) {
    return 0x746E65746E69;
  }
  else {
    return 0x696669746E656469;
  }
}

uint64_t sub_24A79FDD0()
{
  return sub_24A79FD98(*v0);
}

uint64_t sub_24A79FDD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24A7A04CC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24A79FE00(uint64_t a1)
{
  unint64_t v2 = sub_24A7A0814();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24A79FE3C(uint64_t a1)
{
  unint64_t v2 = sub_24A7A0814();
  return MEMORY[0x270FA00B8](a1, v2);
}

id ContextualIntentSuggestion.intent.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualIntentSuggestion_intent);
}

id ContextualIntentSuggestion.__allocating_init(identifier:intent:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (char *)objc_allocWithZone(v3);
  *(void *)&v7[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualIntentSuggestion_intent] = a3;
  return ContextualSuggestion.init(identifier:)(a1, a2);
}

id ContextualIntentSuggestion.init(identifier:intent:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualIntentSuggestion_intent) = a3;
  return ContextualSuggestion.init(identifier:)(a1, a2);
}

uint64_t sub_24A79FEEC()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualIntentSuggestion_intent), sel_launchId);
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  uint64_t v3 = sub_24A7B3398();

  return v3;
}

uint64_t ContextualIntentSuggestion.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ContextualIntentSuggestion.init(coder:)(a1);
}

uint64_t ContextualIntentSuggestion.init(coder:)(void *a1)
{
  uint64_t v3 = sub_24A7B32F8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v27 - v8;
  sub_24A787494(0, (unint64_t *)&qword_2697BA5F0);
  id v10 = v1;
  uint64_t v11 = sub_24A7B35A8();
  if (!v11)
  {

    uint64_t v20 = sub_24A7AA57C();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v20, v3);
    uint64_t v21 = sub_24A7B32E8();
    os_log_type_t v22 = sub_24A7B34F8();
    if (!os_log_type_enabled(v21, v22))
    {
      uint64_t v7 = v9;
      goto LABEL_10;
    }
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl(&dword_24A77B000, v21, v22, "coder missing identifier", v23, 2u);
    uint64_t v7 = v9;
    goto LABEL_8;
  }
  uint64_t v12 = (void *)v11;
  uint64_t v13 = sub_24A7B3398();
  uint64_t v15 = v14;

  sub_24A787494(0, &qword_2697BA448);
  uint64_t v16 = sub_24A7B35A8();
  if (!v16)
  {
    swift_bridgeObjectRelease();

    uint64_t v24 = sub_24A7AA57C();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v24, v3);
    uint64_t v21 = sub_24A7B32E8();
    os_log_type_t v25 = sub_24A7B34F8();
    if (!os_log_type_enabled(v21, v25))
    {
LABEL_10:

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      swift_getObjectType();
      swift_deallocPartialClassInstance();
      return 0;
    }
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl(&dword_24A77B000, v21, v25, "coder missing intent", v23, 2u);
LABEL_8:
    MEMORY[0x24C5D05E0](v23, -1, -1);
    goto LABEL_10;
  }
  uint64_t v17 = v16;
  uint64_t ObjectType = swift_getObjectType();

  uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(ObjectType + 136))(v13, v15, v17);
  swift_deallocPartialClassInstance();
  return v19;
}

void sub_24A7A02FC(void *a1)
{
  sub_24A786598(a1);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualIntentSuggestion_intent);
  id v4 = (id)sub_24A7B3378();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);
}

void ContextualIntentSuggestion.__allocating_init(identifier:)()
{
}

void ContextualIntentSuggestion.init(identifier:)()
{
}

void sub_24A7A0478()
{
}

id ContextualIntentSuggestion.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContextualIntentSuggestion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24A7A04CC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E65746E69 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24A7B3878();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t type metadata accessor for ContextualIntentSuggestion()
{
  return self;
}

unint64_t sub_24A7A05E0()
{
  unint64_t result = qword_2697BA450;
  if (!qword_2697BA450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA450);
  }
  return result;
}

unint64_t sub_24A7A0638()
{
  unint64_t result = qword_2697BA458;
  if (!qword_2697BA458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA458);
  }
  return result;
}

unint64_t sub_24A7A0690()
{
  unint64_t result = qword_2697BA460;
  if (!qword_2697BA460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA460);
  }
  return result;
}

uint64_t method lookup function for ContextualIntentSuggestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ContextualIntentSuggestion);
}

uint64_t dispatch thunk of ContextualIntentSuggestion.__allocating_init(identifier:intent:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

unsigned char *storeEnumTagSinglePayload for ContextualIntentSuggestion.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24A7A07DCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContextualIntentSuggestion.CodingKeys()
{
  return &type metadata for ContextualIntentSuggestion.CodingKeys;
}

unint64_t sub_24A7A0814()
{
  unint64_t result = qword_2697BA468;
  if (!qword_2697BA468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2697BA468);
  }
  return result;
}

void *sub_24A7A0868()
{
  return &unk_26528E6C8;
}

unint64_t userDidExperienceAmbientDefaultsKey.getter()
{
  return 0xD000000000000018;
}

id sub_24A7A0890()
{
  return sub_24A7A08B4((SEL *)&selRef_ViewAppearance);
}

id sub_24A7A089C()
{
  return sub_24A7A08B4((SEL *)&selRef_StackRotation);
}

id sub_24A7A08A8()
{
  return sub_24A7A08B4((SEL *)&selRef_WidgetTap);
}

id sub_24A7A08B4(SEL *a1)
{
  id v2 = objc_msgSend((id)BiomeLibrary(), sel_SpringBoard);
  swift_unknownObjectRelease();
  id v3 = objc_msgSend(v2, sel_Domino);
  swift_unknownObjectRelease();
  id v4 = [v3 *a1];
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_24A7A0954()
{
  uint64_t v0 = sub_24A7B3518();
  MEMORY[0x270FA5388](v0);
  uint64_t v1 = sub_24A7B3348();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_24A7B3528();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A787494(0, (unint64_t *)&qword_2697BA170);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F138], v2);
  sub_24A7B3338();
  v7[1] = MEMORY[0x263F8EE78];
  sub_24A795374(&qword_2697BA178, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA180);
  sub_24A7953BC(&qword_2697BA188, &qword_2697BA180);
  sub_24A7B3638();
  return sub_24A7B3558();
}

id sub_24A7A0B94()
{
  sub_24A7B3398();
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v1 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  return v2;
}

uint64_t sub_24A7A0C18()
{
  uint64_t v0 = swift_allocObject();
  sub_24A7A0C50();
  return v0;
}

void *sub_24A7A0C50()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24A7B3518();
  MEMORY[0x270FA5388](v2);
  uint64_t v3 = sub_24A7B3348();
  MEMORY[0x270FA5388](v3 - 8);
  v22[0] = sub_24A7B3528();
  uint64_t v4 = *(void *)(v22[0] - 8);
  MEMORY[0x270FA5388](v22[0]);
  unsigned int v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend((id)BiomeLibrary(), sel_SpringBoard);
  swift_unknownObjectRelease();
  id v8 = objc_msgSend(v7, sel_Domino);
  swift_unknownObjectRelease();
  id v9 = objc_msgSend(v8, sel_ViewAppearance);
  swift_unknownObjectRelease();
  v0[2] = v9;
  id v10 = objc_msgSend((id)BiomeLibrary(), sel_SpringBoard);
  swift_unknownObjectRelease();
  id v11 = objc_msgSend(v10, sel_Domino);
  swift_unknownObjectRelease();
  id v12 = objc_msgSend(v11, sel_StackRotation);
  swift_unknownObjectRelease();
  v0[3] = v12;
  id v13 = objc_msgSend((id)BiomeLibrary(), sel_SpringBoard);
  swift_unknownObjectRelease();
  id v14 = objc_msgSend(v13, sel_Domino);
  swift_unknownObjectRelease();
  id v15 = objc_msgSend(v14, sel_WidgetTap);
  swift_unknownObjectRelease();
  v0[4] = v15;
  sub_24A787494(0, (unint64_t *)&qword_2697BA170);
  (*(void (**)(char *, void, void))(v4 + 104))(v6, *MEMORY[0x263F8F138], v22[0]);
  sub_24A7B3338();
  v22[1] = MEMORY[0x263F8EE78];
  sub_24A795374(&qword_2697BA178, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA180);
  sub_24A7953BC(&qword_2697BA188, &qword_2697BA180);
  sub_24A7B3638();
  v0[5] = sub_24A7B3558();
  sub_24A7B3398();
  id v16 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v17 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(v16, sel_initWithSuiteName_, v17);

  v1[6] = v18;
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = (void *)sub_24A7B3378();
    objc_msgSend(v19, sel_removeObjectForKey_, v20);
  }
  return v1;
}

uint64_t sub_24A7A10B4()
{
  uint64_t v1 = sub_24A7B3318();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = sub_24A7B3348();
  uint64_t v5 = *(void *)(v13[0] - 8);
  MEMORY[0x270FA5388](v13[0]);
  id v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = *(void **)(v0 + 48);
  if (v8)
  {
    id v9 = (void *)sub_24A7B3468();
    id v10 = (void *)sub_24A7B3378();
    objc_msgSend(v8, sel_setValue_forKey_, v9, v10);
  }
  aBlock[4] = sub_24A7A1394;
  aBlock[5] = v0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A792CE8;
  aBlock[3] = &block_descriptor_2;
  id v11 = _Block_copy(aBlock);
  swift_retain();
  sub_24A7B3338();
  v13[1] = MEMORY[0x263F8EE78];
  sub_24A795374(&qword_2697BA198, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1A0);
  sub_24A7953BC(&qword_2697BA1A8, &qword_2697BA1A0);
  sub_24A7B3638();
  MEMORY[0x24C5CF930](0, v7, v4, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, void))(v5 + 8))(v7, v13[0]);
  return swift_release();
}

void sub_24A7A1394()
{
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_24A7A13B4()
{
  uint64_t v1 = sub_24A7B3318();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24A7B3348();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = *(void *)(v0 + 40);
  aBlock[4] = sub_24A7A1644;
  uint64_t v13 = v0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A792CE8;
  aBlock[3] = &block_descriptor_3;
  id v9 = _Block_copy(aBlock);
  swift_retain();
  sub_24A7B3338();
  v11[1] = MEMORY[0x263F8EE78];
  sub_24A795374(&qword_2697BA198, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1A0);
  sub_24A7953BC(&qword_2697BA1A8, &qword_2697BA1A0);
  sub_24A7B3638();
  MEMORY[0x24C5CF930](0, v8, v4, v9);
  _Block_release(v9);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return swift_release();
}

void sub_24A7A1644()
{
}

void sub_24A7A164C()
{
  id v3 = objc_msgSend(*(id *)(v0 + 16), sel_source);
  sub_24A787494(0, &qword_2697BA378);
  uint64_t v1 = (void *)sub_24A7B35C8();
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A540]), sel_initWithStarting_, v1);

  objc_msgSend(v3, sel_sendEvent_, v2);
}

uint64_t sub_24A7A1708(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A390);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24A7B3498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = (void *)swift_allocObject();
  void v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = v1;
  id v8 = a1;
  swift_retain();
  sub_24A79A8AC((uint64_t)v5, (uint64_t)&unk_2697BA478, (uint64_t)v7);
  return swift_release();
}

uint64_t sub_24A7A180C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[9] = a4;
  v5[10] = a5;
  uint64_t v6 = sub_24A7B3318();
  v5[11] = v6;
  v5[12] = *(void *)(v6 - 8);
  v5[13] = swift_task_alloc();
  uint64_t v7 = sub_24A7B3348();
  v5[14] = v7;
  v5[15] = *(void *)(v7 - 8);
  v5[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A7A1928, 0, 0);
}

uint64_t sub_24A7A1928()
{
  uint64_t v1 = sub_24A799800();
  uint64_t v2 = *v1;
  v0[17] = *v1;
  uint64_t v3 = (*(void *)v2 + 240) & 0xFFFFFFFFFFFFLL | 0x563E000000000000;
  v0[18] = *(void *)(*(void *)v2 + 240);
  v0[19] = v3;
  swift_retain();
  return MEMORY[0x270FA2498](sub_24A7A19BC, v2, 0);
}

uint64_t sub_24A7A19BC()
{
  *(void *)(v0 + 160) = (*(uint64_t (**)(void))(v0 + 144))();
  *(void *)(v0 + 168) = 0;
  swift_release();
  return MEMORY[0x270FA2498](sub_24A7A1A5C, 0, 0);
}

uint64_t sub_24A7A1A5C()
{
  unint64_t v1 = v0[20];
  if (v1)
  {
    id v2 = (id)v0[9];
    uint64_t v3 = sub_24A7A2E34(v1, v2);
    swift_bridgeObjectRelease();

    if (v3)
    {
      id v4 = objc_msgSend(v3, sel_identifier);

      uint64_t v3 = (void *)sub_24A7B3398();
      uint64_t v6 = v5;

      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v6 = 0;
LABEL_6:
  uint64_t v7 = v0[16];
  uint64_t v8 = v0[13];
  uint64_t v18 = v0[15];
  uint64_t v19 = v0[14];
  uint64_t v9 = v0[11];
  uint64_t v10 = v0[12];
  id v11 = (void *)v0[9];
  uint64_t v12 = v0[10];
  uint64_t v13 = (void *)swift_allocObject();
  void v13[2] = v12;
  v13[3] = v11;
  void v13[4] = v3;
  v13[5] = v6;
  v0[6] = sub_24A7A3690;
  v0[7] = v13;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_24A792CE8;
  v0[5] = &block_descriptor_26;
  id v14 = _Block_copy(v0 + 2);
  id v15 = v11;
  swift_retain();
  sub_24A7B3338();
  v0[8] = MEMORY[0x263F8EE78];
  sub_24A795374(&qword_2697BA198, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1A0);
  sub_24A7953BC(&qword_2697BA1A8, &qword_2697BA1A0);
  sub_24A7B3638();
  MEMORY[0x24C5CF930](0, v7, v8, v14);
  _Block_release(v14);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v7, v19);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  id v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_24A7A1CF0()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[13];
  uint64_t v12 = v0[15];
  uint64_t v13 = v0[14];
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[12];
  uint64_t v5 = (void *)v0[9];
  uint64_t v6 = v0[10];
  uint64_t v7 = (void *)swift_allocObject();
  void v7[2] = v6;
  v7[3] = v5;
  v7[4] = 0;
  v7[5] = 0;
  v0[6] = sub_24A7A3690;
  v0[7] = v7;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_24A792CE8;
  v0[5] = &block_descriptor_26;
  uint64_t v8 = _Block_copy(v0 + 2);
  id v9 = v5;
  swift_retain();
  sub_24A7B3338();
  v0[8] = MEMORY[0x263F8EE78];
  sub_24A795374(&qword_2697BA198, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1A0);
  sub_24A7953BC(&qword_2697BA1A8, &qword_2697BA1A0);
  sub_24A7B3638();
  MEMORY[0x24C5CF930](0, v1, v2, v8);
  _Block_release(v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v13);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_24A7A1F0C()
{
  swift_unknownObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24A7A1F54()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24A7852C4;
  return sub_24A7A180C((uint64_t)v4, v5, v6, v2, v3);
}

id sub_24A7A1FEC(void *a1)
{
  v42[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_24A7B32F8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(a1, sel_chsWidget);
  id v7 = objc_msgSend(v6, sel_intentReference);

  if (v7)
  {
    id v8 = objc_msgSend(v7, sel_intent);

    if (v8)
    {
      id v9 = self;
      v42[0] = 0;
      id v10 = objc_msgSend(v9, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v8, 1, v42);
      id v11 = v42[0];
      if (v10)
      {
        id v7 = (id)sub_24A7B3218();
        unint64_t v13 = v12;

        goto LABEL_11;
      }
      uint64_t v14 = v11;
      uint64_t v15 = sub_24A7B31F8();

      swift_willThrow();
      uint64_t v16 = sub_24A796BD0();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v16, v2);
      uint64_t v17 = sub_24A7B32E8();
      uint64_t v18 = sub_24A7B34F8();
      if (os_log_type_enabled(v17, (os_log_type_t)v18))
      {
        uint64_t v40 = (void *)v15;
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        uint64_t v39 = (void *)swift_slowAlloc();
        v42[0] = v39;
        *(_DWORD *)uint64_t v19 = 136315138;
        unint64_t v38 = v19 + 4;
        uint64_t v20 = sub_24A7B3998();
        uint64_t v41 = sub_24A78F4E0(v20, v21, (uint64_t *)v42);
        sub_24A7B3608();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24A77B000, v17, (os_log_type_t)v18, "%s: error archiving widget intent", v19, 0xCu);
        os_log_type_t v22 = v39;
        swift_arrayDestroy();
        MEMORY[0x24C5D05E0](v22, -1, -1);
        MEMORY[0x24C5D05E0](v19, -1, -1);
        uint64_t v23 = v40;
      }
      else
      {
        uint64_t v23 = (void *)v15;
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    id v7 = 0;
  }
  unint64_t v13 = 0xF000000000000000;
LABEL_11:
  id v24 = objc_msgSend(a1, sel_identifier);
  if (!v24)
  {
    sub_24A7B3398();
    id v24 = (id)sub_24A7B3378();
    swift_bridgeObjectRelease();
  }
  id v25 = objc_msgSend(a1, sel_chsWidget);
  id v26 = objc_msgSend(v25, sel_extensionIdentity);

  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA128);
  sub_24A7B32D8();
  uint64_t v27 = (void *)sub_24A7B3378();
  swift_endAccess();
  swift_bridgeObjectRelease();

  id v28 = objc_msgSend(a1, sel_chsWidget);
  id v29 = objc_msgSend(v28, sel_kind);

  if (!v29)
  {
    sub_24A7B3398();
    id v29 = (id)sub_24A7B3378();
    swift_bridgeObjectRelease();
  }
  id v30 = objc_msgSend(a1, sel_chsWidget);
  uint64_t v31 = (char *)objc_msgSend(v30, sel_extensionIdentity);

  uint64_t v32 = &v31[*MEMORY[0x263F31DA0]];
  swift_beginAccess();
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA138);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 48))(v32, 1, v33))
  {
    swift_endAccess();

    uint64_t v34 = 0;
  }
  else
  {
    sub_24A7B32D8();
    swift_endAccess();

    uint64_t v34 = (void *)sub_24A7B3378();
    swift_bridgeObjectRelease();
  }
  if (v13 >> 60 == 15)
  {
    os_log_type_t v35 = 0;
  }
  else
  {
    sub_24A7A3500((uint64_t)v7, v13);
    os_log_type_t v35 = (void *)sub_24A7B3208();
    sub_24A7A34EC((uint64_t)v7, v13);
  }
  id v36 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithUniqueId_extensionBundleId_kind_containerBundleId_intent_, v24, v27, v29, v34, v35);

  sub_24A7A34EC((uint64_t)v7, v13);
  return v36;
}

uint64_t sub_24A7A2598(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A390);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24A7B32F8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A787494(0, &qword_2697BA480);
  id v13 = a2;
  id v14 = sub_24A7A1FEC(v13);
  id v15 = v14;
  int v16 = 0;
  char v17 = 0;
  switch(a3)
  {
    case 0:
      goto LABEL_12;
    case 1:
      char v17 = 0;
      int v40 = 1;
      break;
    case 2:
      char v17 = 0;
      int v40 = 2;
      break;
    case 3:
      char v17 = 0;
      int v40 = 3;
      break;
    case 4:
      char v17 = 0;
      int v40 = 4;
      break;
    case 5:
      char v17 = 0;
      int v40 = 5;
      break;
    case 6:
      char v17 = 0;
      int v40 = 6;
      break;
    case 7:
      char v17 = 0;
      int v40 = 7;
      break;
    case 8:
      char v17 = 0;
      int v40 = 8;
      break;
    case 9:
      char v17 = 0;
      int v16 = 9;
LABEL_12:
      int v40 = v16;
      break;
    case 10:
      char v17 = 0;
      int v40 = 10;
      break;
    default:
      char v17 = 1;
      int v40 = 0;
      id v39 = v14;
      uint64_t v18 = sub_24A796BD0();
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v18, v9);
      uint64_t v19 = sub_24A7B32E8();
      uint64_t v20 = v9;
      os_log_type_t v21 = sub_24A7B34F8();
      if (os_log_type_enabled(v19, v21))
      {
        uint64_t v23 = swift_slowAlloc();
        unint64_t v38 = a1;
        id v24 = (uint8_t *)v23;
        uint64_t v25 = swift_slowAlloc();
        uint64_t v36 = v10;
        uint64_t v37 = v20;
        uint64_t v26 = v25;
        uint64_t v42 = a3;
        uint64_t v43 = v25;
        *(_DWORD *)id v24 = 136315138;
        os_log_type_t v35 = v24 + 4;
        type metadata accessor for ATXWidgetStackChangeReason(0);
        uint64_t v27 = sub_24A7B33A8();
        uint64_t v42 = sub_24A78F4E0(v27, v28, &v43);
        sub_24A7B3608();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24A77B000, v19, v21, "AmbientLogger: logging stack did change with unknown new reason: %s", v24, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5D05E0](v26, -1, -1);
        id v29 = v24;
        a1 = v38;
        MEMORY[0x24C5D05E0](v29, -1, -1);

        (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v37);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v20);
      }
      id v15 = v39;
      break;
  }
  uint64_t v30 = sub_24A7B3498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v8, 1, 1, v30);
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = 0;
  *(void *)(v31 + 24) = 0;
  *(void *)(v31 + 32) = v41;
  *(void *)(v31 + 40) = v15;
  *(void *)(v31 + 48) = a1;
  *(_DWORD *)(v31 + 56) = v40;
  *(unsigned char *)(v31 + 60) = v17;
  *(void *)(v31 + 64) = v13;
  id v32 = v13;
  swift_retain();
  id v33 = a1;
  sub_24A79A8AC((uint64_t)v8, (uint64_t)&unk_2697BA490, v31);
  return swift_release();
}

uint64_t sub_24A7A2A38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[12] = a7;
  v8[13] = a8;
  v8[10] = a5;
  v8[11] = a6;
  v8[9] = a4;
  uint64_t v9 = sub_24A7B3318();
  v8[14] = v9;
  v8[15] = *(void *)(v9 - 8);
  v8[16] = swift_task_alloc();
  uint64_t v10 = sub_24A7B3348();
  v8[17] = v10;
  v8[18] = *(void *)(v10 - 8);
  v8[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A7A2B5C, 0, 0);
}

uint64_t sub_24A7A2B5C()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[16];
  uint64_t v17 = v0[18];
  uint64_t v18 = v0[17];
  uint64_t v3 = v0[14];
  uint64_t v5 = v0[12];
  uint64_t v4 = (void *)v0[13];
  uint64_t v6 = (void *)v0[10];
  uint64_t v7 = (void *)v0[11];
  uint64_t v8 = v0[9];
  uint64_t v16 = v0[15];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = v6;
  *(void *)(v9 + 32) = v7;
  *(_DWORD *)(v9 + 40) = v5;
  *(unsigned char *)(v9 + 44) = BYTE4(v5) & 1;
  *(void *)(v9 + 48) = v4;
  v0[6] = sub_24A7A3344;
  v0[7] = v9;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_24A792CE8;
  v0[5] = &block_descriptor_15_0;
  uint64_t v10 = _Block_copy(v0 + 2);
  swift_retain();
  id v11 = v6;
  id v12 = v7;
  id v13 = v4;
  sub_24A7B3338();
  v0[8] = MEMORY[0x263F8EE78];
  sub_24A795374(&qword_2697BA198, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1A0);
  sub_24A7953BC(&qword_2697BA1A8, &qword_2697BA1A0);
  sub_24A7B3638();
  MEMORY[0x24C5CF930](0, v1, v2, v10);
  _Block_release(v10);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v2, v3);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v1, v18);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  id v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

id *sub_24A7A2D9C()
{
  return v0;
}

uint64_t sub_24A7A2DDC()
{
  return MEMORY[0x270FA0228](v0, 56, 7);
}

void *sub_24A7A2E34(unint64_t a1, void *a2)
{
  unint64_t v2 = a1;
  if (a1 >> 62)
  {
LABEL_33:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24A7B37A8();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      uint64_t v4 = 0;
      unint64_t v5 = v2 & 0xC000000000000001;
      unint64_t v30 = v2 + 32;
      unint64_t v31 = v2 & 0xC000000000000001;
      unint64_t v33 = v2;
      uint64_t v32 = v3;
      do
      {
        if (v5)
        {
          id v6 = (id)MEMORY[0x24C5CFAE0](v4, v2);
          BOOL v7 = __OFADD__(v4, 1);
          uint64_t v8 = v4 + 1;
          if (v7)
          {
LABEL_32:
            __break(1u);
            goto LABEL_33;
          }
        }
        else
        {
          id v6 = *(id *)(v30 + 8 * v4);
          BOOL v7 = __OFADD__(v4, 1);
          uint64_t v8 = v4 + 1;
          if (v7) {
            goto LABEL_32;
          }
        }
        os_log_type_t v35 = v6;
        id v9 = objc_msgSend(v6, sel_widgets);
        sub_24A787494(0, (unint64_t *)&qword_2697BA130);
        unint64_t v2 = sub_24A7B3418();

        uint64_t v34 = v8;
        if (v2 >> 62)
        {
          id v28 = a2;
          swift_bridgeObjectRetain();
          uint64_t v10 = sub_24A7B37A8();
          if (v10)
          {
LABEL_12:
            unint64_t v36 = v2;
            unint64_t v37 = v2 & 0xC000000000000001;
            uint64_t v12 = 4;
            do
            {
              uint64_t v13 = v12 - 4;
              if (v37)
              {
                id v14 = (id)MEMORY[0x24C5CFAE0](v12 - 4, v2);
                uint64_t v15 = v12 - 3;
                if (__OFADD__(v13, 1)) {
                  goto LABEL_31;
                }
              }
              else
              {
                id v14 = *(id *)(v2 + 8 * v12);
                uint64_t v15 = v12 - 3;
                if (__OFADD__(v13, 1))
                {
LABEL_31:
                  __break(1u);
                  goto LABEL_32;
                }
              }
              uint64_t v16 = v10;
              uint64_t v17 = v14;
              id v18 = objc_msgSend(v14, sel_identifier);
              uint64_t v19 = sub_24A7B3398();
              uint64_t v21 = v20;

              id v22 = objc_msgSend(a2, sel_identifier);
              uint64_t v23 = sub_24A7B3398();
              uint64_t v25 = v24;

              BOOL v26 = v19 == v23 && v21 == v25;
              if (v26)
              {

                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
LABEL_30:
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                return v35;
              }
              char v27 = sub_24A7B3878();

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v27)
              {

                goto LABEL_30;
              }
              ++v12;
              uint64_t v10 = v16;
              BOOL v26 = v15 == v16;
              unint64_t v2 = v36;
            }
            while (!v26);
          }
        }
        else
        {
          uint64_t v10 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
          id v11 = a2;
          swift_bridgeObjectRetain();
          if (v10) {
            goto LABEL_12;
          }
        }

        swift_bridgeObjectRelease_n();
        unint64_t v5 = v31;
        unint64_t v2 = v33;
        uint64_t v4 = v34;
      }
      while (v34 != v32);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_24A7A3138()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_24A7A3190()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 48);
  unint64_t v5 = *(unsigned int *)(v0 + 56) | ((unint64_t)*(unsigned __int8 *)(v0 + 60) << 32);
  uint64_t v6 = *(void *)(v0 + 64);
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *BOOL v7 = v1;
  v7[1] = sub_24A786034;
  return sub_24A7A2A38((uint64_t)v7, v8, v9, v2, v3, v4, v5, v6);
}

void type metadata accessor for ATXWidgetStackChangeReason(uint64_t a1)
{
}

uint64_t type metadata accessor for AmbientLogger()
{
  return self;
}

void type metadata accessor for BMSpringBoardDominoStackRotationReason(uint64_t a1)
{
}

void sub_24A7A32AC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_24A7A32F4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_24A7A3344()
{
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = *(void **)(v0 + 32);
  unsigned int v3 = *(_DWORD *)(v0 + 40);
  int v4 = *(unsigned __int8 *)(v0 + 44);
  unint64_t v5 = *(void **)(v0 + 48);
  id v17 = objc_msgSend(*(id *)(*(void *)(v0 + 16) + 24), sel_source);
  id v6 = objc_msgSend(v2, sel_identifier);
  sub_24A7B3398();

  objc_msgSend(v5, sel_isSuggestedWidget);
  BOOL v7 = (void *)sub_24A7B3468();
  id v8 = objc_msgSend(v5, sel_source);
  if (v8)
  {
    uint64_t v9 = v8;
    sub_24A7B3398();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = v1;
  uint64_t v13 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  if (v11)
  {
    id v14 = (void *)sub_24A7B3378();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v14 = 0;
  }
  if (v4) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = v3;
  }
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A538]), sel_initWithWidget_stackId_reason_newWidgetSuggestion_source_, v12, v13, v15, v7, v14);

  objc_msgSend(v17, sel_sendEvent_, v16);
}

uint64_t sub_24A7A34EC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24A791810(a1, a2);
  }
  return a1;
}

uint64_t sub_24A7A3500(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_24A7A3558()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A7A3590(uint64_t a1)
{
  int v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24A7852C4;
  id v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2697BA310 + dword_2697BA310);
  return v6(a1, v4);
}

uint64_t sub_24A7A3648()
{
  swift_release();

  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_24A7A3690()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = v0[5];
  id v6 = objc_msgSend(*(id *)(v0[2] + 32), sel_source);
  sub_24A787494(0, &qword_2697BA480);
  id v3 = sub_24A7A1FEC(v1);
  if (v2)
  {
    swift_bridgeObjectRetain();
    int v4 = (void *)sub_24A7B3378();
    swift_bridgeObjectRelease();
  }
  else
  {
    int v4 = 0;
  }
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A550]), sel_initWithWidget_stackId_, v3, v4);

  objc_msgSend(v6, sel_sendEvent_, v5);
}

void *sub_24A7A37A4()
{
  return &unk_24A7B5B10;
}

uint64_t static CHSWidgetFamilyMask.atx_systemSmall.getter()
{
  return 2;
}

void *sub_24A7A37B8()
{
  return &unk_24A7B5B18;
}

uint64_t static CHSWidgetFamilyMask.atx_systemMedium.getter()
{
  return 4;
}

void *sub_24A7A37CC()
{
  return &unk_24A7B5B20;
}

uint64_t static CHSWidgetFamilyMask.atx_systemLarge.getter()
{
  return 8;
}

void *sub_24A7A37E0()
{
  return &unk_24A7B5B28;
}

uint64_t static CHSWidgetFamilyMask.atx_systemExtraLarge.getter()
{
  return 16;
}

void *sub_24A7A37F4()
{
  return &unk_24A7B5B30;
}

void *sub_24A7A3800()
{
  return &unk_24A7B5B38;
}

void *sub_24A7A380C()
{
  return &unk_24A7B5B40;
}

uint64_t sub_24A7A3818()
{
  return 3;
}

void *sub_24A7A3820()
{
  return &unk_24A7B5B48;
}

uint64_t sub_24A7A382C()
{
  return 4;
}

void *sub_24A7A3834()
{
  return &unk_24A7B5B50;
}

void *sub_24A7A3840()
{
  return &unk_24A7B5B58;
}

void *sub_24A7A384C()
{
  return &unk_24A7B5B60;
}

BOOL sub_24A7A3858(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24A7A3868()
{
  return sub_24A7B3908();
}

uint64_t sub_24A7A3890()
{
  return sub_24A7B3918();
}

uint64_t sub_24A7A38D8(char *a1)
{
  uint64_t v4 = *(void *)&a1[OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_extensionBundleIdentifier];
  uint64_t v3 = *(void *)&a1[OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_extensionBundleIdentifier + 8];
  uint64_t v6 = *(void *)&a1[OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_kind];
  uint64_t v5 = *(void *)&a1[OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_kind + 8];
  if (sub_24A7B3398() == v4 && v7 == v3)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    char v9 = sub_24A7B3878();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0) {
      goto LABEL_13;
    }
  }
  id v10 = (id)ATXSpecialWidgetKindSiriSuggestions();
  uint64_t v11 = sub_24A7B3398();
  uint64_t v13 = v12;

  if (v11 == v6 && v13 == v5)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  char v15 = sub_24A7B3878();
  swift_bridgeObjectRelease();
  if (v15)
  {
LABEL_15:
    uint64_t v16 = (*(uint64_t (**)(void))(v1 + 80))(0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return v16;
  }
LABEL_13:
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return 0;
}

id sub_24A7A3A40(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA120);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA128);
  MEMORY[0x270FA5388](v7 - 8);
  id v8 = objc_allocWithZone(v2);
  switch(a1)
  {
    case 1:
      id v10 = (void *)ATXSpecialWidgetKindShortcutsSingle();
      uint64_t v9 = 2;
      break;
    case 2:
      id v10 = (void *)ATXSpecialWidgetKindShortcutsSingle();
      uint64_t v9 = 12;
      break;
    case 3:
      uint64_t v9 = 28;
      id v10 = (void *)ATXSpecialWidgetKindFiles();
      break;
    case 4:
      sub_24A7B3398();
      uint64_t v9 = 4;
      id v10 = (void *)ATXSpecialWidgetKindAppPredictions();
      break;
    default:
      sub_24A7B3398();
      uint64_t v9 = 14;
      id v10 = (void *)ATXSpecialWidgetKindSiriSuggestions();
      break;
  }
  id v11 = v10;
  sub_24A7B3398();

  sub_24A7B3588();
  sub_24A7B32C8();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA138);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v6, 1, 1, v12);
  uint64_t v13 = (void *)sub_24A7B3578();
  id v14 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  v17.receiver = v8;
  v17.super_class = v2;
  id v15 = objc_msgSendSuper2(&v17, sel_initWithExtensionIdentity_kind_supportedFamilies_intentType_, v13, v14, v9, 0);

  return v15;
}

id sub_24A7A3CF0(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA120);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA128);
  MEMORY[0x270FA5388](v7 - 8);
  switch(a1)
  {
    case 1:
      uint64_t v9 = (void *)ATXSpecialWidgetKindShortcutsSingle();
      uint64_t v8 = 2;
      break;
    case 2:
      uint64_t v9 = (void *)ATXSpecialWidgetKindShortcutsSingle();
      uint64_t v8 = 12;
      break;
    case 3:
      uint64_t v8 = 28;
      uint64_t v9 = (void *)ATXSpecialWidgetKindFiles();
      break;
    case 4:
      sub_24A7B3398();
      uint64_t v8 = 4;
      uint64_t v9 = (void *)ATXSpecialWidgetKindAppPredictions();
      break;
    default:
      sub_24A7B3398();
      uint64_t v8 = 14;
      uint64_t v9 = (void *)ATXSpecialWidgetKindSiriSuggestions();
      break;
  }
  id v10 = v9;
  sub_24A7B3398();

  sub_24A7B3588();
  sub_24A7B32C8();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA138);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
  uint64_t v12 = (void *)sub_24A7B3578();
  uint64_t v13 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  id v14 = (objc_class *)type metadata accessor for SpecialWidgetDescriptor();
  v17.receiver = v2;
  v17.super_class = v14;
  id v15 = objc_msgSendSuper2(&v17, sel_initWithExtensionIdentity_kind_supportedFamilies_intentType_, v12, v13, v8, 0);

  return v15;
}

id sub_24A7A3F98(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id sub_24A7A3FDC(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SpecialWidgetDescriptor();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_24A7A4074(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithExtensionIdentity_, a1);

  return v3;
}

void sub_24A7A40B8()
{
}

id sub_24A7A411C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v11 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v12 = (void *)sub_24A7B3378();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = objc_msgSend(objc_allocWithZone(v7), sel_initWithExtensionIdentity_kind_supportedFamilies_intentType_, a1, v11, a4, v12);

  return v13;
}

void sub_24A7A41DC()
{
}

id sub_24A7A4240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  uint64_t v11 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  if (a7)
  {
    id v13 = (void *)sub_24A7B3378();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v13 = 0;
  }
  id v14 = objc_msgSend(objc_allocWithZone(v8), sel_initWithExtensionBundleIdentifier_kind_supportedFamilies_intentType_, v11, v12, a5, v13);

  return v14;
}

void sub_24A7A4314()
{
}

id sub_24A7A4374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = v9;
  id v13 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  if (a4)
  {
    id v14 = (void *)sub_24A7B3378();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v14 = 0;
  }
  id v15 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  if (a9)
  {
    uint64_t v16 = (void *)sub_24A7B3378();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = objc_msgSend(objc_allocWithZone(v10), sel_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_supportedFamilies_intentType_, v13, v14, v15, a7, v16);

  return v17;
}

void sub_24A7A4484()
{
}

id sub_24A7A44E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  id v15 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v16 = (void *)sub_24A7B3378();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  id v18 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  if (a10)
  {
    uint64_t v19 = (void *)sub_24A7B3378();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = 0;
  }
  id v20 = objc_allocWithZone(v24);
  uint64_t v21 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  id v22 = objc_msgSend(v20, sel_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_displayName_intentType_supportedSizeClasses_widgetDescription_widgetVisibility_, v15, v16, v17, v18, v19, a11, v21, a14);

  return v22;
}

void sub_24A7A4658()
{
}

id sub_24A7A46B8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SpecialWidgetDescriptor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SpecialWidgetDescriptor()
{
  return self;
}

unint64_t sub_24A7A4714()
{
  unint64_t result = qword_2697BA4B0;
  if (!qword_2697BA4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA4B0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SpecialWidgetDescriptor.DescriptorType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SpecialWidgetDescriptor.DescriptorType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24A7A48C4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SpecialWidgetDescriptor.DescriptorType()
{
  return &type metadata for SpecialWidgetDescriptor.DescriptorType;
}

const char *sub_24A7A48FC()
{
  return "spotlight";
}

uint64_t static String.spotlight.getter()
{
  return 0x6867696C746F7073;
}

const char *sub_24A7A4924()
{
  return "ambient";
}

uint64_t static String.ambient.getter()
{
  return 0x746E6569626D61;
}

uint64_t sub_24A7A494C()
{
  return 7;
}

unint64_t sub_24A7A4954(char a1)
{
  unint64_t result = 0xD000000000000019;
  switch(a1)
  {
    case 1:
    case 2:
      return result;
    case 3:
      unint64_t result = 1684957547;
      break;
    case 4:
      unint64_t result = 0x746E65746E69;
      break;
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    case 6:
      unint64_t result = 0xD000000000000020;
      break;
    default:
      unint64_t result = 0x696669746E656469;
      break;
  }
  return result;
}

unint64_t sub_24A7A4A24()
{
  return sub_24A7A4954(*v0);
}

uint64_t sub_24A7A4A2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24A7A5A6C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24A7A4A54(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_24A7A4A60(uint64_t a1)
{
  unint64_t v2 = sub_24A7A6000();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24A7A4A9C(uint64_t a1)
{
  unint64_t v2 = sub_24A7A6000();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ContextualWidgetSuggestion.extensionBundleIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0
                 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ContextualWidgetSuggestion.kind.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind);
  swift_bridgeObjectRetain();
  return v1;
}

void *ContextualWidgetSuggestion.intent.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent);
  id v2 = v1;
  return v1;
}

void *ContextualWidgetSuggestion.scoreSpecification.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_scoreSpecification);
  id v2 = v1;
  return v1;
}

void *ContextualWidgetSuggestion.blendingClientModelSpecification.getter()
{
  uint64_t v1 = *(void **)(v0
                + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification);
  id v2 = v1;
  return v1;
}

id ContextualWidgetSuggestion.__allocating_init(identifier:extensionBundleIdentifier:containerBundleIdentifier:kind:intent:scoreSpecification:blendingClientModelSpecification:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  id v18 = (char *)objc_allocWithZone(v11);
  uint64_t v19 = &v18[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier];
  *(void *)uint64_t v19 = a3;
  *((void *)v19 + 1) = a4;
  id v20 = &v18[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_containerBundleIdentifier];
  *(void *)id v20 = a5;
  *((void *)v20 + 1) = a6;
  uint64_t v21 = &v18[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind];
  *(void *)uint64_t v21 = a7;
  *((void *)v21 + 1) = a8;
  *(void *)&v18[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent] = a9;
  *(void *)&v18[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_scoreSpecification] = a10;
  *(void *)&v18[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification] = a11;
  return ContextualSuggestion.init(identifier:)(a1, a2);
}

id ContextualWidgetSuggestion.init(identifier:extensionBundleIdentifier:containerBundleIdentifier:kind:intent:scoreSpecification:blendingClientModelSpecification:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v12 = (void *)(v11
                 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier);
  *uint64_t v12 = a3;
  v12[1] = a4;
  id v13 = (void *)(v11
                 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_containerBundleIdentifier);
  void *v13 = a5;
  v13[1] = a6;
  id v14 = (void *)(v11 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind);
  *id v14 = a7;
  v14[1] = a8;
  *(void *)(v11 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent) = a9;
  *(void *)(v11 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_scoreSpecification) = a10;
  *(void *)(v11
            + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification) = a11;
  return ContextualSuggestion.init(identifier:)(a1, a2);
}

uint64_t _s26ContextualSuggestionClient0a6WidgetB0C25containerBundleIdentifierSSSgvg_0()
{
  uint64_t v1 = *(void *)(v0
                 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_containerBundleIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ContextualWidgetSuggestion.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ContextualWidgetSuggestion.init(coder:)(a1);
}

uint64_t ContextualWidgetSuggestion.init(coder:)(void *a1)
{
  uint64_t v3 = sub_24A7B32F8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  BOOL v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  id v10 = (char *)&v42 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v42 - v11;
  sub_24A787494(0, (unint64_t *)&qword_2697BA5F0);
  id v13 = v1;
  uint64_t v14 = sub_24A7B35A8();
  if (!v14)
  {

    uint64_t v25 = sub_24A7AA57C();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v12, v25, v3);
    BOOL v26 = sub_24A7B32E8();
    os_log_type_t v27 = sub_24A7B34F8();
    if (!os_log_type_enabled(v26, v27))
    {
      BOOL v7 = v12;
      goto LABEL_19;
    }
    id v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v28 = 0;
    _os_log_impl(&dword_24A77B000, v26, v27, "coder missing identifier", v28, 2u);
    BOOL v7 = v12;
LABEL_18:
    MEMORY[0x24C5D05E0](v28, -1, -1);
    goto LABEL_19;
  }
  id v15 = (void *)v14;
  uint64_t v45 = sub_24A7B3398();
  uint64_t v17 = v16;

  uint64_t v18 = sub_24A7B35A8();
  if (!v18 || (uint64_t v19 = (void *)v18, v46 = 0, v47 = 0, sub_24A7B3388(), v19, (v20 = v47) == 0))
  {

    swift_bridgeObjectRelease();
    uint64_t v29 = sub_24A7AA57C();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v10, v29, v3);
    BOOL v26 = sub_24A7B32E8();
    os_log_type_t v30 = sub_24A7B34F8();
    if (!os_log_type_enabled(v26, v30))
    {
      BOOL v7 = v10;
      goto LABEL_19;
    }
    id v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v28 = 0;
    _os_log_impl(&dword_24A77B000, v26, v30, "coder missing extensionBundleIdentifier", v28, 2u);
    BOOL v7 = v10;
    goto LABEL_18;
  }
  uint64_t v21 = v46;
  uint64_t v22 = sub_24A7B35A8();
  uint64_t v44 = v21;
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    sub_24A7B3388();

    uint64_t v24 = v47;
    uint64_t v43 = v46;
  }
  else
  {
    uint64_t v43 = 0;
    uint64_t v24 = 0;
  }
  uint64_t v31 = sub_24A7B35A8();
  if (!v31 || (v32 = (void *)v31, uint64_t v46 = 0, v47 = 0, sub_24A7B3388(), v32, (v33 = v47) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    uint64_t v39 = sub_24A7AA57C();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v39, v3);
    BOOL v26 = sub_24A7B32E8();
    os_log_type_t v40 = sub_24A7B34F8();
    if (os_log_type_enabled(v26, v40))
    {
      id v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v28 = 0;
      _os_log_impl(&dword_24A77B000, v26, v40, "coder missing kind", v28, 2u);
      goto LABEL_18;
    }
LABEL_19:

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v34 = v46;
  sub_24A787494(0, &qword_2697BA448);
  uint64_t v42 = sub_24A7B35A8();
  sub_24A787494(0, &qword_2697BA4E8);
  uint64_t v35 = sub_24A7B35A8();
  sub_24A787494(0, &qword_2697BA4F0);
  uint64_t v36 = sub_24A7B35A8();
  uint64_t ObjectType = swift_getObjectType();

  uint64_t v38 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(ObjectType + 176))(v45, v17, v44, v20, v43, v24, v34, v33, v42, v36, v35);
  swift_deallocPartialClassInstance();
  return v38;
}

void sub_24A7A5348(void *a1)
{
  sub_24A786598(a1);
  uint64_t v3 = (void *)sub_24A7B3378();
  uint64_t v4 = (void *)sub_24A7B3378();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

  if (*(void *)(v1
                 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_containerBundleIdentifier
                 + 8))
    uint64_t v5 = sub_24A7B3378();
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = (void *)sub_24A7B3378();
  objc_msgSend(a1, sel_encodeObject_forKey_, v5, v6);
  swift_unknownObjectRelease();

  BOOL v7 = (void *)sub_24A7B3378();
  uint64_t v8 = (void *)sub_24A7B3378();
  objc_msgSend(a1, sel_encodeObject_forKey_, v7, v8);

  uint64_t v9 = *(void *)(v1 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent);
  id v10 = (void *)sub_24A7B3378();
  objc_msgSend(a1, sel_encodeObject_forKey_, v9, v10);

  uint64_t v11 = *(void *)(v1 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_scoreSpecification);
  uint64_t v12 = (void *)sub_24A7B3378();
  objc_msgSend(a1, sel_encodeObject_forKey_, v11, v12);

  uint64_t v13 = *(void *)(v1
                  + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification);
  id v14 = (id)sub_24A7B3378();
  objc_msgSend(a1, sel_encodeObject_forKey_, v13, v14);
}

uint64_t sub_24A7A5630()
{
  sub_24A7B36D8();
  sub_24A7B33D8();
  swift_bridgeObjectRetain();
  sub_24A7B33D8();
  swift_bridgeObjectRelease();
  sub_24A7B33D8();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA4F8);
  sub_24A7B33A8();
  sub_24A7B33D8();
  swift_bridgeObjectRelease();
  sub_24A7B33D8();
  swift_bridgeObjectRetain();
  sub_24A7B33D8();
  swift_bridgeObjectRelease();
  sub_24A7B33D8();
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA500);
  sub_24A7B33A8();
  sub_24A7B33D8();
  swift_bridgeObjectRelease();
  sub_24A7B33D8();
  id v2 = objc_retain(*(id *)(v0
                         + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_scoreSpecification));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA508);
  sub_24A7B33A8();
  sub_24A7B33D8();
  swift_bridgeObjectRelease();
  sub_24A7B33D8();
  id v3 = objc_retain(*(id *)(v0
                         + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA510);
  sub_24A7B33A8();
  sub_24A7B33D8();
  swift_bridgeObjectRelease();
  sub_24A7B33D8();
  return 0;
}

void ContextualWidgetSuggestion.__allocating_init(identifier:)()
{
}

void ContextualWidgetSuggestion.init(identifier:)()
{
}

void sub_24A7A5914()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  id v1 = *(void **)(v0
                + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification);
}

id ContextualWidgetSuggestion.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContextualWidgetSuggestion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24A7A5A6C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000024A7B7C50 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000024A7B8350 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x746E65746E69 && a2 == 0xE600000000000000 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024A7B8330 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000020 && a2 == 0x800000024A7B8300)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_24A7B3878();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t type metadata accessor for ContextualWidgetSuggestion()
{
  return self;
}

unint64_t sub_24A7A5D2C()
{
  unint64_t result = qword_2697BA518;
  if (!qword_2697BA518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA518);
  }
  return result;
}

unint64_t sub_24A7A5D84()
{
  unint64_t result = qword_2697BA520;
  if (!qword_2697BA520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA520);
  }
  return result;
}

unint64_t sub_24A7A5DDC()
{
  unint64_t result = qword_2697BA528;
  if (!qword_2697BA528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA528);
  }
  return result;
}

uint64_t method lookup function for ContextualWidgetSuggestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ContextualWidgetSuggestion);
}

uint64_t dispatch thunk of ContextualWidgetSuggestion.__allocating_init(identifier:extensionBundleIdentifier:containerBundleIdentifier:kind:intent:scoreSpecification:blendingClientModelSpecification:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t getEnumTagSinglePayload for ContextualWidgetSuggestion.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ContextualWidgetSuggestion.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24A7A5FC8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContextualWidgetSuggestion.CodingKeys()
{
  return &type metadata for ContextualWidgetSuggestion.CodingKeys;
}

unint64_t sub_24A7A6000()
{
  unint64_t result = qword_2697BA530;
  if (!qword_2697BA530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA530);
  }
  return result;
}

uint64_t sub_24A7A6054(uint64_t a1, uint64_t a2)
{
  return sub_24A7A6724(a1, a2) & 1;
}

uint64_t sub_24A7A6074@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24A7A6724(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24A7A60A0(uint64_t a1)
{
  unint64_t v2 = sub_24A7A6A04();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24A7A60DC(uint64_t a1)
{
  unint64_t v2 = sub_24A7A6A04();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ContextualSuggestionSnapshot.contexts.getter()
{
  return swift_bridgeObjectRetain();
}

id ContextualSuggestionSnapshot.__allocating_init(contexts:)(uint64_t a1)
{
  int v3 = (char *)objc_allocWithZone(v1);
  *(void *)&v3[OBJC_IVAR___ATXContextualSuggestionSnapshot_contexts] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id ContextualSuggestionSnapshot.init(contexts:)(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR___ATXContextualSuggestionSnapshot_contexts] = a1;
  v5.receiver = v1;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

id ContextualSuggestionSnapshot.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ContextualSuggestionSnapshot.init(coder:)(a1);
}

id ContextualSuggestionSnapshot.init(coder:)(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_24A7B32F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697B9E30);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_24A7B4BB0;
  *(void *)(v8 + 32) = sub_24A7824D4();
  *(void *)(v8 + 40) = type metadata accessor for ContextualSuggestionContext();
  id v9 = v1;
  sub_24A7B35B8();
  swift_bridgeObjectRelease();
  if (v22)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA550);
    if (swift_dynamicCast())
    {
      uint64_t v10 = v20;

      uint64_t v11 = (char *)objc_allocWithZone(ObjectType);
      *(void *)&v11[OBJC_IVAR___ATXContextualSuggestionSnapshot_contexts] = v10;
      v19.receiver = v11;
      v19.super_class = ObjectType;
      id v12 = objc_msgSendSuper2(&v19, sel_init);

      swift_getObjectType();
      swift_deallocPartialClassInstance();
      return v12;
    }
  }
  else
  {

    sub_24A782514((uint64_t)v21);
  }
  uint64_t v13 = sub_24A7AA57C();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
  id v14 = sub_24A7B32E8();
  os_log_type_t v15 = sub_24A7B34F8();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_24A77B000, v14, v15, "coder missing contexts", v16, 2u);
    MEMORY[0x24C5D05E0](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

void *sub_24A7A64D4()
{
  return &unk_24A7B5DB0;
}

uint64_t static ContextualSuggestionSnapshot.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall ContextualSuggestionSnapshot.encode(with:)(NSCoder with)
{
  type metadata accessor for ContextualSuggestionContext();
  unint64_t v2 = (void *)sub_24A7B3408();
  id v3 = (id)sub_24A7B3378();
  [(objc_class *)with.super.isa encodeObject:v2 forKey:v3];
}

id ContextualSuggestionSnapshot.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ContextualSuggestionSnapshot.init()()
{
}

id ContextualSuggestionSnapshot.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24A7A6724(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x73747865746E6F63 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24A7B3878();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24A7A67AC()
{
  return 0x73747865746E6F63;
}

unint64_t sub_24A7A67C8()
{
  unint64_t result = qword_2697BA558;
  if (!qword_2697BA558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA558);
  }
  return result;
}

unint64_t sub_24A7A6820()
{
  unint64_t result = qword_2697BA560;
  if (!qword_2697BA560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA560);
  }
  return result;
}

unint64_t sub_24A7A6878()
{
  unint64_t result = qword_2697BA568;
  if (!qword_2697BA568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA568);
  }
  return result;
}

uint64_t type metadata accessor for ContextualSuggestionSnapshot()
{
  return self;
}

uint64_t method lookup function for ContextualSuggestionSnapshot(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ContextualSuggestionSnapshot);
}

uint64_t dispatch thunk of ContextualSuggestionSnapshot.__allocating_init(contexts:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of ContextualSuggestionSnapshot.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

unsigned char *storeEnumTagSinglePayload for ContextualSuggestionSnapshot.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24A7A69CCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContextualSuggestionSnapshot.CodingKeys()
{
  return &type metadata for ContextualSuggestionSnapshot.CodingKeys;
}

unint64_t sub_24A7A6A04()
{
  unint64_t result = qword_2697BA578;
  if (!qword_2697BA578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA578);
  }
  return result;
}

uint64_t sub_24A7A6A5C(char a1)
{
  if (a1) {
    return 0x6E6F69746361;
  }
  else {
    return 0x696669746E656469;
  }
}

uint64_t sub_24A7A6A94()
{
  return sub_24A7A6A5C(*v0);
}

uint64_t sub_24A7A6A9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24A7A7190(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24A7A6AC4(uint64_t a1)
{
  unint64_t v2 = sub_24A7A74D8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24A7A6B00(uint64_t a1)
{
  unint64_t v2 = sub_24A7A74D8();
  return MEMORY[0x270FA00B8](a1, v2);
}

id ContextualActionSuggestion.action.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualActionSuggestion_action);
}

id ContextualActionSuggestion.__allocating_init(identifier:action:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v7 = (char *)objc_allocWithZone(v3);
  *(void *)&v7[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualActionSuggestion_action] = a3;
  return ContextualSuggestion.init(identifier:)(a1, a2);
}

id ContextualActionSuggestion.init(identifier:action:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualActionSuggestion_action) = a3;
  return ContextualSuggestion.init(identifier:)(a1, a2);
}

uint64_t sub_24A7A6BB0()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualActionSuggestion_action), sel_associatedAppBundleIdentifier);
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  uint64_t v3 = sub_24A7B3398();

  return v3;
}

uint64_t ContextualActionSuggestion.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ContextualActionSuggestion.init(coder:)(a1);
}

uint64_t ContextualActionSuggestion.init(coder:)(void *a1)
{
  uint64_t v3 = sub_24A7B32F8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  BOOL v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v27 - v8;
  sub_24A787494(0, (unint64_t *)&qword_2697BA5F0);
  id v10 = v1;
  uint64_t v11 = sub_24A7B35A8();
  if (!v11)
  {

    uint64_t v20 = sub_24A7AA57C();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v20, v3);
    uint64_t v21 = sub_24A7B32E8();
    os_log_type_t v22 = sub_24A7B34F8();
    if (!os_log_type_enabled(v21, v22))
    {
      BOOL v7 = v9;
      goto LABEL_10;
    }
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl(&dword_24A77B000, v21, v22, "coder missing identifier", v23, 2u);
    BOOL v7 = v9;
    goto LABEL_8;
  }
  id v12 = (void *)v11;
  uint64_t v13 = sub_24A7B3398();
  uint64_t v15 = v14;

  sub_24A787494(0, &qword_2697BA588);
  uint64_t v16 = sub_24A7B35A8();
  if (!v16)
  {
    swift_bridgeObjectRelease();

    uint64_t v24 = sub_24A7AA57C();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v24, v3);
    uint64_t v21 = sub_24A7B32E8();
    os_log_type_t v25 = sub_24A7B34F8();
    if (!os_log_type_enabled(v21, v25))
    {
LABEL_10:

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      swift_getObjectType();
      swift_deallocPartialClassInstance();
      return 0;
    }
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl(&dword_24A77B000, v21, v25, "coder missing action", v23, 2u);
LABEL_8:
    MEMORY[0x24C5D05E0](v23, -1, -1);
    goto LABEL_10;
  }
  uint64_t v17 = v16;
  uint64_t ObjectType = swift_getObjectType();

  uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(ObjectType + 136))(v13, v15, v17);
  swift_deallocPartialClassInstance();
  return v19;
}

void sub_24A7A6FC0(void *a1)
{
  sub_24A786598(a1);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualActionSuggestion_action);
  id v4 = (id)sub_24A7B3378();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);
}

void ContextualActionSuggestion.__allocating_init(identifier:)()
{
}

void ContextualActionSuggestion.init(identifier:)()
{
}

void sub_24A7A713C()
{
}

id ContextualActionSuggestion.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContextualActionSuggestion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24A7A7190(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F69746361 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24A7B3878();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t type metadata accessor for ContextualActionSuggestion()
{
  return self;
}

unint64_t sub_24A7A72A4()
{
  unint64_t result = qword_2697BA590;
  if (!qword_2697BA590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA590);
  }
  return result;
}

unint64_t sub_24A7A72FC()
{
  unint64_t result = qword_2697BA598;
  if (!qword_2697BA598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA598);
  }
  return result;
}

unint64_t sub_24A7A7354()
{
  unint64_t result = qword_2697BA5A0;
  if (!qword_2697BA5A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA5A0);
  }
  return result;
}

uint64_t method lookup function for ContextualActionSuggestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ContextualActionSuggestion);
}

uint64_t dispatch thunk of ContextualActionSuggestion.__allocating_init(identifier:action:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

unsigned char *storeEnumTagSinglePayload for ContextualActionSuggestion.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24A7A74A0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContextualActionSuggestion.CodingKeys()
{
  return &type metadata for ContextualActionSuggestion.CodingKeys;
}

unint64_t sub_24A7A74D8()
{
  unint64_t result = qword_2697BA5A8;
  if (!qword_2697BA5A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA5A8);
  }
  return result;
}

void *sub_24A7A752C()
{
  return &unk_26528E718;
}

unint64_t static WidgetRotationEvent.eventName.getter()
{
  return 0xD000000000000029;
}

uint64_t sub_24A7A7554()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24A7A7584()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24A7A75B4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24A7A75E4()
{
  return *(void *)(v0 + 48);
}

uint64_t sub_24A7A75EC()
{
  return *(void *)(v0 + 56);
}

void __swiftcall WidgetRotationEvent.init(extensionBundleId:kind:reason:rotations:widgetSuggestions:)(ContextualSuggestionClient::WidgetRotationEvent *__return_ptr retstr, Swift::String extensionBundleId, Swift::String kind, Swift::String reason, Swift::Int rotations, Swift::Int widgetSuggestions)
{
  retstr->extensionBundleId = extensionBundleId;
  retstr->kind = kind;
  retstr->reason = reason;
  retstr->rotations = rotations;
  retstr->widgetSuggestions = widgetSuggestions;
}

unint64_t sub_24A7A7608(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 1684957547;
      break;
    case 2:
      unint64_t result = 0x6E6F73616572;
      break;
    case 3:
      unint64_t result = 0x6E6F697461746F72;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24A7A76B0()
{
  return sub_24A7A7608(*v0);
}

uint64_t sub_24A7A76B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24A7A7EA8(a1, a2);
  *a3 = result;
  return result;
}

void sub_24A7A76E0(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_24A7A76EC(uint64_t a1)
{
  unint64_t v2 = sub_24A7A797C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24A7A7728(uint64_t a1)
{
  unint64_t v2 = sub_24A7A797C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WidgetRotationEvent.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA5B0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unsigned int v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v1[2];
  v12[5] = v1[3];
  v12[6] = v7;
  uint64_t v8 = v1[4];
  uint64_t v12[3] = v1[5];
  v12[4] = v8;
  uint64_t v9 = v1[6];
  v12[1] = v1[7];
  v12[2] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24A7A797C();
  sub_24A7B3968();
  char v17 = 0;
  uint64_t v10 = v12[7];
  sub_24A7B3848();
  if (!v10)
  {
    char v16 = 1;
    sub_24A7B3848();
    char v15 = 2;
    sub_24A7B3848();
    char v14 = 3;
    sub_24A7B3868();
    char v13 = 4;
    sub_24A7B3868();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24A7A797C()
{
  unint64_t result = qword_2697BC710[0];
  if (!qword_2697BC710[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697BC710);
  }
  return result;
}

unint64_t sub_24A7A79D0()
{
  return 0xD000000000000029;
}

unint64_t sub_24A7A79EC(uint64_t a1)
{
  unint64_t result = sub_24A7A7A14();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24A7A7A14()
{
  unint64_t result = qword_2697BA5B8;
  if (!qword_2697BA5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA5B8);
  }
  return result;
}

uint64_t sub_24A7A7A68(void *a1)
{
  return WidgetRotationEvent.encode(to:)(a1);
}

uint64_t initializeWithCopy for WidgetRotationEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for WidgetRotationEvent(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for WidgetRotationEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetRotationEvent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WidgetRotationEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetRotationEvent()
{
  return &type metadata for WidgetRotationEvent;
}

unsigned char *storeEnumTagSinglePayload for WidgetRotationEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *__n128 result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24A7A7D68);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetRotationEvent.CodingKeys()
{
  return &type metadata for WidgetRotationEvent.CodingKeys;
}

unint64_t sub_24A7A7DA4()
{
  unint64_t result = qword_2697BC920[0];
  if (!qword_2697BC920[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697BC920);
  }
  return result;
}

unint64_t sub_24A7A7DFC()
{
  unint64_t result = qword_2697BCA30;
  if (!qword_2697BCA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BCA30);
  }
  return result;
}

unint64_t sub_24A7A7E54()
{
  unint64_t result = qword_2697BCA38[0];
  if (!qword_2697BCA38[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697BCA38);
  }
  return result;
}

uint64_t sub_24A7A7EA8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000024A7B85E0 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F73616572 && a2 == 0xE600000000000000 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E6F697461746F72 && a2 == 0xE900000000000073 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024A7B8600)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v5 = sub_24A7B3878();
    swift_bridgeObjectRelease();
    if (v5) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

void *sub_24A7A80B4()
{
  return &unk_26528E728;
}

unint64_t static WidgetConfigurationEvent.eventName.getter()
{
  return 0xD00000000000002ELL;
}

void __swiftcall WidgetConfigurationEvent.init(extensionBundleId:kind:configurationIntentType:)(ContextualSuggestionClient::WidgetConfigurationEvent *__return_ptr retstr, Swift::String extensionBundleId, Swift::String kind, Swift::String_optional configurationIntentType)
{
  retstr->extensionBundleId = extensionBundleId;
  retstr->kind = kind;
  retstr->configurationIntentType = configurationIntentType;
}

unint64_t sub_24A7A80EC()
{
  unint64_t v1 = 1684957547;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000017;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD000000000000011;
  }
}

uint64_t sub_24A7A8144@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24A7A893C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24A7A816C(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24A7A8178(uint64_t a1)
{
  unint64_t v2 = sub_24A7A83A4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24A7A81B4(uint64_t a1)
{
  unint64_t v2 = sub_24A7A83A4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WidgetConfigurationEvent.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA5C0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unsigned int v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v1[2];
  v11[3] = v1[3];
  v11[4] = v7;
  uint64_t v8 = v1[4];
  v11[1] = v1[5];
  void v11[2] = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24A7A83A4();
  sub_24A7B3968();
  char v14 = 0;
  uint64_t v9 = v11[5];
  sub_24A7B3848();
  if (!v9)
  {
    char v13 = 1;
    sub_24A7B3848();
    char v12 = 2;
    sub_24A7B3838();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24A7A83A4()
{
  unint64_t result = qword_2697BCAC0[0];
  if (!qword_2697BCAC0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697BCAC0);
  }
  return result;
}

unint64_t sub_24A7A83F8()
{
  return 0xD00000000000002ELL;
}

unint64_t sub_24A7A8414(uint64_t a1)
{
  unint64_t result = sub_24A7A843C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24A7A843C()
{
  unint64_t result = qword_26B17AB38;
  if (!qword_26B17AB38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B17AB38);
  }
  return result;
}

uint64_t sub_24A7A8490(void *a1)
{
  return WidgetConfigurationEvent.encode(to:)(a1);
}

void *initializeWithCopy for WidgetConfigurationEvent(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for WidgetConfigurationEvent(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for WidgetConfigurationEvent(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetConfigurationEvent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WidgetConfigurationEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetConfigurationEvent()
{
  return &type metadata for WidgetConfigurationEvent;
}

uint64_t getEnumTagSinglePayload for WidgetConfigurationEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for WidgetConfigurationEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *__n128 result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24A7A87FCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetConfigurationEvent.CodingKeys()
{
  return &type metadata for WidgetConfigurationEvent.CodingKeys;
}

unint64_t sub_24A7A8838()
{
  unint64_t result = qword_2697BCBD0[0];
  if (!qword_2697BCBD0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697BCBD0);
  }
  return result;
}

unint64_t sub_24A7A8890()
{
  unint64_t result = qword_2697BCCE0;
  if (!qword_2697BCCE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BCCE0);
  }
  return result;
}

unint64_t sub_24A7A88E8()
{
  unint64_t result = qword_2697BCCE8[0];
  if (!qword_2697BCCE8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697BCCE8);
  }
  return result;
}

uint64_t sub_24A7A893C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000024A7B85E0 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000024A7B8650)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_24A7B3878();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *sub_24A7A8A7C()
{
  return &unk_26528E738;
}

unint64_t static SystemConfigurationEvent.eventName.getter()
{
  return 0xD00000000000002ELL;
}

uint64_t sub_24A7A8AA4()
{
  return *v0;
}

uint64_t sub_24A7A8AAC()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t sub_24A7A8AB4()
{
  return *(void *)(v0 + 8);
}

uint64_t sub_24A7A8ABC()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_24A7A8AC4()
{
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_24A7A8ACC()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_24A7A8AD4()
{
  return *(unsigned __int8 *)(v0 + 32);
}

void __swiftcall SystemConfigurationEvent.init(hasExperiencedUI:leadingStackSmartRotateEnabled:leadingStackWidgetCount:leadingStackWidgetSuggestionsEnabled:trailingStackSmartRotateEnabled:trailingStackWidgetCount:trailingStackWidgetSuggestionsEnabled:)(ContextualSuggestionClient::SystemConfigurationEvent *__return_ptr retstr, Swift::Bool hasExperiencedUI, Swift::Bool leadingStackSmartRotateEnabled, Swift::Int leadingStackWidgetCount, Swift::Bool leadingStackWidgetSuggestionsEnabled, Swift::Bool trailingStackSmartRotateEnabled, Swift::Int trailingStackWidgetCount, Swift::Bool trailingStackWidgetSuggestionsEnabled)
{
  retstr->hasExperiencedUI = hasExperiencedUI;
  retstr->leadingStackSmartRotateEnabled = leadingStackSmartRotateEnabled;
  retstr->leadingStackWidgetCount = leadingStackWidgetCount;
  retstr->leadingStackWidgetSuggestionsEnabled = leadingStackWidgetSuggestionsEnabled;
  retstr->trailingStackSmartRotateEnabled = trailingStackSmartRotateEnabled;
  retstr->trailingStackWidgetCount = trailingStackWidgetCount;
  retstr->trailingStackWidgetSuggestionsEnabled = trailingStackWidgetSuggestionsEnabled;
}

unint64_t sub_24A7A8AFC(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 2:
      unint64_t result = 0xD000000000000017;
      break;
    case 3:
      unint64_t result = 0xD000000000000024;
      break;
    case 4:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000018;
      break;
    case 6:
      unint64_t result = 0xD000000000000025;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24A7A8BC0()
{
  return sub_24A7A8AFC(*v0);
}

uint64_t sub_24A7A8BC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24A7A92A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24A7A8BF0(uint64_t a1)
{
  unint64_t v2 = sub_24A7A8ED0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24A7A8C2C(uint64_t a1)
{
  unint64_t v2 = sub_24A7A8ED0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SystemConfigurationEvent.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA5C8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v15 = *(unsigned __int8 *)(v1 + 1);
  uint64_t v14 = *(void *)(v1 + 8);
  int v8 = *(unsigned __int8 *)(v1 + 16);
  int v12 = *(unsigned __int8 *)(v1 + 17);
  int v13 = v8;
  uint64_t v11 = *(void *)(v1 + 24);
  v10[3] = *(unsigned __int8 *)(v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24A7A8ED0();
  sub_24A7B3968();
  char v22 = 0;
  sub_24A7B3858();
  if (!v2)
  {
    char v21 = 1;
    sub_24A7B3858();
    char v20 = 2;
    sub_24A7B3868();
    char v19 = 3;
    sub_24A7B3858();
    char v18 = 4;
    sub_24A7B3858();
    char v17 = 5;
    sub_24A7B3868();
    char v16 = 6;
    sub_24A7B3858();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_24A7A8ED0()
{
  unint64_t result = qword_2697BCD70[0];
  if (!qword_2697BCD70[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697BCD70);
  }
  return result;
}

unint64_t sub_24A7A8F24()
{
  return 0xD00000000000002ELL;
}

unint64_t sub_24A7A8F40(uint64_t a1)
{
  unint64_t result = sub_24A7A8F68();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24A7A8F68()
{
  unint64_t result = qword_26B17A410;
  if (!qword_26B17A410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B17A410);
  }
  return result;
}

uint64_t sub_24A7A8FBC(void *a1)
{
  return SystemConfigurationEvent.encode(to:)(a1);
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for SystemConfigurationEvent(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[33]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SystemConfigurationEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemConfigurationEvent()
{
  return &type metadata for SystemConfigurationEvent;
}

unsigned char *storeEnumTagSinglePayload for SystemConfigurationEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *__n128 result = a2 + 6;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24A7A9160);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemConfigurationEvent.CodingKeys()
{
  return &type metadata for SystemConfigurationEvent.CodingKeys;
}

unint64_t sub_24A7A919C()
{
  unint64_t result = qword_2697BCE80[0];
  if (!qword_2697BCE80[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697BCE80);
  }
  return result;
}

unint64_t sub_24A7A91F4()
{
  unint64_t result = qword_2697BCF90;
  if (!qword_2697BCF90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BCF90);
  }
  return result;
}

unint64_t sub_24A7A924C()
{
  unint64_t result = qword_2697BCF98[0];
  if (!qword_2697BCF98[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697BCF98);
  }
  return result;
}

uint64_t sub_24A7A92A0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000024A7B86A0 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001ELL && a2 == 0x800000024A7B86C0 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000024A7B86E0 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000024 && a2 == 0x800000024A7B8700 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001FLL && a2 == 0x800000024A7B8730 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000024A7B8750 || (sub_24A7B3878() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000025 && a2 == 0x800000024A7B8770)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v5 = sub_24A7B3878();
    swift_bridgeObjectRelease();
    if (v5) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t sub_24A7A9544()
{
  return swift_retain();
}

uint64_t sub_24A7A9588()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA5D0);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 16) = 0;
  return result;
}

uint64_t sub_24A7A95BC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 112))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_24A7A9608(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 120);
  uint64_t v4 = swift_unknownObjectRetain();
  return v3(v4, v2);
}

id sub_24A7A966C@<X0>(void **a1@<X0>, void **a2@<X8>)
{
  uint64_t v2 = *a1;
  *a2 = *a1;
  return v2;
}

uint64_t sub_24A7A969C()
{
  swift_beginAccess();
  return MEMORY[0x24C5D0680](v0 + 48);
}

void sub_24A7A96E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_beginAccess();
  *(void *)(v3 + 56) = a2;
  swift_unknownObjectWeakAssign();
  char v5 = *(os_unfair_lock_s **)(v3 + 40);
  unsigned int v6 = (void **)&v5[4];
  BOOL v7 = v5 + 6;
  os_unfair_lock_lock(v5 + 6);
  sub_24A7A966C(v6, &v11);
  os_unfair_lock_unlock(v7);
  int v8 = v11;
  if (v11)
  {
    if (MEMORY[0x24C5D0680](v3 + 48))
    {
      uint64_t v9 = *(void *)(v3 + 56);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v9 + 8))(v3, v8, ObjectType, v9);
      swift_unknownObjectRelease();

      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  else
  {
    swift_unknownObjectRelease();
  }
}

void (*sub_24A7A97F0(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x24C5D0680](v1 + 48);
  uint64_t v5 = *(void *)(v1 + 56);
  v3[3] = v4;
  v3[4] = v5;
  return sub_24A7A9870;
}

void sub_24A7A9870(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + 56) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    uint64_t v4 = v3[5];
    swift_endAccess();
    swift_unknownObjectRelease();
    uint64_t v5 = *(os_unfair_lock_s **)(v4 + 40);
    unsigned int v6 = (void **)&v5[4];
    BOOL v7 = v5 + 6;
    os_unfair_lock_lock(v5 + 6);
    sub_24A7A966C(v6, &v12);
    os_unfair_lock_unlock(v7);
    int v8 = v12;
    if (v12)
    {
      if (MEMORY[0x24C5D0680](v3[5] + 48))
      {
        uint64_t v9 = v3[5];
        uint64_t v10 = *(void *)(v9 + 56);
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v10 + 8))(v9, v8, ObjectType, v10);
        swift_unknownObjectRelease();
      }
    }
  }
  free(v3);
}

uint64_t ContextualSuggestionProvider.__allocating_init(endpoint:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  ContextualSuggestionProvider.init(endpoint:)(a1, a2);
  return v4;
}

void *ContextualSuggestionProvider.init(endpoint:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24A7B32F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24A791CC4();
  swift_beginAccess();
  uint64_t v11 = *v10;
  v3[4] = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA5D0);
  uint64_t v12 = swift_allocObject();
  *(_DWORD *)(v12 + 24) = 0;
  *(void *)(v12 + 16) = 0;
  v3[5] = v12;
  v3[7] = 0;
  swift_unknownObjectWeakInit();
  v3[2] = a1;
  v3[3] = a2;
  int v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v11 + 224);
  swift_retain_n();
  swift_bridgeObjectRetain();
  uint64_t v14 = swift_retain();
  v13(v14, a1, a2);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_24A7AA57C();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v15, v6);
  char v16 = sub_24A7B32E8();
  os_log_type_t v17 = sub_24A7B3508();
  if (os_log_type_enabled(v16, v17))
  {
    v23[0] = v6;
    char v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v24 = v19;
    *(_DWORD *)char v18 = 136315138;
    uint64_t v20 = sub_24A7B3998();
    v23[1] = sub_24A78F4E0(v20, v21, &v24);
    sub_24A7B3608();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A77B000, v16, v17, "%s init", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v19, -1, -1);
    MEMORY[0x24C5D05E0](v18, -1, -1);

    (*(void (**)(char *, void))(v7 + 8))(v9, v23[0]);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return v3;
}

uint64_t ContextualSuggestionProvider.deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24A7B32F8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24A7AA57C();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_24A7B32E8();
  os_log_type_t v8 = sub_24A7B3508();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    v14[1] = v9 + 4;
    uint64_t v11 = sub_24A7B3998();
    v14[2] = sub_24A78F4E0(v11, v12, &v15);
    sub_24A7B3608();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A77B000, v7, v8, "%s deinit", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v10, -1, -1);
    MEMORY[0x24C5D05E0](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(uint64_t, void, void))(**(void **)(v1 + 32) + 232))(v1, *(void *)(v1 + 16), *(void *)(v1 + 24));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_24A7AA10C(v1 + 48);
  return v1;
}

uint64_t ContextualSuggestionProvider.__deallocating_deinit()
{
  ContextualSuggestionProvider.deinit();
  return MEMORY[0x270FA0228](v0, 64, 7);
}

void *sub_24A7A9F8C()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 40);
  uint64_t v2 = (void **)&v1[4];
  uint64_t v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_24A7AA2C4(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

uint64_t sub_24A7A9FEC(uint64_t a1)
{
  uint64_t v3 = (os_unfair_lock_s *)v1[5];
  uint64_t v4 = (id *)&v3[4];
  uint64_t v5 = v3 + 6;
  os_unfair_lock_lock(v3 + 6);
  sub_24A7AA134(v4);
  os_unfair_lock_unlock(v5);
  uint64_t result = (*(uint64_t (**)(void))(*v1 + 112))();
  if (result)
  {
    uint64_t v8 = v7;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(v8 + 8))(v1, a1, ObjectType, v8);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_24A7AA10C(uint64_t a1)
{
  return a1;
}

id sub_24A7AA134(id *a1)
{
  uint64_t v3 = *(void **)(v1 + 16);

  *a1 = v3;
  return v3;
}

uint64_t dispatch thunk of ContextualSuggestionProviderDelegate.provider(_:didUpdate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t type metadata accessor for ContextualSuggestionProvider()
{
  return self;
}

uint64_t method lookup function for ContextualSuggestionProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ContextualSuggestionProvider);
}

uint64_t dispatch thunk of ContextualSuggestionProvider.delegate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of ContextualSuggestionProvider.delegate.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of ContextualSuggestionProvider.delegate.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of ContextualSuggestionProvider.__allocating_init(endpoint:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of ContextualSuggestionProvider.snapshot.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_2697BA5D8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2697BA5D8);
    }
  }
}

id sub_24A7AA2C4@<X0>(void **a1@<X0>, void **a2@<X8>)
{
  return sub_24A7A966C(a1, a2);
}

void *sub_24A7AA2DC()
{
  return &unk_26528E758;
}

uint64_t sub_24A7AA2E8()
{
  sub_24A7AA688();
  uint64_t result = sub_24A7B35F8();
  qword_26B17AF40 = result;
  return result;
}

uint64_t *sub_24A7AA344()
{
  if (qword_26B17AF48 != -1) {
    swift_once();
  }
  return &qword_26B17AF40;
}

id static ContextualEngineLog.oslog.getter()
{
  if (qword_26B17AF48 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B17AF40;
  return v0;
}

id ContextualEngineLog.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContextualEngineLog();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ContextualEngineLog()
{
  return self;
}

uint64_t sub_24A7AA4F0()
{
  uint64_t v0 = sub_24A7B32F8();
  __swift_allocate_value_buffer(v0, qword_26B17AF50);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B17AF50);
  if (qword_26B17AF48 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26B17AF40;
  return sub_24A7B3308();
}

uint64_t sub_24A7AA57C()
{
  if (qword_26B17AF68 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24A7B32F8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_26B17AF50);
}

uint64_t static Logger.contextualEngine.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B17AF68 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A7B32F8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B17AF50);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

unint64_t sub_24A7AA688()
{
  unint64_t result = qword_26B17AB60;
  if (!qword_26B17AB60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B17AB60);
  }
  return result;
}

uint64_t sub_24A7AA6C8()
{
  uint64_t v0 = sub_24A7B3808();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_24A7AA71C(char a1)
{
  if (a1) {
    return 0xD000000000000014;
  }
  else {
    return 0x696669746E656469;
  }
}

uint64_t sub_24A7AA75C(char *a1, char *a2)
{
  return sub_24A7AA768(*a1, *a2);
}

uint64_t sub_24A7AA768(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000014;
  }
  else {
    unint64_t v3 = 0x696669746E656469;
  }
  if (v2) {
    unint64_t v4 = 0xEA00000000007265;
  }
  else {
    unint64_t v4 = 0x800000024A7B88B0;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000014;
  }
  else {
    unint64_t v5 = 0x696669746E656469;
  }
  if (a2) {
    unint64_t v6 = 0x800000024A7B88B0;
  }
  else {
    unint64_t v6 = 0xEA00000000007265;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_24A7B3878();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_24A7AA814()
{
  return sub_24A7AA81C();
}

uint64_t sub_24A7AA81C()
{
  return sub_24A7B3918();
}

uint64_t sub_24A7AA8A8()
{
  return sub_24A7AA8B0();
}

uint64_t sub_24A7AA8B0()
{
  sub_24A7B33C8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A7AA924()
{
  return sub_24A7AA92C();
}

uint64_t sub_24A7AA92C()
{
  return sub_24A7B3918();
}

uint64_t sub_24A7AA9B4@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24A7B3808();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_24A7AAA14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24A7AA71C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_24A7AAA40()
{
  return sub_24A7AA71C(*v0);
}

uint64_t sub_24A7AAA48@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24A7B3808();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_24A7AAAAC(uint64_t a1)
{
  unint64_t v2 = sub_24A7AB564();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24A7AAAE8(uint64_t a1)
{
  unint64_t v2 = sub_24A7AB564();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ContextRepresentation.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ContextRepresentation.localizedDisplayName.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_localizedDisplayName);
  swift_bridgeObjectRetain();
  return v1;
}

id ContextRepresentation.__allocating_init(identifier:localizedDisplayName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  uint64_t v10 = &v9[OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_identifier];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;
  uint64_t v11 = &v9[OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_localizedDisplayName];
  *(void *)uint64_t v11 = a3;
  *((void *)v11 + 1) = a4;
  v13.receiver = v9;
  v13.super_class = v4;
  return objc_msgSendSuper2(&v13, sel_init);
}

id ContextRepresentation.init(identifier:localizedDisplayName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = &v4[OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_identifier];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;
  uint64_t v11 = &v4[OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_localizedDisplayName];
  *(void *)uint64_t v11 = a3;
  *((void *)v11 + 1) = a4;
  v13.receiver = v4;
  v13.super_class = ObjectType;
  return objc_msgSendSuper2(&v13, sel_init);
}

id ContextRepresentation.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ContextRepresentation.init(coder:)(a1);
}

id ContextRepresentation.init(coder:)(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_24A7B32F8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v32 - v9;
  sub_24A786530();
  id v11 = v1;
  uint64_t v12 = sub_24A7B35A8();
  if (!v12)
  {

    uint64_t v25 = sub_24A7AA57C();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v25, v4);
    BOOL v26 = sub_24A7B32E8();
    os_log_type_t v27 = sub_24A7B34F8();
    if (!os_log_type_enabled(v26, v27))
    {
      uint64_t v8 = v10;
      goto LABEL_12;
    }
    id v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v28 = 0;
    _os_log_impl(&dword_24A77B000, v26, v27, "coder missing identifier", v28, 2u);
    uint64_t v8 = v10;
    goto LABEL_10;
  }
  objc_super v13 = (void *)v12;
  uint64_t v14 = sub_24A7B3398();
  uint64_t v16 = v15;

  uint64_t v17 = sub_24A7B35A8();
  if (!v17)
  {

    goto LABEL_8;
  }
  char v18 = (void *)v17;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  sub_24A7B3388();

  uint64_t v20 = v33;
  uint64_t v19 = v34;

  if (!v19)
  {
LABEL_8:
    swift_bridgeObjectRelease();
    uint64_t v29 = sub_24A7AA57C();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v29, v4);
    BOOL v26 = sub_24A7B32E8();
    os_log_type_t v30 = sub_24A7B34F8();
    if (!os_log_type_enabled(v26, v30))
    {
LABEL_12:

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      swift_getObjectType();
      swift_deallocPartialClassInstance();
      return 0;
    }
    id v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v28 = 0;
    _os_log_impl(&dword_24A77B000, v26, v30, "coder missing localizedDisplayName", v28, 2u);
LABEL_10:
    MEMORY[0x24C5D05E0](v28, -1, -1);
    goto LABEL_12;
  }
  unint64_t v21 = (char *)objc_allocWithZone(ObjectType);
  char v22 = (uint64_t *)&v21[OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_identifier];
  *char v22 = v14;
  v22[1] = v16;
  uint64_t v23 = &v21[OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_localizedDisplayName];
  *(void *)uint64_t v23 = v20;
  *((void *)v23 + 1) = v19;
  v32.receiver = v21;
  v32.super_class = ObjectType;
  id v24 = objc_msgSendSuper2(&v32, sel_init);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v24;
}

void *sub_24A7AB05C()
{
  return &unk_24A7B66A0;
}

uint64_t static ContextRepresentation.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall ContextRepresentation.encode(with:)(NSCoder with)
{
  unint64_t v2 = (void *)sub_24A7B3378();
  id v3 = (void *)sub_24A7B3378();
  [(objc_class *)with.super.isa encodeObject:v2 forKey:v3];

  uint64_t v4 = (void *)sub_24A7B3378();
  id v5 = (id)sub_24A7B3378();
  [(objc_class *)with.super.isa encodeObject:v4 forKey:v5];
}

id ContextRepresentation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ContextRepresentation.init()()
{
}

id ContextRepresentation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_24A7AB2F8()
{
  unint64_t result = qword_2697BA5F8;
  if (!qword_2697BA5F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA5F8);
  }
  return result;
}

unint64_t sub_24A7AB350()
{
  unint64_t result = qword_2697BA600;
  if (!qword_2697BA600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA600);
  }
  return result;
}

unint64_t sub_24A7AB3A8()
{
  unint64_t result = qword_2697BA608;
  if (!qword_2697BA608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA608);
  }
  return result;
}

uint64_t type metadata accessor for ContextRepresentation()
{
  return self;
}

uint64_t method lookup function for ContextRepresentation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ContextRepresentation);
}

uint64_t dispatch thunk of ContextRepresentation.__allocating_init(identifier:localizedDisplayName:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of ContextRepresentation.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

unsigned char *storeEnumTagSinglePayload for ContextRepresentation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24A7AB52CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContextRepresentation.CodingKeys()
{
  return &type metadata for ContextRepresentation.CodingKeys;
}

unint64_t sub_24A7AB564()
{
  unint64_t result = qword_2697BA618;
  if (!qword_2697BA618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BA618);
  }
  return result;
}

void sub_24A7AB5B8()
{
  sub_24A7B3398();
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  id v1 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_2697BD3B8 = (uint64_t)v2;
}

uint64_t *sub_24A7AB640()
{
  if (qword_2697BD320 != -1) {
    swift_once();
  }
  return &qword_2697BD3B8;
}

uint64_t sub_24A7AB68C()
{
  if (qword_2697BD320 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_2697BD3B8;
  id v1 = (id)qword_2697BD3B8;
  return v0;
}

uint64_t sub_24A7AB6E8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A7AB720(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24A7AB768())()
{
  return j__swift_endAccess;
}

uint64_t sub_24A7AB7BC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A7AB7F4(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

id sub_24A7AB83C()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F29C20]);
  uint64_t v1 = (void *)sub_24A7B3378();
  id v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  return v2;
}

id sub_24A7AB8A8()
{
  return *(id *)(v0 + 32);
}

uint64_t sub_24A7AB8B0()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t sub_24A7AB8E4(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 40) = a1;
  return result;
}

uint64_t sub_24A7AB924()
{
  objc_msgSend(*(id *)(v0 + 32), sel_invalidate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_24A7AB964()
{
  objc_msgSend(*(id *)(v0 + 32), sel_invalidate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 41, 7);
}

uint64_t sub_24A7AB9BC()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  id v1 = objc_allocWithZone(MEMORY[0x263F29C20]);
  id v2 = (void *)sub_24A7B3378();
  id v3 = objc_msgSend(v1, sel_initWithIdentifier_, v2);

  *(void *)(v0 + 32) = v3;
  *(unsigned char *)(v0 + 40) = 0;
  return v0;
}

uint64_t sub_24A7ABA50()
{
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  id v1 = objc_allocWithZone(MEMORY[0x263F29C20]);
  id v2 = (void *)sub_24A7B3378();
  id v3 = objc_msgSend(v1, sel_initWithIdentifier_, v2);

  *(void *)(v0 + 32) = v3;
  *(unsigned char *)(v0 + 40) = 0;
  return v0;
}

uint64_t sub_24A7ABAD0()
{
  sub_24A799800();
  return swift_retain();
}

uint64_t sub_24A7ABAFC()
{
  type metadata accessor for ContextualSuggestionProvider();
  uint64_t v0 = (uint64_t *)sub_24A7A4924();
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  swift_bridgeObjectRetain();
  return ContextualSuggestionProvider.__allocating_init(endpoint:)(v1, v2);
}

id sub_24A7ABB48()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F31E90]);
  return objc_msgSend(v0, sel_init);
}

uint64_t sub_24A7ABB80()
{
  uint64_t v1 = OBJC_IVAR___ATXAmbientSuggestionProvider____lazy_storage___logger;
  if (*(void *)(v0 + OBJC_IVAR___ATXAmbientSuggestionProvider____lazy_storage___logger))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR___ATXAmbientSuggestionProvider____lazy_storage___logger);
  }
  else
  {
    type metadata accessor for AmbientLogger();
    uint64_t v2 = sub_24A7A0C18();
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t ATXAmbientSuggestionProvider.suggestionsWidgetSuggestions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ATXAmbientSuggestionProvider.stackSuggestions.getter()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR___ATXAmbientSuggestionProvider_lock);
  uint64_t v2 = (uint64_t)&v1[4];
  id v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_24A7ABD24(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

uint64_t sub_24A7ABD24@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24A7B0FB4(a1, a2);
}

uint64_t ATXAmbientSuggestionProvider.shouldDisableSuppressionTimerForTooling.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___ATXAmbientSuggestionProvider_shouldDisableSuppressionTimerForTooling);
  swift_beginAccess();
  return *v1;
}

uint64_t ATXAmbientSuggestionProvider.shouldDisableSuppressionTimerForTooling.setter(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR___ATXAmbientSuggestionProvider_shouldDisableSuppressionTimerForTooling);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*ATXAmbientSuggestionProvider.shouldDisableSuppressionTimerForTooling.modify())()
{
  return j_j__swift_endAccess;
}

void __swiftcall ATXAmbientSuggestionProvider.init()(ATXAmbientSuggestionProvider *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

char *ATXAmbientSuggestionProvider.init()()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = sub_24A7B3328();
  uint64_t v85 = *(void *)(v2 - 8);
  uint64_t v86 = v2;
  MEMORY[0x270FA5388](v2);
  char v84 = (char *)v73 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_24A7B3518();
  MEMORY[0x270FA5388](v80);
  uint64_t v79 = (void (*)(char *, uint64_t, uint64_t))((char *)v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_24A7B3348();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v78 = (char *)v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_24A7B3528();
  uint64_t v75 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  uint64_t v77 = (char *)v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24A7B32F8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  char v87 = (char *)v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  objc_super v13 = (char *)v73 - v12;
  uint64_t v14 = OBJC_IVAR___ATXAmbientSuggestionProvider_configurationManager;
  uint64_t v15 = v0;
  *(void *)&v0[v14] = *sub_24A799800();
  uint64_t v16 = OBJC_IVAR___ATXAmbientSuggestionProvider_suggestionProvider;
  type metadata accessor for ContextualSuggestionProvider();
  swift_retain();
  uint64_t v17 = (uint64_t *)sub_24A7A4924();
  uint64_t v18 = *v17;
  uint64_t v19 = v17[1];
  swift_bridgeObjectRetain();
  *(void *)&v15[v16] = ContextualSuggestionProvider.__allocating_init(endpoint:)(v18, v19);
  uint64_t v20 = OBJC_IVAR___ATXAmbientSuggestionProvider_descriptorProvider;
  *(void *)&v15[v20] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F31E90]), sel_init);
  *(void *)&v15[OBJC_IVAR___ATXAmbientSuggestionProvider____lazy_storage___logger] = 0;
  v73[0] = OBJC_IVAR___ATXAmbientSuggestionProvider__suggestionsWidgetSuggestions;
  *(void *)&v15[OBJC_IVAR___ATXAmbientSuggestionProvider__suggestionsWidgetSuggestions] = 0;
  v15[OBJC_IVAR___ATXAmbientSuggestionProvider_shouldDisableSuppressionTimerForTooling] = 0;
  uint64_t v74 = OBJC_IVAR___ATXAmbientSuggestionProvider_refreshTimer;
  *(void *)&v15[OBJC_IVAR___ATXAmbientSuggestionProvider_refreshTimer] = 0;
  v73[1] = &v15[OBJC_IVAR___ATXAmbientSuggestionProvider_delegate];
  swift_unknownObjectWeakInit();
  uint64_t v21 = sub_24A796BD0();
  char v22 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v82 = v21;
  uint64_t v83 = v9 + 16;
  uint64_t v81 = v22;
  ((void (*)(char *))v22)(v13);
  uint64_t v23 = sub_24A7B32E8();
  os_log_type_t v24 = sub_24A7B3508();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v89 = v8;
  uint64_t v90 = ObjectType;
  uint64_t v88 = v9;
  if (v25)
  {
    BOOL v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = v9;
    uint64_t v28 = swift_slowAlloc();
    uint64_t aBlock = v28;
    *(_DWORD *)BOOL v26 = 136315138;
    uint64_t v29 = sub_24A7B3998();
    uint64_t v99 = sub_24A78F4E0(v29, v30, &aBlock);
    sub_24A7B3608();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A77B000, v23, v24, "%s init", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v28, -1, -1);
    MEMORY[0x24C5D05E0](v26, -1, -1);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v89);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  }
  _s11GuardedDataCMa();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = 0;
  *(void *)(v31 + 24) = 0;
  id v32 = objc_allocWithZone(MEMORY[0x263F29C20]);
  uint64_t v33 = (void *)sub_24A7B3378();
  id v34 = objc_msgSend(v32, sel_initWithIdentifier_, v33);

  *(void *)(v31 + 32) = v34;
  *(unsigned char *)(v31 + 40) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA668);
  uint64_t v35 = swift_allocObject();
  *(_DWORD *)(v35 + 24) = 0;
  *(void *)(v35 + 16) = v31;
  *(void *)&v15[OBJC_IVAR___ATXAmbientSuggestionProvider_lock] = v35;
  uint64_t aBlock = 0;
  unint64_t v93 = 0xE000000000000000;
  sub_24A7B36D8();
  swift_bridgeObjectRelease();
  uint64_t aBlock = 0x6C7070612E6D6F63;
  unint64_t v93 = 0xEA00000000002E65;
  sub_24A7B3998();
  sub_24A7B33D8();
  swift_bridgeObjectRelease();
  uint64_t v36 = sub_24A787494(0, (unint64_t *)&qword_2697BA170);
  sub_24A7B33D8();
  (*(void (**)(char *, void, uint64_t))(v75 + 104))(v77, *MEMORY[0x263F8F138], v76);
  sub_24A7B3338();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_24A795374(&qword_2697BA178, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA180);
  sub_24A7B2A74(&qword_2697BA188, &qword_2697BA180);
  sub_24A7B3638();
  *(void *)&v15[OBJC_IVAR___ATXAmbientSuggestionProvider_calloutQueue] = sub_24A7B3558();
  *(_DWORD *)&v15[OBJC_IVAR___ATXAmbientSuggestionProvider_debugRotationNotificationToken] = 0;
  unint64_t v37 = sub_24A78DF7C(MEMORY[0x263F8EE78]);
  *(void *)&v15[v73[0]] = v37;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  uint64_t v38 = *(void **)&v15[v74];
  *(void *)&v15[v74] = 0;

  v98.receiver = v15;
  v98.super_class = (Class)ATXAmbientSuggestionProvider;
  id v39 = objc_msgSendSuper2(&v98, sel_init);
  uint64_t v40 = *MEMORY[0x263F8F080];
  uint64_t v42 = v84;
  uint64_t v41 = v85;
  uint64_t v43 = v86;
  uint64_t v79 = *(void (**)(char *, uint64_t, uint64_t))(v85 + 104);
  v79(v84, v40, v86);
  uint64_t v44 = (char *)v39;
  uint64_t v80 = v36;
  uint64_t v45 = (void *)sub_24A7B3568();
  uint64_t v85 = *(void *)(v41 + 8);
  ((void (*)(char *, uint64_t))v85)(v42, v43);
  uint64_t v46 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v47 = swift_allocObject();
  uint64_t v48 = v90;
  *(void *)(v47 + 16) = v46;
  *(void *)(v47 + 24) = v48;
  id v49 = objc_allocWithZone(MEMORY[0x263F61E98]);
  long long v96 = sub_24A7B1AF0;
  uint64_t v97 = v47;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v93 = 1107296256;
  long long v94 = (uint64_t (*)(uint64_t, uint64_t))sub_24A792CE8;
  long long v95 = &block_descriptor_3;
  id v50 = _Block_copy(&aBlock);
  swift_retain();
  id v51 = objc_msgSend(v49, sel_initWithQueue_operation_, v45, v50);

  _Block_release(v50);
  swift_release();
  swift_release();
  uint64_t v52 = *(void **)&v44[OBJC_IVAR___ATXAmbientSuggestionProvider_refreshTimer];
  *(void *)&v44[OBJC_IVAR___ATXAmbientSuggestionProvider_refreshTimer] = v51;

  if (objc_msgSend(self, sel_isInternalBuild))
  {
    sub_24A79DE88();
    v79(v42, *MEMORY[0x263F8F060], v43);
    swift_bridgeObjectRetain();
    uint64_t v53 = sub_24A7B3568();
    ((void (*)(char *, uint64_t))v85)(v42, v43);
    uint64_t v54 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v55 = swift_allocObject();
    uint64_t v56 = v90;
    *(void *)(v55 + 16) = v54;
    *(void *)(v55 + 24) = v56;
    long long v96 = sub_24A7B1B10;
    uint64_t v97 = v55;
    uint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v93 = 1107296256;
    long long v94 = sub_24A79372C;
    long long v95 = &block_descriptor_10;
    uint64_t v57 = _Block_copy(&aBlock);
    swift_release();
    uint64_t v58 = sub_24A7B33B8();
    swift_bridgeObjectRelease();
    uint64_t v59 = (int *)&v44[OBJC_IVAR___ATXAmbientSuggestionProvider_debugRotationNotificationToken];
    swift_beginAccess();
    notify_register_dispatch((const char *)(v58 + 32), v59, v53, v57);
    swift_endAccess();
    swift_release();
    _Block_release(v57);
  }
  int64_t v60 = *(void (**)(char *, _UNKNOWN **))(**(void **)&v44[OBJC_IVAR___ATXAmbientSuggestionProvider_suggestionProvider]
                                                   + 120);
  uint64_t v61 = v44;
  swift_retain();
  v60(v44, &protocol witness table for ATXAmbientSuggestionProvider);
  swift_release();
  uint64_t v62 = *(void (**)(char *))(**(void **)&v61[OBJC_IVAR___ATXAmbientSuggestionProvider_configurationManager]
                                      + 232);
  uint64_t v63 = v61;
  swift_retain();
  v62(v63);
  swift_release();

  unint64_t v64 = v87;
  uint64_t v65 = v89;
  v81(v87, v82, v89);
  unint64_t v66 = sub_24A7B32E8();
  os_log_type_t v67 = sub_24A7B3508();
  if (os_log_type_enabled(v66, v67))
  {
    uint64_t v68 = swift_slowAlloc();
    uint64_t v69 = swift_slowAlloc();
    uint64_t aBlock = v69;
    *(_DWORD *)uint64_t v68 = 136315394;
    uint64_t v70 = sub_24A7B3998();
    uint64_t v91 = sub_24A78F4E0(v70, v71, &aBlock);
    sub_24A7B3608();
    swift_bridgeObjectRelease();
    *(_WORD *)(v68 + 12) = 2080;
    uint64_t v91 = sub_24A78F4E0(0x292874696E69, 0xE600000000000000, &aBlock);
    sub_24A7B3608();
    _os_log_impl(&dword_24A77B000, v66, v67, "%s.%s: resetting delegate notification suspension timer", (uint8_t *)v68, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v69, -1, -1);
    MEMORY[0x24C5D05E0](v68, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v88 + 8))(v64, v65);
  sub_24A7ADC5C();

  return v63;
}

uint64_t sub_24A7ACB6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A390);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24A7B3498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = swift_allocObject();
  swift_beginAccess();
  uint64_t v9 = (void *)MEMORY[0x24C5D0680](a1 + 16);
  swift_unknownObjectWeakInit();

  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  _DWORD v10[4] = v8;
  v10[5] = a2;
  sub_24A79A8AC((uint64_t)v6, (uint64_t)&unk_2697BA720, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_24A7ACCC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  uint64_t v6 = sub_24A7B32F8();
  v5[8] = v6;
  v5[9] = *(void *)(v6 - 8);
  v5[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A7ACD80, 0, 0);
}

uint64_t sub_24A7ACD80()
{
  uint64_t v23 = v0;
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[8];
  uint64_t v4 = sub_24A796BD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_24A7B32E8();
  os_log_type_t v6 = sub_24A7B3508();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = v0[9];
    uint64_t v20 = v0[8];
    uint64_t v21 = v0[10];
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v22 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v10 = sub_24A7B3998();
    v0[5] = sub_24A78F4E0(v10, v11, &v22);
    sub_24A7B3608();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A77B000, v5, v6, "%s: running coalesced refresh", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v9, -1, -1);
    MEMORY[0x24C5D05E0](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v21, v20);
  }
  else
  {
    uint64_t v13 = v0[9];
    uint64_t v12 = v0[10];
    uint64_t v14 = v0[8];

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  uint64_t v15 = v0[6] + 16;
  swift_beginAccess();
  uint64_t v16 = MEMORY[0x24C5D0680](v15);
  v0[11] = v16;
  if (v16)
  {
    uint64_t v17 = (void *)swift_task_alloc();
    v0[12] = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_24A7B2B94;
    return sub_24A7AD010();
  }
  else
  {
    swift_task_dealloc();
    uint64_t v19 = (uint64_t (*)(void))v0[1];
    return v19();
  }
}

uint64_t sub_24A7AD010()
{
  v1[2] = v0;
  uint64_t v2 = sub_24A7B32F8();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A7AD0D0, 0, 0);
}

uint64_t sub_24A7AD0D0()
{
  uint64_t v1 = *(void *)(v0[2] + OBJC_IVAR___ATXAmbientSuggestionProvider_configurationManager);
  v0[6] = v1;
  uint64_t v2 = (*(void *)v1 + 240) & 0xFFFFFFFFFFFFLL | 0x563E000000000000;
  v0[7] = *(void *)(*(void *)v1 + 240);
  v0[8] = v2;
  return MEMORY[0x270FA2498](sub_24A7AD118, v1, 0);
}

uint64_t sub_24A7AD118()
{
  *(void *)(v0 + 72) = (*(uint64_t (**)(void))(v0 + 56))();
  *(void *)(v0 + 80) = 0;
  return MEMORY[0x270FA2498](sub_24A7AD1B0, 0, 0);
}

void sub_24A7AD1B0()
{
  uint64_t v35 = v0;
  unint64_t v1 = v0[9];
  if (v1)
  {
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_24A7B37A8();
      swift_bridgeObjectRelease();
      if (v22)
      {
LABEL_4:
        uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(v0[2] + OBJC_IVAR___ATXAmbientSuggestionProvider_suggestionProvider)
                                  + 144))();
        uint64_t v3 = (void *)v2;
        uint64_t v4 = MEMORY[0x263F8EE78];
        if (!v2)
        {
LABEL_15:
          uint64_t v12 = v0[10];
          uint64_t v13 = v0[2];
          sub_24A788078(0, v1, v4, (uint64_t)*(id *)(v13 + OBJC_IVAR___ATXAmbientSuggestionProvider_descriptorProvider), (uint64_t)v34);
          uint64_t v14 = sub_24A788298();
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)(v13 + OBJC_IVAR___ATXAmbientSuggestionProvider_lock);
          uint64_t v18 = swift_task_alloc();
          *(void *)(v18 + 16) = v14;
          *(void *)(v18 + 24) = v16;
          os_unfair_lock_lock((os_unfair_lock_t)(v17 + 24));
          sub_24A7B2884((uint64_t *)(v17 + 16));
          os_unfair_lock_unlock((os_unfair_lock_t)(v17 + 24));
          if (v12) {
            return;
          }
          swift_task_dealloc();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_24A7AE028();

          uint64_t v19 = v34[2];
          uint64_t v20 = (void *)v34[4];
          uint64_t v21 = (void *)v34[5];
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_24A7B2918(v19);

          goto LABEL_22;
        }
        unint64_t v5 = *(void *)(v2 + OBJC_IVAR___ATXContextualSuggestionSnapshot_contexts);
        v34[0] = MEMORY[0x263F8EE78];
        if (v5 >> 62)
        {
          swift_bridgeObjectRetain_n();
          uint64_t v6 = sub_24A7B37A8();
          if (v6) {
            goto LABEL_7;
          }
        }
        else
        {
          uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain_n();
          if (v6)
          {
LABEL_7:
            if (v6 < 1)
            {
              __break(1u);
              return;
            }
            if ((v5 & 0xC000000000000001) != 0)
            {
              uint64_t v7 = 0;
              do
              {
                uint64_t v8 = MEMORY[0x24C5CFAE0](v7++, v5);
                unint64_t v9 = *(void *)(v8
                               + OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_suggestions);
                swift_bridgeObjectRetain();
                swift_unknownObjectRelease();
                sub_24A7B1B18(v9);
              }
              while (v6 != v7);
            }
            else
            {
              unint64_t v10 = v5 + 32;
              do
              {
                v10 += 8;
                unint64_t v11 = swift_bridgeObjectRetain();
                sub_24A7B1B18(v11);
                --v6;
              }
              while (v6);
            }
          }
        }
        swift_bridgeObjectRelease_n();
        uint64_t v4 = v34[0];
        goto LABEL_15;
      }
    }
    else if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_4;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v24 = v0[4];
  uint64_t v23 = v0[5];
  uint64_t v25 = v0[3];
  uint64_t v26 = sub_24A796BD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v23, v26, v25);
  uint64_t v27 = sub_24A7B32E8();
  os_log_type_t v28 = sub_24A7B3508();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_24A77B000, v27, v28, "Not producing ambient stack suggestions, no stacks in configuration", v29, 2u);
    MEMORY[0x24C5D05E0](v29, -1, -1);
  }
  uint64_t v31 = v0[4];
  uint64_t v30 = v0[5];
  uint64_t v32 = v0[3];

  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
LABEL_22:
  swift_task_dealloc();
  uint64_t v33 = (void (*)(void))v0[1];
  v33();
}

uint64_t sub_24A7AD56C()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  uint64_t v4 = sub_24A796BD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  unint64_t v5 = sub_24A7B32E8();
  os_log_type_t v6 = sub_24A7B3508();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_24A77B000, v5, v6, "Not producing ambient stack suggestions, no stacks in configuration", v7, 2u);
    MEMORY[0x24C5D05E0](v7, -1, -1);
  }
  uint64_t v9 = v0[4];
  uint64_t v8 = v0[5];
  uint64_t v10 = v0[3];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  swift_task_dealloc();
  unint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_24A7AD688(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A390);
  MEMORY[0x270FA5388](v4 - 8);
  os_log_type_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24A7B3498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = swift_allocObject();
  swift_beginAccess();
  uint64_t v9 = (void *)MEMORY[0x24C5D0680](a1 + 16);
  swift_unknownObjectWeakInit();

  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  _DWORD v10[4] = v8;
  v10[5] = a2;
  sub_24A79A8AC((uint64_t)v6, (uint64_t)&unk_2697BA700, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_24A7AD7DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  uint64_t v6 = sub_24A7B32F8();
  v5[8] = v6;
  v5[9] = *(void *)(v6 - 8);
  v5[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A7AD89C, 0, 0);
}

uint64_t sub_24A7AD89C()
{
  uint64_t v23 = v0;
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[8];
  uint64_t v4 = sub_24A796BD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_24A7B32E8();
  os_log_type_t v6 = sub_24A7B3508();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = v0[9];
    uint64_t v20 = v0[8];
    uint64_t v21 = v0[10];
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v22 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v10 = sub_24A7B3998();
    v0[5] = sub_24A78F4E0(v10, v11, &v22);
    sub_24A7B3608();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A77B000, v5, v6, "%s: received ambient debug rotation notification", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v9, -1, -1);
    MEMORY[0x24C5D05E0](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v21, v20);
  }
  else
  {
    uint64_t v13 = v0[9];
    uint64_t v12 = v0[10];
    uint64_t v14 = v0[8];

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  uint64_t v15 = v0[6] + 16;
  swift_beginAccess();
  uint64_t v16 = MEMORY[0x24C5D0680](v15);
  v0[11] = v16;
  if (v16)
  {
    uint64_t v17 = (void *)swift_task_alloc();
    v0[12] = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_24A7ADB2C;
    return sub_24A7AD010();
  }
  else
  {
    swift_task_dealloc();
    uint64_t v19 = (uint64_t (*)(void))v0[1];
    return v19();
  }
}

uint64_t sub_24A7ADB2C()
{
  uint64_t v1 = *(void **)(*v0 + 88);
  uint64_t v4 = *v0;
  swift_task_dealloc();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

void sub_24A7ADC5C()
{
  swift_getObjectType();
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR___ATXAmbientSuggestionProvider_lock);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_24A7B2BBC(v2);
  os_unfair_lock_unlock(v3);
}

id sub_24A7ADCF8()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = sub_24A7B32F8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24A796BD0();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_24A7B32E8();
  os_log_type_t v8 = sub_24A7B3508();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v18 = v1;
    uint64_t v10 = (uint8_t *)v9;
    uint64_t v11 = swift_slowAlloc();
    v21[0] = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v12 = sub_24A7B3998();
    uint64_t v19 = sub_24A78F4E0(v12, v13, v21);
    sub_24A7B3608();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A77B000, v7, v8, "%s deinit", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v11, -1, -1);
    uint64_t v14 = v10;
    uint64_t v1 = v18;
    MEMORY[0x24C5D05E0](v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v15 = (int *)&v1[OBJC_IVAR___ATXAmbientSuggestionProvider_debugRotationNotificationToken];
  swift_beginAccess();
  notify_cancel(*v15);
  v20.receiver = v1;
  v20.super_class = (Class)ATXAmbientSuggestionProvider;
  return objc_msgSendSuper2(&v20, sel_dealloc);
}

void sub_24A7AE028()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v1 = sub_24A7B3318();
  uint64_t v34 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v32 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_24A7B3348();
  uint64_t v31 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v30 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24A7B32F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24A796BD0();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = sub_24A7B32E8();
  os_log_type_t v10 = sub_24A7B3508();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v29 = ObjectType;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v13 = swift_slowAlloc();
    aBlock[0] = v13;
    uint64_t v28 = v1;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v14 = sub_24A7B3998();
    uint64_t v36 = sub_24A78F4E0(v14, v15, aBlock);
    uint64_t v1 = v28;
    sub_24A7B3608();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A77B000, v9, v10, "%s: requesting delegate notification", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v13, -1, -1);
    uint64_t v16 = v12;
    uint64_t ObjectType = v29;
    MEMORY[0x24C5D05E0](v16, -1, -1);
  }

  uint64_t v17 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v18 = v35;
  MEMORY[0x270FA5388](v17);
  *(&v28 - 2) = (uint64_t)v18;
  *(&v28 - 1) = ObjectType;
  objc_super v20 = (uint64_t *)&v19[4];
  uint64_t v21 = v19 + 6;
  os_unfair_lock_lock(v19 + 6);
  sub_24A7B2958(v20, aBlock);
  os_unfair_lock_unlock(v21);
  uint64_t v22 = aBlock[0];
  if (aBlock[0])
  {
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v18;
    *(void *)(v23 + 24) = v22;
    aBlock[4] = (uint64_t)sub_24A7B29C4;
    void aBlock[5] = v23;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_24A792CE8;
    aBlock[3] = (uint64_t)&block_descriptor_80_0;
    uint64_t v24 = _Block_copy(aBlock);
    id v25 = v18;
    uint64_t v26 = v30;
    sub_24A7B3338();
    uint64_t v36 = MEMORY[0x263F8EE78];
    sub_24A795374(&qword_2697BA198, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1A0);
    sub_24A7B2A74(&qword_2697BA1A8, &qword_2697BA1A0);
    uint64_t v27 = v32;
    sub_24A7B3638();
    MEMORY[0x24C5CF930](0, v26, v27, v24);
    _Block_release(v24);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v27, v1);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v26, v33);
    swift_release();
  }
}

uint64_t ATXAmbientSuggestionProvider.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___ATXAmbientSuggestionProvider_delegate;
  swift_beginAccess();
  return MEMORY[0x24C5D0680](v1);
}

uint64_t ATXAmbientSuggestionProvider.delegate.setter()
{
  return swift_unknownObjectRelease();
}

id sub_24A7AE68C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_delegate);
  *a2 = result;
  return result;
}

id sub_24A7AE6C8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDelegate_, *a1);
}

uint64_t sub_24A7AE6DC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v59 = a1;
  uint64_t v5 = sub_24A7B32F8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v57 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  unint64_t v15 = (char *)&v57 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v57 - v16;
  uint64_t v18 = (unsigned char *)(a2 + OBJC_IVAR___ATXAmbientSuggestionProvider_shouldDisableSuppressionTimerForTooling);
  swift_beginAccess();
  if (*v18 == 1)
  {
    uint64_t v19 = sub_24A796BD0();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v17, v19, v5);
    objc_super v20 = sub_24A7B32E8();
    os_log_type_t v21 = sub_24A7B3508();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v58 = (uint64_t *)v5;
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v61 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v24 = sub_24A7B3998();
      uint64_t v60 = sub_24A78F4E0(v24, v25, &v61);
      sub_24A7B3608();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24A77B000, v20, v21, "%s: rotation suppression is disabled for tooling via property, notifying immediately", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5D05E0](v23, -1, -1);
      MEMORY[0x24C5D05E0](v22, -1, -1);

      uint64_t v26 = (*(uint64_t (**)(char *, uint64_t *))(v6 + 8))(v17, v58);
    }
    else
    {

      uint64_t v26 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v17, v5);
    }
LABEL_21:
    uint64_t v56 = *v59;
LABEL_22:
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v56 + 112))(v26);
    goto LABEL_23;
  }
  if (qword_2697BD320 != -1) {
    swift_once();
  }
  uint64_t v27 = (void *)qword_2697BD3B8;
  if (qword_2697BD3B8)
  {
    sub_24A79DE38();
    uint64_t v28 = v5;
    swift_bridgeObjectRetain();
    uint64_t v29 = (void *)sub_24A7B3378();
    swift_bridgeObjectRelease();
    unsigned int v30 = objc_msgSend(v27, sel_BOOLForKey_, v29);

    uint64_t v5 = v28;
    if (v30)
    {
      uint64_t v31 = sub_24A796BD0();
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v15, v31, v28);
      uint64_t v32 = sub_24A7B32E8();
      os_log_type_t v33 = sub_24A7B3508();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v58 = a3;
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        uint64_t v35 = swift_slowAlloc();
        uint64_t v61 = v35;
        *(_DWORD *)uint64_t v34 = 136315138;
        uint64_t v36 = sub_24A7B3998();
        uint64_t v60 = sub_24A78F4E0(v36, v37, &v61);
        a3 = v58;
        sub_24A7B3608();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24A77B000, v32, v33, "%s: rotation suppression is disabled via defaults override, notifying immediately", v34, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5D05E0](v35, -1, -1);
        MEMORY[0x24C5D05E0](v34, -1, -1);
      }

      uint64_t v26 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v15, v28);
      goto LABEL_21;
    }
  }
  uint64_t v38 = *(void **)(*v59 + 32);
  if (!objc_msgSend(v38, sel_isScheduled))
  {
    uint64_t v48 = sub_24A796BD0();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v48, v5);
    id v49 = sub_24A7B32E8();
    os_log_type_t v50 = sub_24A7B3508();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v58 = a3;
      id v51 = (uint8_t *)swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      uint64_t v61 = v52;
      *(_DWORD *)id v51 = 136315138;
      uint64_t v53 = sub_24A7B3998();
      uint64_t v60 = sub_24A78F4E0(v53, v54, &v61);
      a3 = v58;
      sub_24A7B3608();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24A77B000, v49, v50, "%s: no delegate notification suspension timer scheduled, notifying immediately", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5D05E0](v52, -1, -1);
      MEMORY[0x24C5D05E0](v51, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    uint64_t v56 = *v59;
    uint64_t v26 = (*(uint64_t (**)(void))(*(void *)*v59 + 168))(0);
    goto LABEL_22;
  }
  objc_msgSend(v38, sel_timeRemaining);
  uint64_t v40 = v39;
  uint64_t v41 = sub_24A796BD0();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v12, v41, v5);
  uint64_t v42 = sub_24A7B32E8();
  os_log_type_t v43 = sub_24A7B3508();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    uint64_t v61 = v45;
    *(_DWORD *)uint64_t v44 = 136315394;
    uint64_t v57 = v44 + 4;
    uint64_t v46 = sub_24A7B3998();
    uint64_t v60 = sub_24A78F4E0(v46, v47, &v61);
    uint64_t v58 = (uint64_t *)v5;
    sub_24A7B3608();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2048;
    uint64_t v60 = v40;
    sub_24A7B3608();
    _os_log_impl(&dword_24A77B000, v42, v43, "%s: delegate notification suspension timer already scheduled %f seconds left, setting notification to pending", (uint8_t *)v44, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v45, -1, -1);
    MEMORY[0x24C5D05E0](v44, -1, -1);

    (*(void (**)(char *, uint64_t *))(v6 + 8))(v12, v58);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v5);
  }
  (*(void (**)(uint64_t))(*(void *)*v59 + 168))(1);
  uint64_t result = 0;
LABEL_23:
  *a3 = result;
  return result;
}

void sub_24A7AEF10(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v7 = *(void **)(*(void *)a1 + 32);
  if (objc_msgSend(v7, sel_isScheduled))
  {
    objc_msgSend(v7, sel_timeRemaining);
    if (v8 > a4) {
      a4 = v8;
    }
  }
  objc_msgSend(v7, sel_cancel);
  uint64_t v9 = *(void *)(a2 + OBJC_IVAR___ATXAmbientSuggestionProvider_calloutQueue);
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = a3;
  v14[4] = sub_24A7B27B4;
  v14[5] = v11;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_24A79C8FC;
  void v14[3] = &block_descriptor_63;
  uint64_t v12 = _Block_copy(v14);
  id v13 = v7;
  swift_release();
  objc_msgSend(v13, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v9, v12, a4, 1.0);
  _Block_release(v12);
}

void sub_24A7AF088(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x24C5D0680](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    MEMORY[0x270FA5388](v2);
    uint64_t v5 = (uint64_t *)&v4[4];
    uint64_t v6 = v4 + 6;
    os_unfair_lock_lock(v4 + 6);
    sub_24A7B27BC(v5, &v10);
    os_unfair_lock_unlock(v6);
    if (v10)
    {
      id v7 = objc_msgSend(v3, sel_delegate);
      if (v7)
      {
        double v8 = v7;
        type metadata accessor for ATXWidgetStackSuggestion(0);
        uint64_t v9 = (void *)sub_24A7B3408();
        swift_bridgeObjectRelease();
        objc_msgSend(v8, sel_suggestionProvider_didUpdateStackSuggestions_, v3, v9);

        swift_unknownObjectRelease();
      }
      else
      {

        swift_bridgeObjectRelease();
      }
    }
    else
    {
    }
  }
}

uint64_t sub_24A7AF1D0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_24A7B32F8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  double v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v32 - v10;
  char v12 = (*(uint64_t (**)(uint64_t))(*(void *)*a1 + 160))(v9);
  uint64_t v13 = sub_24A796BD0();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  if (v12)
  {
    v14(v11, v13, v4);
    unint64_t v15 = sub_24A7B32E8();
    os_log_type_t v16 = sub_24A7B3508();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      os_log_type_t v33 = a2;
      uint64_t v19 = v18;
      uint64_t v35 = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      uint64_t v32 = v17 + 4;
      uint64_t v20 = sub_24A7B3998();
      uint64_t v34 = sub_24A78F4E0(v20, v21, &v35);
      sub_24A7B3608();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24A77B000, v15, v16, "%s: notification suspension timer fired. Notification was pending, so notifying delegate", v17, 0xCu);
      swift_arrayDestroy();
      uint64_t v22 = v19;
      a2 = v33;
      MEMORY[0x24C5D05E0](v22, -1, -1);
      MEMORY[0x24C5D05E0](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    uint64_t v23 = *a1;
    uint64_t v24 = (*(uint64_t (**)(void))(*(void *)*a1 + 168))(0);
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v23 + 112))(v24);
  }
  else
  {
    v14(v8, v13, v4);
    uint64_t v26 = sub_24A7B32E8();
    os_log_type_t v27 = sub_24A7B3508();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v35 = v29;
      os_log_type_t v33 = a2;
      *(_DWORD *)uint64_t v28 = 136315138;
      uint64_t v30 = sub_24A7B3998();
      uint64_t v34 = sub_24A78F4E0(v30, v31, &v35);
      a2 = v33;
      sub_24A7B3608();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24A77B000, v26, v27, "%s: notification suspension timer fired. No notification pending, not notifying delegate", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5D05E0](v29, -1, -1);
      MEMORY[0x24C5D05E0](v28, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    uint64_t result = 0;
  }
  *a2 = result;
  return result;
}

id ATXAmbientSuggestionProvider.provider(_:didUpdate:)()
{
  return sub_24A7B2040("%s: suggestion provider updated snapshot, requesting coalesced refresh");
}

Swift::Void __swiftcall ATXAmbientSuggestionProvider.logViewDidAppear()()
{
  uint64_t v0 = sub_24A7ABB80();
  (*(void (**)(uint64_t))(*(void *)v0 + 128))(v0);
  swift_release();
}

Swift::Void __swiftcall ATXAmbientSuggestionProvider.logViewDidDisappear()()
{
  uint64_t v0 = sub_24A7ABB80();
  (*(void (**)(uint64_t))(*(void *)v0 + 136))(v0);
  swift_release();
}

Swift::Void __swiftcall ATXAmbientSuggestionProvider.logUserDidTap(_:)(ATXWidget *a1)
{
  uint64_t v2 = sub_24A7ABB80();
  (*(void (**)(ATXWidget *))(*(void *)v2 + 144))(a1);
  swift_release();
}

uint64_t ATXAmbientSuggestionProvider.logStackDidChange(to:reason:)(void *a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A390);
  MEMORY[0x270FA5388](v6 - 8);
  double v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24A7B3498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  _DWORD v10[4] = v2;
  v10[5] = a1;
  v10[6] = a2;
  v10[7] = ObjectType;
  id v11 = v2;
  id v12 = a1;
  sub_24A79A8AC((uint64_t)v8, (uint64_t)&unk_2697BA688, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_24A7AF98C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[12] = a6;
  v7[13] = a7;
  v7[10] = a4;
  v7[11] = a5;
  uint64_t v8 = sub_24A7B32F8();
  v7[14] = v8;
  v7[15] = *(void *)(v8 - 8);
  v7[16] = swift_task_alloc();
  v7[17] = swift_task_alloc();
  v7[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A7AFA6C, 0, 0);
}

uint64_t sub_24A7AFA6C()
{
  uint64_t v1 = *(void *)(v0[10] + OBJC_IVAR___ATXAmbientSuggestionProvider_configurationManager);
  v0[19] = v1;
  uint64_t v2 = (*(void *)v1 + 240) & 0xFFFFFFFFFFFFLL | 0x563E000000000000;
  v0[20] = *(void *)(*(void *)v1 + 240);
  v0[21] = v2;
  return MEMORY[0x270FA2498](sub_24A7AFAB4, v1, 0);
}

uint64_t sub_24A7AFAB4()
{
  *(void *)(v0 + 176) = (*(uint64_t (**)(void))(v0 + 160))();
  *(void *)(v0 + 184) = 0;
  return MEMORY[0x270FA2498](sub_24A7AFB4C, 0, 0);
}

uint64_t sub_24A7AFB4C()
{
  uint64_t v72 = v0;
  unint64_t v1 = *(void *)(v0 + 176);
  if (v1)
  {
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v47 = sub_24A7B37A8();
      swift_bridgeObjectRelease();
      if (v47)
      {
LABEL_4:
        id v2 = *(id *)(v0 + 88);
        uint64_t v3 = sub_24A7A2E34(v1, v2);

        if (v3)
        {
          uint64_t v4 = *(void *)(v0 + 96);
          swift_bridgeObjectRelease();
          uint64_t v5 = *(void **)(v0 + 88);
          if (v4 == 2) {
            id v6 = sub_24A7B0578(v5);
          }
          else {
            id v6 = v5;
          }
          id v30 = v6;
          uint64_t v31 = *(void *)(v0 + 136);
          uint64_t v32 = *(void *)(v0 + 112);
          uint64_t v33 = *(void *)(v0 + 120);
          uint64_t v34 = *(void *)(v0 + 96);
          uint64_t v35 = sub_24A7ABB80();
          uint64_t v69 = v30;
          (*(void (**)(void *, id, uint64_t))(*(void *)v35 + 152))(v3, v30, v34);
          swift_release();
          uint64_t v36 = sub_24A796BD0();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16))(v31, v36, v32);
          unint64_t v37 = sub_24A7B32E8();
          os_log_type_t v38 = sub_24A7B3508();
          BOOL v39 = os_log_type_enabled(v37, v38);
          uint64_t v40 = *(void *)(v0 + 136);
          uint64_t v42 = *(void *)(v0 + 112);
          uint64_t v41 = *(void *)(v0 + 120);
          if (v39)
          {
            uint64_t v43 = swift_slowAlloc();
            uint64_t type = swift_slowAlloc();
            v71[0] = type;
            *(_DWORD *)uint64_t v43 = 136315394;
            uint64_t v44 = sub_24A7B3998();
            *(void *)(v0 + 64) = sub_24A78F4E0(v44, v45, v71);
            sub_24A7B3608();
            swift_bridgeObjectRelease();
            *(_WORD *)(v43 + 12) = 2080;
            *(void *)(v0 + 72) = sub_24A78F4E0(0xD00000000000001DLL, 0x800000024A7B8D00, v71);
            sub_24A7B3608();
            _os_log_impl(&dword_24A77B000, v37, v38, "%s.%s: resetting delegate notification suspension timer", (uint8_t *)v43, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x24C5D05E0](type, -1, -1);
            MEMORY[0x24C5D05E0](v43, -1, -1);

            (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
          }
          else
          {

            (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
          }
          sub_24A7ADC5C();
        }
        else
        {
          uint64_t v7 = *(void *)(v0 + 144);
          uint64_t v8 = *(void *)(v0 + 112);
          uint64_t v9 = *(void *)(v0 + 120);
          uint64_t v10 = *(void **)(v0 + 88);
          uint64_t v11 = sub_24A796BD0();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v11, v8);
          id v12 = v10;
          swift_bridgeObjectRetain();
          id v13 = v12;
          uint64_t v14 = sub_24A7B32E8();
          os_log_type_t v15 = sub_24A7B3508();
          BOOL v16 = os_log_type_enabled(v14, v15);
          uint64_t v17 = *(void *)(v0 + 144);
          uint64_t v18 = *(void *)(v0 + 112);
          uint64_t v19 = *(void *)(v0 + 120);
          if (v16)
          {
            uint64_t v68 = *(void *)(v0 + 112);
            uint64_t v20 = *(void **)(v0 + 88);
            uint64_t v21 = swift_slowAlloc();
            unint64_t v64 = (void *)swift_slowAlloc();
            uint64_t v66 = swift_slowAlloc();
            v71[0] = v66;
            *(_DWORD *)uint64_t v21 = 136315906;
            uint64_t v67 = v17;
            uint64_t v22 = sub_24A7B3998();
            *(void *)(v0 + 32) = sub_24A78F4E0(v22, v23, v71);
            sub_24A7B3608();
            swift_bridgeObjectRelease();
            *(_WORD *)(v21 + 12) = 2080;
            *(void *)(v0 + 40) = sub_24A78F4E0(0xD00000000000001DLL, 0x800000024A7B8D00, v71);
            sub_24A7B3608();
            *(_WORD *)(v21 + 22) = 2112;
            *(void *)(v0 + 48) = v20;
            id v24 = v20;
            sub_24A7B3608();
            *unint64_t v64 = v20;

            *(_WORD *)(v21 + 32) = 2080;
            uint64_t v25 = sub_24A787494(0, (unint64_t *)&unk_26B17A3B0);
            uint64_t v26 = swift_bridgeObjectRetain();
            uint64_t v27 = MEMORY[0x24C5CF810](v26, v25);
            unint64_t v29 = v28;
            swift_bridgeObjectRelease();
            *(void *)(v0 + 56) = sub_24A78F4E0(v27, v29, v71);
            sub_24A7B3608();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_24A77B000, v14, v15, "%s.%s: not logging, could not find stack that contains %@ in configuration: %s", (uint8_t *)v21, 0x2Au);
            __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1D0);
            swift_arrayDestroy();
            MEMORY[0x24C5D05E0](v64, -1, -1);
            swift_arrayDestroy();
            MEMORY[0x24C5D05E0](v66, -1, -1);
            MEMORY[0x24C5D05E0](v21, -1, -1);

            (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v67, v68);
          }
          else
          {
            uint64_t v46 = *(void **)(v0 + 88);

            swift_bridgeObjectRelease_n();
            (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
          }
        }
        goto LABEL_20;
      }
    }
    else if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_4;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v49 = *(void *)(v0 + 120);
  uint64_t v48 = *(void *)(v0 + 128);
  uint64_t v50 = *(void *)(v0 + 112);
  uint64_t v51 = sub_24A796BD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16))(v48, v51, v50);
  uint64_t v52 = sub_24A7B32E8();
  os_log_type_t v53 = sub_24A7B3508();
  BOOL v54 = os_log_type_enabled(v52, v53);
  uint64_t v56 = *(void *)(v0 + 120);
  uint64_t v55 = *(void *)(v0 + 128);
  uint64_t v57 = *(void *)(v0 + 112);
  if (v54)
  {
    uint64_t v70 = *(void *)(v0 + 112);
    uint64_t v58 = swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    v71[0] = v59;
    *(_DWORD *)uint64_t v58 = 136315394;
    uint64_t v60 = sub_24A7B3998();
    *(void *)(v0 + 16) = sub_24A78F4E0(v60, v61, v71);
    sub_24A7B3608();
    swift_bridgeObjectRelease();
    *(_WORD *)(v58 + 12) = 2080;
    *(void *)(v0 + 24) = sub_24A78F4E0(0xD00000000000001DLL, 0x800000024A7B8D00, v71);
    sub_24A7B3608();
    _os_log_impl(&dword_24A77B000, v52, v53, "%s.%s: not logging, no stacks in configuration", (uint8_t *)v58, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v59, -1, -1);
    MEMORY[0x24C5D05E0](v58, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v70);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v57);
  }
LABEL_20:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v62 = *(uint64_t (**)(void))(v0 + 8);
  return v62();
}

uint64_t sub_24A7B033C()
{
  uint64_t v20 = v0;
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  uint64_t v3 = v0[14];
  uint64_t v4 = sub_24A796BD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_24A7B32E8();
  os_log_type_t v6 = sub_24A7B3508();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = v0[15];
    uint64_t v18 = v0[16];
    uint64_t v8 = v0[14];
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v19 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v11 = sub_24A7B3998();
    v0[2] = sub_24A78F4E0(v11, v12, &v19);
    sub_24A7B3608();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    v0[3] = sub_24A78F4E0(0xD00000000000001DLL, 0x800000024A7B8D00, &v19);
    sub_24A7B3608();
    _os_log_impl(&dword_24A77B000, v5, v6, "%s.%s: not logging, no stacks in configuration", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v10, -1, -1);
    MEMORY[0x24C5D05E0](v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v18, v8);
  }
  else
  {
    uint64_t v14 = v0[15];
    uint64_t v13 = v0[16];
    uint64_t v15 = v0[14];

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

id sub_24A7B0578(void *a1)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = sub_24A7B32F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR___ATXAmbientSuggestionProvider_lock);
  uint64_t v9 = (uint64_t)&v8[4];
  uint64_t v10 = v8 + 6;
  os_unfair_lock_lock(v8 + 6);
  sub_24A7ABD24(v9, (uint64_t *)&v42);
  os_unfair_lock_unlock(v10);
  unint64_t v11 = v42;
  if (v42)
  {
    id v40 = a1;
    unint64_t v42 = MEMORY[0x263F8EE78];
    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      id result = (id)sub_24A7B37A8();
      uint64_t v12 = (uint64_t)result;
      if (result) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id result = (id)swift_bridgeObjectRetain();
      if (v12)
      {
LABEL_4:
        if (v12 < 1)
        {
          __break(1u);
          return result;
        }
        v37[1] = ObjectType;
        uint64_t v38 = v5;
        uint64_t v39 = v4;
        for (uint64_t i = 0; i != v12; ++i)
        {
          if ((v11 & 0xC000000000000001) != 0) {
            id v15 = (id)MEMORY[0x24C5CFAE0](i, v11);
          }
          else {
            id v15 = *(id *)(v11 + 8 * i + 32);
          }
          BOOL v16 = v15;
          id v17 = objc_msgSend(v15, sel_topWidget);

          if (v17)
          {
            MEMORY[0x24C5CF7E0]();
            if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_24A7B3448();
            }
            sub_24A7B3458();
            sub_24A7B3438();
          }
        }
        swift_bridgeObjectRelease();
        unint64_t v18 = v42;
        uint64_t v5 = v38;
        uint64_t v4 = v39;
        goto LABEL_17;
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v18 = MEMORY[0x263F8EE78];
LABEL_17:
    swift_bridgeObjectRelease();
    id v19 = v40;
    id v20 = v40;
    uint64_t v21 = (void *)sub_24A7B25F0(v18, v20);
    a1 = v19;
    swift_bridgeObjectRelease();

    if (v21)
    {
      id v22 = v21;
      id v23 = objc_msgSend(v22, sel_source);
      id v24 = objc_msgSend(v20, sel_copyWithSource_, v23);

      return v24;
    }
  }
  uint64_t v25 = sub_24A796BD0();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v25, v4);
  id v40 = a1;
  uint64_t v26 = sub_24A7B32E8();
  os_log_type_t v27 = sub_24A7B34F8();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = swift_slowAlloc();
    unint64_t v29 = (void *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v38 = v5;
    uint64_t v31 = v30;
    unint64_t v42 = v30;
    *(_DWORD *)uint64_t v28 = 136315650;
    uint64_t v32 = sub_24A7B3998();
    uint64_t v41 = sub_24A78F4E0(v32, v33, (uint64_t *)&v42);
    sub_24A7B3608();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2080;
    uint64_t v41 = sub_24A78F4E0(0xD00000000000002CLL, 0x800000024A7B8CB0, (uint64_t *)&v42);
    sub_24A7B3608();
    *(_WORD *)(v28 + 22) = 2112;
    uint64_t v41 = (uint64_t)v40;
    id v34 = v40;
    uint64_t v39 = v4;
    id v35 = v34;
    sub_24A7B3608();
    *unint64_t v29 = v40;

    _os_log_impl(&dword_24A77B000, v26, v27, "%s.%s: could not find widget suggestion for systemSuggest rotation to %@", (uint8_t *)v28, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA1D0);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v29, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v31, -1, -1);
    MEMORY[0x24C5D05E0](v28, -1, -1);

    (*(void (**)(char *, uint64_t))(v38 + 8))(v7, v39);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  id v36 = v40;
  return v36;
}

void ATXAmbientSuggestionProvider.logWidgetStack(_:didChangeTo:reason:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v9 = sub_24A7B32F8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3 == 2) {
    id v13 = sub_24A7B0578(a2);
  }
  else {
    id v13 = a2;
  }
  uint64_t v14 = v13;
  uint64_t v15 = sub_24A7ABB80();
  (*(void (**)(uint64_t, void *, uint64_t))(*(void *)v15 + 152))(a1, v14, a3);
  swift_release();
  uint64_t v16 = sub_24A796BD0();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v16, v9);
  id v17 = sub_24A7B32E8();
  os_log_type_t v18 = sub_24A7B3508();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v30 = v14;
    uint64_t v21 = v20;
    v33[0] = v20;
    *(_DWORD *)uint64_t v19 = 136315394;
    uint64_t v22 = sub_24A7B3998();
    uint64_t v31 = ObjectType;
    uint64_t v32 = sub_24A78F4E0(v22, v23, v33);
    uint64_t v29 = v9;
    sub_24A7B3608();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    uint64_t v32 = sub_24A78F4E0(0xD000000000000025, 0x800000024A7B89A0, v33);
    uint64_t ObjectType = v31;
    sub_24A7B3608();
    _os_log_impl(&dword_24A77B000, v17, v18, "%s.%s: resetting delegate notification suspension timer", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    uint64_t v24 = v21;
    uint64_t v14 = v30;
    MEMORY[0x24C5D05E0](v24, -1, -1);
    MEMORY[0x24C5D05E0](v19, -1, -1);

    uint64_t v25 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v29);
  }
  else
  {

    uint64_t v25 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  MEMORY[0x270FA5388](v25);
  *(&v29 - 4) = 0x4072C00000000000;
  *(&v29 - 3) = v4;
  *(&v29 - 2) = ObjectType;
  uint64_t v27 = (uint64_t)&v26[4];
  uint64_t v28 = v26 + 6;
  os_unfair_lock_lock(v26 + 6);
  sub_24A7B2324(v27);
  os_unfair_lock_unlock(v28);
}

uint64_t sub_24A7B0FB4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 112))();
  *a2 = result;
  return result;
}

Swift::Void __swiftcall ATXAmbientSuggestionProvider.ambientConfigurationManagerCacheDidUpdate()()
{
}

id sub_24A7B1064()
{
  return sub_24A7B2040("%s: suggestion provider updated snapshot, requesting coalesced refresh");
}

uint64_t ATXAmbientSuggestionProvider.readStacks()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24A7B10A4, 0, 0);
}

uint64_t sub_24A7B10A4()
{
  uint64_t v1 = *(void *)(v0[2] + OBJC_IVAR___ATXAmbientSuggestionProvider_configurationManager);
  v0[3] = v1;
  uint64_t v2 = (*(void *)v1 + 240) & 0xFFFFFFFFFFFFLL | 0x563E000000000000;
  v0[4] = *(void *)(*(void *)v1 + 240);
  v0[5] = v2;
  return MEMORY[0x270FA2498](sub_24A7B10EC, v1, 0);
}

uint64_t sub_24A7B10EC()
{
  uint64_t v1 = (*(uint64_t (**)(void))(v0 + 32))();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24A7B12D4(const void *a1, void *a2)
{
  *(void *)(v2 + 16) = a2;
  *(void *)(v2 + 24) = _Block_copy(a1);
  id v4 = a2;
  return MEMORY[0x270FA2498](sub_24A7B134C, 0, 0);
}

uint64_t sub_24A7B134C()
{
  uint64_t v1 = *(void *)(v0[2] + OBJC_IVAR___ATXAmbientSuggestionProvider_configurationManager);
  v0[4] = v1;
  uint64_t v2 = (*(void *)v1 + 240) & 0xFFFFFFFFFFFFLL | 0x563E000000000000;
  v0[5] = *(void *)(*(void *)v1 + 240);
  v0[6] = v2;
  return MEMORY[0x270FA2498](sub_24A7B1394, v1, 0);
}

uint64_t sub_24A7B1394()
{
  uint64_t v1 = (*(uint64_t (**)(void))(v0 + 40))();
  *(void *)(v0 + 56) = 0;
  uint64_t v2 = v1;

  if (v2)
  {
    sub_24A787494(0, (unint64_t *)&unk_26B17A3B0);
    uint64_t v3 = (void *)sub_24A7B3408();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = *(void (***)(void, void, void))(v0 + 24);
  ((void (**)(void, void *, void))v4)[2](v4, v3, 0);

  _Block_release(v4);
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_24A7B14B8()
{
  uint64_t v1 = *(void **)(v0 + 56);

  uint64_t v2 = (void *)sub_24A7B31E8();
  uint64_t v3 = *(void (***)(void, void, void))(v0 + 24);
  ((void (**)(void, void, void *))v3)[2](v3, 0, v2);

  _Block_release(v3);
  id v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t ATXAmbientSuggestionProvider.write(_:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24A7B1578, 0, 0);
}

uint64_t sub_24A7B1578()
{
  uint64_t v1 = *(void *)(v0[3] + OBJC_IVAR___ATXAmbientSuggestionProvider_configurationManager);
  v0[4] = v1;
  uint64_t v2 = (*(void *)v1 + 248) & 0xFFFFFFFFFFFFLL | 0x7EED000000000000;
  v0[5] = *(void *)(*(void *)v1 + 248);
  v0[6] = v2;
  return MEMORY[0x270FA2498](sub_24A7B15C0, v1, 0);
}

uint64_t sub_24A7B15C0()
{
  (*(void (**)(void))(v0 + 40))(*(void *)(v0 + 16));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A7B17C0(int a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  sub_24A787494(0, (unint64_t *)&unk_26B17A3B0);
  v3[4] = sub_24A7B3418();
  id v5 = a3;
  return MEMORY[0x270FA2498](sub_24A7B1868, 0, 0);
}

uint64_t sub_24A7B1868()
{
  uint64_t v1 = *(void *)(v0[2] + OBJC_IVAR___ATXAmbientSuggestionProvider_configurationManager);
  v0[5] = v1;
  uint64_t v2 = (*(void *)v1 + 248) & 0xFFFFFFFFFFFFLL | 0x7EED000000000000;
  v0[6] = *(void *)(*(void *)v1 + 248);
  v0[7] = v2;
  return MEMORY[0x270FA2498](sub_24A7B18B0, v1, 0);
}

uint64_t sub_24A7B18B0()
{
  (*(void (**)(void))(v0 + 48))(*(void *)(v0 + 32));
  *(void *)(v0 + 64) = 0;
  uint64_t v1 = *(void *)(v0 + 24);

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
  _Block_release(*(const void **)(v0 + 24));
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24A7B1994()
{
  uint64_t v1 = *(void **)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 24);

  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_24A7B31E8();

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  _Block_release(*(const void **)(v0 + 24));
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

void *sub_24A7B1A40@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_24A7B1A50(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t _s11GuardedDataCMa()
{
  return self;
}

uint64_t sub_24A7B1A80()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A7B1AB8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A7B1AF0()
{
  return sub_24A7ACB6C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_24A7B1B10()
{
  return sub_24A7AD688(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24A7B1B18(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24A7B37A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24A7B37A8();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x24C5CFAF0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_24A7B1CE4(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24A7B37A8();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_24A7B3438();
}

uint64_t sub_24A7B1CE4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24A7B37A8();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_24A7B37A8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_24A7B2A74(&qword_2697BA710, &qword_2697B9E48);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2697B9E48);
          uint64_t v12 = sub_24A7B1F08(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for ContextualSuggestion();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_24A7B37E8();
  __break(1u);
  return result;
}

void (*sub_24A7B1F08(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_24A7B1FB8(v6, a2, a3);
  return sub_24A7B1F70;
}

void sub_24A7B1F70(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_24A7B1FB8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x24C5CFAE0](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_24A7B2038;
  }
  __break(1u);
  return result;
}

void sub_24A7B2038(id *a1)
{
}

id sub_24A7B2040(const char *a1)
{
  uint64_t v3 = v1;
  swift_getObjectType();
  uint64_t v4 = sub_24A7B32F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24A796BD0();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = sub_24A7B32E8();
  os_log_type_t v10 = sub_24A7B3508();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v18 = v3;
    uint64_t v11 = swift_slowAlloc();
    id v17 = a1;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v20 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v14 = sub_24A7B3998();
    uint64_t v19 = sub_24A78F4E0(v14, v15, &v20);
    uint64_t v3 = v18;
    sub_24A7B3608();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A77B000, v9, v10, v17, v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5D05E0](v13, -1, -1);
    MEMORY[0x24C5D05E0](v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id result = *(id *)(v3 + OBJC_IVAR___ATXAmbientSuggestionProvider_refreshTimer);
  if (result) {
    return objc_msgSend(result, sel_runAfterDelaySeconds_coalescingBehavior_, 0, 1.0);
  }
  __break(1u);
  return result;
}

uint64_t sub_24A7B2278()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v4 = v0[7];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_24A786034;
  return sub_24A7AF98C((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

void sub_24A7B2324(uint64_t a1)
{
  sub_24A7AEF10(a1, *(void *)(v1 + 24), *(void *)(v1 + 32), *(double *)(v1 + 16));
}

char *keypath_get_selector_delegate()
{
  return sel_delegate;
}

uint64_t type metadata accessor for ATXAmbientSuggestionProvider(uint64_t a1)
{
  return sub_24A787494(a1, qword_2697BD328);
}

uint64_t sub_24A7B2374()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24A7B23BC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_24A786034;
  uint64_t v6 = (uint64_t (*)(int, void *, void *))((char *)&dword_2697BA6A0 + dword_2697BA6A0);
  return v6(v2, v3, v4);
}

uint64_t sub_24A7B2478()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A7B24B0()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A7B24F0()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24A786034;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_2697BA6C8 + dword_2697BA6C8);
  return v5(v2, v3);
}

uint64_t objectdestroy_12Tm()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24A7B25F0(unint64_t a1, void *a2)
{
  if (a1 >> 62)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24A7B37A8();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      for (uint64_t i = 4; ; ++i)
      {
        uint64_t v5 = i - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v6 = (id)MEMORY[0x24C5CFAE0](i - 4, a1);
          uint64_t v7 = i - 3;
          if (__OFADD__(v5, 1)) {
            goto LABEL_18;
          }
        }
        else
        {
          id v6 = *(id *)(a1 + 8 * i);
          uint64_t v7 = i - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_18:
            __break(1u);
            goto LABEL_19;
          }
        }
        uint64_t v20 = v6;
        id v8 = objc_msgSend(v6, sel_identifier);
        uint64_t v9 = sub_24A7B3398();
        uint64_t v11 = v10;

        id v12 = objc_msgSend(a2, sel_identifier);
        uint64_t v13 = sub_24A7B3398();
        uint64_t v15 = v14;

        if (v9 == v13 && v11 == v15)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_17:
          uint64_t v3 = (uint64_t)v20;
          swift_bridgeObjectRelease();
          return v3;
        }
        char v17 = sub_24A7B3878();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v17) {
          goto LABEL_17;
        }

        if (v7 == v3)
        {
          swift_bridgeObjectRelease();
          return 0;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return v3;
}

void sub_24A7B27B4()
{
  sub_24A7AF088(*(void *)(v0 + 16));
}

uint64_t sub_24A7B27BC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24A7AF1D0(a1, a2);
}

uint64_t sub_24A7B27EC()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24A786034;
  return sub_24A7AD7DC((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_24A7B2884(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = *(void (**)(uint64_t))(*(void *)*a1 + 120);
  uint64_t v3 = swift_bridgeObjectRetain();
  v2(v3);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(*(void *)v1 + 144);
  uint64_t v5 = swift_bridgeObjectRetain();
  return v4(v5);
}

uint64_t sub_24A7B2918(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24A7B2958@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24A7AE6DC(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_24A7B2984()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24A7B29C4()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = objc_msgSend(v1, sel_delegate);
  if (v2)
  {
    uint64_t v3 = v2;
    type metadata accessor for ATXWidgetStackSuggestion(0);
    id v4 = (id)sub_24A7B3408();
    objc_msgSend(v3, sel_suggestionProvider_didUpdateStackSuggestions_, v1, v4);
    swift_unknownObjectRelease();
  }
}

uint64_t sub_24A7B2A74(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t objectdestroy_71Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24A7B2AFC()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *id v4 = v1;
  v4[1] = sub_24A786034;
  return sub_24A7ACCC0((uint64_t)v4, v5, v6, v2, v3);
}

void sub_24A7B2BBC(uint64_t a1)
{
}

void *sub_24A7B2BEC()
{
  return &unk_26528E790;
}

unint64_t contextualSuggestionServiceMachServiceName.getter()
{
  return 0xD000000000000034;
}

uint64_t contextualSuggestionServerInterface.getter()
{
  objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26FE4C1F8);
  uint64_t v0 = sub_24A787494(0, (unint64_t *)&unk_26B17A3D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A400);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_24A7B4BB0;
  *(void *)(v1 + 56) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BA790);
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_24A787494(0, (unint64_t *)&qword_2697BA5F0);
  *(void *)(v1 + 88) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BA7A0);
  *(void *)(v1 + 64) = v2;
  MEMORY[0x24C5CF980](v1);
  uint64_t result = sub_24A7B34B8();
  __break(1u);
  __break(1u);
  return result;
}

uint64_t contextualSuggestionServiceInterface.getter()
{
  objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26FE47268);
  sub_24A787494(0, (unint64_t *)&unk_26B17A3D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A400);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_24A7B5890;
  uint64_t v1 = sub_24A787494(0, &qword_2697BA390);
  *(void *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BA7B0);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_24A787494(0, (unint64_t *)&qword_2697BA5F0);
  *(void *)(v0 + 88) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BA7A0);
  *(void *)(v0 + 64) = v2;
  uint64_t v3 = type metadata accessor for ContextualSuggestionSnapshot();
  *(void *)(v0 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_2697BA398);
  *(void *)(v0 + 96) = v3;
  MEMORY[0x24C5CF980](v0);
  uint64_t result = sub_24A7B34B8();
  __break(1u);
  return result;
}

uint64_t sub_24A7B3148()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_24A7B3158()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_24A7B3168()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_24A7B3178()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_24A7B3188()
{
  return MEMORY[0x270EEE3A8]();
}

uint64_t sub_24A7B3198()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_24A7B31A8()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_24A7B31B8()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_24A7B31C8()
{
  return MEMORY[0x270EEE940]();
}

uint64_t sub_24A7B31D8()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_24A7B31E8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24A7B31F8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24A7B3208()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24A7B3218()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24A7B3228()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_24A7B3238()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24A7B3248()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24A7B3258()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24A7B3268()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24A7B3278()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24A7B3288()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_24A7B3298()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_24A7B32A8()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_24A7B32B8()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_24A7B32C8()
{
  return MEMORY[0x270F16668]();
}

uint64_t sub_24A7B32D8()
{
  return MEMORY[0x270F16670]();
}

uint64_t sub_24A7B32E8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24A7B32F8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24A7B3308()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_24A7B3318()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24A7B3328()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_24A7B3338()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24A7B3348()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24A7B3358()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24A7B3368()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24A7B3378()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24A7B3388()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24A7B3398()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24A7B33A8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24A7B33B8()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_24A7B33C8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24A7B33D8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24A7B33E8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24A7B33F8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24A7B3408()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24A7B3418()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24A7B3428()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24A7B3438()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24A7B3448()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24A7B3458()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24A7B3468()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_24A7B3478()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24A7B3488()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24A7B3498()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24A7B34A8()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_24A7B34B8()
{
  return MEMORY[0x270EF1CA8]();
}

uint64_t sub_24A7B34C8()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_24A7B34D8()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_24A7B34E8()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24A7B34F8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24A7B3508()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24A7B3518()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24A7B3528()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24A7B3538()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_24A7B3548()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24A7B3558()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24A7B3568()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_24A7B3578()
{
  return MEMORY[0x270F166A0]();
}

uint64_t sub_24A7B3588()
{
  return MEMORY[0x270F166A8]();
}

uint64_t sub_24A7B3598()
{
  return MEMORY[0x270EF2068]();
}

uint64_t sub_24A7B35A8()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_24A7B35B8()
{
  return MEMORY[0x270EF2100]();
}

uint64_t sub_24A7B35C8()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_24A7B35D8()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_24A7B35E8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24A7B35F8()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_24A7B3608()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24A7B3618()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24A7B3628()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24A7B3638()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24A7B3648()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24A7B3658()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_24A7B3668()
{
  return MEMORY[0x270F9E8B8]();
}

uint64_t sub_24A7B3678()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24A7B3688()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_24A7B36A8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24A7B36B8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24A7B36C8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24A7B36D8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24A7B36E8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24A7B36F8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24A7B3708()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_24A7B3718()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24A7B3728()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24A7B3738()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24A7B3748()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24A7B3758()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24A7B3768()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24A7B3778()
{
  return MEMORY[0x270F9ED20]();
}

uint64_t sub_24A7B3788()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24A7B3798()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24A7B37A8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24A7B37B8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24A7B37C8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24A7B37D8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24A7B37E8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24A7B37F8()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_24A7B3808()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24A7B3818()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24A7B3828()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24A7B3838()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24A7B3848()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24A7B3858()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24A7B3868()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_24A7B3878()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24A7B3888()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24A7B3898()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24A7B38A8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24A7B38B8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24A7B38C8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24A7B38D8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24A7B38E8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24A7B38F8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24A7B3908()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24A7B3918()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24A7B3928()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_24A7B3938()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_24A7B3948()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t sub_24A7B3958()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24A7B3968()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24A7B3998()
{
  return MEMORY[0x270FA0128]();
}

uint64_t ATXBundleIdIsSpecialWidgetExtensionBundleId()
{
  return MEMORY[0x270F0CBE0]();
}

uint64_t ATXSpecialWidgetKindAppPredictions()
{
  return MEMORY[0x270F0CBF8]();
}

uint64_t ATXSpecialWidgetKindFiles()
{
  return MEMORY[0x270F0CC00]();
}

uint64_t ATXSpecialWidgetKindShortcutsSingle()
{
  return MEMORY[0x270F0CC08]();
}

uint64_t ATXSpecialWidgetKindSiriSuggestions()
{
  return MEMORY[0x270F0CC10]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

uint64_t CHSWidgetFamilyMaskFromWidgetFamily()
{
  return MEMORY[0x270F166D0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t NSStringFromWidgetFamily()
{
  return MEMORY[0x270F166F0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}