@interface NSMutableAttributedString(HKAdditions)
+ (id)hk_attributedStringForText:()HKAdditions style:color:boldText:;
+ (id)hk_initWithString:()HKAdditions font:hyphenationFactor:;
@end

@implementation NSMutableAttributedString(HKAdditions)

+ (id)hk_initWithString:()HKAdditions font:hyphenationFactor:
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1E4FB0850];
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 defaultParagraphStyle];
  v11 = (void *)[v10 mutableCopy];

  *(float *)&double v12 = a1;
  [v11 setHyphenationFactor:v12];
  [v11 setLineBreakMode:4];
  id v13 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v14 = *MEMORY[0x1E4FB0738];
  v18[0] = *MEMORY[0x1E4FB06F8];
  v18[1] = v14;
  v19[0] = v8;
  v19[1] = v11;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  v16 = (void *)[v13 initWithString:v9 attributes:v15];
  return v16;
}

+ (id)hk_attributedStringForText:()HKAdditions style:color:boldText:
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  double v12 = (void *)MEMORY[0x1E4FB08E0];
  id v13 = a4;
  uint64_t v14 = [v12 preferredFontForTextStyle:v13];
  v15 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", v13, 2);

  if (!v10)
  {
    id v10 = [MEMORY[0x1E4FB1618] blackColor];
  }
  uint64_t v16 = *MEMORY[0x1E4FB06F8];
  v22[0] = *MEMORY[0x1E4FB0700];
  v22[1] = v16;
  v23[0] = v10;
  v23[1] = v14;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v9 attributes:v17];
  if (v11)
  {
    uint64_t v19 = [v9 localizedStandardRangeOfString:v11];
    if (v20 != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v18, "addAttribute:value:range:", v16, v15, v19, v20);
    }
  }

  return v18;
}

@end