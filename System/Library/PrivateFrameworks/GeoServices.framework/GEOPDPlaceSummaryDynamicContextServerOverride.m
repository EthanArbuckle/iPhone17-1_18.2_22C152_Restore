@interface GEOPDPlaceSummaryDynamicContextServerOverride
+ (BOOL)isValid:(id)a3;
+ (Class)mapsIdType;
+ (Class)serverDynamicContextType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceSummaryDynamicContextServerOverride)init;
- (GEOPDPlaceSummaryDynamicContextServerOverride)initWithData:(id)a3;
- (GEOPDPlaceSummaryDynamicContextServerOverride)initWithDictionary:(id)a3;
- (GEOPDPlaceSummaryDynamicContextServerOverride)initWithJSON:(id)a3;
- (NSArray)mapItemIdentifiers;
- (NSMutableArray)mapsIds;
- (NSMutableArray)serverDynamicContexts;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mapsIdAtIndex:(unint64_t)a3;
- (id)serverDynamicContextAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)mapsIdsCount;
- (unint64_t)serverDynamicContextsCount;
- (void)_addNoFlagsMapsId:(uint64_t)a1;
- (void)_addNoFlagsServerDynamicContext:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readMapsIds;
- (void)_readServerDynamicContexts;
- (void)addMapsId:(id)a3;
- (void)addServerDynamicContext:(id)a3;
- (void)clearMapsIds;
- (void)clearServerDynamicContexts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setMapsIds:(id)a3;
- (void)setServerDynamicContexts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceSummaryDynamicContextServerOverride

- (NSArray)mapItemIdentifiers
{
  v3 = [(GEOPDPlaceSummaryDynamicContextServerOverride *)self mapsIds];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__22;
    v13 = __Block_byref_object_dispose__22;
    id v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[GEOPDPlaceSummaryDynamicContextServerOverride mapsIdsCount](self, "mapsIdsCount"));
    v5 = [(GEOPDPlaceSummaryDynamicContextServerOverride *)self mapsIds];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75__GEOPDPlaceSummaryDynamicContextServerOverride_Extras__mapItemIdentifiers__block_invoke;
    v8[3] = &unk_1E53DF048;
    v8[4] = &v9;
    [v5 enumerateObjectsUsingBlock:v8];

    v6 = (void *)[(id)v10[5] copy];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    v6 = 0;
  }

  return (NSArray *)v6;
}

void __75__GEOPDPlaceSummaryDynamicContextServerOverride_Extras__mapItemIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5 = [[GEOMapItemIdentifier alloc] initWithMapsIdentifier:v3];

  uint64_t v4 = v5;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
    uint64_t v4 = v5;
  }
}

- (GEOPDPlaceSummaryDynamicContextServerOverride)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceSummaryDynamicContextServerOverride;
  v2 = [(GEOPDPlaceSummaryDynamicContextServerOverride *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceSummaryDynamicContextServerOverride)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceSummaryDynamicContextServerOverride;
  id v3 = [(GEOPDPlaceSummaryDynamicContextServerOverride *)&v7 initWithData:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMapsIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryDynamicContextServerOverrideReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsIds_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)mapsIds
{
  -[GEOPDPlaceSummaryDynamicContextServerOverride _readMapsIds]((uint64_t)self);
  mapsIds = self->_mapsIds;

  return mapsIds;
}

- (void)setMapsIds:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  mapsIds = self->_mapsIds;
  self->_mapsIds = v4;
}

- (void)clearMapsIds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  mapsIds = self->_mapsIds;

  [(NSMutableArray *)mapsIds removeAllObjects];
}

- (void)addMapsId:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceSummaryDynamicContextServerOverride _readMapsIds]((uint64_t)self);
  -[GEOPDPlaceSummaryDynamicContextServerOverride _addNoFlagsMapsId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (void)_addNoFlagsMapsId:(uint64_t)a1
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

- (unint64_t)mapsIdsCount
{
  -[GEOPDPlaceSummaryDynamicContextServerOverride _readMapsIds]((uint64_t)self);
  mapsIds = self->_mapsIds;

  return [(NSMutableArray *)mapsIds count];
}

- (id)mapsIdAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceSummaryDynamicContextServerOverride _readMapsIds]((uint64_t)self);
  mapsIds = self->_mapsIds;

  return (id)[(NSMutableArray *)mapsIds objectAtIndex:a3];
}

