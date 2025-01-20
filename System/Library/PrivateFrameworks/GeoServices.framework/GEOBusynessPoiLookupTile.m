@interface GEOBusynessPoiLookupTile
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOBusynessPoiLookupTile)init;
- (GEOBusynessPoiLookupTile)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_readLatitudeE7s;
- (void)_readLongitudeE7s;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOBusynessPoiLookupTile

- (GEOBusynessPoiLookupTile)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOBusynessPoiLookupTile;
  v2 = [(GEOBusynessPoiLookupTile *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOBusynessPoiLookupTile)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOBusynessPoiLookupTile;
  v3 = [(GEOBusynessPoiLookupTile *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOBusynessPoiLookupTile;
  [(GEOBusynessPoiLookupTile *)&v3 dealloc];
}

- (void)_readLatitudeE7s
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusynessPoiLookupTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLatitudeE7s_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)_readLongitudeE7s
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusynessPoiLookupTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLongitudeE7s_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOBusynessPoiLookupTile;
  v4 = [(GEOBusynessPoiLookupTile *)&v8 description];
  v5 = [(GEOBusynessPoiLookupTile *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOBusynessPoiLookupTile readAll:](a1, 1);
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 80))
    {
      id v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
      [v2 setObject:v3 forKey:@"offsetId"];
    }
    if (*(void *)(a1 + 24))
    {
      v4 = PBRepeatedInt32NSArray();
      [v2 setObject:v4 forKey:@"latitudeE7"];
    }
    if (*(void *)(a1 + 48))
    {
      v5 = PBRepeatedInt32NSArray();
      [v2 setObject:v5 forKey:@"longitudeE7"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_36;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_36;
      }
      GEOBusynessPoiLookupTileReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOBusynessPoiLookupTileReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    v9 = self->_reader;
    objc_sync_enter(v9);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v10];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOBusynessPoiLookupTile readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_latitudeE7s.count)
    {
      PBDataWriterPlaceMark();
      if (self->_latitudeE7s.count)
      {
        unint64_t v6 = 0;
        do
        {
          PBDataWriterWriteSfixed32Field();
          ++v6;
        }
        while (v6 < self->_latitudeE7s.count);
      }
      PBDataWriterRecallMark();
    }
    p_longitudeE7s = &self->_longitudeE7s;
    if (p_longitudeE7s->count)
    {
      PBDataWriterPlaceMark();
      if (p_longitudeE7s->count)
      {
        unint64_t v8 = 0;
        do
        {
          PBDataWriterWriteSfixed32Field();
          ++v8;
        }
        while (v8 < p_longitudeE7s->count);
      }
      PBDataWriterRecallMark();
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v6 = reader;
    objc_sync_enter(v6);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOBusynessPoiLookupTileReadAllFrom(v4, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      id v7 = (id)v4;
      objc_sync_exit(v6);

      return (id)v4;
    }
    objc_sync_exit(v6);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOBusynessPoiLookupTile readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v4 + 76) = self->_offsetId;
    *(unsigned char *)(v4 + 80) |= 1u;
  }
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  -[GEOBusynessPoiLookupTile readAll:]((uint64_t)self, 1);
  -[GEOBusynessPoiLookupTile readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_offsetId != *((_DWORD *)v4 + 19)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_9;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_9:
    char IsEqual = 0;
    goto LABEL_10;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_10:

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOBusynessPoiLookupTile readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_offsetId;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedInt32Hash() ^ v3;
  return v4 ^ PBRepeatedInt32Hash();
}

- (void).cxx_destruct
{
}

@end