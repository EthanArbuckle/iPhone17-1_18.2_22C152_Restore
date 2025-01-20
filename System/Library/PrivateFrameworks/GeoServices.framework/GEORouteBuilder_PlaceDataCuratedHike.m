@interface GEORouteBuilder_PlaceDataCuratedHike
+ (id)builderWithMapItem:(id)a3;
- (BOOL)_buildComponents;
- (BOOL)_buildCoordinates;
- (BOOL)_setMiscInfo;
- (GEOMapItem)mapItem;
- (GEORouteBuilder_PlaceDataCuratedHike)initWithMapItem:(id)a3;
- (id)_anchorPointFromRoute:(id)a3 supportPoint:(id)a4 itemIdentifier:(id)a5;
- (id)_newRouteInstance;
- (int)_transportType;
- (void)_setAnchorPoints;
- (void)setMapItem:(id)a3;
@end

@implementation GEORouteBuilder_PlaceDataCuratedHike

- (GEORouteBuilder_PlaceDataCuratedHike)initWithMapItem:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORouteBuilder_PlaceDataCuratedHike;
  v5 = [(GEORouteBuilder_PlaceDataCuratedHike *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(GEORouteBuilder_PlaceDataCuratedHike *)v5 setMapItem:v4];
    v7 = v6;
  }

  return v6;
}

+ (id)builderWithMapItem:(id)a3
{
  id v3 = a3;
  id v4 = [[GEORouteBuilder_PlaceDataCuratedHike alloc] initWithMapItem:v3];

  return v4;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
  id v5 = a3;
  v6 = [v5 _hikeAssociatedInfo];
  hikeAssociatedInfo = self->_hikeAssociatedInfo;
  self->_hikeAssociatedInfo = v6;

  v8 = [v5 _hikeGeometry];
  hikeGeometry = self->_hikeGeometry;
  self->_hikeGeometry = v8;

  id v12 = [v5 _hikeSummary];
  v10 = [v12 hikeSummary];
  hikeSummary = self->_hikeSummary;
  self->_hikeSummary = v10;
}

- (int)_transportType
{
  return 2;
}

- (id)_newRouteInstance
{
  return (id)objc_opt_new();
}

- (BOOL)_buildCoordinates
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(GEOPDHikeGeometry *)self->_hikeGeometry routingPathLeg];
  if (v3)
  {
    id v4 = [GEORawRouteGeometry alloc];
    v14[0] = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    v6 = [(GEORawRouteGeometry *)v4 initWithRawData:v5];

    v7 = [[GEOComposedRouteCoordinateArray alloc] initWithRawRouteGeometry:v6];
    unint64_t v8 = [(GEOComposedRouteCoordinateArray *)v7 coordinateCount];
    BOOL v9 = v8 > 1;
    if (v8 > 1)
    {
      v10 = [(GEORouteBuilderBase *)self route];
      [v10 setCoordinates:v7];
    }
    else
    {
      v10 = GEOGetGEORouteBuilder_PlaceDataCuratedHikeLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13[0] = 67109120;
        v13[1] = [(GEOComposedRouteCoordinateArray *)v7 coordinateCount];
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "Error building route coordinates. Total point count is less than 2. Actual: %d", (uint8_t *)v13, 8u);
      }
    }
  }
  else
  {
    v6 = GEOGetGEORouteBuilder_PlaceDataCuratedHikeLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "Cannot build coordinates because hike geometry is empty.", (uint8_t *)v13, 2u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_buildComponents
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(GEORouteBuilderBase *)self _singleLegWithLocationTypeWaypoints];
  id v4 = (void *)v3;
  if (v3)
  {
    v9[0] = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    v6 = [(GEORouteBuilderBase *)self route];
    [v6 setLegs:v5];
  }
  else
  {
    id v5 = GEOGetGEORouteBuilder_PlaceDataCuratedHikeLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v8 = 0;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "Error building route leg.", v8, 2u);
    }
  }

  return v4 != 0;
}

