@interface GEOPDSImplicitQueryCategoryFilter
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSImplicitQueryCategoryFilter)init;
- (GEOPDSImplicitQueryCategoryFilter)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)implicitQueryIntroTipForHiking;
- (id)implicitQuerySearchAroundPoi;
- (id)jsonRepresentation;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_readImplicitQueryIntroTipForHiking;
- (void)_readImplicitQuerySearchAroundPoi;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setImplicitQueryIntroTipForHiking:(uint64_t)a1;
- (void)setImplicitQuerySearchAroundPoi:(uint64_t)a1;
- (void)setImplicitQuerySearchForEvcharger:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSImplicitQueryCategoryFilter

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 64) |= 2u;
    *(unsigned char *)(a1 + 64) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSImplicitQueryCategoryFilter readAll:](a1, 0);
      uint64_t v5 = *(void *)(a1 + 40);
      if (v5)
      {
        v6 = *(void **)(v5 + 8);
        *(void *)(v5 + 8) = 0;
      }
      -[GEOPDSImplicitQuerySearchAroundPOI clearUnknownFields:](*(void *)(a1 + 32), 1);
      uint64_t v7 = *(void *)(a1 + 24);
      -[GEOPDSImplicitQueryIntroTipForHiking clearUnknownFields:](v7, 1);
    }
  }
}

- (unint64_t)hash
{
  -[GEOPDSImplicitQueryCategoryFilter readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_implicitQueryType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDSImplicitQuerySearchForEVCharger *)self->_implicitQuerySearchForEvcharger hash] ^ v3;
  unint64_t v5 = [(GEOPDSImplicitQuerySearchAroundPOI *)self->_implicitQuerySearchAroundPoi hash];
  return v4 ^ v5 ^ [(GEOPDSImplicitQueryIntroTipForHiking *)self->_implicitQueryIntroTipForHiking hash];
}

