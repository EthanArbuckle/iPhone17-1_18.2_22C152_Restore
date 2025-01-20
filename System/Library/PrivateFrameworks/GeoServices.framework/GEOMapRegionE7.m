@interface GEOMapRegionE7
+ (BOOL)isValid:(id)a3;
+ (Class)vertexE7Type;
+ (id)_geo_mapRegionForGEOCoordinateRegion:(id)a3;
- (BOOL)hasEastLngE7;
- (BOOL)hasNorthLatE7;
- (BOOL)hasRectangleVertices;
- (BOOL)hasSouthLatE7;
- (BOOL)hasWestLngE7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)readFrom:(id)a3;
- (GEOMapRegion)mapRegion;
- (GEOMapRegionE7)initWithCoordinateRegion:(id)a3;
- (GEOMapRegionE7)initWithDictionary:(id)a3;
- (GEOMapRegionE7)initWithJSON:(id)a3;
- (GEOMapRegionE7)initWithLatitude:(double)a3 longitude:(double)a4;
- (GEOMapRegionE7)initWithMapRect:(id)a3;
- (GEOMapRegionE7)initWithMapRegion:(id)a3;
- (GEOMapRegionE7)initWithRadialPlace:(id)a3;
- (NSMutableArray)vertexE7s;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)coordinatesE7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)vertexE7AtIndex:(unint64_t)a3;
- (int)centerLatE7;
- (int)centerLngE7;
- (int)eastLngE7;
- (int)northLatE7;
- (int)southLatE7;
- (int)spanLatE7;
- (int)spanLngE7;
- (int)westLngE7;
- (unint64_t)hash;
- (unint64_t)vertexE7sCount;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)addVertexE7:(id)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearVertexE7s;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEastLngE7:(int)a3;
- (void)setHasEastLngE7:(BOOL)a3;
- (void)setHasNorthLatE7:(BOOL)a3;
- (void)setHasSouthLatE7:(BOOL)a3;
- (void)setHasWestLngE7:(BOOL)a3;
- (void)setMapRect:(id)a3;
- (void)setNorthLatE7:(int)a3;
- (void)setSouthLatE7:(int)a3;
- (void)setVertexE7s:(id)a3;
- (void)setWestLngE7:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapRegionE7

- (GEOMapRegionE7)initWithMapRegion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GEOMapRegionE7;
  v5 = [(GEOMapRegionE7 *)&v21 init];
  if (v5)
  {
    if ([v4 hasSouthLat])
    {
      [v4 southLat];
      [(GEOMapRegionE7 *)v5 setSouthLatE7:(int)(v6 * 10000000.0)];
    }
    if ([v4 hasWestLng])
    {
      [v4 westLng];
      [(GEOMapRegionE7 *)v5 setWestLngE7:(int)(v7 * 10000000.0)];
    }
    if ([v4 hasNorthLat])
    {
      [v4 northLat];
      [(GEOMapRegionE7 *)v5 setNorthLatE7:(int)(v8 * 10000000.0)];
    }
    if ([v4 hasEastLng])
    {
      [v4 eastLng];
      [(GEOMapRegionE7 *)v5 setEastLngE7:(int)(v9 * 10000000.0)];
    }
    if ([v4 vertexsCount])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v10 = objc_msgSend(v4, "vertexs", 0);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = [[GEOLatLngE7 alloc] initWithLatLng:*(void *)(*((void *)&v17 + 1) + 8 * v14)];
            [(GEOMapRegionE7 *)v5 addVertexE7:v15];

            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v12);
      }
    }
  }

  return v5;
}

