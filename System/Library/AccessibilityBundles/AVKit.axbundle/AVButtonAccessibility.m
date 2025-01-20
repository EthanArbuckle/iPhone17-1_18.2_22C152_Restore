@interface AVButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
@end

@implementation AVButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVButton", @"hasAlternateAppearance", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIButton", @"imageView", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(AVButtonAccessibility *)self safeUIViewForKey:@"imageView"];
  v4 = [(AVButtonAccessibility *)self accessibilityIdentifier];
  int v5 = [v4 isEqualToString:@"Right Secondary Control"];

  if (v5)
  {
    v6 = [v3 accessibilityLabel];
    if (!v6)
    {
      v7 = @"next.track";
LABEL_12:
      accessibilityLocalizedString(v7);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_6:
    id v10 = v6;
LABEL_13:
    v14 = v10;

    goto LABEL_14;
  }
  v8 = [(AVButtonAccessibility *)self accessibilityIdentifier];
  int v9 = [v8 isEqualToString:@"Left Secondary Control"];

  if (v9)
  {
    v6 = [v3 accessibilityLabel];
    if (!v6)
    {
      v7 = @"previous.track";
      goto LABEL_12;
    }
    goto LABEL_6;
  }
  char v17 = 0;
  objc_opt_class();
  v11 = __UIAccessibilityCastAsClass();
  v12 = [v11 image];
  v13 = [v12 imageAsset];
  v6 = [v13 safeStringForKey:@"assetName"];

  if ([v6 isEqualToString:@"rectangle.split.2x2"])
  {
    v7 = @"multiview.button";
    goto LABEL_12;
  }
  if ([v6 isEqualToString:@"fitness.edit.video.metrics"])
  {
    v7 = @"metrics.button";
    goto LABEL_12;
  }

  v16.receiver = self;
  v16.super_class = (Class)AVButtonAccessibility;
  v14 = [(AVButtonAccessibility *)&v16 accessibilityLabel];
LABEL_14:

  return v14;
}

- (CGRect)accessibilityFrame
{
  v19.receiver = self;
  v19.super_class = (Class)AVButtonAccessibility;
  [(AVButtonAccessibility *)&v19 accessibilityFrame];
  CGFloat x = v2;
  CGFloat y = v4;
  CGFloat width = v6;
  CGFloat height = v8;
  objc_opt_class();
  id v10 = __UIAccessibilityCastAsClass();
  v11 = [v10 superview];
  NSClassFromString(&cfstr_Avmobilechrome.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGFloat v13 = CGRectGetWidth(v20) * -0.75;
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGFloat v14 = CGRectGetHeight(v21) * -0.75;
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGRect v23 = CGRectInset(v22, v13, v14);
    CGFloat x = v23.origin.x;
    CGFloat y = v23.origin.y;
    CGFloat width = v23.size.width;
    CGFloat height = v23.size.height;
  }
  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

@end