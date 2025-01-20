@interface GEONamedField
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEONamedField)init;
- (GEONamedField)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(unsigned int)a3 isJSON:;
- (unint64_t)hash;
- (void)_addNoFlagsValues:(uint64_t)a1;
- (void)addValues:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEONamedField

- (GEONamedField)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEONamedField;
  v2 = [(GEONamedField *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEONamedField)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEONamedField;
  v3 = [(GEONamedField *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addValues:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEONamedFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readValues_tags_1);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    -[GEONamedField _addNoFlagsValues:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 52) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 52) |= 8u;
  }
}

- (void)_addNoFlagsValues:(uint64_t)a1
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
  v8.super_class = (Class)GEONamedField;
  v4 = [(GEONamedField *)&v8 description];
  id v5 = [(GEONamedField *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONamedField _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEONamedField readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEONamedFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_1654);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v7 = *(id *)(a1 + 24);
    if (v7) {
      [v4 setObject:v7 forKey:@"name"];
    }

    if ([*(id *)(a1 + 32) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v9 = *(id *)(a1 + 32);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v25 != v11) {
              objc_enumerationMutation(v9);
            }
            v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = [v13 dictionaryRepresentation];
            }
            [v8 addObject:v14];
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v10);
      }

      [v4 setObject:v8 forKey:@"values"];
    }
    v15 = *(void **)(a1 + 16);
    if (v15)
    {
      v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __43__GEONamedField__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;
      }
      else
      {
        id v20 = v16;
      }
      [v4 setObject:v20 forKey:@"Unknown Fields"];
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
  return -[GEONamedField _dictionaryRepresentation:]((uint64_t)self, 1);
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
        id v6 = &readAll__recursiveTag_1659;
      }
      else {
        id v6 = &readAll__nonRecursiveTag_1660;
      }
      GEONamedFieldReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEONamedFieldCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __43__GEONamedField__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(unsigned int)a3 isJSON:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v45 = [a1 init];
  if (v45)
  {
    id v5 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = (void *)[v5 copy];
      id v7 = v6;
      *(unsigned char *)(v45 + 52) |= 2u;
      *(unsigned char *)(v45 + 52) |= 8u;
      objc_storeStrong((id *)(v45 + 24), v6);
    }
    objc_super v8 = [v4 objectForKeyedSubscript:@"values"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v38 = v4;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id obj = v8;
      uint64_t v9 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v48;
        if (a3) {
          v12 = @"doubleValue";
        }
        else {
          v12 = @"double_value";
        }
        v13 = @"string_value";
        if (a3) {
          v13 = @"stringValue";
        }
        v43 = v13;
        v44 = v12;
        if (a3) {
          v14 = @"intValue";
        }
        else {
          v14 = @"int_value";
        }
        v15 = @"BOOL_value";
        if (a3) {
          v15 = @"BOOLValue";
        }
        v41 = v15;
        v42 = v14;
        v16 = @"mapValue";
        if (!a3) {
          v16 = @"map_value";
        }
        v40 = v16;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v48 != v11) {
              objc_enumerationMutation(obj);
            }
            v18 = *(void **)(*((void *)&v47 + 1) + 8 * v17);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v19 = [GEONamedFieldValue alloc];
              if (v19)
              {
                id v20 = v19;
                id v21 = v18;
                uint64_t v22 = [(GEONamedFieldValue *)v20 init];
                if (v22)
                {
                  id v23 = [v21 objectForKeyedSubscript:v44];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    [v23 doubleValue];
                    *(unsigned char *)(v22 + 72) |= 0x40u;
                    *(unsigned char *)(v22 + 72) |= 1u;
                    *(void *)(v22 + 24) = v24;
                  }

                  long long v25 = [v21 objectForKeyedSubscript:v43];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    long long v26 = (void *)[v25 copy];
                    id v27 = v26;
                    *(unsigned char *)(v22 + 72) |= 0x20u;
                    *(unsigned char *)(v22 + 72) |= 0x40u;
                    objc_storeStrong((id *)(v22 + 48), v26);
                  }
                  v28 = [v21 objectForKeyedSubscript:v42];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v29 = [v28 longLongValue];
                    *(unsigned char *)(v22 + 72) |= 0x40u;
                    *(unsigned char *)(v22 + 72) |= 2u;
                    *(void *)(v22 + 32) = v29;
                  }

                  v30 = [v21 objectForKeyedSubscript:v41];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    char v31 = [v30 BOOLValue];
                    *(unsigned char *)(v22 + 72) |= 0x40u;
                    *(unsigned char *)(v22 + 72) |= 4u;
                    *(unsigned char *)(v22 + 68) = v31;
                  }

                  v32 = [v21 objectForKeyedSubscript:v40];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v33 = [GEONamedField alloc];
                    if (v33) {
                      v34 = (void *)-[GEONamedField _initWithDictionary:isJSON:](v33, v32, a3);
                    }
                    else {
                      v34 = 0;
                    }
                    id v35 = v34;
                    *(unsigned char *)(v22 + 72) |= 0x10u;
                    *(unsigned char *)(v22 + 72) |= 0x40u;
                    objc_storeStrong((id *)(v22 + 40), v34);
                  }
                }
              }
              else
              {
                uint64_t v22 = 0;
              }
              -[GEONamedField addValues:](v45, (void *)v22);
            }
            ++v17;
          }
          while (v10 != v17);
          uint64_t v36 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
          uint64_t v10 = v36;
        }
        while (v36);
      }

      id v4 = v38;
    }
  }
  return v45;
}

- (BOOL)readFrom:(id)a3
{
  return GEONamedFieldReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEONamedFieldIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v10 = self->_reader;
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
    -[GEONamedField readAll:]((uint64_t)self, 0);
    PBDataWriterWriteStringField();
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
          PBDataWriterWriteSubmessage();
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
      GEONamedFieldReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEONamedField readAll:]((uint64_t)self, 0);
  uint64_t v8 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = self->_values;
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
        -[GEONamedField addValues:](v5, v14);
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEONamedField readAll:]((uint64_t)self, 1),
         -[GEONamedField readAll:]((uint64_t)v4, 1),
         name = self->_name,
         !((unint64_t)name | v4[3]))
     || -[NSString isEqual:](name, "isEqual:")))
  {
    values = self->_values;
    if ((unint64_t)values | v4[4]) {
      char v7 = -[NSMutableArray isEqual:](values, "isEqual:");
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
  -[GEONamedField readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NSMutableArray *)self->_values hash] ^ v3;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 52) |= 1u;
    *(unsigned char *)(a1 + 52) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEONamedField readAll:](a1, 0);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
          if (v8)
          {
            os_unfair_lock_lock_with_options();
            *(unsigned char *)(v8 + 72) |= 8u;
            *(unsigned char *)(v8 + 72) |= 0x40u;
            os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 64));
            uint64_t v9 = *(void **)(v8 + 16);
            *(void *)(v8 + 16) = 0;

            -[GEONamedFieldValue readAll:](v8, 0);
            -[GEONamedField clearUnknownFields:](*(void *)(v8 + 40));
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end