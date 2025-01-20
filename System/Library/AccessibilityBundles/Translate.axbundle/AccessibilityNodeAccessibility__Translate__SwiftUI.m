@interface AccessibilityNodeAccessibility__Translate__SwiftUI
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityAttributedLabel;
- (id)accessibilityLabel;
@end

@implementation AccessibilityNodeAccessibility__Translate__SwiftUI

+ (id)safeCategoryTargetClassName
{
  return @"SwiftUI.AccessibilityNode";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(AccessibilityNodeAccessibility__Translate__SwiftUI *)self accessibilityIdentifier];
  if ([v3 isEqualToString:@"moreButton"])
  {
    v4 = @"more.button";
LABEL_5:
    uint64_t v5 = accessibilityLocalizedString(v4);
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"conversationViewOptionsButton"])
  {
    v4 = @"conversation.style.button";
    goto LABEL_5;
  }
  v8.receiver = self;
  v8.super_class = (Class)AccessibilityNodeAccessibility__Translate__SwiftUI;
  uint64_t v5 = [(AccessibilityNodeAccessibility__Translate__SwiftUI *)&v8 accessibilityLabel];
LABEL_7:
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityAttributedLabel
{
  id v3 = objc_alloc(MEMORY[0x263F21660]);
  v4 = [(AccessibilityNodeAccessibility__Translate__SwiftUI *)self accessibilityLabel];
  uint64_t v5 = (void *)[v3 initWithStringOrAttributedString:v4];

  v6 = [v5 attributedString];

  return v6;
}

@end