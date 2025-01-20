@interface GEOURLItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOURLItem)init;
- (GEOURLItem)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mapItemStorage;
- (id)place;
- (unint64_t)hash;
- (void)_readMapItemStorage;
- (void)_readPlace;
- (void)readAll:(uint64_t)a1;
- (void)setMapItem:(id)a3;
- (void)setMapItemStorage:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOURLItem

- (GEOURLItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOURLItem;
  v2 = [(GEOURLItem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOURLItem)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOURLItem;
  v3 = [(GEOURLItem *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPlace
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlace_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (id)place
{
  if (a1)
  {
    v2 = a1;
    -[GEOURLItem _readPlace]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readMapItemStorage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapItemStorage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (id)mapItemStorage
{
  if (a1)
  {
    v2 = a1;
    -[GEOURLItem _readMapItemStorage]((uint64_t)a1);
    a1 = (id *)v2[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setMapItemStorage:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 48) |= 2u;
    *(unsigned char *)(a1 + 48) |= 8u;
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOURLItem;
  id v4 = [(GEOURLItem *)&v8 description];
  v5 = [(GEOURLItem *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOURLItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOURLItem readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOURLItem place]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"place"];
    }
    if (*(unsigned char *)(a1 + 48))
    {
      objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 44)];
      [v4 setObject:v8 forKey:@"currentLocation"];
    }
    v9 = -[GEOURLItem mapItemStorage]((id *)a1);
    v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"mapItemStorage"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOURLItem _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_29;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_29;
      }
      GEOURLItemReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      [*(id *)(a1 + 24) readAll:1];
      [*(id *)(a1 + 16) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOURLItemReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOURLItemIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOURLItem readAll:]((uint64_t)self, 0);
    if (self->_place) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_mapItemStorage) {
      PBDataWriterWriteSubmessage();
    }
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
      GEOURLItemReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOURLItem readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPlace *)self->_place copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 44) = self->_currentLocation;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  id v11 = [(GEOMapItemStorage *)self->_mapItemStorage copyWithZone:a3];
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  -[GEOURLItem readAll:]((uint64_t)self, 1);
  -[GEOURLItem readAll:]((uint64_t)v4, 1);
  place = self->_place;
  if ((unint64_t)place | *((void *)v4 + 3))
  {
    if (!-[GEOPlace isEqual:](place, "isEqual:")) {
      goto LABEL_8;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 48))
    {
      if (self->_currentLocation)
      {
        if (*((unsigned char *)v4 + 44)) {
          goto LABEL_14;
        }
      }
      else if (!*((unsigned char *)v4 + 44))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    char v6 = 0;
    goto LABEL_9;
  }
  if (*((unsigned char *)v4 + 48)) {
    goto LABEL_8;
  }
LABEL_14:
  mapItemStorage = self->_mapItemStorage;
  if ((unint64_t)mapItemStorage | *((void *)v4 + 2)) {
    char v6 = -[GEOMapItemStorage isEqual:](mapItemStorage, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  -[GEOURLItem readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPlace *)self->_place hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_currentLocation;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(GEOMapItemStorage *)self->_mapItemStorage hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_mapItemStorage, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)setMapItem:(id)a3
{
  id v4 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:a3];
  -[GEOURLItem setMapItemStorage:]((uint64_t)self, v4);
}

@end