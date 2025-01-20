@interface AVMobileChromelessPlaybackControlButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (CGRect)accessibilityFrame;
- (id)accessibilityValue;
@end

@implementation AVMobileChromelessPlaybackControlButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVMobileChromelessPlaybackControlButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGRect)accessibilityFrame
{
  v8.receiver = self;
  v8.super_class = (Class)AVMobileChromelessPlaybackControlButtonAccessibility;
  [(AVMobileChromelessPlaybackControlButtonAccessibility *)&v8 accessibilityFrame];
  CGFloat x = v9.origin.x;
  CGFloat y = v9.origin.y;
  CGFloat width = v9.size.width;
  CGFloat height = v9.size.height;
  CGFloat v6 = -CGRectGetWidth(v9);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGFloat v7 = -CGRectGetHeight(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  return CGRectInset(v11, v6, v7);
}

- (id)accessibilityValue
{
  return 0;
}

@end