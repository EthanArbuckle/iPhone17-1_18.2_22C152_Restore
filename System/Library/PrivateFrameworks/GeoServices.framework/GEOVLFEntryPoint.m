@interface GEOVLFEntryPoint
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAccessPoint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLFEntryPoint)initWithDictionary:(id)a3;
- (GEOVLFEntryPoint)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)accessPointAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsAccessPoint:(id)a3;
- (int)accessPoint;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessPoint:(int)a3;
- (void)setHasAccessPoint:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFEntryPoint

- (int)accessPoint
{
  if (*(unsigned char *)&self->_flags) {
    return self->_accessPoint;
  }
  else {
    return 0;
  }
}

- (void)setAccessPoint:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_accessPoint = a3;
}

- (void)setHasAccessPoint:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAccessPoint
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)accessPointAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F8D48[a3];
  }

  return v3;
}

- (int)StringAsAccessPoint:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VLFUsageUserAccessPoint_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VLFUsageUserAccessPoint_PUCK_PASSIVE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VLFUsageUserAccessPoint_PUCK_ACTIVE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VLFUsageUserAccessPoint_AR_WALKING_ROUTE_PLANNING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"VLFUsageUserAccessPoint_AR_WALKING_NAVIGATION"])
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
  v8.super_class = (Class)GEOVLFEntryPoint;
  int v4 = [(GEOVLFEntryPoint *)&v8 description];
  v5 = [(GEOVLFEntryPoint *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFEntryPoint _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 12))
    {
      uint64_t v5 = *(int *)(a1 + 8);
      if (v5 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53F8D48[v5];
      }
      if (a2) {
        v7 = @"accessPoint";
      }
      else {
        v7 = @"access_point";
      }
      [v4 setObject:v6 forKey:v7];
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
  return -[GEOVLFEntryPoint _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFEntryPoint)initWithDictionary:(id)a3
{
  return (GEOVLFEntryPoint *)-[GEOVLFEntryPoint _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"accessPoint";
      }
      else {
        v6 = @"access_point";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"VLFUsageUserAccessPoint_UNKNOWN"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"VLFUsageUserAccessPoint_PUCK_PASSIVE"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"VLFUsageUserAccessPoint_PUCK_ACTIVE"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"VLFUsageUserAccessPoint_AR_WALKING_ROUTE_PLANNING"])
        {
          uint64_t v9 = 3;
        }
        else if ([v8 isEqualToString:@"VLFUsageUserAccessPoint_AR_WALKING_NAVIGATION"])
        {
          uint64_t v9 = 4;
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_22:

          goto LABEL_23;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setAccessPoint:v9];
      goto LABEL_22;
    }
  }
LABEL_23:

  return a1;
}

- (GEOVLFEntryPoint)initWithJSON:(id)a3
{
  return (GEOVLFEntryPoint *)-[GEOVLFEntryPoint _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFEntryPointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFEntryPointReadAllFrom((uint64_t)self, a3);
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
  [(GEOVLFEntryPoint *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[2] = self->_accessPoint;
    *((unsigned char *)v4 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)result + 2) = self->_accessPoint;
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
  [(GEOVLFEntryPoint *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_accessPoint == *((_DWORD *)v4 + 2))
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
    return 2654435761 * self->_accessPoint;
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
    self->_accessPoint = v4[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end