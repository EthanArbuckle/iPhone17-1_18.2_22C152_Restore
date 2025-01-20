@interface GEOWiFiConnectionRoamState
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLateRoamMaxRSSI;
- (BOOL)hasLateRoamMinRSSI;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOWiFiConnectionRoamState)initWithDictionary:(id)a3;
- (GEOWiFiConnectionRoamState)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)lateRoamMaxRSSI;
- (int)lateRoamMinRSSI;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLateRoamMaxRSSI:(BOOL)a3;
- (void)setHasLateRoamMinRSSI:(BOOL)a3;
- (void)setLateRoamMaxRSSI:(int)a3;
- (void)setLateRoamMinRSSI:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWiFiConnectionRoamState

- (int)lateRoamMinRSSI
{
  return self->_lateRoamMinRSSI;
}

- (void)setLateRoamMinRSSI:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_lateRoamMinRSSI = a3;
}

- (void)setHasLateRoamMinRSSI:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLateRoamMinRSSI
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)lateRoamMaxRSSI
{
  return self->_lateRoamMaxRSSI;
}

- (void)setLateRoamMaxRSSI:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_lateRoamMaxRSSI = a3;
}

- (void)setHasLateRoamMaxRSSI:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLateRoamMaxRSSI
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiConnectionRoamState;
  v4 = [(GEOWiFiConnectionRoamState *)&v8 description];
  v5 = [(GEOWiFiConnectionRoamState *)self dictionaryRepresentation];
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
    if ((v3 & 2) != 0)
    {
      v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 12)];
      [v2 setObject:v4 forKey:@"lateRoamMinRSSI"];

      char v3 = *(unsigned char *)(a1 + 16);
    }
    if (v3)
    {
      v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 8)];
      [v2 setObject:v5 forKey:@"lateRoamMaxRSSI"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEOWiFiConnectionRoamState)initWithDictionary:(id)a3
{
  return (GEOWiFiConnectionRoamState *)-[GEOWiFiConnectionRoamState _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"lateRoamMinRSSI"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLateRoamMinRSSI:", objc_msgSend(v4, "intValue"));
      }

      v5 = [v3 objectForKeyedSubscript:@"lateRoamMaxRSSI"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLateRoamMaxRSSI:", objc_msgSend(v5, "intValue"));
      }
    }
  }

  return a1;
}

- (GEOWiFiConnectionRoamState)initWithJSON:(id)a3
{
  return (GEOWiFiConnectionRoamState *)-[GEOWiFiConnectionRoamState _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiConnectionRoamStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiConnectionRoamStateReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [(GEOWiFiConnectionRoamState *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = self->_lateRoamMinRSSI;
    *((unsigned char *)v5 + 16) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v5[2] = self->_lateRoamMaxRSSI;
    *((unsigned char *)v5 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_lateRoamMinRSSI;
    *((unsigned char *)result + 16) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)result + 2) = self->_lateRoamMaxRSSI;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOWiFiConnectionRoamState *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_lateRoamMinRSSI != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_lateRoamMaxRSSI != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOWiFiConnectionRoamState *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_lateRoamMinRSSI;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_lateRoamMaxRSSI;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 16);
  if ((v4 & 2) != 0)
  {
    self->_lateRoamMinRSSI = v5[3];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 16);
  }
  if (v4)
  {
    self->_lateRoamMaxRSSI = v5[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end