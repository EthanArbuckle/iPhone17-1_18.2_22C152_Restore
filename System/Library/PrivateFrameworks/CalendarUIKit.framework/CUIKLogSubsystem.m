@interface CUIKLogSubsystem
+ (OS_os_log)autocomplete;
+ (OS_os_log)continuity;
+ (OS_os_log)dateStrings;
+ (OS_os_log)defaultCategory;
+ (OS_os_log)docktile;
+ (OS_os_log)editingContext;
+ (OS_os_log)eventLoader;
+ (OS_os_log)eventStoreEditor;
+ (OS_os_log)locationSearch;
+ (OS_os_log)signpost;
+ (OS_os_log)undo;
+ (OS_os_log)userActions;
@end

@implementation CUIKLogSubsystem

+ (OS_os_log)signpost
{
  if (signpost_onceToken != -1) {
    dispatch_once(&signpost_onceToken, &__block_literal_global_25_0);
  }
  v2 = (void *)signpost_logHandle;

  return (OS_os_log *)v2;
}

+ (OS_os_log)defaultCategory
{
  if (defaultCategory_onceToken != -1) {
    dispatch_once(&defaultCategory_onceToken, &__block_literal_global_27);
  }
  v2 = (void *)defaultCategory_logHandle;

  return (OS_os_log *)v2;
}

+ (OS_os_log)eventLoader
{
  if (eventLoader_onceToken != -1) {
    dispatch_once(&eventLoader_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)eventLoader_logHandle;

  return (OS_os_log *)v2;
}

void __35__CUIKLogSubsystem_defaultCategory__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.cuik", "Default");
  v1 = (void *)defaultCategory_logHandle;
  defaultCategory_logHandle = (uint64_t)v0;
}

void __31__CUIKLogSubsystem_eventLoader__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.cuik", "EventLoader");
  v1 = (void *)eventLoader_logHandle;
  eventLoader_logHandle = (uint64_t)v0;
}

void __28__CUIKLogSubsystem_signpost__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.cuik", "Signpost");
  v1 = (void *)signpost_logHandle;
  signpost_logHandle = (uint64_t)v0;
}

+ (OS_os_log)autocomplete
{
  if (autocomplete_onceToken != -1) {
    dispatch_once(&autocomplete_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)autocomplete_logHandle;

  return (OS_os_log *)v2;
}

void __32__CUIKLogSubsystem_autocomplete__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.cuik", "Autocomplete");
  v1 = (void *)autocomplete_logHandle;
  autocomplete_logHandle = (uint64_t)v0;
}

+ (OS_os_log)continuity
{
  if (continuity_onceToken != -1) {
    dispatch_once(&continuity_onceToken, &__block_literal_global_7_0);
  }
  v2 = (void *)continuity_logHandle;

  return (OS_os_log *)v2;
}

void __30__CUIKLogSubsystem_continuity__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.cuik", "Continuity");
  v1 = (void *)continuity_logHandle;
  continuity_logHandle = (uint64_t)v0;
}

+ (OS_os_log)dateStrings
{
  if (dateStrings_onceToken != -1) {
    dispatch_once(&dateStrings_onceToken, &__block_literal_global_10_1);
  }
  v2 = (void *)dateStrings_logHandle;

  return (OS_os_log *)v2;
}

void __31__CUIKLogSubsystem_dateStrings__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.cuik", "DateStrings");
  v1 = (void *)dateStrings_logHandle;
  dateStrings_logHandle = (uint64_t)v0;
}

+ (OS_os_log)docktile
{
  if (docktile_onceToken != -1) {
    dispatch_once(&docktile_onceToken, &__block_literal_global_13_0);
  }
  v2 = (void *)docktile_logHandle;

  return (OS_os_log *)v2;
}

void __28__CUIKLogSubsystem_docktile__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.cuik", "Docktile");
  v1 = (void *)docktile_logHandle;
  docktile_logHandle = (uint64_t)v0;
}

+ (OS_os_log)editingContext
{
  if (editingContext_onceToken != -1) {
    dispatch_once(&editingContext_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)editingContext_logHandle;

  return (OS_os_log *)v2;
}

void __34__CUIKLogSubsystem_editingContext__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.cuik", "EditingContext");
  v1 = (void *)editingContext_logHandle;
  editingContext_logHandle = (uint64_t)v0;
}

+ (OS_os_log)eventStoreEditor
{
  if (eventStoreEditor_onceToken != -1) {
    dispatch_once(&eventStoreEditor_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)eventStoreEditor_logHandle;

  return (OS_os_log *)v2;
}

void __36__CUIKLogSubsystem_eventStoreEditor__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.cuik", "EventStoreEditor");
  v1 = (void *)eventStoreEditor_logHandle;
  eventStoreEditor_logHandle = (uint64_t)v0;
}

+ (OS_os_log)undo
{
  if (undo_onceToken != -1) {
    dispatch_once(&undo_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)undo_logHandle;

  return (OS_os_log *)v2;
}

void __24__CUIKLogSubsystem_undo__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.cuik", "Undo");
  v1 = (void *)undo_logHandle;
  undo_logHandle = (uint64_t)v0;
}

+ (OS_os_log)userActions
{
  if (userActions_onceToken != -1) {
    dispatch_once(&userActions_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)userActions_logHandle;

  return (OS_os_log *)v2;
}

void __31__CUIKLogSubsystem_userActions__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.cuik", "UserActions");
  v1 = (void *)userActions_logHandle;
  userActions_logHandle = (uint64_t)v0;
}

+ (OS_os_log)locationSearch
{
  if (locationSearch_onceToken != -1) {
    dispatch_once(&locationSearch_onceToken, &__block_literal_global_34);
  }
  v2 = (void *)locationSearch_logHandle;

  return (OS_os_log *)v2;
}

void __34__CUIKLogSubsystem_locationSearch__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.cuik", "LocationSearch");
  v1 = (void *)locationSearch_logHandle;
  locationSearch_logHandle = (uint64_t)v0;
}

@end