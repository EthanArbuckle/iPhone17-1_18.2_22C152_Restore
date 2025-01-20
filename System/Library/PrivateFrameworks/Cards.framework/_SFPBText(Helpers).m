@interface _SFPBText(Helpers)
+ (id)textWithString:()Helpers;
@end

@implementation _SFPBText(Helpers)

+ (id)textWithString:()Helpers
{
  v3 = (objc_class *)MEMORY[0x263F67BC8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setText:v4];

  return v5;
}

@end