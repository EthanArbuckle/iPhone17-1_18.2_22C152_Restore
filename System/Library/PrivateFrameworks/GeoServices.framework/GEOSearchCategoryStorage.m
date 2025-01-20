@interface GEOSearchCategoryStorage
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAutocompleteEntry;
- (BOOL)hasBrowseCategory;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAutocompleteEntry)autocompleteEntry;
- (GEOPDBrowseCategory)browseCategory;
- (GEOSearchCategoryStorage)init;
- (GEOSearchCategoryStorage)initWithData:(id)a3;
- (GEOSearchCategoryStorage)initWithDictionary:(id)a3;
- (GEOSearchCategoryStorage)initWithJSON:(id)a3;
- (GEOSearchCategoryStorage)initWithSearchCategory:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(uint64_t)a3 isJSON:;
- (void)_readAutocompleteEntry;
- (void)_readBrowseCategory;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAutocompleteEntry:(id)a3;
- (void)setBrowseCategory:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSearchCategoryStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browseCategory, 0);
  objc_storeStrong((id *)&self->_autocompleteEntry, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOSearchCategoryStorage)initWithSearchCategory:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOSearchCategoryStorage;
  v5 = [(GEOSearchCategoryStorage *)&v12 init];
  v6 = v5;
  v7 = 0;
  if (v4 && v5)
  {
    v8 = [v4 _browseCategory];

    if (v8)
    {
      v9 = [v4 _browseCategory];
      [(GEOSearchCategoryStorage *)v6 setBrowseCategory:v9];
    }
    else
    {
      v10 = [v4 _autocompleteEntry];

      if (!v10)
      {
LABEL_8:
        v7 = v6;
        goto LABEL_9;
      }
      v9 = [v4 _autocompleteEntry];
      [(GEOSearchCategoryStorage *)v6 setAutocompleteEntry:v9];
    }

    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

- (GEOSearchCategoryStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOSearchCategoryStorage;
  v2 = [(GEOSearchCategoryStorage *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOSearchCategoryStorage)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSearchCategoryStorage;
  v3 = [(GEOSearchCategoryStorage *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readBrowseCategory
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
        GEOSearchCategoryStorageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrowseCategory_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasBrowseCategory
{
  return self->_browseCategory != 0;
}

- (GEOPDBrowseCategory)browseCategory
{
  -[GEOSearchCategoryStorage _readBrowseCategory]((uint64_t)self);
  browseCategory = self->_browseCategory;

  return browseCategory;
}

- (void)setBrowseCategory:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_browseCategory, a3);
}

- (void)_readAutocompleteEntry
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
        GEOSearchCategoryStorageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutocompleteEntry_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAutocompleteEntry
{
  return self->_autocompleteEntry != 0;
}

- (GEOPDAutocompleteEntry)autocompleteEntry
{
  -[GEOSearchCategoryStorage _readAutocompleteEntry]((uint64_t)self);
  autocompleteEntry = self->_autocompleteEntry;

  return autocompleteEntry;
}

- (void)setAutocompleteEntry:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_autocompleteEntry, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSearchCategoryStorage;
  id v4 = [(GEOSearchCategoryStorage *)&v8 description];
  v5 = [(GEOSearchCategoryStorage *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSearchCategoryStorage _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 browseCategory];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"browseCategory"];
    }
    objc_super v8 = [a1 autocompleteEntry];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"autocompleteEntry"];
    }
    v11 = (void *)a1[2];
    if (v11)
    {
      objc_super v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __54__GEOSearchCategoryStorage__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOSearchCategoryStorage _dictionaryRepresentation:](self, 1);
}

