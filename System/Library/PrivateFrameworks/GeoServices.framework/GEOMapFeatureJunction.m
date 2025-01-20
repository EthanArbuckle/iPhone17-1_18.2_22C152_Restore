@interface GEOMapFeatureJunction
+ (BOOL)isPointOnTileBorder:(GeoCodecsVectorTilePoint *)a3;
+ (GeoCodecsConnectivityJunction)connectivityJunctionForRoadFeature:(id)a3 startJunction:(BOOL)a4 outError:(id *)a5;
+ (id)junctionForRoadFeature:(id)a3 startJunction:(BOOL)a4;
- ($94F468A8D4C62B317260615823C2B210)tilePoint;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)isOnTileBorder;
- (GEOVectorTile)tile;
- (GeoCodecsConnectivityJunction)connectivityJunction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)junctionIndex;
- (unint64_t)primaryID;
- (unint64_t)secondaryID;
@end

@implementation GEOMapFeatureJunction

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  if (fabs(longitude + 180.0) < 0.00000001 && fabs(latitude + 180.0) < 0.00000001)
  {
    v5 = [(GEOVectorTile *)self->_tile tileKey];
    uint64_t v6 = *(void *)v5;
    uint64_t v7 = *(void *)v5 << 32;
    unint64_t v8 = BYTE4(*(void *)v5) | ((((*(void *)v5 >> 40) | (*((unsigned __int16 *)v5 + 4) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*((unsigned __int16 *)v5 + 4) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*((unsigned char *)v5 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*((unsigned char *)v5 + 10) >> 4) << 52);
    *(void *)v17 = v7 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v5 >> 8) & 0x3F) << 40);
    char v16 = v6;
    *((void *)&v9 + 1) = v8;
    *(void *)&long long v9 = v7;
    *(void *)&v17[7] = v9 >> 56;
    double v10 = GEOMapRectForGEOTileKey((uint64_t)&v16);
    double v12 = v10 + self->_tilePoint.x * v11;
    long double v15 = exp(((v13 + (float)(1.0 - self->_tilePoint.y) * v14) * 0.0078125 + -1048576.0) / 333772.107);
    long double latitude = (atan(v15) * -2.0 + 1.57079633) * 57.2957795;
    double longitude = v12 * 0.0078125 * 0.000171661377 + -180.0;
    self->_coordinate.long double latitude = latitude;
    self->_coordinate.double longitude = longitude;
  }
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (GEOVectorTile)tile
{
  return self->_tile;
}

- ($94F468A8D4C62B317260615823C2B210)tilePoint
{
  float x = self->_tilePoint.x;
  float y = self->_tilePoint.y;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (unint64_t)junctionIndex
{
  connectivityJunction = self->_connectivityJunction;
  if (connectivityJunction) {
    return (int64_t)((uint64_t)connectivityJunction
  }
                          - (unint64_t)[(GEOVectorTile *)self->_tile junctions]) >> 5;
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (GeoCodecsConnectivityJunction)connectivityJunction
{
  return self->_connectivityJunction;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *($AB5116BA7E623E054F959CECB034F4E7 *)(v4 + 8) = self->_coordinate;
  *(unsigned char *)(v4 + 24) = self->_isOnTileBorder;
  *($38C3DEC81229B66F67FB6D350D75FF5A *)(v4 + 28) = self->_tilePoint;
  objc_storeStrong((id *)(v4 + 40), self->_tile);
  *(void *)(v4 + 48) = self->_connectivityJunction;
  return (id)v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  tile = self->_tile;
  connectivityJunction = self->_connectivityJunction;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __36__GEOMapFeatureJunction_description__block_invoke;
  v26 = &unk_1E53EB5B8;
  v27 = self;
  id v6 = v3;
  id v28 = v6;
  [(GEOVectorTile *)tile forEachEdgeOnJunction:connectivityJunction visitor:&v23];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v8 = NSString;
  [(GEOMapFeatureJunction *)self coordinate];
  uint64_t v10 = v9;
  [(GEOMapFeatureJunction *)self coordinate];
  double v12 = [v8 stringWithFormat:@"%f, %f", v10, v11, v23, v24, v25, v26, v27];
  [v7 addObject:v12];

  double v13 = objc_msgSend(NSString, "stringWithFormat:", @"Junction: %d", -[GEOMapFeatureJunction junctionIndex](self, "junctionIndex"));
  [v7 addObject:v13];

  double v14 = NSString;
  long double v15 = [v6 componentsJoinedByString:@", "];
  char v16 = [v14 stringWithFormat:@"Roads: [%@]", v15];
  [v7 addObject:v16];

  unint64_t v17 = [(GEOMapFeatureJunction *)self primaryID];
  unint64_t v18 = [(GEOMapFeatureJunction *)self secondaryID];
  if (v17 | v18)
  {
    v19 = [NSString stringWithFormat:@"PrimaryID: %llu, SecondaryID: %llu", v17, v18];
    [v7 addObject:v19];
  }
  v20 = objc_msgSend(NSString, "stringWithFormat:", @"onTileBorder: %d", self->_isOnTileBorder);
  [v7 addObject:v20];

  v21 = [v7 componentsJoinedByString:@" | "];

  return v21;
}

void __36__GEOMapFeatureJunction_description__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [*(id *)(*(void *)(a1 + 32) + 40) lines];
  uint64_t v4 = [v8 road];
  uint64_t v5 = [v3 indexOfObject:v4];

  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v5];
  [v6 addObject:v7];
}

