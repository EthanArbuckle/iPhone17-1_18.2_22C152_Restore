@interface GEOLatLng
+ (BOOL)isValid:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)gtLog;
- (BOOL)hasElevationM;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasGtLog;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)initWithDictionary:(id)a3;
- (GEOLatLng)initWithJSON:(id)a3;
- (GEOLatLng)initWithLatitude:(double)a3 longitude:(double)a4;
- (PBUnknownFields)unknownFields;
- (double)elevationM;
- (double)lat;
- (double)lng;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setElevationM:(double)a3;
- (void)setGtLog:(BOOL)a3;
- (void)setHasElevationM:(BOOL)a3;
- (void)setHasGtLog:(BOOL)a3;
- (void)setLat:(double)a3;
- (void)setLng:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLatLng

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  [(GEOLatLng *)self lat];
  double v4 = v3;
  [(GEOLatLng *)self lng];
  double v6 = v5;
  double v7 = v4;
  result.var1 = v6;
  result.var0 = v7;
  return result;
}

- (double)lng
{
  return self->_lng;
}

- (double)lat
{
  return self->_lat;
}

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  double v5 = (void *)v4;
  *(double *)(v4 + 24) = self->_lat;
  *(double *)(v4 + 32) = self->_lng;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(double *)(v4 + 16) = self->_elevationM;
    *(unsigned char *)(v4 + 44) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v4 + 40) = self->_gtLog;
    *(unsigned char *)(v4 + 44) |= 2u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (GEOLatLng)initWithLatitude:(double)a3 longitude:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)GEOLatLng;
  double v6 = [(GEOLatLng *)&v10 init];
  double v7 = v6;
  if (v6)
  {
    [(GEOLatLng *)v6 setLat:a3];
    [(GEOLatLng *)v7 setLng:a4];
    v8 = v7;
  }

  return v7;
}

- (void)setLng:(double)a3
{
  self->_lng = a3;
}

- (void)setLat:(double)a3
{
  self->_lat = a3;
}

- (void)setGtLog:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_gtLog = a3;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteDoubleField();
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (unint64_t)hash
{
  [(GEOLatLng *)self readAll:1];
  double lat = self->_lat;
  double v4 = -lat;
  if (lat >= 0.0) {
    double v4 = self->_lat;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  double lng = self->_lng;
  double v13 = -lng;
  if (lng >= 0.0) {
    double v13 = self->_lng;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  double v16 = fmod(v14, 1.84467441e19);
  unint64_t v17 = 2654435761u * (unint64_t)v16;
  unint64_t v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0) {
    unint64_t v18 = 2654435761u * (unint64_t)v16;
  }
  unint64_t v19 = v17 - (unint64_t)fabs(v15);
  if (v15 < 0.0) {
    unint64_t v20 = v19;
  }
  else {
    unint64_t v20 = v18;
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    double elevationM = self->_elevationM;
    double v24 = -elevationM;
    if (elevationM >= 0.0) {
      double v24 = self->_elevationM;
    }
    long double v25 = floor(v24 + 0.5);
    double v26 = (v24 - v25) * 1.84467441e19;
    unint64_t v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0) {
        v22 += (unint64_t)v26;
      }
      if ((flags & 2) == 0) {
        goto LABEL_26;
      }
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
      if ((flags & 2) == 0)
      {
LABEL_26:
        uint64_t v27 = 0;
        return v20 ^ v11 ^ v22 ^ v27;
      }
    }
  }
  else
  {
    unint64_t v22 = 0;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_26;
    }
  }
  uint64_t v27 = 2654435761 * self->_gtLog;
  return v20 ^ v11 ^ v22 ^ v27;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOLatLng *)self readAll:1];
  [v4 readAll:1];
  if (self->_lat != *((double *)v4 + 3) || self->_lng != *((double *)v4 + 4)) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_elevationM != *((double *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_11;
  }
  BOOL v5 = (*((unsigned char *)v4 + 44) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0)
    {
LABEL_11:
      BOOL v5 = 0;
      goto LABEL_12;
    }
    if (self->_gtLog)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (double)elevationM
{
  return self->_elevationM;
}

- (void)setElevationM:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_double elevationM = a3;
}

- (void)setHasElevationM:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasElevationM
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  double v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLatLng;
  id v4 = [(GEOLatLng *)&v8 description];
  BOOL v5 = [(GEOLatLng *)self dictionaryRepresentation];
  double v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLatLng _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    BOOL v5 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    [v4 setObject:v5 forKey:@"lat"];

    double v6 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    [v4 setObject:v6 forKey:@"lng"];

    char v7 = *(unsigned char *)(a1 + 44);
    if (v7)
    {
      objc_super v8 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
      if (a2) {
        unint64_t v9 = @"elevationM";
      }
      else {
        unint64_t v9 = @"elevation_m";
      }
      [v4 setObject:v8 forKey:v9];

      char v7 = *(unsigned char *)(a1 + 44);
    }
    if ((v7 & 2) != 0)
    {
      unint64_t v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
      [v4 setObject:v10 forKey:@"gtLog"];
    }
    unint64_t v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      double v13 = v12;
      if (a2)
      {
        long double v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __39__GEOLatLng__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        double v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLatLng _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __39__GEOLatLng__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    unint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOLatLng)initWithDictionary:(id)a3
{
  return (GEOLatLng *)-[GEOLatLng _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      double v6 = [v5 objectForKeyedSubscript:@"lat"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 doubleValue];
        objc_msgSend(a1, "setLat:");
      }

      char v7 = [v5 objectForKeyedSubscript:@"lng"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 doubleValue];
        objc_msgSend(a1, "setLng:");
      }

      if (a3) {
        objc_super v8 = @"elevationM";
      }
      else {
        objc_super v8 = @"elevation_m";
      }
      unint64_t v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 doubleValue];
        objc_msgSend(a1, "setElevationM:");
      }

      id v10 = [v5 objectForKeyedSubscript:@"gtLog"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setGtLog:", objc_msgSend(v10, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOLatLng)initWithJSON:(id)a3
{
  return (GEOLatLng *)-[GEOLatLng _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLatLngIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLatLngReadAllFrom((uint64_t)self, a3);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return (*(unsigned char *)&self->_flags & 2) != 0 && self->_gtLog == a3;
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLatLng *)self readAll:0];
  v5[3] = *(void *)&self->_lat;
  v5[4] = *(void *)&self->_lng;
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[2] = *(void *)&self->_elevationM;
    *((unsigned char *)v5 + 44) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v5 + 40) = self->_gtLog;
    *((unsigned char *)v5 + 44) |= 2u;
  }
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  self->_double lat = *((double *)v5 + 3);
  self->_double lng = *((double *)v5 + 4);
  char v4 = *((unsigned char *)v5 + 44);
  if (v4)
  {
    self->_double elevationM = *((double *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 44);
  }
  if ((v4 & 2) != 0)
  {
    self->_gtLog = *((unsigned char *)v5 + 40);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOLatLng *)self readAll:0];
  }
}

- (BOOL)gtLog
{
  return self->_gtLog;
}

- (void)setHasGtLog:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasGtLog
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

@end