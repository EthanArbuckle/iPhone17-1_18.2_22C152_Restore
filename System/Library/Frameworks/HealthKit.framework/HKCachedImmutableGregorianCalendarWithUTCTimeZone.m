@interface HKCachedImmutableGregorianCalendarWithUTCTimeZone
@end

@implementation HKCachedImmutableGregorianCalendarWithUTCTimeZone

uint64_t ___HKCachedImmutableGregorianCalendarWithUTCTimeZone_block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithUTCTimeZone");
  uint64_t v1 = _HKCachedImmutableGregorianCalendarWithUTCTimeZone_gregorianCalendarWithUTCTimeZone;
  _HKCachedImmutableGregorianCalendarWithUTCTimeZone_gregorianCalendarWithUTCTimeZone = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end