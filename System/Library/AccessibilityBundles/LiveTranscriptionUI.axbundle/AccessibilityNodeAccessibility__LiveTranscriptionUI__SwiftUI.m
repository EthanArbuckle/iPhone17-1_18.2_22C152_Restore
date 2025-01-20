@interface AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsRealtimeElement;
- (id)accessibilityAttributedLabel;
- (int64_t)_accessibilityExpandedStatus;
@end

@implementation AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI

+ (id)safeCategoryTargetClassName
{
  return @"SwiftUI.AccessibilityNode";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (int64_t)_accessibilityExpandedStatus
{
  v3 = [(AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"AXLCNubbit"];

  if (!v4) {
    goto LABEL_7;
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __92__AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI__accessibilityExpandedStatus__block_invoke;
  v12 = &unk_26512B160;
  v13 = self;
  v14 = &v15;
  AXPerformSafeBlock();
  id v5 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  if (v5)
  {
    if ([v5 BOOLValue]) {
      int64_t v6 = 1;
    }
    else {
      int64_t v6 = 2;
    }
  }
  else
  {
LABEL_7:
    v8.receiver = self;
    v8.super_class = (Class)AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI;
    return [(AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI *)&v8 _accessibilityExpandedStatus];
  }
  return v6;
}

- (id)accessibilityAttributedLabel
{
  v14[1] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI;
  v3 = [(AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI *)&v12 accessibilityAttributedLabel];
  int v4 = [(AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI *)self accessibilityIdentifier];
  int v5 = [v4 isEqualToString:@"AXLCCaptionText"];

  if (v5)
  {
    int64_t v6 = [v3 string];
    v7 = [v6 stringByReplacingOccurrencesOfString:@"\n", @", " withString];

    objc_super v8 = (void *)[objc_alloc(MEMORY[0x263F21660]) initWithStringOrAttributedString:v7];
    uint64_t v13 = *MEMORY[0x263F216F8];
    v14[0] = MEMORY[0x263EFFA88];
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v8 setAttributes:v9];

    uint64_t v10 = [v8 attributedString];

    v3 = (void *)v10;
  }

  return v3;
}

- (BOOL)_accessibilityIsRealtimeElement
{
  v3 = [(AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"AXLCCaptionText"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI;
  return [(AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI *)&v6 _accessibilityIsRealtimeElement];
}

@end