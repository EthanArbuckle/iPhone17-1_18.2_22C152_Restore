@interface SKGDate
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (id)description;
- (void)setDate:(id)a3;
@end

@implementation SKGDate

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(SKGDate *)self date];
    v7 = [v5 date];
    if ([v6 isEqualToDate:v7])
    {
      v10.receiver = self;
      v10.super_class = (Class)SKGDate;
      BOOL v8 = [(SKGEntity *)&v10 isEqual:v5];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(SKGDate *)self date];
  id v5 = [v4 description];
  [(SKGEntity *)self score];
  v7 = +[NSString stringWithFormat:@"<%@: %@ %f", v3, v5, v6];

  return v7;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end