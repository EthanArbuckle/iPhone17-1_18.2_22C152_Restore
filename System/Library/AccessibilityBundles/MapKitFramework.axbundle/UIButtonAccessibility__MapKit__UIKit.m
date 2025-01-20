@interface UIButtonAccessibility__MapKit__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityInfoButtonContext;
- (id)accessibilityLabel;
@end

@implementation UIButtonAccessibility__MapKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(UIButtonAccessibility__MapKit__UIKit *)self accessibilityIdentifier];
  if ([v3 isEqualToString:@"AccessibilityMoreInfoButtonIdentifier"])
  {
    v4 = NSString;
    v5 = AXMapKitLocString(@"MORE_INFO_WITH_CONTEXT");
    v6 = [(UIButtonAccessibility__MapKit__UIKit *)self _accessibilityInfoButtonContext];
    v7 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);

    goto LABEL_10;
  }
  v8 = [(UIButtonAccessibility__MapKit__UIKit *)self safeValueForKey:@"_accessibilityImagePath"];
  if ([v8 isEqualToString:@"StreetView.png"])
  {
    v9 = @"STREET_VIEW_LABEL";
  }
  else
  {
    if (![v8 isEqualToString:@"HideInfo.png"])
    {
      v12.receiver = self;
      v12.super_class = (Class)UIButtonAccessibility__MapKit__UIKit;
      uint64_t v10 = [(UIButtonAccessibility__MapKit__UIKit *)&v12 accessibilityLabel];
      goto LABEL_9;
    }
    v9 = @"MORE_INFO";
  }
  uint64_t v10 = AXMapKitLocString(v9);
LABEL_9:
  v7 = (void *)v10;

LABEL_10:

  return v7;
}

- (id)_accessibilityInfoButtonContext
{
  v2 = [(UIButtonAccessibility__MapKit__UIKit *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Calloutview_0.isa)];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 safeValueForKey:@"_title"];
    v5 = [v4 accessibilityLabel];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end