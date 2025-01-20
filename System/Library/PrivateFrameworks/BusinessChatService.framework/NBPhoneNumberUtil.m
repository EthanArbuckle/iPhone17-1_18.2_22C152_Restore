@interface NBPhoneNumberUtil
@end

@implementation NBPhoneNumberUtil

uint64_t __36___NBPhoneNumberUtil_sharedInstance__block_invoke(uint64_t a1)
{
  _MergedGlobals_41 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

void __46___NBPhoneNumberUtil_initRegularExpressionSet__block_invoke()
{
  uint64_t v0 = [NSString stringWithFormat:@"^[%@]+", 0x26C612CE8];
  v1 = (void *)qword_26ACEFD18;
  qword_26ACEFD18 = v0;

  uint64_t v2 = [NSString stringWithFormat:@"[%@%@]", 0x26C612CE8, 0x26C612D08];
  v3 = (void *)qword_26ACEFD20;
  qword_26ACEFD20 = v2;

  v4 = (void *)qword_26ACEFD28;
  qword_26ACEFD28 = @"[\\\\\\/] *x";

  uint64_t v5 = [NSString stringWithFormat:@"[^%@%@#]+$", 0x26C612D08, @"A-Za-z"];
  v6 = (void *)qword_26ACEFD30;
  qword_26ACEFD30 = v5;

  uint64_t v7 = [NSString stringWithFormat:@"(?:%@)$", @"(?:ext=([0-9０-９٠-٩۰-۹]{1,7})|[  \\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$"];;
  v8 = (void *)qword_26ACEFD38;
  qword_26ACEFD38 = v7;

  uint64_t v9 = [NSString stringWithFormat:@"[%@]+", @"-x‐-―−ー－-／ ­​⁠　()（）［］.\\[\\]/~⁓∼～"];
  v10 = (void *)qword_26ACEFD40;
  qword_26ACEFD40 = v9;

  v11 = (void *)qword_26ACEFD48;
  qword_26ACEFD48 = @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  ­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  ­​⁠　()（）［］.\\[\\]/~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  \\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
}

uint64_t __36___NBPhoneNumberUtil_DIGIT_MAPPINGS__block_invoke()
{
  objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4", @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8",
    @"9",
    @"9",
    @"0",
    @"０",
    @"1",
    @"１",
    @"2",
    @"２",
    @"3",
    @"３",
    @"4",
    @"４",
    @"5",
    @"５",
    @"6",
    @"６",
    @"7",
    @"７",
    @"8",
    @"８",
    @"9",
    @"９",
    @"0",
    @"٠",
    @"1",
    @"١",
    @"2",
    @"٢",
    @"3",
    @"٣",
    @"4",
    @"٤",
    @"5",
    @"٥",
    @"6",
    @"٦",
    @"7",
    @"٧",
    @"8",
    @"٨",
    @"9",
    @"٩",
    @"0",
  qword_26ACEFD58 = @"۰");

  return MEMORY[0x270F9A758]();
}

void __47___NBPhoneNumberUtil_initNormalizationMappings__block_invoke()
{
  v9[2] = *MEMORY[0x263EF8340];
  objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4", @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8",
    @"9",
    @"9",
    @"+",
    @"+",
    @"*",
    @"*",
    @"#",
    @"#",
  uint64_t v0 = 0);
  v1 = (void *)qword_26ACEFD60;
  qword_26ACEFD60 = v0;

  objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4", @"5", @"5", @"6", @"6", @"7", @"7", @"8",
    @"8",
    @"9",
    @"9",
    @"0",
    @"０",
    @"1",
    @"１",
    @"2",
    @"２",
    @"3",
    @"３",
    @"4",
    @"４",
    @"5",
    @"５",
    @"6",
    @"６",
    @"7",
    @"７",
    @"8",
    @"８",
    @"9",
    @"９",
    @"0",
    @"٠",
    @"1",
    @"١",
    @"2",
    @"٢",
    @"3",
    @"٣",
    @"4",
    @"٤",
    @"5",
    @"٥",
    @"6",
    @"٦",
    @"7",
    @"٧",
    @"8",
    @"٨",
    @"9",
    @"٩",
  uint64_t v2 = @"0");
  v3 = (void *)qword_26ACEFD68;
  qword_26ACEFD68 = v2;

  objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4", @"5", @"5", @"6", @"6", @"7", @"7", @"8",
    @"8",
    @"9",
    @"9",
    @"A",
    @"A",
    @"B",
    @"B",
    @"C",
    @"C",
    @"D",
    @"D",
    @"E",
    @"E",
    @"F",
    @"F",
    @"G",
    @"G",
    @"H",
    @"H",
    @"I",
    @"I",
    @"J",
    @"J",
    @"K",
    @"K",
    @"L",
    @"L",
    @"M",
    @"M",
    @"N",
    @"N",
    @"O",
    @"O",
    @"P",
    @"P",
    @"Q",
    @"Q",
    @"R",
    @"R",
    @"S",
    @"S",
    @"T",
    @"T",
  uint64_t v4 = @"U");
  uint64_t v5 = (void *)qword_26ACEFD70;
  qword_26ACEFD70 = v4;

  v8[0] = &unk_26C628D98;
  v8[1] = &unk_26C628DB0;
  v9[0] = @"1";
  v9[1] = @"9";
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  uint64_t v7 = (void *)qword_26ACEFD78;
  qword_26ACEFD78 = v6;
}

BOOL __41___NBPhoneNumberUtil_getSupportedRegions__block_invoke(uint64_t a1, void *a2)
{
  return isNan(a2);
}

uint64_t __42___NBPhoneNumberUtil_telephonyNetworkInfo__block_invoke()
{
  qword_26ACEFD88 = (uint64_t)objc_alloc_init(MEMORY[0x263F02D18]);

  return MEMORY[0x270F9A758]();
}

@end