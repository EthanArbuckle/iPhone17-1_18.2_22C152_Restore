@interface GEOPlaceCollectionStorage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPlaceCollectionStorage)init;
- (GEOPlaceCollectionStorage)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPlaceCollectionStorage

- (GEOPlaceCollectionStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPlaceCollectionStorage;
  v2 = [(GEOPlaceCollectionStorage *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPlaceCollectionStorage)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPlaceCollectionStorage;
  v3 = [(GEOPlaceCollectionStorage *)&v7 initWithData:a3];
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
  v8.super_class = (Class)GEOPlaceCollectionStorage;
  v4 = [(GEOPlaceCollectionStorage *)&v8 description];
  v5 = [(GEOPlaceCollectionStorage *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPlaceCollectionStorage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPlaceCollectionStorage readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPlaceCollectionStorageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceCollection_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v7 = *(id *)(a1 + 32);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"placeCollection"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v10 = *(void **)(a1 + 8);
      if (v10)
      {
        id v11 = v10;
        objc_sync_enter(v11);
        GEOPlaceCollectionStorageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttribution_tags_0);
        objc_sync_exit(v11);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
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
      [v4 setObject:v14 forKey:@"attribution"];
    }
    v15 = *(void **)(a1 + 16);
    if (v15)
    {
      v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __55__GEOPlaceCollectionStorage__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;

        v17 = v20;
      }
      [v4 setObject:v17 forKey:@"Unknown Fields"];
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
  return -[GEOPlaceCollectionStorage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_3040;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_3041;
      }
      GEOPlaceCollectionStorageReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      -[GEOPDPlaceCollection readAll:](*(void *)(a1 + 32), 1);
      -[GEOPDAttribution readAll:](*(void *)(a1 + 24), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __55__GEOPlaceCollectionStorage__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPlaceCollectionStorageReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_8;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_8;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if (GEOPDPlaceCollectionIsDirty((os_unfair_lock_s *)self->_placeCollection)) {
      goto LABEL_8;
    }
    char flags = (char)self->_flags;
  }
  if ((flags & 2) == 0 || !GEOPDAttributionIsDirty((uint64_t)self->_attribution))
  {
    id v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_13;
  }
LABEL_8:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPlaceCollectionStorage readAll:]((uint64_t)self, 0);
  if (self->_placeCollection) {
    PBDataWriterWriteSubmessage();
  }
  id v6 = v9;
  if (self->_attribution)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v9;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
LABEL_13:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPlaceCollectionStorage readAll:]((uint64_t)self, 0);
    id v8 = [(GEOPDPlaceCollection *)self->_placeCollection copyWithZone:a3];
    id v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    id v10 = [(GEOPDAttribution *)self->_attribution copyWithZone:a3];
    id v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPlaceCollectionStorageReadAllFrom(v5, self->_reader);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPlaceCollectionStorage readAll:]((uint64_t)self, 1),
         -[GEOPlaceCollectionStorage readAll:]((uint64_t)v4, 1),
         placeCollection = self->_placeCollection,
         !((unint64_t)placeCollection | v4[4]))
     || -[GEOPDPlaceCollection isEqual:](placeCollection, "isEqual:")))
  {
    attribution = self->_attribution;
    if ((unint64_t)attribution | v4[3]) {
      char v7 = -[GEOPDAttribution isEqual:](attribution, "isEqual:");
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
  -[GEOPlaceCollectionStorage readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDPlaceCollection *)self->_placeCollection hash];
  return [(GEOPDAttribution *)self->_attribution hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeCollection, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end