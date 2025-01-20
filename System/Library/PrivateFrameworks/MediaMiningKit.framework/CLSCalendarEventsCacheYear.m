@interface CLSCalendarEventsCacheYear
- (BOOL)isEqual:(id)a3;
- (CLSCalendarEventsCacheYear)initWithYear:(int64_t)a3;
- (NSMutableSet)months;
- (id)debugDescription;
- (int64_t)year;
- (unint64_t)hash;
- (void)setYear:(int64_t)a3;
@end

@implementation CLSCalendarEventsCacheYear

- (void).cxx_destruct
{
}

- (NSMutableSet)months
{
  return self->_months;
}

- (void)setYear:(int64_t)a3
{
  self->_year = a3;
}

- (int64_t)year
{
  return self->_year;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CLSCalendarEventsCacheYear *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(CLSCalendarEventsCacheYear *)v4 year];
      BOOL v6 = v5 == [(CLSCalendarEventsCacheYear *)self year];
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
  return self->_year;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int64_t year = self->_year;
  v7 = [(NSMutableSet *)self->_months debugDescription];
  v8 = [v3 stringWithFormat:@"<%@: %p> %ld, months %@", v5, self, year, v7];

  return v8;
}

- (CLSCalendarEventsCacheYear)initWithYear:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLSCalendarEventsCacheYear;
  v4 = [(CLSCalendarEventsCacheYear *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    months = v4->_months;
    v4->_months = (NSMutableSet *)v5;

    v4->_int64_t year = a3;
  }
  return v4;
}

@end