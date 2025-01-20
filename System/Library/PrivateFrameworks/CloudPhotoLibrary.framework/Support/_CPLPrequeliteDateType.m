@interface _CPLPrequeliteDateType
- (_CPLPrequeliteDateType)init;
- (id)_bindableValueForValue:(id)a3;
- (id)_valueForBindableValue:(id)a3;
- (id)defaultValueForNull;
@end

@implementation _CPLPrequeliteDateType

- (_CPLPrequeliteDateType)init
{
  uint64_t v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)_CPLPrequeliteDateType;
  return [(CPLPrequeliteType *)&v5 initWithTypeName:"TIMESTAMP" defaultValue:0 objcClass:v3];
}

- (id)defaultValueForNull
{
  return +[NSDate date];
}

- (id)_bindableValueForValue:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      sub_1001D26E4((uint64_t)self, (uint64_t)v5, (uint64_t)a2);
    }
    [v5 timeIntervalSinceReferenceDate];
    v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_valueForBindableValue:(id)a3
{
  if (a3)
  {
    [a3 doubleValue];
    v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end