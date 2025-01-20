@interface GEOWiFiQualityServiceRequest
+ (BOOL)isValid:(id)a3;
+ (Class)locationSearchesType;
+ (Class)networkSearchesType;
- (BOOL)hasClientMetadata;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOPDClientMetadata)clientMetadata;
- (GEOWiFiQualityServiceRequest)init;
- (GEOWiFiQualityServiceRequest)initWithData:(id)a3;
- (GEOWiFiQualityServiceRequest)initWithDictionary:(id)a3;
- (GEOWiFiQualityServiceRequest)initWithJSON:(id)a3;
- (NSMutableArray)locationSearches;
- (NSMutableArray)networkSearches;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)locationSearchesAtIndex:(unint64_t)a3;
- (id)networkSearchesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)locationSearchesCount;
- (unint64_t)networkSearchesCount;
- (unsigned)requestTypeCode;
- (void)_addNoFlagsLocationSearches:(uint64_t)a1;
- (void)_addNoFlagsNetworkSearches:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readClientMetadata;
- (void)_readLocationSearches;
- (void)_readNetworkSearches;
- (void)addLocationSearches:(id)a3;
- (void)addNetworkSearches:(id)a3;
- (void)clearLocationSearches;
- (void)clearNetworkSearches;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setClientMetadata:(id)a3;
- (void)setLocationSearches:(id)a3;
- (void)setNetworkSearches:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWiFiQualityServiceRequest

- (GEOWiFiQualityServiceRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiQualityServiceRequest;
  v2 = [(GEOWiFiQualityServiceRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiQualityServiceRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiQualityServiceRequest;
  v3 = [(GEOWiFiQualityServiceRequest *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readClientMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiQualityServiceRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientMetadata_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasClientMetadata
{
  return self->_clientMetadata != 0;
}

- (GEOPDClientMetadata)clientMetadata
{
  -[GEOWiFiQualityServiceRequest _readClientMetadata]((uint64_t)self);
  clientMetadata = self->_clientMetadata;

  return clientMetadata;
}

- (void)setClientMetadata:(id)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_clientMetadata, a3);
}

- (void)_readLocationSearches
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
        GEOWiFiQualityServiceRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationSearches_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)locationSearches
{
  -[GEOWiFiQualityServiceRequest _readLocationSearches]((uint64_t)self);
  locationSearches = self->_locationSearches;

  return locationSearches;
}

- (void)setLocationSearches:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  locationSearches = self->_locationSearches;
  self->_locationSearches = v4;
}

- (void)clearLocationSearches
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  locationSearches = self->_locationSearches;

  [(NSMutableArray *)locationSearches removeAllObjects];
}

- (void)addLocationSearches:(id)a3
{
  id v4 = a3;
  -[GEOWiFiQualityServiceRequest _readLocationSearches]((uint64_t)self);
  -[GEOWiFiQualityServiceRequest _addNoFlagsLocationSearches:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsLocationSearches:(uint64_t)a1
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

- (unint64_t)locationSearchesCount
{
  -[GEOWiFiQualityServiceRequest _readLocationSearches]((uint64_t)self);
  locationSearches = self->_locationSearches;

  return [(NSMutableArray *)locationSearches count];
}

- (id)locationSearchesAtIndex:(unint64_t)a3
{
  -[GEOWiFiQualityServiceRequest _readLocationSearches]((uint64_t)self);
  locationSearches = self->_locationSearches;

  return (id)[(NSMutableArray *)locationSearches objectAtIndex:a3];
}

+ (Class)locationSearchesType
{
  return (Class)objc_opt_class();
}

- (void)_readNetworkSearches
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
        GEOWiFiQualityServiceRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNetworkSearches_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)networkSearches
{
  -[GEOWiFiQualityServiceRequest _readNetworkSearches]((uint64_t)self);
  networkSearches = self->_networkSearches;

  return networkSearches;
}

- (void)setNetworkSearches:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  networkSearches = self->_networkSearches;
  self->_networkSearches = v4;
}

- (void)clearNetworkSearches
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  networkSearches = self->_networkSearches;

  [(NSMutableArray *)networkSearches removeAllObjects];
}

