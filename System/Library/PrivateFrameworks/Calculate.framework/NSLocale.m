@interface NSLocale
@end

@implementation NSLocale

uint64_t __38__NSLocale_Whitespace__usesWhitespace__block_invoke()
{
  usesWhitespace_nonWhitespaceLanguages = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"zh", @"ja", @"th", 0);
  return MEMORY[0x1F41817F8]();
}

@end