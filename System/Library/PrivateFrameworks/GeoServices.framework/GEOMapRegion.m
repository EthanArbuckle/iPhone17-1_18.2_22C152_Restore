@interface GEOMapRegion
+ (BOOL)isValid:(id)a3;
+ (Class)vertexType;
+ (id)_geo_mapRegionForGEOCoordinateRegion:(id)a3;
- (BOOL)containsCoordinate:(id)a3;
- (BOOL)containsCoordinate:(id)a3 radius:(double)a4;
- (BOOL)containsMapRect:(id)a3;
- (BOOL)containsRegion:(id)a3;
- (BOOL)hasEastLng;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMapRegionSourceType;
- (BOOL)hasNorthLat;
- (BOOL)hasRectangleVertices;
- (BOOL)hasSouthLat;
- (BOOL)hasWestLng;
- (BOOL)intersectsMapRect:(id)a3;
- (BOOL)intersectsRegion:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)readFrom:(id)a3;
- (GEOMapRegion)initWithCoordinateRegion:(id)a3;
- (GEOMapRegion)initWithDictionary:(id)a3;
- (GEOMapRegion)initWithJSON:(id)a3;
- (GEOMapRegion)initWithLatitude:(double)a3 longitude:(double)a4;
- (GEOMapRegion)initWithMapRect:(id)a3;
- (GEOMapRegion)initWithRadialPlace:(id)a3;
- (NSMutableArray)vertexs;
- (PBUnknownFields)unknownFields;
- (double)centerLat;
- (double)centerLng;
- (double)eastLng;
- (double)northLat;
- (double)southLat;
- (double)spanLat;
- (double)spanLng;
- (double)westLng;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)coordinates;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)intersectionsOnPolyline:(id)a3;
- (id)jsonRepresentation;
- (id)mapRegionSourceTypeAsString:(int)a3;
- (id)vertexAtIndex:(unint64_t)a3;
- (int)StringAsMapRegionSourceType:(id)a3;
- (int)mapRegionSourceType;
- (unint64_t)hash;
- (unint64_t)vertexsCount;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)addVertex:(id)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearVertexs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEastLng:(double)a3;
- (void)setHasEastLng:(BOOL)a3;
- (void)setHasMapRegionSourceType:(BOOL)a3;
- (void)setHasNorthLat:(BOOL)a3;
- (void)setHasSouthLat:(BOOL)a3;
- (void)setHasWestLng:(BOOL)a3;
- (void)setMapRect:(id)a3;
- (void)setMapRegionSourceType:(int)a3;
- (void)setNorthLat:(double)a3;
- (void)setSouthLat:(double)a3;
- (void)setVertexs:(id)a3;
- (void)setWestLng:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapRegion

- (BOOL)isValid
{
  return [(GEOMapRegion *)self hasRectangleVertices]
      || [(GEOMapRegion *)self vertexsCount] != 0;
}

- (double)westLng
{
  return self->_westLng;
}

- (double)southLat
{
  return self->_southLat;
}

- (BOOL)hasWestLng
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (double)northLat
{
  return self->_northLat;
}

- (double)eastLng
{
  return self->_eastLng;
}

- (BOOL)hasRectangleVertices
{
  if (![(GEOMapRegion *)self hasNorthLat]
    || ![(GEOMapRegion *)self hasSouthLat]
    || ![(GEOMapRegion *)self hasEastLng])
  {
    return 0;
  }

  return [(GEOMapRegion *)self hasWestLng];
}

- (BOOL)hasSouthLat
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)hasNorthLat
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)hasEastLng
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(double *)(v5 + 32) = self->_southLat;
    *(unsigned char *)(v5 + 60) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 48) = self->_westLng;
  *(unsigned char *)(v5 + 60) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_18:
  *(double *)(v5 + 24) = self->_northLat;
  *(unsigned char *)(v5 + 60) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_5:
    *(double *)(v5 + 16) = self->_eastLng;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
