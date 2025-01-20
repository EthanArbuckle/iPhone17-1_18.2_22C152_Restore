@interface GEOBrandInfoMapping
+ (BOOL)isValid:(id)a3;
+ (Class)isoCountryCodeType;
+ (Class)scopedBrandInfoType;
- (BOOL)hasGlobalBrandId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuggestedAtIndex:(unint64_t)a3;
- (BOOL)isSuggesteds;
- (BOOL)readFrom:(id)a3;
- (GEOBrandInfoMapping)init;
- (GEOBrandInfoMapping)initWithData:(id)a3;
- (GEOBrandInfoMapping)initWithDictionary:(id)a3;
- (GEOBrandInfoMapping)initWithJSON:(id)a3;
- (NSMutableArray)isoCountryCodes;
- (NSMutableArray)scopedBrandInfos;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)isoCountryCodeAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)scopedBrandInfoAtIndex:(unint64_t)a3;
- (unint64_t)globalBrandId;
- (unint64_t)hash;
- (unint64_t)isSuggestedsCount;
- (unint64_t)isoCountryCodesCount;
- (unint64_t)scopedBrandInfosCount;
- (void)_addNoFlagsIsoCountryCode:(uint64_t)a1;
- (void)_addNoFlagsScopedBrandInfo:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readIsSuggesteds;
- (void)_readIsoCountryCodes;
- (void)_readScopedBrandInfos;
- (void)addIsSuggested:(BOOL)a3;
- (void)addIsoCountryCode:(id)a3;
- (void)addScopedBrandInfo:(id)a3;
- (void)clearIsSuggesteds;
- (void)clearIsoCountryCodes;
- (void)clearScopedBrandInfos;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setGlobalBrandId:(unint64_t)a3;
- (void)setHasGlobalBrandId:(BOOL)a3;
- (void)setIsSuggesteds:(BOOL *)a3 count:(unint64_t)a4;
- (void)setIsoCountryCodes:(id)a3;
- (void)setScopedBrandInfos:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOBrandInfoMapping

- (GEOBrandInfoMapping)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOBrandInfoMapping;
  v2 = [(GEOBrandInfoMapping *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOBrandInfoMapping)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOBrandInfoMapping;
  v3 = [(GEOBrandInfoMapping *)&v7 initWithData:a3];
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
  PBRepeatedBOOLClear();
  v3.receiver = self;
  v3.super_class = (Class)GEOBrandInfoMapping;
  [(GEOBrandInfoMapping *)&v3 dealloc];
}

- (unint64_t)globalBrandId
{
  return self->_globalBrandId;
}

- (void)setGlobalBrandId:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_globalBrandId = a3;
}

- (void)setHasGlobalBrandId:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasGlobalBrandId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readScopedBrandInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBrandInfoMappingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readScopedBrandInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)scopedBrandInfos
{
  -[GEOBrandInfoMapping _readScopedBrandInfos]((uint64_t)self);
  scopedBrandInfos = self->_scopedBrandInfos;

  return scopedBrandInfos;
}

- (void)setScopedBrandInfos:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  scopedBrandInfos = self->_scopedBrandInfos;
  self->_scopedBrandInfos = v4;
}

- (void)clearScopedBrandInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  scopedBrandInfos = self->_scopedBrandInfos;

  [(NSMutableArray *)scopedBrandInfos removeAllObjects];
}

- (void)addScopedBrandInfo:(id)a3
{
  id v4 = a3;
  -[GEOBrandInfoMapping _readScopedBrandInfos]((uint64_t)self);
  -[GEOBrandInfoMapping _addNoFlagsScopedBrandInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsScopedBrandInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)scopedBrandInfosCount
{
  -[GEOBrandInfoMapping _readScopedBrandInfos]((uint64_t)self);
  scopedBrandInfos = self->_scopedBrandInfos;

  return [(NSMutableArray *)scopedBrandInfos count];
}

- (id)scopedBrandInfoAtIndex:(unint64_t)a3
{
  -[GEOBrandInfoMapping _readScopedBrandInfos]((uint64_t)self);
  scopedBrandInfos = self->_scopedBrandInfos;

  return (id)[(NSMutableArray *)scopedBrandInfos objectAtIndex:a3];
}

+ (Class)scopedBrandInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readIsoCountryCodes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBrandInfoMappingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIsoCountryCodes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)isoCountryCodes
{
  -[GEOBrandInfoMapping _readIsoCountryCodes]((uint64_t)self);
  isoCountryCodes = self->_isoCountryCodes;

  return isoCountryCodes;
}

- (void)setIsoCountryCodes:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  isoCountryCodes = self->_isoCountryCodes;
  self->_isoCountryCodes = v4;
}

- (void)clearIsoCountryCodes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  isoCountryCodes = self->_isoCountryCodes;

  [(NSMutableArray *)isoCountryCodes removeAllObjects];
}

