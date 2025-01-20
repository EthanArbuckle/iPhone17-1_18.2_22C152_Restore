@interface AMEnableMotionDetectionWakeAttribute
+ (id)enableMotionDetectionWake;
- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4;
@end

@implementation AMEnableMotionDetectionWakeAttribute

+ (id)enableMotionDetectionWake
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return [(BLSAttribute *)self checkEntitlementSource:a3 forSingleEntitlement:@"com.apple.ambient.attribute.motion-detection-wake" error:a4];
}

@end