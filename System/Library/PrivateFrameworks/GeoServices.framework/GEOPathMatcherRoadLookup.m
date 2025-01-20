@interface GEOPathMatcherRoadLookup
- (GEOPathMatcherRoadKey)flippedRoad:(SEL)a3;
- (GEOPathMatcherRoadKey)keyForRoad:(SEL)a3;
- (GEOPathMatcherRoadLookup)initWithAuditToken:(id)a3;
- (id)_roadForKey:(GEOPathMatcherRoadKey *)a3;
- (id)description;
- (id)findOutgoingRoadsFrom:(GEOPathMatcherRoadKey *)a3;
- (id)findRoadWithMuid:(int64_t)a3 nearCoordinate:(id)a4;
- (id)findRoadsNearCoordinate:(id)a3 radius:(double)a4;
- (id)roadForKey:(GEOPathMatcherRoadKey *)a3;
- (void)_cacheRoad:(id)a3;
- (void)dealloc;
@end

@implementation GEOPathMatcherRoadLookup

- (GEOPathMatcherRoadLookup)initWithAuditToken:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOPathMatcherRoadLookup;
  v5 = [(GEOPathMatcherRoadLookup *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v13 = v5;
    v7 = (void *)geo_dispatch_queue_create_with_format();
    v8 = -[GEOMapFeatureAccess initWithQueue:]([GEOMapFeatureAccess alloc], "initWithQueue:", v7, v13);
    mapFeatureAccess = v6->_mapFeatureAccess;
    v6->_mapFeatureAccess = v8;

    [(GEOMapFeatureAccess *)v6->_mapFeatureAccess setAuditToken:v4];
    [(GEOMapFeatureAccess *)v6->_mapFeatureAccess setAllowNetworkTileLoad:1];
    [(GEOMapFeatureAccess *)v6->_mapFeatureAccess setJoinAllRoadsByMuid:1];
    v10 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    roadsCache = v6->_roadsCache;
    v6->_roadsCache = v10;

    [(NSCache *)v6->_roadsCache setCountLimit:200];
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = GEOGetGEOPathMatcherLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t cacheMissCount = self->_cacheMissCount;
    unint64_t mapFeatureRoadsCount = self->_mapFeatureRoadsCount;
    *(_DWORD *)buf = 67109376;
    int v8 = mapFeatureRoadsCount;
    __int16 v9 = 1024;
    int v10 = cacheMissCount;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Path matcher roads requested: %d, cache misses: %d", buf, 0xEu);
  }

  v6.receiver = self;
  v6.super_class = (Class)GEOPathMatcherRoadLookup;
  [(GEOPathMatcherRoadLookup *)&v6 dealloc];
}

- (GEOPathMatcherRoadKey)keyForRoad:(SEL)a3
{
  id v12 = a4;
  if ([v12 coordinateCount])
  {
    uint64_t v5 = [v12 coordinates3d];
    double v7 = *(double *)v5;
    double v6 = *(double *)(v5 + 8);
  }
  else
  {
    double v6 = -180.0;
    double v7 = -180.0;
  }
  int64_t v8 = [v12 signedMuid];
  uint64_t v9 = [v12 roadID];
  if (v8) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = v9;
  }
  retstr->var0 = v8;
  retstr->var1 = v10;
  retstr->var2 = v7;
  retstr->var3 = v6;

  return result;
}

