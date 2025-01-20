@interface IMAppleStoreHelper
+ (BOOL)isInAppleStoreDemoMode;
@end

@implementation IMAppleStoreHelper

+ (BOOL)isInAppleStoreDemoMode
{
  if (qword_1EB4A6458 != -1) {
    dispatch_once(&qword_1EB4A6458, &unk_1EF2BFAA0);
  }
  return byte_1E94FF338;
}

@end