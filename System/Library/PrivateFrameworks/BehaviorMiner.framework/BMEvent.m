@interface BMEvent
- (BMEvent)initWithStartDate:(id)a3 endDate:(id)a4 item:(id)a5;
- (BMItem)item;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)description;
@end

@implementation BMEvent

- (BMEvent)initWithStartDate:(id)a3 endDate:(id)a4 item:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BMEvent;
  v11 = [(BMEvent *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v12;

    uint64_t v14 = [v9 copy];
    endDate = v11->_endDate;
    v11->_endDate = (NSDate *)v14;

    objc_storeStrong((id *)&v11->_item, a5);
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(BMEvent *)self startDate];
  v6 = [(BMEvent *)self endDate];
  v7 = [(BMEvent *)self item];
  id v8 = [v3 stringWithFormat:@"<%@: %p> startDate: %@, endDate: %@, item: %@", v4, self, v5, v6, v7];

  return v8;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (BMItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end