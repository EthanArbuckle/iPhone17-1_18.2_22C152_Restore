@interface AKFuture
- (AKFuture)init;
- (AKFuture)initWithMaxWait:(double)a3 description:(id)a4;
- (BOOL)resolved;
- (NSCondition)valueCondition;
- (NSDate)beginDate;
- (NSMutableArray)internalWrapper;
- (double)maxWait;
- (id)value;
- (void)setBeginDate:(id)a3;
- (void)setInternalWrapper:(id)a3;
- (void)setMaxWait:(double)a3;
- (void)setResolved:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)setValueCondition:(id)a3;
@end

@implementation AKFuture

- (AKFuture)init
{
  return [(AKFuture *)self initWithMaxWait:0 description:0.0];
}

- (AKFuture)initWithMaxWait:(double)a3 description:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AKFuture;
  v7 = [(AKFuture *)&v15 init];
  if (v7)
  {
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    internalWrapper = v7->_internalWrapper;
    v7->_internalWrapper = v8;

    uint64_t v10 = objc_opt_new();
    valueCondition = v7->_valueCondition;
    v7->_valueCondition = (NSCondition *)v10;

    [(NSCondition *)v7->_valueCondition setName:v6];
    if (a3 > 0.0)
    {
      uint64_t v12 = +[NSDate date];
      beginDate = v7->_beginDate;
      v7->_beginDate = (NSDate *)v12;

      v7->_maxWait = a3;
    }
  }

  return v7;
}

- (void)setValue:(id)a3
{
  valueCondition = self->_valueCondition;
  id v5 = a3;
  [(NSCondition *)valueCondition lock];
  [(NSMutableArray *)self->_internalWrapper setObject:v5 atIndexedSubscript:0];

  self->_resolved = 1;
  [(NSCondition *)self->_valueCondition signal];
  id v6 = self->_valueCondition;

  [(NSCondition *)v6 unlock];
}

- (id)value
{
  [(NSCondition *)self->_valueCondition lock];
  while (!self->_resolved)
  {
    if (self->_maxWait > 0.0 && self->_beginDate)
    {
      v3 = +[NSDate date];
      [v3 timeIntervalSinceDate:self->_beginDate];
      double v5 = v4;

      if (self->_maxWait - v5 <= 0.0) {
        break;
      }
      id v6 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
      [(NSCondition *)self->_valueCondition waitUntilDate:v6];
    }
    else
    {
      [(NSCondition *)self->_valueCondition wait];
    }
  }
  [(NSCondition *)self->_valueCondition unlock];
  v7 = [(NSMutableArray *)self->_internalWrapper firstObject];

  return v7;
}

- (BOOL)resolved
{
  return self->_resolved;
}

- (void)setResolved:(BOOL)a3
{
  self->_resolved = a3;
}

- (double)maxWait
{
  return self->_maxWait;
}

- (void)setMaxWait:(double)a3
{
  self->_maxWait = a3;
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (void)setBeginDate:(id)a3
{
}

- (NSCondition)valueCondition
{
  return self->_valueCondition;
}

- (void)setValueCondition:(id)a3
{
}

- (NSMutableArray)internalWrapper
{
  return self->_internalWrapper;
}

- (void)setInternalWrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalWrapper, 0);
  objc_storeStrong((id *)&self->_valueCondition, 0);

  objc_storeStrong((id *)&self->_beginDate, 0);
}

@end