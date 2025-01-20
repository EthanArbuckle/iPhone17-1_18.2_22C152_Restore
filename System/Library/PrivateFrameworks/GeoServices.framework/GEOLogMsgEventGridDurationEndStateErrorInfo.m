@interface GEOLogMsgEventGridDurationEndStateErrorInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCount;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventGridDurationEndStateErrorInfo)initWithDictionary:(id)a3;
- (GEOLogMsgEventGridDurationEndStateErrorInfo)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unsigned)count;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCount:(unsigned int)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventGridDurationEndStateErrorInfo

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(unsigned char *)&self->_flags & 1;
}

- (int)type
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_type;
  }
  else {
    return 1;
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
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7920[a3 - 1];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ERROR_TYPE_UNKNOWN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ERROR_TYPE_NO_NETWORK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ERROR_TYPE_TIMEOUT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ERROR_TYPE_LOST_CONNECTIVITY"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventGridDurationEndStateErrorInfo;
  int v4 = [(GEOLogMsgEventGridDurationEndStateErrorInfo *)&v8 description];
  v5 = [(GEOLogMsgEventGridDurationEndStateErrorInfo *)self dictionaryRepresentation];
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
      int v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 8)];
      [v2 setObject:v4 forKey:@"count"];

      char v3 = *(unsigned char *)(a1 + 16);
    }
    if ((v3 & 2) != 0)
    {
      unsigned int v5 = *(_DWORD *)(a1 + 12) - 1;
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 12));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53F7920[v5];
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

- (GEOLogMsgEventGridDurationEndStateErrorInfo)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventGridDurationEndStateErrorInfo *)-[GEOLogMsgEventGridDurationEndStateErrorInfo _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      int v4 = [v3 objectForKeyedSubscript:@"count"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCount:", objc_msgSend(v4, "unsignedIntValue"));
      }

      unsigned int v5 = [v3 objectForKeyedSubscript:@"type"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        if ([v6 isEqualToString:@"ERROR_TYPE_UNKNOWN"])
        {
          uint64_t v7 = 1;
        }
        else if ([v6 isEqualToString:@"ERROR_TYPE_NO_NETWORK"])
        {
          uint64_t v7 = 2;
        }
        else if ([v6 isEqualToString:@"ERROR_TYPE_TIMEOUT"])
        {
          uint64_t v7 = 3;
        }
        else if ([v6 isEqualToString:@"ERROR_TYPE_LOST_CONNECTIVITY"])
        {
          uint64_t v7 = 4;
        }
        else
        {
          uint64_t v7 = 1;
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
        uint64_t v7 = [v5 intValue];
      }
      [a1 setType:v7];
      goto LABEL_19;
    }
  }
LABEL_20:

  return a1;
}

- (GEOLogMsgEventGridDurationEndStateErrorInfo)initWithJSON:(id)a3
{
  return (GEOLogMsgEventGridDurationEndStateErrorInfo *)-[GEOLogMsgEventGridDurationEndStateErrorInfo _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventGridDurationEndStateErrorInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventGridDurationEndStateErrorInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteUint32Field();
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
  unsigned int v5 = a3;
  [(GEOLogMsgEventGridDurationEndStateErrorInfo *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[2] = self->_count;
    *((unsigned char *)v5 + 16) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[3] = self->_type;
    *((unsigned char *)v5 + 16) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)result + 2) = self->_count;
    *((unsigned char *)result + 16) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_type;
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
  [(GEOLogMsgEventGridDurationEndStateErrorInfo *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_count != *((_DWORD *)v4 + 2)) {
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
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_type != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventGridDurationEndStateErrorInfo *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_count;
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
  uint64_t v4 = 2654435761 * self->_type;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 16);
  if (v4)
  {
    self->_count = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 16);
  }
  if ((v4 & 2) != 0)
  {
    self->_type = *((_DWORD *)v5 + 3);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

@end