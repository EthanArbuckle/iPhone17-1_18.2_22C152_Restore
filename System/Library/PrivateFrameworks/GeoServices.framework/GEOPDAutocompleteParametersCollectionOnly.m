@interface GEOPDAutocompleteParametersCollectionOnly
+ (BOOL)isValid:(id)a3;
+ (Class)publisherIdType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasQuery;
- (BOOL)hasViewportInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAutocompleteParametersCollectionOnly)init;
- (GEOPDAutocompleteParametersCollectionOnly)initWithData:(id)a3;
- (GEOPDAutocompleteParametersCollectionOnly)initWithDictionary:(id)a3;
- (GEOPDAutocompleteParametersCollectionOnly)initWithJSON:(id)a3;
- (GEOPDViewportInfo)viewportInfo;
- (NSMutableArray)publisherIds;
- (NSString)query;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)publisherIdAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)publisherIdsCount;
- (void)_addNoFlagsPublisherId:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readPublisherIds;
- (void)_readQuery;
- (void)_readViewportInfo;
- (void)addPublisherId:(id)a3;
- (void)clearPublisherIds;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setPublisherIds:(id)a3;
- (void)setQuery:(id)a3;
- (void)setViewportInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteParametersCollectionOnly

void __71__GEOPDAutocompleteParametersCollectionOnly__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 query];
    if (v5) {
      [v4 setObject:v5 forKey:@"query"];
    }

    v6 = [(id)a1 viewportInfo];
    v7 = v6;
    if (v6)
    {
      if (a2)
      {
        v8 = [v6 jsonRepresentation];
        v9 = @"viewportInfo";
      }
      else
      {
        v8 = [v6 dictionaryRepresentation];
        v9 = @"viewport_info";
      }
      [v4 setObject:v8 forKey:v9];
    }
    if ([*(id *)(a1 + 24) count])
    {
      id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v11 = *(id *)(a1 + 24);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if (a2) {
              [v16 jsonRepresentation];
            }
            else {
            v17 = [v16 dictionaryRepresentation];
            }
            [v10 addObject:v17];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v13);
      }

      if (a2) {
        v18 = @"publisherId";
      }
      else {
        v18 = @"publisher_id";
      }
      [v4 setObject:v10 forKey:v18];
    }
    v19 = *(void **)(a1 + 16);
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __71__GEOPDAutocompleteParametersCollectionOnly__dictionaryRepresentation___block_invoke;
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

- (GEOPDAutocompleteParametersCollectionOnly)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteParametersCollectionOnly;
  v2 = [(GEOPDAutocompleteParametersCollectionOnly *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteParametersCollectionOnly)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteParametersCollectionOnly;
  v3 = [(GEOPDAutocompleteParametersCollectionOnly *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readQuery
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
        GEOPDAutocompleteParametersCollectionOnlyReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuery_tags_1322);
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
  -[GEOPDAutocompleteParametersCollectionOnly _readQuery]((uint64_t)self);
  query = self->_query;

  return query;
}

- (void)setQuery:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)_readViewportInfo
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
        GEOPDAutocompleteParametersCollectionOnlyReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_1323);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasViewportInfo
{
  return self->_viewportInfo != 0;
}

- (GEOPDViewportInfo)viewportInfo
{
  -[GEOPDAutocompleteParametersCollectionOnly _readViewportInfo]((uint64_t)self);
  viewportInfo = self->_viewportInfo;

  return viewportInfo;
}

- (void)setViewportInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_viewportInfo, a3);
}

- (void)_readPublisherIds
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
        GEOPDAutocompleteParametersCollectionOnlyReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisherIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)publisherIds
{
  -[GEOPDAutocompleteParametersCollectionOnly _readPublisherIds]((uint64_t)self);
  publisherIds = self->_publisherIds;

  return publisherIds;
}

- (void)setPublisherIds:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  publisherIds = self->_publisherIds;
  self->_publisherIds = v4;
}

- (void)clearPublisherIds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  publisherIds = self->_publisherIds;

  [(NSMutableArray *)publisherIds removeAllObjects];
}

