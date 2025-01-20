@interface APSystemInternal
+ (BOOL)isAppleInternalInstall;
@end

@implementation APSystemInternal

+ (BOOL)isAppleInternalInstall
{
  if (qword_1EB789B70 != -1) {
    dispatch_once(&qword_1EB789B70, &unk_1F2E9CD10);
  }
  return byte_1EB789B78;
}

@end