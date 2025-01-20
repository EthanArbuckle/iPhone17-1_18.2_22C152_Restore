@interface UIColor(HexColor)
+ (id)colorWithHexValue:()HexColor error:;
@end

@implementation UIColor(HexColor)

+ (id)colorWithHexValue:()HexColor error:
{
  v23[3] = *(double *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 hasPrefix:@"#"] && (unint64_t)objc_msgSend(v5, "length") >= 2)
  {
    uint64_t v6 = [v5 substringFromIndex:1];

    id v5 = (id)v6;
  }
  uint64_t v7 = [v5 length];
  if (v7 == 3)
  {
    v21 = a4;
    uint64_t v8 = 1;
LABEL_8:
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    int v11 = 1;
    do
    {
      v12 = objc_msgSend(v5, "substringWithRange:", v9, v8, v21);
      v13 = v12;
      if (v7 == 3)
      {
        uint64_t v14 = [v12 stringByAppendingString:v12];

        v13 = (void *)v14;
      }
      v15 = [MEMORY[0x1E4F28FE8] scannerWithString:v13];
      int v22 = 0;
      v11 &= [v15 scanHexInt:&v22];
      LODWORD(v16) = v22;
      v23[v10] = (double)v16 / 255.0;

      ++v10;
      v9 += v8;
    }
    while (v10 != 3);
    if (v11)
    {
      v17 = [MEMORY[0x1E4FB1618] colorWithRed:v23[0] green:v23[1] blue:v23[2] alpha:1.0];
      goto LABEL_20;
    }
    a4 = v21;
    if (v21)
    {
      v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = 1;
LABEL_18:
      [v18 errorWithDomain:@"com.apple.AssetViewer.invalidHexValue" code:v19 userInfo:0];
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if ([v5 length] == 6)
  {
    v21 = a4;
    uint64_t v8 = 2;
    goto LABEL_8;
  }
  if (a4)
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = 0;
    goto LABEL_18;
  }
LABEL_19:
  v17 = 0;
LABEL_20:

  return v17;
}

@end