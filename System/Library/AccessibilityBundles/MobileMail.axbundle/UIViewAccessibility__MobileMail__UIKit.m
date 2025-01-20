@interface UIViewAccessibility__MobileMail__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsApplicationSceneView;
- (BOOL)_accessibilityIsFirstElementForFocus;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (id)accessibilityElements;
@end

@implementation UIViewAccessibility__MobileMail__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  v3 = [(UIViewAccessibility__MobileMail__UIKit *)self accessibilityIdentification];
  char v4 = [v3 isEqualToString:@"AXAccessibilityUseAccessibilityFrameForHittest"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)UIViewAccessibility__MobileMail__UIKit;
  return [(UIViewAccessibility__MobileMail__UIKit *)&v6 _accessibilityUseAccessibilityFrameForHittest];
}

- (BOOL)_accessibilityIsFirstElementForFocus
{
  v3 = [(UIViewAccessibility__MobileMail__UIKit *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"MailMessagesTableView"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)UIViewAccessibility__MobileMail__UIKit;
  return [(UIViewAccessibility__MobileMail__UIKit *)&v6 _accessibilityIsFirstElementForFocus];
}

- (BOOL)_accessibilityIsApplicationSceneView
{
  v2 = [(UIViewAccessibility__MobileMail__UIKit *)self accessibilityIdentifier];
  char v3 = [v2 isEqualToString:@"kAXApplicationSceneViewIdentifier"];

  return v3;
}

- (id)accessibilityElements
{
  if (![(UIViewAccessibility__MobileMail__UIKit *)self _accessibilityIsApplicationSceneView])
  {
    v34.receiver = self;
    v34.super_class = (Class)UIViewAccessibility__MobileMail__UIKit;
    [(UIViewAccessibility__MobileMail__UIKit *)&v34 accessibilityElements];
    v28 = LABEL_12:;
    goto LABEL_13;
  }
  char v3 = [(UIViewAccessibility__MobileMail__UIKit *)self _accessibilityValueForKey:@"kAXShowDraftsKey"];
  char v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    v33.receiver = self;
    v33.super_class = (Class)UIViewAccessibility__MobileMail__UIKit;
    [(UIViewAccessibility__MobileMail__UIKit *)&v33 accessibilityElements];
    goto LABEL_12;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__UIViewAccessibility__MobileMail__UIKit_accessibilityElements__block_invoke;
  block[3] = &unk_2651331B8;
  block[4] = self;
  if (accessibilityElements_onceToken != -1) {
    dispatch_once(&accessibilityElements_onceToken, block);
  }
  v5 = [(UIViewAccessibility__MobileMail__UIKit *)self _accessibilityValueForKey:@"kAXDraftHeightKey"];
  [v5 floatValue];
  float v7 = v6;

  v8 = [(UIViewAccessibility__MobileMail__UIKit *)self _accessibilityValueForKey:@"kAXNumberOfDraftsKey"];
  uint64_t v9 = [v8 unsignedIntegerValue];

  v10 = accessibilityLocalizedString(@"show.drafts");
  v11 = NSString;
  v12 = accessibilityLocalizedString(@"number.of.drafts");
  v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v9);

  v14 = __UIAXStringForVariables();

  objc_msgSend((id)accessibilityElements_showDraftsElement, "setAccessibilityLabel:", v14, v13, @"__AXStringForVariablesSentinel");
  char v31 = 0;
  objc_opt_class();
  v15 = __UIAccessibilityCastAsClass();
  double v16 = v7;
  [v15 frame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  [v15 safeAreaInsets];
  objc_msgSend((id)accessibilityElements_showDraftsElement, "setAccessibilityFrame:", v18, v22 - v16, v20, v16 - v23);
  v30.receiver = self;
  v30.super_class = (Class)UIViewAccessibility__MobileMail__UIKit;
  v24 = [(UIViewAccessibility__MobileMail__UIKit *)&v30 accessibilityElements];
  v25 = (void *)[v24 mutableCopy];

  if (!v25)
  {
    v25 = [MEMORY[0x263EFF980] array];
  }
  v26 = [(UIViewAccessibility__MobileMail__UIKit *)self safeArrayForKey:@"subviews"];
  [v25 axSafelyAddObjectsFromArray:v26];

  v27 = objc_msgSend(v25, "ax_filteredArrayUsingBlock:", &__block_literal_global_15);
  v28 = (void *)[v27 mutableCopy];

  if (([v28 containsObject:accessibilityElements_showDraftsElement] & 1) == 0) {
    [v28 axSafelyAddObject:accessibilityElements_showDraftsElement];
  }

LABEL_13:

  return v28;
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  char v3 = [(UIViewAccessibility__MobileMail__UIKit *)self accessibilityIdentification];
  char v4 = [v3 isEqualToString:@"AXAccessibilityStatusIndicatorView"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)UIViewAccessibility__MobileMail__UIKit;
  return [(UIViewAccessibility__MobileMail__UIKit *)&v6 _accessibilityOverridesInvalidFrames];
}

@end