@interface APSDatePrinter
+ (id)dateStringFromDate:(id)a3;
+ (id)dateStringFromInterval:(double)a3;
@end

@implementation APSDatePrinter

+ (id)dateStringFromDate:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = sub_10001DA9C();
    v5 = [v4 stringFromDate:v3];
    +[NSDate timeIntervalSinceReferenceDate];
    double v7 = v6;
    [v3 timeIntervalSinceReferenceDate];
    double v9 = v8;

    v10 = +[NSString stringWithFormat:@"%@ (%.2f seconds ago)", v5, v7 - v9];
  }
  else
  {
    v10 = @"never";
  }
  return v10;
}

+ (id)dateStringFromInterval:(double)a3
{
  if (a3 == 0.0)
  {
    id v3 = @"never";
  }
  else
  {
    v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    double v6 = sub_10001DA9C();
    double v7 = [v6 stringFromDate:v5];
    +[NSDate timeIntervalSinceReferenceDate];
    id v3 = +[NSString stringWithFormat:@"%@ (%.2f seconds ago)", v7, v8 - a3];
  }
  return v3;
}

@end