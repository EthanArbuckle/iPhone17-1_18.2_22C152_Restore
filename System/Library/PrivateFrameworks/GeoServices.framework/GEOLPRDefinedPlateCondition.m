@interface GEOLPRDefinedPlateCondition
+ (BOOL)isValid:(id)a3;
+ (Class)plateMatchConditionType;
+ (Class)powerTypeKeyType;
+ (Class)vehicleTypeKeyType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRDefinedPlateCondition)init;
- (GEOLPRDefinedPlateCondition)initWithData:(id)a3;
- (GEOLPRDefinedPlateCondition)initWithDictionary:(id)a3;
- (GEOLPRDefinedPlateCondition)initWithJSON:(id)a3;
- (NSMutableArray)plateMatchConditions;
- (NSMutableArray)powerTypeKeys;
- (NSMutableArray)vehicleTypeKeys;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)plateMatchConditionAtIndex:(unint64_t)a3;
- (id)powerTypeKeyAtIndex:(unint64_t)a3;
- (id)vehicleTypeKeyAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)plateMatchConditionsCount;
- (unint64_t)powerTypeKeysCount;
- (unint64_t)vehicleTypeKeysCount;
- (void)_addNoFlagsPlateMatchCondition:(uint64_t)a1;
- (void)_addNoFlagsPowerTypeKey:(uint64_t)a1;
- (void)_addNoFlagsVehicleTypeKey:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readPlateMatchConditions;
- (void)_readPowerTypeKeys;
- (void)_readVehicleTypeKeys;
- (void)addPlateMatchCondition:(id)a3;
- (void)addPowerTypeKey:(id)a3;
- (void)addVehicleTypeKey:(id)a3;
- (void)clearPlateMatchConditions;
- (void)clearPowerTypeKeys;
- (void)clearVehicleTypeKeys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setPlateMatchConditions:(id)a3;
- (void)setPowerTypeKeys:(id)a3;
- (void)setVehicleTypeKeys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRDefinedPlateCondition

- (GEOLPRDefinedPlateCondition)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRDefinedPlateCondition;
  v2 = [(GEOLPRDefinedPlateCondition *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRDefinedPlateCondition)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRDefinedPlateCondition;
  v3 = [(GEOLPRDefinedPlateCondition *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readVehicleTypeKeys
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
        GEOLPRDefinedPlateConditionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVehicleTypeKeys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)vehicleTypeKeys
{
  -[GEOLPRDefinedPlateCondition _readVehicleTypeKeys]((uint64_t)self);
  vehicleTypeKeys = self->_vehicleTypeKeys;

  return vehicleTypeKeys;
}

- (void)setVehicleTypeKeys:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  vehicleTypeKeys = self->_vehicleTypeKeys;
  self->_vehicleTypeKeys = v4;
}

- (void)clearVehicleTypeKeys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  vehicleTypeKeys = self->_vehicleTypeKeys;

  [(NSMutableArray *)vehicleTypeKeys removeAllObjects];
}

- (void)addVehicleTypeKey:(id)a3
{
  id v4 = a3;
  -[GEOLPRDefinedPlateCondition _readVehicleTypeKeys]((uint64_t)self);
  -[GEOLPRDefinedPlateCondition _addNoFlagsVehicleTypeKey:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsVehicleTypeKey:(uint64_t)a1
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

- (unint64_t)vehicleTypeKeysCount
{
  -[GEOLPRDefinedPlateCondition _readVehicleTypeKeys]((uint64_t)self);
  vehicleTypeKeys = self->_vehicleTypeKeys;

  return [(NSMutableArray *)vehicleTypeKeys count];
}

- (id)vehicleTypeKeyAtIndex:(unint64_t)a3
{
  -[GEOLPRDefinedPlateCondition _readVehicleTypeKeys]((uint64_t)self);
  vehicleTypeKeys = self->_vehicleTypeKeys;

  return (id)[(NSMutableArray *)vehicleTypeKeys objectAtIndex:a3];
}

+ (Class)vehicleTypeKeyType
{
  return (Class)objc_opt_class();
}

- (void)_readPowerTypeKeys
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
        GEOLPRDefinedPlateConditionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPowerTypeKeys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)powerTypeKeys
{
  -[GEOLPRDefinedPlateCondition _readPowerTypeKeys]((uint64_t)self);
  powerTypeKeys = self->_powerTypeKeys;

  return powerTypeKeys;
}

- (void)setPowerTypeKeys:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  powerTypeKeys = self->_powerTypeKeys;
  self->_powerTypeKeys = v4;
}

- (void)clearPowerTypeKeys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  powerTypeKeys = self->_powerTypeKeys;

  [(NSMutableArray *)powerTypeKeys removeAllObjects];
}