- (void)setImplicitQuerySearchForEvcharger:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 64) |= 0x10u;
    *(unsigned char *)(a1 + 64) |= 0x20u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSImplicitQueryCategoryFilter readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v5 = *(int *)(a1 + 60);
      if (v5 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53DD988[v5];
      }
      if (a2) {
        uint64_t v7 = @"implicitQueryType";
      }
      else {
        uint64_t v7 = @"implicit_query_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOPDSImplicitQueryCategoryFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImplicitQuerySearchForEvcharger_tags);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v10 = *(id *)(a1 + 40);
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"implicitQuerySearchForEvcharger";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"implicit_query_search_for_evcharger";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = -[GEOPDSImplicitQueryCategoryFilter implicitQuerySearchAroundPoi]((id *)a1);
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"implicitQuerySearchAroundPoi";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"implicit_query_search_around_poi";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = -[GEOPDSImplicitQueryCategoryFilter implicitQueryIntroTipForHiking]((id *)a1);
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"implicitQueryIntroTipForHiking";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"implicit_query_intro_tip_for_hiking";
      }
      [v4 setObject:v20 forKey:v21];
    }
    v22 = *(void **)(a1 + 16);
    if (v22)
    {
      v23 = [v22 dictionaryRepresentation];
      v24 = v23;
      if (a2)
      {
        v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __63__GEOPDSImplicitQueryCategoryFilter__dictionaryRepresentation___block_invoke;
        v29[3] = &unk_1E53D8860;
        id v26 = v25;
        id v30 = v26;
        [v24 enumerateKeysAndObjectsUsingBlock:v29];
        id v27 = v26;

        v24 = v27;
      }
      [v4 setObject:v24 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (GEOPDSImplicitQueryCategoryFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSImplicitQueryCategoryFilter;
  v2 = [(GEOPDSImplicitQueryCategoryFilter *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDSImplicitQueryCategoryFilter)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSImplicitQueryCategoryFilter;
  uint64_t v3 = [(GEOPDSImplicitQueryCategoryFilter *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readImplicitQuerySearchAroundPoi
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSImplicitQueryCategoryFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImplicitQuerySearchAroundPoi_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)implicitQuerySearchAroundPoi
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSImplicitQueryCategoryFilter _readImplicitQuerySearchAroundPoi]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setImplicitQuerySearchAroundPoi:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 64) |= 8u;
    *(unsigned char *)(a1 + 64) |= 0x20u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)_readImplicitQueryIntroTipForHiking
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSImplicitQueryCategoryFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImplicitQueryIntroTipForHiking_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)implicitQueryIntroTipForHiking
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSImplicitQueryCategoryFilter _readImplicitQueryIntroTipForHiking]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setImplicitQueryIntroTipForHiking:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 64) |= 4u;
    *(unsigned char *)(a1 + 64) |= 0x20u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSImplicitQueryCategoryFilter;
  id v4 = [(GEOPDSImplicitQueryCategoryFilter *)&v8 description];
  uint64_t v5 = [(GEOPDSImplicitQueryCategoryFilter *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSImplicitQueryCategoryFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDSImplicitQueryCategoryFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_140;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_141;
      }
      GEOPDSImplicitQueryCategoryFilterReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDSImplicitQuerySearchAroundPOI readAll:](*(void *)(a1 + 32), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __63__GEOPDSImplicitQueryCategoryFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
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
  return GEOPDSImplicitQueryCategoryFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSImplicitQueryCategoryFilterIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDSImplicitQueryCategoryFilter readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_implicitQuerySearchForEvcharger)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_implicitQuerySearchAroundPoi)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_implicitQueryIntroTipForHiking)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDSImplicitQueryCategoryFilter _readImplicitQueryIntroTipForHiking](result);
    uint64_t v4 = *(void *)(v3 + 24);
    result = 1;
    if (!v4 || ([*(id *)(v4 + 24) hasGreenTeaWithValue:a2] & 1) == 0)
    {
      -[GEOPDSImplicitQueryCategoryFilter _readImplicitQuerySearchAroundPoi](v3);
      uint64_t v5 = *(void *)(v3 + 32);
      if (!v5) {
        return 0;
      }
      -[GEOPDSImplicitQuerySearchAroundPOI _readReferenceLocation](v5);
      if (([*(id *)(v5 + 40) hasGreenTeaWithValue:a2] & 1) == 0) {
        return 0;
      }
    }
  }
  return result;
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
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSImplicitQueryCategoryFilterReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSImplicitQueryCategoryFilter readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_implicitQueryType;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  id v9 = [(GEOPDSImplicitQuerySearchForEVCharger *)self->_implicitQuerySearchForEvcharger copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  id v11 = [(GEOPDSImplicitQuerySearchAroundPOI *)self->_implicitQuerySearchAroundPoi copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  id v13 = [(GEOPDSImplicitQueryIntroTipForHiking *)self->_implicitQueryIntroTipForHiking copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  v15 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  -[GEOPDSImplicitQueryCategoryFilter readAll:]((uint64_t)self, 1);
  -[GEOPDSImplicitQueryCategoryFilter readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_implicitQueryType != *((_DWORD *)v4 + 15)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  implicitQuerySearchForEvcharger = self->_implicitQuerySearchForEvcharger;
  if ((unint64_t)implicitQuerySearchForEvcharger | *((void *)v4 + 5)
    && !-[GEOPDSImplicitQuerySearchForEVCharger isEqual:](implicitQuerySearchForEvcharger, "isEqual:"))
  {
    goto LABEL_13;
  }
  implicitQuerySearchAroundPoi = self->_implicitQuerySearchAroundPoi;
  if ((unint64_t)implicitQuerySearchAroundPoi | *((void *)v4 + 4))
  {
    if (!-[GEOPDSImplicitQuerySearchAroundPOI isEqual:](implicitQuerySearchAroundPoi, "isEqual:")) {
      goto LABEL_13;
    }
  }
  implicitQueryIntroTipForHiking = self->_implicitQueryIntroTipForHiking;
  if ((unint64_t)implicitQueryIntroTipForHiking | *((void *)v4 + 3)) {
    char v8 = -[GEOPDSImplicitQueryIntroTipForHiking isEqual:](implicitQueryIntroTipForHiking, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implicitQuerySearchForEvcharger, 0);
  objc_storeStrong((id *)&self->_implicitQuerySearchAroundPoi, 0);
  objc_storeStrong((id *)&self->_implicitQueryIntroTipForHiking, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end