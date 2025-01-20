@interface UIColor(HexColor)
+ (id)colorWithHexValue:()HexColor error:;
@end

@implementation UIColor(HexColor)

+ (id)colorWithHexValue:()HexColor error:
{
  v21[3] = *(double *)MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 hasPrefix:@"#"] && (unint64_t)objc_msgSend(v5, "length") >= 2)
  {
    uint64_t v6 = [v5 substringFromIndex:1];

    id v5 = (id)v6;
  }
  uint64_t v7 = [v5 length];
  if (v7 == 3)
  {
    v19 = a4;
    uint64_t v8 = 1;
LABEL_8:
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    int v11 = 1;
    do
    {
      v12 = objc_msgSend(v5, "substringWithRange:", v9, v8, v19);
      v13 = v12;
      if (v7 == 3)
      {
        uint64_t v14 = [v12 stringByAppendingString:v12];

        v13 = (void *)v14;
      }
      v15 = [MEMORY[0x263F08B08] scannerWithString:v13];
      int v20 = 0;
      v11 &= [v15 scanHexInt:&v20];
      LODWORD(v16) = v20;
      v21[v10] = (double)v16 / 255.0;

      ++v10;
      v9 += v8;
    }
    while (v10 != 3);
    if (v11)
    {
      v17 = [MEMORY[0x263F1C550] colorWithRed:v21[0] green:v21[1] blue:v21[2] alpha:1.0];
      goto LABEL_18;
    }
    a4 = v19;
    if (v19) {
      goto LABEL_15;
    }
    goto LABEL_17;
  }
  if ([v5 length] == 6)
  {
    v19 = a4;
    uint64_t v8 = 2;
    goto LABEL_8;
  }
  if (a4)
  {
LABEL_15:
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.diagnostics.invalidHexValue" code:-1 userInfo:0];
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
LABEL_17:
  v17 = 0;
LABEL_18:

  return v17;
}

@end