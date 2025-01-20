@interface LNDateRelevantCondition
- (LNDateRelevantCondition)initWithStartDate:(id)a3 endDate:(id)a4;
- (NSDate)endDate;
- (NSDate)startDate;
@end

@implementation LNDateRelevantCondition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (LNDateRelevantCondition)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"LNRelevantContext.m", 561, @"Invalid parameter not satisfying: %@", @"startDate" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)LNDateRelevantCondition;
  v10 = [(LNRelevantCondition *)&v15 _init];
  v11 = (LNDateRelevantCondition *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 1, a3);
    objc_storeStrong((id *)&v11->_endDate, a4);
    v12 = v11;
  }

  return v11;
}

@end