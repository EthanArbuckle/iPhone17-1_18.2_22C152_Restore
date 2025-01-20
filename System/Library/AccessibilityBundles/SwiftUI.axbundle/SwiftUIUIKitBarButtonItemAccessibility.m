@interface SwiftUIUIKitBarButtonItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation SwiftUIUIKitBarButtonItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SwiftUI.UIKitBarButtonItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SwiftUI.UIKitBarButtonItem" isKindOfClass:@"UIBarButtonItem"];
  [v3 validateClass:@"SwiftUI.UIKitBarButtonItem" hasSwiftField:@"host" withSwiftType:"UIKitBarItemHost<BarItemView>"];
}

- (id)accessibilityIdentifier
{
  id v3 = [(SwiftUIUIKitBarButtonItemAccessibility *)self safeSwiftValueForKey:@"host"];
  v4 = [v3 accessibilityElements];
  v5 = [v4 firstObject];
  v6 = [v5 accessibilityIdentifier];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SwiftUIUIKitBarButtonItemAccessibility;
    id v8 = [(SwiftUIUIKitBarButtonItemAccessibility *)&v11 accessibilityIdentifier];
  }
  v9 = v8;

  return v9;
}

- (id)accessibilityLabel
{
  id v3 = [(SwiftUIUIKitBarButtonItemAccessibility *)self safeSwiftValueForKey:@"host"];
  v4 = [v3 accessibilityElements];
  v5 = [v4 firstObject];
  v6 = [v5 accessibilityLabel];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SwiftUIUIKitBarButtonItemAccessibility;
    id v8 = [(SwiftUIUIKitBarButtonItemAccessibility *)&v11 accessibilityLabel];
  }
  v9 = v8;

  return v9;
}

- (id)accessibilityValue
{
  id v3 = [(SwiftUIUIKitBarButtonItemAccessibility *)self safeSwiftValueForKey:@"host"];
  v4 = [v3 accessibilityElements];
  v5 = [v4 firstObject];
  v6 = [v5 accessibilityValue];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SwiftUIUIKitBarButtonItemAccessibility;
    id v8 = [(SwiftUIUIKitBarButtonItemAccessibility *)&v11 accessibilityValue];
  }
  v9 = v8;

  return v9;
}

- (id)accessibilityHint
{
  id v3 = [(SwiftUIUIKitBarButtonItemAccessibility *)self safeSwiftValueForKey:@"host"];
  v4 = [v3 accessibilityElements];
  v5 = [v4 firstObject];
  v6 = [v5 accessibilityHint];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SwiftUIUIKitBarButtonItemAccessibility;
    id v8 = [(SwiftUIUIKitBarButtonItemAccessibility *)&v11 accessibilityHint];
  }
  v9 = v8;

  return v9;
}

@end