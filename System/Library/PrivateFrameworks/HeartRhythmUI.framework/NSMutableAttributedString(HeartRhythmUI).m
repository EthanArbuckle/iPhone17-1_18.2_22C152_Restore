@interface NSMutableAttributedString(HeartRhythmUI)
+ (id)hrui_attributedStringForText:()HeartRhythmUI style:color:boldText:;
+ (id)hrui_bulletedString:()HeartRhythmUI textStyle:;
@end

@implementation NSMutableAttributedString(HeartRhythmUI)

+ (id)hrui_bulletedString:()HeartRhythmUI textStyle:
{
  v22[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [@"• " stringByAppendingString:a3];
  v7 = (void *)[objc_alloc(MEMORY[0x263F1C668]) initForTextStyle:v5];
  [v7 scaledValueForValue:12.0];
  double v9 = v8;
  v10 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  v11 = (void *)[v10 mutableCopy];

  id v12 = objc_alloc(MEMORY[0x263F1C388]);
  v13 = (void *)[v12 initWithTextAlignment:4 location:MEMORY[0x263EFFA78] options:v9];
  v22[0] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  [v11 setTabStops:v14];

  [v7 scaledValueForValue:4.0];
  objc_msgSend(v11, "setParagraphSpacingBefore:");
  [v11 setDefaultTabInterval:v9];
  [v11 setFirstLineHeadIndent:0.0];
  [v11 setHeadIndent:v9];
  v15 = [MEMORY[0x263F1C658] preferredFontForTextStyle:v5];

  uint64_t v16 = *MEMORY[0x263F1C238];
  v20[0] = *MEMORY[0x263F1C268];
  v20[1] = v16;
  v21[0] = v11;
  v21[1] = v15;
  v17 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  v18 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v6];
  objc_msgSend(v18, "addAttributes:range:", v17, 0, objc_msgSend(v6, "length"));

  return v18;
}

+ (id)hrui_attributedStringForText:()HeartRhythmUI style:color:boldText:
{
  v23[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x263F1C658];
  id v13 = a4;
  v14 = [v12 preferredFontForTextStyle:v13];
  v15 = objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:symbolicTraits:", v13, 2);

  if (!v10)
  {
    id v10 = [MEMORY[0x263F1C550] blackColor];
  }
  uint64_t v16 = *MEMORY[0x263F1C238];
  v22[0] = *MEMORY[0x263F1C240];
  v22[1] = v16;
  v23[0] = v10;
  v23[1] = v14;
  v17 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  v18 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v9 attributes:v17];
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