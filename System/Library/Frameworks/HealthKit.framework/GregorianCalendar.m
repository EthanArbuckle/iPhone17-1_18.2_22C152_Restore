@interface GregorianCalendar
@end

@implementation GregorianCalendar

uint64_t ___GregorianCalendar_block_invoke()
{
  _GregorianCalendar___gregorianCalendar = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];

  return MEMORY[0x1F41817F8]();
}

@end