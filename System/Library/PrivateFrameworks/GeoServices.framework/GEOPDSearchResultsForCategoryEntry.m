@interface GEOPDSearchResultsForCategoryEntry
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchResultsForCategoryEntry)init;
- (GEOPDSearchResultsForCategoryEntry)initWithData:(id)a3;
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

@implementation GEOPDSearchResultsForCategoryEntry

- (GEOPDSearchResultsForCategoryEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchResultsForCategoryEntry;
  v2 = [(GEOPDSearchResultsForCategoryEntry *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchResultsForCategoryEntry)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchResultsForCategoryEntry;
  v3 = [(GEOPDSearchResultsForCategoryEntry *)&v7 initWithData:a3];
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
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchResultsForCategoryEntry;
  [(GEOPDSearchResultsForCategoryEntry *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchResultsForCategoryEntry;
  v4 = [(GEOPDSearchResultsForCategoryEntry *)&v8 description];
  v5 = [(GEOPDSearchResultsForCategoryEntry *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchResultsForCategoryEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchResultsForCategoryEntry readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchResultsForCategoryEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategory_tags_6969);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v7 = *(id *)(a1 + 48);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"category"];
    }
    if (*(void *)(a1 + 32))
    {
      v10 = PBRepeatedUInt32NSArray();
      if (a2) {
        v11 = @"placeIndex";
      }
      else {
        v11 = @"place_index";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = *(void **)(a1 + 16);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __64__GEOPDSearchResultsForCategoryEntry__dictionaryRepresentation___block_invoke;
        v19[3] = &unk_1E53D8860;
        id v16 = v15;
        id v20 = v16;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        id v17 = v16;

        v14 = v17;
      }
      [v4 setObject:v14 forKey:@"Unknown Fields"];
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
  return -[GEOPDSearchResultsForCategoryEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_6976;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_6977;
      }
      GEOPDSearchResultsForCategoryEntryReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDBrowseCategory readAll:](*(void *)(a1 + 48), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __64__GEOPDSearchResultsForCategoryEntry__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDSearchResultsForCategoryEntryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
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
    if (GEOPDBrowseCategoryIsDirty((uint64_t)self->_category)) {
      goto LABEL_8;
    }
    char flags = (char)self->_flags;
  }
  if ((flags & 2) == 0)
  {
    id v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
    goto LABEL_14;
  }
LABEL_8:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchResultsForCategoryEntry readAll:]((uint64_t)self, 0);
  if (self->_category) {
    PBDataWriterWriteSubmessage();
  }
  id v8 = v10;
  if (self->_placeIndexs.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v8 = v10;
      ++v9;
    }
    while (v9 < self->_placeIndexs.count);
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v8];
LABEL_14:
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
    -[GEOPDSearchResultsForCategoryEntry readAll:]((uint64_t)self, 0);
    id v8 = [(GEOPDBrowseCategory *)self->_category copyWithZone:a3];
    unint64_t v9 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v8;

    PBRepeatedUInt32Copy();
    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDSearchResultsForCategoryEntryReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDSearchResultsForCategoryEntry readAll:]((uint64_t)self, 1),
         -[GEOPDSearchResultsForCategoryEntry readAll:]((uint64_t)v4, 1),
         category = self->_category,
         !((unint64_t)category | v4[6]))
     || -[GEOPDBrowseCategory isEqual:](category, "isEqual:")))
  {
    char IsEqual = PBRepeatedUInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOPDSearchResultsForCategoryEntry readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDBrowseCategory *)self->_category hash];
  return PBRepeatedUInt32Hash() ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end