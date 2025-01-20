@interface AccessibilityNodeAccessibility__VideosUI__SwiftUI
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityAttributedLabel;
@end

@implementation AccessibilityNodeAccessibility__VideosUI__SwiftUI

+ (id)safeCategoryTargetClassName
{
  return @"SwiftUI.AccessibilityNode";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityAttributedLabel
{
  v18.receiver = self;
  v18.super_class = (Class)AccessibilityNodeAccessibility__VideosUI__SwiftUI;
  v3 = [(AccessibilityNodeAccessibility__VideosUI__SwiftUI *)&v18 accessibilityAttributedLabel];
  v4 = [(AccessibilityNodeAccessibility__VideosUI__SwiftUI *)self safeSwiftValueForKey:@"viewRendererHost"];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  int v7 = [v6 axContainsString:@"AVInfoTabView"];

  if (v7)
  {
    v8 = [(AccessibilityNodeAccessibility__VideosUI__SwiftUI *)self safeSwiftArrayForKey:@"children"];
    v9 = objc_msgSend(v8, "ax_mappedArrayUsingBlock:", &__block_literal_global_4);
    v10 = AXLabelForElements();

    if ([v10 length])
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x263F086A0]) initWithString:v10];

      v3 = (void *)v11;
    }
  }
  if (v3
    && ([MEMORY[0x263EFF960] preferredLanguages],
        v12 = objc_claimAutoreleasedReturnValue(),
        [v12 firstObject],
        v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 hasPrefix:@"en"],
        v13,
        v12,
        v14))
  {
    v15 = (void *)[objc_alloc(MEMORY[0x263F21660]) initWithCFAttributedString:v3];
    [v15 setAttribute:&unk_26F833968 forKey:*MEMORY[0x263F21628]];
    id v16 = [v15 attributedString];
  }
  else
  {
    id v16 = v3;
  }

  return v16;
}

@end