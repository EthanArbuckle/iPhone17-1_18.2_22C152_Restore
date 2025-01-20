@interface GEOLogMsgEventListInteractionSession
+ (BOOL)isValid:(id)a3;
+ (Class)listResultItemType;
- (BOOL)hasListType;
- (BOOL)hasSearchString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventListInteractionSession)init;
- (GEOLogMsgEventListInteractionSession)initWithData:(id)a3;
- (GEOLogMsgEventListInteractionSession)initWithDictionary:(id)a3;
- (GEOLogMsgEventListInteractionSession)initWithJSON:(id)a3;
- (NSMutableArray)listResultItems;
- (NSString)searchString;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)listResultItemAtIndex:(unint64_t)a3;
- (id)listTypeAsString:(int)a3;
- (int)StringAsListType:(id)a3;
- (int)listType;
- (unint64_t)hash;
- (unint64_t)listResultItemsCount;
- (void)_addNoFlagsListResultItem:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readListResultItems;
- (void)_readSearchString;
- (void)addListResultItem:(id)a3;
- (void)clearListResultItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasListType:(BOOL)a3;
- (void)setListResultItems:(id)a3;
- (void)setListType:(int)a3;
- (void)setSearchString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventListInteractionSession

- (GEOLogMsgEventListInteractionSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventListInteractionSession;
  v2 = [(GEOLogMsgEventListInteractionSession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventListInteractionSession)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventListInteractionSession;
  v3 = [(GEOLogMsgEventListInteractionSession *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)listType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_listType;
  }
  else {
    return 0;
  }
}

- (void)setListType:(int)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  self->_listType = a3;
}

- (void)setHasListType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasListType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)listTypeAsString:(int)a3
{
  if (a3 >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53EBE38[a3];
  }

  return v3;
}

- (int)StringAsListType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LIST_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LIST_TYPE_NO_TYPING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LIST_TYPE_POPULAR_NEARBY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LIST_TYPE_BROWSE_CATEGORY_SEARCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LIST_TYPE_AC"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LIST_TYPE_NORMAL_SEARCH"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LIST_TYPE_SEARCH_ALONG_ROUTE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LIST_TYPE_FAVORITES"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"LIST_TYPE_SIRI_SEARCH"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"LIST_TYPE_SIRI_DISAMBIGUATION"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"LIST_TYPE_DIRECTIONS_NO_TYPING"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"LIST_TYPE_DIRECTIONS_NAV_FROM"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"LIST_TYPE_DIRECTIONS_NAV_TO"])
  {
    int v4 = 12;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readListResultItems
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventListInteractionSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readListResultItems_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)listResultItems
{
  -[GEOLogMsgEventListInteractionSession _readListResultItems]((uint64_t)self);
  listResultItems = self->_listResultItems;

  return listResultItems;
}

- (void)setListResultItems:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  listResultItems = self->_listResultItems;
  self->_listResultItems = v4;
}

- (void)clearListResultItems
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  listResultItems = self->_listResultItems;

  [(NSMutableArray *)listResultItems removeAllObjects];
}

- (void)addListResultItem:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventListInteractionSession _readListResultItems]((uint64_t)self);
  -[GEOLogMsgEventListInteractionSession _addNoFlagsListResultItem:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsListResultItem:(uint64_t)a1
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

- (unint64_t)listResultItemsCount
{
  -[GEOLogMsgEventListInteractionSession _readListResultItems]((uint64_t)self);
  listResultItems = self->_listResultItems;

  return [(NSMutableArray *)listResultItems count];
}

- (id)listResultItemAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventListInteractionSession _readListResultItems]((uint64_t)self);
  listResultItems = self->_listResultItems;

  return (id)[(NSMutableArray *)listResultItems objectAtIndex:a3];
}

+ (Class)listResultItemType
{
  return (Class)objc_opt_class();
}

- (void)_readSearchString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventListInteractionSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchString_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasSearchString
{
  return self->_searchString != 0;
}

- (NSString)searchString
{
  -[GEOLogMsgEventListInteractionSession _readSearchString]((uint64_t)self);
  searchString = self->_searchString;

  return searchString;
}

