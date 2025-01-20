@interface GEOPDAutocompleteParametersSiriSearch
+ (BOOL)isValid:(id)a3;
- (BOOL)completed;
- (BOOL)hasCompleted;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHighlightDiff;
- (BOOL)hasMaxResults;
- (BOOL)hasPrefix;
- (BOOL)hasQuery;
- (BOOL)hasViewportInfo;
- (BOOL)highlightDiff;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAutocompleteParametersSiriSearch)init;
- (GEOPDAutocompleteParametersSiriSearch)initWithData:(id)a3;
- (GEOPDAutocompleteParametersSiriSearch)initWithDictionary:(id)a3;
- (GEOPDAutocompleteParametersSiriSearch)initWithJSON:(id)a3;
- (GEOPDViewportInfo)viewportInfo;
- (NSString)prefix;
- (NSString)query;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)maxResults;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readPrefix;
- (void)_readQuery;
- (void)_readViewportInfo;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setHasCompleted:(BOOL)a3;
- (void)setHasHighlightDiff:(BOOL)a3;
- (void)setHasMaxResults:(BOOL)a3;
- (void)setHighlightDiff:(BOOL)a3;
- (void)setMaxResults:(int)a3;
- (void)setPrefix:(id)a3;
- (void)setQuery:(id)a3;
- (void)setViewportInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteParametersSiriSearch

- (GEOPDAutocompleteParametersSiriSearch)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteParametersSiriSearch;
  v2 = [(GEOPDAutocompleteParametersSiriSearch *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteParametersSiriSearch)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteParametersSiriSearch;
  v3 = [(GEOPDAutocompleteParametersSiriSearch *)&v7 initWithData:a3];
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
    if ((*(unsigned char *)(a1 + 68) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersSiriSearchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuery_tags_1411);
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
  -[GEOPDAutocompleteParametersSiriSearch _readQuery]((uint64_t)self);
  query = self->_query;

  return query;
}

- (void)setQuery:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)_readViewportInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersSiriSearchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_1412);
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
  -[GEOPDAutocompleteParametersSiriSearch _readViewportInfo]((uint64_t)self);
  viewportInfo = self->_viewportInfo;

  return viewportInfo;
}

- (void)setViewportInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_viewportInfo, a3);
}

- (int)maxResults
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_maxResults;
  }
  else {
    return 15;
  }
}

- (void)setMaxResults:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_maxResults = a3;
}

- (void)setHasMaxResults:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasMaxResults
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)highlightDiff
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 4) != 0 && self->_highlightDiff;
}

- (void)setHighlightDiff:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  self->_highlightDiff = a3;
}

- (void)setHasHighlightDiff:(BOOL)a3
{
  if (a3) {
    char v3 = -124;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasHighlightDiff
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readPrefix
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersSiriSearchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrefix_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasPrefix
{
  return self->_prefix != 0;
}

- (NSString)prefix
{
  -[GEOPDAutocompleteParametersSiriSearch _readPrefix]((uint64_t)self);
  prefix = self->_prefix;

  return prefix;
}

- (void)setPrefix:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_prefix, a3);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_completed = a3;
}

