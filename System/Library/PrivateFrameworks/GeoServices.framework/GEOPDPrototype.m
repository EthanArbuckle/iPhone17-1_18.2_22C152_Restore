@interface GEOPDPrototype
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPrototype)init;
- (GEOPDPrototype)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)values;
- (unint64_t)hash;
- (void)_addNoFlagsValue:(uint64_t)a1;
- (void)_readValues;
- (void)addValue:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPrototype

- (GEOPDPrototype)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPrototype;
  v2 = [(GEOPDPrototype *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPrototype)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPrototype;
  v3 = [(GEOPDPrototype *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readValues
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 60) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPrototypeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readValues_tags_0);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (id)values
{
  -[GEOPDPrototype _readValues](a1);
  v2 = *(void **)(a1 + 32);

  return v2;
}

- (void)addValue:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPrototype _readValues](a1);
    -[GEOPDPrototype _addNoFlagsValue:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsValue:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPrototype;
  v4 = [(GEOPDPrototype *)&v8 description];
  id v5 = [(GEOPDPrototype *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPrototype _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDPrototype readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDPrototypeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readComponentType_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v7 = *(id *)(a1 + 24);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"componentType";
      }
      else {
        objc_super v8 = @"component_type";
      }
      [v4 setObject:v7 forKey:v8];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDPrototypeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVersion_tags_1);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v11 = *(id *)(a1 + 40);
    if (v11) {
      [v4 setObject:v11 forKey:@"version"];
    }

    if (*(void *)(a1 + 32))
    {
      if (a2)
      {
        v12 = (void *)MEMORY[0x1E4F1CA48];
        v13 = -[GEOPDPrototype values](a1);
        v14 = objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));

        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        v15 = -[GEOPDPrototype values](a1);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v31 != v17) {
                objc_enumerationMutation(v15);
              }
              v19 = [*(id *)(*((void *)&v30 + 1) + 8 * i) base64EncodedStringWithOptions:0];
              [v14 addObject:v19];
            }
            uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
          }
          while (v16);
        }

        [v4 setObject:v14 forKey:@"value"];
      }
      else
      {
        v20 = -[GEOPDPrototype values](a1);
        [v4 setObject:v20 forKey:@"value"];
      }
    }
    v21 = *(void **)(a1 + 16);
    if (v21)
    {
      v22 = [v21 dictionaryRepresentation];
      v23 = v22;
      if (a2)
      {
        v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __44__GEOPDPrototype__dictionaryRepresentation___block_invoke;
        v28[3] = &unk_1E53D8860;
        id v25 = v24;
        id v29 = v25;
        [v23 enumerateKeysAndObjectsUsingBlock:v28];
        id v26 = v25;
      }
      else
      {
        id v26 = v22;
      }
      [v4 setObject:v26 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPrototype _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_7844;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_7845;
      }
      GEOPDPrototypeReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __44__GEOPDPrototype__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDPrototypeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
  {
    id v10 = self->_reader;
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
    -[GEOPDPrototype readAll:]((uint64_t)self, 0);
    if (self->_componentType) {
      PBDataWriterWriteStringField();
    }
    if (self->_version) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_values;
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
          PBDataWriterWriteDataField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
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
      GEOPDPrototypeReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPrototype readAll:]((uint64_t)self, 0);
  uint64_t v8 = [(NSString *)self->_componentType copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_version copyWithZone:a3];
  id v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v12 = self->_values;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        -[GEOPDPrototype addValue:](v5, v16);
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDPrototype readAll:]((uint64_t)self, 1),
         -[GEOPDPrototype readAll:]((uint64_t)v4, 1),
         componentType = self->_componentType,
         !((unint64_t)componentType | v4[3]))
     || -[NSString isEqual:](componentType, "isEqual:"))
    && ((version = self->_version, !((unint64_t)version | v4[5]))
     || -[NSString isEqual:](version, "isEqual:")))
  {
    values = self->_values;
    if ((unint64_t)values | v4[4]) {
      char v8 = -[NSMutableArray isEqual:](values, "isEqual:");
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
  -[GEOPDPrototype readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_componentType hash];
  NSUInteger v4 = [(NSString *)self->_version hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_values hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_componentType, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end