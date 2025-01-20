@interface FMRelativeDateFormatter
- (FMRelativeDateFormatter)init;
- (id)formattingContextKeyForKey:(id)a3;
- (id)localizedStringForKey:(id)a3;
- (id)stringForObjectValue:(id)a3;
@end

@implementation FMRelativeDateFormatter

- (FMRelativeDateFormatter)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMRelativeDateFormatter;
  v2 = [(FMRelativeDateFormatter *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(FMRelativeDateFormatter *)v2 setDoesRelativeDateFormatting:1];
    [(FMRelativeDateFormatter *)v3 setDateStyle:3];
    [(FMRelativeDateFormatter *)v3 setTimeStyle:1];
  }
  return v3;
}

- (id)localizedStringForKey:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  objc_super v5 = [v3 bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:v4 value:v4 table:0];

  return v6;
}

- (id)formattingContextKeyForKey:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(FMRelativeDateFormatter *)self formattingContext] - 3;
  if (v5 > 2) {
    v6 = @"__STANDALONE";
  }
  else {
    v6 = off_1E689EAC8[v5];
  }
  v7 = [v4 stringByAppendingString:v6];

  return v7;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;
  [v4 timeIntervalSinceReferenceDate];
  double v9 = v7 - v8;
  if (v9 < 60.0)
  {
    v10 = [(FMRelativeDateFormatter *)self formattingContextKeyForKey:@"FMRELATIVEDATEFORMATTER__LESS_THAN_A_MINUTE_AGO"];
    v11 = [(FMRelativeDateFormatter *)self localizedStringForKey:v10];
LABEL_5:

    goto LABEL_7;
  }
  if (v9 < 3600.0)
  {
    v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v12 = objc_alloc_init(FMPastDateComponentsFormatter);
    id v13 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    v14 = [(FMRelativeDateFormatter *)self locale];
    [v10 setLocale:v14];

    [(NSDateComponentsFormatter *)v12 setCalendar:v10];
    [(NSDateComponentsFormatter *)v12 setAllowedUnits:64];
    [(NSDateComponentsFormatter *)v12 setUnitsStyle:3];
    [(NSDateComponentsFormatter *)v12 setIncludesTimeRemainingPhrase:1];
    [v13 setMinute:-(uint64_t)(v9 / 60.0)];
    v11 = [(NSDateComponentsFormatter *)v12 stringFromDateComponents:v13];

    goto LABEL_5;
  }
  v16.receiver = self;
  v16.super_class = (Class)FMRelativeDateFormatter;
  v11 = [(FMRelativeDateFormatter *)&v16 stringForObjectValue:v4];
LABEL_7:

  return v11;
}

@end