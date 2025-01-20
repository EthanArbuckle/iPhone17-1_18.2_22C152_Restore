@interface GEORPSuggestionList
+ (BOOL)isValid:(id)a3;
+ (Class)entryType;
- (BOOL)hasAutocompleteRequest;
- (BOOL)hasAutocompleteResponse;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasQuery;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceRequest)autocompleteRequest;
- (GEOPDPlaceResponse)autocompleteResponse;
- (GEORPSuggestionList)init;
- (GEORPSuggestionList)initWithData:(id)a3;
- (GEORPSuggestionList)initWithDictionary:(id)a3;
- (GEORPSuggestionList)initWithJSON:(id)a3;
- (NSMutableArray)entrys;
- (NSString)query;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entryAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)entrysCount;
- (unint64_t)hash;
- (void)_addNoFlagsEntry:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAutocompleteRequest;
- (void)_readAutocompleteResponse;
- (void)_readEntrys;
- (void)_readQuery;
- (void)addEntry:(id)a3;
- (void)clearEntrys;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAutocompleteRequest:(id)a3;
- (void)setAutocompleteResponse:(id)a3;
- (void)setEntrys:(id)a3;
- (void)setQuery:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPSuggestionList

- (GEORPSuggestionList)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPSuggestionList;
  v2 = [(GEORPSuggestionList *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPSuggestionList)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPSuggestionList;
  v3 = [(GEORPSuggestionList *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readQuery
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
        GEORPSuggestionListReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuery_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasQuery
{
  return self->_query != 0;
}

- (NSString)query
{
  -[GEORPSuggestionList _readQuery]((uint64_t)self);
  query = self->_query;

  return query;
}

- (void)setQuery:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)_readEntrys
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
        GEORPSuggestionListReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEntrys_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)entrys
{
  -[GEORPSuggestionList _readEntrys]((uint64_t)self);
  entrys = self->_entrys;

  return entrys;
}

- (void)setEntrys:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  entrys = self->_entrys;
  self->_entrys = v4;
}

- (void)clearEntrys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  entrys = self->_entrys;

  [(NSMutableArray *)entrys removeAllObjects];
}

- (void)addEntry:(id)a3
{
  id v4 = a3;
  -[GEORPSuggestionList _readEntrys]((uint64_t)self);
  -[GEORPSuggestionList _addNoFlagsEntry:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsEntry:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)entrysCount
{
  -[GEORPSuggestionList _readEntrys]((uint64_t)self);
  entrys = self->_entrys;

  return [(NSMutableArray *)entrys count];
}

- (id)entryAtIndex:(unint64_t)a3
{
  -[GEORPSuggestionList _readEntrys]((uint64_t)self);
  entrys = self->_entrys;

  return (id)[(NSMutableArray *)entrys objectAtIndex:a3];
}

+ (Class)entryType
{
  return (Class)objc_opt_class();
}

- (void)_readAutocompleteRequest
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPSuggestionListReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutocompleteRequest_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAutocompleteRequest
{
  return self->_autocompleteRequest != 0;
}

- (GEOPDPlaceRequest)autocompleteRequest
{
  -[GEORPSuggestionList _readAutocompleteRequest]((uint64_t)self);
  autocompleteRequest = self->_autocompleteRequest;

  return autocompleteRequest;
}

- (void)setAutocompleteRequest:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  objc_storeStrong((id *)&self->_autocompleteRequest, a3);
}

- (void)_readAutocompleteResponse
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
        GEORPSuggestionListReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutocompleteResponse_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAutocompleteResponse
{
  return self->_autocompleteResponse != 0;
}

- (GEOPDPlaceResponse)autocompleteResponse
{
  -[GEORPSuggestionList _readAutocompleteResponse]((uint64_t)self);
  autocompleteResponse = self->_autocompleteResponse;

  return autocompleteResponse;
}

- (void)setAutocompleteResponse:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_autocompleteResponse, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPSuggestionList;
  id v4 = [(GEORPSuggestionList *)&v8 description];
  id v5 = [(GEORPSuggestionList *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPSuggestionList _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 query];
    if (v5) {
      [v4 setObject:v5 forKey:@"query"];
    }

    if ([a1[4] count])
    {
      objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v7 = a1[4];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if (a2) {
              [v12 jsonRepresentation];
            }
            else {
            v13 = objc_msgSend(v12, "dictionaryRepresentation", (void)v23);
            }
            objc_msgSend(v6, "addObject:", v13, (void)v23);
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v9);
      }

      [v4 setObject:v6 forKey:@"entry"];
    }
    v14 = objc_msgSend(a1, "autocompleteRequest", (void)v23);
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"autocompleteRequest";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"autocomplete_request";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = [a1 autocompleteResponse];
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"autocompleteResponse";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"autocomplete_response";
      }
      [v4 setObject:v20 forKey:v21];
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
  return -[GEORPSuggestionList _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEORPSuggestionList)initWithDictionary:(id)a3
{
  return (GEORPSuggestionList *)-[GEORPSuggestionList _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"query"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = (void *)[v6 copy];
        [a1 setQuery:v7];
      }
      uint64_t v8 = [v5 objectForKeyedSubscript:@"entry"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v29 = v5;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v31 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v15 = [GEORPSuggestionEntry alloc];
                if (a3) {
                  uint64_t v16 = [(GEORPSuggestionEntry *)v15 initWithJSON:v14];
                }
                else {
                  uint64_t v16 = [(GEORPSuggestionEntry *)v15 initWithDictionary:v14];
                }
                v17 = (void *)v16;
                [a1 addEntry:v16];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
          }
          while (v11);
        }

        id v5 = v29;
      }

      if (a3) {
        v18 = @"autocompleteRequest";
      }
      else {
        v18 = @"autocomplete_request";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [GEOPDPlaceRequest alloc];
        if (a3) {
          uint64_t v21 = [(GEOPDPlaceRequest *)v20 initWithJSON:v19];
        }
        else {
          uint64_t v21 = [(GEOPDPlaceRequest *)v20 initWithDictionary:v19];
        }
        v22 = (void *)v21;
        [a1 setAutocompleteRequest:v21];
      }
      if (a3) {
        long long v23 = @"autocompleteResponse";
      }
      else {
        long long v23 = @"autocomplete_response";
      }
      long long v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v25 = [GEOPDPlaceResponse alloc];
        if (a3) {
          uint64_t v26 = [(GEOPDPlaceResponse *)v25 initWithJSON:v24];
        }
        else {
          uint64_t v26 = [(GEOPDPlaceResponse *)v25 initWithDictionary:v24];
        }
        v27 = (void *)v26;
        [a1 setAutocompleteResponse:v26];
      }
    }
  }

  return a1;
}

