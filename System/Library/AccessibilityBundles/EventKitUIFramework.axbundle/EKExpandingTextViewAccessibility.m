@interface EKExpandingTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation EKExpandingTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKExpandingTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(EKExpandingTextViewAccessibility *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"TextViewInInlineCell"];

  if (v4)
  {
    v5 = [(EKExpandingTextViewAccessibility *)self safeValueForKey:@"superview"];
    v6 = [v5 safeValueForKey:@"textLabel"];
    v7 = [v6 accessibilityLabel];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)EKExpandingTextViewAccessibility;
    v7 = [(EKExpandingTextViewAccessibility *)&v9 accessibilityLabel];
  }

  return v7;
}

@end