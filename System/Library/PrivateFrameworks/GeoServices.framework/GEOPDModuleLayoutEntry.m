@interface GEOPDModuleLayoutEntry
+ (BOOL)isValid:(id)a3;
+ (Class)applicationIdType;
+ (Class)modulesType;
- (BOOL)hasDebugLayoutId;
- (BOOL)hasPlatformType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDModuleLayoutEntry)init;
- (GEOPDModuleLayoutEntry)initWithData:(id)a3;
- (GEOPDModuleLayoutEntry)initWithDictionary:(id)a3;
- (GEOPDModuleLayoutEntry)initWithJSON:(id)a3;
- (NSMutableArray)applicationIds;
- (NSMutableArray)modules;
- (NSString)debugLayoutId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)applicationIdAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)modulesAtIndex:(unint64_t)a3;
- (id)platformTypeAsString:(int)a3;
- (int)StringAsPlatformType:(id)a3;
- (int)platformType;
- (unint64_t)applicationIdsCount;
- (unint64_t)hash;
- (unint64_t)modulesCount;
- (void)_addNoFlagsApplicationId:(uint64_t)a1;
- (void)_addNoFlagsModules:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readApplicationIds;
- (void)_readDebugLayoutId;
- (void)_readModules;
- (void)addApplicationId:(id)a3;
- (void)addModules:(id)a3;
- (void)clearApplicationIds;
- (void)clearModules;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setApplicationIds:(id)a3;
- (void)setDebugLayoutId:(id)a3;
- (void)setHasPlatformType:(BOOL)a3;
- (void)setModules:(id)a3;
- (void)setPlatformType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDModuleLayoutEntry

- (GEOPDModuleLayoutEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDModuleLayoutEntry;
  v2 = [(GEOPDModuleLayoutEntry *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDModuleLayoutEntry)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDModuleLayoutEntry;
  v3 = [(GEOPDModuleLayoutEntry *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readApplicationIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleLayoutEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readApplicationIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)applicationIds
{
  -[GEOPDModuleLayoutEntry _readApplicationIds]((uint64_t)self);
  applicationIds = self->_applicationIds;

  return applicationIds;
}

- (void)setApplicationIds:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  applicationIds = self->_applicationIds;
  self->_applicationIds = v4;
}

- (void)clearApplicationIds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  applicationIds = self->_applicationIds;

  [(NSMutableArray *)applicationIds removeAllObjects];
}

- (void)addApplicationId:(id)a3
{
  id v4 = a3;
  -[GEOPDModuleLayoutEntry _readApplicationIds]((uint64_t)self);
  -[GEOPDModuleLayoutEntry _addNoFlagsApplicationId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsApplicationId:(uint64_t)a1
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

- (unint64_t)applicationIdsCount
{
  -[GEOPDModuleLayoutEntry _readApplicationIds]((uint64_t)self);
  applicationIds = self->_applicationIds;

  return [(NSMutableArray *)applicationIds count];
}

- (id)applicationIdAtIndex:(unint64_t)a3
{
  -[GEOPDModuleLayoutEntry _readApplicationIds]((uint64_t)self);
  applicationIds = self->_applicationIds;

  return (id)[(NSMutableArray *)applicationIds objectAtIndex:a3];
}

+ (Class)applicationIdType
{
  return (Class)objc_opt_class();
}

- (void)_readDebugLayoutId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleLayoutEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDebugLayoutId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDebugLayoutId
{
  return self->_debugLayoutId != 0;
}

- (NSString)debugLayoutId
{
  -[GEOPDModuleLayoutEntry _readDebugLayoutId]((uint64_t)self);
  debugLayoutId = self->_debugLayoutId;

  return debugLayoutId;
}

- (void)setDebugLayoutId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_debugLayoutId, a3);
}

- (int)platformType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_platformType;
  }
  else {
    return 0;
  }
}

- (void)setPlatformType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_platformType = a3;
}

