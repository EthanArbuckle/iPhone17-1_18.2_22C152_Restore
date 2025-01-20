@interface CLSCalendarEventsCacheMonth
- (BOOL)isEqual:(id)a3;
- (CLSCalendarEventsCacheMonth)initWithMonth:(int64_t)a3;
- (NSMutableSet)days;
- (id)debugDescription;
- (int64_t)month;
- (unint64_t)hash;
- (void)setMonth:(int64_t)a3;
@end

@implementation CLSCalendarEventsCacheMonth

- (void).cxx_destruct
{
}

- (NSMutableSet)days
{
  return self->_days;
}

- (void)setMonth:(int64_t)a3
{
  self->_month = a3;
}

- (int64_t)month
{
  return self->_month;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CLSCalendarEventsCacheMonth *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(CLSCalendarEventsCacheMonth *)v4 month];
      BOOL v6 = v5 == [(CLSCalendarEventsCacheMonth *)self month];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_month;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int64_t month = self->_month;
  v7 = [(NSMutableSet *)self->_days debugDescription];
  v8 = [v3 stringWithFormat:@"<%@: %p> %ld, days %@", v5, self, month, v7];

  return v8;
}

- (CLSCalendarEventsCacheMonth)initWithMonth:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLSCalendarEventsCacheMonth;
  v4 = [(CLSCalendarEventsCacheMonth *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    days = v4->_days;
    v4->_days = (NSMutableSet *)v5;

    v4->_int64_t month = a3;
  }
  return v4;
}

@end