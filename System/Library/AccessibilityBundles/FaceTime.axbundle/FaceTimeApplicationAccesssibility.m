@interface FaceTimeApplicationAccesssibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityAllowsNotificationsDuringSuspension;
@end

@implementation FaceTimeApplicationAccesssibility

+ (id)safeCategoryTargetClassName
{
  return @"FaceTimeApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityAllowsNotificationsDuringSuspension
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  AXPerformBlockSynchronouslyOnMainThread();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __86__FaceTimeApplicationAccesssibility__accessibilityAllowsNotificationsDuringSuspension__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F7E1A0] sharedInstance];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 currentCallCount] != 0;
}

@end