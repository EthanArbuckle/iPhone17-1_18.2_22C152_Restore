@interface GEOWiFiQualitySearchTile
+ (BOOL)isValid:(id)a3;
- (BOOL)hasTileKey;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOWiFiQualitySearchTile)initWithDictionary:(id)a3;
- (GEOWiFiQualitySearchTile)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unint64_t)tileKey;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTileKey:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setTileKey:(unint64_t)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWiFiQualitySearchTile

- (unint64_t)tileKey
{
  return self->_tileKey;
}

- (void)setTileKey:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_tileKey = a3;
}

- (void)setHasTileKey:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTileKey
{
  return *(unsigned char *)&self->_flags & 1;
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
    char v3 = off_1E53E1FE0[a3];
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
  else if ([v3 isEqualToString:@"EXCLUDE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INCLUDE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiQualitySearchTile;
  int v4 = [(GEOWiFiQualitySearchTile *)&v8 description];
  v5 = [(GEOWiFiQualitySearchTile *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    char v3 = *(unsigned char *)(a1 + 20);
    if (v3)
    {
      int v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
      [v2 setObject:v4 forKey:@"tileKey"];

      char v3 = *(unsigned char *)(a1 + 20);
    }
    if ((v3 & 2) != 0)
    {
      uint64_t v5 = *(int *)(a1 + 16);
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53E1FE0[v5];
      }
      [v2 setObject:v6 forKey:@"type"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEOWiFiQualitySearchTile)initWithDictionary:(id)a3
{
  return (GEOWiFiQualitySearchTile *)-[GEOWiFiQualitySearchTile _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      int v4 = [v3 objectForKeyedSubscript:@"tileKey"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTileKey:", objc_msgSend(v4, "unsignedLongLongValue"));
      }

      uint64_t v5 = [v3 objectForKeyedSubscript:@"type"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        if ([v6 isEqualToString:@"UNKNOWN"])
        {
          uint64_t v7 = 0;
        }
        else if ([v6 isEqualToString:@"EXCLUDE"])
        {
          uint64_t v7 = 1;
        }
        else if ([v6 isEqualToString:@"INCLUDE"])
        {
          uint64_t v7 = 2;
        }
        else
        {
          uint64_t v7 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_17:

          goto LABEL_18;
        }
        uint64_t v7 = [v5 intValue];
      }
      [a1 setType:v7];
      goto LABEL_17;
    }
  }
LABEL_18:

  return a1;
}

- (GEOWiFiQualitySearchTile)initWithJSON:(id)a3
{
  return (GEOWiFiQualitySearchTile *)-[GEOWiFiQualitySearchTile _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiQualitySearchTileIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiQualitySearchTileReadAllFrom((uint64_t)self, a3);
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
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v5 = a3;
  [(GEOWiFiQualitySearchTile *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[1] = self->_tileKey;
    *((unsigned char *)v5 + 20) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_type;
    *((unsigned char *)v5 + 20) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((void *)result + 1) = self->_tileKey;
    *((unsigned char *)result + 20) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_type;
    *((unsigned char *)result + 20) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOWiFiQualitySearchTile *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_tileKey != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_type != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOWiFiQualitySearchTile *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v3 = 2654435761u * self->_tileKey;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3;
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_type;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 20);
  if (v4)
  {
    self->_tileKey = *((void *)v5 + 1);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 20);
  }
  if ((v4 & 2) != 0)
  {
    self->_type = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

@end