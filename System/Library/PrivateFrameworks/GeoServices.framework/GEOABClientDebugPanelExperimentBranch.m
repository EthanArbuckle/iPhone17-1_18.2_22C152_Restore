@interface GEOABClientDebugPanelExperimentBranch
+ (BOOL)isValid:(id)a3;
+ (Class)configKeyValueType;
- (BOOL)hasDebugExperimentBranch;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOABClientDebugPanelExperimentBranch)init;
- (GEOABClientDebugPanelExperimentBranch)initWithData:(id)a3;
- (GEOABClientDebugPanelExperimentBranch)initWithDictionary:(id)a3;
- (GEOABClientDebugPanelExperimentBranch)initWithJSON:(id)a3;
- (GEOABDebugPanelExperimentBranch)debugExperimentBranch;
- (NSMutableArray)configKeyValues;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)configKeyValueAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)configKeyValuesCount;
- (unint64_t)hash;
- (void)_addNoFlagsConfigKeyValue:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readConfigKeyValues;
- (void)_readDebugExperimentBranch;
- (void)addConfigKeyValue:(id)a3;
- (void)clearConfigKeyValues;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setConfigKeyValues:(id)a3;
- (void)setDebugExperimentBranch:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOABClientDebugPanelExperimentBranch

- (GEOABClientDebugPanelExperimentBranch)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOABClientDebugPanelExperimentBranch;
  v2 = [(GEOABClientDebugPanelExperimentBranch *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOABClientDebugPanelExperimentBranch)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOABClientDebugPanelExperimentBranch;
  v3 = [(GEOABClientDebugPanelExperimentBranch *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDebugExperimentBranch
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABClientDebugPanelExperimentBranchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDebugExperimentBranch_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasDebugExperimentBranch
{
  return self->_debugExperimentBranch != 0;
}

- (GEOABDebugPanelExperimentBranch)debugExperimentBranch
{
  -[GEOABClientDebugPanelExperimentBranch _readDebugExperimentBranch]((uint64_t)self);
  debugExperimentBranch = self->_debugExperimentBranch;

  return debugExperimentBranch;
}

- (void)setDebugExperimentBranch:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_debugExperimentBranch, a3);
}

- (void)_readConfigKeyValues
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABClientDebugPanelExperimentBranchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readConfigKeyValues_tags_393);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)configKeyValues
{
  -[GEOABClientDebugPanelExperimentBranch _readConfigKeyValues]((uint64_t)self);
  configKeyValues = self->_configKeyValues;

  return configKeyValues;
}

- (void)setConfigKeyValues:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  configKeyValues = self->_configKeyValues;
  self->_configKeyValues = v4;
}

- (void)clearConfigKeyValues
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  configKeyValues = self->_configKeyValues;

  [(NSMutableArray *)configKeyValues removeAllObjects];
}

- (void)addConfigKeyValue:(id)a3
{
  id v4 = a3;
  -[GEOABClientDebugPanelExperimentBranch _readConfigKeyValues]((uint64_t)self);
  -[GEOABClientDebugPanelExperimentBranch _addNoFlagsConfigKeyValue:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsConfigKeyValue:(uint64_t)a1
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

- (unint64_t)configKeyValuesCount
{
  -[GEOABClientDebugPanelExperimentBranch _readConfigKeyValues]((uint64_t)self);
  configKeyValues = self->_configKeyValues;

  return [(NSMutableArray *)configKeyValues count];
}

- (id)configKeyValueAtIndex:(unint64_t)a3
{
  -[GEOABClientDebugPanelExperimentBranch _readConfigKeyValues]((uint64_t)self);
  configKeyValues = self->_configKeyValues;

  return (id)[(NSMutableArray *)configKeyValues objectAtIndex:a3];
}

+ (Class)configKeyValueType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOABClientDebugPanelExperimentBranch;
  id v4 = [(GEOABClientDebugPanelExperimentBranch *)&v8 description];
  id v5 = [(GEOABClientDebugPanelExperimentBranch *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOABClientDebugPanelExperimentBranch _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 debugExperimentBranch];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"debugExperimentBranch";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"debug_experiment_branch";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v10 = *(id *)(a1 + 24);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v28 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            v16 = [v15 dictionaryRepresentation];
            }
            [v9 addObject:v16];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v12);
      }

      if (a2) {
        v17 = @"configKeyValue";
      }
      else {
        v17 = @"config_key_value";
      }
      [v4 setObject:v9 forKey:v17];
    }
    v18 = *(void **)(a1 + 16);
    if (v18)
    {
      v19 = [v18 dictionaryRepresentation];
      v20 = v19;
      if (a2)
      {
        v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __67__GEOABClientDebugPanelExperimentBranch__dictionaryRepresentation___block_invoke;
        v25[3] = &unk_1E53D8860;
        id v22 = v21;
        id v26 = v22;
        [v20 enumerateKeysAndObjectsUsingBlock:v25];
        id v23 = v22;

        v20 = v23;
      }
      [v4 setObject:v20 forKey:@"Unknown Fields"];
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
  return -[GEOABClientDebugPanelExperimentBranch _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __67__GEOABClientDebugPanelExperimentBranch__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOABClientDebugPanelExperimentBranch)initWithDictionary:(id)a3
{
  return (GEOABClientDebugPanelExperimentBranch *)-[GEOABClientDebugPanelExperimentBranch _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"debugExperimentBranch";
      }
      else {
        objc_super v6 = @"debug_experiment_branch";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOABDebugPanelExperimentBranch alloc];
        if (a3) {
          uint64_t v9 = [(GEOABDebugPanelExperimentBranch *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOABDebugPanelExperimentBranch *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setDebugExperimentBranch:v9];
      }
      if (a3) {
        uint64_t v11 = @"configKeyValue";
      }
      else {
        uint64_t v11 = @"config_key_value";
      }
      uint64_t v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = v5;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v19 = [GEOABConfigKeyValuePair alloc];
                if (a3) {
                  uint64_t v20 = [(GEOABConfigKeyValuePair *)v19 initWithJSON:v18];
                }
                else {
                  uint64_t v20 = [(GEOABConfigKeyValuePair *)v19 initWithDictionary:v18];
                }
                v21 = (void *)v20;
                [a1 addConfigKeyValue:v20];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v15);
        }

        id v5 = v23;
      }
    }
  }

  return a1;
}

