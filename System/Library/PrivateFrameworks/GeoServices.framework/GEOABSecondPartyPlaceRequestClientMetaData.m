@interface GEOABSecondPartyPlaceRequestClientMetaData
+ (BOOL)isValid:(id)a3;
+ (Class)clientConfigType;
+ (Class)serverAbAssignmentType;
- (BOOL)hasClientDatasetMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOABSecondPartyPlaceRequestClientMetaData)init;
- (GEOABSecondPartyPlaceRequestClientMetaData)initWithData:(id)a3;
- (GEOABSecondPartyPlaceRequestClientMetaData)initWithDictionary:(id)a3;
- (GEOABSecondPartyPlaceRequestClientMetaData)initWithJSON:(id)a3;
- (GEOPDABClientDatasetMetadata)clientDatasetMetadata;
- (NSMutableArray)clientConfigs;
- (NSMutableArray)serverAbAssignments;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)clientConfigAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)serverAbAssignmentAtIndex:(unint64_t)a3;
- (unint64_t)clientConfigsCount;
- (unint64_t)hash;
- (unint64_t)serverAbAssignmentsCount;
- (void)_addNoFlagsClientConfig:(uint64_t)a1;
- (void)_addNoFlagsServerAbAssignment:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readClientConfigs;
- (void)_readClientDatasetMetadata;
- (void)_readServerAbAssignments;
- (void)addClientConfig:(id)a3;
- (void)addServerAbAssignment:(id)a3;
- (void)clearClientConfigs;
- (void)clearServerAbAssignments;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setClientConfigs:(id)a3;
- (void)setClientDatasetMetadata:(id)a3;
- (void)setServerAbAssignments:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOABSecondPartyPlaceRequestClientMetaData

- (GEOPDABClientDatasetMetadata)clientDatasetMetadata
{
  -[GEOABSecondPartyPlaceRequestClientMetaData _readClientDatasetMetadata]((uint64_t)self);
  clientDatasetMetadata = self->_clientDatasetMetadata;

  return clientDatasetMetadata;
}

- (void)_readClientDatasetMetadata
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
        GEOABSecondPartyPlaceRequestClientMetaDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientDatasetMetadata_tags);
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
  if (self->_reader && (_GEOABSecondPartyPlaceRequestClientMetaDataIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOABSecondPartyPlaceRequestClientMetaData *)self readAll:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v6 = self->_serverAbAssignments;
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
    v10 = self->_clientConfigs;
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

    if (self->_clientDatasetMetadata) {
      PBDataWriterWriteSubmessage();
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
      uint64_t v8 = (int *)&readAll__recursiveTag_675;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_676;
    }
    GEOABSecondPartyPlaceRequestClientMetaDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOABSecondPartyPlaceRequestClientMetaDataCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOABSecondPartyPlaceRequestClientMetaData)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOABSecondPartyPlaceRequestClientMetaData;
  v2 = [(GEOABSecondPartyPlaceRequestClientMetaData *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOABSecondPartyPlaceRequestClientMetaData)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOABSecondPartyPlaceRequestClientMetaData;
  BOOL v3 = [(GEOABSecondPartyPlaceRequestClientMetaData *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readServerAbAssignments
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
        GEOABSecondPartyPlaceRequestClientMetaDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServerAbAssignments_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)serverAbAssignments
{
  -[GEOABSecondPartyPlaceRequestClientMetaData _readServerAbAssignments]((uint64_t)self);
  serverAbAssignments = self->_serverAbAssignments;

  return serverAbAssignments;
}

- (void)setServerAbAssignments:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  serverAbAssignments = self->_serverAbAssignments;
  self->_serverAbAssignments = v4;
}

- (void)clearServerAbAssignments
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  serverAbAssignments = self->_serverAbAssignments;

  [(NSMutableArray *)serverAbAssignments removeAllObjects];
}

- (void)addServerAbAssignment:(id)a3
{
  id v4 = a3;
  -[GEOABSecondPartyPlaceRequestClientMetaData _readServerAbAssignments]((uint64_t)self);
  -[GEOABSecondPartyPlaceRequestClientMetaData _addNoFlagsServerAbAssignment:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsServerAbAssignment:(uint64_t)a1
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

- (unint64_t)serverAbAssignmentsCount
{
  -[GEOABSecondPartyPlaceRequestClientMetaData _readServerAbAssignments]((uint64_t)self);
  serverAbAssignments = self->_serverAbAssignments;

  return [(NSMutableArray *)serverAbAssignments count];
}

- (id)serverAbAssignmentAtIndex:(unint64_t)a3
{
  -[GEOABSecondPartyPlaceRequestClientMetaData _readServerAbAssignments]((uint64_t)self);
  serverAbAssignments = self->_serverAbAssignments;

  return (id)[(NSMutableArray *)serverAbAssignments objectAtIndex:a3];
}

+ (Class)serverAbAssignmentType
{
  return (Class)objc_opt_class();
}

- (void)_readClientConfigs
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
        GEOABSecondPartyPlaceRequestClientMetaDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientConfigs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)clientConfigs
{
  -[GEOABSecondPartyPlaceRequestClientMetaData _readClientConfigs]((uint64_t)self);
  clientConfigs = self->_clientConfigs;

  return clientConfigs;
}

- (void)setClientConfigs:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  clientConfigs = self->_clientConfigs;
  self->_clientConfigs = v4;
}

