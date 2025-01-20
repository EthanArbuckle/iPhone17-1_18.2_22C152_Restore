@interface _FEFocusMapSnapshot
- (BOOL)hasOnlyStaticContent;
- (CGRect)snapshotFrameForRegion:(id)a3;
- (NSArray)originalRegions;
- (NSArray)regions;
- (_FECoordinateSpace)coordinateSpace;
- (_FEFocusMapRect)_searchArea;
- (_FEFocusMapRect)mapArea;
- (_FEFocusMapSnapshot)init;
- (_FEFocusMapSnapshotDebugInfo)_debugInfo;
- (_FEFocusMovementInfo)movementInfo;
- (_FEFocusRegion)focusedRegion;
- (_FEFocusRegionContainer)regionsContainer;
- (_FEFocusRegionContainer)rootContainer;
- (_FEFocusSearchInfo)searchInfo;
- (_FEFocusSystem)focusSystem;
- (id)_cachedNextFocusedItemForRegion:(id)a3 withFocusMovementRequest:(id)a4 inMap:(id)a5;
- (id)_debugInfoWithFocusMapSearchInfo:(id)a3;
- (id)_initWithSnapshotter:(id)a3 mapArea:(id)a4 searchArea:(id)a5;
- (id)debugQuickLookObject;
- (id)occludingRegionsForRegion:(id)a3;
- (id)originalRegionForRegion:(id)a3;
- (id)regionsForOriginalRegion:(id)a3;
- (void)_capture;
- (void)_trackOccludingRegion:(id)a3 forRegion:(id)a4;
- (void)_trackSubregion:(id)a3 forRegion:(id)a4;
- (void)addRegion:(id)a3;
- (void)addRegions:(id)a3;
- (void)addRegionsInContainer:(id)a3;
- (void)addRegionsInContainers:(id)a3;
- (void)consumeRegionInformationForRegions:(id)a3 fromSnapshot:(id)a4;
- (void)dealloc;
- (void)markContainerAsProvidingDynamicContent;
- (void)setMovementInfo:(id)a3;
- (void)setSearchInfo:(id)a3;
@end

@implementation _FEFocusMapSnapshot

- (_FEFocusMapSnapshot)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_FEFocusMapSnapshot.m" lineNumber:148 description:@"-init is not a valid initializer for this class."];

  return 0;
}

- (id)_initWithSnapshotter:(id)a3 mapArea:(id)a4 searchArea:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_16:
    v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"_FEFocusMapSnapshot.m", 155, @"Invalid parameter not satisfying: %@", @"mapArea" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_17;
  }
  v29 = [MEMORY[0x263F08690] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"_FEFocusMapSnapshot.m", 154, @"Invalid parameter not satisfying: %@", @"snapshotter" object file lineNumber description];

  if (!v10) {
    goto LABEL_16;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_17:
  v31 = [MEMORY[0x263F08690] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"_FEFocusMapSnapshot.m", 156, @"Invalid parameter not satisfying: %@", @"searchArea" object file lineNumber description];

LABEL_4:
  v12 = [v10 coordinateSpace];
  v13 = [v11 coordinateSpace];

  if (v12 != v13)
  {
    v32 = [MEMORY[0x263F08690] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"_FEFocusMapSnapshot.m" lineNumber:157 description:@"The focus map snapshot's map area and search area must be expressed in the same coordinate space."];
  }
  v33.receiver = self;
  v33.super_class = (Class)_FEFocusMapSnapshot;
  v14 = [(_FEFocusMapSnapshot *)&v33 init];
  if (v14)
  {
    v15 = [v9 focusSystem];
    objc_storeWeak((id *)&v14->_focusSystem, v15);

    v16 = [v9 rootContainer];
    objc_storeWeak((id *)&v14->_rootContainer, v16);

    uint64_t v17 = [v9 focusedRegion];
    focusedRegion = v14->_focusedRegion;
    v14->_focusedRegion = (_FEFocusRegion *)v17;

    v19 = [v9 regionsContainer];
    objc_storeWeak((id *)&v14->_regionsContainer, v19);

    if ([v9 clipToSnapshotRect]) {
      char v20 = 4;
    }
    else {
      char v20 = 0;
    }
    *(unsigned char *)&v14->_flags = *(unsigned char *)&v14->_flags & 0xFB | v20;
    if ([v9 ignoresRootContainerClippingRect]) {
      char v21 = 8;
    }
    else {
      char v21 = 0;
    }
    *(unsigned char *)&v14->_flags = *(unsigned char *)&v14->_flags & 0xF7 | v21;
    uint64_t v22 = [v9 searchInfo];
    searchInfo = v14->_searchInfo;
    v14->_searchInfo = (_FEFocusSearchInfo *)v22;

    uint64_t v24 = [v9 movementInfo];
    movementInfo = v14->_movementInfo;
    v14->_movementInfo = (_FEFocusMovementInfo *)v24;

    objc_storeStrong((id *)&v14->_mapArea, a4);
    objc_storeStrong((id *)&v14->_searchArea, a5);
    uint64_t v26 = [MEMORY[0x263EFF9C0] set];
    visitedRegionContainers = v14->_visitedRegionContainers;
    v14->_visitedRegionContainers = (NSMutableSet *)v26;

    [(_FEFocusMapSnapshot *)v14 _capture];
  }

  return v14;
}

