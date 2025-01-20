@interface UIKeyboardEmojiSectionHeaderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIKeyboardEmojiSectionHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardEmojiSectionHeader";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardEmojiSectionHeader", @"headerName", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityElementsHidden
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v20 = self;
  SEL v19 = a2;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    uint64_t v18 = [(UIKeyboardEmojiSectionHeaderAccessibility *)v20 _accessibilityIntegerValueForKey:@"emojiCategory"];
    id v17 = (id)[(UIKeyboardEmojiSectionHeaderAccessibility *)v20 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uikeyboardemoj_11.isa)];
    id v8 = (id)[v17 superview];
    id v16 = (id)[v8 subviews];

    id location = 0;
    memset(__b, 0, sizeof(__b));
    id obj = v16;
    uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
    if (v10)
    {
      uint64_t v5 = *(void *)__b[2];
      uint64_t v6 = 0;
      unint64_t v7 = v10;
      while (1)
      {
        uint64_t v4 = v6;
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(id *)(__b[1] + 8 * v6);
        NSClassFromString(&cfstr_Uikeyboardemoj_1.isa);
        if (objc_opt_isKindOfClass()) {
          break;
        }
        ++v6;
        if (v4 + 1 >= v7)
        {
          uint64_t v6 = 0;
          unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
          if (!v7) {
            goto LABEL_10;
          }
        }
      }
      objc_storeStrong(&location, v14);
      int v12 = 2;
    }
    else
    {
LABEL_10:
      int v12 = 0;
    }

    uint64_t v2 = [location safeIntegerForKey:@"selectedIndex"];
    char v21 = v2 != v18;
    int v12 = 1;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
  }
  else
  {
    v11.receiver = v20;
    v11.super_class = (Class)UIKeyboardEmojiSectionHeaderAccessibility;
    char v21 = [(UIKeyboardEmojiSectionHeaderAccessibility *)&v11 accessibilityElementsHidden];
  }
  return v21 & 1;
}

- (id)accessibilityLabel
{
  return (id)[(UIKeyboardEmojiSectionHeaderAccessibility *)self headerName];
}

- (unint64_t)accessibilityTraits
{
  uint64_t v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardEmojiSectionHeaderAccessibility;
  return [(UIKeyboardEmojiSectionHeaderAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CEF8];
}

@end