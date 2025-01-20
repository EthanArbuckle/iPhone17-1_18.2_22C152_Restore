@interface GEORouteBuilder_PersistentData
- (BOOL)_buildComponents;
- (BOOL)_buildCoordinates;
- (BOOL)_setMiscInfo;
- (GEOComposedGeometryRoutePersistentData)persistentData;
- (GEORouteBuilder_PersistentData)initWithPersistentData:(id)a3;
- (id)_newRouteInstance;
- (int)_transportType;
- (void)setPersistentData:(id)a3;
@end

@implementation GEORouteBuilder_PersistentData

- (GEORouteBuilder_PersistentData)initWithPersistentData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEORouteBuilder_PersistentData;
  v6 = [(GEORouteBuilder_PersistentData *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistentData, a3);
    v8 = v7;
  }

  return v7;
}

- (int)_transportType
{
  return [(GEOComposedGeometryRoutePersistentData *)self->_persistentData transportType];
}

- (id)_newRouteInstance
{
  return (id)objc_opt_new();
}

- (BOOL)_buildCoordinates
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(GEOComposedGeometryRoutePersistentData *)self->_persistentData rawRouteGeometry];
  if (!v3)
  {
    GEOGetGEORouteBuilder_PersistentDataLog();
    v4 = (GEOComposedRouteCoordinateArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_188D96000, &v4->super, OS_LOG_TYPE_ERROR, "Cannot build coordinates because raw route geometry is empty.", (uint8_t *)v9, 2u);
    }
    goto LABEL_9;
  }
  v4 = [[GEOComposedRouteCoordinateArray alloc] initWithRawRouteGeometry:v3];
  if ([(GEOComposedRouteCoordinateArray *)v4 coordinateCount] <= 1)
  {
    v7 = GEOGetGEORouteBuilder_PersistentDataLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9[0] = 67109120;
      v9[1] = [(GEOComposedRouteCoordinateArray *)v4 coordinateCount];
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "Error building route coordinates. Total point count is less than 2. Actual: %d", (uint8_t *)v9, 8u);
    }

LABEL_9:
    BOOL v6 = 0;
    goto LABEL_10;
  }
  id v5 = [(GEORouteBuilderBase *)self route];
  [v5 setCoordinates:v4];

  BOOL v6 = 1;
LABEL_10:

  return v6;
}

- (BOOL)_buildComponents
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = [(GEORouteBuilderBase *)self _singleLegWithLocationTypeWaypoints];
  if (v3)
  {
    v4 = [(GEOComposedGeometryRoutePersistentData *)self->_persistentData anchorPoints];
    id v5 = [v4 firstObject];

    if (v5)
    {
      id v6 = [v5 copy];
      [v3 setOrigin:v6];
    }
    v7 = [(GEOComposedGeometryRoutePersistentData *)self->_persistentData anchorPoints];
    v8 = [v7 lastObject];

    if (v8)
    {
      v9 = (void *)[v8 copy];
      [v3 setDestination:v9];
    }
    v14[0] = v3;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    v11 = [(GEORouteBuilderBase *)self route];
    [v11 setLegs:v10];
  }
  else
  {
    id v5 = GEOGetGEORouteBuilder_PersistentDataLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "Error building route leg.", v13, 2u);
    }
  }

  return v3 != 0;
}

- (BOOL)_setMiscInfo
{
  v3 = [(GEORouteBuilderBase *)self route];
  v4 = [(GEOComposedGeometryRoutePersistentData *)self->_persistentData routeID];
  if (v4)
  {
    [v3 setUniqueRouteID:v4];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F29128] UUID];
    [v3 setUniqueRouteID:v5];
  }
  objc_msgSend(v3, "setSource:", -[GEOComposedGeometryRoutePersistentData source](self->_persistentData, "source"));
  id v6 = [(GEOComposedGeometryRoutePersistentData *)self->_persistentData routeName];
  [v3 setName:v6];

  v7 = [(GEOComposedGeometryRoutePersistentData *)self->_persistentData userProvidedName];
  [v3 setUserProvidedName:v7];

  v8 = [(GEOComposedGeometryRoutePersistentData *)self->_persistentData userProvidedNotes];
  [v3 setUserProvidedNotes:v8];

  v9 = [(GEOComposedGeometryRoutePersistentData *)self->_persistentData storageID];
  [v3 setStorageID:v9];

  uint64_t v10 = [(GEOComposedGeometryRoutePersistentData *)self->_persistentData tourIdentifier];
  [v3 setTourIdentifier:v10];

  objc_msgSend(v3, "setTourMuid:", -[GEOComposedGeometryRoutePersistentData tourMuid](self->_persistentData, "tourMuid"));
  objc_msgSend(v3, "setMapItemMuid:", -[GEOComposedGeometryRoutePersistentData mapItemMuid](self->_persistentData, "mapItemMuid"));
  v11 = [(GEOComposedGeometryRoutePersistentData *)self->_persistentData anchorPoints];
  [v3 setAnchorPoints:v11];

  v12 = [(GEOComposedGeometryRoutePersistentData *)self->_persistentData address];
  [v3 setAddress:v12];

  [(GEOComposedGeometryRoutePersistentData *)self->_persistentData distance];
  objc_msgSend(v3, "setDistance:");
  [(GEOComposedGeometryRoutePersistentData *)self->_persistentData duration];
  [v3 setExpectedTime:v13];
  v14 = [(GEOComposedGeometryRoutePersistentData *)self->_persistentData elevationProfile];
  [v3 setElevationProfile:v14];

  objc_msgSend(v3, "setElevationModel:", -[GEOComposedGeometryRoutePersistentData elevationModel](self->_persistentData, "elevationModel"));
  v15 = [(GEOComposedGeometryRoutePersistentData *)self->_persistentData travelDirectionArrows];
  [v3 setVisualInfos:v15];

  v16 = [(GEOComposedGeometryRoutePersistentData *)self->_persistentData routeNameLabels];
  [v3 setVisualInfosForRouteNameLabels:v16];

  v17 = [(GEOComposedGeometryRoutePersistentData *)self->_persistentData disclaimerText];
  [v3 setDisclaimerText:v17];

  v18 = [(GEOComposedGeometryRoutePersistentData *)self->_persistentData disclaimerURL];
  [v3 setDisclaimerURL:v18];

  v19 = objc_opt_new();
  [v19 initializeForRoute:v3];
  [v3 setMutableData:v19];

  return 1;
}

- (GEOComposedGeometryRoutePersistentData)persistentData
{
  return self->_persistentData;
}

- (void)setPersistentData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end