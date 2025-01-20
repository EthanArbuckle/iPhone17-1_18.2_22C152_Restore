@interface ADStatusConditionRateLimitedObject
- (NSDate)setTime;
- (NSUUID)statusCondition;
- (id)init:(id)a3 at:(id)a4 kind:(int64_t)a5;
- (int64_t)operation;
@end

@implementation ADStatusConditionRateLimitedObject

- (id)init:(id)a3 at:(id)a4 kind:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ADStatusConditionRateLimitedObject;
  v11 = [(ADStatusConditionRateLimitedObject *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_statusCondition, a3);
    objc_storeStrong((id *)&v12->_setTime, a4);
    v12->_operation = a5;
  }

  return v12;
}

- (NSUUID)statusCondition
{
  return self->_statusCondition;
}

- (NSDate)setTime
{
  return self->_setTime;
}

- (int64_t)operation
{
  return self->_operation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setTime, 0);

  objc_storeStrong((id *)&self->_statusCondition, 0);
}

@end