- (void)dealloc
{
  subregionToRegionMap = self->_subregionToRegionMap;
  if (subregionToRegionMap)
  {
    CFRelease(subregionToRegionMap);
    self->_subregionToRegionMap = 0;
  }
  regionToOccludingRegionsMap = self->_regionToOccludingRegionsMap;
  if (regionToOccludingRegionsMap)
  {
    CFRelease(regionToOccludingRegionsMap);
    self->_regionToOccludingRegionsMap = 0;
  }
  regionToFocusItemCache = self->_regionToFocusItemCache;
  if (regionToFocusItemCache)
  {
    CFRelease(regionToFocusItemCache);
    self->_regionToFocusItemCache = 0;
  }
  regionFrameCache = self->_regionFrameCache;
  if (regionFrameCache)
  {
    CFRelease(regionFrameCache);
    self->_regionFrameCache = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)_FEFocusMapSnapshot;
  [(_FEFocusMapSnapshot *)&v7 dealloc];
}

- (NSArray)regions
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_flags)
  {
    regions = self->_regions;
    if (!regions)
    {
      mutableUnoccludedRegions = self->_mutableUnoccludedRegions;
      filteredOriginalRegions = self->_filteredOriginalRegions;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_regionsContainer);
      v8 = filteredOriginalRegions;
      id v9 = self;
      id v10 = +[_FEFocusRegionEvaluator regionsByEvaluatingOcclusionsForRegions:mutableUnoccludedRegions inSnapshot:v9];
      id v11 = v10;
      if (WeakRetained)
      {
        id v23 = WeakRetained;
        v12 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v22 = v11;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              v19 = -[_FEFocusMapSnapshot originalRegionForRegion:](v9, "originalRegionForRegion:", v18, v22);
              if ([(NSHashTable *)v8 containsObject:v19]) {
                [(NSArray *)v12 addObject:v18];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v15);
        }

        id v11 = v22;
        id WeakRetained = v23;
      }
      else
      {
        v12 = v10;
      }

      char v20 = self->_regions;
      self->_regions = v12;

      regions = self->_regions;
    }
    v2 = regions;
  }
  else
  {
    v2 = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v2;
}

- (NSArray)originalRegions
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_flags)
  {
    v4 = [(_FEFocusMapSnapshot *)self regionsContainer];

    if (v4)
    {
      v2 = [(NSHashTable *)self->_filteredOriginalRegions allObjects];
    }
    else
    {
      v5 = [MEMORY[0x263F088B0] hashTableWithOptions:512];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      v6 = self->_mutableUnoccludedRegions;
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = -[_FEFocusMapSnapshot originalRegionForRegion:](self, "originalRegionForRegion:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
            [v5 addObject:v11];
          }
          uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v8);
      }

      v2 = [v5 allObjects];
    }
  }
  else
  {
    v2 = (void *)MEMORY[0x263EFFA68];
  }
  return (NSArray *)v2;
}

- (id)regionsForOriginalRegion:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    long long v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_FEFocusMapSnapshot.m", 253, @"Invalid parameter not satisfying: %@", @"originalRegion" object file lineNumber description];
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [(_FEFocusMapSnapshot *)self regions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [(_FEFocusMapSnapshot *)self originalRegionForRegion:v12];

        if (v13 == v5) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  long long v14 = (void *)[v6 copy];
  return v14;
}

- (void)_trackSubregion:(id)a3 forRegion:(id)a4
{
  id key = a3;
  id v7 = a4;
  uint64_t v8 = key;
  uint64_t v9 = v7;
  if (key)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_FEFocusMapSnapshot.m", 271, @"Invalid parameter not satisfying: %@", @"subregion" object file lineNumber description];

    uint64_t v8 = 0;
    if (v9) {
      goto LABEL_3;
    }
  }
  id v11 = [MEMORY[0x263F08690] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"_FEFocusMapSnapshot.m", 272, @"Invalid parameter not satisfying: %@", @"originalRegion" object file lineNumber description];

  uint64_t v8 = key;
LABEL_3:
  if (v8 == v9)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_FEFocusMapSnapshot.m", 273, @"Invalid parameter not satisfying: %@", @"subregion != originalRegion" object file lineNumber description];

    uint64_t v8 = key;
  }
  CFDictionarySetValue(self->_subregionToRegionMap, v8, v9);
}

- (id)originalRegionForRegion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_FEFocusMapSnapshot.m", 280, @"Invalid parameter not satisfying: %@", @"region" object file lineNumber description];
  }
  id v6 = v5;
  id v7 = CFDictionaryGetValue(self->_subregionToRegionMap, v6);
  id v8 = v6;
  if (v7)
  {
    uint64_t v9 = v6;
    do
    {
      id v8 = v7;

      id v7 = CFDictionaryGetValue(self->_subregionToRegionMap, v8);

      uint64_t v9 = v8;
    }
    while (v7);
  }

  return v8;
}

- (void)_trackOccludingRegion:(id)a3 forRegion:(id)a4
{
  id v9 = a3;
  id v6 = [(_FEFocusMapSnapshot *)self originalRegionForRegion:a4];
  id v7 = CFDictionaryGetValue(self->_regionToOccludingRegionsMap, v6);
  if (v7)
  {
    id v8 = v7;
    [v7 addObject:v9];
  }
  else
  {
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v9, 0);
    CFDictionarySetValue(self->_regionToOccludingRegionsMap, v6, v8);
  }
}