- (GEOMapRegion)mapRegion
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_getAssociatedObject(self, &mapRegion_ComputedNonE7RegionCacheKey);
  v3 = (GEOMapRegion *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(GEOMapRegion);
    if ([(GEOMapRegionE7 *)self hasSouthLatE7]) {
      [(GEOMapRegion *)v3 setSouthLat:(double)[(GEOMapRegionE7 *)self southLatE7] * 0.0000001];
    }
    if ([(GEOMapRegionE7 *)self hasWestLngE7]) {
      [(GEOMapRegion *)v3 setWestLng:(double)[(GEOMapRegionE7 *)self westLngE7] * 0.0000001];
    }
    if ([(GEOMapRegionE7 *)self hasNorthLatE7]) {
      [(GEOMapRegion *)v3 setNorthLat:(double)[(GEOMapRegionE7 *)self northLatE7] * 0.0000001];
    }
    if ([(GEOMapRegionE7 *)self hasEastLngE7]) {
      [(GEOMapRegion *)v3 setEastLng:(double)[(GEOMapRegionE7 *)self eastLngE7] * 0.0000001];
    }
    if ([(GEOMapRegionE7 *)self vertexE7sCount])
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v4 = [(GEOMapRegionE7 *)self vertexE7s];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v4);
            }
            double v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) latLng];
            [(GEOMapRegion *)v3 addVertex:v9];
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v6);
      }
    }
    objc_setAssociatedObject(self, &mapRegion_ComputedNonE7RegionCacheKey, v3, (void *)1);
  }

  return v3;
}

- (GEOMapRegionE7)initWithLatitude:(double)a3 longitude:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)GEOMapRegionE7;
  uint64_t v6 = [(GEOMapRegionE7 *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    [(GEOMapRegionE7 *)v6 setSouthLatE7:(int)(a3 * 10000000.0)];
    [(GEOMapRegionE7 *)v7 setWestLngE7:(int)(a4 * 10000000.0)];
    [(GEOMapRegionE7 *)v7 setNorthLatE7:(int)(a3 * 10000000.0)];
    [(GEOMapRegionE7 *)v7 setEastLngE7:(int)(a4 * 10000000.0)];
  }
  return v7;
}

- (GEOMapRegionE7)initWithCoordinateRegion:(id)a3
{
  GEOMapRectForCoordinateRegion(a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);

  return -[GEOMapRegionE7 initWithMapRect:](self, "initWithMapRect:");
}

- (GEOMapRegionE7)initWithMapRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapRegionE7;
  uint64_t v7 = [(GEOMapRegionE7 *)&v10 init];
  double v8 = v7;
  if (v7) {
    -[GEOMapRegionE7 setMapRect:](v7, "setMapRect:", v6, v5, var0, var1);
  }
  return v8;
}

- (GEOMapRegionE7)initWithRadialPlace:(id)a3
{
  id v4 = a3;
  [v4 coordinate];
  double v6 = v5;
  double v8 = v7;
  [v4 radialDistance];
  double v10 = v9;

  double v11 = GEOMapRectMakeWithRadialDistance(v6, v8, v10);

  return [(GEOMapRegionE7 *)self initWithMapRect:v11];
}

- (void)setMapRect:(id)a3
{
  double var1 = a3.var1.var1;
  double v4 = a3.var0.var1;
  double v6 = a3.var0.var0 + a3.var1.var0;
  if (a3.var0.var0 >= 0.0 && v6 <= 268435456.0)
  {
    double v28 = GEOCoordinate2DForMapPoint(a3.var0.var0, a3.var0.var1);
    double v30 = v29;
    double v31 = GEOCoordinate2DForMapPoint(v6, v4 + var1);
    double v33 = v32;
    [(GEOMapRegionE7 *)self setNorthLatE7:(int)(v28 * 10000000.0)];
    [(GEOMapRegionE7 *)self setWestLngE7:(int)(v30 * 10000000.0)];
    [(GEOMapRegionE7 *)self setSouthLatE7:(int)(v31 * 10000000.0)];
    [(GEOMapRegionE7 *)self setEastLngE7:(int)(v33 * 10000000.0)];
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
      double v8 = v11;
    }
    double v34 = v8;
    double v14 = GEOMapRectIntersection(a3.var0.var0, v4, a3.var1.var0, var1, 0.0, 0.0, 268435456.0, 268435456.0);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [(GEOMapRegionE7 *)self setNorthLatE7:(int)(GEOCoordinate2DForMapPoint(v14, v15) * 10000000.0)];
    [(GEOMapRegionE7 *)self setSouthLatE7:(int)(GEOCoordinate2DForMapPoint(v14, v16 + v20) * 10000000.0)];
    if (v14 < v12) {
      double v21 = v12;
    }
    else {
      double v21 = v14;
    }
    if (v14 < v12) {
      double v22 = v13;
    }
    else {
      double v22 = v16;
    }
    if (v14 < v12) {
      double v23 = v14;
    }
    else {
      double v23 = v12;
    }
    if (v14 < v12) {
      double v24 = v16;
    }
    else {
      double v24 = v13;
    }
    double v25 = v34;
    if (v14 < v12) {
      double v25 = v18;
    }
    GEOCoordinate2DForMapPoint(v23 + v25, v24);
    [(GEOMapRegionE7 *)self setEastLngE7:(int)(v26 * 10000000.0)];
    GEOCoordinate2DForMapPoint(v21, v22);
    [(GEOMapRegionE7 *)self setWestLngE7:(int)(v27 * 10000000.0)];
  }
}