- (void)clearClientConfigs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  clientConfigs = self->_clientConfigs;

  [(NSMutableArray *)clientConfigs removeAllObjects];
}

- (void)addClientConfig:(id)a3
{
  id v4 = a3;
  -[GEOABSecondPartyPlaceRequestClientMetaData _readClientConfigs]((uint64_t)self);
  -[GEOABSecondPartyPlaceRequestClientMetaData _addNoFlagsClientConfig:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsClientConfig:(uint64_t)a1
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

- (unint64_t)clientConfigsCount
{
  -[GEOABSecondPartyPlaceRequestClientMetaData _readClientConfigs]((uint64_t)self);
  clientConfigs = self->_clientConfigs;

  return [(NSMutableArray *)clientConfigs count];
}

- (id)clientConfigAtIndex:(unint64_t)a3
{
  -[GEOABSecondPartyPlaceRequestClientMetaData _readClientConfigs]((uint64_t)self);
  clientConfigs = self->_clientConfigs;

  return (id)[(NSMutableArray *)clientConfigs objectAtIndex:a3];
}

+ (Class)clientConfigType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasClientDatasetMetadata
{
  return self->_clientDatasetMetadata != 0;
}

- (void)setClientDatasetMetadata:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_clientDatasetMetadata, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOABSecondPartyPlaceRequestClientMetaData;
  id v4 = [(GEOABSecondPartyPlaceRequestClientMetaData *)&v8 description];
  id v5 = [(GEOABSecondPartyPlaceRequestClientMetaData *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOABSecondPartyPlaceRequestClientMetaData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 40) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v6 = *(id *)(a1 + 40);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v41 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            uint64_t v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v8);
      }

      if (a2) {
        uint64_t v13 = @"serverAbAssignment";
      }
      else {
        uint64_t v13 = @"server_ab_assignment";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v15 = *(id *)(a1 + 24);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v37 != v18) {
              objc_enumerationMutation(v15);
            }
            long long v20 = *(void **)(*((void *)&v36 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            long long v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v17);
      }

      if (a2) {
        long long v22 = @"clientConfig";
      }
      else {
        long long v22 = @"client_config";
      }
      [v4 setObject:v14 forKey:v22];
    }
    long long v23 = [(id)a1 clientDatasetMetadata];
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 jsonRepresentation];
        uint64_t v26 = @"clientDatasetMetadata";
      }
      else
      {
        v25 = [v23 dictionaryRepresentation];
        uint64_t v26 = @"client_dataset_metadata";
      }
      [v4 setObject:v25 forKey:v26];
    }
    v27 = *(void **)(a1 + 16);
    if (v27)
    {
      v28 = [v27 dictionaryRepresentation];
      v29 = v28;
      if (a2)
      {
        v30 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __72__GEOABSecondPartyPlaceRequestClientMetaData__dictionaryRepresentation___block_invoke;
        v34[3] = &unk_1E53D8860;
        id v31 = v30;
        id v35 = v31;
        [v29 enumerateKeysAndObjectsUsingBlock:v34];
        id v32 = v31;

        v29 = v32;
      }
      [v4 setObject:v29 forKey:@"Unknown Fields"];
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
  return -[GEOABSecondPartyPlaceRequestClientMetaData _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __72__GEOABSecondPartyPlaceRequestClientMetaData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOABSecondPartyPlaceRequestClientMetaData)initWithDictionary:(id)a3
{
  return (GEOABSecondPartyPlaceRequestClientMetaData *)-[GEOABSecondPartyPlaceRequestClientMetaData _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"serverAbAssignment";
      }
      else {
        id v6 = @"server_ab_assignment";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v34 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v40 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v39 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEOABExperimentAssignment alloc];
                if (a3) {
                  uint64_t v15 = [(GEOABExperimentAssignment *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOABExperimentAssignment *)v14 initWithDictionary:v13];
                }
                uint64_t v16 = (void *)v15;
                [a1 addServerAbAssignment:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v39 objects:v44 count:16];
          }
          while (v10);
        }

        id v5 = v34;
      }

      if (a3) {
        uint64_t v17 = @"clientConfig";
      }
      else {
        uint64_t v17 = @"client_config";
      }
      uint64_t v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v36;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v36 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v35 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v25 = [GEOABClientConfig alloc];
                if (a3) {
                  uint64_t v26 = [(GEOABClientConfig *)v25 initWithJSON:v24];
                }
                else {
                  uint64_t v26 = [(GEOABClientConfig *)v25 initWithDictionary:v24];
                }
                v27 = (void *)v26;
                [a1 addClientConfig:v26];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }
          while (v21);
        }

        id v5 = v34;
      }

      if (a3) {
        v28 = @"clientDatasetMetadata";
      }
      else {
        v28 = @"client_dataset_metadata";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v30 = [GEOPDABClientDatasetMetadata alloc];
        if (a3) {
          uint64_t v31 = [(GEOPDABClientDatasetMetadata *)v30 initWithJSON:v29];
        }
        else {
          uint64_t v31 = [(GEOPDABClientDatasetMetadata *)v30 initWithDictionary:v29];
        }
        id v32 = (void *)v31;
        [a1 setClientDatasetMetadata:v31];
      }
    }
  }

  return a1;
}