LABEL_6:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = self->_vertexs;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [(id)v6 addVertex:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_mapRegionSourceType;
    *(unsigned char *)(v6 + 60) |= 0x10u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (void)addVertex:(id)a3
{
  id v4 = a3;
  vertexs = self->_vertexs;
  id v8 = v4;
  if (!vertexs)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_vertexs;
    self->_vertexs = v6;

    id v4 = v8;
    vertexs = self->_vertexs;
  }
  [(NSMutableArray *)vertexs addObject:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vertexs, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (GEOMapRegion)initWithMapRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapRegion;
  v7 = [(GEOMapRegion *)&v10 init];
  id v8 = v7;
  if (v7) {
    -[GEOMapRegion setMapRect:](v7, "setMapRect:", v6, v5, var0, var1);
  }
  return v8;
}

- (void)setMapRect:(id)a3
{
  double var1 = a3.var1.var1;
  double v4 = a3.var0.var1;
  double v6 = a3.var0.var0 + a3.var1.var0;
  if (a3.var0.var0 >= 0.0 && v6 <= 268435456.0)
  {
    double v29 = GEOCoordinate2DForMapPoint(a3.var0.var0, a3.var0.var1);
    double v31 = v30;
    double v32 = GEOCoordinate2DForMapPoint(v6, v4 + var1);
    double v34 = v33;
    [(GEOMapRegion *)self setNorthLat:v29];
    [(GEOMapRegion *)self setWestLng:v31];
    [(GEOMapRegion *)self setSouthLat:v32];
    [(GEOMapRegion *)self setEastLng:v34];
  }
  else
  {
    double v8 = 0.0;
    double v9 = INFINITY;
    if (v6 > 268435456.0) {
      double v10 = 0.0;
    }
    else {
      double v10 = INFINITY;
    }
    if (v6 > 268435456.0)
    {
      double v9 = v4;
      double v8 = v6 + -268435456.0;
    }
    double v11 = fabs(a3.var0.var0);
    if (a3.var0.var0 < 0.0) {
      double v12 = a3.var0.var0 + 268435456.0;
    }
    else {
      double v12 = v10;
    }
    if (a3.var0.var0 < 0.0) {
      double v13 = v4;
    }
    else {
      double v13 = v9;
    }
    if (a3.var0.var0 < 0.0) {
      double v14 = v11;
    }
    else {
      double v14 = v8;
    }
    double v15 = GEOMapRectIntersection(a3.var0.var0, v4, a3.var1.var0, var1, 0.0, 0.0, 268435456.0, 268435456.0);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    [(GEOMapRegion *)self setNorthLat:(double)GEOCoordinate2DForMapPoint(v15, v16)];
    [(GEOMapRegion *)self setSouthLat:(double)GEOCoordinate2DForMapPoint(v15, v17 + v21)];
    if (v15 < v12) {
      double v22 = v12;
    }
    else {
      double v22 = v15;
    }
    if (v15 < v12) {
      double v23 = v13;
    }
    else {
      double v23 = v17;
    }
    if (v15 < v12) {
      double v24 = v15;
    }
    else {
      double v24 = v12;
    }
    if (v15 < v12) {
      double v25 = v17;
    }
    else {
      double v25 = v13;
    }
    if (v15 < v12) {
      double v26 = v19;
    }
    else {
      double v26 = v14;
    }
    GEOCoordinate2DForMapPoint(v24 + v26, v25);
    [(GEOMapRegion *)self setEastLng:v27];
    GEOCoordinate2DForMapPoint(v22, v23);
    [(GEOMapRegion *)self setWestLng:v28];
  }
}

- (GEOMapRegion)initWithLatitude:(double)a3 longitude:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)GEOMapRegion;
  double v6 = [(GEOMapRegion *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(GEOMapRegion *)v6 setSouthLat:a3];
    [(GEOMapRegion *)v7 setWestLng:a4];
    [(GEOMapRegion *)v7 setNorthLat:a3];
    [(GEOMapRegion *)v7 setEastLng:a4];
  }
  return v7;
}

- (void)setWestLng:(double)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_westLng = a3;
}

- (void)setSouthLat:(double)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_southLat = a3;
}

- (void)setNorthLat:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_northLat = a3;
}

- (void)setEastLng:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_eastLng = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  [(GEOMapRegion *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 60);
  if ((flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_southLat != *((double *)v4 + 4)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_westLng != *((double *)v4 + 6)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_northLat != *((double *)v4 + 3)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_eastLng != *((double *)v4 + 2)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_29;
  }
  vertexs = self->_vertexs;
  if ((unint64_t)vertexs | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](vertexs, "isEqual:"))
    {
LABEL_29:
      BOOL v8 = 0;
      goto LABEL_30;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 60);
  }
  BOOL v8 = (v6 & 0x10) == 0;
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_mapRegionSourceType != *((_DWORD *)v4 + 14)) {
      goto LABEL_29;
    }
    BOOL v8 = 1;
  }
LABEL_30:

  return v8;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  if (*(unsigned char *)&self->_flags) {
LABEL_5:
  }
    PBDataWriterWriteDoubleField();
LABEL_6:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v6 = self->_vertexs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);
}

- (GEOMapRegion)initWithCoordinateRegion:(id)a3
{
  GEOMapRectForCoordinateRegion(a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);

  return -[GEOMapRegion initWithMapRect:](self, "initWithMapRect:");
}

- (GEOMapRegion)initWithRadialPlace:(id)a3
{
  id v4 = a3;
  [v4 coordinate];
  double v6 = v5;
  double v8 = v7;
  [v4 radialDistance];
  double v10 = v9;

  double v11 = GEOMapRectMakeWithRadialDistance(v6, v8, v10);

  return [(GEOMapRegion *)self initWithMapRect:v11];
}

