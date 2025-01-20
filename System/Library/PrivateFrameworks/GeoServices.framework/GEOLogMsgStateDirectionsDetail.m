@interface GEOLogMsgStateDirectionsDetail
+ (BOOL)isValid:(id)a3;
- (BOOL)hasIsEv;
- (BOOL)hasTransportType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEv;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateDirectionsDetail)initWithDictionary:(id)a3;
- (GEOLogMsgStateDirectionsDetail)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)transportTypeAsString:(int)a3;
- (int)StringAsTransportType:(id)a3;
- (int)transportType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsEv:(BOOL)a3;
- (void)setHasTransportType:(BOOL)a3;
- (void)setIsEv:(BOOL)a3;
- (void)setTransportType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateDirectionsDetail

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_32;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_32;
  }
  if (a3) {
    v6 = @"transportType";
  }
  else {
    v6 = @"transport_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"AUTOMOBILE"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"TRANSIT"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"WALKING"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"BICYCLE"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"FERRY"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"RIDESHARE"])
    {
      uint64_t v9 = 6;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_25:
    [a1 setTransportType:v9];
  }

  if (a3) {
    v10 = @"isEv";
  }
  else {
    v10 = @"is_ev";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsEv:", objc_msgSend(v11, "BOOLValue"));
  }

LABEL_32:
  return a1;
}

- (int)transportType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_transportType;
  }
  else {
    return 0;
  }
}

- (void)setTransportType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTransportType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F8018[a3];
  }

  return v3;
}

- (int)StringAsTransportType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOMOBILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BICYCLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isEv
{
  return self->_isEv;
}

- (void)setIsEv:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_isEv = a3;
}

- (void)setHasIsEv:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsEv
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateDirectionsDetail;
  int v4 = [(GEOLogMsgStateDirectionsDetail *)&v8 description];
  id v5 = [(GEOLogMsgStateDirectionsDetail *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateDirectionsDetail _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 16);
    if (v5)
    {
      uint64_t v6 = *(int *)(a1 + 8);
      if (v6 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53F8018[v6];
      }
      if (a2) {
        objc_super v8 = @"transportType";
      }
      else {
        objc_super v8 = @"transport_type";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 16);
    }
    if ((v5 & 2) != 0)
    {
      uint64_t v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 12)];
      if (a2) {
        v10 = @"isEv";
      }
      else {
        v10 = @"is_ev";
      }
      [v4 setObject:v9 forKey:v10];
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
  return -[GEOLogMsgStateDirectionsDetail _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateDirectionsDetail)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateDirectionsDetail *)-[GEOLogMsgStateDirectionsDetail _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOLogMsgStateDirectionsDetail)initWithJSON:(id)a3
{
  return (GEOLogMsgStateDirectionsDetail *)-[GEOLogMsgStateDirectionsDetail _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateDirectionsDetailIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateDirectionsDetailReadAllFrom((uint64_t)self, a3);
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
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  char v5 = a3;
  [(GEOLogMsgStateDirectionsDetail *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[2] = self->_transportType;
    *((unsigned char *)v5 + 16) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v5 + 12) = self->_isEv;
    *((unsigned char *)v5 + 16) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)result + 2) = self->_transportType;
    *((unsigned char *)result + 16) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((unsigned char *)result + 12) = self->_isEv;
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEOLogMsgStateDirectionsDetail *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_transportType != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
    goto LABEL_9;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0)
    {
LABEL_9:
      BOOL v5 = 0;
      goto LABEL_10;
    }
    if (self->_isEv)
    {
      if (!*((unsigned char *)v4 + 12)) {
        goto LABEL_9;
      }
    }
    else if (*((unsigned char *)v4 + 12))
    {
      goto LABEL_9;
    }
    BOOL v5 = 1;
  }
LABEL_10:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateDirectionsDetail *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_transportType;
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
  uint64_t v4 = 2654435761 * self->_isEv;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 16);
  if (v4)
  {
    self->_transportType = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 16);
  }
  if ((v4 & 2) != 0)
  {
    self->_isEv = *((unsigned char *)v5 + 12);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

@end