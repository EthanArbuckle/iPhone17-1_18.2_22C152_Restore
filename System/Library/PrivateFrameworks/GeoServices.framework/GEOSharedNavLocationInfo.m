@interface GEOSharedNavLocationInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCoordinate;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMatchedCoordinateIndex;
- (BOOL)hasMatchedCoordinateOffset;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)coordinate;
- (GEOSharedNavLocationInfo)initWithDictionary:(id)a3;
- (GEOSharedNavLocationInfo)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (float)matchedCoordinateOffset;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)matchedCoordinateIndex;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setHasMatchedCoordinateIndex:(BOOL)a3;
- (void)setHasMatchedCoordinateOffset:(BOOL)a3;
- (void)setMatchedCoordinateIndex:(unsigned int)a3;
- (void)setMatchedCoordinateOffset:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSharedNavLocationInfo

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (GEOLatLng)coordinate
{
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
}

- (unsigned)matchedCoordinateIndex
{
  return self->_matchedCoordinateIndex;
}

- (void)setMatchedCoordinateIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_matchedCoordinateIndex = a3;
}

- (void)setHasMatchedCoordinateIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasMatchedCoordinateIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (float)matchedCoordinateOffset
{
  return self->_matchedCoordinateOffset;
}

- (void)setMatchedCoordinateOffset:(float)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_matchedCoordinateOffset = a3;
}

- (void)setHasMatchedCoordinateOffset:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasMatchedCoordinateOffset
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSharedNavLocationInfo;
  v4 = [(GEOSharedNavLocationInfo *)&v8 description];
  v5 = [(GEOSharedNavLocationInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSharedNavLocationInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 coordinate];
    v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"coordinate"];
    }
    char v9 = *(unsigned char *)(a1 + 32);
    if (v9)
    {
      v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
      if (a2) {
        v11 = @"matchedCoordinateIndex";
      }
      else {
        v11 = @"matched_coordinate_index";
      }
      [v4 setObject:v10 forKey:v11];

      char v9 = *(unsigned char *)(a1 + 32);
    }
    if ((v9 & 2) != 0)
    {
      LODWORD(v8) = *(_DWORD *)(a1 + 28);
      v12 = [NSNumber numberWithFloat:v8];
      if (a2) {
        v13 = @"matchedCoordinateOffset";
      }
      else {
        v13 = @"matched_coordinate_offset";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = *(void **)(a1 + 8);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __54__GEOSharedNavLocationInfo__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSharedNavLocationInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOSharedNavLocationInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    double v8 = [v5 base64EncodedStringWithOptions:0];
    char v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    double v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOSharedNavLocationInfo)initWithDictionary:(id)a3
{
  return (GEOSharedNavLocationInfo *)-[GEOSharedNavLocationInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"coordinate"];
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
        char v9 = (void *)v8;
        [a1 setCoordinate:v8];
      }
      if (a3) {
        id v10 = @"matchedCoordinateIndex";
      }
      else {
        id v10 = @"matched_coordinate_index";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMatchedCoordinateIndex:", objc_msgSend(v11, "unsignedIntValue"));
      }

      if (a3) {
        v12 = @"matchedCoordinateOffset";
      }
      else {
        v12 = @"matched_coordinate_offset";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v13 floatValue];
        objc_msgSend(a1, "setMatchedCoordinateOffset:");
      }
    }
  }

  return a1;
}

- (GEOSharedNavLocationInfo)initWithJSON:(id)a3
{
  return (GEOSharedNavLocationInfo *)-[GEOSharedNavLocationInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSharedNavLocationInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSharedNavLocationInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_coordinate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOLatLng *)self->_coordinate hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOSharedNavLocationInfo *)self readAll:0];
  if (self->_coordinate) {
    objc_msgSend(v5, "setCoordinate:");
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v5 + 6) = self->_matchedCoordinateIndex;
    *((unsigned char *)v5 + 32) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v5 + 7) = LODWORD(self->_matchedCoordinateOffset);
    *((unsigned char *)v5 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOLatLng *)self->_coordinate copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 24) = self->_matchedCoordinateIndex;
    *(unsigned char *)(v5 + 32) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(float *)(v5 + 28) = self->_matchedCoordinateOffset;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOSharedNavLocationInfo *)self readAll:1];
  [v4 readAll:1];
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((void *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](coordinate, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_matchedCoordinateIndex != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_matchedCoordinateOffset != *((float *)v4 + 7)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  [(GEOSharedNavLocationInfo *)self readAll:1];
  unint64_t v3 = [(GEOLatLng *)self->_coordinate hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v4 = 2654435761 * self->_matchedCoordinateIndex;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float matchedCoordinateOffset = self->_matchedCoordinateOffset;
  double v6 = matchedCoordinateOffset;
  if (matchedCoordinateOffset < 0.0) {
    double v6 = -matchedCoordinateOffset;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  [v7 readAll:0];
  coordinate = self->_coordinate;
  uint64_t v5 = *((void *)v7 + 2);
  if (coordinate)
  {
    if (v5) {
      -[GEOLatLng mergeFrom:](coordinate, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOSharedNavLocationInfo setCoordinate:](self, "setCoordinate:");
  }
  char v6 = *((unsigned char *)v7 + 32);
  if (v6)
  {
    self->_matchedCoordinateIndex = *((_DWORD *)v7 + 6);
    *(unsigned char *)&self->_flags |= 1u;
    char v6 = *((unsigned char *)v7 + 32);
  }
  if ((v6 & 2) != 0)
  {
    self->_float matchedCoordinateOffset = *((float *)v7 + 7);
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
    [(GEOSharedNavLocationInfo *)self readAll:0];
    coordinate = self->_coordinate;
    [(GEOLatLng *)coordinate clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinate, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end