- (GEORPSuggestionList)initWithJSON:(id)a3
{
  return (GEORPSuggestionList *)-[GEORPSuggestionList _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_3274;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_3275;
    }
    GEORPSuggestionListReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPSuggestionListCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPSuggestionListIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPSuggestionListReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPSuggestionListIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPSuggestionList *)self readAll:0];
    if (self->_query) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_entrys;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_autocompleteRequest) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_autocompleteResponse) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPSuggestionList _readAutocompleteRequest]((uint64_t)self);
  if ([(GEOPDPlaceRequest *)self->_autocompleteRequest hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPSuggestionList _readAutocompleteResponse]((uint64_t)self);
  autocompleteResponse = self->_autocompleteResponse;

  return [(GEOPDPlaceResponse *)autocompleteResponse hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEORPSuggestionList *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 12) = self->_readerMarkPos;
  *((_DWORD *)v9 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_query) {
    objc_msgSend(v9, "setQuery:");
  }
  if ([(GEORPSuggestionList *)self entrysCount])
  {
    [v9 clearEntrys];
    unint64_t v4 = [(GEORPSuggestionList *)self entrysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPSuggestionList *)self entryAtIndex:i];
        [v9 addEntry:v7];
      }
    }
  }
  if (self->_autocompleteRequest) {
    objc_msgSend(v9, "setAutocompleteRequest:");
  }
  uint64_t v8 = v9;
  if (self->_autocompleteResponse)
  {
    objc_msgSend(v9, "setAutocompleteResponse:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPSuggestionListReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPSuggestionList *)self readAll:0];
  uint64_t v8 = [(NSString *)self->_query copyWithZone:a3];
  uint64_t v9 = (void *)v5[5];
  v5[5] = v8;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = self->_entrys;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v13), "copyWithZone:", a3, (void)v20);
        [v5 addEntry:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  id v15 = [(GEOPDPlaceRequest *)self->_autocompleteRequest copyWithZone:a3];
  uint64_t v16 = (void *)v5[2];
  v5[2] = v15;

  id v17 = [(GEOPDPlaceResponse *)self->_autocompleteResponse copyWithZone:a3];
  v18 = (void *)v5[3];
  v5[3] = v17;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPSuggestionList *)self readAll:1],
         [v4 readAll:1],
         query = self->_query,
         !((unint64_t)query | v4[5]))
     || -[NSString isEqual:](query, "isEqual:"))
    && ((entrys = self->_entrys, !((unint64_t)entrys | v4[4]))
     || -[NSMutableArray isEqual:](entrys, "isEqual:"))
    && ((autocompleteRequest = self->_autocompleteRequest, !((unint64_t)autocompleteRequest | v4[2]))
     || -[GEOPDPlaceRequest isEqual:](autocompleteRequest, "isEqual:")))
  {
    autocompleteResponse = self->_autocompleteResponse;
    if ((unint64_t)autocompleteResponse | v4[3]) {
      char v9 = -[GEOPDPlaceResponse isEqual:](autocompleteResponse, "isEqual:");
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
  [(GEORPSuggestionList *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_query hash];
  uint64_t v4 = [(NSMutableArray *)self->_entrys hash] ^ v3;
  unint64_t v5 = [(GEOPDPlaceRequest *)self->_autocompleteRequest hash];
  return v4 ^ v5 ^ [(GEOPDPlaceResponse *)self->_autocompleteResponse hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  if (v4[5]) {
    -[GEORPSuggestionList setQuery:](self, "setQuery:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4[4];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEORPSuggestionList addEntry:](self, "addEntry:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  autocompleteRequest = self->_autocompleteRequest;
  id v11 = v4[2];
  if (autocompleteRequest)
  {
    if (v11) {
      -[GEOPDPlaceRequest mergeFrom:](autocompleteRequest, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEORPSuggestionList setAutocompleteRequest:](self, "setAutocompleteRequest:");
  }
  autocompleteResponse = self->_autocompleteResponse;
  id v13 = v4[3];
  if (autocompleteResponse)
  {
    if (v13) {
      -[GEOPDPlaceResponse mergeFrom:](autocompleteResponse, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEORPSuggestionList setAutocompleteResponse:](self, "setAutocompleteResponse:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_entrys, 0);
  objc_storeStrong((id *)&self->_autocompleteResponse, 0);
  objc_storeStrong((id *)&self->_autocompleteRequest, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end