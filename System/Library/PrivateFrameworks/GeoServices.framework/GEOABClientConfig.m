@interface GEOABClientConfig
+ (BOOL)isValid:(id)a3;
+ (Class)configKeyValueType;
+ (Class)debugExperimentBranchType;
- (BOOL)hasAssignedAbBranchId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOABClientConfig)init;
- (GEOABClientConfig)initWithData:(id)a3;
- (GEOABClientConfig)initWithDictionary:(id)a3;
- (GEOABClientConfig)initWithJSON:(id)a3;
- (NSMutableArray)configKeyValues;
- (NSMutableArray)debugExperimentBranchs;
- (NSString)assignedAbBranchId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)configKeyValueAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugExperimentBranchAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)configKeyValuesCount;
- (unint64_t)debugExperimentBranchsCount;
- (unint64_t)hash;
- (void)_addNoFlagsConfigKeyValue:(uint64_t)a1;
- (void)_addNoFlagsDebugExperimentBranch:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAssignedAbBranchId;
- (void)_readConfigKeyValues;
- (void)_readDebugExperimentBranchs;
- (void)addConfigKeyValue:(id)a3;
- (void)addDebugExperimentBranch:(id)a3;
- (void)clearConfigKeyValues;
- (void)clearDebugExperimentBranchs;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAssignedAbBranchId:(id)a3;
- (void)setConfigKeyValues:(id)a3;
- (void)setDebugExperimentBranchs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOABClientConfig

- (NSMutableArray)configKeyValues
{
  -[GEOABClientConfig _readConfigKeyValues]((uint64_t)self);
  configKeyValues = self->_configKeyValues;

  return configKeyValues;
}

- (void)_readConfigKeyValues
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABClientConfigReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readConfigKeyValues_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOABClientConfigIsDirty((uint64_t)self) & 1) == 0)
  {
    v14 = self->_reader;
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
    [(GEOABClientConfig *)self readAll:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v6 = self->_configKeyValues;
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

    if (self->_assignedAbBranchId) {
      PBDataWriterWriteStringField();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v10 = self->_debugExperimentBranchs;
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

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
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
      uint64_t v8 = (int *)&readAll__recursiveTag_356;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_357;
    }
    GEOABClientConfigReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOABClientConfigCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOABClientConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOABClientConfig;
  v2 = [(GEOABClientConfig *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOABClientConfig)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOABClientConfig;
  BOOL v3 = [(GEOABClientConfig *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setConfigKeyValues:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  configKeyValues = self->_configKeyValues;
  self->_configKeyValues = v4;
}

- (void)clearConfigKeyValues
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  configKeyValues = self->_configKeyValues;

  [(NSMutableArray *)configKeyValues removeAllObjects];
}

- (void)addConfigKeyValue:(id)a3
{
  id v4 = a3;
  -[GEOABClientConfig _readConfigKeyValues]((uint64_t)self);
  -[GEOABClientConfig _addNoFlagsConfigKeyValue:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsConfigKeyValue:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)configKeyValuesCount
{
  -[GEOABClientConfig _readConfigKeyValues]((uint64_t)self);
  configKeyValues = self->_configKeyValues;

  return [(NSMutableArray *)configKeyValues count];
}

- (id)configKeyValueAtIndex:(unint64_t)a3
{
  -[GEOABClientConfig _readConfigKeyValues]((uint64_t)self);
  configKeyValues = self->_configKeyValues;

  return (id)[(NSMutableArray *)configKeyValues objectAtIndex:a3];
}

+ (Class)configKeyValueType
{
  return (Class)objc_opt_class();
}

- (void)_readAssignedAbBranchId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABClientConfigReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAssignedAbBranchId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAssignedAbBranchId
{
  return self->_assignedAbBranchId != 0;
}

- (NSString)assignedAbBranchId
{
  -[GEOABClientConfig _readAssignedAbBranchId]((uint64_t)self);
  assignedAbBranchId = self->_assignedAbBranchId;

  return assignedAbBranchId;
}

- (void)setAssignedAbBranchId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_assignedAbBranchId, a3);
}

- (void)_readDebugExperimentBranchs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABClientConfigReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDebugExperimentBranchs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)debugExperimentBranchs
{
  -[GEOABClientConfig _readDebugExperimentBranchs]((uint64_t)self);
  debugExperimentBranchs = self->_debugExperimentBranchs;

  return debugExperimentBranchs;
}

- (void)setDebugExperimentBranchs:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  debugExperimentBranchs = self->_debugExperimentBranchs;
  self->_debugExperimentBranchs = v4;
}