+ (Class)mapsIdType
{
  return (Class)objc_opt_class();
}

- (void)_readServerDynamicContexts
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryDynamicContextServerOverrideReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServerDynamicContexts_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)serverDynamicContexts
{
  -[GEOPDPlaceSummaryDynamicContextServerOverride _readServerDynamicContexts]((uint64_t)self);
  serverDynamicContexts = self->_serverDynamicContexts;

  return serverDynamicContexts;
}

- (void)setServerDynamicContexts:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  serverDynamicContexts = self->_serverDynamicContexts;
  self->_serverDynamicContexts = v4;
}

- (void)clearServerDynamicContexts
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  serverDynamicContexts = self->_serverDynamicContexts;

  [(NSMutableArray *)serverDynamicContexts removeAllObjects];
}

- (void)addServerDynamicContext:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceSummaryDynamicContextServerOverride _readServerDynamicContexts]((uint64_t)self);
  -[GEOPDPlaceSummaryDynamicContextServerOverride _addNoFlagsServerDynamicContext:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (void)_addNoFlagsServerDynamicContext:(uint64_t)a1
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

- (unint64_t)serverDynamicContextsCount
{
  -[GEOPDPlaceSummaryDynamicContextServerOverride _readServerDynamicContexts]((uint64_t)self);
  serverDynamicContexts = self->_serverDynamicContexts;

  return [(NSMutableArray *)serverDynamicContexts count];
}

- (id)serverDynamicContextAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceSummaryDynamicContextServerOverride _readServerDynamicContexts]((uint64_t)self);
  serverDynamicContexts = self->_serverDynamicContexts;

  return (id)[(NSMutableArray *)serverDynamicContexts objectAtIndex:a3];
}

+ (Class)serverDynamicContextType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceSummaryDynamicContextServerOverride;
  id v4 = [(GEOPDPlaceSummaryDynamicContextServerOverride *)&v8 description];
  id v5 = [(GEOPDPlaceSummaryDynamicContextServerOverride *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryDynamicContextServerOverride _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[2] count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v6 = a1[2];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v29 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"mapsId";
      }
      else {
        v13 = @"maps_id";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if ([a1[3] count])
    {
      id v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v15 = a1[3];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v25 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v24 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = objc_msgSend(v20, "dictionaryRepresentation", (void)v24);
            }
            objc_msgSend(v14, "addObject:", v21, (void)v24);
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v17);
      }

      if (a2) {
        v22 = @"serverDynamicContext";
      }
      else {
        v22 = @"server_dynamic_context";
      }
      objc_msgSend(v4, "setObject:forKey:", v14, v22, (void)v24);
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
  return -[GEOPDPlaceSummaryDynamicContextServerOverride _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOPDPlaceSummaryDynamicContextServerOverride)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryDynamicContextServerOverride *)-[GEOPDPlaceSummaryDynamicContextServerOverride _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"mapsId";
      }
      else {
        id v6 = @"maps_id";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v29 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v35 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v14 = [GEOPDMapsIdentifier alloc];
                if (a3) {
                  uint64_t v15 = [(GEOPDMapsIdentifier *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOPDMapsIdentifier *)v14 initWithDictionary:v13];
                }
                uint64_t v16 = (void *)v15;
                [a1 addMapsId:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
          }
          while (v10);
        }

        id v5 = v29;
      }

      if (a3) {
        uint64_t v17 = @"serverDynamicContext";
      }
      else {
        uint64_t v17 = @"server_dynamic_context";
      }
      uint64_t v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v31 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v30 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v25 = [GEOPDPlaceSummaryLayoutUnitString alloc];
                if (a3) {
                  uint64_t v26 = [(GEOPDPlaceSummaryLayoutUnitString *)v25 initWithJSON:v24];
                }
                else {
                  uint64_t v26 = [(GEOPDPlaceSummaryLayoutUnitString *)v25 initWithDictionary:v24];
                }
                long long v27 = (void *)v26;
                [a1 addServerDynamicContext:v26];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v21);
        }

        id v5 = v29;
      }
    }
  }

  return a1;
}