- (int)centerLatE7
{
  int v3 = [(GEOMapRegionE7 *)self southLatE7];
  uint64_t v4 = [(GEOMapRegionE7 *)self northLatE7] + (uint64_t)v3;
  return (v4 + (unint64_t)(v4 < 0)) >> 1;
}

- (int)centerLngE7
{
  int v3 = [(GEOMapRegionE7 *)self westLngE7];
  uint64_t v4 = [(GEOMapRegionE7 *)self eastLngE7] + (uint64_t)v3;
  return (v4 + (unint64_t)(v4 < 0)) >> 1;
}

- (int)spanLatE7
{
  int v3 = [(GEOMapRegionE7 *)self northLatE7];
  int v4 = v3 - [(GEOMapRegionE7 *)self southLatE7];
  if (v4 >= 0) {
    return v4;
  }
  else {
    return -v4;
  }
}

- (int)spanLngE7
{
  int v3 = [(GEOMapRegionE7 *)self eastLngE7];
  int v4 = v3 - [(GEOMapRegionE7 *)self westLngE7];
  if (v4 >= 0) {
    return v4;
  }
  else {
    return -v4;
  }
}

- (BOOL)isValid
{
  return [(GEOMapRegionE7 *)self hasRectangleVertices]
      || [(GEOMapRegionE7 *)self vertexE7sCount] != 0;
}

- (BOOL)hasRectangleVertices
{
  if (![(GEOMapRegionE7 *)self hasNorthLatE7]
    || ![(GEOMapRegionE7 *)self hasSouthLatE7]
    || ![(GEOMapRegionE7 *)self hasEastLngE7])
  {
    return 0;
  }

  return [(GEOMapRegionE7 *)self hasWestLngE7];
}

- (id)coordinatesE7
{
  if ([(GEOMapRegionE7 *)self vertexE7sCount])
  {
    int v3 = [(GEOMapRegionE7 *)self vertexE7s];
  }
  else if ([(GEOMapRegionE7 *)self hasRectangleVertices])
  {
    int v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
    int v4 = [[GEOLatLngE7 alloc] initWithE7Latitude:[(GEOMapRegionE7 *)self northLatE7] longitude:[(GEOMapRegionE7 *)self eastLngE7]];
    [v3 addObject:v4];

    double v5 = [[GEOLatLngE7 alloc] initWithE7Latitude:[(GEOMapRegionE7 *)self northLatE7] longitude:[(GEOMapRegionE7 *)self westLngE7]];
    [v3 addObject:v5];

    double v6 = [[GEOLatLngE7 alloc] initWithE7Latitude:[(GEOMapRegionE7 *)self southLatE7] longitude:[(GEOMapRegionE7 *)self westLngE7]];
    [v3 addObject:v6];

    double v7 = [[GEOLatLngE7 alloc] initWithE7Latitude:[(GEOMapRegionE7 *)self southLatE7] longitude:[(GEOMapRegionE7 *)self eastLngE7]];
    [v3 addObject:v7];
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

+ (id)_geo_mapRegionForGEOCoordinateRegion:(id)a3
{
  double var0 = a3.var0.var0;
  int v4 = 0;
  if (a3.var0.var1 >= -180.0)
  {
    double var1 = a3.var0.var1;
    if (a3.var0.var1 <= 180.0 && a3.var0.var0 >= -90.0 && a3.var0.var0 <= 90.0)
    {
      double v6 = a3.var1.var0;
      int v4 = 0;
      if (a3.var1.var0 >= 0.0 && a3.var1.var0 <= 180.0)
      {
        double v7 = a3.var1.var1;
        if (a3.var1.var1 >= 0.0 && a3.var1.var1 <= 360.0)
        {
          double v8 = [GEOMapRegionE7 alloc];
          GEOMapRectForCoordinateRegion(var0, var1, v6, v7);
          int v4 = -[GEOMapRegionE7 initWithMapRect:](v8, "initWithMapRect:");
        }
      }
    }
  }

  return v4;
}

- (int)southLatE7
{
  return self->_southLatE7;
}

- (void)setSouthLatE7:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_southLatE7 = a3;
}

- (void)setHasSouthLatE7:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSouthLatE7
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)westLngE7
{
  return self->_westLngE7;
}

