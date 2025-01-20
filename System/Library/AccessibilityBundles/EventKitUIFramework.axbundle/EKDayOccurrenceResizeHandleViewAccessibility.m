@interface EKDayOccurrenceResizeHandleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_axIsEndHandle;
- (BOOL)_axIsStartHandle;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation EKDayOccurrenceResizeHandleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKDayOccurrenceResizeHandleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsStartHandle
{
  v2 = [(EKDayOccurrenceResizeHandleViewAccessibility *)self accessibilityIdentifier];
  char v3 = [v2 isEqualToString:@"StartHandle"];

  return v3;
}

- (BOOL)_axIsEndHandle
{
  v2 = [(EKDayOccurrenceResizeHandleViewAccessibility *)self accessibilityIdentifier];
  char v3 = [v2 isEqualToString:@"EndHandle"];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if ([(EKDayOccurrenceResizeHandleViewAccessibility *)self _axIsStartHandle])
  {
    char v3 = @"resize.handle.start.label";
LABEL_5:
    v4 = accessibilityLocalizedString(v3);
    goto LABEL_7;
  }
  if ([(EKDayOccurrenceResizeHandleViewAccessibility *)self _axIsEndHandle])
  {
    char v3 = @"resize.handle.end.label";
    goto LABEL_5;
  }
  v4 = 0;
LABEL_7:

  return v4;
}

- (id)accessibilityHint
{
  if ([(EKDayOccurrenceResizeHandleViewAccessibility *)self _axIsStartHandle])
  {
    char v3 = @"resize.handle.start.hint";
LABEL_5:
    v4 = accessibilityLocalizedString(v3);
    goto LABEL_7;
  }
  if ([(EKDayOccurrenceResizeHandleViewAccessibility *)self _axIsEndHandle])
  {
    char v3 = @"resize.handle.end.hint";
    goto LABEL_5;
  }
  v4 = 0;
LABEL_7:

  return v4;
}

- (CGPoint)accessibilityActivationPoint
{
  [(EKDayOccurrenceResizeHandleViewAccessibility *)self bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  CGRectGetMidX(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGRectGetMidY(v12);
  [(EKDayOccurrenceResizeHandleViewAccessibility *)self _axIsEndHandle];

  UIAccessibilityPointForPoint();
  result.CGFloat y = v8;
  result.CGFloat x = v7;
  return result;
}

@end