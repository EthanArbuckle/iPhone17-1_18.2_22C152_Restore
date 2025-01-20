@interface GEOPDCategory
+ (BOOL)hasCategoryNamesForPlaceData:(id)a3 type:(unsigned int)a4;
+ (BOOL)isValid:(id)a3;
+ (Class)localizedNameType;
+ (id)_allCategoriesForPlaceData:(id)a3 type:(unsigned int)a4;
+ (id)categoryNamesForPlaceData:(id)a3 type:(unsigned int)a4;
- (BOOL)hasEventCategoryId;
- (BOOL)hasLevel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDCategory)init;
- (GEOPDCategory)initWithData:(id)a3;
- (GEOPDCategory)initWithDictionary:(id)a3;
- (GEOPDCategory)initWithJSON:(id)a3;
- (NSMutableArray)localizedNames;
- (NSString)eventCategoryId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)bestLocalizedCategoryName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)localizedNameAtIndex:(unint64_t)a3;
- (int)level;
- (unint64_t)hash;
- (unint64_t)localizedNamesCount;
- (void)_addNoFlagsLocalizedName:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readEventCategoryId;
- (void)_readLocalizedNames;
- (void)addLocalizedName:(id)a3;
- (void)clearLocalizedNames;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setEventCategoryId:(id)a3;
- (void)setHasLevel:(BOOL)a3;
- (void)setLevel:(int)a3;
- (void)setLocalizedNames:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDCategory

- (NSMutableArray)localizedNames
{
  -[GEOPDCategory _readLocalizedNames]((uint64_t)self);
  localizedNames = self->_localizedNames;

  return localizedNames;
}

- (int)level
{
  return self->_level;
}

- (BOOL)hasLevel
{
  return *(unsigned char *)&self->_flags & 1;
}

- (GEOPDCategory)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDCategory;
  v2 = [(GEOPDCategory *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_readLocalizedNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedNames_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)_addNoFlagsLocalizedName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

+ (id)_allCategoriesForPlaceData:(id)a3 type:(unsigned int)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = [v5 array];
  v8 = [MEMORY[0x1E4F1CA48] array];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__GEOPDCategory_PlaceDataExtras___allCategoriesForPlaceData_type___block_invoke;
  v15[3] = &unk_1E53E18D0;
  id v9 = v8;
  id v16 = v9;
  unsigned int v18 = a4;
  id v10 = v7;
  id v17 = v10;
  [v6 enumerateValidComponentValuesOfType:1 usingBlock:v15];

  uint64_t v11 = [v10 count];
  v12 = v10;
  if (!v11)
  {
    if ([v9 count]) {
      v12 = v9;
    }
    else {
      v12 = 0;
    }
  }
  id v13 = v12;

  return v13;
}

void __66__GEOPDCategory_PlaceDataExtras___allCategoriesForPlaceData_type___block_invoke(uint64_t a1, id *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = -[GEOPDComponentValue entity](a2);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = objc_msgSend(v3, "localizedCategorys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        int v10 = [v9 hasLevel];
        uint64_t v11 = (id *)(a1 + 32);
        if (v10)
        {
          uint64_t v11 = (id *)(a1 + 40);
          if (*(_DWORD *)(a1 + 48) > 1u) {
            continue;
          }
        }
        [*v11 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

+ (id)categoryNamesForPlaceData:(id)a3 type:(unsigned int)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a1, "_allCategoriesForPlaceData:type:", a3);
  if ([v5 count])
  {
    v20 = v5;
    if (a4 >= 2)
    {
      id v6 = v5;
    }
    else
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __65__GEOPDCategory_PlaceDataExtras__categoryNamesForPlaceData_type___block_invoke;
      v25[3] = &__block_descriptor_36_e11_q24__0_8_16l;
      unsigned int v26 = a4;
      id v6 = [v5 sortedArrayUsingComparator:v25];
    }
    v8 = v6;
    id v9 = [MEMORY[0x1E4F1CA70] orderedSet];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      int v13 = 0;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v10);
          }
          id v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v16 localizedNamesCount])
          {
            if (a4 == 1 && (int)[v16 level] < v13 && objc_msgSend(v9, "count")) {
              goto LABEL_21;
            }
            uint64_t v17 = [v16 localizedNames];
            unsigned int v18 = +[GEOLocalizedString bestStringForCurrentLocale:v17 fallbackToFirstAvailable:0];

            if ([v18 length])
            {
              [v9 addObject:v18];
              if (v13 <= (int)[v16 level]) {
                int v13 = [v16 level];
              }
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v12);
    }
