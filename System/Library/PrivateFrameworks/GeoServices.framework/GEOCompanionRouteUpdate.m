@interface GEOCompanionRouteUpdate
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLastUpdated;
- (BOOL)hasRouteID;
- (BOOL)hasTransitRouteUpdate;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCompanionRouteUpdate)init;
- (GEOCompanionRouteUpdate)initWithData:(id)a3;
- (GEOCompanionRouteUpdate)initWithDictionary:(id)a3;
- (GEOCompanionRouteUpdate)initWithJSON:(id)a3;
- (GEOCompanionRouteUpdate)initWithTransitRouteUpdate:(id)a3;
- (GEOTransitRouteUpdate)transitRouteUpdate;
- (NSData)routeID;
- (double)lastUpdated;
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
- (void)_readRouteID;
- (void)_readTransitRouteUpdate;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasLastUpdated:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setLastUpdated:(double)a3;
- (void)setRouteID:(id)a3;
- (void)setTransitRouteUpdate:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCompanionRouteUpdate

- (GEOCompanionRouteUpdate)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCompanionRouteUpdate;
  v2 = [(GEOCompanionRouteUpdate *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCompanionRouteUpdate)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCompanionRouteUpdate;
  v3 = [(GEOCompanionRouteUpdate *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRouteID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteID_tags_896);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasRouteID
{
  return self->_routeID != 0;
}

- (NSData)routeID
{
  -[GEOCompanionRouteUpdate _readRouteID]((uint64_t)self);
  routeID = self->_routeID;

  return routeID;
}

- (void)setRouteID:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 18;
  }
  else {
    char v3 = 16;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"TRANSIT";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"UNKNOWN";
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"TRANSIT"];
  }

  return v4;
}

- (double)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_lastUpdated = a3;
}

- (void)setHasLastUpdated:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasLastUpdated
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readTransitRouteUpdate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitRouteUpdate_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTransitRouteUpdate
{
  return self->_transitRouteUpdate != 0;
}

- (GEOTransitRouteUpdate)transitRouteUpdate
{
  -[GEOCompanionRouteUpdate _readTransitRouteUpdate]((uint64_t)self);
  transitRouteUpdate = self->_transitRouteUpdate;

  return transitRouteUpdate;
}

- (void)setTransitRouteUpdate:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_transitRouteUpdate, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCompanionRouteUpdate;
  int v4 = [(GEOCompanionRouteUpdate *)&v8 description];
  v5 = [(GEOCompanionRouteUpdate *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCompanionRouteUpdate _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 routeID];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"routeID"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"routeID"];
      }
    }

    char v8 = *(unsigned char *)(a1 + 56);
    if ((v8 & 2) != 0)
    {
      int v9 = *(_DWORD *)(a1 + 52);
      if (v9)
      {
        if (v9 == 1)
        {
          v10 = @"TRANSIT";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 52));
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v10 = @"UNKNOWN";
      }
      [v4 setObject:v10 forKey:@"type"];

      char v8 = *(unsigned char *)(a1 + 56);
    }
    if (v8)
    {
      v11 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
      [v4 setObject:v11 forKey:@"lastUpdated"];
    }
    v12 = [(id)a1 transitRouteUpdate];
    v13 = v12;
    if (v12)
    {
      if (a2) {
        [v12 jsonRepresentation];
      }
      else {
      v14 = [v12 dictionaryRepresentation];
      }
      [v4 setObject:v14 forKey:@"transitRouteUpdate"];
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
  return -[GEOCompanionRouteUpdate _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCompanionRouteUpdate)initWithDictionary:(id)a3
{
  return (GEOCompanionRouteUpdate *)-[GEOCompanionRouteUpdate _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_21;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_21;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"routeID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
    [a1 setRouteID:v7];
  }
  char v8 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if ([v9 isEqualToString:@"UNKNOWN"]) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = [v9 isEqualToString:@"TRANSIT"];
    }

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v8 intValue];
LABEL_12:
    [a1 setType:v10];
  }

  v11 = [v5 objectForKeyedSubscript:@"lastUpdated"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 doubleValue];
    objc_msgSend(a1, "setLastUpdated:");
  }

  v12 = [v5 objectForKeyedSubscript:@"transitRouteUpdate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [GEOTransitRouteUpdate alloc];
    if (a3) {
      uint64_t v14 = [(GEOTransitRouteUpdate *)v13 initWithJSON:v12];
    }
    else {
      uint64_t v14 = [(GEOTransitRouteUpdate *)v13 initWithDictionary:v12];
    }
    v15 = (void *)v14;
    [a1 setTransitRouteUpdate:v14];
  }