- (double)centerLat
{
  [(GEOMapRegion *)self southLat];
  double v4 = v3;
  [(GEOMapRegion *)self northLat];
  return (v4 + v5) * 0.5;
}

- (double)centerLng
{
  [(GEOMapRegion *)self westLng];
  double v4 = v3;
  [(GEOMapRegion *)self eastLng];
  return (v4 + v5) * 0.5;
}

- (double)spanLat
{
  [(GEOMapRegion *)self northLat];
  double v4 = v3;
  [(GEOMapRegion *)self southLat];
  return vabdd_f64(v4, v5);
}

- (double)spanLng
{
  [(GEOMapRegion *)self eastLng];
  double v4 = v3;
  [(GEOMapRegion *)self westLng];
  return vabdd_f64(v4, v5);
}

- (id)coordinates
{
  if ([(GEOMapRegion *)self vertexsCount])
  {
    double v3 = [(GEOMapRegion *)self vertexs];
  }
  else if ([(GEOMapRegion *)self hasRectangleVertices])
  {
    double v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
    double v4 = [GEOLatLng alloc];
    [(GEOMapRegion *)self northLat];
    double v6 = v5;
    [(GEOMapRegion *)self eastLng];
    double v8 = [(GEOLatLng *)v4 initWithLatitude:v6 longitude:v7];
    [v3 addObject:v8];

    double v9 = [GEOLatLng alloc];
    [(GEOMapRegion *)self northLat];
    double v11 = v10;
    [(GEOMapRegion *)self westLng];
    long long v13 = [(GEOLatLng *)v9 initWithLatitude:v11 longitude:v12];
    [v3 addObject:v13];

    long long v14 = [GEOLatLng alloc];
    [(GEOMapRegion *)self southLat];
    double v16 = v15;
    [(GEOMapRegion *)self westLng];
    double v18 = [(GEOLatLng *)v14 initWithLatitude:v16 longitude:v17];
    [v3 addObject:v18];

    double v19 = [GEOLatLng alloc];
    [(GEOMapRegion *)self southLat];
    double v21 = v20;
    [(GEOMapRegion *)self eastLng];
    double v23 = [(GEOLatLng *)v19 initWithLatitude:v21 longitude:v22];
    [v3 addObject:v23];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

+ (id)_geo_mapRegionForGEOCoordinateRegion:(id)a3
{
  double var0 = a3.var0.var0;
  double v4 = 0;
  if (a3.var0.var1 >= -180.0)
  {
    double var1 = a3.var0.var1;
    if (a3.var0.var1 <= 180.0 && a3.var0.var0 >= -90.0 && a3.var0.var0 <= 90.0)
    {
      double v6 = a3.var1.var0;
      double v4 = 0;
      if (a3.var1.var0 >= 0.0 && a3.var1.var0 <= 180.0)
      {
        double v7 = a3.var1.var1;
        if (a3.var1.var1 >= 0.0 && a3.var1.var1 <= 360.0)
        {
          double v8 = [GEOMapRegion alloc];
          GEOMapRectForCoordinateRegion(var0, var1, v6, v7);
          double v4 = -[GEOMapRegion initWithMapRect:](v8, "initWithMapRect:");
        }
      }
    }
  }

  return v4;
}

- (BOOL)containsRegion:(id)a3
{
  double v4 = (GEOMapRegion *)a3;
  geomapregion::Polygon::Polygon((geomapregion::Polygon *)&v11, self);
  geomapregion::Polygon::Polygon((geomapregion::Polygon *)&v9, v4);
  double v5 = v11;
  double v6 = v9;
  char v7 = geomapregion::Polygon::contains((geomapregion::Polygon *)v11, v12, v9, v10);
  if (v6)
  {
    double v10 = v6;
    operator delete(v6);
    double v5 = v11;
  }
  if (v5)
  {
    double v12 = v5;
    operator delete(v5);
  }

  return v7;
}

- (BOOL)intersectsRegion:(id)a3
{
  double v4 = (GEOMapRegion *)a3;
  geomapregion::Polygon::Polygon((geomapregion::Polygon *)&v11, self);
  geomapregion::Polygon::Polygon((geomapregion::Polygon *)&v9, v4);
  double v5 = v11;
  double v6 = v9;
  char v7 = geomapregion::Polygon::intersects((geomapregion::Polygon *)v11, v12, v9, v10);
  if (v6)
  {
    double v10 = v6;
    operator delete(v6);
    double v5 = v11;
  }
  if (v5)
  {
    double v12 = v5;
    operator delete(v5);
  }

  return v7;
}

- (BOOL)containsCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  geomapregion::Polygon::Polygon((geomapregion::Polygon *)&v8, self);
  double v5 = v8;
  char v6 = geomapregion::Polygon::contains(v8, v9, var1, var0);
  if (v5)
  {
    double v9 = v5;
    operator delete(v5);
  }
  return v6;
}

- (BOOL)containsCoordinate:(id)a3 radius:(double)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  char v7 = [(GEOMapRegion *)self coordinates];
  __p = 0;
  v51 = 0;
  v52 = 0;
  std::vector<gm::Matrix<double,2,1>>::reserve(&__p, [v7 count]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v47 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * i) coordinate];
        double v14 = GEOTilePointForCoordinate(v12, v13, 20.0);
        double v16 = v14;
        uint64_t v17 = v15;
        double v18 = v51;
        if (v51 >= v52)
        {
          double v20 = (double *)__p;
          uint64_t v21 = ((char *)v51 - (unsigned char *)__p) >> 4;
          unint64_t v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 60) {
            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v23 = (char *)v52 - (unsigned char *)__p;
          if (((char *)v52 - (unsigned char *)__p) >> 3 > v22) {
            unint64_t v22 = v23 >> 3;
          }
          if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v24 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v24 = v22;
          }
          if (v24)
          {
            double v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&v52, v24);
            double v20 = (double *)__p;
            double v18 = v51;
          }
          else
          {
            double v25 = 0;
          }
          double v26 = (double *)&v25[16 * v21];
          *double v26 = v16;
          *((void *)v26 + 1) = v17;
          double v27 = v26;
          if (v18 != v20)
          {
            do
            {
              *((_OWORD *)v27 - 1) = *((_OWORD *)v18 - 1);
              v27 -= 2;
              v18 -= 2;
            }
            while (v18 != v20);
            double v20 = (double *)__p;
          }
          double v19 = v26 + 2;
          __p = v27;
          v51 = v26 + 2;
          v52 = (double *)&v25[16 * v24];
          if (v20) {
            operator delete(v20);
          }
        }
        else
        {
          double *v51 = v14;
          *((void *)v18 + 1) = v15;
          double v19 = v18 + 2;
        }
        v51 = v19;
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v9);
  }

  v43 = 0;
  v44 = 0;
  v45 = 0;
  double v28 = (double *)__p;
  double v29 = v51;
  uint64_t v30 = (char *)v51 - (unsigned char *)__p;
  if (v51 != __p)
  {
    if (v30 < 0) {
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    }
    double v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&v45, v30 >> 4);
    uint64_t v32 = 0;
    v43 = v31;
    v45 = &v31[16 * v33];
    double v34 = v31;
    do
    {
      long long v35 = *(_OWORD *)v28;
      v28 += 2;
      *v34++ = v35;
      v32 += 16;
    }
    while (v28 != v29);
    v44 = &v31[v32];
  }
  *(void *)&long long v42 = GEOTilePointForCoordinate(var0, var1, 20.0);
  *((void *)&v42 + 1) = v36;
  if (a4 <= 0.0)
  {
    char v37 = geo::containsPoint<double>((uint64_t *)&v43, (double *)&v42);
  }
  else
  {
    long long v40 = v42;
    double v41 = a4 / (1.0 / GEOMapPointsPerMeterAtLatitude(var0));
    char v37 = geo::Polygon2<double>::intersects((uint64_t *)&v43, (double *)&v40);
  }
  BOOL v38 = v37;
  if (v43)
  {
    v44 = (char *)v43;
    operator delete(v43);
  }
  if (__p)
  {
    v51 = (double *)__p;
    operator delete(__p);
  }

  return v38;
}