- (void)setWestLngE7:(int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_westLngE7 = a3;
}

- (void)setHasWestLngE7:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasWestLngE7
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (int)northLatE7
{
  return self->_northLatE7;
}

- (void)setNorthLatE7:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_northLatE7 = a3;
}

- (void)setHasNorthLatE7:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasNorthLatE7
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)eastLngE7
{
  return self->_eastLngE7;
}

- (void)setEastLngE7:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_eastLngE7 = a3;
}

- (void)setHasEastLngE7:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEastLngE7
{
  return *(unsigned char *)&self->_flags & 1;
}

- (NSMutableArray)vertexE7s
{
  return self->_vertexE7s;
}

- (void)setVertexE7s:(id)a3
{
}

- (void)clearVertexE7s
{
}

- (void)addVertexE7:(id)a3
{
  id v4 = a3;
  vertexE7s = self->_vertexE7s;
  id v8 = v4;
  if (!vertexE7s)
  {
    double v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v7 = self->_vertexE7s;
    self->_vertexE7s = v6;

    id v4 = v8;
    vertexE7s = self->_vertexE7s;
  }
  [(NSMutableArray *)vertexE7s addObject:v4];
}

- (unint64_t)vertexE7sCount
{
  return [(NSMutableArray *)self->_vertexE7s count];
}

- (id)vertexE7AtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_vertexE7s objectAtIndex:a3];
}

+ (Class)vertexE7Type
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapRegionE7;
  id v4 = [(GEOMapRegionE7 *)&v8 description];
  double v5 = [(GEOMapRegionE7 *)self dictionaryRepresentation];
  double v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapRegionE7 _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_24;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 40);
  if ((v5 & 4) != 0)
  {
    double v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
    [v4 setObject:v6 forKey:@"southLatE7"];

    char v5 = *(unsigned char *)(a1 + 40);
  }
  if ((v5 & 8) == 0)
  {
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
LABEL_28:
    double v24 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 28)];
    [v4 setObject:v24 forKey:@"northLatE7"];

    if ((*(unsigned char *)(a1 + 40) & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  double v23 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  [v4 setObject:v23 forKey:@"westLngE7"];

  char v5 = *(unsigned char *)(a1 + 40);
  if ((v5 & 2) != 0) {
    goto LABEL_28;
  }
LABEL_6:
  if (v5)
  {
LABEL_7:
    double v7 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 24)];
    [v4 setObject:v7 forKey:@"eastLngE7"];
  }
LABEL_8:
  if ([*(id *)(a1 + 16) count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = *(id *)(a1 + 16);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (a2) {
            [v14 jsonRepresentation];
          }
          else {
          double v15 = [v14 dictionaryRepresentation];
          }
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"vertexE7"];
  }
  double v16 = *(void **)(a1 + 8);
  if (v16)
  {
    double v17 = [v16 dictionaryRepresentation];
    double v18 = v17;
    if (a2)
    {
      double v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __44__GEOMapRegionE7__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E53D8860;
      id v20 = v19;
      id v26 = v20;
      [v18 enumerateKeysAndObjectsUsingBlock:v25];
      id v21 = v20;

      double v18 = v21;
    }
    [v4 setObject:v18 forKey:@"Unknown Fields"];
  }
LABEL_24:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMapRegionE7 _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOMapRegionE7__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v7 = *(void **)(a1 + 32);
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

