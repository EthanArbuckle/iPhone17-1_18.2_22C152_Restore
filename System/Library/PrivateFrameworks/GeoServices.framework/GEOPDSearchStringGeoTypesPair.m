@interface GEOPDSearchStringGeoTypesPair
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchStringGeoTypesPair)init;
- (GEOPDSearchStringGeoTypesPair)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchStringGeoTypesPair

- (GEOPDSearchStringGeoTypesPair)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchStringGeoTypesPair;
  v2 = [(GEOPDSearchStringGeoTypesPair *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchStringGeoTypesPair)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchStringGeoTypesPair;
  v3 = [(GEOPDSearchStringGeoTypesPair *)&v7 initWithData:a3];
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
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchStringGeoTypesPair;
  [(GEOPDSearchStringGeoTypesPair *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchStringGeoTypesPair;
  v4 = [(GEOPDSearchStringGeoTypesPair *)&v8 description];
  v5 = [(GEOPDSearchStringGeoTypesPair *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchStringGeoTypesPair _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchStringGeoTypesPair readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchStringGeoTypesPairReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKey_tags_2374);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v7 = *(id *)(a1 + 40);
    if (v7) {
      [v4 setObject:v7 forKey:@"key"];
    }

    if (*(void *)(a1 + 24))
    {
      objc_super v8 = PBRepeatedInt32NSArray();
      if (a2) {
        v9 = @"geoTypeId";
      }
      else {
        v9 = @"geo_type_id";
      }
      [v4 setObject:v8 forKey:v9];
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
  return -[GEOPDSearchStringGeoTypesPair _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_2375;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_2376;
      }
      GEOPDSearchStringGeoTypesPairReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchStringGeoTypesPairReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
  {
    objc_super v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
    id v5 = v10;
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchStringGeoTypesPair readAll:]((uint64_t)self, 0);
    PBDataWriterWriteStringField();
    id v5 = v10;
    p_geoTypeIds = &self->_geoTypeIds;
    if (p_geoTypeIds->count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v10;
        ++v7;
      }
      while (v7 < p_geoTypeIds->count);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  unint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchStringGeoTypesPair readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_key copyWithZone:a3];
    v9 = (void *)v5[5];
    v5[5] = v8;

    PBRepeatedInt32Copy();
    return v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDSearchStringGeoTypesPairReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDSearchStringGeoTypesPair readAll:]((uint64_t)self, 1),
         -[GEOPDSearchStringGeoTypesPair readAll:]((uint64_t)v4, 1),
         key = self->_key,
         !((unint64_t)key | v4[5]))
     || -[NSString isEqual:](key, "isEqual:")))
  {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOPDSearchStringGeoTypesPair readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_key hash];
  return PBRepeatedInt32Hash() ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end