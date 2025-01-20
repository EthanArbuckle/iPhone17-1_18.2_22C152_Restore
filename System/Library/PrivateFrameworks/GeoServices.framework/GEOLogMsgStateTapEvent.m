@interface GEOLogMsgStateTapEvent
+ (BOOL)isValid:(id)a3;
+ (Class)searchResultsType;
- (BOOL)hasPinType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateTapEvent)initWithDictionary:(id)a3;
- (GEOLogMsgStateTapEvent)initWithJSON:(id)a3;
- (NSMutableArray)searchResults;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)pinTypeAsString:(int)a3;
- (id)searchResultsAtIndex:(unint64_t)a3;
- (int)StringAsPinType:(id)a3;
- (int)pinType;
- (unint64_t)hash;
- (unint64_t)searchResultsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addSearchResults:(id)a3;
- (void)clearSearchResults;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPinType:(BOOL)a3;
- (void)setPinType:(int)a3;
- (void)setSearchResults:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateTapEvent

- (NSMutableArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
}

- (void)clearSearchResults
{
}

- (void)addSearchResults:(id)a3
{
  id v4 = a3;
  searchResults = self->_searchResults;
  id v8 = v4;
  if (!searchResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_searchResults;
    self->_searchResults = v6;

    id v4 = v8;
    searchResults = self->_searchResults;
  }
  [(NSMutableArray *)searchResults addObject:v4];
}

- (unint64_t)searchResultsCount
{
  return [(NSMutableArray *)self->_searchResults count];
}

- (id)searchResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_searchResults objectAtIndex:a3];
}

+ (Class)searchResultsType
{
  return (Class)objc_opt_class();
}

- (int)pinType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_pinType;
  }
  else {
    return 0;
  }
}

- (void)setPinType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_pinType = a3;
}

- (void)setHasPinType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasPinType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)pinTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F8420[a3];
  }

  return v3;
}

- (int)StringAsPinType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STANDARD_POI"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CLUSTERED_POI"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ENRICHED_POI"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CLUSTERED_ENRICHED_POI"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateTapEvent;
  int v4 = [(GEOLogMsgStateTapEvent *)&v8 description];
  v5 = [(GEOLogMsgStateTapEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateTapEvent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 8) count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v6 = *(id *)(a1 + 8);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v19 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"searchResults";
      }
      else {
        v13 = @"search_results";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if (*(unsigned char *)(a1 + 20))
    {
      uint64_t v14 = *(int *)(a1 + 16);
      if (v14 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = off_1E53F8420[v14];
      }
      if (a2) {
        v16 = @"pinType";
      }
      else {
        v16 = @"pin_type";
      }
      [v4 setObject:v15 forKey:v16];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateTapEvent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateTapEvent)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateTapEvent *)-[GEOLogMsgStateTapEvent _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"searchResults";
      }
      else {
        id v6 = @"search_results";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = v5;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v24 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v14 = [GEOSearchResult alloc];
                if (a3) {
                  uint64_t v15 = [(GEOSearchResult *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOSearchResult *)v14 initWithDictionary:v13];
                }
                v16 = (void *)v15;
                [a1 addSearchResults:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v10);
        }

        id v5 = v22;
      }

      if (a3) {
        v17 = @"pinType";
      }
      else {
        v17 = @"pin_type";
      }
      long long v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v18;
        if ([v19 isEqualToString:@"STANDARD_POI"])
        {
          uint64_t v20 = 0;
        }
        else if ([v19 isEqualToString:@"CLUSTERED_POI"])
        {
          uint64_t v20 = 1;
        }
        else if ([v19 isEqualToString:@"ENRICHED_POI"])
        {
          uint64_t v20 = 2;
        }
        else if ([v19 isEqualToString:@"CLUSTERED_ENRICHED_POI"])
        {
          uint64_t v20 = 3;
        }
        else
        {
          uint64_t v20 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_37:

          goto LABEL_38;
        }
        uint64_t v20 = [v18 intValue];
      }
      [a1 setPinType:v20];
      goto LABEL_37;
    }
  }
LABEL_38:

  return a1;
}

- (GEOLogMsgStateTapEvent)initWithJSON:(id)a3
{
  return (GEOLogMsgStateTapEvent *)-[GEOLogMsgStateTapEvent _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateTapEventIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateTapEventReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_searchResults;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [(GEOLogMsgStateTapEvent *)self readAll:0];
  if ([(GEOLogMsgStateTapEvent *)self searchResultsCount])
  {
    [v8 clearSearchResults];
    unint64_t v4 = [(GEOLogMsgStateTapEvent *)self searchResultsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMsgStateTapEvent *)self searchResultsAtIndex:i];
        [v8 addSearchResults:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v8 + 4) = self->_pinType;
    *((unsigned char *)v8 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_searchResults;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [(id)v5 addSearchResults:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_pinType;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEOLogMsgStateTapEvent *)self readAll:1];
  [v4 readAll:1];
  searchResults = self->_searchResults;
  if ((unint64_t)searchResults | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](searchResults, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_pinType == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateTapEvent *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_searchResults hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_pinType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOLogMsgStateTapEvent addSearchResults:](self, "addSearchResults:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 20))
  {
    self->_pinType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
}

@end