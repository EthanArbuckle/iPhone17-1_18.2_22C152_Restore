@interface NSAttributedStringGrammarInflection
@end

@implementation NSAttributedStringGrammarInflection

uint64_t __78___NSAttributedStringGrammarInflection_NSInflectionPresets__presetInflections__block_invoke()
{
  v1[3] = *MEMORY[0x1E4F143B8];
  v1[0] = [[_NSAttributedStringGrammarInflection alloc] _initWithGender:2];
  v1[1] = -[_NSAttributedStringGrammarInflection _initWithGender:]([_NSAttributedStringGrammarInflection alloc], "_initWithGender:", 1, v1[0]);
  v1[2] = [[_NSAttributedStringGrammarInflection alloc] _initWithGender:3];
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1, 3), "copy");
  qword_1EB1EDA48 = result;
  return result;
}

@end