- (void)clearDebugExperimentBranchs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  debugExperimentBranchs = self->_debugExperimentBranchs;

  [(NSMutableArray *)debugExperimentBranchs removeAllObjects];
}

- (void)addDebugExperimentBranch:(id)a3
{
  id v4 = a3;
  -[GEOABClientConfig _readDebugExperimentBranchs]((uint64_t)self);
  -[GEOABClientConfig _addNoFlagsDebugExperimentBranch:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsDebugExperimentBranch:(uint64_t)a1
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

- (unint64_t)debugExperimentBranchsCount
{
  -[GEOABClientConfig _readDebugExperimentBranchs]((uint64_t)self);
  debugExperimentBranchs = self->_debugExperimentBranchs;

  return [(NSMutableArray *)debugExperimentBranchs count];
}

- (id)debugExperimentBranchAtIndex:(unint64_t)a3
{
  -[GEOABClientConfig _readDebugExperimentBranchs]((uint64_t)self);
  debugExperimentBranchs = self->_debugExperimentBranchs;

  return (id)[(NSMutableArray *)debugExperimentBranchs objectAtIndex:a3];
}

+ (Class)debugExperimentBranchType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOABClientConfig;
  id v4 = [(GEOABClientConfig *)&v8 description];
  id v5 = [(GEOABClientConfig *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOABClientConfig _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 32) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v39 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            uint64_t v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v8);
      }

      if (a2) {
        uint64_t v13 = @"configKeyValue";
      }
      else {
        uint64_t v13 = @"config_key_value";
      }
      [v4 setObject:v5 forKey:v13];
    }
    v14 = [(id)a1 assignedAbBranchId];
    if (v14)
    {
      if (a2) {
        v15 = @"assignedAbBranchId";
      }
      else {
        v15 = @"assigned_ab_branch_id";
      }
      [v4 setObject:v14 forKey:v15];
    }

    if ([*(id *)(a1 + 40) count])
    {
      long long v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v17 = *(id *)(a1 + 40);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v35 != v20) {
              objc_enumerationMutation(v17);
            }
            long long v22 = *(void **)(*((void *)&v34 + 1) + 8 * j);
            if (a2) {
              [v22 jsonRepresentation];
            }
            else {
            long long v23 = [v22 dictionaryRepresentation];
            }
            [v16 addObject:v23];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v19);
      }

      if (a2) {
        v24 = @"debugExperimentBranch";
      }
      else {
        v24 = @"debug_experiment_branch";
      }
      [v4 setObject:v16 forKey:v24];
    }
    v25 = *(void **)(a1 + 16);
    if (v25)
    {
      uint64_t v26 = [v25 dictionaryRepresentation];
      v27 = v26;
      if (a2)
      {
        v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __47__GEOABClientConfig__dictionaryRepresentation___block_invoke;
        v32[3] = &unk_1E53D8860;
        id v29 = v28;
        id v33 = v29;
        [v27 enumerateKeysAndObjectsUsingBlock:v32];
        id v30 = v29;

        v27 = v30;
      }
      [v4 setObject:v27 forKey:@"Unknown Fields"];
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
  return -[GEOABClientConfig _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOABClientConfig__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
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

- (GEOABClientConfig)initWithDictionary:(id)a3
{
  return (GEOABClientConfig *)-[GEOABClientConfig _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"configKeyValue";
      }
      else {
        id v6 = @"config_key_value";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v32 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v38 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v37 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEOABConfigKeyValuePair alloc];
                if (a3) {
                  uint64_t v15 = [(GEOABConfigKeyValuePair *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOABConfigKeyValuePair *)v14 initWithDictionary:v13];
                }
                long long v16 = (void *)v15;
                [a1 addConfigKeyValue:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
          }
          while (v10);
        }

        id v5 = v32;
      }

      if (a3) {
        id v17 = @"assignedAbBranchId";
      }
      else {
        id v17 = @"assigned_ab_branch_id";
      }
      uint64_t v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v19 = (void *)[v18 copy];
        [a1 setAssignedAbBranchId:v19];
      }
      if (a3) {
        uint64_t v20 = @"debugExperimentBranch";
      }
      else {
        uint64_t v20 = @"debug_experiment_branch";
      }
      long long v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v22 = v21;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v34;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v34 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v28 = [GEOABClientDebugPanelExperimentBranch alloc];
                if (a3) {
                  uint64_t v29 = [(GEOABClientDebugPanelExperimentBranch *)v28 initWithJSON:v27];
                }
                else {
                  uint64_t v29 = [(GEOABClientDebugPanelExperimentBranch *)v28 initWithDictionary:v27];
                }
                id v30 = (void *)v29;
                [a1 addDebugExperimentBranch:v29];
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v24);
        }

        id v5 = v32;
      }
    }
  }

  return a1;
}