- (BOOL)containsMapRect:(id)a3
{
  $140BDABED96B4E653C9F0DB440664A5C v39 = a3;
  double v3 = fabs(a3.var0.var0);
  double v4 = fabs(a3.var0.var1);
  if (v3 == INFINITY || v4 == INFINITY) {
    return 0;
  }
  double v8 = a3.var0.var0 + a3.var1.var0;
  if (a3.var0.var0 < 0.0 || v8 > 268435456.0)
  {
    double v10 = 0.0;
    double var1 = INFINITY;
    BOOL v12 = v8 <= 268435456.0;
    double v13 = v8 + -268435456.0;
    if (v12) {
      double v14 = INFINITY;
    }
    else {
      double v14 = 0.0;
    }
    if (v12) {
      double v13 = 0.0;
    }
    else {
      double var1 = a3.var0.var1;
    }
    if (!v12) {
      double v10 = a3.var1.var1;
    }
    if (a3.var0.var0 >= 0.0)
    {
      double v3 = v13;
    }
    else
    {
      double v14 = a3.var0.var0 + 268435456.0;
      double var1 = a3.var0.var1;
    }
    double v35 = v14;
    double v36 = var1;
    if (a3.var0.var0 < 0.0) {
      double v15 = a3.var1.var1;
    }
    else {
      double v15 = v10;
    }
    double v37 = v3;
    double v38 = v15;
    double v31 = GEOMapRectIntersection(a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1, 0.0, 0.0, 268435456.0, 268435456.0);
    uint64_t v32 = v16;
    uint64_t v33 = v17;
    uint64_t v34 = v18;
    geomapregion::Polygon::Polygon((geomapregion::Polygon *)&v29, self);
    geomapregion::Polygon::Polygon(&__p, &v35);
    double v19 = (double *)__p;
    if (geomapregion::Polygon::contains((geomapregion::Polygon *)v29, v30, (double *)__p, v28))
    {
      geomapregion::Polygon::Polygon((void **)&v25, &v31);
      double v20 = v25;
      char v6 = geomapregion::Polygon::contains((geomapregion::Polygon *)v29, v30, v25, v26);
      if (v20)
      {
        double v26 = v20;
        operator delete(v20);
      }
      double v19 = (double *)__p;
      if (!__p)
      {
LABEL_36:
        uint64_t v23 = v29;
        if (v29)
        {
          uint64_t v30 = (Point *)v29;
          goto LABEL_38;
        }
        return v6;
      }
    }
    else
    {
      char v6 = 0;
      if (!v19) {
        goto LABEL_36;
      }
    }
    double v28 = v19;
    operator delete(v19);
    goto LABEL_36;
  }
  geomapregion::Polygon::Polygon((geomapregion::Polygon *)&v35, self);
  geomapregion::Polygon::Polygon((void **)&v31, &v39.var0.var0);
  uint64_t v21 = *(Point **)&v35;
  unint64_t v22 = *(double **)&v31;
  char v6 = geomapregion::Polygon::contains(*(geomapregion::Polygon **)&v35, *(Point **)&v36, *(double **)&v31, v32);
  if (v22)
  {
    uint64_t v32 = v22;
    operator delete(v22);
    uint64_t v21 = *(Point **)&v35;
  }
  if (v21)
  {
    double v36 = *(double *)&v21;
    uint64_t v23 = v21;
LABEL_38:
    operator delete(v23);
  }
  return v6;
}

