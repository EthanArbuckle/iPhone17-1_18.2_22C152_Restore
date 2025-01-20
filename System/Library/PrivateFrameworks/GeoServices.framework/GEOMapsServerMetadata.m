@interface GEOMapsServerMetadata
+ (BOOL)isValid:(id)a3;
+ (Class)mapsSearchResultType;
+ (Class)suggestionEntryMetadataDisplayedType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasSuggestionEntryMetadataTappedOn;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapsServerMetadata)init;
- (GEOMapsServerMetadata)initWithData:(id)a3;
- (GEOMapsServerMetadata)initWithDictionary:(id)a3;
- (GEOMapsServerMetadata)initWithJSON:(id)a3;
- (NSData)suggestionEntryMetadataTappedOn;
- (NSMutableArray)mapsSearchResults;
- (NSMutableArray)suggestionEntryMetadataDisplayeds;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mapsSearchResultAtIndex:(unint64_t)a3;
- (id)suggestionEntryMetadataDisplayedAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)mapsSearchResultsCount;
- (unint64_t)suggestionEntryMetadataDisplayedsCount;
- (void)_addNoFlagsMapsSearchResult:(uint64_t)a1;
- (void)_addNoFlagsSuggestionEntryMetadataDisplayed:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readMapsSearchResults;
- (void)_readSuggestionEntryMetadataDisplayeds;
- (void)_readSuggestionEntryMetadataTappedOn;
- (void)addMapsSearchResult:(id)a3;
- (void)addSuggestionEntryMetadataDisplayed:(id)a3;
- (void)clearMapsSearchResults;
- (void)clearSuggestionEntryMetadataDisplayeds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setMapsSearchResults:(id)a3;
- (void)setSuggestionEntryMetadataDisplayeds:(id)a3;
- (void)setSuggestionEntryMetadataTappedOn:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapsServerMetadata

- (GEOMapsServerMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapsServerMetadata;
  v2 = [(GEOMapsServerMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMapsServerMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMapsServerMetadata;
  v3 = [(GEOMapsServerMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSuggestionEntryMetadataTappedOn
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
        GEOMapsServerMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionEntryMetadataTappedOn_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasSuggestionEntryMetadataTappedOn
{
  return self->_suggestionEntryMetadataTappedOn != 0;
}

- (NSData)suggestionEntryMetadataTappedOn
{
  -[GEOMapsServerMetadata _readSuggestionEntryMetadataTappedOn]((uint64_t)self);
  suggestionEntryMetadataTappedOn = self->_suggestionEntryMetadataTappedOn;

  return suggestionEntryMetadataTappedOn;
}

- (void)setSuggestionEntryMetadataTappedOn:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_suggestionEntryMetadataTappedOn, a3);
}

- (void)_readSuggestionEntryMetadataDisplayeds
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
        GEOMapsServerMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionEntryMetadataDisplayeds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)suggestionEntryMetadataDisplayeds
{
  -[GEOMapsServerMetadata _readSuggestionEntryMetadataDisplayeds]((uint64_t)self);
  suggestionEntryMetadataDisplayeds = self->_suggestionEntryMetadataDisplayeds;

  return suggestionEntryMetadataDisplayeds;
}

- (void)setSuggestionEntryMetadataDisplayeds:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  suggestionEntryMetadataDisplayeds = self->_suggestionEntryMetadataDisplayeds;
  self->_suggestionEntryMetadataDisplayeds = v4;
}

- (void)clearSuggestionEntryMetadataDisplayeds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  suggestionEntryMetadataDisplayeds = self->_suggestionEntryMetadataDisplayeds;

  [(NSMutableArray *)suggestionEntryMetadataDisplayeds removeAllObjects];
}

- (void)addSuggestionEntryMetadataDisplayed:(id)a3
{
  id v4 = a3;
  -[GEOMapsServerMetadata _readSuggestionEntryMetadataDisplayeds]((uint64_t)self);
  -[GEOMapsServerMetadata _addNoFlagsSuggestionEntryMetadataDisplayed:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsSuggestionEntryMetadataDisplayed:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)suggestionEntryMetadataDisplayedsCount
{
  -[GEOMapsServerMetadata _readSuggestionEntryMetadataDisplayeds]((uint64_t)self);
  suggestionEntryMetadataDisplayeds = self->_suggestionEntryMetadataDisplayeds;

  return [(NSMutableArray *)suggestionEntryMetadataDisplayeds count];
}

- (id)suggestionEntryMetadataDisplayedAtIndex:(unint64_t)a3
{
  -[GEOMapsServerMetadata _readSuggestionEntryMetadataDisplayeds]((uint64_t)self);
  suggestionEntryMetadataDisplayeds = self->_suggestionEntryMetadataDisplayeds;

  return (id)[(NSMutableArray *)suggestionEntryMetadataDisplayeds objectAtIndex:a3];
}

+ (Class)suggestionEntryMetadataDisplayedType
{
  return (Class)objc_opt_class();
}

- (void)_readMapsSearchResults
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapsServerMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsSearchResults_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)mapsSearchResults
{
  -[GEOMapsServerMetadata _readMapsSearchResults]((uint64_t)self);
  mapsSearchResults = self->_mapsSearchResults;

  return mapsSearchResults;
}

