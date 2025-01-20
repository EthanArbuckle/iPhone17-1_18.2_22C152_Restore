@interface UIImage(ASImageExtras)
+ (id)as_imageNamed:()ASImageExtras;
@end

@implementation UIImage(ASImageExtras)

+ (id)as_imageNamed:()ASImageExtras
{
  v3 = (void *)MEMORY[0x263F827E8];
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = objc_msgSend(v4, "as_authenticationServicesBundle");
  v7 = [v3 imageNamed:v5 inBundle:v6 withConfiguration:0];

  return v7;
}

@end