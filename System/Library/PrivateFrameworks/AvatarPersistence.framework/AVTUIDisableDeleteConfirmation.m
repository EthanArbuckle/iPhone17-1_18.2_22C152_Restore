@interface AVTUIDisableDeleteConfirmation
@end

@implementation AVTUIDisableDeleteConfirmation

uint64_t __AVTUIDisableDeleteConfirmation_once_block_invoke()
{
  uint64_t result = _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesDisableDeleteConfirmation", 0);
  AVTUIDisableDeleteConfirmation_once_enabled = result;
  return result;
}

@end