- (GEOABClientDebugPanelExperimentBranch)initWithJSON:(id)a3
{
  return (GEOABClientDebugPanelExperimentBranch *)-[GEOABClientDebugPanelExperimentBranch _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_395;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_396;
    }
    GEOABClientDebugPanelExperimentBranchReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOABClientDebugPanelExperimentBranchCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOABClientDebugPanelExperimentBranchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOABClientDebugPanelExperimentBranchReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOABClientDebugPanelExperimentBranchIsDirty((uint64_t)self) & 1) == 0)
  {
    id v10 = self->_reader;
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
    [(GEOABClientDebugPanelExperimentBranch *)self readAll:0];
    if (self->_debugExperimentBranch) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_configKeyValues;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOABClientDebugPanelExperimentBranch *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 10) = self->_readerMarkPos;
  *((_DWORD *)v8 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_debugExperimentBranch) {
    objc_msgSend(v8, "setDebugExperimentBranch:");
  }
  if ([(GEOABClientDebugPanelExperimentBranch *)self configKeyValuesCount])
  {
    [v8 clearConfigKeyValues];
    unint64_t v4 = [(GEOABClientDebugPanelExperimentBranch *)self configKeyValuesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOABClientDebugPanelExperimentBranch *)self configKeyValueAtIndex:i];
        [v8 addConfigKeyValue:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOABClientDebugPanelExperimentBranchReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOABClientDebugPanelExperimentBranch *)self readAll:0];
  id v8 = [(GEOABDebugPanelExperimentBranch *)self->_debugExperimentBranch copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = self->_configKeyValues;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "copyWithZone:", a3, (void)v16);
        [(id)v5 addConfigKeyValue:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOABClientDebugPanelExperimentBranch *)self readAll:1],
         [v4 readAll:1],
         debugExperimentBranch = self->_debugExperimentBranch,
         !((unint64_t)debugExperimentBranch | v4[4]))
     || -[GEOABDebugPanelExperimentBranch isEqual:](debugExperimentBranch, "isEqual:")))
  {
    configKeyValues = self->_configKeyValues;
    if ((unint64_t)configKeyValues | v4[3]) {
      char v7 = -[NSMutableArray isEqual:](configKeyValues, "isEqual:");
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
  [(GEOABClientDebugPanelExperimentBranch *)self readAll:1];
  unint64_t v3 = [(GEOABDebugPanelExperimentBranch *)self->_debugExperimentBranch hash];
  return [(NSMutableArray *)self->_configKeyValues hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  debugExperimentBranch = self->_debugExperimentBranch;
  id v6 = v4[4];
  if (debugExperimentBranch)
  {
    if (v6) {
      -[GEOABDebugPanelExperimentBranch mergeFrom:](debugExperimentBranch, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOABClientDebugPanelExperimentBranch setDebugExperimentBranch:](self, "setDebugExperimentBranch:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v4[3];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEOABClientDebugPanelExperimentBranch addConfigKeyValue:](self, "addConfigKeyValue:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
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
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOABClientDebugPanelExperimentBranchReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_400);
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
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOABClientDebugPanelExperimentBranch *)self readAll:0];
    [(GEOABDebugPanelExperimentBranch *)self->_debugExperimentBranch clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = self->_configKeyValues;
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
  objc_storeStrong((id *)&self->_debugExperimentBranch, 0);
  objc_storeStrong((id *)&self->_configKeyValues, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end