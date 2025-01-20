@interface FIUIWorkoutSummaryColoredDetailTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
@end

@implementation FIUIWorkoutSummaryColoredDetailTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FIUIWorkoutSummaryColoredDetailTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  id v13 = 0;
  char v7 = 0;
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  v3 = [v2 _accessibleSubviews];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __79__FIUIWorkoutSummaryColoredDetailTableViewCellAccessibility_accessibilityLabel__block_invoke;
  v6[3] = &unk_83D8;
  v6[4] = &v8;
  [v3 enumerateObjectsUsingBlock:v6];

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

uint64_t __79__FIUIWorkoutSummaryColoredDetailTableViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = __AXStringForVariables();

  return _objc_release_x1();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  char v17 = 0;
  objc_opt_class();
  v3 = [(FIUIWorkoutSummaryColoredDetailTableViewCellAccessibility *)self safeValueForKey:@"customAccessoryButton"];
  id v4 = __UIAccessibilityCastAsClass();

  if (v4)
  {
    char v17 = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    [v4 frame];
    CGRect v20 = UIAccessibilityConvertFrameToScreenCoordinates(v19, v5);
    CGFloat x = v20.origin.x;
    CGFloat y = v20.origin.y;
    CGFloat width = v20.size.width;
    CGFloat height = v20.size.height;
    CGFloat MidX = CGRectGetMidX(v20);
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGFloat MidY = CGRectGetMidY(v21);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)FIUIWorkoutSummaryColoredDetailTableViewCellAccessibility;
    [(FIUIWorkoutSummaryColoredDetailTableViewCellAccessibility *)&v16 accessibilityActivationPoint];
    CGFloat MidX = v12;
    CGFloat MidY = v13;
  }

  double v14 = MidX;
  double v15 = MidY;
  result.CGFloat y = v15;
  result.CGFloat x = v14;
  return result;
}

@end