- (void)setHasPlatformType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasPlatformType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)platformTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E3E60[a3];
  }

  return v3;
}

- (int)StringAsPlatformType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PLATFORM_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PLATFORM_TYPE_IOS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PLATFORM_TYPE_MACOS"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readModules
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleLayoutEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModules_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)modules
{
  -[GEOPDModuleLayoutEntry _readModules]((uint64_t)self);
  modules = self->_modules;

  return modules;
}

- (void)setModules:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  modules = self->_modules;
  self->_modules = v4;
}

- (void)clearModules
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  modules = self->_modules;

  [(NSMutableArray *)modules removeAllObjects];
}

- (void)addModules:(id)a3
{
  id v4 = a3;
  -[GEOPDModuleLayoutEntry _readModules]((uint64_t)self);
  -[GEOPDModuleLayoutEntry _addNoFlagsModules:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsModules:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)modulesCount
{
  -[GEOPDModuleLayoutEntry _readModules]((uint64_t)self);
  modules = self->_modules;

  return [(NSMutableArray *)modules count];
}

- (id)modulesAtIndex:(unint64_t)a3
{
  -[GEOPDModuleLayoutEntry _readModules]((uint64_t)self);
  modules = self->_modules;

  return (id)[(NSMutableArray *)modules objectAtIndex:a3];
}

+ (Class)modulesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDModuleLayoutEntry;
  id v4 = [(GEOPDModuleLayoutEntry *)&v8 description];
  id v5 = [(GEOPDModuleLayoutEntry *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDModuleLayoutEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 24))
    {
      id v5 = [(id)a1 applicationIds];
      if (a2) {
        objc_super v6 = @"applicationId";
      }
      else {
        objc_super v6 = @"application_id";
      }
      [v4 setObject:v5 forKey:v6];
    }
    id v7 = [(id)a1 debugLayoutId];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"debugLayoutId";
      }
      else {
        objc_super v8 = @"debug_layout_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v9 = *(int *)(a1 + 60);
      if (v9 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53E3E60[v9];
      }
      if (a2) {
        v11 = @"platformType";
      }
      else {
        v11 = @"platform_type";
      }
      [v4 setObject:v10 forKey:v11];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v13 = *(id *)(a1 + 40);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v30 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if (a2) {
              [v18 jsonRepresentation];
            }
            else {
            v19 = [v18 dictionaryRepresentation];
            }
            [v12 addObject:v19];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v15);
      }

      [v4 setObject:v12 forKey:@"modules"];
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
        v27[2] = __52__GEOPDModuleLayoutEntry__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDModuleLayoutEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEOPDModuleLayoutEntry__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDModuleLayoutEntry)initWithDictionary:(id)a3
{
  return (GEOPDModuleLayoutEntry *)-[GEOPDModuleLayoutEntry _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_52;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_52;
  }
  if (a3) {
    objc_super v6 = @"applicationId";
  }
  else {
    objc_super v6 = @"application_id";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v39 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = (void *)[v13 copy];
            [a1 addApplicationId:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v10);
    }
  }
  if (a3) {
    uint64_t v15 = @"debugLayoutId";
  }
  else {
    uint64_t v15 = @"debug_layout_id";
  }
  uint64_t v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = (void *)[v16 copy];
    [a1 setDebugLayoutId:v17];
  }
  if (a3) {
    v18 = @"platformType";
  }
  else {
    v18 = @"platform_type";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v19;
    if ([v20 isEqualToString:@"PLATFORM_TYPE_UNKNOWN"])
    {
      uint64_t v21 = 0;
    }
    else if ([v20 isEqualToString:@"PLATFORM_TYPE_IOS"])
    {
      uint64_t v21 = 1;
    }
    else if ([v20 isEqualToString:@"PLATFORM_TYPE_MACOS"])
    {
      uint64_t v21 = 2;
    }
    else
    {
      uint64_t v21 = 0;
    }

    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = [v19 intValue];
LABEL_36:
    [a1 setPlatformType:v21];
  }

  v22 = [v5 objectForKeyedSubscript:@"modules"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = v5;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v34 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v29 = [GEOPDModule alloc];
            if (a3) {
              uint64_t v30 = [(GEOPDModule *)v29 initWithJSON:v28];
            }
            else {
              uint64_t v30 = [(GEOPDModule *)v29 initWithDictionary:v28];
            }
            long long v31 = (void *)v30;
            [a1 addModules:v30];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v25);
    }

    id v5 = v33;
  }

