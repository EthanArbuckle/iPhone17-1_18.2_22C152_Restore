@interface GEOAdvisoryCardAction
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocation;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAdvisoryCardAction)initWithDictionary:(id)a3;
- (GEOAdvisoryCardAction)initWithJSON:(id)a3;
- (GEOLatLng)location;
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
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAdvisoryCardAction

- (int)type
{
  if (*(unsigned char *)&self->_flags) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"ADVISORY_CARD_ACTION_DOWNLOAD_OFFLINE_MAP";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"ADVISORY_CARD_ACTION_NONE";
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ADVISORY_CARD_ACTION_NONE"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"ADVISORY_CARD_ACTION_DOWNLOAD_OFFLINE_MAP"];
  }

  return v4;
}

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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAdvisoryCardAction;
  int v4 = [(GEOAdvisoryCardAction *)&v8 description];
  v5 = [(GEOAdvisoryCardAction *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAdvisoryCardAction _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 28))
    {
      int v5 = *(_DWORD *)(a1 + 24);
      if (v5)
      {
        if (v5 == 1)
        {
          v6 = @"ADVISORY_CARD_ACTION_DOWNLOAD_OFFLINE_MAP";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 24));
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v6 = @"ADVISORY_CARD_ACTION_NONE";
      }
      [v4 setObject:v6 forKey:@"type"];
    }
    v7 = [(id)a1 location];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"location"];
    }
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      v11 = [v10 dictionaryRepresentation];
      v12 = v11;
      if (a2)
      {
        v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __51__GEOAdvisoryCardAction__dictionaryRepresentation___block_invoke;
        v17[3] = &unk_1E53D8860;
        id v14 = v13;
        id v18 = v14;
        [v12 enumerateKeysAndObjectsUsingBlock:v17];
        id v15 = v14;

        v12 = v15;
      }
      [v4 setObject:v12 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAdvisoryCardAction _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOAdvisoryCardAction__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOAdvisoryCardAction)initWithDictionary:(id)a3
{
  return (GEOAdvisoryCardAction *)-[GEOAdvisoryCardAction _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_17;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_17;
  }
  v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"ADVISORY_CARD_ACTION_NONE"]) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = [v7 isEqualToString:@"ADVISORY_CARD_ACTION_DOWNLOAD_OFFLINE_MAP"];
    }

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_10:
    [a1 setType:v8];
  }

  v9 = [v5 objectForKeyedSubscript:@"location"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v11 = [(GEOLatLng *)v10 initWithJSON:v9];
    }
    else {
      uint64_t v11 = [(GEOLatLng *)v10 initWithDictionary:v9];
    }
    v12 = (void *)v11;
    [a1 setLocation:v11];
  }
LABEL_17:

  return a1;
}

- (GEOAdvisoryCardAction)initWithJSON:(id)a3
{
  return (GEOAdvisoryCardAction *)-[GEOAdvisoryCardAction _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAdvisoryCardActionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAdvisoryCardActionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOLatLng *)self->_location hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOAdvisoryCardAction *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 6) = self->_type;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  if (self->_location)
  {
    objc_msgSend(v5, "setLocation:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_type;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  id v7 = [(GEOLatLng *)self->_location copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEOAdvisoryCardAction *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 2)) {
    char v6 = -[GEOLatLng isEqual:](location, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEOAdvisoryCardAction *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(GEOLatLng *)self->_location hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v7 = (int *)a3;
  [v7 readAll:0];
  id v4 = v7;
  if (v7[7])
  {
    self->_type = v7[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
  location = self->_location;
  uint64_t v6 = *((void *)v7 + 2);
  if (location)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOLatLng mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOAdvisoryCardAction setLocation:](self, "setLocation:");
  }
  id v4 = v7;
LABEL_9:
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
    [(GEOAdvisoryCardAction *)self readAll:0];
    location = self->_location;
    [(GEOLatLng *)location clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end