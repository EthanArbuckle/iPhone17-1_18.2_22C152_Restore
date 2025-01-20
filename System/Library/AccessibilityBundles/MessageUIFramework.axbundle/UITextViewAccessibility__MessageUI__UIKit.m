@interface UITextViewAccessibility__MessageUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
@end

@implementation UITextViewAccessibility__MessageUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(UITextViewAccessibility__MessageUI__UIKit *)self accessibilityIdentifier];
  if ([v3 isEqualToString:@"subjectField"])
  {
    v4 = [MEMORY[0x263F089D8] string];
    v5 = accessibilityLocalizedString(@"subject.text");
    [v4 appendString:v5];

    v9.receiver = self;
    v9.super_class = (Class)UITextViewAccessibility__MessageUI__UIKit;
    v6 = [(UITextViewAccessibility__MessageUI__UIKit *)&v9 accessibilityLabel];
    if (v6) {
      [v4 appendString:v6];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITextViewAccessibility__MessageUI__UIKit;
    v4 = [(UITextViewAccessibility__MessageUI__UIKit *)&v8 accessibilityLabel];
  }

  return v4;
}

- (CGRect)accessibilityFrame
{
  v3 = [(UITextViewAccessibility__MessageUI__UIKit *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"subjectField"];

  if (v4)
  {
    objc_opt_class();
    v5 = [(UITextViewAccessibility__MessageUI__UIKit *)self superview];
    __UIAccessibilityCastAsClass();
    v6 = (UIView *)objc_claimAutoreleasedReturnValue();

    [(UITextViewAccessibility__MessageUI__UIKit *)self frame];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [(UIView *)v6 frame];
    v24.origin.CGFloat x = 0.0;
    v24.origin.CGFloat y = v8;
    v24.size.CGFloat height = v10;
    CGRect v25 = UIAccessibilityConvertFrameToScreenCoordinates(v24, v6);
    CGFloat x = v25.origin.x;
    CGFloat y = v25.origin.y;
    CGFloat width = v25.size.width;
    CGFloat height = v25.size.height;
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)UITextViewAccessibility__MessageUI__UIKit;
    [(UITextViewAccessibility__MessageUI__UIKit *)&v23 accessibilityFrame];
    CGFloat x = v15;
    CGFloat y = v16;
    CGFloat width = v17;
    CGFloat height = v18;
  }
  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

@end