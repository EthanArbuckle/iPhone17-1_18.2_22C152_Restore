@interface HKMedicalIDData
@end

@implementation HKMedicalIDData

uint64_t __41___HKMedicalIDData__gregorianUtcCalendar__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithUTCTimeZone");
  uint64_t v1 = _gregorianUtcCalendar__calendar;
  _gregorianUtcCalendar__calendar = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end