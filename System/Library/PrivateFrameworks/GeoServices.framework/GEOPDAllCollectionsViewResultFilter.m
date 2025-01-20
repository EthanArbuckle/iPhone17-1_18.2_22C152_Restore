@interface GEOPDAllCollectionsViewResultFilter
- (BOOL)hasGreenTeaWithValue:(BOOL)result;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAllCollectionsViewResultFilter)init;
- (GEOPDAllCollectionsViewResultFilter)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)filterAddress;
- (id)filterKeyword;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)filterType;
- (unint64_t)hash;
- (void)_readFilterAddress;
- (void)_readFilterKeyword;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setFilterAddress:(uint64_t)a1;
- (void)setFilterKeyword:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAllCollectionsViewResultFilter

void __65__GEOPDAllCollectionsViewResultFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAllCollectionsViewResultFilter)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAllCollectionsViewResultFilter;
  v3 = [(GEOPDAllCollectionsViewResultFilter *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_51;
  }
  if (a3) {
    objc_super v7 = @"filterType";
  }
  else {
    objc_super v7 = @"filter_type";
  }
  v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if ([v9 isEqualToString:@"ALL_COLLECTIONS_VIEW_RESULT_FILTER_TYPE_UNKNOWN"])
    {
      int v10 = 0;
    }
    else if ([v9 isEqualToString:@"ALL_COLLECTIONS_VIEW_RESULT_FILTER_TYPE_ADDRESS"])
    {
      int v10 = 1;
    }
    else if ([v9 isEqualToString:@"ALL_COLLECTIONS_VIEW_RESULT_FILTER_TYPE_KEYWORD"])
    {
      int v10 = 2;
    }
    else
    {
      int v10 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v10 = [v8 intValue];
LABEL_16:
    *(unsigned char *)(v6 + 56) |= 0x10u;
    *(unsigned char *)(v6 + 56) |= 1u;
    *(_DWORD *)(v6 + 52) = v10;
  }

  if (a3) {
    v11 = @"filterAddress";
  }
  else {
    v11 = @"filter_address";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [GEOPDAllCollectionsViewResultFilterTypeAddress alloc];
    if (v13)
    {
      id v14 = v12;
      v13 = [(GEOPDAllCollectionsViewResultFilterTypeAddress *)v13 init];
      if (v13)
      {
        if (a3) {
          v15 = @"geoId";
        }
        else {
          v15 = @"geo_id";
        }
        v16 = [v14 objectForKeyedSubscript:v15];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v17 = [GEOPDMapsIdentifier alloc];
          if (a3) {
            v18 = [(GEOPDMapsIdentifier *)v17 initWithJSON:v16];
          }
          else {
            v18 = [(GEOPDMapsIdentifier *)v17 initWithDictionary:v16];
          }
          v19 = v18;
          -[GEOPDAllCollectionsViewResultFilterTypeAddress setGeoId:]((uint64_t)v13, v18);
        }
      }
    }
    -[GEOPDAllCollectionsViewResultFilter setFilterAddress:](v6, v13);
  }
  if (a3) {
    v20 = @"filterKeyword";
  }
  else {
    v20 = @"filter_keyword";
  }
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = [GEOPDAllCollectionsViewResultFilterTypeKeyword alloc];
    if (v22)
    {
      id v23 = v21;
      v22 = [(GEOPDAllCollectionsViewResultFilterTypeKeyword *)v22 init];
      if (v22)
      {
        if (a3) {
          v24 = @"relatedSearchSuggestion";
        }
        else {
          v24 = @"related_search_suggestion";
        }
        v25 = [v23 objectForKeyedSubscript:v24];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v26 = [GEOPDRelatedSearchSuggestion alloc];
          if (v26) {
            v27 = -[GEOPDRelatedSearchSuggestion _initWithDictionary:isJSON:](v26, v25, a3);
          }
          else {
            v27 = 0;
          }
          -[GEOPDAllCollectionsViewResultFilterTypeKeyword setRelatedSearchSuggestion:]((uint64_t)v22, v27);
        }
      }
    }
    -[GEOPDAllCollectionsViewResultFilter setFilterKeyword:](v6, v22);
  }