- (void)setMapsSearchResults:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  mapsSearchResults = self->_mapsSearchResults;
  self->_mapsSearchResults = v4;
}

- (void)clearMapsSearchResults
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  mapsSearchResults = self->_mapsSearchResults;

  [(NSMutableArray *)mapsSearchResults removeAllObjects];
}

- (void)addMapsSearchResult:(id)a3
{
  id v4 = a3;
  -[GEOMapsServerMetadata _readMapsSearchResults]((uint64_t)self);
  -[GEOMapsServerMetadata _addNoFlagsMapsSearchResult:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsMapsSearchResult:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)mapsSearchResultsCount
{
  -[GEOMapsServerMetadata _readMapsSearchResults]((uint64_t)self);
  mapsSearchResults = self->_mapsSearchResults;

  return [(NSMutableArray *)mapsSearchResults count];
}

- (id)mapsSearchResultAtIndex:(unint64_t)a3
{
  -[GEOMapsServerMetadata _readMapsSearchResults]((uint64_t)self);
  mapsSearchResults = self->_mapsSearchResults;

  return (id)[(NSMutableArray *)mapsSearchResults objectAtIndex:a3];
}

+ (Class)mapsSearchResultType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapsServerMetadata;
  id v4 = [(GEOMapsServerMetadata *)&v8 description];
  id v5 = [(GEOMapsServerMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapsServerMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_34;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 suggestionEntryMetadataTappedOn];
  if (!v5)
  {
    if (!*(void *)(a1 + 24)) {
      goto LABEL_19;
    }
    if (a2) {
      goto LABEL_8;
    }
LABEL_17:
    v10 = [(id)a1 suggestionEntryMetadataDisplayeds];
    v17 = @"suggestion_entry_metadata_displayed";
LABEL_18:
    [v4 setObject:v10 forKey:v17];

    goto LABEL_19;
  }
  objc_super v6 = v5;
  if ((a2 & 1) == 0)
  {
    [v4 setObject:v5 forKey:@"suggestion_entry_metadata_tapped_on"];

    if (!*(void *)(a1 + 24)) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  id v7 = [v5 base64EncodedStringWithOptions:0];
  [v4 setObject:v7 forKey:@"suggestionEntryMetadataTappedOn"];

  if (*(void *)(a1 + 24))
  {
LABEL_8:
    objc_super v8 = (void *)MEMORY[0x1E4F1CA48];
    v9 = [(id)a1 suggestionEntryMetadataDisplayeds];
    v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v11 = [(id)a1 suggestionEntryMetadataDisplayeds];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v32 + 1) + 8 * i) base64EncodedStringWithOptions:0];
          [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v13);
    }

    v17 = @"suggestionEntryMetadataDisplayed";
    goto LABEL_18;
  }
LABEL_19:
  if ([*(id *)(a1 + 16) count])
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v19 = *(id *)(a1 + 16);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v28 + 1) + 8 * j);
          if (a2) {
            [v24 jsonRepresentation];
          }
          else {
          v25 = objc_msgSend(v24, "dictionaryRepresentation", (void)v28);
          }
          objc_msgSend(v18, "addObject:", v25, (void)v28);
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v21);
    }

    if (a2) {
      v26 = @"mapsSearchResult";
    }
    else {
      v26 = @"maps_search_result";
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v26, (void)v28);
  }
LABEL_34:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMapsServerMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOMapsServerMetadata)initWithDictionary:(id)a3
{
  return (GEOMapsServerMetadata *)-[GEOMapsServerMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"suggestionEntryMetadataTappedOn";
      }
      else {
        objc_super v6 = @"suggestion_entry_metadata_tapped_on";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
        [a1 setSuggestionEntryMetadataTappedOn:v8];
      }
      if (a3) {
        v9 = @"suggestionEntryMetadataDisplayed";
      }
      else {
        v9 = @"suggestion_entry_metadata_displayed";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      id v30 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v36 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v16 options:0];
                [a1 addSuggestionEntryMetadataDisplayed:v17];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
          }
          while (v13);
        }

        id v5 = v30;
      }

      if (a3) {
        v18 = @"mapsSearchResult";
      }
      else {
        v18 = @"maps_search_result";
      }
      id v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v20 = v19;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v32 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void *)(*((void *)&v31 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v26 = [GEOMapsSearchResult alloc];
                if (a3) {
                  uint64_t v27 = [(GEOMapsSearchResult *)v26 initWithJSON:v25];
                }
                else {
                  uint64_t v27 = [(GEOMapsSearchResult *)v26 initWithDictionary:v25];
                }
                long long v28 = (void *)v27;
                [a1 addMapsSearchResult:v27];
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v22);
        }

        id v5 = v30;
      }
    }
  }

  return a1;
}