void __54__GEOSearchCategoryStorage__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEOSearchCategoryStorage)initWithDictionary:(id)a3
{
  return (GEOSearchCategoryStorage *)-[GEOSearchCategoryStorage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(uint64_t)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"browseCategory"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOPDBrowseCategory alloc];
        if (v7) {
          objc_super v8 = (void *)-[GEOPDBrowseCategory _initWithDictionary:isJSON:]((uint64_t)v7, v6, a3);
        }
        else {
          objc_super v8 = 0;
        }
        [a1 setBrowseCategory:v8];
      }
      v9 = [v5 objectForKeyedSubscript:@"autocompleteEntry"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [GEOPDAutocompleteEntry alloc];
        if (a3) {
          uint64_t v11 = [(GEOPDAutocompleteEntry *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEOPDAutocompleteEntry *)v10 initWithDictionary:v9];
        }
        objc_super v12 = (void *)v11;
        [a1 setAutocompleteEntry:v11];
      }
    }
  }

  return a1;
}

- (GEOSearchCategoryStorage)initWithJSON:(id)a3
{
  return (GEOSearchCategoryStorage *)-[GEOSearchCategoryStorage _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3149;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3150;
    }
    GEOSearchCategoryStorageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    -[GEOPDBrowseCategory readAll:]((uint64_t)self->_browseCategory, 1);
    [(GEOPDAutocompleteEntry *)self->_autocompleteEntry readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSearchCategoryStorageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSearchCategoryStorageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOSearchCategoryStorageIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOSearchCategoryStorage *)self readAll:0];
    if (self->_browseCategory) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_autocompleteEntry)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOSearchCategoryStorage _readAutocompleteEntry]((uint64_t)self);
  autocompleteEntry = self->_autocompleteEntry;

  return [(GEOPDAutocompleteEntry *)autocompleteEntry hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v4 = (id *)a3;
  [(GEOSearchCategoryStorage *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_browseCategory) {
    objc_msgSend(v4, "setBrowseCategory:");
  }
  if (self->_autocompleteEntry) {
    objc_msgSend(v4, "setAutocompleteEntry:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOSearchCategoryStorage *)self readAll:0];
    id v8 = [(GEOPDBrowseCategory *)self->_browseCategory copyWithZone:a3];
    v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    id v10 = [(GEOPDAutocompleteEntry *)self->_autocompleteEntry copyWithZone:a3];
    uint64_t v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOSearchCategoryStorageReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOSearchCategoryStorage *)self readAll:1],
         [v4 readAll:1],
         browseCategory = self->_browseCategory,
         !((unint64_t)browseCategory | v4[4]))
     || -[GEOPDBrowseCategory isEqual:](browseCategory, "isEqual:")))
  {
    autocompleteEntry = self->_autocompleteEntry;
    if ((unint64_t)autocompleteEntry | v4[3]) {
      char v7 = -[GEOPDAutocompleteEntry isEqual:](autocompleteEntry, "isEqual:");
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
  [(GEOSearchCategoryStorage *)self readAll:1];
  unint64_t v3 = [(GEOPDBrowseCategory *)self->_browseCategory hash];
  return [(GEOPDAutocompleteEntry *)self->_autocompleteEntry hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  browseCategory = self->_browseCategory;
  uint64_t v5 = (void *)v8[4];
  if (browseCategory)
  {
    if (v5) {
      -[GEOPDBrowseCategory mergeFrom:]((uint64_t)browseCategory, v5);
    }
  }
  else if (v5)
  {
    [(GEOSearchCategoryStorage *)self setBrowseCategory:v8[4]];
  }
  autocompleteEntry = self->_autocompleteEntry;
  uint64_t v7 = v8[3];
  if (autocompleteEntry)
  {
    if (v7) {
      -[GEOPDAutocompleteEntry mergeFrom:](autocompleteEntry, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOSearchCategoryStorage setAutocompleteEntry:](self, "setAutocompleteEntry:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOSearchCategoryStorageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3154);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOSearchCategoryStorage *)self readAll:0];
    -[GEOPDBrowseCategory clearUnknownFields:]((uint64_t)self->_browseCategory, 1);
    autocompleteEntry = self->_autocompleteEntry;
    [(GEOPDAutocompleteEntry *)autocompleteEntry clearUnknownFields:1];
  }
}

@end