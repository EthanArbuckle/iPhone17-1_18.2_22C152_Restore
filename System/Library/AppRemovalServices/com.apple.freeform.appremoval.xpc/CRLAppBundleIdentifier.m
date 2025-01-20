@interface CRLAppBundleIdentifier
@end

@implementation CRLAppBundleIdentifier

void __CRLAppBundleIdentifier_block_invoke(id a1)
{
  uint64_t v1 = +[NSString stringWithUTF8String:"com.apple.freeform"];
  v2 = (void *)CRLAppBundleIdentifier_identifier;
  CRLAppBundleIdentifier_identifier = v1;

  if (([(id)CRLAppBundleIdentifier_identifier hasPrefix:@"com.apple."] & 1) == 0) {
    __CRLAppBundleIdentifier_block_invoke_cold_1();
  }
}

@end