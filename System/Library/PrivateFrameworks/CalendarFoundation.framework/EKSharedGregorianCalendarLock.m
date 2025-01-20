@interface EKSharedGregorianCalendarLock
@end

@implementation EKSharedGregorianCalendarLock

uint64_t ___EKSharedGregorianCalendarLock_block_invoke()
{
  _EKSharedGregorianCalendarLock_sharedGregorianCalendarLock = (uint64_t)dispatch_queue_create("com.apple.calendar.foundation.sharedcalendarlock", 0);

  return MEMORY[0x1F41817F8]();
}

@end