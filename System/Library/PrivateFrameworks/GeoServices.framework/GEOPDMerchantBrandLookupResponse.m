@interface GEOPDMerchantBrandLookupResponse
+ (BOOL)isValid:(id)a3;
+ (Class)geoHashType;
- (BOOL)hasIsPrimaryVariant;
- (BOOL)hasMuid;
- (BOOL)hasRelatedGlobalBrandMuid;
- (BOOL)hasScope;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrimaryVariant;
- (BOOL)readFrom:(id)a3;
- (GEOPDMerchantBrandLookupResponse)init;
- (GEOPDMerchantBrandLookupResponse)initWithData:(id)a3;
- (GEOPDMerchantBrandLookupResponse)initWithDictionary:(id)a3;
- (GEOPDMerchantBrandLookupResponse)initWithJSON:(id)a3;
- (NSMutableArray)geoHashs;
- (NSString)scope;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)geoHashAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)abstractOfBrandMuidAtIndex:(unint64_t)a3;
- (unint64_t)abstractOfBrandMuids;
- (unint64_t)abstractOfBrandMuidsCount;
- (unint64_t)childBrandMuidAtIndex:(unint64_t)a3;
- (unint64_t)childBrandMuids;
- (unint64_t)childBrandMuidsCount;
- (unint64_t)geoHashsCount;
- (unint64_t)hash;
- (unint64_t)muid;
- (unint64_t)relatedGlobalBrandMuid;
- (unint64_t)variantBrandMuidAtIndex:(unint64_t)a3;
- (unint64_t)variantBrandMuids;
- (unint64_t)variantBrandMuidsCount;
- (void)_addNoFlagsGeoHash:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAbstractOfBrandMuids;
- (void)_readChildBrandMuids;
- (void)_readGeoHashs;
- (void)_readScope;
- (void)_readVariantBrandMuids;
- (void)addAbstractOfBrandMuid:(unint64_t)a3;
- (void)addChildBrandMuid:(unint64_t)a3;
- (void)addGeoHash:(id)a3;
- (void)addVariantBrandMuid:(unint64_t)a3;
- (void)clearAbstractOfBrandMuids;
- (void)clearChildBrandMuids;
- (void)clearGeoHashs;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearVariantBrandMuids;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbstractOfBrandMuids:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setChildBrandMuids:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setGeoHashs:(id)a3;
- (void)setHasIsPrimaryVariant:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHasRelatedGlobalBrandMuid:(BOOL)a3;
- (void)setIsPrimaryVariant:(BOOL)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setRelatedGlobalBrandMuid:(unint64_t)a3;
- (void)setScope:(id)a3;
- (void)setVariantBrandMuids:(unint64_t *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDMerchantBrandLookupResponse

- (GEOPDMerchantBrandLookupResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDMerchantBrandLookupResponse;
  v2 = [(GEOPDMerchantBrandLookupResponse *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDMerchantBrandLookupResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDMerchantBrandLookupResponse;
  v3 = [(GEOPDMerchantBrandLookupResponse *)&v7 initWithData:a3];
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
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDMerchantBrandLookupResponse;
  [(GEOPDMerchantBrandLookupResponse *)&v3 dealloc];
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasMuid
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readScope
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 144) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantBrandLookupResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readScope_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasScope
{
  return self->_scope != 0;
}

- (NSString)scope
{
  -[GEOPDMerchantBrandLookupResponse _readScope]((uint64_t)self);
  scope = self->_scope;

  return scope;
}

- (void)setScope:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_scope, a3);
}

- (void)_readGeoHashs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 144) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantBrandLookupResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGeoHashs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)geoHashs
{
  -[GEOPDMerchantBrandLookupResponse _readGeoHashs]((uint64_t)self);
  geoHashs = self->_geoHashs;

  return geoHashs;
}

- (void)setGeoHashs:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  geoHashs = self->_geoHashs;
  self->_geoHashs = v4;
}

