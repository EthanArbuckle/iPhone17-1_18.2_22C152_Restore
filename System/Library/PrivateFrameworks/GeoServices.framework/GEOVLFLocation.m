@interface GEOVLFLocation
+ (BOOL)isValid:(id)a3;
- (BOOL)hasEcefLocation;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHeading;
- (BOOL)hasHorizontalAccuracy;
- (BOOL)hasIsFused;
- (BOOL)hasLocation;
- (BOOL)hasType;
- (BOOL)hasVerticalAccuracy;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFused;
- (BOOL)readFrom:(id)a3;
- (GEOECEFCoordinate)ecefLocation;
- (GEOLatLng)location;
- (GEOVLFLocation)initWithDictionary:(id)a3;
- (GEOVLFLocation)initWithJSON:(id)a3;
- (double)heading;
- (double)horizontalAccuracy;
- (double)verticalAccuracy;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEcefLocation:(GEOECEFCoordinate *)a3;
- (void)setHasEcefLocation:(BOOL)a3;
- (void)setHasHeading:(BOOL)a3;
- (void)setHasHorizontalAccuracy:(BOOL)a3;
- (void)setHasIsFused:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasVerticalAccuracy:(BOOL)a3;
- (void)setHeading:(double)a3;
- (void)setHorizontalAccuracy:(double)a3;
- (void)setIsFused:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setType:(int)a3;
- (void)setVerticalAccuracy:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFLocation

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLatLng)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (GEOECEFCoordinate)ecefLocation
{
  long long v3 = *(_OWORD *)&self->_has;
  *(_OWORD *)&retstr->_x = *(_OWORD *)&self->_y;
  *(_OWORD *)&retstr->_z = v3;
  return self;
}

- (void)setEcefLocation:(GEOECEFCoordinate *)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  long long v3 = *(_OWORD *)&a3->_z;
  *(_OWORD *)&self->_ecefLocation._x = *(_OWORD *)&a3->_x;
  *(_OWORD *)&self->_ecefLocation._z = v3;
}

- (void)setHasEcefLocation:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEcefLocation
{
  return *(unsigned char *)&self->_flags & 1;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_horizontalAccuracy = a3;
}

- (void)setHasHorizontalAccuracy:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasHorizontalAccuracy
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(double)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_verticalAccuracy = a3;
}

- (void)setHasVerticalAccuracy:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasVerticalAccuracy
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (double)heading
{
  return self->_heading;
}

- (void)setHeading:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_heading = a3;
}

- (void)setHasHeading:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHeading
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)type
{
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F8E28[a3 - 1];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GPS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WIFI"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CELL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"IP_ADDRESS"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)isFused
{
  return self->_isFused;
}

- (void)setIsFused:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_isFused = a3;
}

- (void)setHasIsFused:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasIsFused
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLFLocation;
  int v4 = [(GEOVLFLocation *)&v8 description];
  v5 = [(GEOVLFLocation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFLocation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_26;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 location];
  v6 = v5;
  if (v5)
  {
    if (a2) {
      [v5 jsonRepresentation];
    }
    else {
    v7 = [v5 dictionaryRepresentation];
    }
    [v4 setObject:v7 forKey:@"location"];
  }
  char v8 = *(unsigned char *)(a1 + 80);
  if (v8)
  {
    v9 = _GEOECEFCoordinateDictionaryRepresentation(a1 + 8);
    [v4 setObject:v9 forKey:@"ecefLocation"];

    char v8 = *(unsigned char *)(a1 + 80);
  }
  if ((v8 & 4) != 0)
  {
    v10 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
    [v4 setObject:v10 forKey:@"horizontalAccuracy"];

    char v8 = *(unsigned char *)(a1 + 80);
    if ((v8 & 8) == 0)
    {
LABEL_11:
      if ((v8 & 2) == 0) {
        goto LABEL_12;
      }
      goto LABEL_17;
    }
  }
  else if ((v8 & 8) == 0)
  {
    goto LABEL_11;
  }
  v11 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  [v4 setObject:v11 forKey:@"verticalAccuracy"];

  char v8 = *(unsigned char *)(a1 + 80);
  if ((v8 & 2) == 0)
  {
LABEL_12:
    if ((v8 & 0x10) == 0) {
      goto LABEL_13;
    }
LABEL_18:
    unsigned int v13 = *(_DWORD *)(a1 + 72) - 1;
    if (v13 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 72));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E53F8E28[v13];
    }
    [v4 setObject:v14 forKey:@"type"];

    if ((*(unsigned char *)(a1 + 80) & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_22;
  }
LABEL_17:
  v12 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v4 setObject:v12 forKey:@"heading"];

  char v8 = *(unsigned char *)(a1 + 80);
  if ((v8 & 0x10) != 0) {
    goto LABEL_18;
  }
LABEL_13:
  if ((v8 & 0x20) != 0)
  {
LABEL_22:
    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 76)];
    if (a2) {
      v16 = @"isFused";
    }
    else {
      v16 = @"is_fused";
    }
    [v4 setObject:v15 forKey:v16];
  }
