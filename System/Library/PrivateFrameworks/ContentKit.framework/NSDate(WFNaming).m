@interface NSDate(WFNaming)
- (uint64_t)wfName;
@end

@implementation NSDate(WFNaming)

- (uint64_t)wfName
{
  return [MEMORY[0x263F08790] localizedStringFromDate:a1 dateStyle:2 timeStyle:1];
}

@end