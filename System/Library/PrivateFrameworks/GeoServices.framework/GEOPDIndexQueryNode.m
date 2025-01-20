@interface GEOPDIndexQueryNode
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDIndexQueryNode)init;
- (GEOPDIndexQueryNode)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (unint64_t)hash;
- (void)_addNoFlagsOperand:(uint64_t)a1;
- (void)addOperand:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setField:(uint64_t)a1;
- (void)setValue:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDIndexQueryNode

- (GEOPDIndexQueryNode)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDIndexQueryNode;
  v2 = [(GEOPDIndexQueryNode *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDIndexQueryNode)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDIndexQueryNode;
  v3 = [(GEOPDIndexQueryNode *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setField:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 64) |= 2u;
  *(unsigned char *)(a1 + 64) |= 0x10u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setValue:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 64) |= 8u;
  *(unsigned char *)(a1 + 64) |= 0x10u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)addOperand:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDIndexQueryNodeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOperands_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    -[GEOPDIndexQueryNode _addNoFlagsOperand:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 64) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 64) |= 0x10u;
  }
}

- (void)_addNoFlagsOperand:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDIndexQueryNode;
  id v4 = [(GEOPDIndexQueryNode *)&v8 description];
  id v5 = [(GEOPDIndexQueryNode *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDIndexQueryNode _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDIndexQueryNode readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = *(int *)(a1 + 60);
    if (v5 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
      objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v6 = off_1E53DCBA8[v5];
    }
    [v4 setObject:v6 forKey:@"type"];

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 2) == 0)
    {
      id v7 = *(void **)(a1 + 8);
      if (v7)
      {
        id v8 = v7;
        objc_sync_enter(v8);
        GEOPDIndexQueryNodeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readField_tags);
        objc_sync_exit(v8);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v9 = *(id *)(a1 + 24);
    if (v9) {
      [v4 setObject:v9 forKey:@"field"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v10 = *(void **)(a1 + 8);
      if (v10)
      {
        id v11 = v10;
        objc_sync_enter(v11);
        GEOPDIndexQueryNodeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readValue_tags_0);
        objc_sync_exit(v11);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v12 = *(id *)(a1 + 40);
    if (v12) {
      [v4 setObject:v12 forKey:@"value"];
    }

    if ([*(id *)(a1 + 32) count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v14 = *(id *)(a1 + 32);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v30 != v16) {
              objc_enumerationMutation(v14);
            }
            v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if (a2) {
              [v18 jsonRepresentation];
            }
            else {
            v19 = [v18 dictionaryRepresentation];
            }
            [v13 addObject:v19];
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v15);
      }

      [v4 setObject:v13 forKey:@"operand"];
    }
    v20 = *(void **)(a1 + 16);
    if (v20)
    {
      v21 = [v20 dictionaryRepresentation];
      v22 = v21;
      if (a2)
      {
        v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __49__GEOPDIndexQueryNode__dictionaryRepresentation___block_invoke;
        v27[3] = &unk_1E53D8860;
        id v24 = v23;
        id v28 = v24;
        [v22 enumerateKeysAndObjectsUsingBlock:v27];
        id v25 = v24;
      }
      else
      {
        id v25 = v21;
      }
      [v4 setObject:v25 forKey:@"Unknown Fields"];
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
  return -[GEOPDIndexQueryNode _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_3408;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_3409;
      }
      GEOPDIndexQueryNodeReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDIndexQueryNodeCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __49__GEOPDIndexQueryNode__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [a1 init];
  if (!v4) {
    goto LABEL_36;
  }
  id v5 = [v3 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    if ([v6 isEqualToString:@"INDEX_QUERY_AND"])
    {
      int v7 = 0;
    }
    else if ([v6 isEqualToString:@"INDEX_QUERY_OR"])
    {
      int v7 = 1;
    }
    else if ([v6 isEqualToString:@"INDEX_QUERY_TERM"])
    {
      int v7 = 2;
    }
    else if ([v6 isEqualToString:@"INDEX_QUERY_NEGATIVE_TERM"])
    {
      int v7 = 3;
    }
    else
    {
      int v7 = 0;
    }

    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = [v5 intValue];
LABEL_15:
    *(unsigned char *)(v4 + 64) |= 0x10u;
    *(_DWORD *)(v4 + 60) = v7;
  }

  id v8 = [v3 objectForKeyedSubscript:@"field"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = (void *)[v8 copy];
    -[GEOPDIndexQueryNode setField:](v4, v9);
  }
  id v10 = [v3 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = (void *)[v10 copy];
    -[GEOPDIndexQueryNode setValue:](v4, v11);
  }
  id v12 = [v3 objectForKeyedSubscript:@"operand"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * v17);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v19 = [GEOPDIndexQueryNode alloc];
            if (v19) {
              v20 = (void *)-[GEOPDIndexQueryNode _initWithDictionary:isJSON:](v19, v18);
            }
            else {
              v20 = 0;
            }
            -[GEOPDIndexQueryNode addOperand:](v4, v20);
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v21 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
        uint64_t v15 = v21;
      }
      while (v21);
    }
  }
LABEL_36:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDIndexQueryNodeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDIndexQueryNodeIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDIndexQueryNode readAll:]((uint64_t)self, 0);
    PBDataWriterWriteInt32Field();
    if (self->_field) {
      PBDataWriterWriteStringField();
    }
    if (self->_value) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_operands;
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
      GEOPDIndexQueryNodeReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDIndexQueryNode readAll:]((uint64_t)self, 0);
  *(_DWORD *)(v5 + 60) = self->_type;
  uint64_t v8 = [(NSString *)self->_field copyWithZone:a3];
  id v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_value copyWithZone:a3];
  id v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v12 = self->_operands;
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
        -[GEOPDIndexQueryNode addOperand:](v5, v16);
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
    && (-[GEOPDIndexQueryNode readAll:]((uint64_t)self, 1),
        -[GEOPDIndexQueryNode readAll:]((uint64_t)v4, 1),
        self->_type == *((_DWORD *)v4 + 15))
    && ((field = self->_field, !((unint64_t)field | v4[3]))
     || -[NSString isEqual:](field, "isEqual:"))
    && ((value = self->_value, !((unint64_t)value | v4[5]))
     || -[NSString isEqual:](value, "isEqual:")))
  {
    operands = self->_operands;
    if ((unint64_t)operands | v4[4]) {
      char v8 = -[NSMutableArray isEqual:](operands, "isEqual:");
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
  -[GEOPDIndexQueryNode readAll:]((uint64_t)self, 1);
  uint64_t v3 = 2654435761 * self->_type;
  NSUInteger v4 = [(NSString *)self->_field hash];
  NSUInteger v5 = v4 ^ [(NSString *)self->_value hash];
  return v5 ^ [(NSMutableArray *)self->_operands hash] ^ v3;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 64) |= 1u;
    *(unsigned char *)(a1 + 64) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDIndexQueryNode readAll:](a1, 0);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          -[GEOPDIndexQueryNode clearUnknownFields:](*(void *)(*((void *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_operands, 0);
  objc_storeStrong((id *)&self->_field, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end