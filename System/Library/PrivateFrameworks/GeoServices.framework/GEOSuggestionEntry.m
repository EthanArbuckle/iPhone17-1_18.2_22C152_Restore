@interface GEOSuggestionEntry
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSuggestionEntry)init;
- (GEOSuggestionEntry)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_reserveTextHighlights:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsDisplayLine:(uint64_t)a1;
- (void)_addNoFlagsNamedFeature:(uint64_t)a1;
- (void)_readDisplayLines;
- (void)_readLatlng;
- (void)addDisplayLine:(uint64_t)a1;
- (void)addNamedFeature:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOSuggestionEntry

- (GEOSuggestionEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOSuggestionEntry;
  v2 = [(GEOSuggestionEntry *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSuggestionEntry)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSuggestionEntry;
  v3 = [(GEOSuggestionEntry *)&v7 initWithData:a3];
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
  if (self)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)&self->_flags |= 2u;
    os_unfair_lock_unlock(&self->_readerLock);
    *(_WORD *)&self->_flags |= 0x200u;
    self->_textHighlightsSpace = 0;
    self->_textHighlightsCount = 0;
    free(self->_textHighlights);
    self->_textHighlights = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOSuggestionEntry;
  [(GEOSuggestionEntry *)&v3 dealloc];
}

- (void)_readDisplayLines
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(_WORD *)(a1 + 116) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOSuggestionEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayLines_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
}

- (void)addDisplayLine:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOSuggestionEntry _readDisplayLines](a1);
    -[GEOSuggestionEntry _addNoFlagsDisplayLine:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 116) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    *(_WORD *)(a1 + 116) |= 0x200u;
  }
}

- (void)_addNoFlagsDisplayLine:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (uint64_t)_reserveTextHighlights:(uint64_t)result
{
  if (result)
  {
    v2 = (void *)result;
    unint64_t v3 = *(void *)(result + 32);
    unint64_t v4 = v3 + a2;
    if (v3 + a2 <= v3) {
      return 0;
    }
    unint64_t v5 = *(void *)(result + 40);
    if (v5 >= v4) {
      return 1;
    }
    unint64_t v6 = v5 + a2;
    if (v5 + a2)
    {
      unint64_t v7 = 1;
      while (1)
      {
        unint64_t v8 = v7;
        if (v7 >= v6) {
          break;
        }
        v7 *= 2;
        if ((v8 & 0x8000000000000000) != 0)
        {
          unint64_t v8 = -1;
          goto LABEL_11;
        }
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
    if (v8 < a2) {
      return 0;
    }
LABEL_11:
    if (16 * v8 < v8) {
      return 0;
    }
    result = (uint64_t)malloc_type_realloc(*(void **)(result + 24), 16 * v8, 0x810F3F03uLL);
    if (result)
    {
      v2[5] = v8;
      v2[3] = result;
      bzero((void *)(result + 16 * v2[4]), 16 * (v8 - v2[4]));
      return 1;
    }
  }
  return result;
}

- (void)_readLatlng
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(_WORD *)(a1 + 116) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOSuggestionEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLatlng_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
}

- (void)addNamedFeature:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x40) == 0)
    {
      unint64_t v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOSuggestionEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNamedFeatures_tags_3311);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    -[GEOSuggestionEntry _addNoFlagsNamedFeature:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 116) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    *(_WORD *)(a1 + 116) |= 0x200u;
  }
}