- (BOOL)intersectsMapRect:(id)a3
{
  double var1 = a3.var0.var1;
  double var0 = a3.var0.var0;
  $140BDABED96B4E653C9F0DB440664A5C v35 = a3;
  double v5 = fabs(a3.var0.var0);
  double v6 = fabs(a3.var0.var1);
  if (v5 == INFINITY || v6 == INFINITY) {
    return 0;
  }
  double v9 = a3.var1.var1;
  double v10 = a3.var1.var0;
  geomapregion::Polygon::Polygon((geomapregion::Polygon *)&__p, self);
  double v11 = var0 + v10;
  if (var0 >= 0.0 && v11 <= 268435456.0)
  {
    geomapregion::Polygon::Polygon((void **)&v29, &v35.var0.var0);
    uint64_t v21 = v29;
    char v8 = geomapregion::Polygon::intersects((geomapregion::Polygon *)__p, v34, v29, *(double **)&v30);
    if (!v21) {
      goto LABEL_33;
    }
    double v30 = *(double *)&v21;
    goto LABEL_32;
  }
  double v13 = 0.0;
  double v14 = INFINITY;
  BOOL v15 = v11 <= 268435456.0;
  double v16 = v11 + -268435456.0;
  if (v15) {
    double v17 = INFINITY;
  }
  else {
    double v17 = 0.0;
  }
  if (v15) {
    double v16 = 0.0;
  }
  else {
    double v14 = var1;
  }
  if (!v15) {
    double v13 = v9;
  }
  if (var0 < 0.0)
  {
    double v17 = var0 + 268435456.0;
    double v14 = var1;
    double v16 = v5;
  }
  double v29 = *(double **)&v17;
  double v30 = v14;
  if (var0 < 0.0) {
    double v13 = v9;
  }
  double v31 = v16;
  double v32 = v13;
  v28[0] = GEOMapRectIntersection(var0, var1, v10, v9, 0.0, 0.0, 268435456.0, 268435456.0);
  v28[1] = v18;
  v28[2] = v19;
  v28[3] = v20;
  geomapregion::Polygon::Polygon((void **)&v26, (double *)&v29);
  uint64_t v21 = v26;
  if ((geomapregion::Polygon::intersects((geomapregion::Polygon *)__p, v34, v26, v27) & 1) == 0)
  {
    geomapregion::Polygon::Polygon((void **)&v24, v28);
    unint64_t v22 = v24;
    char v8 = geomapregion::Polygon::intersects((geomapregion::Polygon *)__p, v34, v24, v25);
    if (v22)
    {
      double v25 = v22;
      operator delete(v22);
    }
    uint64_t v21 = v26;
    if (!v26) {
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  char v8 = 1;
  if (v21)
  {
LABEL_31:
    double v27 = v21;
LABEL_32:
    operator delete(v21);
  }
LABEL_33:
  if (__p)
  {
    uint64_t v34 = (Point *)__p;
    operator delete(__p);
  }
  return v8;
}

- (id)intersectionsOnPolyline:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  geomapregion::Polygon::Polygon((geomapregion::Polygon *)&__p, self);
  id v45 = [MEMORY[0x1E4F1CA48] array];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v40;
  uint64_t v4 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v4)
  {
    id v5 = 0;
    uint64_t i = *(void *)v48;
    uint64_t v41 = *(void *)v48;
    do
    {
      uint64_t v7 = 0;
      char v8 = v5;
      uint64_t v44 = v4;
      do
      {
        if (*(void *)v48 != i) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v47 + 1) + 8 * v7);
        if (v8)
        {
          [v8 coordinate];
          double v11 = v10;
          double v13 = v12;
          [v9 coordinate];
          v46[0] = v13;
          v46[1] = v11;
          v46[2] = v15;
          v46[3] = v14;
          double v16 = __p;
          double v17 = v52;
          if (v52 != __p && v52 - (unsigned char *)__p != 16)
          {
            v43 = v9;
            double v18 = 0;
            double v19 = 0;
            double v20 = 0;
            unint64_t v21 = 0;
            unint64_t v22 = 0;
            uint64_t v23 = 0;
            do
            {
              uint64_t v24 = v23 + 1;
              long long v25 = v16[v23 + 1];
              v53[0] = v16[v23];
              v53[1] = v25;
              double v26 = geomapregion::Polygon::Line::segment_intersection((double *)v53, v46);
              double v28 = v26;
              if ((*(void *)&v26 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
              {
                uint64_t v29 = v27;
                if ((unint64_t)v22 >= v21)
                {
                  uint64_t v30 = ((char *)v22 - (char *)v20) >> 4;
                  unint64_t v31 = v30 + 1;
                  if ((unint64_t)(v30 + 1) >> 60) {
                    std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                  }
                  if ((uint64_t)(v21 - (void)v20) >> 3 > v31) {
                    unint64_t v31 = (uint64_t)(v21 - (void)v20) >> 3;
                  }
                  if (v21 - (unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0) {
                    unint64_t v32 = 0xFFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v32 = v31;
                  }
                  if (v32) {
                    unint64_t v32 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<google::protobuf::Descriptor const*,int>>>(v32);
                  }
                  else {
                    uint64_t v33 = 0;
                  }
                  uint64_t v34 = (double *)(v32 + 16 * v30);
                  *uint64_t v34 = v28;
                  *((void *)v34 + 1) = v29;
                  if (v22 == v20)
                  {
                    double v18 = (double *)(v32 + 16 * v30);
                  }
                  else
                  {
                    $140BDABED96B4E653C9F0DB440664A5C v35 = (char *)(v32 + 16 * v30);
                    do
                    {
                      *((_OWORD *)v35 - 1) = *((_OWORD *)v22 - 1);
                      v35 -= 16;
                      v22 -= 2;
                    }
                    while (v22 != v20);
                    double v20 = v18;
                    double v18 = (double *)v35;
                  }
                  unint64_t v21 = v32 + 16 * v33;
                  double v19 = v34 + 2;
                  if (v20) {
                    operator delete(v20);
                  }
                  double v20 = v18;
                }
                else
                {
                  *unint64_t v22 = v26;
                  *((void *)v22 + 1) = v27;
                  double v19 = v22 + 2;
                }
                double v16 = __p;
                double v17 = v52;
                unint64_t v22 = v19;
              }
              if (v17 == (unsigned char *)v16) {
                uint64_t v36 = 0;
              }
              else {
                uint64_t v36 = ((v17 - (unsigned char *)v16) >> 4) - 1;
              }
              uint64_t v23 = v24;
            }
            while (v24 != v36);
            double v37 = v18;
            for (uint64_t i = v41; v37 != v19; v37 += 2)
            {
              double v38 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", v37[1], *v37);
              [v45 addObject:v38];
            }
            double v9 = v43;
            if (v18) {
              operator delete(v18);
            }
          }
          uint64_t v4 = v44;
        }
        id v5 = v9;

        ++v7;
        char v8 = v5;
      }
      while (v7 != v4);
      uint64_t v4 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v4);
  }
  if (__p)
  {
    v52 = __p;
    operator delete(__p);
  }

  return v45;
}

- (void)setHasSouthLat:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (void)setHasWestLng:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (void)setHasNorthLat:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (void)setHasEastLng:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (NSMutableArray)vertexs
{
  return self->_vertexs;
}

- (void)setVertexs:(id)a3
{
}

- (void)clearVertexs
{
}

- (unint64_t)vertexsCount
{
  return [(NSMutableArray *)self->_vertexs count];
}

- (id)vertexAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_vertexs objectAtIndex:a3];
}

