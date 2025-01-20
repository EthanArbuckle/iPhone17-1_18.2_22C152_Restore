@interface WFActionKitStaticInitializer
+ (void)load;
@end

@implementation WFActionKitStaticInitializer

+ (void)load
{
  v2 = SecTaskCreateFromSelf(0);
  if (v2)
  {
    v3 = v2;
    uint32_t CodeSignStatus = SecTaskGetCodeSignStatus(v2);
    CFRelease(v3);
    if ((CodeSignStatus & 0xC000001) != 0x4000001 && (os_variant_has_internal_content() & 1) == 0) {
      __assert_rtn("+[WFActionKitStaticInitializer load]", "ActionKit.m", 49, "platformBinary");
    }
  }
}

@end