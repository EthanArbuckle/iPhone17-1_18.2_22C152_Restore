@interface GEOLPRValueMapping
+ (BOOL)isValid:(id)a3;
+ (Class)mappedValueType;
+ (Class)timeConditionsType;
+ (Class)valueType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRValueMapping)init;
- (GEOLPRValueMapping)initWithData:(id)a3;
- (GEOLPRValueMapping)initWithDictionary:(id)a3;
- (GEOLPRValueMapping)initWithJSON:(id)a3;
- (NSMutableArray)mappedValues;
- (NSMutableArray)timeConditions;
- (NSMutableArray)values;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mappedValueAtIndex:(unint64_t)a3;
- (id)timeConditionsAtIndex:(unint64_t)a3;
- (id)valueAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)mappedValuesCount;
- (unint64_t)timeConditionsCount;
- (unint64_t)valuesCount;
- (void)_addNoFlagsMappedValue:(uint64_t)a1;
- (void)_addNoFlagsTimeConditions:(uint64_t)a1;
- (void)_addNoFlagsValue:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readMappedValues;
- (void)_readTimeConditions;
- (void)_readValues;
- (void)addMappedValue:(id)a3;
- (void)addTimeConditions:(id)a3;
- (void)addValue:(id)a3;
- (void)clearMappedValues;
- (void)clearTimeConditions;
- (void)clearValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setMappedValues:(id)a3;
- (void)setTimeConditions:(id)a3;
- (void)setValues:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRValueMapping

- (GEOLPRValueMapping)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRValueMapping;
  v2 = [(GEOLPRValueMapping *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRValueMapping)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRValueMapping;
  v3 = [(GEOLPRValueMapping *)&v7 initWithData:a3];
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
        GEOLPRValueMappingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readValues_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)values
{
  -[GEOLPRValueMapping _readValues]((uint64_t)self);
  values = self->_values;

  return values;
}

- (void)setValues:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  values = self->_values;
  self->_values = v4;
}

- (void)clearValues
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  values = self->_values;

  [(NSMutableArray *)values removeAllObjects];
}

- (void)addValue:(id)a3
{
  id v4 = a3;
  -[GEOLPRValueMapping _readValues]((uint64_t)self);
  -[GEOLPRValueMapping _addNoFlagsValue:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsValue:(uint64_t)a1
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

- (unint64_t)valuesCount
{
  -[GEOLPRValueMapping _readValues]((uint64_t)self);
  values = self->_values;

  return [(NSMutableArray *)values count];
}

- (id)valueAtIndex:(unint64_t)a3
{
  -[GEOLPRValueMapping _readValues]((uint64_t)self);
  values = self->_values;

  return (id)[(NSMutableArray *)values objectAtIndex:a3];
}

+ (Class)valueType
{
  return (Class)objc_opt_class();
}

- (void)_readMappedValues
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
        GEOLPRValueMappingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMappedValues_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)mappedValues
{
  -[GEOLPRValueMapping _readMappedValues]((uint64_t)self);
  mappedValues = self->_mappedValues;

  return mappedValues;
}

- (void)setMappedValues:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  mappedValues = self->_mappedValues;
  self->_mappedValues = v4;
}

- (void)clearMappedValues
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  mappedValues = self->_mappedValues;

  [(NSMutableArray *)mappedValues removeAllObjects];
}

- (void)addMappedValue:(id)a3
{
  id v4 = a3;
  -[GEOLPRValueMapping _readMappedValues]((uint64_t)self);
  -[GEOLPRValueMapping _addNoFlagsMappedValue:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsMappedValue:(uint64_t)a1
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

- (unint64_t)mappedValuesCount
{
  -[GEOLPRValueMapping _readMappedValues]((uint64_t)self);
  mappedValues = self->_mappedValues;

  return [(NSMutableArray *)mappedValues count];
}

- (id)mappedValueAtIndex:(unint64_t)a3
{
  -[GEOLPRValueMapping _readMappedValues]((uint64_t)self);
  mappedValues = self->_mappedValues;

  return (id)[(NSMutableArray *)mappedValues objectAtIndex:a3];
}

+ (Class)mappedValueType
{
  return (Class)objc_opt_class();
}

- (void)_readTimeConditions
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
        GEOLPRValueMappingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimeConditions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)timeConditions
{
  -[GEOLPRValueMapping _readTimeConditions]((uint64_t)self);
  timeConditions = self->_timeConditions;

  return timeConditions;
}

- (void)setTimeConditions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  timeConditions = self->_timeConditions;
  self->_timeConditions = v4;
}

- (void)clearTimeConditions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  timeConditions = self->_timeConditions;

  [(NSMutableArray *)timeConditions removeAllObjects];
}

