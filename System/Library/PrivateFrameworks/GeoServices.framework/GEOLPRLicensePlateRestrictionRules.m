@interface GEOLPRLicensePlateRestrictionRules
+ (BOOL)isValid:(id)a3;
+ (Class)licensePlateRegionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRLicensePlateRestrictionRules)init;
- (GEOLPRLicensePlateRestrictionRules)initWithData:(id)a3;
- (GEOLPRLicensePlateRestrictionRules)initWithDictionary:(id)a3;
- (GEOLPRLicensePlateRestrictionRules)initWithJSON:(id)a3;
- (NSData)version;
- (NSMutableArray)licensePlateRegions;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)licensePlateRegionAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)licensePlateRegionsCount;
- (unsigned)createTime;
- (void)_addNoFlagsLicensePlateRegion:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLicensePlateRegions;
- (void)addLicensePlateRegion:(id)a3;
- (void)clearLicensePlateRegions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCreateTime:(unsigned int)a3;
- (void)setLicensePlateRegions:(id)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRLicensePlateRestrictionRules

- (GEOLPRLicensePlateRestrictionRules)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRLicensePlateRestrictionRules;
  v2 = [(GEOLPRLicensePlateRestrictionRules *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRLicensePlateRestrictionRules)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRLicensePlateRestrictionRules;
  v3 = [(GEOLPRLicensePlateRestrictionRules *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (NSData)version
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 2) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOLPRLicensePlateRestrictionRulesReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readVersion_tags);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  version = self->_version;

  return version;
}

- (void)setVersion:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_version, a3);
}

- (unsigned)createTime
{
  return self->_createTime;
}

- (void)setCreateTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_createTime = a3;
}

- (void)_readLicensePlateRegions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLicensePlateRestrictionRulesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLicensePlateRegions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)licensePlateRegions
{
  -[GEOLPRLicensePlateRestrictionRules _readLicensePlateRegions]((uint64_t)self);
  licensePlateRegions = self->_licensePlateRegions;

  return licensePlateRegions;
}

- (void)setLicensePlateRegions:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  licensePlateRegions = self->_licensePlateRegions;
  self->_licensePlateRegions = v4;
}

- (void)clearLicensePlateRegions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  licensePlateRegions = self->_licensePlateRegions;

  [(NSMutableArray *)licensePlateRegions removeAllObjects];
}

- (void)addLicensePlateRegion:(id)a3
{
  id v4 = a3;
  -[GEOLPRLicensePlateRestrictionRules _readLicensePlateRegions]((uint64_t)self);
  -[GEOLPRLicensePlateRestrictionRules _addNoFlagsLicensePlateRegion:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (void)_addNoFlagsLicensePlateRegion:(uint64_t)a1
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

- (unint64_t)licensePlateRegionsCount
{
  -[GEOLPRLicensePlateRestrictionRules _readLicensePlateRegions]((uint64_t)self);
  licensePlateRegions = self->_licensePlateRegions;

  return [(NSMutableArray *)licensePlateRegions count];
}

- (id)licensePlateRegionAtIndex:(unint64_t)a3
{
  -[GEOLPRLicensePlateRestrictionRules _readLicensePlateRegions]((uint64_t)self);
  licensePlateRegions = self->_licensePlateRegions;

  return (id)[(NSMutableArray *)licensePlateRegions objectAtIndex:a3];
}

+ (Class)licensePlateRegionType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRLicensePlateRestrictionRules;
  id v4 = [(GEOLPRLicensePlateRestrictionRules *)&v8 description];
  id v5 = [(GEOLPRLicensePlateRestrictionRules *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRLicensePlateRestrictionRules _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 version];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"version"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"version"];
      }
    }

    objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 44)];
    if (a2) {
      v9 = @"createTime";
    }
    else {
      v9 = @"create_time";
    }
    [v4 setObject:v8 forKey:v9];

    if ([*(id *)(a1 + 16) count])
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = *(id *)(a1 + 16);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            if (a2) {
              [v16 jsonRepresentation];
            }
            else {
            v17 = objc_msgSend(v16, "dictionaryRepresentation", (void)v20);
            }
            objc_msgSend(v10, "addObject:", v17, (void)v20);
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v13);
      }

      if (a2) {
        v18 = @"licensePlateRegion";
      }
      else {
        v18 = @"license_plate_region";
      }
      objc_msgSend(v4, "setObject:forKey:", v10, v18, (void)v20);
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
  return -[GEOLPRLicensePlateRestrictionRules _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRLicensePlateRestrictionRules)initWithDictionary:(id)a3
{
  return (GEOLPRLicensePlateRestrictionRules *)-[GEOLPRLicensePlateRestrictionRules _initWithDictionary:isJSON:](self, a3, 0);
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
      objc_super v6 = [v5 objectForKeyedSubscript:@"version"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
        [a1 setVersion:v7];
      }
      if (a3) {
        objc_super v8 = @"createTime";
      }
      else {
        objc_super v8 = @"create_time";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCreateTime:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        v10 = @"licensePlateRegion";
      }
      else {
        v10 = @"license_plate_region";
      }
      id v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v22 = v11;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v24 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v18 = [GEOLPRLicensePlateRegion alloc];
                if (a3) {
                  uint64_t v19 = [(GEOLPRLicensePlateRegion *)v18 initWithJSON:v17];
                }
                else {
                  uint64_t v19 = [(GEOLPRLicensePlateRegion *)v18 initWithDictionary:v17];
                }
                long long v20 = (void *)v19;
                [a1 addLicensePlateRegion:v19];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v14);
        }

        id v11 = v22;
      }
    }
  }

  return a1;
}

