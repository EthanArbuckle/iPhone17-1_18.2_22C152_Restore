@interface _SFPBImage(Helpers)
+ (id)imageWithData:()Helpers;
@end

@implementation _SFPBImage(Helpers)

+ (id)imageWithData:()Helpers
{
  v3 = (objc_class *)MEMORY[0x263F67B50];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setImageData:v4];

  return v5;
}

@end