LABEL_26:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFLocation _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFLocation)initWithDictionary:(id)a3
{
  return (GEOVLFLocation *)-[GEOVLFLocation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_36;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_36;
  }
  v6 = [v5 objectForKeyedSubscript:@"location"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v8 = [(GEOLatLng *)v7 initWithJSON:v6];
    }
    else {
      uint64_t v8 = [(GEOLatLng *)v7 initWithDictionary:v6];
    }
    v9 = (void *)v8;
    [a1 setLocation:v8];
  }
  v10 = [v5 objectForKeyedSubscript:@"ecefLocation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v21 = 0u;
    long long v22 = 0u;
    _GEOECEFCoordinateFromDictionaryRepresentation(v10, (uint64_t)&v21);
    v20[0] = v21;
    v20[1] = v22;
    [a1 setEcefLocation:v20];
  }

  v11 = [v5 objectForKeyedSubscript:@"horizontalAccuracy"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 doubleValue];
    objc_msgSend(a1, "setHorizontalAccuracy:");
  }

  v12 = [v5 objectForKeyedSubscript:@"verticalAccuracy"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v12 doubleValue];
    objc_msgSend(a1, "setVerticalAccuracy:");
  }

  unsigned int v13 = [v5 objectForKeyedSubscript:@"heading"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v13 doubleValue];
    objc_msgSend(a1, "setHeading:");
  }

  v14 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    if ([v15 isEqualToString:@"GPS"])
    {
      uint64_t v16 = 1;
    }
    else if ([v15 isEqualToString:@"WIFI"])
    {
      uint64_t v16 = 2;
    }
    else if ([v15 isEqualToString:@"CELL"])
    {
      uint64_t v16 = 3;
    }
    else if ([v15 isEqualToString:@"IP_ADDRESS"])
    {
      uint64_t v16 = 4;
    }
    else
    {
      uint64_t v16 = 1;
    }

    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v14 intValue];
LABEL_29:
    [a1 setType:v16];
  }

  if (a3) {
    v17 = @"isFused";
  }
  else {
    v17 = @"is_fused";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsFused:", objc_msgSend(v18, "BOOLValue"));
  }

LABEL_36:
  return a1;
}

- (GEOVLFLocation)initWithJSON:(id)a3
{
  return (GEOVLFLocation *)-[GEOVLFLocation _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFLocationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFLocationReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_location) {
    PBDataWriterWriteSubmessage();
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterPlaceMark();
    GEOECEFCoordinateWriteTo((uint64_t)&self->_ecefLocation);
    PBDataWriterRecallMark();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0) {
      goto LABEL_8;
    }
LABEL_15:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_flags & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_14:
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_15;
  }
LABEL_8:
  if ((flags & 0x20) != 0) {
LABEL_9:
  }
    PBDataWriterWriteBOOLField();
LABEL_10:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOLatLng *)self->_location hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  v6 = (char *)a3;
  [(GEOVLFLocation *)self readAll:0];
  if (self->_location) {
    objc_msgSend(v6, "setLocation:");
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    long long v5 = *(_OWORD *)&self->_ecefLocation._z;
    *(_OWORD *)(v6 + 8) = *(_OWORD *)&self->_ecefLocation._x;
    *(_OWORD *)(v6 + 24) = v5;
    v6[80] |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v6 + 6) = *(void *)&self->_horizontalAccuracy;
  v6[80] |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)v6 + 8) = *(void *)&self->_verticalAccuracy;
  v6[80] |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)v6 + 5) = *(void *)&self->_heading;
  v6[80] |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_8:
    if ((flags & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)v6 + 18) = self->_type;
  v6[80] |= 0x10u;
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
LABEL_9:
    v6[76] = self->_isFused;
    v6[80] |= 0x20u;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOLatLng *)self->_location copyWithZone:a3];
  v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  char flags = (char)self->_flags;
  if (flags)
  {
    long long v10 = *(_OWORD *)&self->_ecefLocation._z;
    *(_OWORD *)(v5 + 8) = *(_OWORD *)&self->_ecefLocation._x;
    *(_OWORD *)(v5 + 24) = v10;
    *(unsigned char *)(v5 + 80) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 48) = self->_horizontalAccuracy;
  *(unsigned char *)(v5 + 80) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *(double *)(v5 + 64) = self->_verticalAccuracy;
  *(unsigned char *)(v5 + 80) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    *(_DWORD *)(v5 + 72) = self->_type;
    *(unsigned char *)(v5 + 80) |= 0x10u;
    if ((*(unsigned char *)&self->_flags & 0x20) == 0) {
      return (id)v5;
    }
    goto LABEL_7;
  }