- (BOOL)isOnTileBorder
{
  return self->_isOnTileBorder;
}

- (void).cxx_destruct
{
}

- (unint64_t)primaryID
{
  connectivityJunction = self->_connectivityJunction;
  if (connectivityJunction) {
    return connectivityJunction->var3;
  }
  else {
    return 0;
  }
}

- (unint64_t)secondaryID
{
  connectivityJunction = self->_connectivityJunction;
  if (connectivityJunction) {
    return connectivityJunction->var4;
  }
  else {
    return 0;
  }
}

+ (id)junctionForRoadFeature:(id)a3 startJunction:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v20 = 0;
  uint64_t v7 = [a1 connectivityJunctionForRoadFeature:v6 startJunction:v4 outError:&v20];
  id v8 = v20;
  if (v8)
  {
    uint64_t v9 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [v8 userInfo];
      id v11 = (id)*MEMORY[0x1E4F1D138];
      double v12 = [v10 objectForKeyedSubscript:v11];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v12;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    double v13 = 0;
  }
  else
  {
    double v14 = [v6 feature];
    uint64_t v9 = [v14 containingTile];

    *(void *)buf = 0;
    long double v15 = GEOMultiSectionFeaturePoints(v6, 0, buf);
    uint64_t v16 = *(void *)buf - 1;
    if (v4) {
      uint64_t v16 = 0;
    }
    $38C3DEC81229B66F67FB6D350D75FF5A v19 = ($38C3DEC81229B66F67FB6D350D75FF5A)v15[v16];
    $38C3DEC81229B66F67FB6D350D75FF5A v17 = v19;
    double v13 = objc_alloc_init(GEOMapFeatureJunction);
    v13->_connectivityJunction = (GeoCodecsConnectivityJunction *)v7;
    objc_storeStrong((id *)&v13->_tile, v9);
    v13->_tilePoint = v17;
    v13->_isOnTileBorder = [a1 isPointOnTileBorder:&v19];
    v13->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid;
  }

  return v13;
}

+ (GeoCodecsConnectivityJunction)connectivityJunctionForRoadFeature:(id)a3 startJunction:(BOOL)a4 outError:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  uint64_t v27 = 0;
  id v8 = GEOMultiSectionFeaturePoints(v7, 0, &v27);
  if (v8 && v27)
  {
    uint64_t v9 = [v7 feature];
    uint64_t v10 = [v9 containingTile];

    if ([v7 roadPointCount])
    {
      uint64_t v11 = [v7 roadPointIndex];
      uint64_t v12 = v6 ? 0 : [v7 roadPointCount] - 1;
      uint64_t v23 = *(unsigned int **)([v10 sortedPointsOnRoad] + 8 * (v12 + v11));
      if (v23)
      {
        unint64_t v24 = v23[3];
        if (v6)
        {
          if (!v24) {
            goto LABEL_21;
          }
        }
        else if (v27 - 1 <= v24)
        {
LABEL_21:
          uint64_t v22 = (GeoCodecsConnectivityJunction *)([v10 junctions] + 32 * *v23);
          goto LABEL_18;
        }
      }
    }
LABEL_17:
    uint64_t v22 = 0;
LABEL_18:

    goto LABEL_19;
  }
  if (a5)
  {
    double v13 = [v7 feature];
    double v14 = [v13 containingTile];

    if (v14)
    {
      uint64_t v15 = [v14 tileKey];
      uint64_t v16 = NSString;
      int v17 = *(unsigned __int16 *)(v15 + 8);
      unint64_t v18 = *(void *)v15;
      $38C3DEC81229B66F67FB6D350D75FF5A v19 = [v14 lines];
      id v20 = [v19 objectAtIndex:0];
      uint64_t IndexforMultiSectionFeature = getIndexforMultiSectionFeature(v7, v20);
      uint64_t v10 = [v16 stringWithFormat:@"Unable to find connectivity junction because no points found on road feature. Tile: %d.%d.%d | Feature index: %d | Points: %p, point count: %lu", (v18 >> 14) & 0x3FFFFFF, ((v18 >> 40) | (v17 << 24)) & 0x3FFFFFF, (v18 >> 8) & 0x3F, IndexforMultiSectionFeature, v8, v27];
    }
    else
    {
      v25 = NSString;
      $38C3DEC81229B66F67FB6D350D75FF5A v19 = [v7 feature];
      uint64_t v10 = objc_msgSend(v25, "stringWithFormat:", @"Unable to find connectivity junction because containing tile is missing for feature: %s.", objc_msgSend(v19, "name"));
    }

    *a5 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-7 reason:v10];

    goto LABEL_17;
  }
  uint64_t v22 = 0;
LABEL_19:

  return v22;
}

+ (BOOL)isPointOnTileBorder:(GeoCodecsVectorTilePoint *)a3
{
  BOOL result = fabsf(a3->var0) < 0.000001
        || (float var1 = a3->var1, fabsf(var1) < 0.000001)
        || fabsf(a3->var0 + -1.0) < 0.000001
        || fabsf(var1 + -1.0) < 0.000001;
  return result;
}

@end