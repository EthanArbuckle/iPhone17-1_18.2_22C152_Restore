@interface DateTimeFormatRegularExpressionYearMonth
@end

@implementation DateTimeFormatRegularExpressionYearMonth

uint64_t ___DateTimeFormatRegularExpressionYearMonth_block_invoke()
{
  _DateTimeFormatRegularExpressionYearMonth_regex = _RegularExpressionFromPattern(@"^([0-9]{4})-([0-9]{2})$");
  return MEMORY[0x270F9A758]();
}

@end