@interface _SFPBPunchout(Helpers)
+ (id)punchoutWithURL:()Helpers;
@end

@implementation _SFPBPunchout(Helpers)

+ (id)punchoutWithURL:()Helpers
{
  v3 = (objc_class *)MEMORY[0x263F67B80];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = objc_alloc_init(MEMORY[0x263F67BD8]);
  v7 = [v4 absoluteString];

  [v6 setAddress:v7];
  [v5 addUrls:v6];

  return v5;
}

@end