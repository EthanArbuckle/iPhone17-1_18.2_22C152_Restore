@interface GEORoadConnectivityPenalty
- (GEOMapFeatureRoad)originRoad;
- (GEORoadConnectivityPenalty)init;
- (GEORoadConnectivityPenalty)initWithOriginRoad:(id)a3;
- (NSMutableDictionary)roadIntersections;
- (double)penaltyForCandidate:(id)a3;
- (unint64_t)shortestLengthToRoad:(id)a3;
- (void)_addRoadsFromOriginRoad:(id)a3 currentDepth:(unint64_t)a4;
- (void)_initConnectivityMap;
- (void)setRoadIntersections:(id)a3;
@end

@implementation GEORoadConnectivityPenalty

- (GEORoadConnectivityPenalty)init
{
  result = (GEORoadConnectivityPenalty *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEORoadConnectivityPenalty)initWithOriginRoad:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEORoadConnectivityPenalty;
  v6 = [(GEORoadConnectivityPenalty *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originRoad, a3);
    v8 = objc_alloc_init(GEOMapFeatureAccess);
    mapFeatureAccess = v7->_mapFeatureAccess;
    v7->_mapFeatureAccess = v8;

    v7->_maxDepthForRoadConnectivity = 5;
    v7->_completedConnectivityMap = 0;
    [(GEORoadConnectivityPenalty *)v7 _initConnectivityMap];
    v10 = v7;
  }

  return v7;
}

- (void)_initConnectivityMap
{
  v3 = (NSMutableDictionary *)objc_opt_new();
  roadIntersections = self->_roadIntersections;
  self->_roadIntersections = v3;

  id v5 = self->_roadIntersections;
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[GEOMapFeatureRoad muid](self->_originRoad, "muid"));
  [(NSMutableDictionary *)v5 setObject:&unk_1ED73DA80 forKey:v6];

  originRoad = self->_originRoad;

  [(GEORoadConnectivityPenalty *)self _addRoadsFromOriginRoad:originRoad currentDepth:0];
}

- (void)_addRoadsFromOriginRoad:(id)a3 currentDepth:(unint64_t)a4
{
  id v6 = a3;
  if (self->_maxDepthForRoadConnectivity > a4)
  {
    objc_initWeak(&location, self);
    mapFeatureAccess = self->_mapFeatureAccess;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__GEORoadConnectivityPenalty__addRoadsFromOriginRoad_currentDepth___block_invoke;
    v10[3] = &unk_1E53DF1E0;
    objc_copyWeak(v12, &location);
    id v11 = v6;
    v12[1] = (id)a4;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__GEORoadConnectivityPenalty__addRoadsFromOriginRoad_currentDepth___block_invoke_12;
    v9[3] = &unk_1E53D9070;
    v9[4] = self;
    id v8 = [(GEOMapFeatureAccess *)mapFeatureAccess findRoadsFromNextIntersectionOf:v11 handler:v10 completionHandler:v9];

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
}

void __67__GEORoadConnectivityPenalty__addRoadsFromOriginRoad_currentDepth___block_invoke(uint64_t a1, void *a2)
{
  id v22 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained roadIntersections];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v22, "muid"));
  id v6 = [v4 objectForKey:v5];

  if (!v6)
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 40));
    id v8 = [v7 roadIntersections];
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v22, "muid"));
    [v8 setObject:&unk_1ED73DA98 forKey:v9];
  }
  id v10 = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v11 = [v10 shortestLengthToRoad:*(void *)(a1 + 32)] + 1;
  id v12 = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v13 = [v12 shortestLengthToRoad:v22];
  id v14 = objc_loadWeakRetained((id *)(a1 + 40));
  v15 = v14;
  if (v11 >= v13) {
    uint64_t v16 = [v14 shortestLengthToRoad:v22];
  }
  else {
    uint64_t v16 = [v14 shortestLengthToRoad:*(void *)(a1 + 32)] + 1;
  }

  id v17 = objc_loadWeakRetained((id *)(a1 + 40));
  v18 = [v17 roadIntersections];
  v19 = [NSNumber numberWithUnsignedInteger:v16];
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v22, "muid"));
  [v18 setObject:v19 forKey:v20];

  id v21 = objc_loadWeakRetained((id *)(a1 + 40));
  [v21 _addRoadsFromOriginRoad:v22 currentDepth:*(void *)(a1 + 48) + 1];
}

uint64_t __67__GEORoadConnectivityPenalty__addRoadsFromOriginRoad_currentDepth___block_invoke_12(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 48) = 1;
  return result;
}

- (GEOMapFeatureRoad)originRoad
{
  return self->_originRoad;
}

- (unint64_t)shortestLengthToRoad:(id)a3
{
  id v4 = a3;
  roadIntersections = self->_roadIntersections;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "muid"));
  id v7 = [(NSMutableDictionary *)roadIntersections objectForKey:v6];

  if (v7)
  {
    id v8 = self->_roadIntersections;
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "muid"));
    id v10 = [(NSMutableDictionary *)v8 objectForKey:v9];
    unint64_t v11 = [v10 unsignedIntValue];
  }
  else
  {
    unint64_t v11 = 5;
  }

  return v11;
}

- (double)penaltyForCandidate:(id)a3
{
  if (!self->_completedConnectivityMap) {
    return 0.0;
  }
  id v4 = [a3 road];
  double v5 = (double)(1 << [(GEORoadConnectivityPenalty *)self shortestLengthToRoad:v4]);

  return v5;
}

- (NSMutableDictionary)roadIntersections
{
  return self->_roadIntersections;
}

- (void)setRoadIntersections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapFeatureAccess, 0);
  objc_storeStrong((id *)&self->_roadIntersections, 0);
  objc_storeStrong((id *)&self->_originRoad, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end