@interface GEOPDSSearchEvChargingParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSSearchEvChargingParameters)init;
- (GEOPDSSearchEvChargingParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)preferredBrandAtIndex:(uint64_t)result;
- (uint64_t)setPreferredBrands:(uint64_t)a3 count:;
- (unint64_t)hash;
- (void)_addNoFlagsNetwork:(uint64_t)a1;
- (void)_addNoFlagsPort:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readNetworks;
- (void)_readPorts;
- (void)_readPreferredBrands;
- (void)addNetwork:(uint64_t)a1;
- (void)addPort:(uint64_t)a1;
- (void)addPreferredBrand:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)dealloc;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setPorts:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSSearchEvChargingParameters

- (GEOPDSSearchEvChargingParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSSearchEvChargingParameters;
  v2 = [(GEOPDSSearchEvChargingParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSSearchEvChargingParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSSearchEvChargingParameters;
  v3 = [(GEOPDSSearchEvChargingParameters *)&v7 initWithData:a3];
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
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSSearchEvChargingParameters;
  [(GEOPDSSearchEvChargingParameters *)&v3 dealloc];
}

- (void)_readPorts
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
        GEOPDSSearchEvChargingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPorts_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)setPorts:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(unsigned char *)(a1 + 76) |= 0x10u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)addPort:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSSearchEvChargingParameters _readPorts](a1);
    -[GEOPDSSearchEvChargingParameters _addNoFlagsPort:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(unsigned char *)(a1 + 76) |= 0x10u;
  }
}

- (void)_addNoFlagsPort:(uint64_t)a1
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

- (void)_readNetworks
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
        GEOPDSSearchEvChargingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNetworks_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)addNetwork:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSSearchEvChargingParameters _readNetworks](a1);
    -[GEOPDSSearchEvChargingParameters _addNoFlagsNetwork:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(unsigned char *)(a1 + 76) |= 0x10u;
  }
}

- (void)_addNoFlagsNetwork:(uint64_t)a1
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

- (void)_readPreferredBrands
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
        GEOPDSSearchEvChargingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPreferredBrands_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)addPreferredBrand:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSSearchEvChargingParameters _readPreferredBrands](a1);
    PBRepeatedUInt64Add();
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(unsigned char *)(a1 + 76) |= 0x10u;
  }
}

- (uint64_t)preferredBrandAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDSSearchEvChargingParameters _readPreferredBrands](result);
    unint64_t v4 = *(void *)(v3 + 32);
    if (v4 <= a2)
    {
      id v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(void *)(*(void *)(v3 + 24) + 8 * a2);
  }
  return result;
}