- (GEOPDPlaceSummaryDynamicContextServerOverride)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryDynamicContextServerOverride *)-[GEOPDPlaceSummaryDynamicContextServerOverride _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_46;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_46;
    }
    GEOPDPlaceSummaryDynamicContextServerOverrideReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDPlaceSummaryDynamicContextServerOverrideCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryDynamicContextServerOverrideIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryDynamicContextServerOverrideReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPlaceSummaryDynamicContextServerOverrideIsDirty((uint64_t)self) & 1) == 0)
  {
    id v14 = self->_reader;
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
    [(GEOPDPlaceSummaryDynamicContextServerOverride *)self readAll:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = self->_mapsIds;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = self->_serverDynamicContexts;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  -[GEOPDPlaceSummaryDynamicContextServerOverride _readMapsIds]((uint64_t)self);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = self->_mapsIds;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v20 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        goto LABEL_18;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEOPDPlaceSummaryDynamicContextServerOverride _readServerDynamicContexts]((uint64_t)self);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_serverDynamicContexts;
  uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
LABEL_11:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v17 != v12) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3, (void)v16)) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_18:
    BOOL v14 = 1;
    goto LABEL_19;
  }
LABEL_17:
  BOOL v14 = 0;
LABEL_19:

  return v14;
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOPDPlaceSummaryDynamicContextServerOverride *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 8) = self->_readerMarkPos;
  *((_DWORD *)v12 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOPDPlaceSummaryDynamicContextServerOverride *)self mapsIdsCount])
  {
    [v12 clearMapsIds];
    unint64_t v4 = [(GEOPDPlaceSummaryDynamicContextServerOverride *)self mapsIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDPlaceSummaryDynamicContextServerOverride *)self mapsIdAtIndex:i];
        [v12 addMapsId:v7];
      }
    }
  }
  if ([(GEOPDPlaceSummaryDynamicContextServerOverride *)self serverDynamicContextsCount])
  {
    [v12 clearServerDynamicContexts];
    unint64_t v8 = [(GEOPDPlaceSummaryDynamicContextServerOverride *)self serverDynamicContextsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOPDPlaceSummaryDynamicContextServerOverride *)self serverDynamicContextAtIndex:j];
        [v12 addServerDynamicContext:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPlaceSummaryDynamicContextServerOverrideReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDPlaceSummaryDynamicContextServerOverride *)self readAll:0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v8 = self->_mapsIds;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v11) copyWithZone:a3];
        [v5 addMapsId:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = self->_serverDynamicContexts;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [v5 addServerDynamicContext:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOPDPlaceSummaryDynamicContextServerOverride *)self readAll:1],
         [v4 readAll:1],
         mapsIds = self->_mapsIds,
         !((unint64_t)mapsIds | v4[2]))
     || -[NSMutableArray isEqual:](mapsIds, "isEqual:")))
  {
    serverDynamicContexts = self->_serverDynamicContexts;
    if ((unint64_t)serverDynamicContexts | v4[3]) {
      char v7 = -[NSMutableArray isEqual:](serverDynamicContexts, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  [(GEOPDPlaceSummaryDynamicContextServerOverride *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_mapsIds hash];
  return [(NSMutableArray *)self->_serverDynamicContexts hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOPDPlaceSummaryDynamicContextServerOverride *)self addMapsId:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[3];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOPDPlaceSummaryDynamicContextServerOverride addServerDynamicContext:](self, "addServerDynamicContext:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverDynamicContexts, 0);
  objc_storeStrong((id *)&self->_mapsIds, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end