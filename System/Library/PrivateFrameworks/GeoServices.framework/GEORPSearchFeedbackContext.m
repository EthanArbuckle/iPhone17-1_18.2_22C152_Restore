@interface GEORPSearchFeedbackContext
+ (BOOL)isValid:(id)a3;
+ (Class)autocompleteSuggestionListType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasRequestContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPPlaceRequestResponse)requestContext;
- (GEORPSearchFeedbackContext)init;
- (GEORPSearchFeedbackContext)initWithData:(id)a3;
- (GEORPSearchFeedbackContext)initWithDictionary:(id)a3;
- (GEORPSearchFeedbackContext)initWithJSON:(id)a3;
- (NSMutableArray)autocompleteSuggestionLists;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)autocompleteSuggestionListAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)autocompleteSuggestionListsCount;
- (unint64_t)hash;
- (void)_addNoFlagsAutocompleteSuggestionList:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAutocompleteSuggestionLists;
- (void)_readRequestContext;
- (void)addAutocompleteSuggestionList:(id)a3;
- (void)clearAutocompleteSuggestionLists;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAutocompleteSuggestionLists:(id)a3;
- (void)setRequestContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPSearchFeedbackContext

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPSearchFeedbackContextIsDirty((uint64_t)self) & 1) == 0)
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPSearchFeedbackContext *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = self->_autocompleteSuggestionLists;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_requestContext) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEORPSearchFeedbackContextReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPSearchFeedbackContext *)self readAll:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_autocompleteSuggestionLists;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [(id)v5 addAutocompleteSuggestionList:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v13 = [(GEORPPlaceRequestResponse *)self->_requestContext copyWithZone:a3];
  long long v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEORPSearchFeedbackContext *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 10) = self->_readerMarkPos;
  *((_DWORD *)v8 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORPSearchFeedbackContext *)self autocompleteSuggestionListsCount])
  {
    [v8 clearAutocompleteSuggestionLists];
    unint64_t v4 = [(GEORPSearchFeedbackContext *)self autocompleteSuggestionListsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPSearchFeedbackContext *)self autocompleteSuggestionListAtIndex:i];
        [v8 addAutocompleteSuggestionList:v7];
      }
    }
  }
  if (self->_requestContext) {
    objc_msgSend(v8, "setRequestContext:");
  }
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 24) count])
    {
      unint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v6 = *(id *)(a1 + 24);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v28 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            long long v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v8);
      }

      if (a2) {
        id v13 = @"autocompleteSuggestionList";
      }
      else {
        id v13 = @"autocomplete_suggestion_list";
      }
      [v4 setObject:v5 forKey:v13];
    }
    long long v14 = [(id)a1 requestContext];
    long long v15 = v14;
    if (v14)
    {
      if (a2)
      {
        long long v16 = [v14 jsonRepresentation];
        long long v17 = @"requestContext";
      }
      else
      {
        long long v16 = [v14 dictionaryRepresentation];
        long long v17 = @"request_context";
      }
      [v4 setObject:v16 forKey:v17];
    }
    long long v18 = *(void **)(a1 + 16);
    if (v18)
    {
      long long v19 = [v18 dictionaryRepresentation];
      v20 = v19;
      if (a2)
      {
        uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __56__GEORPSearchFeedbackContext__dictionaryRepresentation___block_invoke;
        v25[3] = &unk_1E53D8860;
        id v22 = v21;
        id v26 = v22;
        [v20 enumerateKeysAndObjectsUsingBlock:v25];
        id v23 = v22;

        v20 = v23;
      }
      [v4 setObject:v20 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (GEORPSearchFeedbackContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPSearchFeedbackContext;
  v2 = [(GEORPSearchFeedbackContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    unint64_t v4 = v2;
  }

  return v3;
}

- (GEORPSearchFeedbackContext)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPSearchFeedbackContext;
  v3 = [(GEORPSearchFeedbackContext *)&v7 initWithData:a3];
  unint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    unint64_t v5 = v3;
  }

  return v4;
}

- (void)_readAutocompleteSuggestionLists
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
        GEORPSearchFeedbackContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutocompleteSuggestionLists_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)autocompleteSuggestionLists
{
  -[GEORPSearchFeedbackContext _readAutocompleteSuggestionLists]((uint64_t)self);
  autocompleteSuggestionLists = self->_autocompleteSuggestionLists;

  return autocompleteSuggestionLists;
}

- (void)setAutocompleteSuggestionLists:(id)a3
{
  unint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  autocompleteSuggestionLists = self->_autocompleteSuggestionLists;
  self->_autocompleteSuggestionLists = v4;
}

- (void)clearAutocompleteSuggestionLists
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  autocompleteSuggestionLists = self->_autocompleteSuggestionLists;

  [(NSMutableArray *)autocompleteSuggestionLists removeAllObjects];
}

