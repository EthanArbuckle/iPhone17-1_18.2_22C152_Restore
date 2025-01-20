@interface GEOMapLayerDataServiceVersionedLayer
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapLayerDataServiceVersionedLayer)init;
- (GEOMapLayerDataServiceVersionedLayer)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapLayerDataServiceVersionedLayer

- (GEOMapLayerDataServiceVersionedLayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapLayerDataServiceVersionedLayer;
  v2 = [(GEOMapLayerDataServiceVersionedLayer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMapLayerDataServiceVersionedLayer)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMapLayerDataServiceVersionedLayer;
  v3 = [(GEOMapLayerDataServiceVersionedLayer *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapLayerDataServiceVersionedLayer;
  v4 = [(GEOMapLayerDataServiceVersionedLayer *)&v8 description];
  v5 = [(GEOMapLayerDataServiceVersionedLayer *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapLayerDataServiceVersionedLayer _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOMapLayerDataServiceVersionedLayer readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOMapLayerDataServiceVersionedLayerReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLayer_tags_144);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v7 = *(id *)(a1 + 16);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"layer"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      v10 = *(void **)(a1 + 8);
      if (v10)
      {
        id v11 = v10;
        objc_sync_enter(v11);
        GEOMapLayerDataServiceVersionedLayerReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVersion_tags_145);
        objc_sync_exit(v11);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v12 = *(id *)(a1 + 24);
    v13 = v12;
    if (v12)
    {
      if (a2) {
        [v12 jsonRepresentation];
      }
      else {
      v14 = [v12 dictionaryRepresentation];
      }
      [v4 setObject:v14 forKey:@"version"];
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
  return -[GEOMapLayerDataServiceVersionedLayer _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_146;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_147;
      }
      GEOMapLayerDataServiceVersionedLayerReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapLayerDataServiceVersionedLayerReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOMapLayerDataServiceVersionedLayer readAll:]((uint64_t)self, 0);
    if (self->_layer) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_version) {
      PBDataWriterWriteSubmessage();
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
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOMapLayerDataServiceVersionedLayer readAll:]((uint64_t)self, 0);
    id v8 = [(GEOMapLayerDataServiceLayer *)self->_layer copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;

    id v10 = [(GEOMapLayerDataServiceVersion *)self->_version copyWithZone:a3];
    id v7 = (PBDataReader *)v5[3];
    v5[3] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOMapLayerDataServiceVersionedLayerReadAllFrom((uint64_t)v5, self->_reader);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOMapLayerDataServiceVersionedLayer readAll:]((uint64_t)self, 1),
         -[GEOMapLayerDataServiceVersionedLayer readAll:]((uint64_t)v4, 1),
         layer = self->_layer,
         !((unint64_t)layer | v4[2]))
     || -[GEOMapLayerDataServiceLayer isEqual:](layer, "isEqual:")))
  {
    version = self->_version;
    if ((unint64_t)version | v4[3]) {
      char v7 = -[GEOMapLayerDataServiceVersion isEqual:](version, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  -[GEOMapLayerDataServiceVersionedLayer readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOMapLayerDataServiceLayer *)self->_layer hash];
  return [(GEOMapLayerDataServiceVersion *)self->_version hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_layer, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end