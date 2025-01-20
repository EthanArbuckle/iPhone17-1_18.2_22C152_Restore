@interface GEOPDAutocompleteEntryCategory
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDisplayName;
- (BOOL)hasStyleAttributes;
- (BOOL)hasSuggestionEntryMetadata;
- (BOOL)hasVenueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocalizedString)displayName;
- (GEOPDAutocompleteEntryCategory)init;
- (GEOPDAutocompleteEntryCategory)initWithData:(id)a3;
- (GEOPDAutocompleteEntryCategory)initWithDictionary:(id)a3;
- (GEOPDAutocompleteEntryCategory)initWithJSON:(id)a3;
- (GEOPDVenueIdentifier)venueIdentifier;
- (GEOStyleAttributes)styleAttributes;
- (NSData)suggestionEntryMetadata;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDisplayName;
- (void)_readStyleAttributes;
- (void)_readSuggestionEntryMetadata;
- (void)_readVenueIdentifier;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDisplayName:(id)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setSuggestionEntryMetadata:(id)a3;
- (void)setVenueIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteEntryCategory

- (GEOPDAutocompleteEntryCategory)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteEntryCategory;
  v2 = [(GEOPDAutocompleteEntryCategory *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteEntryCategory)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteEntryCategory;
  v3 = [(GEOPDAutocompleteEntryCategory *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryCategoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (GEOLocalizedString)displayName
{
  -[GEOPDAutocompleteEntryCategory _readDisplayName]((uint64_t)self);
  displayName = self->_displayName;

  return displayName;
}

- (void)setDisplayName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (void)_readStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryCategoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasStyleAttributes
{
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOPDAutocompleteEntryCategory _readStyleAttributes]((uint64_t)self);
  styleAttributes = self->_styleAttributes;

  return styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readSuggestionEntryMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryCategoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionEntryMetadata_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasSuggestionEntryMetadata
{
  return self->_suggestionEntryMetadata != 0;
}

- (NSData)suggestionEntryMetadata
{
  -[GEOPDAutocompleteEntryCategory _readSuggestionEntryMetadata]((uint64_t)self);
  suggestionEntryMetadata = self->_suggestionEntryMetadata;

  return suggestionEntryMetadata;
}

- (void)setSuggestionEntryMetadata:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_suggestionEntryMetadata, a3);
}

- (void)_readVenueIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryCategoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVenueIdentifier_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasVenueIdentifier
{
  return self->_venueIdentifier != 0;
}

- (GEOPDVenueIdentifier)venueIdentifier
{
  -[GEOPDAutocompleteEntryCategory _readVenueIdentifier]((uint64_t)self);
  venueIdentifier = self->_venueIdentifier;

  return venueIdentifier;
}

- (void)setVenueIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_venueIdentifier, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteEntryCategory;
  v4 = [(GEOPDAutocompleteEntryCategory *)&v8 description];
  v5 = [(GEOPDAutocompleteEntryCategory *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteEntryCategory _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 displayName];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"displayName"];
    }
    objc_super v8 = [a1 styleAttributes];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"styleAttributes";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"style_attributes";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = [a1 suggestionEntryMetadata];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 base64EncodedStringWithOptions:0];
        [v4 setObject:v14 forKey:@"suggestionEntryMetadata"];
      }
      else
      {
        [v4 setObject:v12 forKey:@"suggestion_entry_metadata"];
      }
    }

    v15 = [a1 venueIdentifier];
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"venueIdentifier";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"venue_identifier";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = (void *)a1[2];
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __60__GEOPDAutocompleteEntryCategory__dictionaryRepresentation___block_invoke;
        v26[3] = &unk_1E53D8860;
        id v23 = v22;
        id v27 = v23;
        [v21 enumerateKeysAndObjectsUsingBlock:v26];
        id v24 = v23;

        v21 = v24;
      }
      [v4 setObject:v21 forKey:@"Unknown Fields"];
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
  return -[GEOPDAutocompleteEntryCategory _dictionaryRepresentation:](self, 1);
}

void __60__GEOPDAutocompleteEntryCategory__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteEntryCategory)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteEntryCategory *)-[GEOPDAutocompleteEntryCategory _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"displayName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOLocalizedString alloc];
        if (a3) {
          uint64_t v8 = [(GEOLocalizedString *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOLocalizedString *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setDisplayName:v8];
      }
      if (a3) {
        id v10 = @"styleAttributes";
      }
      else {
        id v10 = @"style_attributes";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [GEOStyleAttributes alloc];
        if (a3) {
          uint64_t v13 = [(GEOStyleAttributes *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOStyleAttributes *)v12 initWithDictionary:v11];
        }
        v14 = (void *)v13;
        [a1 setStyleAttributes:v13];
      }
      if (a3) {
        v15 = @"suggestionEntryMetadata";
      }
      else {
        v15 = @"suggestion_entry_metadata";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v16 options:0];
        [a1 setSuggestionEntryMetadata:v17];
      }
      if (a3) {
        v18 = @"venueIdentifier";
      }
      else {
        v18 = @"venue_identifier";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [GEOPDVenueIdentifier alloc];
        if (v20) {
          v21 = (void *)-[GEOPDVenueIdentifier _initWithDictionary:isJSON:]((uint64_t)v20, v19, a3);
        }
        else {
          v21 = 0;
        }
        [a1 setVenueIdentifier:v21];
      }
    }
  }

  return a1;
}