LABEL_12:
  *(double *)(v5 + 40) = self->_heading;
  *(unsigned char *)(v5 + 80) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if ((flags & 0x20) != 0)
  {
LABEL_7:
    *(unsigned char *)(v5 + 76) = self->_isFused;
    *(unsigned char *)(v5 + 80) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  [(GEOVLFLocation *)self readAll:1];
  [v4 readAll:1];
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 7))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:")) {
      goto LABEL_41;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0) {
      goto LABEL_41;
    }
    BOOL v6 = *(void *)&self->_ecefLocation._x == *((void *)v4 + 1)
      && *(void *)&self->_ecefLocation._y == *((void *)v4 + 2);
    BOOL v7 = v6 && *(void *)&self->_ecefLocation._z == *((void *)v4 + 3);
    if (!v7 || *(void *)&self->_ecefLocation._has != *((void *)v4 + 4)) {
      goto LABEL_41;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_horizontalAccuracy != *((double *)v4 + 6)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 8) == 0 || self->_verticalAccuracy != *((double *)v4 + 8)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 8) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_heading != *((double *)v4 + 5)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 18)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  BOOL v9 = (*((unsigned char *)v4 + 80) & 0x20) == 0;
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 0x20) == 0)
    {
LABEL_41:
      BOOL v9 = 0;
      goto LABEL_42;
    }
    if (self->_isFused)
    {
      if (!*((unsigned char *)v4 + 76)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)v4 + 76))
    {
      goto LABEL_41;
    }
    BOOL v9 = 1;
  }
LABEL_42:

  return v9;
}

- (unint64_t)hash
{
  [(GEOVLFLocation *)self readAll:1];
  unint64_t v3 = [(GEOLatLng *)self->_location hash];
  char flags = (char)self->_flags;
  if (flags)
  {
    uint64_t v5 = PBHashBytes();
    char flags = (char)self->_flags;
  }
  else
  {
    uint64_t v5 = 0;
  }
  if ((flags & 4) != 0)
  {
    double horizontalAccuracy = self->_horizontalAccuracy;
    double v8 = -horizontalAccuracy;
    if (horizontalAccuracy >= 0.0) {
      double v8 = self->_horizontalAccuracy;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((flags & 8) != 0)
  {
    double verticalAccuracy = self->_verticalAccuracy;
    double v13 = -verticalAccuracy;
    if (verticalAccuracy >= 0.0) {
      double v13 = self->_verticalAccuracy;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if ((flags & 2) != 0)
  {
    double heading = self->_heading;
    double v18 = -heading;
    if (heading >= 0.0) {
      double v18 = self->_heading;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  if ((flags & 0x10) != 0)
  {
    uint64_t v21 = 2654435761 * self->_type;
    if ((flags & 0x20) != 0) {
      goto LABEL_30;
    }
LABEL_32:
    uint64_t v22 = 0;
    return v5 ^ v3 ^ v6 ^ v11 ^ v16 ^ v21 ^ v22;
  }
  uint64_t v21 = 0;
  if ((flags & 0x20) == 0) {
    goto LABEL_32;
  }
LABEL_30:
  uint64_t v22 = 2654435761 * self->_isFused;
  return v5 ^ v3 ^ v6 ^ v11 ^ v16 ^ v21 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  double v8 = (char *)a3;
  [v8 readAll:0];
  location = self->_location;
  uint64_t v5 = *((void *)v8 + 7);
  if (location)
  {
    if (v5) {
      -[GEOLatLng mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOVLFLocation setLocation:](self, "setLocation:");
  }
  char v6 = v8[80];
  if (v6)
  {
    long long v7 = *(_OWORD *)(v8 + 24);
    *(_OWORD *)&self->_ecefLocation._x = *(_OWORD *)(v8 + 8);
    *(_OWORD *)&self->_ecefLocation._z = v7;
    *(unsigned char *)&self->_flags |= 1u;
    char v6 = v8[80];
    if ((v6 & 4) == 0)
    {
LABEL_8:
      if ((v6 & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_18;
    }
  }
  else if ((v8[80] & 4) == 0)
  {
    goto LABEL_8;
  }
  self->_double horizontalAccuracy = *((double *)v8 + 6);
  *(unsigned char *)&self->_flags |= 4u;
  char v6 = v8[80];
  if ((v6 & 8) == 0)
  {
LABEL_9:
    if ((v6 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_double verticalAccuracy = *((double *)v8 + 8);
  *(unsigned char *)&self->_flags |= 8u;
  char v6 = v8[80];
  if ((v6 & 2) == 0)
  {
LABEL_10:
    if ((v6 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_double heading = *((double *)v8 + 5);
  *(unsigned char *)&self->_flags |= 2u;
  char v6 = v8[80];
  if ((v6 & 0x10) == 0)
  {
LABEL_11:
    if ((v6 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_20:
  self->_type = *((_DWORD *)v8 + 18);
  *(unsigned char *)&self->_flags |= 0x10u;
  if ((v8[80] & 0x20) != 0)
  {
LABEL_12:
    self->_isFused = v8[76];
    *(unsigned char *)&self->_flags |= 0x20u;
  }
LABEL_13:
}

- (void).cxx_destruct
{
}

@end