LABEL_52:
  return a1;
}

- (GEOPDModuleLayoutEntry)initWithJSON:(id)a3
{
  return (GEOPDModuleLayoutEntry *)-[GEOPDModuleLayoutEntry _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_6683;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_6684;
    }
    GEOPDModuleLayoutEntryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDModuleLayoutEntryCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDModuleLayoutEntryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDModuleLayoutEntryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDModuleLayoutEntryIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDModuleLayoutEntry *)self readAll:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_applicationIds;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    if (self->_debugLayoutId) {
      PBDataWriterWriteStringField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = self->_modules;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOPDModuleLayoutEntry *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 12) = self->_readerMarkPos;
  *((_DWORD *)v12 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOPDModuleLayoutEntry *)self applicationIdsCount])
  {
    [v12 clearApplicationIds];
    unint64_t v4 = [(GEOPDModuleLayoutEntry *)self applicationIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDModuleLayoutEntry *)self applicationIdAtIndex:i];
        [v12 addApplicationId:v7];
      }
    }
  }
  if (self->_debugLayoutId) {
    objc_msgSend(v12, "setDebugLayoutId:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v12 + 15) = self->_platformType;
    *((unsigned char *)v12 + 64) |= 1u;
  }
  if ([(GEOPDModuleLayoutEntry *)self modulesCount])
  {
    [v12 clearModules];
    unint64_t v8 = [(GEOPDModuleLayoutEntry *)self modulesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOPDModuleLayoutEntry *)self modulesAtIndex:j];
        [v12 addModules:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDModuleLayoutEntryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDModuleLayoutEntry *)self readAll:0];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unint64_t v9 = self->_applicationIds;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addApplicationId:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_debugLayoutId copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_platformType;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v16 = self->_modules;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (void)v23);
        [(id)v5 addModules:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  long long v21 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOPDModuleLayoutEntry *)self readAll:1];
  [v4 readAll:1];
  applicationIds = self->_applicationIds;
  if ((unint64_t)applicationIds | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](applicationIds, "isEqual:")) {
      goto LABEL_13;
    }
  }
  debugLayoutId = self->_debugLayoutId;
  if ((unint64_t)debugLayoutId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](debugLayoutId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_platformType != *((_DWORD *)v4 + 15)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  modules = self->_modules;
  if ((unint64_t)modules | *((void *)v4 + 5)) {
    char v8 = -[NSMutableArray isEqual:](modules, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  [(GEOPDModuleLayoutEntry *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_applicationIds hash];
  NSUInteger v4 = [(NSString *)self->_debugLayoutId hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_platformType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_modules hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOPDModuleLayoutEntry *)self addApplicationId:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 4)) {
    [(GEOPDModuleLayoutEntry *)self setDebugLayoutId:"setDebugLayoutId:"];
  }
  if (*((unsigned char *)v4 + 64))
  {
    self->_platformType = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 5);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOPDModuleLayoutEntry addModules:](self, "addModules:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
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
      GEOPDModuleLayoutEntryReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6688);
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
  *(unsigned char *)&self->_flags |= 0x22u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDModuleLayoutEntry *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_modules;
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
  objc_storeStrong((id *)&self->_modules, 0);
  objc_storeStrong((id *)&self->_debugLayoutId, 0);
  objc_storeStrong((id *)&self->_applicationIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end