- (void)addPublisherId:(id)a3
{
  id v4 = a3;
  -[GEOPDAutocompleteParametersCollectionOnly _readPublisherIds]((uint64_t)self);
  -[GEOPDAutocompleteParametersCollectionOnly _addNoFlagsPublisherId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsPublisherId:(uint64_t)a1
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

- (unint64_t)publisherIdsCount
{
  -[GEOPDAutocompleteParametersCollectionOnly _readPublisherIds]((uint64_t)self);
  publisherIds = self->_publisherIds;

  return [(NSMutableArray *)publisherIds count];
}

- (id)publisherIdAtIndex:(unint64_t)a3
{
  -[GEOPDAutocompleteParametersCollectionOnly _readPublisherIds]((uint64_t)self);
  publisherIds = self->_publisherIds;

  return (id)[(NSMutableArray *)publisherIds objectAtIndex:a3];
}

+ (Class)publisherIdType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteParametersCollectionOnly;
  id v4 = [(GEOPDAutocompleteParametersCollectionOnly *)&v8 description];
  id v5 = [(GEOPDAutocompleteParametersCollectionOnly *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteParametersCollectionOnly _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteParametersCollectionOnly _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDAutocompleteParametersCollectionOnly)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteParametersCollectionOnly *)-[GEOPDAutocompleteParametersCollectionOnly _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
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
      if (a3) {
        objc_super v8 = @"viewportInfo";
      }
      else {
        objc_super v8 = @"viewport_info";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [GEOPDViewportInfo alloc];
        if (a3) {
          uint64_t v11 = [(GEOPDViewportInfo *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEOPDViewportInfo *)v10 initWithDictionary:v9];
        }
        uint64_t v12 = (void *)v11;
        [a1 setViewportInfo:v11];
      }
      if (a3) {
        uint64_t v13 = @"publisherId";
      }
      else {
        uint64_t v13 = @"publisher_id";
      }
      uint64_t v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = v5;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v27 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v21 = [GEOPDMapsIdentifier alloc];
                if (a3) {
                  uint64_t v22 = [(GEOPDMapsIdentifier *)v21 initWithJSON:v20];
                }
                else {
                  uint64_t v22 = [(GEOPDMapsIdentifier *)v21 initWithDictionary:v20];
                }
                id v23 = (void *)v22;
                [a1 addPublisherId:v22];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v17);
        }

        id v5 = v25;
      }
    }
  }

  return a1;
}

- (GEOPDAutocompleteParametersCollectionOnly)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteParametersCollectionOnly *)-[GEOPDAutocompleteParametersCollectionOnly _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1330;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1331;
    }
    GEOPDAutocompleteParametersCollectionOnlyReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDAutocompleteParametersCollectionOnlyCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteParametersCollectionOnlyIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteParametersCollectionOnlyReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
  {
    id v10 = self->_reader;
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
    [(GEOPDAutocompleteParametersCollectionOnly *)self readAll:0];
    if (self->_query) {
      PBDataWriterWriteStringField();
    }
    if (self->_viewportInfo) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_publisherIds;
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

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[GEOPDAutocompleteParametersCollectionOnly _readPublisherIds]((uint64_t)self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_publisherIds;
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

  -[GEOPDAutocompleteParametersCollectionOnly _readViewportInfo]((uint64_t)self);
  return [(GEOPDViewportInfo *)self->_viewportInfo hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOPDAutocompleteParametersCollectionOnly *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 12) = self->_readerMarkPos;
  *((_DWORD *)v8 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_query) {
    objc_msgSend(v8, "setQuery:");
  }
  if (self->_viewportInfo) {
    objc_msgSend(v8, "setViewportInfo:");
  }
  if ([(GEOPDAutocompleteParametersCollectionOnly *)self publisherIdsCount])
  {
    [v8 clearPublisherIds];
    unint64_t v4 = [(GEOPDAutocompleteParametersCollectionOnly *)self publisherIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDAutocompleteParametersCollectionOnly *)self publisherIdAtIndex:i];
        [v8 addPublisherId:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOPDAutocompleteParametersCollectionOnlyReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDAutocompleteParametersCollectionOnly *)self readAll:0];
  uint64_t v8 = [(NSString *)self->_query copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  id v10 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  long long v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v12 = self->_publisherIds;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addPublisherId:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOPDAutocompleteParametersCollectionOnly *)self readAll:1],
         [v4 readAll:1],
         query = self->_query,
         !((unint64_t)query | v4[4]))
     || -[NSString isEqual:](query, "isEqual:"))
    && ((viewportInfo = self->_viewportInfo, !((unint64_t)viewportInfo | v4[5]))
     || -[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:")))
  {
    publisherIds = self->_publisherIds;
    if ((unint64_t)publisherIds | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](publisherIds, "isEqual:");
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
  [(GEOPDAutocompleteParametersCollectionOnly *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_query hash];
  unint64_t v4 = [(GEOPDViewportInfo *)self->_viewportInfo hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_publisherIds hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  if (v4[4]) {
    -[GEOPDAutocompleteParametersCollectionOnly setQuery:](self, "setQuery:");
  }
  viewportInfo = self->_viewportInfo;
  id v6 = v4[5];
  if (viewportInfo)
  {
    if (v6) {
      -[GEOPDViewportInfo mergeFrom:](viewportInfo, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOPDAutocompleteParametersCollectionOnly setViewportInfo:](self, "setViewportInfo:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v4[3];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEOPDAutocompleteParametersCollectionOnly addPublisherId:](self, "addPublisherId:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
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
      GEOPDAutocompleteParametersCollectionOnlyReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1335);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDAutocompleteParametersCollectionOnly *)self readAll:0];
    [(GEOPDViewportInfo *)self->_viewportInfo clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = self->_publisherIds;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_publisherIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end