- (BOOL)_setMiscInfo
{
  uint64_t v3 = [(GEORouteBuilderBase *)self route];
  id v4 = [(GEOMapItem *)self->_mapItem addressObject];
  [v3 setAddress:v4];

  objc_msgSend(v3, "setDistance:", (double)-[GEOPDHikeSummary lengthMeters](self->_hikeSummary, "lengthMeters"));
  objc_msgSend(v3, "setElevationModel:", -[GEOMapItem _hikeGeometryElevationModel](self->_mapItem, "_hikeGeometryElevationModel"));
  objc_msgSend(v3, "setExpectedTime:", -[GEOPDHikeSummary expectedDurationSeconds](self->_hikeSummary, "expectedDurationSeconds"));
  id v5 = [(GEOMapItem *)self->_mapItem name];
  [v3 setName:v5];

  [v3 setSource:2];
  objc_msgSend(v3, "setTotalAscent:", (float)-[GEOPDHikeSummary sumElevationGainCm](self->_hikeSummary, "sumElevationGainCm") * 0.01);
  objc_msgSend(v3, "setTotalDescent:", (float)-[GEOPDHikeSummary sumElevationLossCm](self->_hikeSummary, "sumElevationLossCm") * 0.01);
  v6 = [(GEOMapItem *)self->_mapItem _identifier];
  [v3 setTourIdentifier:v6];

  objc_msgSend(v3, "setTourMuid:", -[GEOPDHikeAssociatedInfo encryptedTourMuid](self->_hikeAssociatedInfo, "encryptedTourMuid"));
  objc_msgSend(v3, "setMapItemMuid:", -[GEOMapItem _muid](self->_mapItem, "_muid"));
  v7 = [(GEOMapItem *)self->_mapItem name];
  [v3 setUserProvidedName:v7];

  unint64_t v8 = [(GEOMapItem *)self->_mapItem disclaimerText];
  BOOL v9 = [v8 stringValue];
  [v3 setDisclaimerText:v9];

  v10 = [(GEOMapItem *)self->_mapItem urlData];
  [v3 setDisclaimerURL:v10];

  v11 = [(GEOPDHikeSummary *)self->_hikeSummary hikeTypeName];

  if (v11)
  {
    id v12 = [GEOComposedString alloc];
    v13 = [(GEOPDHikeSummary *)self->_hikeSummary hikeTypeName];
    v14 = [(GEOComposedString *)v12 initWithGeoFormattedString:v13];
    [v3 setHikeTypeString:v14];
  }
  [(GEORouteBuilder_PlaceDataCuratedHike *)self _setAnchorPoints];

  return 1;
}

- (id)_anchorPointFromRoute:(id)a3 supportPoint:(id)a4 itemIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    v10 = [v8 anchorPointID];

    if (v10)
    {
      v11 = [v7 coordinates];
      objc_msgSend(v11, "coordinateForRouteCoordinate:", objc_msgSend(v8, "routeCoordinate"));
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;

      if (v9)
      {
        v18 = [[GEOMapItemIdentifier alloc] initWithMapsIdentifier:v9];
        v10 = -[GEOComposedRouteAnchorPoint initWithMapItemIdentifier:coordinate:]([GEOComposedRouteAnchorPoint alloc], "initWithMapItemIdentifier:coordinate:", v18, v13, v15, v17);
      }
      else
      {
        v10 = -[GEOComposedRouteAnchorPoint initWithLocationCoordinate:]([GEOComposedRouteAnchorPoint alloc], "initWithLocationCoordinate:", v13, v15, v17);
      }
      v19 = [v8 anchorPointID];
      [(GEOComposedRouteAnchorPoint *)v10 setUniqueID:v19];

      [(GEOComposedRouteAnchorPoint *)v10 setIsCuratedRoute:1];
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: supportPoint != ((void *)0)", v21, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (void)_setAnchorPoints
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(GEORouteBuilderBase *)self route];
  id v5 = [v4 coordinates];
  v6 = [v5 supportPointsForPathAtIndex:0];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
        double v13 = [v7 firstObject];

        double v14 = [v7 lastObject];

        if (v13 == v12)
        {
          double v16 = [(GEOPDHikeAssociatedInfo *)self->_hikeAssociatedInfo startMuids];
        }
        else
        {
          if (v14 != v12)
          {
            double v15 = 0;
            goto LABEL_12;
          }
          double v16 = [(GEOPDHikeAssociatedInfo *)self->_hikeAssociatedInfo endMuids];
        }
        double v17 = v16;
        double v15 = [v16 firstObject];

LABEL_12:
        v18 = [(GEORouteBuilderBase *)self route];
        v19 = [(GEORouteBuilder_PlaceDataCuratedHike *)self _anchorPointFromRoute:v18 supportPoint:v12 itemIdentifier:v15];

        if (v19) {
          [v3 addObject:v19];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  if ((unint64_t)[v3 count] <= 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: anchorPoints.count >= 2", v22, 2u);
    }
    __break(1u);
  }
  v20 = +[GEOComposedRouteAnchorPointList listWithAnchorPoints:v3];
  v21 = [(GEORouteBuilderBase *)self route];
  [v21 setAnchorPoints:v20];
}

- (GEOMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_hikeSummary, 0);
  objc_storeStrong((id *)&self->_hikeGeometry, 0);

  objc_storeStrong((id *)&self->_hikeAssociatedInfo, 0);
}

@end