@interface GEOPDPlaceSummaryLayoutUnitAddress
+ (BOOL)isValid:(id)a3;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceSummaryLayoutUnitAddress)initWithDictionary:(id)a3;
- (GEOPDPlaceSummaryLayoutUnitAddress)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceSummaryLayoutUnitAddress

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
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E63D8[a3];
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
  else if ([v3 isEqualToString:@"NAME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CITY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SHORT_ADDRESS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CLIENT_RESOLVED"])
  {
    int v4 = 4;
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
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutUnitAddress;
  int v4 = [(GEOPDPlaceSummaryLayoutUnitAddress *)&v8 description];
  v5 = [(GEOPDPlaceSummaryLayoutUnitAddress *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 12))
    {
      uint64_t v3 = *(int *)(a1 + 8);
      if (v3 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        int v4 = off_1E53E63D8[v3];
      }
      [v2 setObject:v4 forKey:@"type"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEOPDPlaceSummaryLayoutUnitAddress)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitAddress *)-[GEOPDPlaceSummaryLayoutUnitAddress _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      int v4 = [v3 objectForKeyedSubscript:@"type"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = v4;
        if ([v5 isEqualToString:@"UNKNOWN"])
        {
          uint64_t v6 = 0;
        }
        else if ([v5 isEqualToString:@"NAME"])
        {
          uint64_t v6 = 1;
        }
        else if ([v5 isEqualToString:@"CITY"])
        {
          uint64_t v6 = 2;
        }
        else if ([v5 isEqualToString:@"SHORT_ADDRESS"])
        {
          uint64_t v6 = 3;
        }
        else if ([v5 isEqualToString:@"CLIENT_RESOLVED"])
        {
          uint64_t v6 = 4;
        }
        else
        {
          uint64_t v6 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_19:

          goto LABEL_20;
        }
        uint64_t v6 = [v4 intValue];
      }
      [a1 setType:v6];
      goto LABEL_19;
    }
  }
LABEL_20:

  return a1;
}

- (GEOPDPlaceSummaryLayoutUnitAddress)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitAddress *)-[GEOPDPlaceSummaryLayoutUnitAddress _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitAddressIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitAddressReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  [(GEOPDPlaceSummaryLayoutUnitAddress *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[2] = self->_type;
    *((unsigned char *)v4 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)result + 2) = self->_type;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  [(GEOPDPlaceSummaryLayoutUnitAddress *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_type == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    return 2654435761 * self->_type;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  id v4 = (int *)a3;
  [v4 readAll:0];
  if (v4[3])
  {
    self->_type = v4[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end