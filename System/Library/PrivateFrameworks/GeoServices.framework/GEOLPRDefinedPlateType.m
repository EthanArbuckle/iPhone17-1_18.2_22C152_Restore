@interface GEOLPRDefinedPlateType
+ (BOOL)isValid:(id)a3;
+ (Class)conditionsType;
- (BOOL)hasDesc;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRDefinedPlateType)init;
- (GEOLPRDefinedPlateType)initWithData:(id)a3;
- (GEOLPRDefinedPlateType)initWithDictionary:(id)a3;
- (GEOLPRDefinedPlateType)initWithJSON:(id)a3;
- (NSMutableArray)conditions;
- (NSString)desc;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)conditionsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)conditionsCount;
- (unint64_t)hash;
- (void)_addNoFlagsConditions:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readConditions;
- (void)_readDesc;
- (void)addConditions:(id)a3;
- (void)clearConditions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setConditions:(id)a3;
- (void)setDesc:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRDefinedPlateType

- (GEOLPRDefinedPlateType)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRDefinedPlateType;
  v2 = [(GEOLPRDefinedPlateType *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRDefinedPlateType)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRDefinedPlateType;
  v3 = [(GEOLPRDefinedPlateType *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readConditions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRDefinedPlateTypeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readConditions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)conditions
{
  -[GEOLPRDefinedPlateType _readConditions]((uint64_t)self);
  conditions = self->_conditions;

  return conditions;
}

- (void)setConditions:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  conditions = self->_conditions;
  self->_conditions = v4;
}

- (void)clearConditions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  conditions = self->_conditions;

  [(NSMutableArray *)conditions removeAllObjects];
}

- (void)addConditions:(id)a3
{
  id v4 = a3;
  -[GEOLPRDefinedPlateType _readConditions]((uint64_t)self);
  -[GEOLPRDefinedPlateType _addNoFlagsConditions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (void)_addNoFlagsConditions:(uint64_t)a1
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

- (unint64_t)conditionsCount
{
  -[GEOLPRDefinedPlateType _readConditions]((uint64_t)self);
  conditions = self->_conditions;

  return [(NSMutableArray *)conditions count];
}

- (id)conditionsAtIndex:(unint64_t)a3
{
  -[GEOLPRDefinedPlateType _readConditions]((uint64_t)self);
  conditions = self->_conditions;

  return (id)[(NSMutableArray *)conditions objectAtIndex:a3];
}

+ (Class)conditionsType
{
  return (Class)objc_opt_class();
}

- (void)_readDesc
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRDefinedPlateTypeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDesc_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasDesc
{
  return self->_desc != 0;
}

- (NSString)desc
{
  -[GEOLPRDefinedPlateType _readDesc]((uint64_t)self);
  desc = self->_desc;

  return desc;
}

- (void)setDesc:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_desc, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRDefinedPlateType;
  id v4 = [(GEOLPRDefinedPlateType *)&v8 description];
  id v5 = [(GEOLPRDefinedPlateType *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRDefinedPlateType _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[2] count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v6 = a1[2];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = objc_msgSend(v11, "dictionaryRepresentation", (void)v15);
            }
            objc_msgSend(v5, "addObject:", v12, (void)v15);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"conditions"];
    }
    v13 = objc_msgSend(a1, "desc", (void)v15);
    if (v13) {
      [v4 setObject:v13 forKey:@"desc"];
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
  return -[GEOLPRDefinedPlateType _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOLPRDefinedPlateType)initWithDictionary:(id)a3
{
  return (GEOLPRDefinedPlateType *)-[GEOLPRDefinedPlateType _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"conditions"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v19 = v6;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v21 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v13 = [GEOLPRDefinedPlateCondition alloc];
                if (a3) {
                  uint64_t v14 = [(GEOLPRDefinedPlateCondition *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEOLPRDefinedPlateCondition *)v13 initWithDictionary:v12];
                }
                long long v15 = (void *)v14;
                [a1 addConditions:v14];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v9);
        }

        id v6 = v19;
      }

      long long v16 = [v5 objectForKeyedSubscript:@"desc"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v17 = (void *)[v16 copy];
        [a1 setDesc:v17];
      }
    }
  }

  return a1;
}

- (GEOLPRDefinedPlateType)initWithJSON:(id)a3
{
  return (GEOLPRDefinedPlateType *)-[GEOLPRDefinedPlateType _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_102;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_103;
    }
    GEOLPRDefinedPlateTypeReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLPRDefinedPlateTypeCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRDefinedPlateTypeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRDefinedPlateTypeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
  {
    uint64_t v10 = self->_reader;
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
    [(GEOLPRDefinedPlateType *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_conditions;
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

    if (self->_desc) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOLPRDefinedPlateType *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLPRDefinedPlateType *)self conditionsCount])
  {
    [v8 clearConditions];
    unint64_t v4 = [(GEOLPRDefinedPlateType *)self conditionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLPRDefinedPlateType *)self conditionsAtIndex:i];
        [v8 addConditions:v7];
      }
    }
  }
  if (self->_desc) {
    objc_msgSend(v8, "setDesc:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOLPRDefinedPlateTypeReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRDefinedPlateType *)self readAll:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_conditions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [v5 addConditions:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(NSString *)self->_desc copyWithZone:a3];
  long long v14 = (void *)v5[3];
  v5[3] = v13;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLPRDefinedPlateType *)self readAll:1],
         [v4 readAll:1],
         conditions = self->_conditions,
         !((unint64_t)conditions | v4[2]))
     || -[NSMutableArray isEqual:](conditions, "isEqual:")))
  {
    desc = self->_desc;
    if ((unint64_t)desc | v4[3]) {
      char v7 = -[NSString isEqual:](desc, "isEqual:");
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
  [(GEOLPRDefinedPlateType *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_conditions hash];
  return [(NSString *)self->_desc hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4[2];
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
        -[GEOLPRDefinedPlateType addConditions:](self, "addConditions:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[3]) {
    -[GEOLPRDefinedPlateType setDesc:](self, "setDesc:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_conditions, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end