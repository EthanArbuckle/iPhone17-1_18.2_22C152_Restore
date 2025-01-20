@interface GEOMapLayerDataServicePatch
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapLayerDataServicePatch)init;
- (GEOMapLayerDataServicePatch)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapLayerDataServicePatch

- (GEOMapLayerDataServicePatch)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapLayerDataServicePatch;
  v2 = [(GEOMapLayerDataServicePatch *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMapLayerDataServicePatch)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMapLayerDataServicePatch;
  v3 = [(GEOMapLayerDataServicePatch *)&v7 initWithData:a3];
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
  v8.super_class = (Class)GEOMapLayerDataServicePatch;
  v4 = [(GEOMapLayerDataServicePatch *)&v8 description];
  v5 = [(GEOMapLayerDataServicePatch *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapLayerDataServicePatch _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOMapLayerDataServicePatch readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOMapLayerDataServicePatchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLayer_tags_74);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v7 = *(id *)(a1 + 24);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v10 = *(void **)(a1 + 8);
      if (v10)
      {
        id v11 = v10;
        objc_sync_enter(v11);
        GEOMapLayerDataServicePatchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSourceVersion_tags_0);
        objc_sync_exit(v11);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v12 = *(id *)(a1 + 32);
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"sourceVersion";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"source_version";
      }
      [v4 setObject:v14 forKey:v15];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v16 = *(void **)(a1 + 8);
      if (v16)
      {
        id v17 = v16;
        objc_sync_enter(v17);
        GEOMapLayerDataServicePatchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTargetVersion_tags);
        objc_sync_exit(v17);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v18 = *(id *)(a1 + 40);
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"targetVersion";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"target_version";
      }
      [v4 setObject:v20 forKey:v21];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 1) == 0)
    {
      v22 = *(void **)(a1 + 8);
      if (v22)
      {
        id v23 = v22;
        objc_sync_enter(v23);
        GEOMapLayerDataServicePatchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIndex_tags_75);
        objc_sync_exit(v23);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v24 = *(id *)(a1 + 16);
    v25 = v24;
    if (v24)
    {
      if (a2) {
        [v24 jsonRepresentation];
      }
      else {
      v26 = [v24 dictionaryRepresentation];
      }
      [v4 setObject:v26 forKey:@"index"];
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
  return -[GEOMapLayerDataServicePatch _dictionaryRepresentation:]((uint64_t)self, 1);
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
        id v6 = (int *)&readAll__recursiveTag_88;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_89;
      }
      GEOMapLayerDataServicePatchReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapLayerDataServicePatchReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1F) == 0))
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
    -[GEOMapLayerDataServicePatch readAll:]((uint64_t)self, 0);
    if (self->_layer) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_sourceVersion) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_targetVersion) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_index) {
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
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOMapLayerDataServicePatch readAll:]((uint64_t)self, 0);
    id v8 = [(GEOMapLayerDataServiceLayer *)self->_layer copyWithZone:a3];
    v9 = (void *)v5[3];
    v5[3] = v8;

    id v10 = [(GEOMapLayerDataServiceVersion *)self->_sourceVersion copyWithZone:a3];
    id v11 = (void *)v5[4];
    v5[4] = v10;

    id v12 = [(GEOMapLayerDataServiceVersion *)self->_targetVersion copyWithZone:a3];
    v13 = (void *)v5[5];
    v5[5] = v12;

    id v14 = [(GEOMapLayerDataServiceLayerIndex *)self->_index copyWithZone:a3];
    id v7 = (PBDataReader *)v5[2];
    v5[2] = v14;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOMapLayerDataServicePatchReadAllFrom((uint64_t)v5, self->_reader);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOMapLayerDataServicePatch readAll:]((uint64_t)self, 1),
         -[GEOMapLayerDataServicePatch readAll:]((uint64_t)v4, 1),
         layer = self->_layer,
         !((unint64_t)layer | v4[3]))
     || -[GEOMapLayerDataServiceLayer isEqual:](layer, "isEqual:"))
    && ((sourceVersion = self->_sourceVersion, !((unint64_t)sourceVersion | v4[4]))
     || -[GEOMapLayerDataServiceVersion isEqual:](sourceVersion, "isEqual:"))
    && ((targetVersion = self->_targetVersion, !((unint64_t)targetVersion | v4[5]))
     || -[GEOMapLayerDataServiceVersion isEqual:](targetVersion, "isEqual:")))
  {
    index = self->_index;
    if ((unint64_t)index | v4[2]) {
      char v9 = -[GEOMapLayerDataServiceLayerIndex isEqual:](index, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  -[GEOMapLayerDataServicePatch readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOMapLayerDataServiceLayer *)self->_layer hash];
  unint64_t v4 = [(GEOMapLayerDataServiceVersion *)self->_sourceVersion hash] ^ v3;
  unint64_t v5 = [(GEOMapLayerDataServiceVersion *)self->_targetVersion hash];
  return v4 ^ v5 ^ [(GEOMapLayerDataServiceLayerIndex *)self->_index hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetVersion, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_index, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end