- (void)clearGeoHashs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  geoHashs = self->_geoHashs;

  [(NSMutableArray *)geoHashs removeAllObjects];
}

- (void)addGeoHash:(id)a3
{
  id v4 = a3;
  -[GEOPDMerchantBrandLookupResponse _readGeoHashs]((uint64_t)self);
  -[GEOPDMerchantBrandLookupResponse _addNoFlagsGeoHash:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsGeoHash:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 96);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v5;

      id v4 = *(void **)(a1 + 96);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)geoHashsCount
{
  -[GEOPDMerchantBrandLookupResponse _readGeoHashs]((uint64_t)self);
  geoHashs = self->_geoHashs;

  return [(NSMutableArray *)geoHashs count];
}

- (id)geoHashAtIndex:(unint64_t)a3
{
  -[GEOPDMerchantBrandLookupResponse _readGeoHashs]((uint64_t)self);
  geoHashs = self->_geoHashs;

  return (id)[(NSMutableArray *)geoHashs objectAtIndex:a3];
}

+ (Class)geoHashType
{
  return (Class)objc_opt_class();
}

- (void)_readChildBrandMuids
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 144) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantBrandLookupResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChildBrandMuids_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (unint64_t)childBrandMuidsCount
{
  return self->_childBrandMuids.count;
}

- (unint64_t)childBrandMuids
{
  return self->_childBrandMuids.list;
}

- (void)clearChildBrandMuids
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;

  PBRepeatedUInt64Clear();
}

- (void)addChildBrandMuid:(unint64_t)a3
{
  if (self) {
    PBRepeatedUInt64Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (unint64_t)childBrandMuidAtIndex:(unint64_t)a3
{
  -[GEOPDMerchantBrandLookupResponse _readChildBrandMuids]((uint64_t)self);
  p_childBrandMuids = &self->_childBrandMuids;
  unint64_t count = self->_childBrandMuids.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_childBrandMuids->list[a3];
}

- (void)setChildBrandMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;

  MEMORY[0x1F4147438](&self->_childBrandMuids, a3, a4);
}

- (void)_readVariantBrandMuids
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 144) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantBrandLookupResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVariantBrandMuids_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (unint64_t)variantBrandMuidsCount
{
  return self->_variantBrandMuids.count;
}

- (unint64_t)variantBrandMuids
{
  return self->_variantBrandMuids.list;
}

- (void)clearVariantBrandMuids
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;

  PBRepeatedUInt64Clear();
}

- (void)addVariantBrandMuid:(unint64_t)a3
{
  if (self) {
    PBRepeatedUInt64Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (unint64_t)variantBrandMuidAtIndex:(unint64_t)a3
{
  -[GEOPDMerchantBrandLookupResponse _readVariantBrandMuids]((uint64_t)self);
  p_variantBrandMuids = &self->_variantBrandMuids;
  unint64_t count = self->_variantBrandMuids.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_variantBrandMuids->list[a3];
}

- (void)setVariantBrandMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;

  MEMORY[0x1F4147438](&self->_variantBrandMuids, a3, a4);
}

- (BOOL)isPrimaryVariant
{
  return self->_isPrimaryVariant;
}

- (void)setIsPrimaryVariant:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_isPrimaryVariant = a3;
}

- (void)setHasIsPrimaryVariant:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 516;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasIsPrimaryVariant
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unint64_t)relatedGlobalBrandMuid
{
  return self->_relatedGlobalBrandMuid;
}

- (void)setRelatedGlobalBrandMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_relatedGlobalBrandMuid = a3;
}

- (void)setHasRelatedGlobalBrandMuid:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 514;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasRelatedGlobalBrandMuid
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readAbstractOfBrandMuids
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 144) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantBrandLookupResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbstractOfBrandMuids_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (unint64_t)abstractOfBrandMuidsCount
{
  return self->_abstractOfBrandMuids.count;
}