LABEL_21:

  return a1;
}

- (GEOCompanionRouteUpdate)initWithJSON:(id)a3
{
  return (GEOCompanionRouteUpdate *)-[GEOCompanionRouteUpdate _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      char v8 = (int *)&readAll__recursiveTag_907_0;
    }
    else {
      char v8 = (int *)&readAll__nonRecursiveTag_908_0;
    }
    GEOCompanionRouteUpdateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOTransitRouteUpdate *)self->_transitRouteUpdate readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionRouteUpdateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionRouteUpdateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOCompanionRouteUpdateIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOCompanionRouteUpdate *)self readAll:0];
    if (self->_routeID) {
      PBDataWriterWriteDataField();
    }
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteDoubleField();
    }
    if (self->_transitRouteUpdate) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEOCompanionRouteUpdate *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 10) = self->_readerMarkPos;
  *((_DWORD *)v6 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_routeID) {
    objc_msgSend(v6, "setRouteID:");
  }
  char flags = (char)self->_flags;
  id v5 = v6;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 13) = self->_type;
    *((unsigned char *)v6 + 56) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v6[2] = *(id *)&self->_lastUpdated;
    *((unsigned char *)v6 + 56) |= 1u;
  }
  if (self->_transitRouteUpdate)
  {
    objc_msgSend(v6, "setTransitRouteUpdate:");
    id v5 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOCompanionRouteUpdateReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCompanionRouteUpdate *)self readAll:0];
  uint64_t v9 = [(NSData *)self->_routeID copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_type;
    *(unsigned char *)(v5 + 56) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(double *)(v5 + 16) = self->_lastUpdated;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  id v12 = [(GEOTransitRouteUpdate *)self->_transitRouteUpdate copyWithZone:a3];
  id v8 = *(id *)(v5 + 32);
  *(void *)(v5 + 32) = v12;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOCompanionRouteUpdate *)self readAll:1];
  [v4 readAll:1];
  routeID = self->_routeID;
  if ((unint64_t)routeID | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](routeID, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_type != *((_DWORD *)v4 + 13)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_lastUpdated != *((double *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_16;
  }
  transitRouteUpdate = self->_transitRouteUpdate;
  if ((unint64_t)transitRouteUpdate | *((void *)v4 + 4)) {
    char v7 = -[GEOTransitRouteUpdate isEqual:](transitRouteUpdate, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  [(GEOCompanionRouteUpdate *)self readAll:1];
  uint64_t v3 = [(NSData *)self->_routeID hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_type;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9 ^ [(GEOTransitRouteUpdate *)self->_transitRouteUpdate hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double lastUpdated = self->_lastUpdated;
  double v6 = -lastUpdated;
  if (lastUpdated >= 0.0) {
    double v6 = self->_lastUpdated;
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
  return v4 ^ v3 ^ v9 ^ [(GEOTransitRouteUpdate *)self->_transitRouteUpdate hash];
}

- (void)mergeFrom:(id)a3
{
  double v8 = a3;
  [v8 readAll:0];
  uint64_t v4 = v8;
  if (v8[3])
  {
    [(GEOCompanionRouteUpdate *)self setRouteID:"setRouteID:"];
    uint64_t v4 = v8;
  }
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 2) != 0)
  {
    self->_type = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v4 + 56);
  }
  if (v5)
  {
    self->_double lastUpdated = (double)v4[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
  transitRouteUpdate = self->_transitRouteUpdate;
  uint64_t v7 = v4[4];
  if (transitRouteUpdate)
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[GEOTransitRouteUpdate mergeFrom:](transitRouteUpdate, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_13;
    }
    [(GEOCompanionRouteUpdate *)self setTransitRouteUpdate:"setTransitRouteUpdate:"];
  }
  uint64_t v4 = v8;
LABEL_13:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitRouteUpdate, 0);
  objc_storeStrong((id *)&self->_routeID, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOCompanionRouteUpdate)initWithTransitRouteUpdate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = [(GEOCompanionRouteUpdate *)self init];
    double v6 = v5;
    if (v5)
    {
      [(GEOCompanionRouteUpdate *)v5 setType:1];
      [(GEOCompanionRouteUpdate *)v6 setTransitRouteUpdate:v4];
      uint64_t v7 = [v4 routeIdentifier];
      double v8 = [v7 clientRouteHandle];
      [(GEOCompanionRouteUpdate *)v6 setRouteID:v8];
    }
    self = v6;
    unint64_t v9 = self;
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

@end