- (void)_addNoFlagsNamedFeature:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    unint64_t v4 = *(void **)(a1 + 80);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v5;

      unint64_t v4 = *(void **)(a1 + 80);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSuggestionEntry;
  unint64_t v4 = [(GEOSuggestionEntry *)&v8 description];
  id v5 = [(GEOSuggestionEntry *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSuggestionEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOSuggestionEntry readAll:](a1, 1);
    id v46 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 56))
    {
      -[GEOSuggestionEntry _readDisplayLines](a1);
      id v4 = *(id *)(a1 + 56);
      [v46 setObject:v4 forKey:@"displayLine"];
    }
    if (*(void *)(a1 + 32))
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 32)];
      if (*(void *)(a1 + 32))
      {
        uint64_t v6 = 0;
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(void *)(a1 + 24);
          v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v46);
          uint64_t v10 = v8 + v6;
          char v11 = *(unsigned char *)(v8 + v6 + 12);
          if (v11)
          {
            v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v8 + v6)];
            [v9 setObject:v12 forKey:@"length"];

            char v11 = *(unsigned char *)(v10 + 12);
          }
          if ((v11 & 2) != 0)
          {
            v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v8 + v6 + 4)];
            [v9 setObject:v13 forKey:@"lineNumber"];

            char v11 = *(unsigned char *)(v10 + 12);
          }
          if ((v11 & 4) != 0)
          {
            v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v8 + v6 + 8)];
            [v9 setObject:v14 forKey:@"startIndex"];
          }
          [v5 addObject:v9];

          ++v7;
          v6 += 16;
        }
        while (v7 < *(void *)(a1 + 32));
      }
      objc_msgSend(v46, "setObject:forKey:", v5, @"textHighlights", v46);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x10) == 0)
    {
      v15 = *(void **)(a1 + 8);
      if (v15)
      {
        id v16 = v15;
        objc_sync_enter(v16);
        GEOSuggestionEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIconID_tags);
        objc_sync_exit(v16);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    id v17 = *(id *)(a1 + 64);
    if (v17) {
      [v46 setObject:v17 forKey:@"iconID"];
    }

    -[GEOSuggestionEntry _readLatlng](a1);
    id v18 = *(id *)(a1 + 72);
    v19 = v18;
    if (v18)
    {
      if (a2) {
        [v18 jsonRepresentation];
      }
      else {
      v20 = [v18 dictionaryRepresentation];
      }
      objc_msgSend(v46, "setObject:forKey:", v20, @"latlng", v46);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x100) == 0)
    {
      v21 = *(void **)(a1 + 8);
      if (v21)
      {
        id v22 = v21;
        objc_sync_enter(v22);
        GEOSuggestionEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionEntryMetadata_tags_2);
        objc_sync_exit(v22);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    id v23 = *(id *)(a1 + 96);
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 base64EncodedStringWithOptions:0];
        [v46 setObject:v25 forKey:@"suggestionEntryMetadata"];
      }
      else
      {
        [v46 setObject:v23 forKey:@"suggestionEntryMetadata"];
      }
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x80) == 0)
    {
      v26 = *(void **)(a1 + 8);
      if (v26)
      {
        id v27 = v26;
        objc_sync_enter(v27);
        GEOSuggestionEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchQueryDisplayString_tags);
        objc_sync_exit(v27);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    id v28 = *(id *)(a1 + 88);
    if (v28) {
      [v46 setObject:v28 forKey:@"searchQueryDisplayString"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 4) == 0)
    {
      v29 = *(void **)(a1 + 8);
      if (v29)
      {
        id v30 = v29;
        objc_sync_enter(v30);
        GEOSuggestionEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCalloutTitle_tags);
        objc_sync_exit(v30);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    id v31 = *(id *)(a1 + 48);
    if (v31) {
      [v46 setObject:v31 forKey:@"calloutTitle"];
    }

    if ([*(id *)(a1 + 80) count])
    {
      v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v33 = *(id *)(a1 + 80);
      uint64_t v34 = [v33 countByEnumeratingWithState:&v52 objects:v56 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v53 != v35) {
              objc_enumerationMutation(v33);
            }
            v37 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            if (a2) {
              [v37 jsonRepresentation];
            }
            else {
            v38 = [v37 dictionaryRepresentation];
            }
            objc_msgSend(v32, "addObject:", v38, v46);
          }
          uint64_t v34 = [v33 countByEnumeratingWithState:&v52 objects:v56 count:16];
        }
        while (v34);
      }

      [v46 setObject:v32 forKey:@"namedFeature"];
    }
    v39 = *(void **)(a1 + 16);
    if (v39)
    {
      v40 = [v39 dictionaryRepresentation];
      v41 = v40;
      if (a2)
      {
        v42 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v40, "count"));
        uint64_t v47 = MEMORY[0x1E4F143A8];
        uint64_t v48 = 3221225472;
        v49 = __48__GEOSuggestionEntry__dictionaryRepresentation___block_invoke;
        v50 = &unk_1E53D8860;
        id v43 = v42;
        id v51 = v43;
        [v41 enumerateKeysAndObjectsUsingBlock:&v47];
        id v44 = v43;
      }
      else
      {
        id v44 = v40;
      }
      objc_msgSend(v46, "setObject:forKey:", v44, @"Unknown Fields", v46, v47, v48, v49, v50);
    }
  }
  else
  {
    id v46 = 0;
  }

  return v46;
}