- (id)roadForKey:(GEOPathMatcherRoadKey *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v5 = *(_OWORD *)&a3->var2;
  v18[0] = *(_OWORD *)&a3->var0;
  v18[1] = v5;
  double v6 = [(GEOPathMatcherRoadLookup *)self _roadForKey:v18];
  if (!v6)
  {
    ++self->_cacheMissCount;
    if (!a3->var0
      || (double var3 = a3->var3, var3 < -180.0)
      || var3 > 180.0
      || (double var2 = a3->var2, var2 < -90.0)
      || var2 > 90.0
      || (-[GEOPathMatcherRoadLookup findRoadWithMuid:nearCoordinate:](self, "findRoadWithMuid:nearCoordinate:"),
          (double v6 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (a3->var1
        && (-[GEOMapFeatureAccess synchronousFindRoadWithID:](self->_mapFeatureAccess, "synchronousFindRoadWithID:"),
            (double v6 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        ++self->_mapFeatureRoadsCount;
        [(GEOPathMatcherRoadLookup *)self _cacheRoad:v6];
      }
      else
      {
        std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v15);
        operator<<(v15, a3);
        uint64_t v9 = GEOGetGEOPathMatcherLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          std::stringbuf::str();
          unint64_t v10 = v14 >= 0 ? &__p : (void **)__p;
          *(_DWORD *)buf = 136315138;
          v20 = v10;
          _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "Error finding road with key: %s. This will probably cause path matching to fail.", buf, 0xCu);
          if (v14 < 0) {
            operator delete(__p);
          }
        }

        v15[0] = *MEMORY[0x1E4FBA418];
        *(void *)((char *)v15 + *(void *)(v15[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
        v15[1] = MEMORY[0x1E4FBA470] + 16;
        if (v16 < 0) {
          operator delete((void *)v15[9]);
        }
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        MEMORY[0x18C11F4F0](&v17);
        double v6 = 0;
      }
    }
  }
  id v11 = v6;

  return v11;
}

- (GEOPathMatcherRoadKey)flippedRoad:(SEL)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v7 = *(_OWORD *)&a4->var2;
  v24[0] = *(_OWORD *)&a4->var0;
  v24[1] = v7;
  int64_t v8 = [(GEOPathMatcherRoadLookup *)self _roadForKey:v24];
  uint64_t v9 = v8;
  int64_t var0 = a4->var0;
  int64_t v11 = -a4->var0;
  if (v8)
  {
    id v12 = [v8 flippedCopy];
    ++self->_mapFeatureRoadsCount;
    [v12 firstCoordinate];
    double v14 = v13;
    double v16 = v15;
    uint64_t v17 = [v12 roadID];
    if (var0) {
      unint64_t v18 = 0;
    }
    else {
      unint64_t v18 = v17;
    }
    retstr->int64_t var0 = v11;
    retstr->var1 = v18;
    retstr->double var2 = v14;
    retstr->double var3 = v16;
    if (v12)
    {
      [(GEOPathMatcherRoadLookup *)self _cacheRoad:v12];
    }
    else
    {
      v20 = GEOGetGEOPathMatcherLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = [v9 roadID];
        uint64_t v22 = [v9 signedMuid];
        *(_DWORD *)buf = 134218240;
        uint64_t v26 = v21;
        __int16 v27 = 2048;
        uint64_t v28 = v22;
        _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "Error creating flipped road for roadID: %llu, muid: %lld", buf, 0x16u);
      }
    }
  }
  else
  {
    ++self->_cacheMissCount;
    unint64_t v19 = a4->var1 ^ 1;
    if (var0) {
      unint64_t v19 = 0;
    }
    retstr->int64_t var0 = v11;
    retstr->var1 = v19;
    *(_OWORD *)&retstr->double var2 = *(_OWORD *)&a4->var2;
  }

  return result;
}

- (id)findRoadWithMuid:(int64_t)a3 nearCoordinate:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  $F24F406B2B787EFB06265DBA3D28CBD5 v12 = a4;
  if (a3)
  {
    if (a3 >= 0) {
      int64_t v6 = a3;
    }
    else {
      int64_t v6 = -a3;
    }
    long long v7 = -[GEOMapFeatureAccess synchronousFindRoadWithMuid:nearCoordinate:](self->_mapFeatureAccess, "synchronousFindRoadWithMuid:nearCoordinate:", v6, *(void *)&v12.var0, *(void *)&v12.var1);
    int64_t v8 = v7;
    if (v7)
    {
      if (a3 < 0) {
        [v7 flip];
      }
      ++self->_mapFeatureRoadsCount;
      [(GEOPathMatcherRoadLookup *)self _cacheRoad:v8];
      id v9 = v8;
    }
    else
    {
      unint64_t v10 = GEOGetGEOPathMatcherLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218499;
        int64_t v14 = v6;
        __int16 v15 = 1040;
        int v16 = 16;
        __int16 v17 = 2097;
        unint64_t v18 = &v12;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "Could not find road with muid %llu near coordinate %{private,geo:coordinate}.*P", buf, 0x1Cu);
      }
    }
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (id)findRoadsNearCoordinate:(id)a3 radius:(double)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v5 = -[GEOMapFeatureAccess synchronousFindRoadsNear:radius:](self->_mapFeatureAccess, "synchronousFindRoadsNear:radius:", a3.var0, a3.var1, a4);
  self->_mapFeatureRoadsCount += [v5 count];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        -[GEOPathMatcherRoadLookup _cacheRoad:](self, "_cacheRoad:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v6;
}

- (id)findOutgoingRoadsFrom:(GEOPathMatcherRoadKey *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v4 = *(_OWORD *)&a3->var2;
  v16[0] = *(_OWORD *)&a3->var0;
  v16[1] = v4;
  long long v5 = [(GEOPathMatcherRoadLookup *)self roadForKey:v16];
  id v6 = [(GEOMapFeatureAccess *)self->_mapFeatureAccess synchronousFindRoadsFromNextIntersectionOf:v5];
  self->_mapFeatureRoadsCount += [v6 count];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        -[GEOPathMatcherRoadLookup _cacheRoad:](self, "_cacheRoad:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }

  return v7;
}

- (id)_roadForKey:(GEOPathMatcherRoadKey *)a3
{
  roadsCache = self->_roadsCache;
  unint64_t var0 = a3->var0;
  if (!a3->var0) {
    unint64_t var0 = a3->var1;
  }
  long long v5 = [NSNumber numberWithUnsignedLong:var0 - 0x61C8864680B583EBLL];
  id v6 = [(NSCache *)roadsCache objectForKey:v5];

  return v6;
}

- (void)_cacheRoad:(id)a3
{
  id v4 = a3;
  roadsCache = self->_roadsCache;
  id v6 = NSNumber;
  [(GEOPathMatcherRoadLookup *)self keyForRoad:v4];
  uint64_t v7 = v9;
  if (!v9) {
    uint64_t v7 = v10;
  }
  uint64_t v8 = [v6 numberWithUnsignedLong:v7 - 0x61C8864680B583EBLL];
  [(NSCache *)roadsCache setObject:v4 forKey:v8];
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(NSCache *)self->_roadsCache allObjects];
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"%d roads:\n", objc_msgSend(v2, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = [v8 roadID];
        uint64_t v10 = [v8 debugDescription];
        [v3 appendFormat:@"%llu - %@\n", v9, v10, (void)v12];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roadsCache, 0);

  objc_storeStrong((id *)&self->_mapFeatureAccess, 0);
}

@end