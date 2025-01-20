@interface SLSheetTextComposeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (SLSheetTextComposeViewAccessibility)initWithFrame:(CGRect)a3;
@end

@implementation SLSheetTextComposeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SLSheetTextComposeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (SLSheetTextComposeViewAccessibility)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SLSheetTextComposeViewAccessibility;
  v3 = -[SLSheetTextComposeViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [(SLSheetTextComposeViewAccessibility *)v3 safeValueForKey:@"textView"];
  [v4 setAccessibilityIdentifier:@"SocialSheetComposeTextView"];

  return v3;
}

@end