- (unint64_t)abstractOfBrandMuids
{
  return self->_abstractOfBrandMuids.list;
}

- (void)clearAbstractOfBrandMuids
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;

  PBRepeatedUInt64Clear();
}

- (void)addAbstractOfBrandMuid:(unint64_t)a3
{
  if (self) {
    PBRepeatedUInt64Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (unint64_t)abstractOfBrandMuidAtIndex:(unint64_t)a3
{
  -[GEOPDMerchantBrandLookupResponse _readAbstractOfBrandMuids]((uint64_t)self);
  p_abstractOfBrandMuids = &self->_abstractOfBrandMuids;
  unint64_t count = self->_abstractOfBrandMuids.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_abstractOfBrandMuids->list[a3];
}

- (void)setAbstractOfBrandMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;

  MEMORY[0x1F4147438](&self->_abstractOfBrandMuids, a3, a4);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDMerchantBrandLookupResponse;
  id v4 = [(GEOPDMerchantBrandLookupResponse *)&v8 description];
  id v5 = [(GEOPDMerchantBrandLookupResponse *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMerchantBrandLookupResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(_WORD *)(a1 + 144))
    {
      id v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 104)];
      [v4 setObject:v5 forKey:@"muid"];
    }
    objc_super v6 = [(id)a1 scope];
    if (v6) {
      [v4 setObject:v6 forKey:@"scope"];
    }

    if (*(void *)(a1 + 96))
    {
      id v7 = [(id)a1 geoHashs];
      if (a2) {
        objc_super v8 = @"geoHash";
      }
      else {
        objc_super v8 = @"geo_hash";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (*(void *)(a1 + 56))
    {
      v9 = PBRepeatedUInt64NSArray();
      if (a2) {
        v10 = @"childBrandMuid";
      }
      else {
        v10 = @"child_brand_muid";
      }
      [v4 setObject:v9 forKey:v10];
    }
    if (*(void *)(a1 + 80))
    {
      v11 = PBRepeatedUInt64NSArray();
      if (a2) {
        v12 = @"variantBrandMuid";
      }
      else {
        v12 = @"variant_brand_muid";
      }
      [v4 setObject:v11 forKey:v12];
    }
    __int16 v13 = *(_WORD *)(a1 + 144);
    if ((v13 & 4) != 0)
    {
      v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 140)];
      if (a2) {
        v15 = @"isPrimaryVariant";
      }
      else {
        v15 = @"is_primary_variant";
      }
      [v4 setObject:v14 forKey:v15];

      __int16 v13 = *(_WORD *)(a1 + 144);
    }
    if ((v13 & 2) != 0)
    {
      v16 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 112)];
      if (a2) {
        v17 = @"relatedGlobalBrandMuid";
      }
      else {
        v17 = @"related_global_brand_muid";
      }
      [v4 setObject:v16 forKey:v17];
    }
    if (*(void *)(a1 + 32))
    {
      v18 = PBRepeatedUInt64NSArray();
      if (a2) {
        v19 = @"abstractOfBrandMuid";
      }
      else {
        v19 = @"abstract_of_brand_muid";
      }
      [v4 setObject:v18 forKey:v19];
    }
    v20 = *(void **)(a1 + 16);
    if (v20)
    {
      v21 = [v20 dictionaryRepresentation];
      v22 = v21;
      if (a2)
      {
        v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __62__GEOPDMerchantBrandLookupResponse__dictionaryRepresentation___block_invoke;
        v27[3] = &unk_1E53D8860;
        id v24 = v23;
        id v28 = v24;
        [v22 enumerateKeysAndObjectsUsingBlock:v27];
        id v25 = v24;

        v22 = v25;
      }
      [v4 setObject:v22 forKey:@"Unknown Fields"];
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
  return -[GEOPDMerchantBrandLookupResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __62__GEOPDMerchantBrandLookupResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDMerchantBrandLookupResponse)initWithDictionary:(id)a3
{
  return (GEOPDMerchantBrandLookupResponse *)-[GEOPDMerchantBrandLookupResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"muid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMuid:", objc_msgSend(v6, "unsignedLongLongValue"));
      }

      id v7 = [v5 objectForKeyedSubscript:@"scope"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setScope:v8];
      }
      if (a3) {
        v9 = @"geoHash";
      }
      else {
        v9 = @"geo_hash";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v49 = a3;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v62 objects:v69 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v63 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v62 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v17 = (void *)[v16 copy];
                [a1 addGeoHash:v17];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v62 objects:v69 count:16];
          }
          while (v13);
        }

        a3 = v49;
      }

      if (a3) {
        v18 = @"childBrandMuid";
      }
      else {
        v18 = @"child_brand_muid";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v20 = a3;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v21 = v19;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v58 objects:v68 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v59;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v59 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v58 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addChildBrandMuid:", objc_msgSend(v26, "unsignedLongLongValue"));
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v58 objects:v68 count:16];
          }
          while (v23);
        }

        a3 = v20;
      }

      if (a3) {
        v27 = @"variantBrandMuid";
      }
      else {
        v27 = @"variant_brand_muid";
      }
      id v28 = [v5 objectForKeyedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v29 = a3;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v30 = v28;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v54 objects:v67 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v55;
          do
          {
            for (uint64_t k = 0; k != v32; ++k)
            {
              if (*(void *)v55 != v33) {
                objc_enumerationMutation(v30);
              }
              v35 = *(void **)(*((void *)&v54 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addVariantBrandMuid:", objc_msgSend(v35, "unsignedLongLongValue"));
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v54 objects:v67 count:16];
          }
          while (v32);
        }

        a3 = v29;
      }

      if (a3) {
        v36 = @"isPrimaryVariant";
      }
      else {
        v36 = @"is_primary_variant";
      }
      v37 = [v5 objectForKeyedSubscript:v36];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsPrimaryVariant:", objc_msgSend(v37, "BOOLValue"));
      }

      if (a3) {
        v38 = @"relatedGlobalBrandMuid";
      }
      else {
        v38 = @"related_global_brand_muid";
      }
      v39 = [v5 objectForKeyedSubscript:v38];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRelatedGlobalBrandMuid:", objc_msgSend(v39, "unsignedLongLongValue"));
      }

      if (a3) {
        v40 = @"abstractOfBrandMuid";
      }
      else {
        v40 = @"abstract_of_brand_muid";
      }
      v41 = [v5 objectForKeyedSubscript:v40];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v42 = v41;
        uint64_t v43 = [v42 countByEnumeratingWithState:&v50 objects:v66 count:16];
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v51;
          do
          {
            for (uint64_t m = 0; m != v44; ++m)
            {
              if (*(void *)v51 != v45) {
                objc_enumerationMutation(v42);
              }
              v47 = *(void **)(*((void *)&v50 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addAbstractOfBrandMuid:", objc_msgSend(v47, "unsignedLongLongValue"));
              }
            }
            uint64_t v44 = [v42 countByEnumeratingWithState:&v50 objects:v66 count:16];
          }
          while (v44);
        }
      }
    }
  }

  return a1;
}

