@interface GEORestrictedZoneId
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBoundingBox;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIdentifier;
- (BOOL)hasType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapRegion)boundingBox;
- (GEORestrictedZoneId)initWithDictionary:(id)a3;
- (GEORestrictedZoneId)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unint64_t)identifier;
- (unsigned)version;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBoundingBox:(id)a3;
- (void)setHasIdentifier:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setType:(int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORestrictedZoneId

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasIdentifier
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)type
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E04D0[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONGESTION_ZONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LICENSE_PLATE_RESTRICTION"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasBoundingBox
{
  return self->_boundingBox != 0;
}

- (GEOMapRegion)boundingBox
{
  return self->_boundingBox;
}

- (void)setBoundingBox:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORestrictedZoneId;
  int v4 = [(GEORestrictedZoneId *)&v8 description];
  v5 = [(GEORestrictedZoneId *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORestrictedZoneId _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_21;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 40);
  if (v5)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
    [v4 setObject:v6 forKey:@"identifier"];

    char v5 = *(unsigned char *)(a1 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0) {
        goto LABEL_12;
      }
LABEL_8:
      uint64_t v8 = *(int *)(a1 + 32);
      if (v8 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E53E04D0[v8];
      }
      [v4 setObject:v9 forKey:@"type"];

      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)(a1 + 40) & 4) == 0)
  {
    goto LABEL_4;
  }
  v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 36)];
  [v4 setObject:v7 forKey:@"version"];

  if ((*(unsigned char *)(a1 + 40) & 2) != 0) {
    goto LABEL_8;
  }
LABEL_12:
  v10 = [(id)a1 boundingBox];
  v11 = v10;
  if (v10)
  {
    if (a2)
    {
      v12 = [v10 jsonRepresentation];
      v13 = @"boundingBox";
    }
    else
    {
      v12 = [v10 dictionaryRepresentation];
      v13 = @"bounding_box";
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
      v21[2] = __49__GEORestrictedZoneId__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E53D8860;
      id v18 = v17;
      id v22 = v18;
      [v16 enumerateKeysAndObjectsUsingBlock:v21];
      id v19 = v18;

      v16 = v19;
    }
    [v4 setObject:v16 forKey:@"Unknown Fields"];
  }
LABEL_21:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORestrictedZoneId _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEORestrictedZoneId__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORestrictedZoneId)initWithDictionary:(id)a3
{
  return (GEORestrictedZoneId *)-[GEORestrictedZoneId _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_28;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_28;
  }
  v6 = [v5 objectForKeyedSubscript:@"identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIdentifier:", objc_msgSend(v6, "unsignedLongLongValue"));
  }

  v7 = [v5 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setVersion:", objc_msgSend(v7, "unsignedIntValue"));
  }

  uint64_t v8 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if ([v9 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v10 = 0;
    }
    else if ([v9 isEqualToString:@"CONGESTION_ZONE"])
    {
      uint64_t v10 = 1;
    }
    else if ([v9 isEqualToString:@"LICENSE_PLATE_RESTRICTION"])
    {
      uint64_t v10 = 2;
    }
    else
    {
      uint64_t v10 = 0;
    }

    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v8 intValue];
LABEL_18:
    [a1 setType:v10];
  }

  if (a3) {
    v11 = @"boundingBox";
  }
  else {
    v11 = @"bounding_box";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [GEOMapRegion alloc];
    if (a3) {
      uint64_t v14 = [(GEOMapRegion *)v13 initWithJSON:v12];
    }
    else {
      uint64_t v14 = [(GEOMapRegion *)v13 initWithDictionary:v12];
    }
    v15 = (void *)v14;
    [a1 setBoundingBox:v14];
  }
LABEL_28:

  return a1;
}

- (GEORestrictedZoneId)initWithJSON:(id)a3
{
  return (GEORestrictedZoneId *)-[GEORestrictedZoneId _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORestrictedZoneIdIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORestrictedZoneIdReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_boundingBox)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOMapRegion *)self->_boundingBox hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEORestrictedZoneId *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if (flags)
  {
    *((void *)v6 + 3) = self->_identifier;
    *((unsigned char *)v6 + 40) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 9) = self->_version;
  *((unsigned char *)v6 + 40) |= 4u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v6 + 8) = self->_type;
    *((unsigned char *)v6 + 40) |= 2u;
  }
LABEL_5:
  if (self->_boundingBox)
  {
    objc_msgSend(v6, "setBoundingBox:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 36) = self->_version;
    *(unsigned char *)(v5 + 40) |= 4u;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 24) = self->_identifier;
  *(unsigned char *)(v5 + 40) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 32) = self->_type;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
LABEL_5:
  id v8 = [(GEOMapRegion *)self->_boundingBox copyWithZone:a3];
  id v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEORestrictedZoneId *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_identifier != *((void *)v4 + 3)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_19:
    char v6 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_version != *((_DWORD *)v4 + 9)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_19;
  }
  boundingBox = self->_boundingBox;
  if ((unint64_t)boundingBox | *((void *)v4 + 2)) {
    char v6 = -[GEOMapRegion isEqual:](boundingBox, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  [(GEORestrictedZoneId *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(GEOMapRegion *)self->_boundingBox hash];
  }
  unint64_t v3 = 2654435761u * self->_identifier;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_version;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_type;
  return v4 ^ v3 ^ v5 ^ [(GEOMapRegion *)self->_boundingBox hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  uint64_t v4 = v8;
  char v5 = *((unsigned char *)v8 + 40);
  if (v5)
  {
    self->_identifier = *((void *)v8 + 3);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v8 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v8 + 40) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_version = *((_DWORD *)v8 + 9);
  *(unsigned char *)&self->_flags |= 4u;
  if ((*((unsigned char *)v8 + 40) & 2) != 0)
  {
LABEL_4:
    self->_type = *((_DWORD *)v8 + 8);
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_5:
  boundingBox = self->_boundingBox;
  uint64_t v7 = *((void *)v8 + 2);
  if (boundingBox)
  {
    if (!v7) {
      goto LABEL_14;
    }
    -[GEOMapRegion mergeFrom:](boundingBox, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_14;
    }
    -[GEORestrictedZoneId setBoundingBox:](self, "setBoundingBox:");
  }
  uint64_t v4 = v8;
LABEL_14:
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
    [(GEORestrictedZoneId *)self readAll:0];
    boundingBox = self->_boundingBox;
    [(GEOMapRegion *)boundingBox clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingBox, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end