- (void)addNetworkSearches:(id)a3
{
  id v4 = a3;
  -[GEOWiFiQualityServiceRequest _readNetworkSearches]((uint64_t)self);
  -[GEOWiFiQualityServiceRequest _addNoFlagsNetworkSearches:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsNetworkSearches:(uint64_t)a1
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

- (unint64_t)networkSearchesCount
{
  -[GEOWiFiQualityServiceRequest _readNetworkSearches]((uint64_t)self);
  networkSearches = self->_networkSearches;

  return [(NSMutableArray *)networkSearches count];
}

- (id)networkSearchesAtIndex:(unint64_t)a3
{
  -[GEOWiFiQualityServiceRequest _readNetworkSearches]((uint64_t)self);
  networkSearches = self->_networkSearches;

  return (id)[(NSMutableArray *)networkSearches objectAtIndex:a3];
}

+ (Class)networkSearchesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiQualityServiceRequest;
  id v4 = [(GEOWiFiQualityServiceRequest *)&v8 description];
  id v5 = [(GEOWiFiQualityServiceRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiQualityServiceRequest _dictionaryRepresentation:]((id *)&self->super.super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 clientMetadata];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"clientMetadata";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"client_metadata";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if ([a1[3] count])
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v10 = a1[3];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v31 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            v16 = [v15 dictionaryRepresentation];
            }
            [v9 addObject:v16];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v12);
      }

      [v4 setObject:v9 forKey:@"locationSearches"];
    }
    if ([a1[4] count])
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v18 = a1[4];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v27;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v27 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v26 + 1) + 8 * j);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            v24 = objc_msgSend(v23, "dictionaryRepresentation", (void)v26);
            }
            objc_msgSend(v17, "addObject:", v24, (void)v26);
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
        }
        while (v20);
      }

      [v4 setObject:v17 forKey:@"networkSearches"];
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
  return -[GEOWiFiQualityServiceRequest _dictionaryRepresentation:]((id *)&self->super.super.super.isa, 1);
}

- (GEOWiFiQualityServiceRequest)initWithDictionary:(id)a3
{
  return (GEOWiFiQualityServiceRequest *)-[GEOWiFiQualityServiceRequest _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"clientMetadata";
      }
      else {
        objc_super v6 = @"client_metadata";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOPDClientMetadata alloc];
        if (a3) {
          uint64_t v9 = [(GEOPDClientMetadata *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOPDClientMetadata *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setClientMetadata:v9];
      }
      uint64_t v11 = [v5 objectForKeyedSubscript:@"locationSearches"];
      objc_opt_class();
      id v32 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v38 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v18 = [GEOWiFiQualityLocationSearch alloc];
                if (a3) {
                  uint64_t v19 = [(GEOWiFiQualityLocationSearch *)v18 initWithJSON:v17];
                }
                else {
                  uint64_t v19 = [(GEOWiFiQualityLocationSearch *)v18 initWithDictionary:v17];
                }
                uint64_t v20 = (void *)v19;
                [a1 addLocationSearches:v19];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
          }
          while (v14);
        }

        id v5 = v32;
      }

      uint64_t v21 = [v5 objectForKeyedSubscript:@"networkSearches"];
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
                long long v28 = [GEOWiFiQualityNetworkSearch alloc];
                if (a3) {
                  uint64_t v29 = [(GEOWiFiQualityNetworkSearch *)v28 initWithJSON:v27];
                }
                else {
                  uint64_t v29 = [(GEOWiFiQualityNetworkSearch *)v28 initWithDictionary:v27];
                }
                long long v30 = (void *)v29;
                [a1 addNetworkSearches:v29];
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

