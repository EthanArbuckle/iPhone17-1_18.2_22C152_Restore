@interface GEOWiFiQualityIndex
+ (BOOL)isValid:(id)a3;
- (BOOL)hasType;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOWiFiQualityIndex)initWithDictionary:(id)a3;
- (GEOWiFiQualityIndex)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unsigned)value;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setType:(int)a3;
- (void)setValue:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWiFiQualityIndex

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
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E1FA8[a3];
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
  else if ([v3 isEqualToString:@"POPULARITY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"QUALITY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CONFIDENCE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)value
{
  return self->_value;
}

- (void)setValue:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasValue
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiQualityIndex;
  int v4 = [(GEOWiFiQualityIndex *)&v8 description];
  v5 = [(GEOWiFiQualityIndex *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    char v3 = *(unsigned char *)(a1 + 16);
    if (v3)
    {
      uint64_t v4 = *(int *)(a1 + 8);
      if (v4 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = off_1E53E1FA8[v4];
      }
      [v2 setObject:v5 forKey:@"type"];

      char v3 = *(unsigned char *)(a1 + 16);
    }
    if ((v3 & 2) != 0)
    {
      v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 12)];
      [v2 setObject:v6 forKey:@"value"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEOWiFiQualityIndex)initWithDictionary:(id)a3
{
  return (GEOWiFiQualityIndex *)-[GEOWiFiQualityIndex _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_20;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_20;
  }
  uint64_t v4 = [v3 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"POPULARITY"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"QUALITY"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"CONFIDENCE"])
    {
      uint64_t v6 = 3;
    }
    else
    {
      uint64_t v6 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v4 intValue];
LABEL_16:
    [a1 setType:v6];
  }

  v7 = [v3 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setValue:", objc_msgSend(v7, "unsignedIntValue"));
  }

LABEL_20:
  return a1;
}

- (GEOWiFiQualityIndex)initWithJSON:(id)a3
{
  return (GEOWiFiQualityIndex *)-[GEOWiFiQualityIndex _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiQualityIndexIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiQualityIndexReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOWiFiQualityIndex *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[2] = self->_type;
    *((unsigned char *)v5 + 16) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[3] = self->_value;
    *((unsigned char *)v5 + 16) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)result + 2) = self->_type;
    *((unsigned char *)result + 16) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_value;
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOWiFiQualityIndex *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_type != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_value != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOWiFiQualityIndex *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_type;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_value;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 16);
  if (v4)
  {
    self->_type = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 16);
  }
  if ((v4 & 2) != 0)
  {
    self->_value = *((_DWORD *)v5 + 3);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

@end