@interface MailRegionCode
@end

@implementation MailRegionCode

void ____MailRegionCode_block_invoke()
{
  id v0 = (id)CPGetDeviceRegionCode();
  v1 = (void *)__MailRegionCode__regionCode;
  __MailRegionCode__regionCode = (uint64_t)v0;
}

@end