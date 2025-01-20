@interface NSDateComponents(schema)
- (id)schema;
@end

@implementation NSDateComponents(schema)

- (id)schema
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v3 = objc_opt_new();
  v4 = [a1 timeZone];
  [v3 setTimeZone:v4];

  v5 = [v2 dateFromComponents:a1];
  if (v5)
  {
    v6 = [v3 stringFromDate:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end