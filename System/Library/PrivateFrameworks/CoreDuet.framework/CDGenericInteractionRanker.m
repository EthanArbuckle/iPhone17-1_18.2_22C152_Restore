@interface CDGenericInteractionRanker
@end

@implementation CDGenericInteractionRanker

uint64_t __47___CDGenericInteractionRanker_isDateInWeekend___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v1 = isDateInWeekend__calendar;
  isDateInWeekend__calendar = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end