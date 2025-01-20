@interface APSTimestamp
- (APSTimestamp)initWithValue:(id)a3;
- (NSDate)date;
- (id)value;
@end

@implementation APSTimestamp

- (APSTimestamp)initWithValue:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APSTimestamp;
  v5 = [(APSTimestamp *)&v11 init];
  if (v5)
  {
    id v6 = [v4 copy];
    id value = v5->_value;
    v5->_id value = v6;

    v8 = (NSDate *)objc_alloc_init((Class)NSDate);
    date = v5->_date;
    v5->_date = v8;
  }
  return v5;
}

- (NSDate)date
{
  return self->_date;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end