- (GEOABClientConfig)initWithJSON:(id)a3
{
  return (GEOABClientConfig *)-[GEOABClientConfig _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOABClientConfigIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOABClientConfigReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOABClientConfig *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 12) = self->_readerMarkPos;
  *((_DWORD *)v12 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOABClientConfig *)self configKeyValuesCount])
  {
    [v12 clearConfigKeyValues];
    unint64_t v4 = [(GEOABClientConfig *)self configKeyValuesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOABClientConfig *)self configKeyValueAtIndex:i];
        [v12 addConfigKeyValue:v7];
      }
    }
  }
  if (self->_assignedAbBranchId) {
    objc_msgSend(v12, "setAssignedAbBranchId:");
  }
  if ([(GEOABClientConfig *)self debugExperimentBranchsCount])
  {
    [v12 clearDebugExperimentBranchs];
    unint64_t v8 = [(GEOABClientConfig *)self debugExperimentBranchsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOABClientConfig *)self debugExperimentBranchAtIndex:j];
        [v12 addDebugExperimentBranch:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
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
      GEOABClientConfigReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOABClientConfig *)self readAll:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v8 = self->_configKeyValues;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v26;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v11) copyWithZone:a3];
        [(id)v5 addConfigKeyValue:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(NSString *)self->_assignedAbBranchId copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v15 = self->_debugExperimentBranchs;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [(id)v5 addDebugExperimentBranch:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOABClientConfig *)self readAll:1],
         [v4 readAll:1],
         configKeyValues = self->_configKeyValues,
         !((unint64_t)configKeyValues | v4[4]))
     || -[NSMutableArray isEqual:](configKeyValues, "isEqual:"))
    && ((assignedAbBranchId = self->_assignedAbBranchId, !((unint64_t)assignedAbBranchId | v4[3]))
     || -[NSString isEqual:](assignedAbBranchId, "isEqual:")))
  {
    debugExperimentBranchs = self->_debugExperimentBranchs;
    if ((unint64_t)debugExperimentBranchs | v4[5]) {
      char v8 = -[NSMutableArray isEqual:](debugExperimentBranchs, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  [(GEOABClientConfig *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_configKeyValues hash];
  NSUInteger v4 = [(NSString *)self->_assignedAbBranchId hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_debugExperimentBranchs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = (id *)a3;
  [v4 readAll:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4[4];
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
        [(GEOABClientConfig *)self addConfigKeyValue:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (v4[3]) {
    -[GEOABClientConfig setAssignedAbBranchId:](self, "setAssignedAbBranchId:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[5];
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
        -[GEOABClientConfig addDebugExperimentBranch:](self, "addDebugExperimentBranch:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
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
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOABClientConfigReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_361);
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOABClientConfig *)self readAll:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_configKeyValues;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = self->_debugExperimentBranchs;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugExperimentBranchs, 0);
  objc_storeStrong((id *)&self->_configKeyValues, 0);
  objc_storeStrong((id *)&self->_assignedAbBranchId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end