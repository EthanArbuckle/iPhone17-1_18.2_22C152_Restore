@interface HMDBackingStoreCacheFetchZonesOperation
- (HMDBackingStoreCacheFetchZonesOperation)initWithFetchResult:(id)a3;
- (id)fetchResult;
- (id)mainReturningError;
- (void)setFetchResult:(id)a3;
@end

@implementation HMDBackingStoreCacheFetchZonesOperation

- (void).cxx_destruct
{
}

- (void)setFetchResult:(id)a3
{
}

- (id)fetchResult
{
  return self->_fetchResult;
}

- (id)mainReturningError
{
  v3 = [(HMDBackingStoreCacheFetchZonesOperation *)self fetchResult];

  if (v3)
  {
    v4 = [(HMDBackingStoreCacheFetchZonesOperation *)self fetchResult];
    v5 = [(HMDBackingStoreOperation *)self store];
    v6 = [v5 local];
    v7 = [v6 zoneCache];
    ((void (**)(void, void *, void))v4)[2](v4, v7, 0);
  }
  return 0;
}

- (HMDBackingStoreCacheFetchZonesOperation)initWithFetchResult:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDBackingStoreCacheFetchZonesOperation;
  v5 = [(HMDBackingStoreOperation *)&v10 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id fetchResult = v5->_fetchResult;
    v5->_id fetchResult = v6;

    v8 = v5;
  }

  return v5;
}

@end