@interface _HKRateLimiterOperationRecord
- (NSDate)datePerformed;
- (unint64_t)cost;
- (void)initWithDatePerformed:(uint64_t)a3 cost:;
@end

@implementation _HKRateLimiterOperationRecord

- (void)initWithDatePerformed:(uint64_t)a3 cost:
{
  id v5 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_HKRateLimiterOperationRecord;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      uint64_t v6 = [v5 copy];
      v7 = (void *)a1[1];
      a1[1] = v6;

      a1[2] = a3;
    }
  }

  return a1;
}

- (NSDate)datePerformed
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)cost
{
  return self->_cost;
}

- (void).cxx_destruct
{
}

@end