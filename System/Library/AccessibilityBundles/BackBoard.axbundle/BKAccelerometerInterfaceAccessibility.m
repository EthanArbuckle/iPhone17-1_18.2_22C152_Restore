@interface BKAccelerometerInterfaceAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (void)orientationManager:(id)a3 deviceOrientationMayHaveChanged:(int64_t)a4 changeSource:(int64_t)a5 isDeviceOrientationLocked:(BOOL)a6;
@end

@implementation BKAccelerometerInterfaceAccessibility

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = +[AXBAccessibilityManager sharedManager];
  char v11 = [v10 accelerometerDisabled];

  if (v11)
  {
    id v12 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BKAccelerometerInterfaceAccessibility;
    id v12 = [(BKAccelerometerInterfaceAccessibility *)&v14 processEvent:a3 sender:v8 dispatcher:v9];
  }

  return (int64_t)v12;
}

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
  v3 = NSString;
  id v4 = a3;
  v5 = [v3 stringWithUTF8String:"^^{__IOHIDEvent}"];
  v6 = [v3 stringWithFormat:@"N%@", v5];

  id v7 = v6;
  objc_msgSend(v4, "validateClass:hasInstanceMethod:withFullSignature:", @"BKAccelerometerInterface", @"processEvent:sender:dispatcher:", "q", objc_msgSend(v7, "UTF8String"), "@", "@", 0);
  objc_msgSend(v4, "validateClass:hasInstanceMethod:withFullSignature:", @"BKAccelerometerInterface", @"orientationManager: deviceOrientationMayHaveChanged: changeSource: isDeviceOrientationLocked:", "v", "@", "q", "q", "B", 0);
}

- (void)orientationManager:(id)a3 deviceOrientationMayHaveChanged:(int64_t)a4 changeSource:(int64_t)a5 isDeviceOrientationLocked:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  char v11 = +[AXBAccessibilityManager sharedManager];
  char v12 = [v11 accelerometerDisabled];

  if (a5 == 2 || (v12 & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)BKAccelerometerInterfaceAccessibility;
    [(BKAccelerometerInterfaceAccessibility *)&v13 orientationManager:v10 deviceOrientationMayHaveChanged:a4 changeSource:a5 isDeviceOrientationLocked:v6];
  }
}

@end