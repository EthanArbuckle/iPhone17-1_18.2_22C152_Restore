@interface NPTrimNonLetters
@end

@implementation NPTrimNonLetters

void ___NPTrimNonLetters_block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  uint64_t v0 = [v2 invertedSet];
  v1 = (void *)_NPTrimNonLetters_nonLetterCharacterSet;
  _NPTrimNonLetters_nonLetterCharacterSet = v0;
}

@end