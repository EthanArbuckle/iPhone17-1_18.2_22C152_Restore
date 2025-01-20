@interface NSAttributedString(MPUDynamicType)
- (BOOL)MPU_hasUniformFont;
- (id)MPU_attributedStringByUpdatingTextStyleFontsToPreferredTextStyleFonts;
- (id)MPU_tallestFontFromAttributes;
@end

@implementation NSAttributedString(MPUDynamicType)

- (id)MPU_attributedStringByUpdatingTextStyleFontsToPreferredTextStyleFonts
{
  v2 = (void *)[a1 mutableCopy];
  uint64_t v3 = *MEMORY[0x263F1C238];
  uint64_t v4 = [a1 length];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __107__NSAttributedString_MPUDynamicType__MPU_attributedStringByUpdatingTextStyleFontsToPreferredTextStyleFonts__block_invoke;
  v7[3] = &unk_2647D0ED0;
  id v5 = v2;
  id v8 = v5;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v4, 0, v7);

  return v5;
}

- (BOOL)MPU_hasUniformFont
{
  uint64_t v2 = [a1 length];
  if (!v2) {
    return 1;
  }
  uint64_t v3 = v2;
  long long v7 = xmmword_226BDEF50;
  id v4 = (id)objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x263F1C238], 0, &v7, 0, v2);
  return !(void)v7 && *((void *)&v7 + 1) == v3;
}

- (id)MPU_tallestFontFromAttributes
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  uint64_t v2 = [a1 length];
  if (v2)
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x2020000000;
    v7[3] = 0x10000000000000;
    uint64_t v3 = *MEMORY[0x263F1C238];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __67__NSAttributedString_MPUDynamicType__MPU_tallestFontFromAttributes__block_invoke;
    v6[3] = &unk_2647D0EF8;
    v6[4] = v7;
    v6[5] = &v8;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v2, 0, v6);
    _Block_object_dispose(v7, 8);
  }
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

@end