- (void)addAutocompleteSuggestionList:(id)a3
{
  id v4 = a3;
  -[GEORPSearchFeedbackContext _readAutocompleteSuggestionLists]((uint64_t)self);
  -[GEORPSearchFeedbackContext _addNoFlagsAutocompleteSuggestionList:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsAutocompleteSuggestionList:(uint64_t)a1
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

- (unint64_t)autocompleteSuggestionListsCount
{
  -[GEORPSearchFeedbackContext _readAutocompleteSuggestionLists]((uint64_t)self);
  autocompleteSuggestionLists = self->_autocompleteSuggestionLists;

  return [(NSMutableArray *)autocompleteSuggestionLists count];
}

- (id)autocompleteSuggestionListAtIndex:(unint64_t)a3
{
  -[GEORPSearchFeedbackContext _readAutocompleteSuggestionLists]((uint64_t)self);
  autocompleteSuggestionLists = self->_autocompleteSuggestionLists;

  return (id)[(NSMutableArray *)autocompleteSuggestionLists objectAtIndex:a3];
}

+ (Class)autocompleteSuggestionListType
{
  return (Class)objc_opt_class();
}

- (void)_readRequestContext
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
        GEORPSearchFeedbackContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestContext_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasRequestContext
{
  return self->_requestContext != 0;
}

- (GEORPPlaceRequestResponse)requestContext
{
  -[GEORPSearchFeedbackContext _readRequestContext]((uint64_t)self);
  requestContext = self->_requestContext;

  return requestContext;
}

- (void)setRequestContext:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_requestContext, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPSearchFeedbackContext;
  id v4 = [(GEORPSearchFeedbackContext *)&v8 description];
  id v5 = [(GEORPSearchFeedbackContext *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPSearchFeedbackContext _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEORPSearchFeedbackContext _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEORPSearchFeedbackContext__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPSearchFeedbackContext)initWithDictionary:(id)a3
{
  return (GEORPSearchFeedbackContext *)-[GEORPSearchFeedbackContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"autocompleteSuggestionList";
      }
      else {
        objc_super v6 = @"autocomplete_suggestion_list";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = v5;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v14 = [GEORPSuggestionList alloc];
                if (a3) {
                  uint64_t v15 = [(GEORPSuggestionList *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEORPSuggestionList *)v14 initWithDictionary:v13];
                }
                long long v16 = (void *)v15;
                [a1 addAutocompleteSuggestionList:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v10);
        }

        id v5 = v23;
      }

      if (a3) {
        long long v17 = @"requestContext";
      }
      else {
        long long v17 = @"request_context";
      }
      long long v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v19 = [GEORPPlaceRequestResponse alloc];
        if (a3) {
          uint64_t v20 = [(GEORPPlaceRequestResponse *)v19 initWithJSON:v18];
        }
        else {
          uint64_t v20 = [(GEORPPlaceRequestResponse *)v19 initWithDictionary:v18];
        }
        uint64_t v21 = (void *)v20;
        [a1 setRequestContext:v20];
      }
    }
  }

  return a1;
}

- (GEORPSearchFeedbackContext)initWithJSON:(id)a3
{
  return (GEORPSearchFeedbackContext *)-[GEORPSearchFeedbackContext _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_3463;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_3464;
    }
    GEORPSearchFeedbackContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPSearchFeedbackContextCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPSearchFeedbackContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPSearchFeedbackContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[GEORPSearchFeedbackContext _readAutocompleteSuggestionLists]((uint64_t)self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_autocompleteSuggestionLists;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (void)v11))
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  -[GEORPSearchFeedbackContext _readRequestContext]((uint64_t)self);
  return [(GEORPPlaceRequestResponse *)self->_requestContext hasGreenTeaWithValue:v3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPSearchFeedbackContext *)self readAll:1],
         [v4 readAll:1],
         autocompleteSuggestionLists = self->_autocompleteSuggestionLists,
         !((unint64_t)autocompleteSuggestionLists | v4[3]))
     || -[NSMutableArray isEqual:](autocompleteSuggestionLists, "isEqual:")))
  {
    requestContext = self->_requestContext;
    if ((unint64_t)requestContext | v4[4]) {
      char v7 = -[GEORPPlaceRequestResponse isEqual:](requestContext, "isEqual:");
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
  [(GEORPSearchFeedbackContext *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_autocompleteSuggestionLists hash];
  return [(GEORPPlaceRequestResponse *)self->_requestContext hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  [v4 readAll:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4[3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEORPSearchFeedbackContext addAutocompleteSuggestionList:](self, "addAutocompleteSuggestionList:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  requestContext = self->_requestContext;
  id v11 = v4[4];
  if (requestContext)
  {
    if (v11) {
      -[GEORPPlaceRequestResponse mergeFrom:](requestContext, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEORPSearchFeedbackContext setRequestContext:](self, "setRequestContext:");
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
      id v5 = reader;
      objc_sync_enter(v5);
      GEORPSearchFeedbackContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3468);
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
    [(GEORPSearchFeedbackContext *)self readAll:0];
    requestContext = self->_requestContext;
    [(GEORPPlaceRequestResponse *)requestContext clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_autocompleteSuggestionLists, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end