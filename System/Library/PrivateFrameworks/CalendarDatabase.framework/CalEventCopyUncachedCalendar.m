@interface CalEventCopyUncachedCalendar
@end

@implementation CalEventCopyUncachedCalendar

uint64_t ___CalEventCopyUncachedCalendar_block_invoke(uint64_t a1, uint64_t a2)
{
  return sqlite3_bind_int64(*(sqlite3_stmt **)(a2 + 8), 1, *(void *)(a1 + 32));
}

@end