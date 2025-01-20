@interface _HKDataCollectorFlushRequest
- (NSDate)date;
- (_HKDataCollectorFlushRequest)initWithDate:(id)a3 completion:(id)a4;
- (id)completion;
@end

@implementation _HKDataCollectorFlushRequest

- (_HKDataCollectorFlushRequest)initWithDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_HKDataCollectorFlushRequest;
  v8 = [(_HKDataCollectorFlushRequest *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    date = v8->_date;
    v8->_date = (NSDate *)v9;

    uint64_t v11 = [v7 copy];
    id completion = v8->_completion;
    v8->_id completion = (id)v11;
  }
  return v8;
}

- (NSDate)date
{
  return self->_date;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end