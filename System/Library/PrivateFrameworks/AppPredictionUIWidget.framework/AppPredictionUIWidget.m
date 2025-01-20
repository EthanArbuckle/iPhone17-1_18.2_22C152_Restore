void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_225AE6E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_225AE7468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSBIconViewClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSBIconViewClass_softClass;
  uint64_t v7 = getSBIconViewClass_softClass;
  if (!getSBIconViewClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSBIconViewClass_block_invoke;
    v3[3] = &unk_264764990;
    v3[4] = &v4;
    __getSBIconViewClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_225AE76AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_225AE7934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_225AE82D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSBHDefaultIconListLayoutProviderClass_block_invoke(uint64_t a1)
{
  SpringBoardHomeLibrary();
  Class result = objc_getClass("SBHDefaultIconListLayoutProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSBHDefaultIconListLayoutProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSBHDefaultIconListLayoutProviderClass_block_invoke_cold_1();
    return (Class)SpringBoardHomeLibrary();
  }
  return result;
}

uint64_t SpringBoardHomeLibrary()
{
  uint64_t v0 = SpringBoardHomeLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t SpringBoardHomeLibraryCore()
{
  if (!SpringBoardHomeLibraryCore_frameworkLibrary) {
    SpringBoardHomeLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return SpringBoardHomeLibraryCore_frameworkLibrary;
}

uint64_t __SpringBoardHomeLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardHomeLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getSBIconLocationRootSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)SpringBoardHomeLibrary();
  uint64_t result = dlsym(v2, "SBIconLocationRoot");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBIconLocationRootSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSBIconListModelClass_block_invoke(uint64_t a1)
{
  SpringBoardHomeLibrary();
  Class result = objc_getClass("SBIconListModel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSBIconListModelClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSBIconListModelClass_block_invoke_cold_1();
    return (Class)__getSBIconListViewClass_block_invoke(v3);
  }
  return result;
}

Class __getSBIconListViewClass_block_invoke(uint64_t a1)
{
  SpringBoardHomeLibrary();
  Class result = objc_getClass("SBIconListView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSBIconListViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSBIconListViewClass_block_invoke_cold_1();
    return (Class)__getSBIconViewClass_block_invoke(v3);
  }
  return result;
}

Class __getSBIconViewClass_block_invoke(uint64_t a1)
{
  SpringBoardHomeLibrary();
  Class result = objc_getClass("SBIconView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSBIconViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSBIconViewClass_block_invoke_cold_1();
    return (Class)__getSBHReusableViewMapClass_block_invoke(v3);
  }
  return result;
}

Class __getSBHReusableViewMapClass_block_invoke(uint64_t a1)
{
  SpringBoardHomeLibraryCore();
  Class result = objc_getClass("SBHReusableViewMap");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBHReusableViewMapClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSBHClockApplicationIconClass_block_invoke(uint64_t a1)
{
  SpringBoardHomeLibrary();
  Class result = objc_getClass("SBHClockApplicationIcon");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSBHClockApplicationIconClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSBHClockApplicationIconClass_block_invoke_cold_1();
    return (Class)__getSBLeafIconClass_block_invoke(v3);
  }
  return result;
}

APUISuggestionsWidgetViewController *__getSBLeafIconClass_block_invoke(uint64_t a1)
{
  SpringBoardHomeLibrary();
  Class result = (APUISuggestionsWidgetViewController *)objc_getClass("SBLeafIcon");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSBLeafIconClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (APUISuggestionsWidgetViewController *)__getSBLeafIconClass_block_invoke_cold_1();
    return [(APUISuggestionsWidgetViewController *)v3 initWithIdentifier:v5 suggestionsClient:v6 layoutSize:v7];
  }
  return result;
}

id __atxlog_handle_default()
{
  if (__atxlog_handle_default_onceToken != -1) {
    dispatch_once(&__atxlog_handle_default_onceToken, &__block_literal_global_1);
  }
  uint64_t v0 = (void *)__atxlog_handle_default_log;
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
  uint64_t v0 = (void *)__atxlog_handle_xpc_log;
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
  uint64_t v0 = (void *)__atxlog_handle_heuristic_log;
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
  uint64_t v0 = (void *)__atxlog_handle_notifications_log;
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
  uint64_t v0 = (void *)__atxlog_handle_pmm_log;
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
  uint64_t v0 = (void *)__atxlog_handle_dailyroutines_log;
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
  uint64_t v0 = (void *)__atxlog_handle_feedback_log;
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
  uint64_t v0 = (void *)__atxlog_handle_modes_log;
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
  uint64_t v0 = (void *)__atxlog_handle_hero_log;
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
  uint64_t v0 = (void *)__atxlog_handle_deletions_log;
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
  uint64_t v0 = (void *)__atxlog_handle_gi_log;
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
  uint64_t v0 = (void *)__atxlog_handle_timeline_log;
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
  uint64_t v0 = (void *)__atxlog_handle_relevant_shortcut_log;
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
  uint64_t v0 = (void *)__atxlog_handle_relevance_model_log;
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
  uint64_t v0 = (void *)__atxlog_handle_watch_log;
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
  uint64_t v0 = (void *)__atxlog_handle_ui_log;
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
  uint64_t v0 = (void *)__atxlog_handle_blending_log;
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
  uint64_t v0 = (void *)__atxlog_handle_blending_internal_cache_log;
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
  uint64_t v0 = (void *)__atxlog_handle_blending_ecosystem_log;
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
  uint64_t v0 = (void *)__atxlog_handle_home_screen_log;
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
  uint64_t v0 = (void *)__atxlog_handle_sleep_schedule_log;
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
  uint64_t v0 = (void *)__atxlog_handle_lock_screen_log;
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
  uint64_t v0 = (void *)__atxlog_handle_anchor_log;
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
  uint64_t v0 = (void *)__atxlog_handle_app_prediction_log;
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
  uint64_t v0 = (void *)__atxlog_handle_action_prediction_log;
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
  uint64_t v0 = (void *)__atxlog_handle_app_library_log;
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
  uint64_t v0 = (void *)__atxlog_handle_app_install_log;
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
  uint64_t v0 = (void *)__atxlog_handle_backup_log;
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
  uint64_t v0 = (void *)__atxlog_handle_metrics_log;
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
  uint64_t v0 = (void *)__atxlog_handle_trial_assets_log;
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
  uint64_t v0 = (void *)__atxlog_handle_notification_management_log;
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
  uint64_t v0 = (void *)__atxlog_handle_contextual_actions_log;
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
  uint64_t v0 = (void *)__atxlog_handle_intents_helper_log;
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
  uint64_t v0 = (void *)__atxlog_handle_context_heuristic_log;
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
  uint64_t v0 = (void *)__atxlog_handle_zkw_hide_log;
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
  uint64_t v0 = (void *)__atxlog_handle_context_user_education_suggestions_log;
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
  uint64_t v0 = (void *)__atxlog_handle_time_intelligence_log;
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
  uint64_t v0 = (void *)__atxlog_handle_contextual_engine_log;
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
  uint64_t v0 = (void *)__atxlog_handle_usage_insights_log;
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
  uint64_t v0 = (void *)__atxlog_handle_notification_categorization_log;
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
  uint64_t v0 = (void *)__atxlog_handle_settings_actions_log;
  return v0;
}

uint64_t ____atxlog_handle_settings_actions_block_invoke()
{
  __atxlog_handle_settings_actions_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "settings_actions");
  return MEMORY[0x270F9A758]();
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t __getSBHDefaultIconListLayoutProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSBIconListModelClass_block_invoke_cold_1(v0);
}

uint64_t __getSBIconListModelClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSBIconListViewClass_block_invoke_cold_1(v0);
}

uint64_t __getSBIconListViewClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSBIconViewClass_block_invoke_cold_1(v0);
}

uint64_t __getSBIconViewClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSBHClockApplicationIconClass_block_invoke_cold_1(v0);
}

uint64_t __getSBHClockApplicationIconClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSBLeafIconClass_block_invoke_cold_1(v0);
}

uint64_t __getSBLeafIconClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[APUISuggestionsWidgetViewController verifyLayoutSizeCompatibility](v0);
}

uint64_t ATXBundleIdReplacementForBundleId()
{
  return MEMORY[0x270F0CBE8]();
}

uint64_t ATXBundleIdReplacementForBundleIdWithWebpageURLHint()
{
  return MEMORY[0x270F0CBF0]();
}

uint64_t ATXSpecialWidgetKindAppPredictions()
{
  return MEMORY[0x270F0CBF8]();
}

uint64_t ATXSpecialWidgetKindSiriSuggestions()
{
  return MEMORY[0x270F0CC10]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F05E98]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x270F05EB8](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x270F05FC0](lhs, rhs);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}