@interface LyricsSelectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)accessibilityDidSelectItem;
@end

@implementation LyricsSelectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Music.LyricsSelectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.LyricsSelectionViewController", @"accessibilityCharacterCount", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.LyricsSelectionViewController", @"accessibilityDidSelectItem", "v", 0);
}

- (void)accessibilityDidSelectItem
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  AXPerformBlockOnMainThreadAfterDelay();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __72__LyricsSelectionViewControllerAccessibility_accessibilityDidSelectItem__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained safeIntegerForKey:@"accessibilityCharacterCount"];

  accessibilityMusicLocalizedString(@"lyrics.sharing.characters.remaining");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = AXCFormattedString();
  UIAccessibilitySpeakOrQueueIfNeeded();
}

@end