- (GEOMapRegionE7)initWithDictionary:(id)a3
{
  return (GEOMapRegionE7 *)-[GEOMapRegionE7 _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      double v6 = [v5 objectForKeyedSubscript:@"southLatE7"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSouthLatE7:", objc_msgSend(v6, "intValue"));
      }

      double v7 = [v5 objectForKeyedSubscript:@"westLngE7"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setWestLngE7:", objc_msgSend(v7, "intValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"northLatE7"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNorthLatE7:", objc_msgSend(v8, "intValue"));
      }

      id v9 = [v5 objectForKeyedSubscript:@"eastLngE7"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setEastLngE7:", objc_msgSend(v9, "intValue"));
      }

      id v10 = [v5 objectForKeyedSubscript:@"vertexE7"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v21 = v10;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                double v17 = [GEOLatLngE7 alloc];
                if (a3) {
                  uint64_t v18 = [(GEOLatLngE7 *)v17 initWithJSON:v16];
                }
                else {
                  uint64_t v18 = [(GEOLatLngE7 *)v17 initWithDictionary:v16];
                }
                double v19 = (void *)v18;
                [a1 addVertexE7:v18];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v13);
        }

        id v10 = v21;
      }
    }
  }

  return a1;
}

- (GEOMapRegionE7)initWithJSON:(id)a3
{
  return (GEOMapRegionE7 *)-[GEOMapRegionE7 _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapRegionE7IsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapRegionE7ReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteSfixed32Field();
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSfixed32Field();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_16:
  PBDataWriterWriteSfixed32Field();
  if (*(unsigned char *)&self->_flags) {
LABEL_5:
  }
    PBDataWriterWriteSfixed32Field();
LABEL_6:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v6 = self->_vertexE7s;
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

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = a3;
  [(GEOMapRegionE7 *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v9[8] = self->_southLatE7;
    *((unsigned char *)v9 + 40) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
LABEL_15:
      v9[7] = self->_northLatE7;
      *((unsigned char *)v9 + 40) |= 2u;
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
  v9[9] = self->_westLngE7;
  *((unsigned char *)v9 + 40) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_15;
  }
LABEL_4:
  if (flags)
  {
LABEL_5:
    v9[6] = self->_eastLngE7;
    *((unsigned char *)v9 + 40) |= 1u;
  }
LABEL_6:
  if ([(GEOMapRegionE7 *)self vertexE7sCount])
  {
    [v9 clearVertexE7s];
    unint64_t v5 = [(GEOMapRegionE7 *)self vertexE7sCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOMapRegionE7 *)self vertexE7AtIndex:i];
        [v9 addVertexE7:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (id *)v5;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_southLatE7;
    *(unsigned char *)(v5 + 40) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 36) = self->_westLngE7;
  *(unsigned char *)(v5 + 40) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_16:
  *(_DWORD *)(v5 + 28) = self->_northLatE7;
  *(unsigned char *)(v5 + 40) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_5:
    *(_DWORD *)(v5 + 24) = self->_eastLngE7;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
LABEL_6:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_vertexE7s;
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
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [v6 addVertexE7:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  objc_storeStrong(v6 + 1, self->_unknownFields);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  [(GEOMapRegionE7 *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_southLatE7 != *((_DWORD *)v4 + 8)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_24:
    char v6 = 0;
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_westLngE7 != *((_DWORD *)v4 + 9)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_northLatE7 != *((_DWORD *)v4 + 7)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_eastLngE7 != *((_DWORD *)v4 + 6)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_24;
  }
  vertexE7s = self->_vertexE7s;
  if ((unint64_t)vertexE7s | *((void *)v4 + 2)) {
    char v6 = -[NSMutableArray isEqual:](vertexE7s, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  [(GEOMapRegionE7 *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_southLatE7;
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_westLngE7;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if (*(unsigned char *)&self->_flags) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ [(NSMutableArray *)self->_vertexE7s hash];
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_northLatE7;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_eastLngE7;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSMutableArray *)self->_vertexE7s hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 4) != 0)
  {
    self->_southLatE7 = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_flags |= 4u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_westLngE7 = *((_DWORD *)v4 + 9);
  *(unsigned char *)&self->_flags |= 8u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_16:
  self->_northLatE7 = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_flags |= 2u;
  if (*((unsigned char *)v4 + 40))
  {
LABEL_5:
    self->_eastLngE7 = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_6:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 2);
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
        -[GEOMapRegionE7 addVertexE7:](self, "addVertexE7:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
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
    [(GEOMapRegionE7 *)self readAll:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = self->_vertexE7s;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vertexE7s, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end