- (GEOPDMerchantBrandLookupResponse)initWithJSON:(id)a3
{
  return (GEOPDMerchantBrandLookupResponse *)-[GEOPDMerchantBrandLookupResponse _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_3888;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3889;
    }
    GEOPDMerchantBrandLookupResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDMerchantBrandLookupResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDMerchantBrandLookupResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3F0) == 0))
  {
    uint64_t v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDMerchantBrandLookupResponse *)self readAll:0];
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_scope) {
      PBDataWriterWriteStringField();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    objc_super v6 = self->_geoHashs;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    if (self->_childBrandMuids.count)
    {
      unint64_t v10 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v10;
      }
      while (v10 < self->_childBrandMuids.count);
    }
    if (self->_variantBrandMuids.count)
    {
      unint64_t v11 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v11;
      }
      while (v11 < self->_variantBrandMuids.count);
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_abstractOfBrandMuids.count)
    {
      unint64_t v13 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v13;
      }
      while (v13 < self->_abstractOfBrandMuids.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (void)copyTo:(id)a3
{
  long long v18 = (id *)a3;
  [(GEOPDMerchantBrandLookupResponse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v18 + 1, self->_reader);
  *((_DWORD *)v18 + 32) = self->_readerMarkPos;
  *((_DWORD *)v18 + 33) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(_WORD *)&self->_flags)
  {
    v18[13] = self->_muid;
    *((_WORD *)v18 + 72) |= 1u;
  }
  if (self->_scope) {
    objc_msgSend(v18, "setScope:");
  }
  if ([(GEOPDMerchantBrandLookupResponse *)self geoHashsCount])
  {
    [v18 clearGeoHashs];
    unint64_t v4 = [(GEOPDMerchantBrandLookupResponse *)self geoHashsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDMerchantBrandLookupResponse *)self geoHashAtIndex:i];
        [v18 addGeoHash:v7];
      }
    }
  }
  if ([(GEOPDMerchantBrandLookupResponse *)self childBrandMuidsCount])
  {
    [v18 clearChildBrandMuids];
    unint64_t v8 = [(GEOPDMerchantBrandLookupResponse *)self childBrandMuidsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        objc_msgSend(v18, "addChildBrandMuid:", -[GEOPDMerchantBrandLookupResponse childBrandMuidAtIndex:](self, "childBrandMuidAtIndex:", j));
    }
  }
  if ([(GEOPDMerchantBrandLookupResponse *)self variantBrandMuidsCount])
  {
    [v18 clearVariantBrandMuids];
    unint64_t v11 = [(GEOPDMerchantBrandLookupResponse *)self variantBrandMuidsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        objc_msgSend(v18, "addVariantBrandMuid:", -[GEOPDMerchantBrandLookupResponse variantBrandMuidAtIndex:](self, "variantBrandMuidAtIndex:", k));
    }
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((unsigned char *)v18 + 140) = self->_isPrimaryVariant;
    *((_WORD *)v18 + 72) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v18[14] = self->_relatedGlobalBrandMuid;
    *((_WORD *)v18 + 72) |= 2u;
  }
  if ([(GEOPDMerchantBrandLookupResponse *)self abstractOfBrandMuidsCount])
  {
    [v18 clearAbstractOfBrandMuids];
    unint64_t v15 = [(GEOPDMerchantBrandLookupResponse *)self abstractOfBrandMuidsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
        objc_msgSend(v18, "addAbstractOfBrandMuid:", -[GEOPDMerchantBrandLookupResponse abstractOfBrandMuidAtIndex:](self, "abstractOfBrandMuidAtIndex:", m));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
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
      GEOPDMerchantBrandLookupResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDMerchantBrandLookupResponse *)self readAll:0];
  if (*(_WORD *)&self->_flags)
  {
    *(void *)(v5 + 104) = self->_muid;
    *(_WORD *)(v5 + 144) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_scope copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v9;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v11 = self->_geoHashs;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v11);
        }
        unint64_t v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (void)v19);
        [(id)v5 addGeoHash:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 140) = self->_isPrimaryVariant;
    *(_WORD *)(v5 + 144) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(void *)(v5 + 112) = self->_relatedGlobalBrandMuid;
    *(_WORD *)(v5 + 144) |= 2u;
  }
  PBRepeatedUInt64Copy();
  long long v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  [(GEOPDMerchantBrandLookupResponse *)self readAll:1];
  [v4 readAll:1];
  __int16 v5 = *((_WORD *)v4 + 72);
  if (*(_WORD *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_muid != *((void *)v4 + 13)) {
      goto LABEL_27;
    }
  }
  else if (v5)
  {
    goto LABEL_27;
  }
  scope = self->_scope;
  if ((unint64_t)scope | *((void *)v4 + 15) && !-[NSString isEqual:](scope, "isEqual:")) {
    goto LABEL_27;
  }
  geoHashs = self->_geoHashs;
  if ((unint64_t)geoHashs | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](geoHashs, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if (!PBRepeatedUInt64IsEqual() || !PBRepeatedUInt64IsEqual()) {
    goto LABEL_27;
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v9 = *((_WORD *)v4 + 72);
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) != 0)
    {
      if (self->_isPrimaryVariant)
      {
        if (!*((unsigned char *)v4 + 140)) {
          goto LABEL_27;
        }
        goto LABEL_21;
      }
      if (!*((unsigned char *)v4 + 140)) {
        goto LABEL_21;
      }
    }
