@interface PKLocalStrokeTracker
+ (id)sharedInstance;
- (BOOL)isRecentlyCreatedLocalStroke:(uint64_t)a1;
- (PKLocalStrokeTracker)init;
- (void)addStroke:(uint64_t)a1;
@end

@implementation PKLocalStrokeTracker

+ (id)sharedInstance
{
  self;
  if (qword_1EB3C5DE0 != -1) {
    dispatch_once(&qword_1EB3C5DE0, &__block_literal_global_0);
  }
  v0 = (void *)_MergedGlobals_113;

  return v0;
}

void __38__PKLocalStrokeTracker_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PKLocalStrokeTracker);
  v1 = (void *)_MergedGlobals_113;
  _MergedGlobals_113 = (uint64_t)v0;
}

- (PKLocalStrokeTracker)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKLocalStrokeTracker;
  v2 = [(PKLocalStrokeTracker *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(PKLRUCache);
    lruCache = v2->_lruCache;
    v2->_lruCache = v3;

    v5 = v2->_lruCache;
    if (v5) {
      v5->_totalCostLimit = 50;
    }
  }
  return v2;
}

- (void)addStroke:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 8);
    id v3 = [a2 _strokeUUID];
    -[PKLRUCache setObject:forKey:cost:](v2, MEMORY[0x1E4F1CC38], v3, 1uLL);
  }
}

- (BOOL)isRecentlyCreatedLocalStroke:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 8);
  id v3 = [a2 _strokeUUID];
  v4 = -[PKLRUCache checkObjectForKey:](v2, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (void).cxx_destruct
{
}

@end