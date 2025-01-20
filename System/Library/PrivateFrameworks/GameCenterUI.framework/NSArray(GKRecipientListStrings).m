@interface NSArray(GKRecipientListStrings)
- (__CFString)_gkCommaSeparatedRecipientListWithWidth:()GKRecipientListStrings forTextStyle:usingSelector:;
- (uint64_t)_gkCommaSeparatedRecipientListWithWidth:()GKRecipientListStrings forTextStyle:;
@end

@implementation NSArray(GKRecipientListStrings)

- (uint64_t)_gkCommaSeparatedRecipientListWithWidth:()GKRecipientListStrings forTextStyle:
{
  return objc_msgSend(a1, "_gkCommaSeparatedRecipientListWithWidth:forTextStyle:usingSelector:", a3, sel_description);
}

- (__CFString)_gkCommaSeparatedRecipientListWithWidth:()GKRecipientListStrings forTextStyle:usingSelector:
{
  id v41 = a4;
  uint64_t v8 = [a1 count];
  if (v8)
  {
    unint64_t v9 = v8;
    v40 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v10 = 0;
    int v11 = 0;
    double v12 = a2;
    v13 = &stru_1F07B2408;
    do
    {
      v14 = [a1 objectAtIndex:v10];
      v15 = [v14 _gkInvokeSelector:a5];
      if (v11 < 1)
      {
        v18 = v13;
      }
      else
      {
        v16 = GKGameCenterUIFrameworkBundle();
        v17 = GKGetLocalizedStringFromTableInBundle();
        v18 = [(__CFString *)v13 stringByAppendingString:v17];
      }
      v19 = [(__CFString *)v18 stringByAppendingString:v15];

      v20 = [v19 _gkAttributedStringByApplyingStyle:v41];
      [v20 size];
      double v22 = v21;

      if (v22 <= v12)
      {
        v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFString length](v13, "length"));
        [v40 addObject:v23];

        v24 = v19;
        ++v11;
        v13 = v24;
      }

      if (v22 > v12) {
        break;
      }
      uint64_t v10 = v11;
    }
    while (v9 > v11);
    if (v22 > v12)
    {
      uint64_t v25 = (v11 - 1);
      if (v11 < 1)
      {
        v36 = v13;
LABEL_18:
        v27 = objc_msgSend(MEMORY[0x1E4F28EE0], "gk_formatInteger:withGrouping:", v9, 1);
        v37 = NSString;
        GKGameCenterUIFrameworkBundle();
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v38 = GKGetLocalizedStringFromTableInBundle();
        objc_msgSend(v37, "stringWithFormat:", v38, v27);
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        unint64_t v26 = v9 - v11;
        while (1)
        {
          v27 = objc_msgSend(MEMORY[0x1E4F28EE0], "gk_formatInteger:withGrouping:", v26, 1);
          v28 = GKGameCenterUIFrameworkBundle();
          v29 = GKGetLocalizedStringFromTableInBundle();
          -[__CFString stringByAppendingFormat:](v13, "stringByAppendingFormat:", v29, v27);
          v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v31 = [(__CFString *)v30 _gkAttributedStringByApplyingStyle:v41];
          [v31 size];
          double v33 = v32;

          if (v33 <= v12) {
            break;
          }
          --v11;
          v34 = [v40 objectAtIndex:v25];
          int v35 = [v34 intValue];

          -[__CFString substringWithRange:](v13, "substringWithRange:", 0, v35);
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v26;
          --v25;
          v13 = v36;
          if (!v11) {
            goto LABEL_18;
          }
        }
      }

      v13 = v30;
    }
  }
  else
  {
    v13 = &stru_1F07B2408;
  }

  return v13;
}

@end