@interface GEOPDPlacecardLayoutData
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlacecardLayoutData)init;
- (GEOPDPlacecardLayoutData)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)layoutConfiguration;
- (id)moduleConfigurations;
- (unint64_t)hash;
- (void)_addNoFlagsModuleConfiguration:(uint64_t)a1;
- (void)_readLayoutConfiguration;
- (void)_readModuleConfigurations;
- (void)addModuleConfiguration:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setLayoutConfiguration:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlacecardLayoutData

- (GEOPDPlacecardLayoutData)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlacecardLayoutData;
  v2 = [(GEOPDPlacecardLayoutData *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_7677;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_7678;
      }
      GEOPDPlacecardLayoutDataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDPlacecardLayoutDataCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleConfigurations, 0);
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlacecardLayoutData readAll:]((uint64_t)self, 0);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_moduleConfigurations;
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

    if (self->_layoutConfiguration) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (GEOPDPlacecardLayoutData)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlacecardLayoutData;
  v3 = [(GEOPDPlacecardLayoutData *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readModuleConfigurations
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
        GEOPDPlacecardLayoutDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModuleConfigurations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)moduleConfigurations
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlacecardLayoutData _readModuleConfigurations]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addModuleConfiguration:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPlacecardLayoutData _readModuleConfigurations](a1);
    -[GEOPDPlacecardLayoutData _addNoFlagsModuleConfiguration:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 52) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 52) |= 8u;
  }
}

- (void)_addNoFlagsModuleConfiguration:(uint64_t)a1
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

- (void)_readLayoutConfiguration
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
        GEOPDPlacecardLayoutDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLayoutConfiguration_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)layoutConfiguration
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlacecardLayoutData _readLayoutConfiguration]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setLayoutConfiguration:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 52) |= 2u;
    *(unsigned char *)(a1 + 52) |= 8u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlacecardLayoutData;
  id v4 = [(GEOPDPlacecardLayoutData *)&v8 description];
  id v5 = [(GEOPDPlacecardLayoutData *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlacecardLayoutData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDPlacecardLayoutData readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 32) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v28 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            long long v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v8);
      }

      if (a2) {
        long long v13 = @"moduleConfiguration";
      }
      else {
        long long v13 = @"module_configuration";
      }
      [v4 setObject:v5 forKey:v13];
    }
    long long v14 = -[GEOPDPlacecardLayoutData layoutConfiguration]((id *)a1);
    long long v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        uint64_t v17 = @"layoutConfiguration";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        uint64_t v17 = @"layout_configuration";
      }
      [v4 setObject:v16 forKey:v17];
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
        v25[2] = __54__GEOPDPlacecardLayoutData__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDPlacecardLayoutData _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOPDPlacecardLayoutData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlacecardLayoutDataReadAllFrom((uint64_t)self, a3, 0);
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
      GEOPDPlacecardLayoutDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlacecardLayoutData readAll:]((uint64_t)self, 0);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_moduleConfigurations;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "copyWithZone:", a3, (void)v16);
        -[GEOPDPlacecardLayoutData addModuleConfiguration:](v5, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v13 = [(GEOPDPlacecardLayoutConfiguration *)self->_layoutConfiguration copyWithZone:a3];
  long long v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDPlacecardLayoutData readAll:]((uint64_t)self, 1),
         -[GEOPDPlacecardLayoutData readAll:]((uint64_t)v4, 1),
         moduleConfigurations = self->_moduleConfigurations,
         !((unint64_t)moduleConfigurations | v4[4]))
     || -[NSMutableArray isEqual:](moduleConfigurations, "isEqual:")))
  {
    layoutConfiguration = self->_layoutConfiguration;
    if ((unint64_t)layoutConfiguration | v4[3]) {
      char v7 = -[GEOPDPlacecardLayoutConfiguration isEqual:](layoutConfiguration, "isEqual:");
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
  -[GEOPDPlacecardLayoutData readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_moduleConfigurations hash];
  return [(GEOPDPlacecardLayoutConfiguration *)self->_layoutConfiguration hash] ^ v3;
}

@end