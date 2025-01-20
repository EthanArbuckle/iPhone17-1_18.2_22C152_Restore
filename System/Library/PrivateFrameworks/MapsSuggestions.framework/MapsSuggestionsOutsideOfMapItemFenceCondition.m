@interface MapsSuggestionsOutsideOfMapItemFenceCondition
- (BOOL)isTrue;
- (MapsSuggestionsOutsideOfMapItemFenceCondition)initWithMapItem:(id)a3 radius:(double)a4;
@end

@implementation MapsSuggestionsOutsideOfMapItemFenceCondition

- (MapsSuggestionsOutsideOfMapItemFenceCondition)initWithMapItem:(id)a3 radius:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MapsSuggestionsOutsideOfMapItemFenceCondition;
  v8 = [(MapsSuggestionsBaseCondition *)&v11 initWithName:@"MapsSuggestionsOutsideOfMapItemFence"];
  v9 = v8;
  if (v8)
  {
    v8->_radius = a4;
    objc_storeStrong((id *)&v8->_mapItem, a3);
  }

  return v9;
}

- (BOOL)isTrue
{
  v3 = MapsSuggestionsCurrentBestLocation();
  v4 = v3;
  if (v3)
  {
    [v3 coordinate];
    double v6 = v5;
    [v4 coordinate];
    double v8 = v7;
    v9 = [(GEOMapItemStorage *)self->_mapItem geoFenceMapRegion];
    int v10 = objc_msgSend(v9, "containsCoordinate:radius:", v6, v8, self->_radius) ^ 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
}

@end