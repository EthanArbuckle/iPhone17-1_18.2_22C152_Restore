@interface NSDate
@end

@implementation NSDate

uint64_t __38__NSDate_Additions__hf_sharedCalendar__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
  uint64_t v1 = qword_26AB2F5A8;
  qword_26AB2F5A8 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __38__NSDate_Additions__hf_sharedTimeZone__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA18] localTimeZone];
  uint64_t v1 = qword_26AB2F5B8;
  qword_26AB2F5B8 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end