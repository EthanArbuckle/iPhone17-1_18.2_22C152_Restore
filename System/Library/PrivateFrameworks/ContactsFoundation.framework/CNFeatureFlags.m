@interface CNFeatureFlags
+ (CNFeatureFlags)currentFlags;
- (BOOL)isFeatureEnabled:(unint64_t)a3;
@end

@implementation CNFeatureFlags

+ (CNFeatureFlags)currentFlags
{
  if (currentFlags_cn_once_token_1 != -1) {
    dispatch_once(&currentFlags_cn_once_token_1, &__block_literal_global_39);
  }
  v2 = (void *)currentFlags_cn_once_object_1;

  return (CNFeatureFlags *)v2;
}

- (BOOL)isFeatureEnabled:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      BOOL result = MEMORY[0x1F40C9FB0]("Contacts", "AccountCache");
      break;
    case 1uLL:
      BOOL result = MEMORY[0x1F40C9FB0]("Contacts", "AccountCacheService");
      break;
    case 2uLL:
      BOOL result = MEMORY[0x1F40C9FB0]("Contacts", "api_query_metrics");
      break;
    case 3uLL:
      BOOL result = MEMORY[0x1F40C9FB0]("Contacts", "image_metadata_caching");
      break;
    case 4uLL:
      BOOL result = MEMORY[0x1F40C9FB0]("Contacts", "contact_card_separation");
      break;
    case 5uLL:
      BOOL result = MEMORY[0x1F40C9FB0]("Contacts", "contact_provider");
      break;
    case 6uLL:
      BOOL result = MEMORY[0x1F40C9FB0]("Contacts", "container_selection");
      break;
    case 7uLL:
      BOOL result = MEMORY[0x1F40C9FB0]("Contacts", "dsds_unknown_number_SIM_line_picker");
      break;
    case 8uLL:
      BOOL result = MEMORY[0x1F40C9FB0]("Contacts", "duplicate_detection");
      break;
    case 9uLL:
      BOOL result = MEMORY[0x1F40C9FB0]("Contacts", "LimitedAccess");
      break;
    case 0xAuLL:
      BOOL result = MEMORY[0x1F40C9FB0]("Health", "medicalid_v2");
      break;
    case 0xBuLL:
      BOOL result = MEMORY[0x1F40C9FB0]("Transparency", "KTStaticId");
      break;
    case 0xCuLL:
      BOOL result = MEMORY[0x1F40C9FB0]("CoreFoundation", "Colorado");
      break;
    case 0xDuLL:
      BOOL result = MEMORY[0x1F40C9FB0]("TelephonyUtilities", "NamePhoto");
      break;
    case 0xEuLL:
      BOOL result = MEMORY[0x1F40C9FB0]("Contacts", "snap_allow_multiple_phone_numbers");
      break;
    case 0xFuLL:
      BOOL result = MEMORY[0x1F40C9FB0]("TelephonyUtilities", "NamePhotoC3");
      break;
    case 0x10uLL:
      BOOL result = MEMORY[0x1F40C9FB0]("TelephonyUtilities", "Wallpaper");
      break;
    case 0x11uLL:
      BOOL result = MEMORY[0x1F40C9FB0]("Contacts", "suggestions_reload_for_selected_recipients");
      break;
    case 0x12uLL:
      BOOL result = MEMORY[0x1F40C9FB0]("Contacts", "unsaved_drafts");
      break;
    case 0x13uLL:
      BOOL result = MEMORY[0x1F40C9FB0]("Contacts", "analyze_database");
      break;
    case 0x14uLL:
      BOOL result = MEMORY[0x1F40C9FB0]("Contacts", "second_stage_autoreprompt");
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

uint64_t __30__CNFeatureFlags_currentFlags__block_invoke()
{
  currentFlags_cn_once_object_1 = objc_alloc_init(CNFeatureFlags);

  return MEMORY[0x1F41817F8]();
}

@end