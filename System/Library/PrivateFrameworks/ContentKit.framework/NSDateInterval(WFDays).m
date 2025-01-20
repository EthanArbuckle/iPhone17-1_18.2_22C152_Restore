@interface NSDateInterval(WFDays)
- (id)wf_initWithDaysAfterCurrentDate:()WFDays;
- (id)wf_initWithDaysBeforeAndAfterCurrentDate:()WFDays;
- (id)wf_initWithDaysBeforeCurrentDate:()WFDays;
@end

@implementation NSDateInterval(WFDays)

- (id)wf_initWithDaysAfterCurrentDate:()WFDays
{
  v5 = [MEMORY[0x263EFF910] date];
  v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v7 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v7 setDay:a3];
  v8 = [v6 dateByAddingComponents:v7 toDate:v5 options:0];
  v9 = (void *)[a1 initWithStartDate:v5 endDate:v8];

  return v9;
}

- (id)wf_initWithDaysBeforeCurrentDate:()WFDays
{
  v5 = [MEMORY[0x263EFF910] date];
  v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v7 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v7 setDay:-a3];
  v8 = [v6 dateByAddingComponents:v7 toDate:v5 options:0];
  v9 = (void *)[a1 initWithStartDate:v8 endDate:v5];

  return v9;
}

- (id)wf_initWithDaysBeforeAndAfterCurrentDate:()WFDays
{
  v5 = [MEMORY[0x263EFF910] date];
  v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v7 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v7 setDay:-a3];
  v8 = [v6 dateByAddingComponents:v7 toDate:v5 options:0];
  [v7 setDay:a3];
  v9 = [v6 dateByAddingComponents:v7 toDate:v5 options:0];
  v10 = (void *)[a1 initWithStartDate:v8 endDate:v9];

  return v10;
}

@end