+ (Class)vertexType
{
  return (Class)objc_opt_class();
}

- (int)mapRegionSourceType
{
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    return self->_mapRegionSourceType;
  }
  else {
    return 1;
  }
}

- (void)setMapRegionSourceType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_mapRegionSourceType = a3;
}

- (void)setHasMapRegionSourceType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasMapRegionSourceType
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)mapRegionSourceTypeAsString:(int)a3
{
  if ((a3 - 1) >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EB960[a3 - 1];
  }

  return v3;
}

- (int)StringAsMapRegionSourceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BASEMAP_CURATED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REV_POLYGON_FIT"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"REV_POLYGON_PADDED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"REV_POINT_PADDED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"GEMINI_CURATED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"GEMINI_POLYGON_FIT"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"GEMINI_POINT_PADDED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PLACES_POINT_PADDED"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SEARCH_CALCULATED"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"DISPATCHER_CALCULATED"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ROUTING_CALCULATED"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ROUTING_FALLBACK"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapRegion;
  int v4 = [(GEOMapRegion *)&v8 description];
  id v5 = [(GEOMapRegion *)self dictionaryRepresentation];
  double v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapRegion _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_32;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 60);
  if ((v5 & 4) != 0)
  {
    double v6 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    [v4 setObject:v6 forKey:@"southLat"];

    char v5 = *(unsigned char *)(a1 + 60);
  }
  if ((v5 & 8) == 0)
  {
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
LABEL_24:
    double v19 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    [v4 setObject:v19 forKey:@"northLat"];

    if ((*(unsigned char *)(a1 + 60) & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  double v18 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  [v4 setObject:v18 forKey:@"westLng"];

  char v5 = *(unsigned char *)(a1 + 60);
  if ((v5 & 2) != 0) {
    goto LABEL_24;
  }
LABEL_6:
  if (v5)
  {
LABEL_7:
    uint64_t v7 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
    [v4 setObject:v7 forKey:@"eastLng"];
  }
LABEL_8:
  if ([*(id *)(a1 + 40) count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (a2) {
            [v14 jsonRepresentation];
          }
          else {
          double v15 = [v14 dictionaryRepresentation];
          }
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"vertex"];
  }
  if ((*(unsigned char *)(a1 + 60) & 0x10) != 0)
  {
    unsigned int v16 = *(_DWORD *)(a1 + 56) - 1;
    if (v16 >= 0xD)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 56));
      double v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v17 = off_1E53EB960[v16];
    }
    [v4 setObject:v17 forKey:@"mapRegionSourceType"];
  }
  double v20 = *(void **)(a1 + 8);
  if (v20)
  {
    unint64_t v21 = [v20 dictionaryRepresentation];
    unint64_t v22 = v21;
    if (a2)
    {
      uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __42__GEOMapRegion__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E53D8860;
      id v24 = v23;
      id v28 = v24;
      [v22 enumerateKeysAndObjectsUsingBlock:v27];
      id v25 = v24;

      unint64_t v22 = v25;
    }
    [v4 setObject:v22 forKey:@"Unknown Fields"];
  }
