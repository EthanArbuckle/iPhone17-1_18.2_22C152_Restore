@interface DateTimeFormatRegularExpressionYear
@end

@implementation DateTimeFormatRegularExpressionYear

uint64_t ___DateTimeFormatRegularExpressionYear_block_invoke()
{
  _DateTimeFormatRegularExpressionYear_regex = _RegularExpressionFromPattern(@"^([0-9]{4})$");
  return MEMORY[0x270F9A758]();
}

@end