- (id)occludingRegionsForRegion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_FEFocusMapSnapshot.m", 306, @"Invalid parameter not satisfying: %@", @"region" object file lineNumber description];
  }
  id v6 = [(_FEFocusMapSnapshot *)self originalRegionForRegion:v5];
  id v7 = CFDictionaryGetValue(self->_regionToOccludingRegionsMap, v6);
  id v8 = v7;
  if (v7) {
    id v9 = (void *)[v7 copy];
  }
  else {
    id v9 = (void *)MEMORY[0x263EFFA68];
  }

  return v9;
}

- (void)consumeRegionInformationForRegions:(id)a3 fromSnapshot:(id)a4
{
  id v16 = a3;
  id v7 = (CFDictionaryRef *)a4;
  id v8 = [(CFDictionaryRef *)v7 coordinateSpace];
  id v9 = [(_FEFocusMapSnapshot *)self coordinateSpace];

  if (v8 != v9)
  {
    long long v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"_FEFocusMapSnapshot.m" lineNumber:316 description:@"Unable to consume regions from a snapshot with a different coordinate system."];
  }
  uint64_t v10 = (void *)[v16 mutableCopy];
  if ([v10 count])
  {
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = [v10 objectAtIndexedSubscript:v11];
      id v13 = CFDictionaryGetValue(v7[3], v12);
      if (v13)
      {
        CFDictionarySetValue(self->_subregionToRegionMap, v12, v13);
        [v10 addObject:v13];
      }
      long long v14 = CFDictionaryGetValue(v7[4], v12);
      if (v14) {
        CFDictionarySetValue(self->_regionToOccludingRegionsMap, v12, v14);
      }

      ++v11;
    }
    while (v11 < [v10 count]);
  }
}

- (id)_cachedNextFocusedItemForRegion:(id)a3 withFocusMovementRequest:(id)a4 inMap:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%p_%p_%p", v8, v9, v10);
  uint64_t v12 = CFDictionaryGetValue(self->_regionToFocusItemCache, v11);
  if (!v12)
  {
    id v13 = [v8 _nextFocusedItemForFocusMovementRequest:v9 inMap:v10 withSnapshot:self];
    long long v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [MEMORY[0x263EFF9D0] null];
    }
    uint64_t v12 = v15;

    CFDictionarySetValue(self->_regionToFocusItemCache, v11, v12);
  }
  id v16 = [MEMORY[0x263EFF9D0] null];
  if (v12 == v16) {
    long long v17 = 0;
  }
  else {
    long long v17 = v12;
  }
  id v18 = v17;

  return v18;
}

- (CGRect)snapshotFrameForRegion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"_FEFocusMapSnapshot.m", 350, @"Invalid parameter not satisfying: %@", @"region" object file lineNumber description];
  }
  Value = (double *)CFDictionaryGetValue(self->_regionFrameCache, v5);
  if (Value)
  {
    double v7 = *Value;
    double v8 = Value[1];
    double v9 = Value[2];
    double v10 = Value[3];
  }
  else
  {
    unint64_t v11 = [(_FEFocusMapSnapshot *)self coordinateSpace];
    +[_FEFocusRegionEvaluator frameForRegion:v5 inCoordinateSpace:v11];
    double v7 = v12;
    double v8 = v13;
    double v9 = v14;
    double v10 = v15;

    id v16 = (double *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
    double *v16 = v7;
    v16[1] = v8;
    v16[2] = v9;
    v16[3] = v10;
    CFDictionarySetValue(self->_regionFrameCache, v5, v16);
  }

  double v17 = v7;
  double v18 = v8;
  double v19 = v9;
  double v20 = v10;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)markContainerAsProvidingDynamicContent
{
  uncachableEnvironments = self->_uncachableEnvironments;
  id v4 = [(NSMutableArray *)self->_stateStack lastObject];
  v3 = [v4 regionContainer];
  [(NSHashTable *)uncachableEnvironments addObject:v3];
}

- (BOOL)hasOnlyStaticContent
{
  return [(NSHashTable *)self->_uncachableEnvironments count] == 0;
}

