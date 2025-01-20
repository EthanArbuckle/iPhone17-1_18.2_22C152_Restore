@interface CLSCalendarEventsCacheDay
- (BOOL)isEqual:(id)a3;
- (CLSCalendarEventsCacheDay)initWithDay:(int64_t)a3;
- (NSMutableSet)events;
- (id)debugDescription;
- (int64_t)day;
- (unint64_t)hash;
- (void)setDay:(int64_t)a3;
@end

@implementation CLSCalendarEventsCacheDay

- (void).cxx_destruct
{
}

- (NSMutableSet)events
{
  return self->_events;
}

- (void)setDay:(int64_t)a3
{
  self->_day = a3;
}

- (int64_t)day
{
  return self->_day;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CLSCalendarEventsCacheDay *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(CLSCalendarEventsCacheDay *)v4 day];
      BOOL v6 = v5 == [(CLSCalendarEventsCacheDay *)self day];
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
  return self->_day;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  BOOL v6 = [v3 stringWithFormat:@"<%@: %p> %ld, events %p", v5, self, self->_day, self->_events];

  return v6;
}

- (CLSCalendarEventsCacheDay)initWithDay:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLSCalendarEventsCacheDay;
  v4 = [(CLSCalendarEventsCacheDay *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    events = v4->_events;
    v4->_events = (NSMutableSet *)v5;

    v4->_day = a3;
  }
  return v4;
}

@end