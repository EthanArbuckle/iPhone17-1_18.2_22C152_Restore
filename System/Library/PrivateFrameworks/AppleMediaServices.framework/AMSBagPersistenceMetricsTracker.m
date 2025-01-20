@interface AMSBagPersistenceMetricsTracker
+ (id)trackerForCachedValuesCallWithRequestedValueCount:(int64_t)a3 cachedValueCount:(int64_t)a4 cachedBagWasExpired:(BOOL)a5;
+ (void)trackCachedValuesUnavailableWithRequestedValueCount:(int64_t)a3;
- (AMSBagPersistenceMetricsTracker)init;
@end

@implementation AMSBagPersistenceMetricsTracker

- (void).cxx_destruct
{
}

+ (id)trackerForCachedValuesCallWithRequestedValueCount:(int64_t)a3 cachedValueCount:(int64_t)a4 cachedBagWasExpired:(BOOL)a5
{
  swift_getObjCClassMetadata();
  id v8 = static BagPersistenceMetricsTracker.trackerForCachedValuesCall(requestedValueCount:cachedValueCount:cachedBagWasExpired:)(a3, a4, a5);
  return v8;
}

- (AMSBagPersistenceMetricsTracker)init
{
}

+ (void)trackCachedValuesUnavailableWithRequestedValueCount:(int64_t)a3
{
}

@end