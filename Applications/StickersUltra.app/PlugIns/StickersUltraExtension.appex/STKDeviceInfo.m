@interface STKDeviceInfo
+ (BOOL)hasANE;
@end

@implementation STKDeviceInfo

+ (BOOL)hasANE
{
  if (qword_1000AD9C0[0] != -1) {
    dispatch_once(qword_1000AD9C0, &stru_10009A698);
  }
  return byte_1000AD9B8;
}

@end