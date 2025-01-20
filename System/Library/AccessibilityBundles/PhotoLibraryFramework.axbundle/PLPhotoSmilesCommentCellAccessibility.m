@interface PLPhotoSmilesCommentCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
@end

@implementation PLPhotoSmilesCommentCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLPhotoSmilesCommentCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(PLPhotoSmilesCommentCellAccessibility *)self safeValueForKey:@"_smileContentLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(PLPhotoSmilesCommentCellAccessibility *)self safeValueForKey:@"smileImageButton"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end