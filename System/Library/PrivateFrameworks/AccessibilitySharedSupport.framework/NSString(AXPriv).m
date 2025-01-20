@interface NSString(AXPriv)
+ (uint64_t)_characterSetWithPattern:()AXPriv;
+ (uint64_t)_ideographSet;
+ (uint64_t)_japaneseLetterSet;
- (uint64_t)_isJapanesePhrase;
- (uint64_t)_isOnlyIdeographs;
@end

@implementation NSString(AXPriv)

+ (uint64_t)_characterSetWithPattern:()AXPriv
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  HIDWORD(v12) = 0;
  uint64_t v4 = [v3 length];
  id v5 = v3;
  if ([v5 _fastCharacterContents])
  {
    uint64_t v9 = uset_openPattern();
  }
  else
  {
    MEMORY[0x1F4188790](0, v6, v7, v8);
    objc_msgSend(v5, "getCharacters:range:", (char *)&v12 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 0, v4);
    uint64_t v9 = uset_openPattern();
  }
  if (SHIDWORD(v12) >= 1) {
    NSLog(&cfstr_CouldnTCreateU.isa, v5);
  }

  return v9;
}

+ (uint64_t)_ideographSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__NSString_AXPriv___ideographSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_ideographSet___onceToken != -1) {
    dispatch_once(&_ideographSet___onceToken, block);
  }
  return _ideographSet___ideographSet;
}

+ (uint64_t)_japaneseLetterSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__NSString_AXPriv___japaneseLetterSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_japaneseLetterSet___onceToken != -1) {
    dispatch_once(&_japaneseLetterSet___onceToken, block);
  }
  return _japaneseLetterSet___japaneseLetterSet;
}

- (uint64_t)_isOnlyIdeographs
{
  uint64_t v2 = [(id)objc_opt_class() _ideographSet];

  return [a1 _contentsExclusivelyInCharacterSet:v2];
}

- (uint64_t)_isJapanesePhrase
{
  uint64_t v2 = [(id)objc_opt_class() _japaneseLetterSet];

  return [a1 _contentsExclusivelyInCharacterSet:v2];
}

@end