@interface ICLogDateString
@end

@implementation ICLogDateString

void ____ICLogDateString_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v1 = (void *)__ICLogDateString_currentCalendar;
  __ICLogDateString_currentCalendar = v0;

  __ICLogDateString_unitFlags = 1;
}

@end