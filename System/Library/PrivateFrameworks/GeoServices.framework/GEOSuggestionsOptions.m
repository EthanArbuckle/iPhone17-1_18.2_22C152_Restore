@interface GEOSuggestionsOptions
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSuggestionsOptions)init;
- (GEOSuggestionsOptions)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)setSuggestionEntryMetadata:(uint64_t)a1;
- (void)setSuggestionMetadata:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOSuggestionsOptions

- (GEOSuggestionsOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOSuggestionsOptions;
  v2 = [(GEOSuggestionsOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSuggestionsOptions)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSuggestionsOptions;
  v3 = [(GEOSuggestionsOptions *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setSuggestionMetadata:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 64) |= 0x40u;
  *(unsigned char *)(a1 + 64) |= 0x80u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setSuggestionEntryMetadata:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 64) |= 0x20u;
  *(unsigned char *)(a1 + 64) |= 0x80u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSuggestionsOptions;
  id v4 = [(GEOSuggestionsOptions *)&v8 description];
  v5 = [(GEOSuggestionsOptions *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSuggestionsOptions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOSuggestionsOptions readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 64);
    if ((v5 & 2) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 56);
      if (v6 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 56));
        objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v7 = off_1E53E7250[v6];
      }
      [v4 setObject:v7 forKey:@"listType"];

      char v5 = *(unsigned char *)(a1 + 64);
    }
    if (v5)
    {
      uint64_t v8 = *(int *)(a1 + 52);
      if (v8 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E53E7268[v8];
      }
      [v4 setObject:v9 forKey:@"entriesType"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 64) & 0x40) == 0)
    {
      v10 = *(void **)(a1 + 8);
      if (v10)
      {
        id v11 = v10;
        objc_sync_enter(v11);
        GEOSuggestionsOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionMetadata_tags_3389);
        objc_sync_exit(v11);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v12 = *(id *)(a1 + 32);
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 base64EncodedStringWithOptions:0];
        [v4 setObject:v14 forKey:@"suggestionMetadata"];
      }
      else
      {
        [v4 setObject:v12 forKey:@"suggestionMetadata"];
      }
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 64) & 0x20) == 0)
    {
      v15 = *(void **)(a1 + 8);
      if (v15)
      {
        id v16 = v15;
        objc_sync_enter(v16);
        GEOSuggestionsOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionEntryMetadata_tags_3390);
        objc_sync_exit(v16);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v17 = *(id *)(a1 + 24);
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 base64EncodedStringWithOptions:0];
        [v4 setObject:v19 forKey:@"suggestionEntryMetadata"];
      }
      else
      {
        [v4 setObject:v17 forKey:@"suggestionEntryMetadata"];
      }
    }

    char v20 = *(unsigned char *)(a1 + 64);
    if ((v20 & 8) != 0)
    {
      v21 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 61)];
      [v4 setObject:v21 forKey:@"normalizePOIs"];

      char v20 = *(unsigned char *)(a1 + 64);
    }
    if ((v20 & 4) != 0)
    {
      v22 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 60)];
      [v4 setObject:v22 forKey:@"includeRankingFeatures"];
    }
    v23 = *(void **)(a1 + 16);
    if (v23)
    {
      v24 = [v23 dictionaryRepresentation];
      v25 = v24;
      if (a2)
      {
        v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __51__GEOSuggestionsOptions__dictionaryRepresentation___block_invoke;
        v30[3] = &unk_1E53D8860;
        id v27 = v26;
        id v31 = v27;
        [v25 enumerateKeysAndObjectsUsingBlock:v30];
        id v28 = v27;

        v25 = v28;
      }
      [v4 setObject:v25 forKey:@"Unknown Fields"];
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
  return -[GEOSuggestionsOptions _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_3403;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_3404;
      }
      GEOSuggestionsOptionsReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __51__GEOSuggestionsOptions__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOSuggestionsOptionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 0x1Fu))
  {
    uint64_t v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOSuggestionsOptions readAll:]((uint64_t)self, 0);
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    id v6 = v10;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      id v6 = v10;
    }
    if (self->_suggestionMetadata)
    {
      PBDataWriterWriteDataField();
      id v6 = v10;
    }
    if (self->_suggestionEntryMetadata)
    {
      PBDataWriterWriteDataField();
      id v6 = v10;
    }
    char v7 = (char)self->_flags;
    if ((v7 & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v6 = v10;
      char v7 = (char)self->_flags;
    }
    if ((v7 & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v6 = v10;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    char v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOSuggestionsOptionsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOSuggestionsOptions readAll:]((uint64_t)self, 0);
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_listType;
    *(unsigned char *)(v5 + 64) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 52) = self->_entriesType;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  uint64_t v10 = [(NSData *)self->_suggestionMetadata copyWithZone:a3];
  id v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSData *)self->_suggestionEntryMetadata copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  char v14 = (char)self->_flags;
  if ((v14 & 8) != 0)
  {
    *(unsigned char *)(v5 + 61) = self->_normalizePOIs;
    *(unsigned char *)(v5 + 64) |= 8u;
    char v14 = (char)self->_flags;
  }
  if ((v14 & 4) != 0)
  {
    *(unsigned char *)(v5 + 60) = self->_includeRankingFeatures;
    *(unsigned char *)(v5 + 64) |= 4u;
  }
  v15 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v15;
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  -[GEOSuggestionsOptions readAll:]((uint64_t)self, 1);
  -[GEOSuggestionsOptions readAll:]((uint64_t)v4, 1);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_listType != *((_DWORD *)v4 + 14)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_entriesType != *((_DWORD *)v4 + 13)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_26;
  }
  suggestionMetadata = self->_suggestionMetadata;
  if ((unint64_t)suggestionMetadata | *((void *)v4 + 4)
    && !-[NSData isEqual:](suggestionMetadata, "isEqual:"))
  {
    goto LABEL_26;
  }
  suggestionEntryMetadata = self->_suggestionEntryMetadata;
  if ((unint64_t)suggestionEntryMetadata | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](suggestionEntryMetadata, "isEqual:")) {
      goto LABEL_26;
    }
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0) {
      goto LABEL_26;
    }
    if (self->_normalizePOIs)
    {
      if (!*((unsigned char *)v4 + 61)) {
        goto LABEL_26;
      }
    }
    else if (*((unsigned char *)v4 + 61))
    {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_26;
  }
  BOOL v7 = (*((unsigned char *)v4 + 64) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) != 0)
    {
      if (self->_includeRankingFeatures)
      {
        if (!*((unsigned char *)v4 + 60)) {
          goto LABEL_26;
        }
      }
      else if (*((unsigned char *)v4 + 60))
      {
        goto LABEL_26;
      }
      BOOL v7 = 1;
      goto LABEL_27;
    }
LABEL_26:
    BOOL v7 = 0;
  }
LABEL_27:

  return v7;
}

- (unint64_t)hash
{
  -[GEOSuggestionsOptions readAll:]((uint64_t)self, 1);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_listType;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_entriesType;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSData *)self->_suggestionMetadata hash];
  uint64_t v6 = [(NSData *)self->_suggestionEntryMetadata hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v7 = 2654435761 * self->_normalizePOIs;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_includeRankingFeatures;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionMetadata, 0);
  objc_storeStrong((id *)&self->_suggestionEntryMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end