LABEL_32:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMapRegion _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __42__GEOMapRegion__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOMapRegion)initWithDictionary:(id)a3
{
  return (GEOMapRegion *)-[GEOMapRegion _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      double v6 = [v5 objectForKeyedSubscript:@"southLat"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 doubleValue];
        objc_msgSend(a1, "setSouthLat:");
      }

      uint64_t v7 = [v5 objectForKeyedSubscript:@"westLng"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 doubleValue];
        objc_msgSend(a1, "setWestLng:");
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"northLat"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 doubleValue];
        objc_msgSend(a1, "setNorthLat:");
      }

      id v9 = [v5 objectForKeyedSubscript:@"eastLng"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 doubleValue];
        objc_msgSend(a1, "setEastLng:");
      }

      id v10 = [v5 objectForKeyedSubscript:@"vertex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = v5;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v26 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                double v17 = [GEOLatLng alloc];
                if (a3) {
                  uint64_t v18 = [(GEOLatLng *)v17 initWithJSON:v16];
                }
                else {
                  uint64_t v18 = [(GEOLatLng *)v17 initWithDictionary:v16];
                }
                double v19 = (void *)v18;
                [a1 addVertex:v18];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v13);
        }

        id v5 = v24;
      }

      double v20 = [v5 objectForKeyedSubscript:@"mapRegionSourceType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v20;
        if ([v21 isEqualToString:@"UNKNOWN"])
        {
          uint64_t v22 = 1;
        }
        else if ([v21 isEqualToString:@"BASEMAP_CURATED"])
        {
          uint64_t v22 = 2;
        }
        else if ([v21 isEqualToString:@"REV_POLYGON_FIT"])
        {
          uint64_t v22 = 12;
        }
        else if ([v21 isEqualToString:@"REV_POLYGON_PADDED"])
        {
          uint64_t v22 = 3;
        }
        else if ([v21 isEqualToString:@"REV_POINT_PADDED"])
        {
          uint64_t v22 = 4;
        }
        else if ([v21 isEqualToString:@"GEMINI_CURATED"])
        {
          uint64_t v22 = 5;
        }
        else if ([v21 isEqualToString:@"GEMINI_POLYGON_FIT"])
        {
          uint64_t v22 = 13;
        }
        else if ([v21 isEqualToString:@"GEMINI_POINT_PADDED"])
        {
          uint64_t v22 = 6;
        }
        else if ([v21 isEqualToString:@"PLACES_POINT_PADDED"])
        {
          uint64_t v22 = 7;
        }
        else if ([v21 isEqualToString:@"SEARCH_CALCULATED"])
        {
          uint64_t v22 = 10;
        }
        else if ([v21 isEqualToString:@"DISPATCHER_CALCULATED"])
        {
          uint64_t v22 = 8;
        }
        else if ([v21 isEqualToString:@"ROUTING_CALCULATED"])
        {
          uint64_t v22 = 9;
        }
        else if ([v21 isEqualToString:@"ROUTING_FALLBACK"])
        {
          uint64_t v22 = 11;
        }
        else
        {
          uint64_t v22 = 1;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_57:

          goto LABEL_58;
        }
        uint64_t v22 = [v20 intValue];
      }
      [a1 setMapRegionSourceType:v22];
      goto LABEL_57;
    }
  }