- (GEOMapsServerMetadata)initWithJSON:(id)a3
{
  return (GEOMapsServerMetadata *)-[GEOMapsServerMetadata _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_691;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_692;
    }
    GEOMapsServerMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOMapsServerMetadataCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapsServerMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapsServerMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOMapsServerMetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOMapsServerMetadata *)self readAll:0];
    if (self->_suggestionEntryMetadataTappedOn) {
      PBDataWriterWriteDataField();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_suggestionEntryMetadataDisplayeds;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteDataField();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v10 = self->_mapsSearchResults;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOMapsServerMetadata _readMapsSearchResults]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_mapsSearchResults;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  long long v12 = (id *)a3;
  [(GEOMapsServerMetadata *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 10) = self->_readerMarkPos;
  *((_DWORD *)v12 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_suggestionEntryMetadataTappedOn) {
    objc_msgSend(v12, "setSuggestionEntryMetadataTappedOn:");
  }
  if ([(GEOMapsServerMetadata *)self suggestionEntryMetadataDisplayedsCount])
  {
    [v12 clearSuggestionEntryMetadataDisplayeds];
    unint64_t v4 = [(GEOMapsServerMetadata *)self suggestionEntryMetadataDisplayedsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOMapsServerMetadata *)self suggestionEntryMetadataDisplayedAtIndex:i];
        [v12 addSuggestionEntryMetadataDisplayed:v7];
      }
    }
  }
  if ([(GEOMapsServerMetadata *)self mapsSearchResultsCount])
  {
    [v12 clearMapsSearchResults];
    unint64_t v8 = [(GEOMapsServerMetadata *)self mapsSearchResultsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOMapsServerMetadata *)self mapsSearchResultAtIndex:j];
        [v12 addMapsSearchResult:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOMapsServerMetadataReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOMapsServerMetadata *)self readAll:0];
  uint64_t v8 = [(NSData *)self->_suggestionEntryMetadataTappedOn copyWithZone:a3];
  unint64_t v9 = (void *)v5[4];
  v5[4] = v8;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  BOOL v10 = self->_suggestionEntryMetadataDisplayeds;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v13) copyWithZone:a3];
        [v5 addSuggestionEntryMetadataDisplayed:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v11);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v15 = self->_mapsSearchResults;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v15);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [v5 addMapsSearchResult:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOMapsServerMetadata *)self readAll:1],
         [v4 readAll:1],
         suggestionEntryMetadataTappedOn = self->_suggestionEntryMetadataTappedOn,
         !((unint64_t)suggestionEntryMetadataTappedOn | v4[4]))
     || -[NSData isEqual:](suggestionEntryMetadataTappedOn, "isEqual:"))
    && ((suggestionEntryMetadataDisplayeds = self->_suggestionEntryMetadataDisplayeds,
         !((unint64_t)suggestionEntryMetadataDisplayeds | v4[3]))
     || -[NSMutableArray isEqual:](suggestionEntryMetadataDisplayeds, "isEqual:")))
  {
    mapsSearchResults = self->_mapsSearchResults;
    if ((unint64_t)mapsSearchResults | v4[2]) {
      char v8 = -[NSMutableArray isEqual:](mapsSearchResults, "isEqual:");
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
  [(GEOMapsServerMetadata *)self readAll:1];
  uint64_t v3 = [(NSData *)self->_suggestionEntryMetadataTappedOn hash];
  uint64_t v4 = [(NSMutableArray *)self->_suggestionEntryMetadataDisplayeds hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_mapsSearchResults hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  if (v4[4]) {
    -[GEOMapsServerMetadata setSuggestionEntryMetadataTappedOn:](self, "setSuggestionEntryMetadataTappedOn:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4[3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOMapsServerMetadata *)self addSuggestionEntryMetadataDisplayed:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[2];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOMapsServerMetadata addMapsSearchResult:](self, "addMapsSearchResult:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionEntryMetadataTappedOn, 0);
  objc_storeStrong((id *)&self->_suggestionEntryMetadataDisplayeds, 0);
  objc_storeStrong((id *)&self->_mapsSearchResults, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end