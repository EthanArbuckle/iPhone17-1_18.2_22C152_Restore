@interface GEOTransitDepartureSequenceUsage
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDirection;
- (BOOL)hasHeadsign;
- (BOOL)hasLineId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitDepartureSequenceUsage)init;
- (GEOTransitDepartureSequenceUsage)initWithData:(id)a3;
- (GEOTransitDepartureSequenceUsage)initWithDictionary:(id)a3;
- (GEOTransitDepartureSequenceUsage)initWithJSON:(id)a3;
- (NSString)direction;
- (NSString)headsign;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)lineId;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDirection;
- (void)_readHeadsign;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDirection:(id)a3;
- (void)setHasLineId:(BOOL)a3;
- (void)setHeadsign:(id)a3;
- (void)setLineId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitDepartureSequenceUsage

- (GEOTransitDepartureSequenceUsage)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitDepartureSequenceUsage;
  v2 = [(GEOTransitDepartureSequenceUsage *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitDepartureSequenceUsage)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitDepartureSequenceUsage;
  v3 = [(GEOTransitDepartureSequenceUsage *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)lineId
{
  return self->_lineId;
}

- (void)setLineId:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  self->_lineId = a3;
}

- (void)setHasLineId:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasLineId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readDirection
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDepartureSequenceUsageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirection_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasDirection
{
  return self->_direction != 0;
}

- (NSString)direction
{
  -[GEOTransitDepartureSequenceUsage _readDirection]((uint64_t)self);
  direction = self->_direction;

  return direction;
}

- (void)setDirection:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_direction, a3);
}

- (void)_readHeadsign
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDepartureSequenceUsageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHeadsign_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasHeadsign
{
  return self->_headsign != 0;
}

- (NSString)headsign
{
  -[GEOTransitDepartureSequenceUsage _readHeadsign]((uint64_t)self);
  headsign = self->_headsign;

  return headsign;
}

- (void)setHeadsign:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_headsign, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitDepartureSequenceUsage;
  v4 = [(GEOTransitDepartureSequenceUsage *)&v8 description];
  v5 = [(GEOTransitDepartureSequenceUsage *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitDepartureSequenceUsage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 52))
    {
      v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      if (a2) {
        objc_super v6 = @"lineId";
      }
      else {
        objc_super v6 = @"line_id";
      }
      [v4 setObject:v5 forKey:v6];
    }
    objc_super v7 = [(id)a1 direction];
    if (v7) {
      [v4 setObject:v7 forKey:@"direction"];
    }

    objc_super v8 = [(id)a1 headsign];
    if (v8) {
      [v4 setObject:v8 forKey:@"headsign"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitDepartureSequenceUsage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOTransitDepartureSequenceUsage)initWithDictionary:(id)a3
{
  return (GEOTransitDepartureSequenceUsage *)-[GEOTransitDepartureSequenceUsage _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"lineId";
      }
      else {
        objc_super v6 = @"line_id";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLineId:", objc_msgSend(v7, "unsignedLongLongValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"direction"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = (void *)[v8 copy];
        [a1 setDirection:v9];
      }
      v10 = [v5 objectForKeyedSubscript:@"headsign"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setHeadsign:v11];
      }
    }
  }

  return a1;
}

- (GEOTransitDepartureSequenceUsage)initWithJSON:(id)a3
{
  return (GEOTransitDepartureSequenceUsage *)-[GEOTransitDepartureSequenceUsage _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1531;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1532;
    }
    GEOTransitDepartureSequenceUsageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitDepartureSequenceUsageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitDepartureSequenceUsageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitDepartureSequenceUsage *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_direction) {
      PBDataWriterWriteStringField();
    }
    if (self->_headsign) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOTransitDepartureSequenceUsage *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    v5[4] = self->_lineId;
    *((unsigned char *)v5 + 52) |= 1u;
  }
  if (self->_direction)
  {
    objc_msgSend(v5, "setDirection:");
    v4 = v5;
  }
  if (self->_headsign)
  {
    objc_msgSend(v5, "setHeadsign:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTransitDepartureSequenceUsageReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitDepartureSequenceUsage *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 32) = self->_lineId;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_direction copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  uint64_t v11 = [(NSString *)self->_headsign copyWithZone:a3];
  id v8 = *(id *)(v5 + 24);
  *(void *)(v5 + 24) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOTransitDepartureSequenceUsage *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_lineId != *((void *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  direction = self->_direction;
  if ((unint64_t)direction | *((void *)v4 + 2) && !-[NSString isEqual:](direction, "isEqual:")) {
    goto LABEL_11;
  }
  headsign = self->_headsign;
  if ((unint64_t)headsign | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](headsign, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEOTransitDepartureSequenceUsage *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_lineId;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_direction hash] ^ v3;
  return v4 ^ [(NSString *)self->_headsign hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (unint64_t *)a3;
  [v5 readAll:0];
  NSUInteger v4 = v5;
  if (*((unsigned char *)v5 + 52))
  {
    self->_lineId = v5[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (v5[2])
  {
    -[GEOTransitDepartureSequenceUsage setDirection:](self, "setDirection:");
    NSUInteger v4 = v5;
  }
  if (v4[3])
  {
    -[GEOTransitDepartureSequenceUsage setHeadsign:](self, "setHeadsign:");
    NSUInteger v4 = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headsign, 0);
  objc_storeStrong((id *)&self->_direction, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end