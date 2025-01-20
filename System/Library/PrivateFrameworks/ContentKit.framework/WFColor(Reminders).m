@interface WFColor(Reminders)
+ (id)colorWithRemindersColor:()Reminders;
@end

@implementation WFColor(Reminders)

+ (id)colorWithRemindersColor:()Reminders
{
  id v4 = a3;
  uint64_t v5 = [v4 colorRGBSpace];
  [v4 red];
  double v7 = v6;
  [v4 green];
  double v9 = v8;
  [v4 blue];
  double v11 = v10;
  [v4 alpha];
  double v13 = v12;

  if (v5 == 1) {
    [a1 colorWithDisplayP3Red:v7 green:v9 blue:v11 alpha:v13];
  }
  else {
  v14 = [a1 colorWithRed:v7 green:v9 blue:v11 alpha:v13];
  }
  return v14;
}

@end