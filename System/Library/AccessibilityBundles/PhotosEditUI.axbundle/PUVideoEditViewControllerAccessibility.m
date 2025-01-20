@interface PUVideoEditViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_updateButtonsIfNeeded;
@end

@implementation PUVideoEditViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUVideoEditViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PUVideoEditViewController" hasInstanceVariable:@"_playButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUVideoEditViewController", @"_updateButtonsIfNeeded", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUVideoEditViewController", @"_playerIsPlaying", "B", 0);
}

- (void)_updateButtonsIfNeeded
{
  v13.receiver = self;
  v13.super_class = (Class)PUVideoEditViewControllerAccessibility;
  [(PUVideoEditViewControllerAccessibility *)&v13 _updateButtonsIfNeeded];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v8 = MEMORY[0x263EF8330];
  AXPerformSafeBlock();
  int v3 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  v4 = @"video.edit.pause";
  if (!v3) {
    v4 = @"video.edit.play";
  }
  v5 = v4;
  v6 = [(PUVideoEditViewControllerAccessibility *)self safeValueForKey:@"_playButton", v8, 3221225472, __64__PUVideoEditViewControllerAccessibility__updateButtonsIfNeeded__block_invoke, &unk_2650A54E0, self, &v9];
  v7 = accessibilityPhotosEditUILocalizedString(v5);

  [v6 setAccessibilityLabel:v7];
}

uint64_t __64__PUVideoEditViewControllerAccessibility__updateButtonsIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _playerIsPlaying];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end