- (void)_capture
{
  *(unsigned char *)&self->_flags &= ~1u;
  regions = self->_regions;
  self->_regions = 0;

  id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  mutableUnoccludedRegions = self->_mutableUnoccludedRegions;
  self->_mutableUnoccludedRegions = v5;

  double v7 = [MEMORY[0x263F088B0] hashTableWithOptions:512];
  filteredOriginalRegions = self->_filteredOriginalRegions;
  self->_filteredOriginalRegions = v7;

  if (*(_OWORD *)&self->_subregionToRegionMap != 0 || self->_regionToFocusItemCache || self->_regionFrameCache)
  {
    double v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"_FEFocusMapSnapshot.m", 392, @"Invalid parameter not satisfying: %@", @"_subregionToRegionMap == NULL && _regionToOccludingRegionsMap == NULL && _regionToFocusItemCache == NULL && _regionFrameCache == NULL" object file lineNumber description];
  }
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  self->_subregionToRegionMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &pointerKeyCallbacks, &pointerValueCallbacks);
  self->_regionToOccludingRegionsMap = CFDictionaryCreateMutable(v9, 0, &pointerKeyCallbacks, &equalValueCallbacks);
  self->_regionToFocusItemCache = CFDictionaryCreateMutable(v9, 0, &equalKeyCallbacks, &pointerValueCallbacks);
  self->_regionFrameCache = CFDictionaryCreateMutable(v9, 0, &pointerKeyCallbacks, &rectValueCallbacks);
  double v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  stateStack = self->_stateStack;
  self->_stateStack = v10;

  double v12 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
  eligibleEnvironments = self->_eligibleEnvironments;
  self->_eligibleEnvironments = v12;

  double v14 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
  ineligibleEnvironments = self->_ineligibleEnvironments;
  self->_ineligibleEnvironments = v14;

  id v16 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
  uncachableEnvironments = self->_uncachableEnvironments;
  self->_uncachableEnvironments = v16;

  *(unsigned char *)&self->_flags &= ~2u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootContainer);
  [(_FEFocusMapSnapshot *)self addRegionsInContainer:WeakRetained];

  *(unsigned char *)&self->_flags |= 1u;
}

- (_FECoordinateSpace)coordinateSpace
{
  v2 = [(_FEFocusMapSnapshot *)self _searchArea];
  v3 = [v2 coordinateSpace];

  return (_FECoordinateSpace *)v3;
}

- (void)addRegion:(id)a3
{
  id v38 = a3;
  if (!v38)
  {
    v37 = [MEMORY[0x263F08690] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"_FEFocusMapSnapshot.m", 424, @"Invalid parameter not satisfying: %@", @"region" object file lineNumber description];
  }
  id v5 = [(NSMutableArray *)self->_stateStack lastObject];
  id v6 = [v5 regionContainerFocusSystem];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  if (v6 == WeakRetained)
  {
    double v8 = [(_FEFocusMapSnapshot *)self mapArea];
    [(_FEFocusMapSnapshot *)self snapshotFrameForRegion:v38];
    CGFloat x = v41.origin.x;
    CGFloat y = v41.origin.y;
    CGFloat width = v41.size.width;
    CGFloat height = v41.size.height;
    if (fabs(CGRectGetWidth(v41)) < 0.0001) {
      goto LABEL_31;
    }
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    if (fabs(CGRectGetHeight(v42)) < 0.0001) {
      goto LABEL_31;
    }
    id v13 = v38;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
      if (![v8 intersectsRegion:v38 inSnapshot:self])
      {
LABEL_31:

        goto LABEL_32;
      }
      if ((*(unsigned char *)&self->_flags & 4) != 0 && [v38 _shouldCropRegionToSearchArea])
      {
        id regions = [v8 intersectionWithRegion:v38 inSnapshot:self];
        double v15 = v38;
        if (regions != v38)
        {
          if (regions)
          {
            [(_FEFocusMapSnapshot *)self snapshotFrameForRegion:regions];
            double v15 = v38;
            CGFloat x = v16;
            CGFloat y = v17;
            CGFloat width = v18;
            CGFloat height = v19;
          }
          else
          {
            CGFloat x = *MEMORY[0x263F001A0];
            CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
            CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
            CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
          }
        }
      }
      else
      {
        id regions = v38;
      }
    }
    else
    {
      id regions = v38;
    }
    if (regions)
    {
      if (objc_msgSend(regions, "_isUnclippable", v13)) {
        goto LABEL_22;
      }
      double v20 = [v6 behavior];
      int v21 = [v20 supportsClipToBounds];

      if (!v21) {
        goto LABEL_22;
      }
      uint64_t v22 = [(NSMutableArray *)self->_stateStack lastObject];
      [v22 clippingRect];
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;

      v43.origin.CGFloat x = v24;
      v43.origin.CGFloat y = v26;
      v43.size.CGFloat width = v28;
      v43.size.CGFloat height = v30;
      if (CGRectIsNull(v43)) {
        goto LABEL_22;
      }
      v44.origin.CGFloat x = x;
      v44.origin.CGFloat y = y;
      v44.size.CGFloat width = width;
      v44.size.CGFloat height = height;
      v47.origin.CGFloat x = v24;
      v47.origin.CGFloat y = v26;
      v47.size.CGFloat width = v28;
      v47.size.CGFloat height = v30;
      CGRect v45 = CGRectIntersection(v44, v47);
      double v31 = v45.origin.x;
      double v32 = v45.origin.y;
      double v33 = v45.size.width;
      double v34 = v45.size.height;
      v48.origin.CGFloat x = x;
      v48.origin.CGFloat y = y;
      v48.size.CGFloat width = width;
      v48.size.CGFloat height = height;
      if (CGRectEqualToRect(v45, v48))
      {
LABEL_22:
        id v35 = regions;
        goto LABEL_23;
      }
      v46.origin.CGFloat x = v31;
      v46.origin.CGFloat y = v32;
      v46.size.CGFloat width = v33;
      v46.size.CGFloat height = v34;
      if (CGRectIsEmpty(v46))
      {
        id v38 = 0;
LABEL_26:

        goto LABEL_31;
      }
      +[_FEFocusRegionEvaluator subregionFromRegion:withSnapshotFrame:inSnapshot:](_FEFocusRegionEvaluator, "subregionFromRegion:withSnapshotFrame:inSnapshot:", regions, self, v31, v32, v33, v34);
      id v39 = (id)objc_claimAutoreleasedReturnValue();

      id v35 = v39;
      if (v39)
      {
LABEL_23:
        id v38 = v35;
        -[NSMutableArray addObject:](self->_mutableUnoccludedRegions, "addObject:");
        if ((*(unsigned char *)&self->_flags & 2) != 0)
        {
          v36 = [(_FEFocusMapSnapshot *)self originalRegionForRegion:v38];
          [(NSHashTable *)self->_filteredOriginalRegions addObject:v36];
        }
        id regions = self->_regions;
        self->_id regions = 0;
        goto LABEL_26;
      }
    }
    id v38 = 0;
    goto LABEL_31;
  }
