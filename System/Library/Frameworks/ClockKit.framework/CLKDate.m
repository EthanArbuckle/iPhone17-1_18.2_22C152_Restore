@interface CLKDate
+ (double)timeIntervalSinceReferenceDate;
+ (id)complicationDateWithTimeIntervalSinceNow:(double)a3;
+ (id)date;
+ (id)dateWithTimeIntervalSinceNow:(double)a3;
+ (id)unmodifiedDateWithTimeIntervalSinceNow:(double)a3;
- (CLKDate)init;
- (CLKDate)initWithCoder:(id)a3;
- (CLKDate)initWithTimeIntervalSinceNow:(double)a3;
- (CLKDate)initWithTimeIntervalSinceReferenceDate:(double)a3;
- (double)timeIntervalSinceNow;
@end

@implementation CLKDate

- (CLKDate)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLKDate;
  return [(CLKDate *)&v3 init];
}

+ (id)date
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (CLKDate)initWithTimeIntervalSinceReferenceDate:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CLKDate;
  return [(CLKDate *)&v4 initWithTimeIntervalSinceReferenceDate:a3];
}

- (CLKDate)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CLKDate;
  return [(CLKDate *)&v4 initWithCoder:a3];
}

- (CLKDate)initWithTimeIntervalSinceNow:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CLKDate;
  return [(CLKDate *)&v4 initWithTimeIntervalSinceNow:a3];
}

+ (id)dateWithTimeIntervalSinceNow:(double)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithTimeIntervalSinceNow:a3];

  return v3;
}

- (double)timeIntervalSinceNow
{
  return 0.0;
}

+ (double)timeIntervalSinceReferenceDate
{
  return 0.0;
}

+ (id)complicationDateWithTimeIntervalSinceNow:(double)a3
{
  objc_super v4 = (void *)MEMORY[0x263EFF910];
  v5 = [a1 complicationDate];
  v6 = [v4 dateWithTimeInterval:v5 sinceDate:a3];

  return v6;
}

+ (id)unmodifiedDateWithTimeIntervalSinceNow:(double)a3
{
  objc_super v4 = (void *)MEMORY[0x263EFF910];
  v5 = [a1 unmodifiedDate];
  v6 = [v4 dateWithTimeInterval:v5 sinceDate:a3];

  return v6;
}

@end