- (GEOABSecondPartyPlaceRequestClientMetaData)initWithJSON:(id)a3
{
  return (GEOABSecondPartyPlaceRequestClientMetaData *)-[GEOABSecondPartyPlaceRequestClientMetaData _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOABSecondPartyPlaceRequestClientMetaDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOABSecondPartyPlaceRequestClientMetaDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOABSecondPartyPlaceRequestClientMetaData *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 12) = self->_readerMarkPos;
  *((_DWORD *)v12 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOABSecondPartyPlaceRequestClientMetaData *)self serverAbAssignmentsCount])
  {
    [v12 clearServerAbAssignments];
    unint64_t v4 = [(GEOABSecondPartyPlaceRequestClientMetaData *)self serverAbAssignmentsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOABSecondPartyPlaceRequestClientMetaData *)self serverAbAssignmentAtIndex:i];
        [v12 addServerAbAssignment:v7];
      }
    }
  }
  if ([(GEOABSecondPartyPlaceRequestClientMetaData *)self clientConfigsCount])
  {
    [v12 clearClientConfigs];
    unint64_t v8 = [(GEOABSecondPartyPlaceRequestClientMetaData *)self clientConfigsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOABSecondPartyPlaceRequestClientMetaData *)self clientConfigAtIndex:j];
        [v12 addClientConfig:v11];
      }
    }
  }
  if (self->_clientDatasetMetadata) {
    objc_msgSend(v12, "setClientDatasetMetadata:");
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
      GEOABSecondPartyPlaceRequestClientMetaDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOABSecondPartyPlaceRequestClientMetaData *)self readAll:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v8 = self->_serverAbAssignments;
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
        [(id)v5 addServerAbAssignment:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v13 = self->_clientConfigs;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v16), "copyWithZone:", a3, (void)v21);
        [(id)v5 addClientConfig:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  id v18 = [(GEOPDABClientDatasetMetadata *)self->_clientDatasetMetadata copyWithZone:a3];
  id v19 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v18;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOABSecondPartyPlaceRequestClientMetaData *)self readAll:1],
         [v4 readAll:1],
         serverAbAssignments = self->_serverAbAssignments,
         !((unint64_t)serverAbAssignments | v4[5]))
     || -[NSMutableArray isEqual:](serverAbAssignments, "isEqual:"))
    && ((clientConfigs = self->_clientConfigs, !((unint64_t)clientConfigs | v4[3]))
     || -[NSMutableArray isEqual:](clientConfigs, "isEqual:")))
  {
    clientDatasetMetadata = self->_clientDatasetMetadata;
    if ((unint64_t)clientDatasetMetadata | v4[4]) {
      char v8 = -[GEOPDABClientDatasetMetadata isEqual:](clientDatasetMetadata, "isEqual:");
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
  [(GEOABSecondPartyPlaceRequestClientMetaData *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_serverAbAssignments hash];
  uint64_t v4 = [(NSMutableArray *)self->_clientConfigs hash] ^ v3;
  return v4 ^ [(GEOPDABClientDatasetMetadata *)self->_clientDatasetMetadata hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOABSecondPartyPlaceRequestClientMetaData *)self addServerAbAssignment:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v4[3];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOABSecondPartyPlaceRequestClientMetaData addClientConfig:](self, "addClientConfig:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  clientDatasetMetadata = self->_clientDatasetMetadata;
  id v16 = v4[4];
  if (clientDatasetMetadata)
  {
    if (v16) {
      -[GEOPDABClientDatasetMetadata mergeFrom:](clientDatasetMetadata, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[GEOABSecondPartyPlaceRequestClientMetaData setClientDatasetMetadata:](self, "setClientDatasetMetadata:");
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
      GEOABSecondPartyPlaceRequestClientMetaDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, unknownFields_tags_680);
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
    [(GEOABSecondPartyPlaceRequestClientMetaData *)self readAll:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_serverAbAssignments;
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
    uint64_t v12 = self->_clientConfigs;
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

    [(GEOPDABClientDatasetMetadata *)self->_clientDatasetMetadata clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverAbAssignments, 0);
  objc_storeStrong((id *)&self->_clientDatasetMetadata, 0);
  objc_storeStrong((id *)&self->_clientConfigs, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end