- (void)addTimeConditions:(id)a3
{
  id v4 = a3;
  -[GEOLPRValueMapping _readTimeConditions]((uint64_t)self);
  -[GEOLPRValueMapping _addNoFlagsTimeConditions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsTimeConditions:(uint64_t)a1
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

- (unint64_t)timeConditionsCount
{
  -[GEOLPRValueMapping _readTimeConditions]((uint64_t)self);
  timeConditions = self->_timeConditions;

  return [(NSMutableArray *)timeConditions count];
}

- (id)timeConditionsAtIndex:(unint64_t)a3
{
  -[GEOLPRValueMapping _readTimeConditions]((uint64_t)self);
  timeConditions = self->_timeConditions;

  return (id)[(NSMutableArray *)timeConditions objectAtIndex:a3];
}

+ (Class)timeConditionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRValueMapping;
  id v4 = [(GEOLPRValueMapping *)&v8 description];
  id v5 = [(GEOLPRValueMapping *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRValueMapping _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 32))
    {
      id v5 = [(id)a1 values];
      [v4 setObject:v5 forKey:@"value"];
    }
    if (*(void *)(a1 + 16))
    {
      objc_super v6 = [(id)a1 mappedValues];
      if (a2) {
        id v7 = @"mappedValue";
      }
      else {
        id v7 = @"mapped_value";
      }
      [v4 setObject:v6 forKey:v7];
    }
    if ([*(id *)(a1 + 24) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = *(id *)(a1 + 24);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            v15 = objc_msgSend(v14, "dictionaryRepresentation", (void)v18);
            }
            objc_msgSend(v8, "addObject:", v15, (void)v18);
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v11);
      }

      if (a2) {
        v16 = @"timeConditions";
      }
      else {
        v16 = @"time_conditions";
      }
      objc_msgSend(v4, "setObject:forKey:", v8, v16, (void)v18);
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
  return -[GEOLPRValueMapping _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRValueMapping)initWithDictionary:(id)a3
{
  return (GEOLPRValueMapping *)-[GEOLPRValueMapping _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"value"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v50 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v45 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v13 = (void *)[v12 copy];
                [a1 addValue:v13];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v50 count:16];
          }
          while (v9);
        }
      }
      if (a3) {
        v14 = @"mappedValue";
      }
      else {
        v14 = @"mapped_value";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v41;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v41 != v19) {
                objc_enumerationMutation(v16);
              }
              long long v21 = *(void **)(*((void *)&v40 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v22 = (void *)[v21 copy];
                [a1 addMappedValue:v22];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v49 count:16];
          }
          while (v18);
        }
      }
      if (a3) {
        uint64_t v23 = @"timeConditions";
      }
      else {
        uint64_t v23 = @"time_conditions";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v35 = v5;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v48 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v37;
          do
          {
            for (uint64_t k = 0; k != v27; ++k)
            {
              if (*(void *)v37 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void *)(*((void *)&v36 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v31 = [GEOLPRTimeCondition alloc];
                if (a3) {
                  uint64_t v32 = [(GEOLPRTimeCondition *)v31 initWithJSON:v30];
                }
                else {
                  uint64_t v32 = [(GEOLPRTimeCondition *)v31 initWithDictionary:v30];
                }
                v33 = (void *)v32;
                [a1 addTimeConditions:v32];
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v48 count:16];
          }
          while (v27);
        }

        id v5 = v35;
      }
    }
  }

  return a1;
}

- (GEOLPRValueMapping)initWithJSON:(id)a3
{
  return (GEOLPRValueMapping *)-[GEOLPRValueMapping _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_781;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_782;
    }
    GEOLPRValueMappingReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLPRValueMappingCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRValueMappingIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRValueMappingReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLPRValueMappingIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLPRValueMapping *)self readAll:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_super v6 = self->_values;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v10 = self->_mappedValues;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v14 = self->_timeConditions;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v15);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v16 = (id *)a3;
  [(GEOLPRValueMapping *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 10) = self->_readerMarkPos;
  *((_DWORD *)v16 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLPRValueMapping *)self valuesCount])
  {
    [v16 clearValues];
    unint64_t v4 = [(GEOLPRValueMapping *)self valuesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLPRValueMapping *)self valueAtIndex:i];
        [v16 addValue:v7];
      }
    }
  }
  if ([(GEOLPRValueMapping *)self mappedValuesCount])
  {
    [v16 clearMappedValues];
    unint64_t v8 = [(GEOLPRValueMapping *)self mappedValuesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOLPRValueMapping *)self mappedValueAtIndex:j];
        [v16 addMappedValue:v11];
      }
    }
  }
  if ([(GEOLPRValueMapping *)self timeConditionsCount])
  {
    [v16 clearTimeConditions];
    unint64_t v12 = [(GEOLPRValueMapping *)self timeConditionsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOLPRValueMapping *)self timeConditionsAtIndex:k];
        [v16 addTimeConditions:v15];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
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
      GEOLPRValueMappingReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRValueMapping *)self readAll:0];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  unint64_t v8 = self->_values;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * i) copyWithZone:a3];
        [v5 addValue:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v9);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v13 = self->_mappedValues;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * j) copyWithZone:a3];
        [v5 addMappedValue:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v14);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v18 = self->_timeConditions;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v25;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v18);
        }
        long long v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * k), "copyWithZone:", a3, (void)v24);
        [v5 addTimeConditions:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v19);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLPRValueMapping *)self readAll:1],
         [v4 readAll:1],
         values = self->_values,
         !((unint64_t)values | v4[4]))
     || -[NSMutableArray isEqual:](values, "isEqual:"))
    && ((mappedValues = self->_mappedValues, !((unint64_t)mappedValues | v4[2]))
     || -[NSMutableArray isEqual:](mappedValues, "isEqual:")))
  {
    timeConditions = self->_timeConditions;
    if ((unint64_t)timeConditions | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](timeConditions, "isEqual:");
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
  [(GEOLPRValueMapping *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_values hash];
  uint64_t v4 = [(NSMutableArray *)self->_mappedValues hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_timeConditions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v4[4];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOLPRValueMapping *)self addValue:*(void *)(*((void *)&v28 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v4[2];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOLPRValueMapping *)self addMappedValue:*(void *)(*((void *)&v24 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v4[3];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[GEOLPRValueMapping addTimeConditions:](self, "addTimeConditions:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_timeConditions, 0);
  objc_storeStrong((id *)&self->_mappedValues, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end