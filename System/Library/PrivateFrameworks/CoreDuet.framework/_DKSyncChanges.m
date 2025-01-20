@interface _DKSyncChanges
- (NSArray)additionChangeSets;
- (NSArray)deletionChangeSets;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)initWithAdditionChangeSets:(void *)a3 deletionChangeSets:(void *)a4 startDate:(void *)a5 endDate:;
@end

@implementation _DKSyncChanges

- (id)initWithAdditionChangeSets:(void *)a3 deletionChangeSets:(void *)a4 startDate:(void *)a5 endDate:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)_DKSyncChanges;
    v14 = (id *)objc_msgSendSuper2(&v16, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      objc_storeStrong(a1 + 4, a5);
    }
  }

  return a1;
}

- (NSArray)additionChangeSets
{
  return self->_additionChangeSets;
}

- (NSArray)deletionChangeSets
{
  return self->_deletionChangeSets;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_deletionChangeSets, 0);
  objc_storeStrong((id *)&self->_additionChangeSets, 0);
}

@end