@interface NSDate(NSNaturalLanguageDate)
+ (uint64_t)dateWithNaturalLanguageString:()NSNaturalLanguageDate;
+ (uint64_t)dateWithNaturalLanguageString:()NSNaturalLanguageDate date:locale:;
+ (uint64_t)dateWithNaturalLanguageString:()NSNaturalLanguageDate locale:;
@end

@implementation NSDate(NSNaturalLanguageDate)

+ (uint64_t)dateWithNaturalLanguageString:()NSNaturalLanguageDate date:locale:
{
  v2 = +[NSCalendarDate dateWithNaturalLanguageString:date:locale:](NSCalendarDate, "dateWithNaturalLanguageString:date:locale:");
  if (!v2 || self == a1) {
    return (uint64_t)v2;
  }
  [(NSCalendarDate *)v2 timeIntervalSinceReferenceDate];

  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

+ (uint64_t)dateWithNaturalLanguageString:()NSNaturalLanguageDate
{
  return [a1 dateWithNaturalLanguageString:a3 date:0 locale:0];
}

+ (uint64_t)dateWithNaturalLanguageString:()NSNaturalLanguageDate locale:
{
  return [a1 dateWithNaturalLanguageString:a3 date:0 locale:a4];
}

@end