LABEL_32:
}

- (void)addRegions:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    unint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_FEFocusMapSnapshot.m", 475, @"Invalid parameter not satisfying: %@", @"regions" object file lineNumber description];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [(_FEFocusMapSnapshot *)self addRegion:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)addRegionsInContainer:(id)a3
{
  uint64_t v158 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v113 = [MEMORY[0x263F08690] currentHandler];
    [v113 handleFailureInMethod:a2, self, @"_FEFocusMapSnapshot.m", 483, @"Invalid parameter not satisfying: %@", @"container" object file lineNumber description];
  }
  uint64_t v6 = [(NSMutableSet *)self->_visitedRegionContainers count];
  [(NSMutableSet *)self->_visitedRegionContainers addObject:v5];
  v130 = v5;
  if (v6 == [(NSMutableSet *)self->_visitedRegionContainers count])
  {
    uint64_t v7 = logger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      uint64_t v8 = [v5 debugDescription];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v8;
      _os_log_fault_impl(&dword_24F3F0000, v7, OS_LOG_TYPE_FAULT, "Ignoring attempt to add focus items in already-visited container. This can potentially cause infinite recursion.\nContainer: %@", buf, 0xCu);
    }
    goto LABEL_74;
  }
  SEL v128 = a2;
  eligibleEnvironments = self->_eligibleEnvironments;
  ineligibleEnvironments = self->_ineligibleEnvironments;
  stateStack = self->_stateStack;
  id v12 = v5;
  long long v13 = eligibleEnvironments;
  long long v14 = ineligibleEnvironments;
  long long v15 = stateStack;
  if (v5)
  {
    if (v13) {
      goto LABEL_8;
    }
LABEL_76:
    v116 = [MEMORY[0x263F08690] currentHandler];
    v117 = objc_msgSend(NSString, "stringWithUTF8String:", "_FEFocusSystem *__UIFocusMapRecurseSearchForFocusSystemInEligibleContainer(__strong id<_FEFocusRegionContainer>, NSHashTable<id<_FEFocusEnvironment>> *__strong, NSHashTable<id<_FEFocusEnvironment>> *__strong, NSArray<_FEFocusRegionSearchContextState *> *__strong)");
    [v116 handleFailureInFunction:v117, @"_FEFocusMapSnapshot.m", 34, @"Invalid parameter not satisfying: %@", @"eligibleEnvironments" file lineNumber description];

    if (v14) {
      goto LABEL_9;
    }
    goto LABEL_77;
  }
  v114 = [MEMORY[0x263F08690] currentHandler];
  v115 = objc_msgSend(NSString, "stringWithUTF8String:", "_FEFocusSystem *__UIFocusMapRecurseSearchForFocusSystemInEligibleContainer(__strong id<_FEFocusRegionContainer>, NSHashTable<id<_FEFocusEnvironment>> *__strong, NSHashTable<id<_FEFocusEnvironment>> *__strong, NSArray<_FEFocusRegionSearchContextState *> *__strong)");
  [v114 handleFailureInFunction:v115, @"_FEFocusMapSnapshot.m", 33, @"Invalid parameter not satisfying: %@", @"container" file lineNumber description];

  if (!v13) {
    goto LABEL_76;
  }
LABEL_8:
  if (v14) {
    goto LABEL_9;
  }
LABEL_77:
  v118 = [MEMORY[0x263F08690] currentHandler];
  v119 = objc_msgSend(NSString, "stringWithUTF8String:", "_FEFocusSystem *__UIFocusMapRecurseSearchForFocusSystemInEligibleContainer(__strong id<_FEFocusRegionContainer>, NSHashTable<id<_FEFocusEnvironment>> *__strong, NSHashTable<id<_FEFocusEnvironment>> *__strong, NSArray<_FEFocusRegionSearchContextState *> *__strong)");
  [v118 handleFailureInFunction:v119, @"_FEFocusMapSnapshot.m", 35, @"Invalid parameter not satisfying: %@", @"ineligibleEnvironments" file lineNumber description];

