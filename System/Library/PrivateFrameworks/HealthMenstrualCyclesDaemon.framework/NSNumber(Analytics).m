@interface NSNumber(Analytics)
+ (id)_weeksBetweenStartDate:()Analytics endDate:calendar:;
+ (id)_yearsBetweenStartDateComponents:()Analytics endDate:calendar:;
@end

@implementation NSNumber(Analytics)

+ (id)_weeksBetweenStartDate:()Analytics endDate:calendar:
{
  v5 = [a5 components:0x2000 fromDate:a3 toDate:a4 options:0];
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "weekOfYear"));

  return v6;
}

+ (id)_yearsBetweenStartDateComponents:()Analytics endDate:calendar:
{
  id v7 = a4;
  id v8 = a5;
  v9 = [v8 dateFromComponents:a3];
  if (v9)
  {
    v10 = [v8 components:4 fromDate:v9 toDate:v7 options:0];
    v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "year"));
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end