- (void)addPowerTypeKey:(id)a3
{
  id v4 = a3;
  -[GEOLPRDefinedPlateCondition _readPowerTypeKeys]((uint64_t)self);
  -[GEOLPRDefinedPlateCondition _addNoFlagsPowerTypeKey:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsPowerTypeKey:(uint64_t)a1
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

- (unint64_t)powerTypeKeysCount
{
  -[GEOLPRDefinedPlateCondition _readPowerTypeKeys]((uint64_t)self);
  powerTypeKeys = self->_powerTypeKeys;

  return [(NSMutableArray *)powerTypeKeys count];
}

- (id)powerTypeKeyAtIndex:(unint64_t)a3
{
  -[GEOLPRDefinedPlateCondition _readPowerTypeKeys]((uint64_t)self);
  powerTypeKeys = self->_powerTypeKeys;

  return (id)[(NSMutableArray *)powerTypeKeys objectAtIndex:a3];
}

+ (Class)powerTypeKeyType
{
  return (Class)objc_opt_class();
}

- (void)_readPlateMatchConditions
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
        GEOLPRDefinedPlateConditionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlateMatchConditions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)plateMatchConditions
{
  -[GEOLPRDefinedPlateCondition _readPlateMatchConditions]((uint64_t)self);
  plateMatchConditions = self->_plateMatchConditions;

  return plateMatchConditions;
}

- (void)setPlateMatchConditions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  plateMatchConditions = self->_plateMatchConditions;
  self->_plateMatchConditions = v4;
}

- (void)clearPlateMatchConditions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  plateMatchConditions = self->_plateMatchConditions;

  [(NSMutableArray *)plateMatchConditions removeAllObjects];
}

- (void)addPlateMatchCondition:(id)a3
{
  id v4 = a3;
  -[GEOLPRDefinedPlateCondition _readPlateMatchConditions]((uint64_t)self);
  -[GEOLPRDefinedPlateCondition _addNoFlagsPlateMatchCondition:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsPlateMatchCondition:(uint64_t)a1
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

- (unint64_t)plateMatchConditionsCount
{
  -[GEOLPRDefinedPlateCondition _readPlateMatchConditions]((uint64_t)self);
  plateMatchConditions = self->_plateMatchConditions;

  return [(NSMutableArray *)plateMatchConditions count];
}

- (id)plateMatchConditionAtIndex:(unint64_t)a3
{
  -[GEOLPRDefinedPlateCondition _readPlateMatchConditions]((uint64_t)self);
  plateMatchConditions = self->_plateMatchConditions;

  return (id)[(NSMutableArray *)plateMatchConditions objectAtIndex:a3];
}

+ (Class)plateMatchConditionType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRDefinedPlateCondition;
  id v4 = [(GEOLPRDefinedPlateCondition *)&v8 description];
  id v5 = [(GEOLPRDefinedPlateCondition *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRDefinedPlateCondition _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 32))
    {
      id v5 = [(id)a1 vehicleTypeKeys];
      if (a2) {
        objc_super v6 = @"vehicleTypeKey";
      }
      else {
        objc_super v6 = @"vehicle_type_key";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (*(void *)(a1 + 24))
    {
      id v7 = [(id)a1 powerTypeKeys];
      if (a2) {
        objc_super v8 = @"powerTypeKey";
      }
      else {
        objc_super v8 = @"power_type_key";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if ([*(id *)(a1 + 16) count])
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v10 = *(id *)(a1 + 16);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            v16 = objc_msgSend(v15, "dictionaryRepresentation", (void)v19);
            }
            objc_msgSend(v9, "addObject:", v16, (void)v19);
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }

      if (a2) {
        v17 = @"plateMatchCondition";
      }
      else {
        v17 = @"plate_match_condition";
      }
      objc_msgSend(v4, "setObject:forKey:", v9, v17, (void)v19);
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
  return -[GEOLPRDefinedPlateCondition _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRDefinedPlateCondition)initWithDictionary:(id)a3
{
  return (GEOLPRDefinedPlateCondition *)-[GEOLPRDefinedPlateCondition _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"vehicleTypeKey";
      }
      else {
        objc_super v6 = @"vehicle_type_key";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v51 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v46 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = (void *)[v13 copy];
                [a1 addVehicleTypeKey:v14];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v45 objects:v51 count:16];
          }
          while (v10);
        }
      }
      if (a3) {
        v15 = @"powerTypeKey";
      }
      else {
        v15 = @"power_type_key";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v42;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v42 != v20) {
                objc_enumerationMutation(v17);
              }
              long long v22 = *(void **)(*((void *)&v41 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v23 = (void *)[v22 copy];
                [a1 addPowerTypeKey:v23];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v50 count:16];
          }
          while (v19);
        }
      }
      if (a3) {
        uint64_t v24 = @"plateMatchCondition";
      }
      else {
        uint64_t v24 = @"plate_match_condition";
      }
      v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v36 = v5;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v26 = v25;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v49 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v38;
          do
          {
            for (uint64_t k = 0; k != v28; ++k)
            {
              if (*(void *)v38 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v31 = *(void *)(*((void *)&v37 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v32 = [GEOLPRPlateMatchCondition alloc];
                if (a3) {
                  uint64_t v33 = [(GEOLPRPlateMatchCondition *)v32 initWithJSON:v31];
                }
                else {
                  uint64_t v33 = [(GEOLPRPlateMatchCondition *)v32 initWithDictionary:v31];
                }
                v34 = (void *)v33;
                [a1 addPlateMatchCondition:v33];
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v49 count:16];
          }
          while (v28);
        }

        id v5 = v36;
      }
    }
  }

  return a1;
}

