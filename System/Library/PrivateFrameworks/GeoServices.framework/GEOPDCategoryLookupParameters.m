@interface GEOPDCategoryLookupParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDCategoryLookupParameters)init;
- (GEOPDCategoryLookupParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setMapsCategoryId:(uint64_t)a1;
- (void)setWalletCategoryId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDCategoryLookupParameters

- (GEOPDCategoryLookupParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDCategoryLookupParameters;
  v2 = [(GEOPDCategoryLookupParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDCategoryLookupParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDCategoryLookupParameters;
  v3 = [(GEOPDCategoryLookupParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setMapsCategoryId:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 60) |= 4u;
  *(unsigned char *)(a1 + 60) |= 0x10u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setWalletCategoryId:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 60) |= 8u;
  *(unsigned char *)(a1 + 60) |= 0x10u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDCategoryLookupParameters;
  id v4 = [(GEOPDCategoryLookupParameters *)&v8 description];
  v5 = [(GEOPDCategoryLookupParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCategoryLookupParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDCategoryLookupParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDCategoryLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsCategoryId_tags_1487);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v7 = *(id *)(a1 + 32);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"mapsCategoryId";
      }
      else {
        objc_super v8 = @"maps_category_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDCategoryLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWalletCategoryId_tags_1488);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v11 = *(id *)(a1 + 40);
    if (v11)
    {
      if (a2) {
        v12 = @"walletCategoryId";
      }
      else {
        v12 = @"wallet_category_id";
      }
      [v4 setObject:v11 forKey:v12];
    }

    if (*(unsigned char *)(a1 + 60))
    {
      v13 = [NSNumber numberWithLongLong:*(void *)(a1 + 24)];
      if (a2) {
        v14 = @"industryCode";
      }
      else {
        v14 = @"industry_code";
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
        v22[2] = __59__GEOPDCategoryLookupParameters__dictionaryRepresentation___block_invoke;
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
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDCategoryLookupParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_1495;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_1496;
      }
      GEOPDCategoryLookupParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __59__GEOPDCategoryLookupParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"mapsCategoryId";
      }
      else {
        id v6 = @"maps_category_id";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        -[GEOPDCategoryLookupParameters setMapsCategoryId:](a1, v8);
      }
      if (a3) {
        v9 = @"walletCategoryId";
      }
      else {
        v9 = @"wallet_category_id";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = (void *)[v10 copy];
        -[GEOPDCategoryLookupParameters setWalletCategoryId:](a1, v11);
      }
      if (a3) {
        v12 = @"industryCode";
      }
      else {
        v12 = @"industry_code";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = [v13 longLongValue];
        *(unsigned char *)(a1 + 60) |= 0x10u;
        *(unsigned char *)(a1 + 60) |= 1u;
        *(void *)(a1 + 24) = v14;
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDCategoryLookupParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    id v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDCategoryLookupParameters readAll:]((uint64_t)self, 0);
    if (self->_mapsCategoryId) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_walletCategoryId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteSint64Field();
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
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDCategoryLookupParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDCategoryLookupParameters readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_mapsCategoryId copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_walletCategoryId copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 24) = self->_industryCode;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
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
    goto LABEL_10;
  }
  -[GEOPDCategoryLookupParameters readAll:]((uint64_t)self, 1);
  -[GEOPDCategoryLookupParameters readAll:]((uint64_t)v4, 1);
  mapsCategoryId = self->_mapsCategoryId;
  if ((unint64_t)mapsCategoryId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](mapsCategoryId, "isEqual:")) {
      goto LABEL_10;
    }
  }
  walletCategoryId = self->_walletCategoryId;
  if ((unint64_t)walletCategoryId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](walletCategoryId, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) != 0 && self->_industryCode == *((void *)v4 + 3))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDCategoryLookupParameters readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_mapsCategoryId hash];
  NSUInteger v4 = [(NSString *)self->_walletCategoryId hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_industryCode;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 2u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    NSUInteger v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDCategoryLookupParameters readAll:](a1, 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletCategoryId, 0);
  objc_storeStrong((id *)&self->_mapsCategoryId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end