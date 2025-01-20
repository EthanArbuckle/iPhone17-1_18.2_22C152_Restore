@interface GEOPDAutocompleteParametersPoiAddressOnly
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHighlightDiff;
- (BOOL)hasMaxResults;
- (BOOL)hasQuery;
- (BOOL)hasViewportInfo;
- (BOOL)highlightDiff;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAutocompleteParametersPoiAddressOnly)init;
- (GEOPDAutocompleteParametersPoiAddressOnly)initWithData:(id)a3;
- (GEOPDAutocompleteParametersPoiAddressOnly)initWithDictionary:(id)a3;
- (GEOPDAutocompleteParametersPoiAddressOnly)initWithJSON:(id)a3;
- (GEOPDViewportInfo)viewportInfo;
- (NSString)query;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)maxResults;
- (unint64_t)hash;
- (void)_readQuery;
- (void)_readViewportInfo;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasHighlightDiff:(BOOL)a3;
- (void)setHasMaxResults:(BOOL)a3;
- (void)setHighlightDiff:(BOOL)a3;
- (void)setMaxResults:(int)a3;
- (void)setQuery:(id)a3;
- (void)setViewportInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteParametersPoiAddressOnly

- (GEOPDAutocompleteParametersPoiAddressOnly)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteParametersPoiAddressOnly;
  v2 = [(GEOPDAutocompleteParametersPoiAddressOnly *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteParametersPoiAddressOnly)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteParametersPoiAddressOnly;
  v3 = [(GEOPDAutocompleteParametersPoiAddressOnly *)&v7 initWithData:a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersPoiAddressOnlyReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuery_tags_1397);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasQuery
{
  return self->_query != 0;
}

- (NSString)query
{
  -[GEOPDAutocompleteParametersPoiAddressOnly _readQuery]((uint64_t)self);
  query = self->_query;

  return query;
}

- (void)setQuery:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)_readViewportInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersPoiAddressOnlyReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_1398);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasViewportInfo
{
  return self->_viewportInfo != 0;
}

- (GEOPDViewportInfo)viewportInfo
{
  -[GEOPDAutocompleteParametersPoiAddressOnly _readViewportInfo]((uint64_t)self);
  viewportInfo = self->_viewportInfo;

  return viewportInfo;
}

- (void)setViewportInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
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
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_maxResults = a3;
}

- (void)setHasMaxResults:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
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
  return (flags & 2) != 0 && self->_highlightDiff;
}

- (void)setHighlightDiff:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_highlightDiff = a3;
}

- (void)setHasHighlightDiff:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHighlightDiff
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteParametersPoiAddressOnly;
  v4 = [(GEOPDAutocompleteParametersPoiAddressOnly *)&v8 description];
  v5 = [(GEOPDAutocompleteParametersPoiAddressOnly *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteParametersPoiAddressOnly _dictionaryRepresentation:]((uint64_t)self, 0);
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
    char v10 = *(unsigned char *)(a1 + 60);
    if (v10)
    {
      v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
      if (a2) {
        v12 = @"maxResults";
      }
      else {
        v12 = @"max_results";
      }
      [v4 setObject:v11 forKey:v12];

      char v10 = *(unsigned char *)(a1 + 60);
    }
    if ((v10 & 2) != 0)
    {
      v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
      if (a2) {
        v14 = @"highlightDiff";
      }
      else {
        v14 = @"highlight_diff";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = *(void **)(a1 + 16);
    if (v15)
    {
      v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __71__GEOPDAutocompleteParametersPoiAddressOnly__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;

        v17 = v20;
      }
      [v4 setObject:v17 forKey:@"Unknown Fields"];
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
  return -[GEOPDAutocompleteParametersPoiAddressOnly _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __71__GEOPDAutocompleteParametersPoiAddressOnly__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteParametersPoiAddressOnly)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteParametersPoiAddressOnly *)-[GEOPDAutocompleteParametersAddressOnly _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOPDAutocompleteParametersPoiAddressOnly)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteParametersPoiAddressOnly *)-[GEOPDAutocompleteParametersAddressOnly _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1399;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1400;
    }
    GEOPDAutocompleteParametersPoiAddressOnlyReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOPDViewportInfo *)self->_viewportInfo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteParametersPoiAddressOnlyIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteParametersPoiAddressOnlyReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
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
    [(GEOPDAutocompleteParametersPoiAddressOnly *)self readAll:0];
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
    if ((flags & 2) != 0)
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
  -[GEOPDAutocompleteParametersPoiAddressOnly _readViewportInfo]((uint64_t)self);
  viewportInfo = self->_viewportInfo;

  return [(GEOPDViewportInfo *)viewportInfo hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOPDAutocompleteParametersPoiAddressOnly *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_query) {
    objc_msgSend(v5, "setQuery:");
  }
  if (self->_viewportInfo) {
    objc_msgSend(v5, "setViewportInfo:");
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v5 + 13) = self->_maxResults;
    *((unsigned char *)v5 + 60) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v5 + 56) = self->_highlightDiff;
    *((unsigned char *)v5 + 60) |= 2u;
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
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDAutocompleteParametersPoiAddressOnlyReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDAutocompleteParametersPoiAddressOnly *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_query copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 52) = self->_maxResults;
    *(unsigned char *)(v5 + 60) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 56) = self->_highlightDiff;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  v14 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v14;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOPDAutocompleteParametersPoiAddressOnly *)self readAll:1];
  [v4 readAll:1];
  query = self->_query;
  if ((unint64_t)query | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](query, "isEqual:")) {
      goto LABEL_13;
    }
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 4))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_maxResults != *((_DWORD *)v4 + 13)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_13;
  }
  BOOL v7 = (*((unsigned char *)v4 + 60) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0)
    {
LABEL_13:
      BOOL v7 = 0;
      goto LABEL_14;
    }
    if (self->_highlightDiff)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_13;
    }
    BOOL v7 = 1;
  }
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  [(GEOPDAutocompleteParametersPoiAddressOnly *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_query hash];
  unint64_t v4 = [(GEOPDViewportInfo *)self->_viewportInfo hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v5 = 2654435761 * self->_maxResults;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_highlightDiff;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  unint64_t v4 = v8;
  if (v8[3])
  {
    -[GEOPDAutocompleteParametersPoiAddressOnly setQuery:](self, "setQuery:");
    unint64_t v4 = v8;
  }
  viewportInfo = self->_viewportInfo;
  uint64_t v6 = v4[4];
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
    -[GEOPDAutocompleteParametersPoiAddressOnly setViewportInfo:](self, "setViewportInfo:");
  }
  unint64_t v4 = v8;
LABEL_9:
  char v7 = *((unsigned char *)v4 + 60);
  if (v7)
  {
    self->_maxResults = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
    char v7 = *((unsigned char *)v4 + 60);
  }
  if ((v7 & 2) != 0)
  {
    self->_highlightDiff = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPDAutocompleteParametersPoiAddressOnlyReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1404);
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
  *(unsigned char *)&self->_flags |= 0x24u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDAutocompleteParametersPoiAddressOnly *)self readAll:0];
    viewportInfo = self->_viewportInfo;
    [(GEOPDViewportInfo *)viewportInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end