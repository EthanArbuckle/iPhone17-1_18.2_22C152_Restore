@interface CNContact
@end

@implementation CNContact

uint64_t __44__CNContact_UIAdditions__suggestionsEnabled__block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"CNEnableSuggestions", (CFStringRef)*MEMORY[0x1E4F1D3B8], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = result == 0;
  }
  else {
    BOOL v1 = 0;
  }
  char v2 = !v1;
  suggestionsEnabled_enabled = v2;
  return result;
}

uint64_t __60__CNContact_UIAdditions__copyWithCuratingBirthdaySuggestion__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)] ^ 1;
}

uint64_t __60__CNContact_UIAdditions__copyWithCuratingBirthdaySuggestion__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isSuggested]) {
    uint64_t v3 = [v2 isBirthday];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __86__CNContact_UIAdditions__validPropertiesByEvaluatingPredicate_onMultiValueProperties___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [(id)objc_opt_class() multiValuePropertiesSupportingPredicateValidation];
  uint64_t v4 = [v3 containsObject:v2];

  return v4;
}

uint64_t __35__CNContact_UIAdditions__birthdays__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isSuggested]) {
    uint64_t v3 = [v2 isBirthday];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __75__CNContact_UIAdditions__multiValuePropertiesSupportingPredicateValidation__block_invoke()
{
  v6[7] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1ADC8];
  v6[0] = *MEMORY[0x1E4F1AEE0];
  v6[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F1AF10];
  v6[2] = *MEMORY[0x1E4F1AFB0];
  v6[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1AF78];
  v6[4] = *MEMORY[0x1E4F1ADB0];
  v6[5] = v2;
  v6[6] = *MEMORY[0x1E4F1AE60];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:7];
  uint64_t v4 = [v3 copy];
  v5 = (void *)multiValuePropertiesSupportingPredicateValidation_cn_once_object_2;
  multiValuePropertiesSupportingPredicateValidation_cn_once_object_2 = v4;
}

void __48__CNContact_UIAdditions__descriptorForAllUIKeys__block_invoke()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1B8F8];
  uint64_t v1 = +[CNContactViewController descriptorForRequiredKeys];
  v6[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  uint64_t v3 = [NSString stringWithUTF8String:"+[CNContact(UIAdditions) descriptorForAllUIKeys]_block_invoke"];
  uint64_t v4 = [v0 descriptorWithKeyDescriptors:v2 description:v3];
  v5 = (void *)descriptorForAllUIKeys_cn_once_object_1;
  descriptorForAllUIKeys_cn_once_object_1 = v4;
}

uint64_t __59__CNContact_UIAdditions__nameAndPhotoSharingDebugUIEnabled__block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"CNEnableNameAndPhotoSharingDebugUI", (CFStringRef)*MEMORY[0x1E4F1D3B8], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = result == 0;
  }
  else {
    BOOL v1 = 1;
  }
  char v2 = !v1;
  nameAndPhotoSharingDebugUIEnabled_enabled = v2;
  return result;
}

uint64_t __52__CNContact_UIAdditions__downtimeWhitelistUIEnabled__block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"CNEnableDowntimeWhiteListUI", (CFStringRef)*MEMORY[0x1E4F1D3B8], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = result == 0;
  }
  else {
    BOOL v1 = 1;
  }
  char v2 = !v1;
  downtimeWhitelistUIEnabled_enabled = v2;
  return result;
}

uint64_t __47__CNContact_UIAdditions__settableMeCardEnabled__block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"CNEnableSettableMeCard", (CFStringRef)*MEMORY[0x1E4F1D3B8], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = result == 0;
  }
  else {
    BOOL v1 = 1;
  }
  char v2 = !v1;
  settableMeCardEnabled_enabled = v2;
  return result;
}

uint64_t __39__CNContact_UIAdditions__geminiEnabled__block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"CNEnableGemini", (CFStringRef)*MEMORY[0x1E4F1D3B8], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = result == 0;
  }
  else {
    BOOL v1 = 1;
  }
  char v2 = !v1;
  geminiEnabled_enabled = v2;
  return result;
}

uint64_t __45__CNContact_UIAdditions__quickActionsEnabled__block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"CNEnableQuickActions", (CFStringRef)*MEMORY[0x1E4F1D3B8], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = result == 0;
  }
  else {
    BOOL v1 = 1;
  }
  char v2 = !v1;
  quickActionsEnabled_enabled = v2;
  return result;
}

uint64_t __52__CNContact_UIAdditions__suggestionsShownInEditMode__block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"CNShowSuggestionsInEditMode", (CFStringRef)*MEMORY[0x1E4F1D3B8], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = result == 0;
  }
  else {
    BOOL v1 = 1;
  }
  char v2 = !v1;
  suggestionsShownInEditMode_enabled = v2;
  return result;
}

@end