LABEL_27:
    char IsEqual = 0;
    goto LABEL_28;
  }
  if ((v9 & 4) != 0) {
    goto LABEL_27;
  }
LABEL_21:
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_relatedGlobalBrandMuid != *((void *)v4 + 14)) {
      goto LABEL_27;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_27;
  }
  char IsEqual = PBRepeatedUInt64IsEqual();
LABEL_28:

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOPDMerchantBrandLookupResponse *)self readAll:1];
  if (*(_WORD *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_scope hash];
  uint64_t v5 = [(NSMutableArray *)self->_geoHashs hash];
  uint64_t v6 = PBRepeatedUInt64Hash();
  uint64_t v7 = PBRepeatedUInt64Hash();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    uint64_t v9 = 2654435761 * self->_isPrimaryVariant;
    if ((flags & 2) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ PBRepeatedUInt64Hash();
  }
  uint64_t v9 = 0;
  if ((flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v10 = 2654435761u * self->_relatedGlobalBrandMuid;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ PBRepeatedUInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((_WORD *)v4 + 72))
  {
    self->_muid = *((void *)v4 + 13);
    *(_WORD *)&self->_flags |= 1u;
  }
  if (*((void *)v4 + 15)) {
    -[GEOPDMerchantBrandLookupResponse setScope:](self, "setScope:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = *((id *)v4 + 12);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOPDMerchantBrandLookupResponse addGeoHash:](self, "addGeoHash:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [v4 childBrandMuidsCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
      -[GEOPDMerchantBrandLookupResponse addChildBrandMuid:](self, "addChildBrandMuid:", objc_msgSend(v4, "childBrandMuidAtIndex:", j, (void)v20));
  }
  uint64_t v13 = objc_msgSend(v4, "variantBrandMuidsCount", (void)v20);
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t k = 0; k != v14; ++k)
      -[GEOPDMerchantBrandLookupResponse addVariantBrandMuid:](self, "addVariantBrandMuid:", [v4 variantBrandMuidAtIndex:k]);
  }
  __int16 v16 = *((_WORD *)v4 + 72);
  if ((v16 & 4) != 0)
  {
    self->_isPrimaryVariant = *((unsigned char *)v4 + 140);
    *(_WORD *)&self->_flags |= 4u;
    __int16 v16 = *((_WORD *)v4 + 72);
  }
  if ((v16 & 2) != 0)
  {
    self->_relatedGlobalBrandMuid = *((void *)v4 + 14);
    *(_WORD *)&self->_flags |= 2u;
  }
  uint64_t v17 = [v4 abstractOfBrandMuidsCount];
  if (v17)
  {
    uint64_t v18 = v17;
    for (uint64_t m = 0; m != v18; ++m)
      -[GEOPDMerchantBrandLookupResponse addAbstractOfBrandMuid:](self, "addAbstractOfBrandMuid:", [v4 abstractOfBrandMuidAtIndex:m]);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOPDMerchantBrandLookupResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3893);
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
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x208u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDMerchantBrandLookupResponse *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_geoHashs, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end