LABEL_9:
  uint64_t v143 = 0;
  v144 = &v143;
  uint64_t v145 = 0x2020000000;
  char IsEligibleForFocusOcclusion = 0;
  char IsEligibleForFocusOcclusion = _FEFocusEnvironmentIsEligibleForFocusOcclusion(v12, 0);
  if (*((unsigned char *)v144 + 24)) {
    double v16 = v13;
  }
  else {
    double v16 = v14;
  }
  [(NSHashTable *)v16 addObject:v12];
  if (*((unsigned char *)v144 + 24))
  {
    uint64_t v17 = [(NSMutableArray *)v15 lastObject];
    double v18 = [v17 regionContainer];

    if (objc_msgSend(v18, "_ui_isUIFocusRegionContainerProxy"))
    {
      uint64_t v19 = [v18 owningEnvironment];

      double v20 = v12;
      double v18 = (void *)v19;
    }
    else
    {
      double v20 = v12;
    }
    uint64_t v137 = 0;
    v138 = &v137;
    uint64_t v139 = 0x3032000000;
    v140 = __Block_byref_object_copy__1;
    v141 = __Block_byref_object_dispose__1;
    id v142 = 0;
    uint64_t v133 = 0;
    v134 = &v133;
    uint64_t v135 = 0x2020000000;
    char v136 = 0;
    v131[0] = 0;
    v131[1] = v131;
    v131[2] = 0x2020000000;
    char v132 = 1;
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    v148 = ____UIFocusMapRecurseSearchForFocusSystemInEligibleContainer_block_invoke;
    v149 = &unk_2653284C8;
    v154 = &v137;
    id v21 = v20;
    id v150 = v21;
    id v22 = v18;
    id v151 = v22;
    v155 = &v133;
    v156 = v131;
    v152 = v13;
    v153 = v14;
    v157 = &v143;
    _FEFocusEnvironmentEnumerateAncestorEnvironments(v21, buf);
    if (*((unsigned char *)v144 + 24))
    {
      if (*((unsigned char *)v134 + 24))
      {
        double v23 = [(NSMutableArray *)v15 lastObject];
        uint64_t v7 = [v23 regionContainerFocusSystem];
      }
      else
      {
        uint64_t v7 = +[_FEFocusSystem focusSystemForEnvironment:v138[5]];
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    id v12 = v20;

    _Block_object_dispose(v131, 8);
    _Block_object_dispose(&v133, 8);
    _Block_object_dispose(&v137, 8);
  }
  else
  {
    uint64_t v7 = 0;
  }
  _Block_object_dispose(&v143, 8);

  if (!v7) {
    goto LABEL_74;
  }
  CGFloat v24 = [(_FEFocusMapSnapshot *)self regionsContainer];
  int v129 = [v12 isEqual:v24];
  if (v129 && (*(unsigned char *)&self->_flags & 2) == 0) {
    *(unsigned char *)&self->_flags |= 2u;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootContainer);
  if (([v12 isEqual:WeakRetained] & 1) == 0)
  {

    goto LABEL_31;
  }
  BOOL v26 = (*(unsigned char *)&self->_flags & 8) == 0;

  if (v26)
  {
LABEL_31:
    id v31 = objc_loadWeakRetained((id *)&self->_focusSystem);
    double v32 = self->_stateStack;
    double v33 = [(_FEFocusMapSnapshot *)self coordinateSpace];
    id v34 = v31;
    id v35 = v32;
    id v36 = v12;
    id v37 = v33;
    char v38 = objc_opt_respondsToSelector();
    double v27 = *MEMORY[0x263F001A0];
    double v28 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v29 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v30 = *(double *)(MEMORY[0x263F001A0] + 24);
    double height = v30;
    double width = v29;
    double y = v28;
    double x = *MEMORY[0x263F001A0];
    if (v38)
    {
      [v36 _clippingRectInCoordinateSpace:v37];
      double x = v43;
      double y = v44;
      double width = v45;
      double height = v46;
    }
    v159.origin.double x = x;
    v159.origin.double y = y;
    v159.size.double width = width;
    v159.size.double height = height;
    if (!CGRectIsNull(v159) || [(NSMutableArray *)v35 count])
    {
      CGRect v47 = [v36 _focusItemContainer];
      int IsScrollableContainer = _FEFocusItemContainerIsScrollableContainer(v47);
      *(_OWORD *)buf = *MEMORY[0x263F00148];
      if (IsScrollableContainer
        && [v34 _isScrollingScrollableContainer:v47 targetContentOffset:buf])
      {
        id v123 = v47;
        [v123 _focusContentOffset];
        double v50 = v49;
        double v52 = v51;
        [v123 _focusVisibleSize];
        double v54 = v53;
        double v56 = v55;
        v57 = [v123 _focusCoordinateSpace];
        objc_msgSend(v57, "convertRect:toCoordinateSpace:", v37, v50, v52, v54, v56);
        CGFloat v126 = v59;
        CGFloat v127 = v58;
        CGFloat v124 = v61;
        CGFloat v125 = v60;

        v160.origin.double x = x;
        v160.origin.double y = y;
        v160.size.double width = width;
        v160.size.double height = height;
        if (CGRectIsNull(v160))
        {
          double x = v127;
          double y = v126;
          double width = v125;
          double height = v124;
        }
        if ([(NSMutableArray *)v35 count])
        {
          v62 = [(NSMutableArray *)v35 lastObject];
          [v62 clippingRect];
          CGFloat v64 = v63;
          CGFloat v66 = v65;
          CGFloat v68 = v67;
          CGFloat v70 = v69;

          v161.origin.double x = v64;
          v161.origin.double y = v66;
          v161.size.double width = v68;
          v161.size.double height = v70;
          if (!CGRectIsNull(v161))
          {
            v162.origin.double x = x;
            v162.origin.double y = y;
            v162.size.double width = width;
            v162.size.double height = height;
            v181.origin.double x = v64;
            v181.origin.double y = v66;
            v181.size.double width = v68;
            v181.size.double height = v70;
            CGRect v163 = CGRectIntersection(v162, v181);
            double x = v163.origin.x;
            double y = v163.origin.y;
            double width = v163.size.width;
            double height = v163.size.height;
          }
        }
        v164.origin.double x = x;
        v164.origin.double y = y;
        v164.size.double width = width;
        v164.size.double height = height;
        double MinY = CGRectGetMinY(v164);
        v165.origin.double y = v126;
        v165.origin.double x = v127;
        v165.size.double height = v124;
        v165.size.double width = v125;
        double v121 = CGRectGetMinY(v165);
        v166.origin.double x = x;
        v166.origin.double y = y;
        v166.size.double width = width;
        v166.size.double height = height;
        double MinX = CGRectGetMinX(v166);
        v167.origin.double y = v126;
        v167.origin.double x = v127;
        v167.size.double height = v124;
        v167.size.double width = v125;
        double v71 = CGRectGetMinX(v167);
        v168.origin.double y = v126;
        v168.origin.double x = v127;
        v168.size.double height = v124;
        v168.size.double width = v125;
        double MaxY = CGRectGetMaxY(v168);
        v169.origin.double x = x;
        v169.origin.double y = y;
        v169.size.double width = width;
        v169.size.double height = height;
        double v73 = CGRectGetMaxY(v169);
        v170.origin.double y = v126;
        v170.origin.double x = v127;
        v170.size.double height = v124;
        v170.size.double width = v125;
        double MaxX = CGRectGetMaxX(v170);
        v171.origin.double x = x;
        v171.origin.double y = y;
        v171.size.double width = width;
        v171.size.double height = height;
        double v75 = MaxX - CGRectGetMaxX(v171);
        if (MinY - v121 >= 0.0) {
          double v76 = MinY - v121;
        }
        else {
          double v76 = 0.0;
        }
        if (MinX - v71 >= 0.0) {
          double v77 = MinX - v71;
        }
        else {
          double v77 = 0.0;
        }
        if (MaxY - v73 >= 0.0) {
          double v78 = MaxY - v73;
        }
        else {
          double v78 = 0.0;
        }
        if (v75 >= 0.0) {
          double v79 = v75;
        }
        else {
          double v79 = 0.0;
        }
        double v80 = *(double *)buf;
        double v81 = *(double *)&buf[8];
        [v123 _focusVisibleSize];
        double v83 = v82;
        double v85 = v84;
        v86 = [v123 _focusCoordinateSpace];
        objc_msgSend(v86, "convertRect:toCoordinateSpace:", v37, v80, v81, v83, v85);
        CGFloat v88 = v87;
        CGFloat v90 = v89;
        CGFloat v92 = v91;
        CGFloat v94 = v93;

        v172.origin.double y = v126;
        v172.origin.double x = v127;
        v172.size.double height = v124;
        v172.size.double width = v125;
        v182.origin.double x = v88;
        v182.origin.double y = v90;
        v182.size.double width = v92;
        v182.size.double height = v94;
        CGRect v173 = CGRectUnion(v172, v182);
        double v27 = v77 + v173.origin.x;
        double v28 = v76 + v173.origin.y;
        double v29 = v173.size.width - (v77 + v79);
        double v30 = v173.size.height - (v76 + v78);
        v173.origin.double x = v77 + v173.origin.x;
        v173.origin.double y = v76 + v173.origin.y;
        v173.size.double width = v29;
        v173.size.double height = v30;
        if (CGRectIsNull(v173))
        {
          double v27 = *MEMORY[0x263F001A8];
          double v28 = *(double *)(MEMORY[0x263F001A8] + 8);
          double v29 = *(double *)(MEMORY[0x263F001A8] + 16);
          double v30 = *(double *)(MEMORY[0x263F001A8] + 24);
        }
      }
      else
      {
        v174.origin.double x = x;
        v174.origin.double y = y;
        v174.size.double width = width;
        v174.size.double height = height;
        if (CGRectIsNull(v174))
        {
          v95 = [(NSMutableArray *)v35 lastObject];
          [v95 clippingRect];
          double v27 = v96;
          double v28 = v97;
          double v29 = v98;
          double v30 = v99;
        }
        else
        {
          if ([(NSMutableArray *)v35 count])
          {
            v100 = [(NSMutableArray *)v35 lastObject];
            [v100 clippingRect];
            CGFloat v102 = v101;
            CGFloat v104 = v103;
            CGFloat v106 = v105;
            CGFloat v108 = v107;

            v175.origin.double x = v102;
            v175.origin.double y = v104;
            v175.size.double width = v106;
            v175.size.double height = v108;
            if (!CGRectIsNull(v175))
            {
              v176.origin.double x = x;
              v176.origin.double y = y;
              v176.size.double width = width;
              v176.size.double height = height;
              v183.origin.double x = v102;
              v183.origin.double y = v104;
              v183.size.double width = v106;
              v183.size.double height = v108;
              CGRect v177 = CGRectIntersection(v176, v183);
              double x = v177.origin.x;
              double y = v177.origin.y;
              double width = v177.size.width;
              double height = v177.size.height;
            }
          }
          double v27 = x;
          double v28 = y;
          double v29 = width;
          double v30 = height;
          v178.origin.double x = x;
          v178.origin.double y = y;
          v178.size.double width = width;
          v178.size.double height = height;
          if (CGRectIsNull(v178))
          {
            double v27 = *MEMORY[0x263F001A8];
            double v28 = *(double *)(MEMORY[0x263F001A8] + 8);
            double v29 = *(double *)(MEMORY[0x263F001A8] + 16);
            double v30 = *(double *)(MEMORY[0x263F001A8] + 24);
          }
        }
      }
    }
    goto LABEL_66;
  }
  double v27 = *MEMORY[0x263F001A0];
  double v28 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v29 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v30 = *(double *)(MEMORY[0x263F001A0] + 24);
LABEL_66:
  v179.origin.double x = v27;
  v179.origin.double y = v28;
  v179.size.double width = v29;
  v179.size.double height = v30;
  if (CGRectIsNull(v179))
  {
    if ([(NSMutableArray *)self->_stateStack count])
    {
      v109 = [(NSMutableArray *)self->_stateStack lastObject];
      [v109 clippingRect];
      BOOL IsNull = CGRectIsNull(v180);

      if (!IsNull)
      {
        v111 = [MEMORY[0x263F08690] currentHandler];
        [v111 handleFailureInMethod:v128, self, @"_FEFocusMapSnapshot.m", 512, @"Encountered a NULL clipping rect, which is invalid when previous containers are clipping." object file lineNumber description];
      }
    }
  }
  v112 = +[_FEFocusRegionSearchContextState stateWithRegionContainer:focusSystem:clippingRect:](_FEFocusRegionSearchContextState, "stateWithRegionContainer:focusSystem:clippingRect:", v12, v7, v27, v28, v29, v30);
  [(NSMutableArray *)self->_stateStack addObject:v112];
  [v12 _searchForFocusRegionsInContext:self];
  [(NSMutableArray *)self->_stateStack removeLastObject];
  if (v129 && (*(unsigned char *)&self->_flags & 2) != 0) {
    *(unsigned char *)&self->_flags &= ~2u;
  }

LABEL_74:
}

- (void)addRegionsInContainers:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    unint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_FEFocusMapSnapshot.m", 529, @"Invalid parameter not satisfying: %@", @"containers" object file lineNumber description];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [(_FEFocusMapSnapshot *)self addRegionsInContainer:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (_FEFocusSystem)focusSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  return (_FEFocusSystem *)WeakRetained;
}

