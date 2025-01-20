@interface UIColor(AuthKit)
+ (id)ak_colorWithServerRGBRepresentation:()AuthKit;
@end

@implementation UIColor(AuthKit)

+ (id)ak_colorWithServerRGBRepresentation:()AuthKit
{
  id v3 = a3;
  if ([v3 length] == 6)
  {
    uint64_t v16 = 0;
    int v15 = 0;
    v4 = objc_msgSend(v3, "substringWithRange:", 0, 2);
    v5 = objc_msgSend(v3, "substringWithRange:", 2, 2);
    v6 = objc_msgSend(v3, "substringWithRange:", 4, 2);
    v7 = [MEMORY[0x1E4F28FE8] scannerWithString:v4];
    [v7 scanHexInt:(char *)&v16 + 4];
    v8 = [MEMORY[0x1E4F28FE8] scannerWithString:v5];
    [v8 scanHexInt:&v16];
    v9 = [MEMORY[0x1E4F28FE8] scannerWithString:v6];
    [v9 scanHexInt:&v15];
    LODWORD(v10) = HIDWORD(v16);
    LODWORD(v11) = v16;
    LODWORD(v12) = v15;
    v13 = [MEMORY[0x1E4F428B8] colorWithRed:(double)v10 / 255.0 green:(double)v11 / 255.0 blue:(double)v12 / 255.0 alpha:1.0];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end