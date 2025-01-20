@interface BCSBusinessItemMemoryCache
+ (id)sharedCache;
- (id)itemMatching:(id)a3;
- (id)lastFetchedBusinessItemIconDataForBizItem:(id *)a1;
- (void)deleteCache;
- (void)deleteItemMatching:(id)a3;
- (void)deleteItemsOfType:(int64_t)a3;
- (void)setLastFetchedBusinesIconData:(void *)a3 withMatchingBusinessItem:;
- (void)setLastFetchedBusinessItem:(uint64_t)a1;
- (void)updateItem:(id)a3 withItemIdentifier:(id)a4;
@end

@implementation BCSBusinessItemMemoryCache

+ (id)sharedCache
{
  self;
  v0 = (void *)_MergedGlobals_36;
  if (!_MergedGlobals_36)
  {
    if (qword_26ACEFCC0 != -1) {
      dispatch_once(&qword_26ACEFCC0, &__block_literal_global_3);
    }
    v0 = (void *)_MergedGlobals_36;
  }

  return v0;
}

uint64_t __41__BCSBusinessItemMemoryCache_sharedCache__block_invoke()
{
  _MergedGlobals_36 = objc_alloc_init(BCSBusinessItemMemoryCache);

  return MEMORY[0x270F9A758]();
}

- (id)lastFetchedBusinessItemIconDataForBizItem:(id *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = [v3 bizID];
    v6 = [a1[2] bizID];
    int v7 = [v5 isEqualToString:v6];

    if (v7) {
      a1 = (id *)a1[3];
    }
    else {
      a1 = 0;
    }
  }

  return a1;
}

- (void)setLastFetchedBusinesIconData:(void *)a3 withMatchingBusinessItem:
{
  id v7 = a2;
  id v6 = a3;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 16), a3);
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)deleteCache
{
  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    id v3 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
}

- (void)setLastFetchedBusinessItem:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (id)itemMatching:(id)a3
{
  if (self)
  {
    if ([a3 matchesItemIdentifying:self->_lastFetchedBusinessItem])
    {
      lastFetchedBusinessItem = self->_lastFetchedBusinessItem;
LABEL_4:
      v5 = lastFetchedBusinessItem;
      goto LABEL_6;
    }
    v5 = 0;
  }
  else
  {
    char v7 = [a3 matchesItemIdentifying:0];
    lastFetchedBusinessItem = 0;
    v5 = 0;
    if (v7) {
      goto LABEL_4;
    }
  }
LABEL_6:

  return v5;
}

- (void)updateItem:(id)a3 withItemIdentifier:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[BCSBusinessItemMemoryCache setLastFetchedBusinessItem:]((uint64_t)self, v5);
  }
}

- (void)deleteItemMatching:(id)a3
{
  id v3 = self;
  if (self) {
    self = (BCSBusinessItemMemoryCache *)self->_lastFetchedBusinessItem;
  }
  if ([(BCSBusinessItemMemoryCache *)self matchesItemIdentifying:a3])
  {
    -[BCSBusinessItemMemoryCache setLastFetchedBusinessItem:]((uint64_t)v3, 0);
  }
}

- (void)deleteItemsOfType:(int64_t)a3
{
  if (a3 == 1) {
    -[BCSBusinessItemMemoryCache deleteCache]((uint64_t)self);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFetchedBusinessItemIconData, 0);
  objc_storeStrong((id *)&self->_bizItemForLastFetchedIcon, 0);

  objc_storeStrong((id *)&self->_lastFetchedBusinessItem, 0);
}

@end