LABEL_21:

    if ([v9 count])
    {
      uint64_t v7 = [v9 array];
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t v5 = v20;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __65__GEOPDCategory_PlaceDataExtras__categoryNamesForPlaceData_type___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  int v6 = [a2 level];
  int v7 = [v5 level];

  if (v6 >= v7)
  {
    if (v6 <= v7) {
      return 0;
    }
    BOOL v8 = *(_DWORD *)(a1 + 32) == 0;
    uint64_t v9 = 1;
  }
  else
  {
    BOOL v8 = *(_DWORD *)(a1 + 32) == 0;
    uint64_t v9 = -1;
  }
  if (v8) {
    return v9;
  }
  else {
    return -v9;
  }
}

+ (BOOL)hasCategoryNamesForPlaceData:(id)a3 type:(unsigned int)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = [a1 _allCategoriesForPlaceData:a3 type:*(void *)&a4];
  if ([v4 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v9, "localizedNamesCount", (void)v14))
          {
            id v10 = [v9 localizedNames];
            uint64_t v11 = +[GEOLocalizedString bestStringForCurrentLocale:v10 fallbackToFirstAvailable:0];

            uint64_t v12 = [v11 length];
            if (v12)
            {
              LOBYTE(v6) = 1;
              goto LABEL_14;
            }
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)bestLocalizedCategoryName
{
  v2 = [(GEOPDCategory *)self localizedNames];
  id v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:0];

  return v3;
}

- (GEOPDCategory)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDCategory;
  id v3 = [(GEOPDCategory *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)setLevel:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_level = a3;
}

- (void)setHasLevel:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (void)setLocalizedNames:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  localizedNames = self->_localizedNames;
  self->_localizedNames = v4;
}

- (void)clearLocalizedNames
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  localizedNames = self->_localizedNames;

  [(NSMutableArray *)localizedNames removeAllObjects];
}

