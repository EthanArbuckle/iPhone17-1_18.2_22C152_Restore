@interface _FEFocusMapSearchInfo
- (BOOL)didFindFocusBlockingBoundary;
- (BOOL)hasOnlyStaticContent;
- (NSArray)destinationRegions;
- (NSArray)linearSortedFocusItems;
- (NSArray)snapshots;
- (NSMutableArray)mutableDestinationRegions;
- (NSMutableArray)mutableSnapshots;
- (_FEFocusGroupMap)focusGroupMap;
- (_FEFocusMapSearchInfo)init;
- (_FEFocusSearchInfo)searchInfo;
- (void)addDestinationRegion:(id)a3;
- (void)addSnapshot:(id)a3;
- (void)setDidFindFocusBlockingBoundary:(BOOL)a3;
- (void)setFocusGroupMap:(id)a3;
- (void)setLinearSortedFocusItems:(id)a3;
- (void)setMutableDestinationRegions:(id)a3;
- (void)setMutableSnapshots:(id)a3;
- (void)setSearchInfo:(id)a3;
@end

@implementation _FEFocusMapSearchInfo

- (_FEFocusMapSearchInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)_FEFocusMapSearchInfo;
  v2 = [(_FEFocusMapSearchInfo *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mutableSnapshots = v2->_mutableSnapshots;
    v2->_mutableSnapshots = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mutableDestinationRegions = v2->_mutableDestinationRegions;
    v2->_mutableDestinationRegions = v5;

    v2->_hasOnlyStaticContent = 1;
  }
  return v2;
}

- (NSArray)snapshots
{
  v2 = [(_FEFocusMapSearchInfo *)self mutableSnapshots];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSArray)destinationRegions
{
  v2 = [(_FEFocusMapSearchInfo *)self mutableDestinationRegions];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)addSnapshot:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    v4 = [(_FEFocusMapSearchInfo *)self mutableSnapshots];
    [v4 addObject:v7];

    if (self->_hasOnlyStaticContent)
    {
      char v5 = [v7 hasOnlyStaticContent];
      if (self->_hasOnlyStaticContent) {
        BOOL v6 = v5;
      }
      else {
        BOOL v6 = 0;
      }
      self->_hasOnlyStaticContent = v6;
    }
  }
}

- (void)addDestinationRegion:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(_FEFocusMapSearchInfo *)self mutableDestinationRegions];
    [v5 addObject:v4];
  }
}

- (BOOL)didFindFocusBlockingBoundary
{
  return self->_didFindFocusBlockingBoundary;
}

- (void)setDidFindFocusBlockingBoundary:(BOOL)a3
{
  self->_didFindFocusBlockingBoundary = a3;
}

- (NSArray)linearSortedFocusItems
{
  return self->_linearSortedFocusItems;
}

- (void)setLinearSortedFocusItems:(id)a3
{
}

- (_FEFocusGroupMap)focusGroupMap
{
  return self->_focusGroupMap;
}

- (void)setFocusGroupMap:(id)a3
{
}

- (BOOL)hasOnlyStaticContent
{
  return self->_hasOnlyStaticContent;
}

- (NSMutableArray)mutableSnapshots
{
  return self->_mutableSnapshots;
}

- (void)setMutableSnapshots:(id)a3
{
}

- (NSMutableArray)mutableDestinationRegions
{
  return self->_mutableDestinationRegions;
}

- (void)setMutableDestinationRegions:(id)a3
{
}

- (_FEFocusSearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (void)setSearchInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_storeStrong((id *)&self->_mutableDestinationRegions, 0);
  objc_storeStrong((id *)&self->_mutableSnapshots, 0);
  objc_storeStrong((id *)&self->_focusGroupMap, 0);
  objc_storeStrong((id *)&self->_linearSortedFocusItems, 0);
}

@end