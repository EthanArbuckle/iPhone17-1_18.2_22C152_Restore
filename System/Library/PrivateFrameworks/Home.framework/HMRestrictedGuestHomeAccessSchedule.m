@interface HMRestrictedGuestHomeAccessSchedule
@end

@implementation HMRestrictedGuestHomeAccessSchedule

uint64_t __103__HMRestrictedGuestHomeAccessSchedule_HFAdditions__hf_restrictedGuestHomeAccessScheduleFromHFSchedule___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isWeekDayRule];
}

uint64_t __103__HMRestrictedGuestHomeAccessSchedule_HFAdditions__hf_restrictedGuestHomeAccessScheduleFromHFSchedule___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 weekDayRule];
}

uint64_t __103__HMRestrictedGuestHomeAccessSchedule_HFAdditions__hf_restrictedGuestHomeAccessScheduleFromHFSchedule___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isYearDayRule];
}

uint64_t __103__HMRestrictedGuestHomeAccessSchedule_HFAdditions__hf_restrictedGuestHomeAccessScheduleFromHFSchedule___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 yearDayRule];
}

@end