LABEL_51:

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDAllCollectionsViewResultFilter readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v5 = *(int *)(a1 + 52);
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v6 = off_1E53DC5D0[v5];
      }
      if (a2) {
        objc_super v7 = @"filterType";
      }
      else {
        objc_super v7 = @"filter_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    v8 = -[GEOPDAllCollectionsViewResultFilter filterAddress]((id *)a1);
    id v9 = v8;
    if (v8)
    {
      if (a2)
      {
        int v10 = [v8 jsonRepresentation];
        v11 = @"filterAddress";
      }
      else
      {
        int v10 = [v8 dictionaryRepresentation];
        v11 = @"filter_address";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = -[GEOPDAllCollectionsViewResultFilter filterKeyword]((id *)a1);
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        id v14 = [v12 jsonRepresentation];
        v15 = @"filterKeyword";
      }
      else
      {
        id v14 = [v12 dictionaryRepresentation];
        v15 = @"filter_keyword";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = *(void **)(a1 + 16);
    if (v16)
    {
      v17 = [v16 dictionaryRepresentation];
      v18 = v17;
      if (a2)
      {
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __65__GEOPDAllCollectionsViewResultFilter__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasGreenTeaWithValue:(BOOL)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDAllCollectionsViewResultFilter _readFilterAddress](result);
    uint64_t v4 = *(void *)(v3 + 24);
    return v4 && ([*(id *)(v4 + 16) hasGreenTeaWithValue:a2] & 1) != 0;
  }
  return result;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 56) |= 2u;
    *(unsigned char *)(a1 + 56) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDAllCollectionsViewResultFilter readAll:](a1, 0);
    uint64_t v3 = *(void *)(a1 + 24);
    if (v3)
    {
      uint64_t v4 = *(void **)(v3 + 8);
      *(void *)(v3 + 8) = 0;

      [*(id *)(v3 + 16) clearUnknownFields:1];
    }
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      uint64_t v6 = *(void **)(v5 + 8);
      *(void *)(v5 + 8) = 0;

      uint64_t v7 = *(void *)(v5 + 16);
      -[GEOPDRelatedSearchSuggestion clearUnknownFields:](v7, 1);
    }
  }
}

- (GEOPDAllCollectionsViewResultFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAllCollectionsViewResultFilter;
  v2 = [(GEOPDAllCollectionsViewResultFilter *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = v2;
  }

  return v3;
}

- (uint64_t)filterType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 56);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
    if (v2) {
      return *(unsigned int *)(v1 + 52);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readFilterAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAllCollectionsViewResultFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFilterAddress_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)filterAddress
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDAllCollectionsViewResultFilter _readFilterAddress]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setFilterAddress:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 56) |= 4u;
    *(unsigned char *)(a1 + 56) |= 0x10u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)_readFilterKeyword
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAllCollectionsViewResultFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFilterKeyword_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)filterKeyword
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDAllCollectionsViewResultFilter _readFilterKeyword]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setFilterKeyword:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 56) |= 8u;
    *(unsigned char *)(a1 + 56) |= 0x10u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAllCollectionsViewResultFilter;
  id v4 = [(GEOPDAllCollectionsViewResultFilter *)&v8 description];
  uint64_t v5 = [(GEOPDAllCollectionsViewResultFilter *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAllCollectionsViewResultFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDAllCollectionsViewResultFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_265;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_266;
      }
      GEOPDAllCollectionsViewResultFilterReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAllCollectionsViewResultFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAllCollectionsViewResultFilter readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_filterAddress)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_filterKeyword)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
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
      GEOPDAllCollectionsViewResultFilterReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAllCollectionsViewResultFilter readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_filterType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  id v9 = [(GEOPDAllCollectionsViewResultFilterTypeAddress *)self->_filterAddress copyWithZone:a3];
  int v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOPDAllCollectionsViewResultFilterTypeKeyword *)self->_filterKeyword copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  -[GEOPDAllCollectionsViewResultFilter readAll:]((uint64_t)self, 1);
  -[GEOPDAllCollectionsViewResultFilter readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_filterType != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  filterAddress = self->_filterAddress;
  if ((unint64_t)filterAddress | *((void *)v4 + 3)
    && !-[GEOPDAllCollectionsViewResultFilterTypeAddress isEqual:](filterAddress, "isEqual:"))
  {
    goto LABEL_11;
  }
  filterKeyword = self->_filterKeyword;
  if ((unint64_t)filterKeyword | *((void *)v4 + 4)) {
    char v7 = -[GEOPDAllCollectionsViewResultFilterTypeKeyword isEqual:](filterKeyword, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDAllCollectionsViewResultFilter readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_filterType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDAllCollectionsViewResultFilterTypeAddress *)self->_filterAddress hash] ^ v3;
  return v4 ^ [(GEOPDAllCollectionsViewResultFilterTypeKeyword *)self->_filterKeyword hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterKeyword, 0);
  objc_storeStrong((id *)&self->_filterAddress, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end