- (id)jsonRepresentation
{
  return -[GEOSuggestionEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_3333;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_3334;
      }
      GEOSuggestionEntryReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOSuggestionEntryCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

void __48__GEOSuggestionEntry__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
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
  return GEOSuggestionEntryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3FE) == 0))
  {
    id v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOSuggestionEntry readAll:]((uint64_t)self, 0);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v6 = self->_displayLines;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v7);
    }

    if (self->_textHighlightsCount)
    {
      uint64_t v10 = 0;
      unint64_t v11 = 0;
      do
      {
        uint64_t v24 = 0;
        PBDataWriterPlaceMark();
        v12 = &self->_textHighlights[v10];
        char var3 = (char)v12->var3;
        if ((var3 & 2) != 0)
        {
          PBDataWriterWriteUint32Field();
          char var3 = (char)v12->var3;
        }
        if ((var3 & 4) != 0)
        {
          PBDataWriterWriteUint32Field();
          char var3 = (char)v12->var3;
        }
        if (var3) {
          PBDataWriterWriteUint32Field();
        }
        PBDataWriterRecallMark();
        ++v11;
        ++v10;
      }
      while (v11 < self->_textHighlightsCount);
    }
    if (self->_iconID) {
      PBDataWriterWriteStringField();
    }
    if (self->_latlng) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_suggestionEntryMetadata) {
      PBDataWriterWriteDataField();
    }
    if (self->_searchQueryDisplayString) {
      PBDataWriterWriteStringField();
    }
    if (self->_calloutTitle) {
      PBDataWriterWriteStringField();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v14 = self->_namedFeatures;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v29 count:16];
      }
      while (v15);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOSuggestionEntryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOSuggestionEntry readAll:]((uint64_t)self, 0);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v8 = self->_displayLines;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * i) copyWithZone:a3];
        -[GEOSuggestionEntry addDisplayLine:](v5, v12);
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v9);
  }

  unint64_t textHighlightsCount = self->_textHighlightsCount;
  if (textHighlightsCount)
  {
    -[GEOSuggestionEntry _reserveTextHighlights:](v5, textHighlightsCount);
    memcpy(*(void **)(v5 + 24), self->_textHighlights, 16 * self->_textHighlightsCount);
    *(void *)(v5 + 32) = self->_textHighlightsCount;
  }
  uint64_t v14 = [(NSString *)self->_iconID copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  id v16 = [(GEOLatLng *)self->_latlng copyWithZone:a3];
  id v17 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v16;

  uint64_t v18 = [(NSData *)self->_suggestionEntryMetadata copyWithZone:a3];
  v19 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v18;

  uint64_t v20 = [(NSString *)self->_searchQueryDisplayString copyWithZone:a3];
  long long v21 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v20;

  uint64_t v22 = [(NSString *)self->_calloutTitle copyWithZone:a3];
  long long v23 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v22;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v24 = self->_namedFeatures;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v24);
        }
        long long v28 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * j), "copyWithZone:", a3, (void)v30);
        -[GEOSuggestionEntry addNamedFeature:](v5, v28);
      }
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v25);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  -[GEOSuggestionEntry readAll:]((uint64_t)self, 1);
  -[GEOSuggestionEntry readAll:]((uint64_t)v4, 1);
  displayLines = self->_displayLines;
  if ((unint64_t)displayLines | (unint64_t)v4[7])
  {
    if (!-[NSMutableArray isEqual:](displayLines, "isEqual:")) {
      goto LABEL_6;
    }
  }
  if ((unint64_t textHighlightsCount = self->_textHighlightsCount, (const void *)textHighlightsCount == v4[4])
    && !memcmp(self->_textHighlights, v4[3], 16 * textHighlightsCount)
    && ((iconID = self->_iconID, !((unint64_t)iconID | (unint64_t)v4[8]))
     || -[NSString isEqual:](iconID, "isEqual:"))
    && ((latlng = self->_latlng, !((unint64_t)latlng | (unint64_t)v4[9]))
     || -[GEOLatLng isEqual:](latlng, "isEqual:"))
    && ((suggestionEntryMetadata = self->_suggestionEntryMetadata,
         !((unint64_t)suggestionEntryMetadata | (unint64_t)v4[12]))
     || -[NSData isEqual:](suggestionEntryMetadata, "isEqual:"))
    && ((searchQueryDisplayString = self->_searchQueryDisplayString,
         !((unint64_t)searchQueryDisplayString | (unint64_t)v4[11]))
     || -[NSString isEqual:](searchQueryDisplayString, "isEqual:"))
    && ((calloutTitle = self->_calloutTitle, !((unint64_t)calloutTitle | (unint64_t)v4[6]))
     || -[NSString isEqual:](calloutTitle, "isEqual:")))
  {
    namedFeatures = self->_namedFeatures;
    if ((unint64_t)namedFeatures | (unint64_t)v4[10]) {
      char v7 = -[NSMutableArray isEqual:](namedFeatures, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
LABEL_6:
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  -[GEOSuggestionEntry readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_displayLines hash];
  uint64_t v4 = PBHashBytes();
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_iconID hash];
  unint64_t v6 = [(GEOLatLng *)self->_latlng hash];
  uint64_t v7 = v6 ^ [(NSData *)self->_suggestionEntryMetadata hash];
  NSUInteger v8 = v5 ^ v7 ^ [(NSString *)self->_searchQueryDisplayString hash];
  NSUInteger v9 = [(NSString *)self->_calloutTitle hash];
  return v8 ^ v9 ^ [(NSMutableArray *)self->_namedFeatures hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionEntryMetadata, 0);
  objc_storeStrong((id *)&self->_searchQueryDisplayString, 0);
  objc_storeStrong((id *)&self->_namedFeatures, 0);
  objc_storeStrong((id *)&self->_latlng, 0);
  objc_storeStrong((id *)&self->_iconID, 0);
  objc_storeStrong((id *)&self->_displayLines, 0);
  objc_storeStrong((id *)&self->_calloutTitle, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end