- (GEOPDAutocompleteEntryCategory)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteEntryCategory *)-[GEOPDAutocompleteEntryCategory _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_557;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_558;
    }
    GEOPDAutocompleteEntryCategoryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDAutocompleteEntryCategoryCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteEntryCategoryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteEntryCategoryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDAutocompleteEntryCategoryIsDirty((uint64_t)self))
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
    [(GEOPDAutocompleteEntryCategory *)self readAll:0];
    if (self->_displayName) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_styleAttributes)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_suggestionEntryMetadata)
    {
      PBDataWriterWriteDataField();
      id v5 = v8;
    }
    if (self->_venueIdentifier)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOPDAutocompleteEntryCategory *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_displayName) {
    objc_msgSend(v5, "setDisplayName:");
  }
  if (self->_styleAttributes) {
    objc_msgSend(v5, "setStyleAttributes:");
  }
  v4 = v5;
  if (self->_suggestionEntryMetadata)
  {
    objc_msgSend(v5, "setSuggestionEntryMetadata:");
    v4 = v5;
  }
  if (self->_venueIdentifier)
  {
    objc_msgSend(v5, "setVenueIdentifier:");
    v4 = v5;
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
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDAutocompleteEntryCategory *)self readAll:0];
    id v8 = [(GEOLocalizedString *)self->_displayName copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    id v10 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    uint64_t v12 = [(NSData *)self->_suggestionEntryMetadata copyWithZone:a3];
    uint64_t v13 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v12;

    id v14 = [(GEOPDVenueIdentifier *)self->_venueIdentifier copyWithZone:a3];
    v15 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDAutocompleteEntryCategoryReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOPDAutocompleteEntryCategory *)self readAll:1],
         [v4 readAll:1],
         displayName = self->_displayName,
         !((unint64_t)displayName | v4[3]))
     || -[GEOLocalizedString isEqual:](displayName, "isEqual:"))
    && ((styleAttributes = self->_styleAttributes, !((unint64_t)styleAttributes | v4[4]))
     || -[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
    && ((suggestionEntryMetadata = self->_suggestionEntryMetadata, !((unint64_t)suggestionEntryMetadata | v4[5]))
     || -[NSData isEqual:](suggestionEntryMetadata, "isEqual:")))
  {
    venueIdentifier = self->_venueIdentifier;
    if ((unint64_t)venueIdentifier | v4[6]) {
      char v9 = -[GEOPDVenueIdentifier isEqual:](venueIdentifier, "isEqual:");
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
  [(GEOPDAutocompleteEntryCategory *)self readAll:1];
  unint64_t v3 = [(GEOLocalizedString *)self->_displayName hash];
  unint64_t v4 = [(GEOStyleAttributes *)self->_styleAttributes hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_suggestionEntryMetadata hash];
  return v4 ^ v5 ^ [(GEOPDVenueIdentifier *)self->_venueIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  [v10 readAll:0];
  displayName = self->_displayName;
  uint64_t v5 = v10[3];
  if (displayName)
  {
    if (v5) {
      -[GEOLocalizedString mergeFrom:](displayName, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOPDAutocompleteEntryCategory setDisplayName:](self, "setDisplayName:");
  }
  styleAttributes = self->_styleAttributes;
  uint64_t v7 = v10[4];
  if (styleAttributes)
  {
    if (v7) {
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOPDAutocompleteEntryCategory setStyleAttributes:](self, "setStyleAttributes:");
  }
  if (v10[5]) {
    -[GEOPDAutocompleteEntryCategory setSuggestionEntryMetadata:](self, "setSuggestionEntryMetadata:");
  }
  venueIdentifier = self->_venueIdentifier;
  char v9 = (void *)v10[6];
  if (venueIdentifier)
  {
    if (v9) {
      -[GEOPDVenueIdentifier mergeFrom:]((uint64_t)venueIdentifier, v9);
    }
  }
  else if (v9)
  {
    [(GEOPDAutocompleteEntryCategory *)self setVenueIdentifier:v10[6]];
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
      GEOPDAutocompleteEntryCategoryReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_562);
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
  *(unsigned char *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDAutocompleteEntryCategory *)self readAll:0];
    [(GEOLocalizedString *)self->_displayName clearUnknownFields:1];
    [(GEOStyleAttributes *)self->_styleAttributes clearUnknownFields:1];
    venueIdentifier = self->_venueIdentifier;
    -[GEOPDVenueIdentifier clearUnknownFields:]((uint64_t)venueIdentifier, 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestionEntryMetadata, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end