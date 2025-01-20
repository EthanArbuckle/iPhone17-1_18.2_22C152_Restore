@interface AXDataActivation
+ (void)accessibilityInitializeBundle;
@end

@implementation AXDataActivation

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    _Failover = [objc_allocWithZone((Class)AXDataActivation) init];
    MEMORY[0x270F9A758]();
  }
}

@end