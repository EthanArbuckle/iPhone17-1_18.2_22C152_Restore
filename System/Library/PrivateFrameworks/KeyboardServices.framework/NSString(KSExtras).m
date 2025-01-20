@interface NSString(KSExtras)
+ (uint64_t)_characterSetWithPattern:()KSExtras;
+ (uint64_t)_nonHiraganaKatakanaOrBopomofoSet;
+ (uint64_t)_nonIdeographicCharacterSet;
- (BOOL)_containsEmoji;
- (BOOL)_contentsExclusivelyInCharacterSet:()KSExtras;
- (uint64_t)_containsCJKSymbolsAndPunctuation;
- (uint64_t)_containsHiraganaKatakanaOrBopomofo;
- (uint64_t)_containsIdeographicCharacters;
@end

@implementation NSString(KSExtras)

+ (uint64_t)_characterSetWithPattern:()KSExtras
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  HIDWORD(v10) = 0;
  unint64_t v4 = [v3 length];
  if (v4 >= 0x7D0) {
    uint64_t v5 = 2000;
  }
  else {
    uint64_t v5 = v4;
  }
  id v6 = v3;
  if ([v6 _fastCharacterContents])
  {
    uint64_t v7 = uset_openPattern();
  }
  else
  {
    MEMORY[0x270FA5388]();
    objc_msgSend(v6, "getCharacters:range:", (char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), 0, v5);
    uint64_t v7 = uset_openPattern();
  }
  if (SHIDWORD(v10) >= 1) {
    NSLog(&cfstr_CouldnTCreateU.isa, v6);
  }

  return v7;
}

- (BOOL)_contentsExclusivelyInCharacterSet:()KSExtras
{
  v8[1] = *MEMORY[0x263EF8340];
  unint64_t v2 = [a1 length];
  if (v2 >= 0x7D0) {
    uint64_t v3 = 2000;
  }
  else {
    uint64_t v3 = v2;
  }
  id v4 = a1;
  if ([v4 _fastCharacterContents])
  {
    int v5 = uset_containsAllCodePoints();
  }
  else
  {
    MEMORY[0x270FA5388]();
    objc_msgSend(v4, "getCharacters:range:", (char *)v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), 0, v3);
    int v5 = uset_containsAllCodePoints();
  }
  return v5 != 0;
}

- (uint64_t)_containsCJKSymbolsAndPunctuation
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__NSString_KSExtras___containsCJKSymbolsAndPunctuation__block_invoke;
  block[3] = &unk_2648906A8;
  block[4] = a1;
  if (_containsCJKSymbolsAndPunctuation___onceToken != -1) {
    dispatch_once(&_containsCJKSymbolsAndPunctuation___onceToken, block);
  }
  return [a1 _contentsExclusivelyInCharacterSet:_containsCJKSymbolsAndPunctuation___nonCJKSymbolsSet] ^ 1;
}

- (uint64_t)_containsIdeographicCharacters
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_nonIdeographicCharacterSet")) ^ 1;
}

+ (uint64_t)_nonIdeographicCharacterSet
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__NSString_KSExtras___nonIdeographicCharacterSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_nonIdeographicCharacterSet___onceToken != -1) {
    dispatch_once(&_nonIdeographicCharacterSet___onceToken, block);
  }
  return _nonIdeographicCharacterSet___nonIdeographicCharacterSet;
}

- (BOOL)_containsEmoji
{
  return CEMStringContainsEmoji() != 0;
}

- (uint64_t)_containsHiraganaKatakanaOrBopomofo
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_nonHiraganaKatakanaOrBopomofoSet")) ^ 1;
}

+ (uint64_t)_nonHiraganaKatakanaOrBopomofoSet
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__NSString_KSExtras___nonHiraganaKatakanaOrBopomofoSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_nonHiraganaKatakanaOrBopomofoSet___onceToken != -1) {
    dispatch_once(&_nonHiraganaKatakanaOrBopomofoSet___onceToken, block);
  }
  return _nonHiraganaKatakanaOrBopomofoSet___nonHiraganaKatakanaOrBopomofoSet;
}

@end