- (void)setSearchString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventListInteractionSession;
  id v4 = [(GEOLogMsgEventListInteractionSession *)&v8 description];
  id v5 = [(GEOLogMsgEventListInteractionSession *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventListInteractionSession _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v5 = *(int *)(a1 + 44);
      if (v5 >= 0xD)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53EBE38[v5];
      }
      if (a2) {
        id v7 = @"listType";
      }
      else {
        id v7 = @"list_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    if ([*(id *)(a1 + 16) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v9 = *(id *)(a1 + 16);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            v15 = [v14 dictionaryRepresentation];
            }
            [v8 addObject:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v11);
      }

      if (a2) {
        v16 = @"listResultItem";
      }
      else {
        v16 = @"list_result_item";
      }
      [v4 setObject:v8 forKey:v16];
    }
    v17 = [(id)a1 searchString];
    if (v17)
    {
      if (a2) {
        v18 = @"searchString";
      }
      else {
        v18 = @"search_string";
      }
      [v4 setObject:v17 forKey:v18];
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
  return -[GEOLogMsgEventListInteractionSession _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventListInteractionSession)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventListInteractionSession *)-[GEOLogMsgEventListInteractionSession _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_61;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_61;
  }
  if (a3) {
    objc_super v6 = @"listType";
  }
  else {
    objc_super v6 = @"list_type";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"LIST_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"LIST_TYPE_NO_TYPING"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"LIST_TYPE_POPULAR_NEARBY"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"LIST_TYPE_BROWSE_CATEGORY_SEARCH"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"LIST_TYPE_AC"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"LIST_TYPE_NORMAL_SEARCH"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"LIST_TYPE_SEARCH_ALONG_ROUTE"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"LIST_TYPE_FAVORITES"])
    {
      uint64_t v9 = 7;
    }
    else if ([v8 isEqualToString:@"LIST_TYPE_SIRI_SEARCH"])
    {
      uint64_t v9 = 8;
    }
    else if ([v8 isEqualToString:@"LIST_TYPE_SIRI_DISAMBIGUATION"])
    {
      uint64_t v9 = 9;
    }
    else if ([v8 isEqualToString:@"LIST_TYPE_DIRECTIONS_NO_TYPING"])
    {
      uint64_t v9 = 10;
    }
    else if ([v8 isEqualToString:@"LIST_TYPE_DIRECTIONS_NAV_FROM"])
    {
      uint64_t v9 = 11;
    }
    else if ([v8 isEqualToString:@"LIST_TYPE_DIRECTIONS_NAV_TO"])
    {
      uint64_t v9 = 12;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_37;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_37:
    [a1 setListType:v9];
  }

  if (a3) {
    uint64_t v10 = @"listResultItem";
  }
  else {
    uint64_t v10 = @"list_result_item";
  }
  uint64_t v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v25 = v5;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v18 = [GEOListResultItem alloc];
            if (a3) {
              uint64_t v19 = [(GEOListResultItem *)v18 initWithJSON:v17];
            }
            else {
              uint64_t v19 = [(GEOListResultItem *)v18 initWithDictionary:v17];
            }
            long long v20 = (void *)v19;
            [a1 addListResultItem:v19];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v14);
    }

    id v5 = v25;
  }

  if (a3) {
    long long v21 = @"searchString";
  }
  else {
    long long v21 = @"search_string";
  }
  long long v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v23 = (void *)[v22 copy];
    [a1 setSearchString:v23];
  }
LABEL_61:

  return a1;
}

- (GEOLogMsgEventListInteractionSession)initWithJSON:(id)a3
{
  return (GEOLogMsgEventListInteractionSession *)-[GEOLogMsgEventListInteractionSession _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_72;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_72;
    }
    GEOLogMsgEventListInteractionSessionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgEventListInteractionSessionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventListInteractionSessionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventListInteractionSessionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
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
    [(GEOLogMsgEventListInteractionSession *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_listResultItems;
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

    if (self->_searchString) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOLogMsgEventListInteractionSession *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v8 + 11) = self->_listType;
    *((unsigned char *)v8 + 48) |= 1u;
  }
  if ([(GEOLogMsgEventListInteractionSession *)self listResultItemsCount])
  {
    [v8 clearListResultItems];
    unint64_t v4 = [(GEOLogMsgEventListInteractionSession *)self listResultItemsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMsgEventListInteractionSession *)self listResultItemAtIndex:i];
        [v8 addListResultItem:v7];
      }
    }
  }
  if (self->_searchString) {
    objc_msgSend(v8, "setSearchString:");
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
      GEOLogMsgEventListInteractionSessionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventListInteractionSession *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 44) = self->_listType;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = self->_listResultItems;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [(id)v5 addListResultItem:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_searchString copyWithZone:a3];
  id v8 = *(id *)(v5 + 24);
  *(void *)(v5 + 24) = v14;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOLogMsgEventListInteractionSession *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_listType != *((_DWORD *)v4 + 11)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  listResultItems = self->_listResultItems;
  if ((unint64_t)listResultItems | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](listResultItems, "isEqual:"))
  {
    goto LABEL_11;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](searchString, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventListInteractionSession *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_listType;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_listResultItems hash] ^ v3;
  return v4 ^ [(NSString *)self->_searchString hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 48))
  {
    self->_listType = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOLogMsgEventListInteractionSession addListResultItem:](self, "addListResultItem:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 3)) {
    -[GEOLogMsgEventListInteractionSession setSearchString:](self, "setSearchString:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_listResultItems, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end