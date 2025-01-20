@interface UIFont
@end

@implementation UIFont

uint64_t __57__UIFont_FocusUIAdditions__fcui_excessiveLineHeightChars__block_invoke()
{
  uint64_t v0 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  uint64_t v1 = fcui_excessiveLineHeightChars___excessiveLineHeightChars;
  fcui_excessiveLineHeightChars___excessiveLineHeightChars = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end