- (GEOLPRLicensePlateRestrictionRules)initWithJSON:(id)a3
{
  return (GEOLPRLicensePlateRestrictionRules *)-[GEOLPRLicensePlateRestrictionRules _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_545;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_546;
    }
    GEOLPRLicensePlateRestrictionRulesReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLPRLicensePlateRestrictionRulesCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRLicensePlateRestrictionRulesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRLicensePlateRestrictionRulesReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLPRLicensePlateRestrictionRulesIsDirty((uint64_t)self) & 1) == 0)
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLPRLicensePlateRestrictionRules *)self readAll:0];
    PBDataWriterWriteDataField();
    PBDataWriterWriteUint32Field();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_licensePlateRegions;
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
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOLPRLicensePlateRestrictionRules *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  [v8 setVersion:self->_version];
  *((_DWORD *)v8 + 11) = self->_createTime;
  if ([(GEOLPRLicensePlateRestrictionRules *)self licensePlateRegionsCount])
  {
    [v8 clearLicensePlateRegions];
    unint64_t v4 = [(GEOLPRLicensePlateRestrictionRules *)self licensePlateRegionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLPRLicensePlateRestrictionRules *)self licensePlateRegionAtIndex:i];
        [v8 addLicensePlateRegion:v7];
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
    if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLPRLicensePlateRestrictionRulesReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRLicensePlateRestrictionRules *)self readAll:0];
  uint64_t v8 = [(NSData *)self->_version copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  *(_DWORD *)(v5 + 44) = self->_createTime;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v10 = self->_licensePlateRegions;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [(id)v5 addLicensePlateRegion:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLPRLicensePlateRestrictionRules *)self readAll:1],
         [v4 readAll:1],
         version = self->_version,
         !((unint64_t)version | v4[3]))
     || -[NSData isEqual:](version, "isEqual:"))
    && self->_createTime == *((_DWORD *)v4 + 11))
  {
    licensePlateRegions = self->_licensePlateRegions;
    if ((unint64_t)licensePlateRegions | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](licensePlateRegions, "isEqual:");
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
  [(GEOLPRLicensePlateRestrictionRules *)self readAll:1];
  uint64_t v3 = [(NSData *)self->_version hash];
  uint64_t v4 = 2654435761 * self->_createTime;
  return v4 ^ v3 ^ [(NSMutableArray *)self->_licensePlateRegions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 3)) {
    -[GEOLPRLicensePlateRestrictionRules setVersion:](self, "setVersion:");
  }
  self->_createTime = *((_DWORD *)v4 + 11);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 2);
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
        -[GEOLPRLicensePlateRestrictionRules addLicensePlateRegion:](self, "addLicensePlateRegion:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_licensePlateRegions, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end