- (void)addIsoCountryCode:(id)a3
{
  id v4 = a3;
  -[GEOBrandInfoMapping _readIsoCountryCodes]((uint64_t)self);
  -[GEOBrandInfoMapping _addNoFlagsIsoCountryCode:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsIsoCountryCode:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)isoCountryCodesCount
{
  -[GEOBrandInfoMapping _readIsoCountryCodes]((uint64_t)self);
  isoCountryCodes = self->_isoCountryCodes;

  return [(NSMutableArray *)isoCountryCodes count];
}

- (id)isoCountryCodeAtIndex:(unint64_t)a3
{
  -[GEOBrandInfoMapping _readIsoCountryCodes]((uint64_t)self);
  isoCountryCodes = self->_isoCountryCodes;

  return (id)[(NSMutableArray *)isoCountryCodes objectAtIndex:a3];
}

+ (Class)isoCountryCodeType
{
  return (Class)objc_opt_class();
}

- (void)_readIsSuggesteds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBrandInfoMappingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIsSuggesteds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)isSuggestedsCount
{
  return self->_isSuggesteds.count;
}

- (BOOL)isSuggesteds
{
  return self->_isSuggesteds.list;
}

- (void)clearIsSuggesteds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  PBRepeatedBOOLClear();
}

- (void)addIsSuggested:(BOOL)a3
{
  if (self) {
    PBRepeatedBOOLAdd();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (BOOL)isSuggestedAtIndex:(unint64_t)a3
{
  -[GEOBrandInfoMapping _readIsSuggesteds]((uint64_t)self);
  p_isSuggesteds = &self->_isSuggesteds;
  unint64_t count = self->_isSuggesteds.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_isSuggesteds->list[a3];
}

- (void)setIsSuggesteds:(BOOL *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  MEMORY[0x1F41472E8](&self->_isSuggesteds, a3, a4);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOBrandInfoMapping;
  id v4 = [(GEOBrandInfoMapping *)&v8 description];
  id v5 = [(GEOBrandInfoMapping *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOBrandInfoMapping _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 76))
    {
      id v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
      if (a2) {
        objc_super v6 = @"globalBrandId";
      }
      else {
        objc_super v6 = @"global_brand_id";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if ([*(id *)(a1 + 56) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v8 = *(id *)(a1 + 56);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = objc_msgSend(v13, "dictionaryRepresentation", (void)v21);
            }
            objc_msgSend(v7, "addObject:", v14, (void)v21);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"scopedBrandInfo";
      }
      else {
        v15 = @"scoped_brand_info";
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v15, (void)v21);
    }
    if (*(void *)(a1 + 48))
    {
      v16 = [(id)a1 isoCountryCodes];
      if (a2) {
        v17 = @"isoCountryCode";
      }
      else {
        v17 = @"iso_country_code";
      }
      [v4 setObject:v16 forKey:v17];
    }
    if (*(void *)(a1 + 24))
    {
      v18 = PBRepeatedBOOLNSArray();
      if (a2) {
        v19 = @"isSuggested";
      }
      else {
        v19 = @"is_suggested";
      }
      [v4 setObject:v18 forKey:v19];
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
  return -[GEOBrandInfoMapping _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOBrandInfoMapping)initWithDictionary:(id)a3
{
  return (GEOBrandInfoMapping *)-[GEOBrandInfoMapping _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"globalBrandId";
      }
      else {
        objc_super v6 = @"global_brand_id";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setGlobalBrandId:", objc_msgSend(v7, "unsignedLongLongValue"));
      }

      if (a3) {
        id v8 = @"scopedBrandInfo";
      }
      else {
        id v8 = @"scoped_brand_info";
      }
      uint64_t v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        v37 = v9;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v46 objects:v52 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v47 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v46 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v16 = [GEOScopedBrandInfo alloc];
                if (a3) {
                  uint64_t v17 = [(GEOScopedBrandInfo *)v16 initWithJSON:v15];
                }
                else {
                  uint64_t v17 = [(GEOScopedBrandInfo *)v16 initWithDictionary:v15];
                }
                v18 = (void *)v17;
                objc_msgSend(a1, "addScopedBrandInfo:", v17, v37);
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v46 objects:v52 count:16];
          }
          while (v12);
        }

        uint64_t v9 = v37;
      }

      if (a3) {
        v19 = @"isoCountryCode";
      }
      else {
        v19 = @"iso_country_code";
      }
      v20 = objc_msgSend(v5, "objectForKeyedSubscript:", v19, v37);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v43;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v43 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void **)(*((void *)&v42 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v27 = (void *)[v26 copy];
                [a1 addIsoCountryCode:v27];
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v42 objects:v51 count:16];
          }
          while (v23);
        }
      }
      if (a3) {
        v28 = @"isSuggested";
      }
      else {
        v28 = @"is_suggested";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v30 = v29;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v38 objects:v50 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v39;
          do
          {
            for (uint64_t k = 0; k != v32; ++k)
            {
              if (*(void *)v39 != v33) {
                objc_enumerationMutation(v30);
              }
              v35 = *(void **)(*((void *)&v38 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addIsSuggested:", objc_msgSend(v35, "BOOLValue"));
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v38 objects:v50 count:16];
          }
          while (v32);
        }
      }
    }
  }

  return a1;
}