- (GEOLPRDefinedPlateCondition)initWithJSON:(id)a3
{
  return (GEOLPRDefinedPlateCondition *)-[GEOLPRDefinedPlateCondition _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_14;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_14;
    }
    GEOLPRDefinedPlateConditionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLPRDefinedPlateConditionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRDefinedPlateConditionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRDefinedPlateConditionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xF) == 0))
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
    [(GEOLPRDefinedPlateCondition *)self readAll:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_super v6 = self->_vehicleTypeKeys;
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
    uint64_t v10 = self->_powerTypeKeys;
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
    v14 = self->_plateMatchConditions;
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
  [(GEOLPRDefinedPlateCondition *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 10) = self->_readerMarkPos;
  *((_DWORD *)v16 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLPRDefinedPlateCondition *)self vehicleTypeKeysCount])
  {
    [v16 clearVehicleTypeKeys];
    unint64_t v4 = [(GEOLPRDefinedPlateCondition *)self vehicleTypeKeysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLPRDefinedPlateCondition *)self vehicleTypeKeyAtIndex:i];
        [v16 addVehicleTypeKey:v7];
      }
    }
  }
  if ([(GEOLPRDefinedPlateCondition *)self powerTypeKeysCount])
  {
    [v16 clearPowerTypeKeys];
    unint64_t v8 = [(GEOLPRDefinedPlateCondition *)self powerTypeKeysCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOLPRDefinedPlateCondition *)self powerTypeKeyAtIndex:j];
        [v16 addPowerTypeKey:v11];
      }
    }
  }
  if ([(GEOLPRDefinedPlateCondition *)self plateMatchConditionsCount])
  {
    [v16 clearPlateMatchConditions];
    unint64_t v12 = [(GEOLPRDefinedPlateCondition *)self plateMatchConditionsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOLPRDefinedPlateCondition *)self plateMatchConditionAtIndex:k];
        [v16 addPlateMatchCondition:v15];
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
      GEOLPRDefinedPlateConditionReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRDefinedPlateCondition *)self readAll:0];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  unint64_t v8 = self->_vehicleTypeKeys;
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
        [v5 addVehicleTypeKey:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v9);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v13 = self->_powerTypeKeys;
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
        id v17 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * j) copyWithZone:a3];
        [v5 addPowerTypeKey:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v14);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v18 = self->_plateMatchConditions;
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
        [v5 addPlateMatchCondition:v22];
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
    && (([(GEOLPRDefinedPlateCondition *)self readAll:1],
         [v4 readAll:1],
         vehicleTypeKeys = self->_vehicleTypeKeys,
         !((unint64_t)vehicleTypeKeys | v4[4]))
     || -[NSMutableArray isEqual:](vehicleTypeKeys, "isEqual:"))
    && ((powerTypeKeys = self->_powerTypeKeys, !((unint64_t)powerTypeKeys | v4[3]))
     || -[NSMutableArray isEqual:](powerTypeKeys, "isEqual:")))
  {
    plateMatchConditions = self->_plateMatchConditions;
    if ((unint64_t)plateMatchConditions | v4[2]) {
      char v8 = -[NSMutableArray isEqual:](plateMatchConditions, "isEqual:");
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
  [(GEOLPRDefinedPlateCondition *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_vehicleTypeKeys hash];
  uint64_t v4 = [(NSMutableArray *)self->_powerTypeKeys hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_plateMatchConditions hash];
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
        [(GEOLPRDefinedPlateCondition *)self addVehicleTypeKey:*(void *)(*((void *)&v28 + 1) + 8 * v9++)];
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
  id v10 = v4[3];
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
        [(GEOLPRDefinedPlateCondition *)self addPowerTypeKey:*(void *)(*((void *)&v24 + 1) + 8 * v14++)];
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
  id v15 = v4[2];
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
        -[GEOLPRDefinedPlateCondition addPlateMatchCondition:](self, "addPlateMatchCondition:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleTypeKeys, 0);
  objc_storeStrong((id *)&self->_powerTypeKeys, 0);
  objc_storeStrong((id *)&self->_plateMatchConditions, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end