- (uint64_t)setPreferredBrands:(uint64_t)a3 count:
{
  if (result)
  {
    uint64_t v5 = result;
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(v5 + 76) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 72));
    *(unsigned char *)(v5 + 76) |= 0x10u;
    return MEMORY[0x1F4147438](v5 + 24, a2, a3);
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSSearchEvChargingParameters;
  unint64_t v4 = [(GEOPDSSearchEvChargingParameters *)&v8 description];
  uint64_t v5 = [(GEOPDSSearchEvChargingParameters *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSSearchEvChargingParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSSearchEvChargingParameters readAll:](a1, 1);
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 56) count])
    {
      uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v6 = *(id *)(a1 + 56);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v26 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"port"];
    }
    if (*(void *)(a1 + 48))
    {
      -[GEOPDSSearchEvChargingParameters _readNetworks](a1);
      id v13 = *(id *)(a1 + 48);
      [v4 setObject:v13 forKey:@"network"];
    }
    if (*(void *)(a1 + 32))
    {
      v14 = PBRepeatedUInt64NSArray();
      if (a2) {
        v15 = @"preferredBrand";
      }
      else {
        v15 = @"preferred_brand";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = *(void **)(a1 + 16);
    if (v16)
    {
      v17 = [v16 dictionaryRepresentation];
      v18 = v17;
      if (a2)
      {
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __62__GEOPDSSearchEvChargingParameters__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSSearchEvChargingParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_493;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_494;
      }
      GEOPDSSearchEvChargingParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSSearchEvChargingParametersCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __62__GEOPDSSearchEvChargingParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"port"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v42 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v41 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v13 = [GEOPDEvChargingPort alloc];
                if (a3) {
                  v14 = [(GEOPDEvChargingPort *)v13 initWithJSON:v12];
                }
                else {
                  v14 = [(GEOPDEvChargingPort *)v13 initWithDictionary:v12];
                }
                v15 = v14;
                -[GEOPDSSearchEvChargingParameters addPort:]((uint64_t)a1, v14);
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
          }
          while (v9);
        }
      }
      v16 = [v5 objectForKeyedSubscript:@"network"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v38;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v38 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = *(void **)(*((void *)&v37 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v23 = (void *)[v22 copy];
                -[GEOPDSSearchEvChargingParameters addNetwork:]((uint64_t)a1, v23);
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v46 count:16];
          }
          while (v19);
        }
      }
      if (a3) {
        id v24 = @"preferredBrand";
      }
      else {
        id v24 = @"preferred_brand";
      }
      long long v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v26 = v25;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v45 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v34;
          do
          {
            for (uint64_t k = 0; k != v28; ++k)
            {
              if (*(void *)v34 != v29) {
                objc_enumerationMutation(v26);
              }
              v31 = *(void **)(*((void *)&v33 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v31 unsignedLongLongValue];
                -[GEOPDSSearchEvChargingParameters addPreferredBrand:]((uint64_t)a1);
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v45 count:16];
          }
          while (v28);
        }
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSSearchEvChargingParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSSearchEvChargingParameters readAll:]((uint64_t)self, 0);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = self->_ports;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v10 = self->_networks;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteStringField();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v11);
    }

    if (self->_preferredBrands.count)
    {
      unint64_t v14 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v14;
      }
      while (v14 < self->_preferredBrands.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOPDSSearchEvChargingParametersReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSSearchEvChargingParameters readAll:]((uint64_t)self, 0);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = self->_ports;
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
        -[GEOPDSSearchEvChargingParameters addPort:]((uint64_t)v5, v12);

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
  uint64_t v13 = self->_networks;
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
        -[GEOPDSSearchEvChargingParameters addNetwork:]((uint64_t)v5, v17);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  PBRepeatedUInt64Copy();
  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDSSearchEvChargingParameters readAll:]((uint64_t)self, 1),
         -[GEOPDSSearchEvChargingParameters readAll:]((uint64_t)v4, 1),
         ports = self->_ports,
         !((unint64_t)ports | v4[7]))
     || -[NSMutableArray isEqual:](ports, "isEqual:"))
    && ((networks = self->_networks, !((unint64_t)networks | v4[6]))
     || -[NSMutableArray isEqual:](networks, "isEqual:")))
  {
    char IsEqual = PBRepeatedUInt64IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOPDSSearchEvChargingParameters readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_ports hash];
  uint64_t v4 = [(NSMutableArray *)self->_networks hash] ^ v3;
  return v4 ^ PBRepeatedUInt64Hash();
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (uint64_t)v3;
  if (!a1) {
    goto LABEL_22;
  }
  -[GEOPDSSearchEvChargingParameters readAll:]((uint64_t)v3, 0);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *(id *)(v4 + 56);
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
        -[GEOPDSSearchEvChargingParameters addPort:](a1, *(void **)(*((void *)&v21 + 1) + 8 * i));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = *(id *)(v4 + 48);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (!v11)
  {

LABEL_19:
    -[GEOPDSSearchEvChargingParameters _readPreferredBrands](v4);
    uint64_t v15 = *(void *)(v4 + 32);
    if (v15)
    {
      for (unint64_t j = 0; j != v15; ++j)
      {
        -[GEOPDSSearchEvChargingParameters preferredBrandAtIndex:](v4, j);
        -[GEOPDSSearchEvChargingParameters addPreferredBrand:](a1);
      }
    }
    goto LABEL_22;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v18;
  do
  {
    for (uint64_t k = 0; k != v12; ++k)
    {
      if (*(void *)v18 != v13) {
        objc_enumerationMutation(v10);
      }
      -[GEOPDSSearchEvChargingParameters addNetwork:](a1, *(void **)(*((void *)&v17 + 1) + 8 * k));
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  }
  while (v12);

  if (v4) {
    goto LABEL_19;
  }
LABEL_22:
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 1u;
    *(unsigned char *)(a1 + 76) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSSearchEvChargingParameters readAll:](a1, 0);
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = *(id *)(a1 + 56);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "clearUnknownFields:", 1, (void)v10);
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ports, 0);
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end