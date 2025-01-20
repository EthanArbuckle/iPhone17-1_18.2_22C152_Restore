@interface NSAttributedString(CRKAdditions)
- (uint64_t)crk_familyNameRange;
@end

@implementation NSAttributedString(CRKAdditions)

- (uint64_t)crk_familyNameRange
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3010000000;
  v10 = &unk_224CD2305;
  long long v11 = xmmword_224CC0DE0;
  uint64_t v2 = [a1 length];
  uint64_t v3 = *MEMORY[0x263F08448];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__NSAttributedString_CRKAdditions__crk_familyNameRange__block_invoke;
  v6[3] = &unk_2646F54F0;
  v6[4] = &v7;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v2, 0, v6);
  uint64_t v4 = v8[4];
  _Block_object_dispose(&v7, 8);
  return v4;
}

@end