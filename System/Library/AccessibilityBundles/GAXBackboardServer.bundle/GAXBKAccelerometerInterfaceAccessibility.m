@interface GAXBKAccelerometerInterfaceAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
@end

@implementation GAXBKAccelerometerInterfaceAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKAccelerometerInterface";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = +[GAXBackboard sharedInstance];
  if ([v10 isActive] && !objc_msgSend(v10, "allowsMotion"))
  {
    id v11 = &dword_0 + 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)GAXBKAccelerometerInterfaceAccessibility;
    id v11 = [(GAXBKAccelerometerInterfaceAccessibility *)&v13 processEvent:a3 sender:v8 dispatcher:v9];
  }

  return (int64_t)v11;
}

@end