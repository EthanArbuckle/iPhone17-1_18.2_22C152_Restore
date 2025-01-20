@interface GEONavigationMatchResult
+ (GEONavigationMatchResult)matchResultWithRawLocation:(id)a3;
+ (GEONavigationMatchResult)matchResultWithRoadMatch:(id)a3 location:(id)a4;
+ (GEONavigationMatchResult)matchResultWithRouteMatch:(id)a3 location:(id)a4;
- (BOOL)locationUnreliable;
- (GEOLocation)rawLocation;
- (GEONavigationMatchInfo)detailedMatchInfo;
- (GEONavigationMatchResult)initWithRawLocation:(id)a3;
- (GEONavigationMatchResult)initWithRoadMatch:(id)a3 location:(id)a4;
- (GEONavigationMatchResult)initWithRouteMatch:(id)a3 location:(id)a4;
- (GEORoadMatch)roadMatch;
- (GEORouteMatch)routeMatch;
- (unint64_t)type;
- (void)setDetailedMatchInfo:(id)a3;
- (void)setLocationUnreliable:(BOOL)a3;
- (void)setRouteMatch:(id)a3;
@end

@implementation GEONavigationMatchResult

- (GEONavigationMatchResult)initWithRouteMatch:(id)a3 location:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEONavigationMatchResult;
  v9 = [(GEONavigationMatchResult *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->_type = 0;
    objc_storeStrong((id *)&v9->_routeMatch, a3);
    objc_storeStrong((id *)&v10->_rawLocation, a4);
    v11 = v10;
  }

  return v10;
}

- (GEONavigationMatchResult)initWithRoadMatch:(id)a3 location:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEONavigationMatchResult;
  v9 = [(GEONavigationMatchResult *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->_type = 1;
    objc_storeStrong((id *)&v9->_roadMatch, a3);
    objc_storeStrong((id *)&v10->_rawLocation, a4);
    v11 = v10;
  }

  return v10;
}

- (GEONavigationMatchResult)initWithRawLocation:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEONavigationMatchResult;
  v6 = [(GEONavigationMatchResult *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    v6->_type = 2;
    objc_storeStrong((id *)&v6->_rawLocation, a3);
    id v8 = v7;
  }

  return v7;
}

+ (GEONavigationMatchResult)matchResultWithRouteMatch:(id)a3 location:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[GEONavigationMatchResult alloc] initWithRouteMatch:v6 location:v5];

  return v7;
}

+ (GEONavigationMatchResult)matchResultWithRoadMatch:(id)a3 location:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[GEONavigationMatchResult alloc] initWithRoadMatch:v6 location:v5];

  return v7;
}

+ (GEONavigationMatchResult)matchResultWithRawLocation:(id)a3
{
  id v3 = a3;
  v4 = [[GEONavigationMatchResult alloc] initWithRawLocation:v3];

  return v4;
}

- (void)setRouteMatch:(id)a3
{
}

- (void)setDetailedMatchInfo:(id)a3
{
}

- (void)setLocationUnreliable:(BOOL)a3
{
  self->_locationUnreliable = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (GEORouteMatch)routeMatch
{
  return self->_routeMatch;
}

- (GEORoadMatch)roadMatch
{
  return self->_roadMatch;
}

- (GEOLocation)rawLocation
{
  return self->_rawLocation;
}

- (GEONavigationMatchInfo)detailedMatchInfo
{
  return self->_detailedMatchInfo;
}

- (BOOL)locationUnreliable
{
  return self->_locationUnreliable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailedMatchInfo, 0);
  objc_storeStrong((id *)&self->_rawLocation, 0);
  objc_storeStrong((id *)&self->_roadMatch, 0);

  objc_storeStrong((id *)&self->_routeMatch, 0);
}

@end