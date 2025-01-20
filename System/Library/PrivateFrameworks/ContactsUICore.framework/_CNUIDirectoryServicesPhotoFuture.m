@interface _CNUIDirectoryServicesPhotoFuture
+ (id)photoForEmailAddresses:(id)a3;
@end

@implementation _CNUIDirectoryServicesPhotoFuture

+ (id)photoForEmailAddresses:(id)a3
{
  v3 = (void *)MEMORY[0x263F335E0];
  v4 = objc_msgSend(MEMORY[0x263EFF9D0], "null", a3);
  v5 = [v3 futureWithResult:v4];

  return v5;
}

@end