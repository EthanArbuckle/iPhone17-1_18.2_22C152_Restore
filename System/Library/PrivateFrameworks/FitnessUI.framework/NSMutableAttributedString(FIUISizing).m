@interface NSMutableAttributedString(FIUISizing)
- (double)scaleFontAndKerningToFitSize:()FIUISizing minimumFontSize:minimumKerning:stillDidntFit:;
- (double)scaleFontSizeByAmount:()FIUISizing minimumFontSize:;
- (double)scaleNumericAttribute:()FIUISizing byAmount:;
- (uint64_t)scaleToFitWidth:()FIUISizing;
@end

@implementation NSMutableAttributedString(FIUISizing)

- (double)scaleFontSizeByAmount:()FIUISizing minimumFontSize:
{
  uint64_t v6 = [a1 length];
  uint64_t v11 = 0;
  v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  [a1 beginEditing];
  uint64_t v7 = *MEMORY[0x263F814F0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__NSMutableAttributedString_FIUISizing__scaleFontSizeByAmount_minimumFontSize___block_invoke;
  v10[3] = &unk_2644A7FD0;
  *(double *)&v10[6] = a2;
  *(double *)&v10[7] = a3;
  v10[4] = a1;
  v10[5] = &v11;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v6, 0x100000, v10);
  [a1 endEditing];
  double v8 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (double)scaleNumericAttribute:()FIUISizing byAmount:
{
  id v6 = a4;
  uint64_t v7 = [a1 length];
  uint64_t v19 = 0;
  v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0x3FF0000000000000;
  [a1 beginEditing];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __72__NSMutableAttributedString_FIUISizing__scaleNumericAttribute_byAmount___block_invoke;
  uint64_t v14 = &unk_2644A7FF8;
  double v18 = a2;
  v17 = &v19;
  v15 = a1;
  id v8 = v6;
  id v16 = v8;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v7, 0x100000, &v11);
  objc_msgSend(a1, "endEditing", v11, v12, v13, v14, v15);
  double v9 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v9;
}

- (uint64_t)scaleToFitWidth:()FIUISizing
{
  uint64_t result = [a1 size];
  if (v5 > a2)
  {
    do
    {
      [a1 scaleFontSizeByAmount:0.94 minimumFontSize:1.0];
      double v7 = v6;
      uint64_t result = [a1 size];
    }
    while (v8 > a2 && v7 > 1.0);
  }
  return result;
}

- (double)scaleFontAndKerningToFitSize:()FIUISizing minimumFontSize:minimumKerning:stillDidntFit:
{
  uint64_t v13 = *MEMORY[0x263F81510];
  char v14 = 1;
  double v15 = 1.79769313e308;
  double v16 = 1.79769313e308;
  do
  {
    if (v14) {
      goto LABEL_10;
    }
    char v17 = 1;
    if ([a1 length] && a2 > 0.0 && a3 > 0.0)
    {
      if (v16 > a5)
      {
        [a1 scaleNumericAttribute:v13 byAmount:0.8];
        double v16 = v18;
LABEL_10:
        char v17 = 0;
        goto LABEL_11;
      }
      if (v15 > a4)
      {
        [a1 scaleFontSizeByAmount:0.85 minimumFontSize:a4];
        double v15 = v19;
        goto LABEL_10;
      }
    }
LABEL_11:
    objc_msgSend(a1, "boundingRectWithSize:options:context:", 1, 0, a2, 1.79769313e308);
    if (v17) {
      break;
    }
    char v14 = 0;
  }
  while (v20 > a3);
  if (a7) {
    *a7 = v20 > a3;
  }
  return a2;
}

@end