- (GEOWiFiQualityServiceRequest)initWithJSON:(id)a3
{
  return (GEOWiFiQualityServiceRequest *)-[GEOWiFiQualityServiceRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_537;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_538;
    }
    GEOWiFiQualityServiceRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOWiFiQualityServiceRequestCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiQualityServiceRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiQualityServiceRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOWiFiQualityServiceRequestIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOWiFiQualityServiceRequest *)self readAll:0];
    if (self->_clientMetadata) {
      PBDataWriterWriteSubmessage();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_locationSearches;
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
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = self->_networkSearches;
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
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  -[GEOWiFiQualityServiceRequest _readClientMetadata]((uint64_t)self);
  if (![(GEOPDClientMetadata *)self->_clientMetadata hasGreenTeaWithValue:v3])
  {
    -[GEOWiFiQualityServiceRequest _readLocationSearches]((uint64_t)self);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_locationSearches;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v20 + 1) + 8 * v10) hasGreenTeaWithValue:v3]) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v8) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:

      -[GEOWiFiQualityServiceRequest _readNetworkSearches]((uint64_t)self);
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      objc_super v6 = self->_networkSearches;
      uint64_t v11 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (!v11)
      {
LABEL_19:
        BOOL v5 = 0;
LABEL_21:

        return v5;
      }
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
LABEL_13:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14), "hasGreenTeaWithValue:", v3, (void)v16)) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v12) {
            goto LABEL_13;
          }
          goto LABEL_19;
        }
      }
    }
    BOOL v5 = 1;
    goto LABEL_21;
  }
  return 1;
}

- (unsigned)requestTypeCode
{
  return 1025;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOWiFiQualityServiceRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 10) = self->_readerMarkPos;
  *((_DWORD *)v12 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_clientMetadata) {
    objc_msgSend(v12, "setClientMetadata:");
  }
  if ([(GEOWiFiQualityServiceRequest *)self locationSearchesCount])
  {
    [v12 clearLocationSearches];
    unint64_t v4 = [(GEOWiFiQualityServiceRequest *)self locationSearchesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOWiFiQualityServiceRequest *)self locationSearchesAtIndex:i];
        [v12 addLocationSearches:v7];
      }
    }
  }
  if ([(GEOWiFiQualityServiceRequest *)self networkSearchesCount])
  {
    [v12 clearNetworkSearches];
    unint64_t v8 = [(GEOWiFiQualityServiceRequest *)self networkSearchesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOWiFiQualityServiceRequest *)self networkSearchesAtIndex:j];
        [v12 addNetworkSearches:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOWiFiQualityServiceRequestReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWiFiQualityServiceRequest *)self readAll:0];
  id v8 = [(GEOPDClientMetadata *)self->_clientMetadata copyWithZone:a3];
  unint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = self->_locationSearches;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [v5 addLocationSearches:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v11);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v15 = self->_networkSearches;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v15);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (void)v21);
        [v5 addNetworkSearches:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOWiFiQualityServiceRequest *)self readAll:1],
         [v4 readAll:1],
         clientMetadata = self->_clientMetadata,
         !((unint64_t)clientMetadata | v4[2]))
     || -[GEOPDClientMetadata isEqual:](clientMetadata, "isEqual:"))
    && ((locationSearches = self->_locationSearches, !((unint64_t)locationSearches | v4[3]))
     || -[NSMutableArray isEqual:](locationSearches, "isEqual:")))
  {
    networkSearches = self->_networkSearches;
    if ((unint64_t)networkSearches | v4[4]) {
      char v8 = -[NSMutableArray isEqual:](networkSearches, "isEqual:");
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
  [(GEOWiFiQualityServiceRequest *)self readAll:1];
  unint64_t v3 = [(GEOPDClientMetadata *)self->_clientMetadata hash];
  uint64_t v4 = [(NSMutableArray *)self->_locationSearches hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_networkSearches hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  clientMetadata = self->_clientMetadata;
  id v6 = v4[2];
  if (clientMetadata)
  {
    if (v6) {
      -[GEOPDClientMetadata mergeFrom:](clientMetadata, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOWiFiQualityServiceRequest setClientMetadata:](self, "setClientMetadata:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v4[3];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(GEOWiFiQualityServiceRequest *)self addLocationSearches:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v4[4];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[GEOWiFiQualityServiceRequest addNetworkSearches:](self, "addNetworkSearches:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkSearches, 0);
  objc_storeStrong((id *)&self->_locationSearches, 0);
  objc_storeStrong((id *)&self->_clientMetadata, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end