- (void)addLocalizedName:(id)a3
{
  id v4 = a3;
  -[GEOPDCategory _readLocalizedNames]((uint64_t)self);
  -[GEOPDCategory _addNoFlagsLocalizedName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (unint64_t)localizedNamesCount
{
  -[GEOPDCategory _readLocalizedNames]((uint64_t)self);
  localizedNames = self->_localizedNames;

  return [(NSMutableArray *)localizedNames count];
}

- (id)localizedNameAtIndex:(unint64_t)a3
{
  -[GEOPDCategory _readLocalizedNames]((uint64_t)self);
  localizedNames = self->_localizedNames;

  return (id)[(NSMutableArray *)localizedNames objectAtIndex:a3];
}

+ (Class)localizedNameType
{
  return (Class)objc_opt_class();
}

- (void)_readEventCategoryId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEventCategoryId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasEventCategoryId
{
  return self->_eventCategoryId != 0;
}

- (NSString)eventCategoryId
{
  -[GEOPDCategory _readEventCategoryId]((uint64_t)self);
  eventCategoryId = self->_eventCategoryId;

  return eventCategoryId;
}

- (void)setEventCategoryId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_eventCategoryId, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDCategory;
  id v4 = [(GEOPDCategory *)&v8 description];
  id v5 = [(GEOPDCategory *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCategory _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 56))
    {
      id v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
      [v4 setObject:v5 forKey:@"level"];
    }
    if ([*(id *)(a1 + 32) count])
    {
      uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v7 = *(id *)(a1 + 32);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v27 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if (a2) {
              [v12 jsonRepresentation];
            }
            else {
            int v13 = [v12 dictionaryRepresentation];
            }
            [v6 addObject:v13];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v9);
      }

      if (a2) {
        long long v14 = @"localizedName";
      }
      else {
        long long v14 = @"localized_name";
      }
      [v4 setObject:v6 forKey:v14];
    }
    long long v15 = [(id)a1 eventCategoryId];
    if (v15)
    {
      if (a2) {
        long long v16 = @"eventCategoryId";
      }
      else {
        long long v16 = @"event_category_id";
      }
      [v4 setObject:v15 forKey:v16];
    }

    long long v17 = *(void **)(a1 + 16);
    if (v17)
    {
      unsigned int v18 = [v17 dictionaryRepresentation];
      uint64_t v19 = v18;
      if (a2)
      {
        v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __43__GEOPDCategory__dictionaryRepresentation___block_invoke;
        v24[3] = &unk_1E53D8860;
        id v21 = v20;
        id v25 = v21;
        [v19 enumerateKeysAndObjectsUsingBlock:v24];
        id v22 = v21;

        uint64_t v19 = v22;
      }
      [v4 setObject:v19 forKey:@"Unknown Fields"];
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
  return -[GEOPDCategory _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __43__GEOPDCategory__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDCategory)initWithDictionary:(id)a3
{
  return (GEOPDCategory *)-[GEOPDCategory _initWithDictionary:isJSON:](self, a3, 0);
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
      uint64_t v6 = [v5 objectForKeyedSubscript:@"level"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLevel:", objc_msgSend(v6, "intValue"));
      }

      if (a3) {
        id v7 = @"localizedName";
      }
      else {
        id v7 = @"localized_name";
      }
      uint64_t v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v22 = v8;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v15 = [GEOLocalizedString alloc];
                if (a3) {
                  uint64_t v16 = [(GEOLocalizedString *)v15 initWithJSON:v14];
                }
                else {
                  uint64_t v16 = [(GEOLocalizedString *)v15 initWithDictionary:v14];
                }
                long long v17 = (void *)v16;
                [a1 addLocalizedName:v16];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v11);
        }

        uint64_t v8 = v22;
      }

      if (a3) {
        unsigned int v18 = @"eventCategoryId";
      }
      else {
        unsigned int v18 = @"event_category_id";
      }
      uint64_t v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = (void *)[v19 copy];
        [a1 setEventCategoryId:v20];
      }
    }
  }

  return a1;
}

- (GEOPDCategory)initWithJSON:(id)a3
{
  return (GEOPDCategory *)-[GEOPDCategory _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_1381;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_1382;
    }
    GEOPDCategoryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDCategoryCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDCategoryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDCategoryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
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
    [(GEOPDCategory *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = self->_localizedNames;
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

    if (self->_eventCategoryId) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOPDCategory *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 10) = self->_readerMarkPos;
  *((_DWORD *)v8 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v8 + 13) = self->_level;
    *((unsigned char *)v8 + 56) |= 1u;
  }
  if ([(GEOPDCategory *)self localizedNamesCount])
  {
    [v8 clearLocalizedNames];
    unint64_t v4 = [(GEOPDCategory *)self localizedNamesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDCategory *)self localizedNameAtIndex:i];
        [v8 addLocalizedName:v7];
      }
    }
  }
  if (self->_eventCategoryId) {
    objc_msgSend(v8, "setEventCategoryId:");
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
      GEOPDCategoryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDCategory *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_level;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = self->_localizedNames;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addLocalizedName:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_eventCategoryId copyWithZone:a3];
  long long v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  uint64_t v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOPDCategory *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_level != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  localizedNames = self->_localizedNames;
  if ((unint64_t)localizedNames | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](localizedNames, "isEqual:"))
  {
    goto LABEL_11;
  }
  eventCategoryId = self->_eventCategoryId;
  if ((unint64_t)eventCategoryId | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](eventCategoryId, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEOPDCategory *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_level;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_localizedNames hash] ^ v3;
  return v4 ^ [(NSString *)self->_eventCategoryId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 56))
  {
    self->_level = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 4);
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
        -[GEOPDCategory addLocalizedName:](self, "addLocalizedName:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 3)) {
    -[GEOPDCategory setEventCategoryId:](self, "setEventCategoryId:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOPDCategoryReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1386);
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
  *(unsigned char *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDCategory *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_localizedNames;
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
  objc_storeStrong((id *)&self->_localizedNames, 0);
  objc_storeStrong((id *)&self->_eventCategoryId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end