- (void)setHasCompleted:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCompleted
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteParametersSiriSearch;
  v4 = [(GEOPDAutocompleteParametersSiriSearch *)&v8 description];
  v5 = [(GEOPDAutocompleteParametersSiriSearch *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteParametersSiriSearch _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 query];
    if (v5) {
      [v4 setObject:v5 forKey:@"query"];
    }

    objc_super v6 = [(id)a1 viewportInfo];
    objc_super v7 = v6;
    if (v6)
    {
      if (a2)
      {
        objc_super v8 = [v6 jsonRepresentation];
        v9 = @"viewportInfo";
      }
      else
      {
        objc_super v8 = [v6 dictionaryRepresentation];
        v9 = @"viewport_info";
      }
      [v4 setObject:v8 forKey:v9];
    }
    char v10 = *(unsigned char *)(a1 + 68);
    if (v10)
    {
      v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
      if (a2) {
        v12 = @"maxResults";
      }
      else {
        v12 = @"max_results";
      }
      [v4 setObject:v11 forKey:v12];

      char v10 = *(unsigned char *)(a1 + 68);
    }
    if ((v10 & 4) != 0)
    {
      v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 65)];
      if (a2) {
        v14 = @"highlightDiff";
      }
      else {
        v14 = @"highlight_diff";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = [(id)a1 prefix];
    if (v15) {
      [v4 setObject:v15 forKey:@"prefix"];
    }

    if ((*(unsigned char *)(a1 + 68) & 2) != 0)
    {
      v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
      [v4 setObject:v16 forKey:@"completed"];
    }
    v17 = *(void **)(a1 + 16);
    if (v17)
    {
      v18 = [v17 dictionaryRepresentation];
      v19 = v18;
      if (a2)
      {
        v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __67__GEOPDAutocompleteParametersSiriSearch__dictionaryRepresentation___block_invoke;
        v24[3] = &unk_1E53D8860;
        id v21 = v20;
        id v25 = v21;
        [v19 enumerateKeysAndObjectsUsingBlock:v24];
        id v22 = v21;

        v19 = v22;
      }
      [v4 setObject:v19 forKey:@"Unknown Fields"];
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
  return -[GEOPDAutocompleteParametersSiriSearch _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __67__GEOPDAutocompleteParametersSiriSearch__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteParametersSiriSearch)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteParametersSiriSearch *)-[GEOPDAutocompleteParametersSiriSearch _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
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
        objc_super v7 = (void *)[v6 copy];
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
        v12 = (void *)v11;
        [a1 setViewportInfo:v11];
      }
      if (a3) {
        v13 = @"maxResults";
      }
      else {
        v13 = @"max_results";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMaxResults:", objc_msgSend(v14, "intValue"));
      }

      if (a3) {
        v15 = @"highlightDiff";
      }
      else {
        v15 = @"highlight_diff";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHighlightDiff:", objc_msgSend(v16, "BOOLValue"));
      }

      v17 = [v5 objectForKeyedSubscript:@"prefix"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = (void *)[v17 copy];
        [a1 setPrefix:v18];
      }
      v19 = [v5 objectForKeyedSubscript:@"completed"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCompleted:", objc_msgSend(v19, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOPDAutocompleteParametersSiriSearch)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteParametersSiriSearch *)-[GEOPDAutocompleteParametersSiriSearch _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1419;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1420;
    }
    GEOPDAutocompleteParametersSiriSearchReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOPDViewportInfo *)self->_viewportInfo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteParametersSiriSearchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteParametersSiriSearchReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 0xFu))
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDAutocompleteParametersSiriSearch *)self readAll:0];
    if (self->_query) {
      PBDataWriterWriteStringField();
    }
    id v5 = v9;
    if (self->_viewportInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v9;
      char flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v9;
    }
    if (self->_prefix)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPDAutocompleteParametersSiriSearch _readViewportInfo]((uint64_t)self);
  viewportInfo = self->_viewportInfo;

  return [(GEOPDViewportInfo *)viewportInfo hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEOPDAutocompleteParametersSiriSearch *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_query) {
    objc_msgSend(v6, "setQuery:");
  }
  if (self->_viewportInfo) {
    objc_msgSend(v6, "setViewportInfo:");
  }
  char flags = (char)self->_flags;
  id v5 = v6;
  if (flags)
  {
    *((_DWORD *)v6 + 15) = self->_maxResults;
    *((unsigned char *)v6 + 68) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((unsigned char *)v6 + 65) = self->_highlightDiff;
    *((unsigned char *)v6 + 68) |= 4u;
  }
  if (self->_prefix)
  {
    objc_msgSend(v6, "setPrefix:");
    id v5 = v6;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((unsigned char *)v5 + 64) = self->_completed;
    *((unsigned char *)v5 + 68) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDAutocompleteParametersSiriSearchReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDAutocompleteParametersSiriSearch *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_query copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 60) = self->_maxResults;
    *(unsigned char *)(v5 + 68) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 65) = self->_highlightDiff;
    *(unsigned char *)(v5 + 68) |= 4u;
  }
  uint64_t v14 = [(NSString *)self->_prefix copyWithZone:a3];
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 64) = self->_completed;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
  v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  [(GEOPDAutocompleteParametersSiriSearch *)self readAll:1];
  [v4 readAll:1];
  query = self->_query;
  if ((unint64_t)query | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](query, "isEqual:")) {
      goto LABEL_24;
    }
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 5))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:")) {
      goto LABEL_24;
    }
  }
  char flags = (char)self->_flags;
  char v8 = *((unsigned char *)v4 + 68);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_maxResults != *((_DWORD *)v4 + 15)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0) {
      goto LABEL_24;
    }
    if (self->_highlightDiff)
    {
      if (!*((unsigned char *)v4 + 65)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 65))
    {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_24;
  }
  prefix = self->_prefix;
  if ((unint64_t)prefix | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](prefix, "isEqual:")) {
      goto LABEL_24;
    }
    char flags = (char)self->_flags;
    char v8 = *((unsigned char *)v4 + 68);
  }
  BOOL v10 = (v8 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) != 0)
    {
      if (self->_completed)
      {
        if (!*((unsigned char *)v4 + 64)) {
          goto LABEL_24;
        }
      }
      else if (*((unsigned char *)v4 + 64))
      {
        goto LABEL_24;
      }
      BOOL v10 = 1;
      goto LABEL_25;
    }
LABEL_24:
    BOOL v10 = 0;
  }
LABEL_25:

  return v10;
}

- (unint64_t)hash
{
  [(GEOPDAutocompleteParametersSiriSearch *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_query hash];
  unint64_t v4 = [(GEOPDViewportInfo *)self->_viewportInfo hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v5 = 2654435761 * self->_maxResults;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_highlightDiff;
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
LABEL_6:
  NSUInteger v7 = [(NSString *)self->_prefix hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_completed;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v8 = a3;
  [v8 readAll:0];
  unint64_t v4 = v8;
  if (v8[4])
  {
    -[GEOPDAutocompleteParametersSiriSearch setQuery:](self, "setQuery:");
    unint64_t v4 = v8;
  }
  viewportInfo = self->_viewportInfo;
  uint64_t v6 = v4[5];
  if (viewportInfo)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDViewportInfo mergeFrom:](viewportInfo, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDAutocompleteParametersSiriSearch setViewportInfo:](self, "setViewportInfo:");
  }
  unint64_t v4 = v8;
LABEL_9:
  char v7 = *((unsigned char *)v4 + 68);
  if (v7)
  {
    self->_maxResults = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 1u;
    char v7 = *((unsigned char *)v4 + 68);
  }
  if ((v7 & 4) != 0)
  {
    self->_highlightDiff = *((unsigned char *)v4 + 65);
    *(unsigned char *)&self->_flags |= 4u;
  }
  if (v4[3])
  {
    -[GEOPDAutocompleteParametersSiriSearch setPrefix:](self, "setPrefix:");
    unint64_t v4 = v8;
  }
  if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    self->_completed = *((unsigned char *)v4 + 64);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPDAutocompleteParametersSiriSearchReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1424);
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
  *(unsigned char *)&self->_flags |= 0x88u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDAutocompleteParametersSiriSearch *)self readAll:0];
    viewportInfo = self->_viewportInfo;
    [(GEOPDViewportInfo *)viewportInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end