LABEL_58:

  return a1;
}

- (GEOMapRegion)initWithJSON:(id)a3
{
  return (GEOMapRegion *)-[GEOMapRegion _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapRegionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapRegionReadAllFrom((uint64_t)self, a3);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v4 = self->_vertexs;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)copyTo:(id)a3
{
  BOOL v9 = a3;
  [(GEOMapRegion *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v9[4] = *(void *)&self->_southLat;
    *((unsigned char *)v9 + 60) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
LABEL_17:
      v9[3] = *(void *)&self->_northLat;
      *((unsigned char *)v9 + 60) |= 2u;
      if ((*(unsigned char *)&self->_flags & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v9[6] = *(void *)&self->_westLng;
  *((unsigned char *)v9 + 60) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_17;
  }
LABEL_4:
  if (flags)
  {
LABEL_5:
    v9[2] = *(void *)&self->_eastLng;
    *((unsigned char *)v9 + 60) |= 1u;
  }
LABEL_6:
  if ([(GEOMapRegion *)self vertexsCount])
  {
    [v9 clearVertexs];
    unint64_t v5 = [(GEOMapRegion *)self vertexsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        objc_super v8 = [(GEOMapRegion *)self vertexAtIndex:i];
        [v9 addVertex:v8];
      }
    }
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v9 + 14) = self->_mapRegionSourceType;
    *((unsigned char *)v9 + 60) |= 0x10u;
  }
}

- (unint64_t)hash
{
  [(GEOMapRegion *)self readAll:1];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    double southLat = self->_southLat;
    double v6 = -southLat;
    if (southLat >= 0.0) {
      double v6 = self->_southLat;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((flags & 8) != 0)
  {
    double westLng = self->_westLng;
    double v11 = -westLng;
    if (westLng >= 0.0) {
      double v11 = self->_westLng;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((flags & 2) != 0)
  {
    double northLat = self->_northLat;
    double v16 = -northLat;
    if (northLat >= 0.0) {
      double v16 = self->_northLat;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if (flags)
  {
    double eastLng = self->_eastLng;
    double v21 = -eastLng;
    if (eastLng >= 0.0) {
      double v21 = self->_eastLng;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  uint64_t v24 = [(NSMutableArray *)self->_vertexs hash];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    uint64_t v25 = 2654435761 * self->_mapRegionSourceType;
  }
  else {
    uint64_t v25 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v19 ^ v25 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 4) != 0)
  {
    self->_double southLat = *((double *)v4 + 4);
    *(unsigned char *)&self->_flags |= 4u;
    char v5 = *((unsigned char *)v4 + 60);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_double westLng = *((double *)v4 + 6);
  *(unsigned char *)&self->_flags |= 8u;
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_18:
  self->_double northLat = *((double *)v4 + 3);
  *(unsigned char *)&self->_flags |= 2u;
  if (*((unsigned char *)v4 + 60))
  {
LABEL_5:
    self->_double eastLng = *((double *)v4 + 2);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_6:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 5);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEOMapRegion addVertex:](self, "addVertex:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*((unsigned char *)v4 + 60) & 0x10) != 0)
  {
    self->_mapRegionSourceType = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_flags |= 0x10u;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOMapRegion *)self readAll:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = self->_vertexs;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "clearUnknownFields:", 1, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

@end