- (GEOBrandInfoMapping)initWithJSON:(id)a3
{
  return (GEOBrandInfoMapping *)-[GEOBrandInfoMapping _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_31;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_31;
    }
    GEOBrandInfoMappingReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOBrandInfoMappingCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOBrandInfoMappingIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOBrandInfoMappingReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
  {
    v16 = self->_reader;
    objc_sync_enter(v16);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v17 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v17];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v16);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOBrandInfoMapping *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    objc_super v6 = self->_scopedBrandInfos;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v7);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = self->_isoCountryCodes;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v11);
    }

    p_isSuggesteds = &self->_isSuggesteds;
    if (p_isSuggesteds->count)
    {
      PBDataWriterPlaceMark();
      if (p_isSuggesteds->count)
      {
        unint64_t v15 = 0;
        do
        {
          PBDataWriterWriteBOOLField();
          ++v15;
        }
        while (v15 < p_isSuggesteds->count);
      }
      PBDataWriterRecallMark();
    }
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v15 = (id *)a3;
  [(GEOBrandInfoMapping *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v15 + 1, self->_reader);
  *((_DWORD *)v15 + 16) = self->_readerMarkPos;
  *((_DWORD *)v15 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    v15[5] = self->_globalBrandId;
    *((unsigned char *)v15 + 76) |= 1u;
  }
  if ([(GEOBrandInfoMapping *)self scopedBrandInfosCount])
  {
    [v15 clearScopedBrandInfos];
    unint64_t v4 = [(GEOBrandInfoMapping *)self scopedBrandInfosCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOBrandInfoMapping *)self scopedBrandInfoAtIndex:i];
        [v15 addScopedBrandInfo:v7];
      }
    }
  }
  if ([(GEOBrandInfoMapping *)self isoCountryCodesCount])
  {
    [v15 clearIsoCountryCodes];
    unint64_t v8 = [(GEOBrandInfoMapping *)self isoCountryCodesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOBrandInfoMapping *)self isoCountryCodeAtIndex:j];
        [v15 addIsoCountryCode:v11];
      }
    }
  }
  if ([(GEOBrandInfoMapping *)self isSuggestedsCount])
  {
    [v15 clearIsSuggesteds];
    unint64_t v12 = [(GEOBrandInfoMapping *)self isSuggestedsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
        objc_msgSend(v15, "addIsSuggested:", -[GEOBrandInfoMapping isSuggestedAtIndex:](self, "isSuggestedAtIndex:", k));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
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
      GEOBrandInfoMappingReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOBrandInfoMapping *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 40) = self->_globalBrandId;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unint64_t v9 = self->_scopedBrandInfos;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v24 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addScopedBrandInfo:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v14 = self->_isoCountryCodes;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "copyWithZone:", a3, (void)v20);
        [(id)v5 addIsoCountryCode:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  PBRepeatedBOOLCopy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  [(GEOBrandInfoMapping *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_globalBrandId != *((void *)v4 + 5)) {
      goto LABEL_12;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
LABEL_12:
    char v7 = 0;
    goto LABEL_13;
  }
  scopedBrandInfos = self->_scopedBrandInfos;
  if ((unint64_t)scopedBrandInfos | *((void *)v4 + 7)
    && !-[NSMutableArray isEqual:](scopedBrandInfos, "isEqual:"))
  {
    goto LABEL_12;
  }
  isoCountryCodes = self->_isoCountryCodes;
  if ((unint64_t)isoCountryCodes | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](isoCountryCodes, "isEqual:")) {
      goto LABEL_12;
    }
  }
  char v7 = PBRepeatedBOOLIsEqual();
LABEL_13:

  return v7;
}

- (unint64_t)hash
{
  [(GEOBrandInfoMapping *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_globalBrandId;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_scopedBrandInfos hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_isoCountryCodes hash];
  return v4 ^ v5 ^ PBRepeatedBOOLHash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 76))
  {
    self->_globalBrandId = *((void *)v4 + 5);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = *((id *)v4 + 7);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOBrandInfoMapping *)self addScopedBrandInfo:*(void *)(*((void *)&v22 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = *((id *)v4 + 6);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOBrandInfoMapping addIsoCountryCode:](self, "addIsoCountryCode:", *(void *)(*((void *)&v18 + 1) + 8 * v14++), (void)v18);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }

  uint64_t v15 = [v4 isSuggestedsCount];
  if (v15)
  {
    uint64_t v16 = v15;
    for (uint64_t i = 0; i != v16; ++i)
      -[GEOBrandInfoMapping addIsSuggested:](self, "addIsSuggested:", objc_msgSend(v4, "isSuggestedAtIndex:", i, (void)v18));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopedBrandInfos, 0);
  objc_storeStrong((id *)&self->_isoCountryCodes, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end