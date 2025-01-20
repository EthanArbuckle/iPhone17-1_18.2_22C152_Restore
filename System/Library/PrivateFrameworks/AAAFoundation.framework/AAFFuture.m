@interface AAFFuture
- (AAFFuture)init;
- (AAFFuture)initWithMaxWait:(double)a3 description:(id)a4;
- (BOOL)resolved;
- (NSCondition)valueCondition;
- (NSDate)beginDate;
- (double)maxWait;
- (id)value;
- (id)valueObj;
- (void)setBeginDate:(id)a3;
- (void)setMaxWait:(double)a3;
- (void)setResolved:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)setValueCondition:(id)a3;
- (void)setValueObj:(id)a3;
@end

@implementation AAFFuture

- (AAFFuture)init
{
  return [(AAFFuture *)self initWithMaxWait:0 description:0.0];
}

- (AAFFuture)initWithMaxWait:(double)a3 description:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AAFFuture;
  v7 = [(AAFFuture *)&v13 init];
  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    valueCondition = v7->_valueCondition;
    v7->_valueCondition = (NSCondition *)v8;

    [(NSCondition *)v7->_valueCondition setName:v6];
    if (a3 > 0.0)
    {
      uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
      beginDate = v7->_beginDate;
      v7->_beginDate = (NSDate *)v10;

      v7->_maxWait = a3;
    }
  }

  return v7;
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  [(NSCondition *)self->_valueCondition lock];
  id valueObj = self->_valueObj;
  self->_id valueObj = v4;
  id v6 = v4;

  self->_resolved = 1;
  [(NSCondition *)self->_valueCondition signal];
  [(NSCondition *)self->_valueCondition unlock];
}

- (id)value
{
  [(NSCondition *)self->_valueCondition lock];
  while (!self->_resolved)
  {
    if (self->_maxWait > 0.0 && self->_beginDate)
    {
      v3 = [MEMORY[0x1E4F1C9C8] date];
      [v3 timeIntervalSinceDate:self->_beginDate];
      double v5 = v4;

      if (self->_maxWait - v5 <= 0.0) {
        break;
      }
      id v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:");
      [(NSCondition *)self->_valueCondition waitUntilDate:v6];
    }
    else
    {
      [(NSCondition *)self->_valueCondition wait];
    }
  }
  [(NSCondition *)self->_valueCondition unlock];
  id valueObj = self->_valueObj;
  return valueObj;
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

- (id)valueObj
{
  return self->_valueObj;
}

- (void)setValueObj:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueObj, 0);
  objc_storeStrong((id *)&self->_valueCondition, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
}

@end