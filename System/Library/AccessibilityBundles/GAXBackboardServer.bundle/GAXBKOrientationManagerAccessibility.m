@interface GAXBKOrientationManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_queue_postUpdatedRawAccelerometerDeviceOrientation:(int64_t)a3;
@end

@implementation GAXBKOrientationManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKOrientationManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_queue_postUpdatedRawAccelerometerDeviceOrientation:(int64_t)a3
{
  v5 = +[GAXBackboard sharedInstance];
  if (![v5 isActive] || objc_msgSend(v5, "allowsMotion"))
  {
    v6.receiver = self;
    v6.super_class = (Class)GAXBKOrientationManagerAccessibility;
    [(GAXBKOrientationManagerAccessibility *)&v6 _queue_postUpdatedRawAccelerometerDeviceOrientation:a3];
  }
}

@end