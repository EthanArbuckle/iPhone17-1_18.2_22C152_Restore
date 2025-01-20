@interface GEOPDRelatedSearchSuggestion
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDRelatedSearchSuggestion)init;
- (GEOPDRelatedSearchSuggestion)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayString;
- (id)jsonRepresentation;
- (id)searchBarDisplayToken;
- (id)suggestionEntryMetadata;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDisplayString;
- (void)_readSearchBarDisplayToken;
- (void)_readSuggestionEntryMetadata;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setDisplayString:(uint64_t)a1;
- (void)setSearchBarDisplayToken:(uint64_t)a1;
- (void)setSuggestionEntryMetadata:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDRelatedSearchSuggestion

- (GEOPDRelatedSearchSuggestion)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDRelatedSearchSuggestion;
  v2 = [(GEOPDRelatedSearchSuggestion *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDRelatedSearchSuggestion)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDRelatedSearchSuggestion;
  v3 = [(GEOPDRelatedSearchSuggestion *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDRelatedSearchSuggestionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayString_tags_384);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)displayString
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDRelatedSearchSuggestion _readDisplayString]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDisplayString:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 60) |= 2u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)_readSuggestionEntryMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDRelatedSearchSuggestionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionEntryMetadata_tags_385);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)suggestionEntryMetadata
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDRelatedSearchSuggestion _readSuggestionEntryMetadata]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSuggestionEntryMetadata:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 60) |= 8u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)_readSearchBarDisplayToken
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDRelatedSearchSuggestionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchBarDisplayToken_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)searchBarDisplayToken
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDRelatedSearchSuggestion _readSearchBarDisplayToken]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSearchBarDisplayToken:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 60) |= 4u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDRelatedSearchSuggestion;
  id v4 = [(GEOPDRelatedSearchSuggestion *)&v8 description];
  v5 = [(GEOPDRelatedSearchSuggestion *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDRelatedSearchSuggestion _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDRelatedSearchSuggestion readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDRelatedSearchSuggestion displayString]((id *)a1);
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"displayString";
      }
      else {
        objc_super v6 = @"display_string";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = -[GEOPDRelatedSearchSuggestion suggestionEntryMetadata]((id *)a1);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 base64EncodedStringWithOptions:0];
        [v4 setObject:v9 forKey:@"suggestionEntryMetadata"];
      }
      else
      {
        [v4 setObject:v7 forKey:@"suggestion_entry_metadata"];
      }
    }

    v10 = -[GEOPDRelatedSearchSuggestion searchBarDisplayToken]((id *)a1);
    if (v10)
    {
      if (a2) {
        v11 = @"searchBarDisplayToken";
      }
      else {
        v11 = @"search_bar_display_token";
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
        v19[2] = __58__GEOPDRelatedSearchSuggestion__dictionaryRepresentation___block_invoke;
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
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDRelatedSearchSuggestion _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_392;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_393;
      }
      GEOPDRelatedSearchSuggestionReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __58__GEOPDRelatedSearchSuggestion__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"displayString";
      }
      else {
        objc_super v6 = @"display_string";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        -[GEOPDRelatedSearchSuggestion setDisplayString:]((uint64_t)a1, v8);
      }
      if (a3) {
        v9 = @"suggestionEntryMetadata";
      }
      else {
        v9 = @"suggestion_entry_metadata";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v10 options:0];
        -[GEOPDRelatedSearchSuggestion setSuggestionEntryMetadata:]((uint64_t)a1, v11);
      }
      if (a3) {
        v12 = @"searchBarDisplayToken";
      }
      else {
        v12 = @"search_bar_display_token";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        -[GEOPDRelatedSearchSuggestion setSearchBarDisplayToken:]((uint64_t)a1, v14);
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDRelatedSearchSuggestionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
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
    -[GEOPDRelatedSearchSuggestion readAll:]((uint64_t)self, 0);
    if (self->_displayString) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_suggestionEntryMetadata)
    {
      PBDataWriterWriteDataField();
      id v5 = v8;
    }
    if (self->_searchBarDisplayToken)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
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
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDRelatedSearchSuggestion readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_displayString copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    uint64_t v10 = [(NSData *)self->_suggestionEntryMetadata copyWithZone:a3];
    v11 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;

    uint64_t v12 = [(NSString *)self->_searchBarDisplayToken copyWithZone:a3];
    v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDRelatedSearchSuggestionReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDRelatedSearchSuggestion readAll:]((uint64_t)self, 1),
         -[GEOPDRelatedSearchSuggestion readAll:]((uint64_t)v4, 1),
         displayString = self->_displayString,
         !((unint64_t)displayString | v4[3]))
     || -[NSString isEqual:](displayString, "isEqual:"))
    && ((suggestionEntryMetadata = self->_suggestionEntryMetadata, !((unint64_t)suggestionEntryMetadata | v4[5]))
     || -[NSData isEqual:](suggestionEntryMetadata, "isEqual:")))
  {
    searchBarDisplayToken = self->_searchBarDisplayToken;
    if ((unint64_t)searchBarDisplayToken | v4[4]) {
      char v8 = -[NSString isEqual:](searchBarDisplayToken, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDRelatedSearchSuggestion readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_displayString hash];
  uint64_t v4 = [(NSData *)self->_suggestionEntryMetadata hash] ^ v3;
  return v4 ^ [(NSString *)self->_searchBarDisplayToken hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  NSUInteger v3 = a2;
  if (a1)
  {
    objc_super v7 = v3;
    -[GEOPDRelatedSearchSuggestion readAll:]((uint64_t)v3, 0);
    NSUInteger v3 = v7;
    uint64_t v4 = (void *)v7[3];
    if (v4)
    {
      -[GEOPDRelatedSearchSuggestion setDisplayString:](a1, v4);
      NSUInteger v3 = v7;
    }
    uint64_t v5 = (void *)v3[5];
    if (v5)
    {
      -[GEOPDRelatedSearchSuggestion setSuggestionEntryMetadata:](a1, v5);
      NSUInteger v3 = v7;
    }
    objc_super v6 = (void *)v3[4];
    if (v6)
    {
      -[GEOPDRelatedSearchSuggestion setSearchBarDisplayToken:](a1, v6);
      NSUInteger v3 = v7;
    }
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 1u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDRelatedSearchSuggestion readAll:](a1, 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionEntryMetadata, 0);
  objc_storeStrong((id *)&self->_searchBarDisplayToken, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end