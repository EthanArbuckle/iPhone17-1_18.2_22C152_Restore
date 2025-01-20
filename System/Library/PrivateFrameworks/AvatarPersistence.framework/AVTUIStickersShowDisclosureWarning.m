@interface AVTUIStickersShowDisclosureWarning
@end

@implementation AVTUIStickersShowDisclosureWarning

uint64_t __AVTUIStickersShowDisclosureWarning_once_block_invoke()
{
  uint64_t result = _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesStickersDisclosureWarning", 0);
  AVTUIStickersShowDisclosureWarning_once_enabled = result;
  return result;
}

@end