- (_FEFocusRegionContainer)rootContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootContainer);
  return (_FEFocusRegionContainer *)WeakRetained;
}

- (_FEFocusMapRect)mapArea
{
  return self->_mapArea;
}

- (_FEFocusRegion)focusedRegion
{
  return self->_focusedRegion;
}

- (_FEFocusRegionContainer)regionsContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_regionsContainer);
  return (_FEFocusRegionContainer *)WeakRetained;
}

- (_FEFocusSearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (void)setSearchInfo:(id)a3
{
}

- (_FEFocusMovementInfo)movementInfo
{
  return self->_movementInfo;
}

- (void)setMovementInfo:(id)a3
{
}

- (_FEFocusMapRect)_searchArea
{
  return self->_searchArea;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchArea, 0);
  objc_storeStrong((id *)&self->_movementInfo, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_destroyWeak((id *)&self->_regionsContainer);
  objc_storeStrong((id *)&self->_focusedRegion, 0);
  objc_storeStrong((id *)&self->_mapArea, 0);
  objc_destroyWeak((id *)&self->_rootContainer);
  objc_destroyWeak((id *)&self->_focusSystem);
  objc_storeStrong((id *)&self->_visitedRegionContainers, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_uncachableEnvironments, 0);
  objc_storeStrong((id *)&self->_ineligibleEnvironments, 0);
  objc_storeStrong((id *)&self->_eligibleEnvironments, 0);
  objc_storeStrong((id *)&self->_stateStack, 0);
  objc_storeStrong((id *)&self->_filteredOriginalRegions, 0);
  objc_storeStrong((id *)&self->_mutableUnoccludedRegions, 0);
}

- (id)debugQuickLookObject
{
  v2 = [(_FEFocusMapSnapshot *)self _debugInfo];
  v3 = [v2 image];

  return v3;
}

- (_FEFocusMapSnapshotDebugInfo)_debugInfo
{
  objc_getAssociatedObject(self, sel__debugInfo);
  v3 = (_FEFocusMapSnapshotDebugInfo *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = [[_FEFocusMapSnapshotDebugInfo alloc] initWithSnapshot:self focusMapSearchInfo:0];
    objc_setAssociatedObject(self, sel__debugInfo, v3, (void *)1);
  }
  return v3;
}

- (id)_debugInfoWithFocusMapSearchInfo:(id)a3
{
  id v4 = a3;
  id v5 = [[_FEFocusMapSnapshotDebugInfo alloc] initWithSnapshot:self focusMapSearchInfo:v4];

  return v5;
}

@end