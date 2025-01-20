@interface UIFont(NUIAccessibilitySupport)
+ (uint64_t)_nui_isAccessibilityEnabled;
@end

@implementation UIFont(NUIAccessibilitySupport)

+ (uint64_t)_nui_isAccessibilityEnabled
{
  uint64_t v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "preferredContentSizeCategory");
  if (+[UIFont(NUIAccessibilitySupport) _nui_isAccessibilityEnabled]::onceToken != -1) {
    dispatch_once(&+[UIFont(NUIAccessibilitySupport) _nui_isAccessibilityEnabled]::onceToken, &__block_literal_global_58);
  }
  v1 = (void *)+[UIFont(NUIAccessibilitySupport) _nui_isAccessibilityEnabled]::largeSizes;
  return [v1 containsObject:v0];
}

@end