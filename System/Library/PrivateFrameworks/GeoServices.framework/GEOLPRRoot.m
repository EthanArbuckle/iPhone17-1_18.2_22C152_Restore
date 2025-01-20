@interface GEOLPRRoot
+ (BOOL)isValid:(id)a3;
+ (Class)powerTypesType;
+ (Class)regionsType;
+ (Class)vehicleTypesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRRoot)init;
- (GEOLPRRoot)initWithData:(id)a3;
- (GEOLPRRoot)initWithDictionary:(id)a3;
- (GEOLPRRoot)initWithJSON:(id)a3;
- (NSMutableArray)regions;
- (NSMutableDictionary)powerTypes;
- (NSMutableDictionary)vehicleTypes;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)powerTypesForKey:(id)a3;
- (id)regionsAtIndex:(unint64_t)a3;
- (id)vehicleTypesForKey:(id)a3;
- (unint64_t)hash;
- (unint64_t)powerTypesCount;
- (unint64_t)regionsCount;
- (unint64_t)vehicleTypesCount;
- (void)_addNoFlagsRegions:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readPowerTypes;
- (void)_readRegions;
- (void)_readVehicleTypes;
- (void)_setNoFlagsPowerTypesValue:(void *)a3 forKey:;
- (void)_setNoFlagsVehicleTypesValue:(void *)a3 forKey:;
- (void)addRegions:(id)a3;
- (void)clearPowerTypes;
- (void)clearRegions;
- (void)clearVehicleTypes;
- (void)copyTo:(id)a3;
- (void)enumeratePowerTypesUsingBlock:(id)a3;
- (void)enumerateVehicleTypesUsingBlock:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setPowerTypes:(id)a3;
- (void)setPowerTypesValue:(id)a3 forKey:(id)a4;
- (void)setRegions:(id)a3;
- (void)setVehicleTypes:(id)a3;
- (void)setVehicleTypesValue:(id)a3 forKey:(id)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRRoot

- (GEOLPRRoot)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRRoot;
  v2 = [(GEOLPRRoot *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRRoot)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRRoot;
  v3 = [(GEOLPRRoot *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRegions
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
        GEOLPRRootReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegions_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)regions
{
  -[GEOLPRRoot _readRegions]((uint64_t)self);
  regions = self->_regions;

  return regions;
}

- (void)setRegions:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  regions = self->_regions;
  self->_regions = v4;
}

- (void)clearRegions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  regions = self->_regions;

  [(NSMutableArray *)regions removeAllObjects];
}

- (void)addRegions:(id)a3
{
  id v4 = a3;
  -[GEOLPRRoot _readRegions]((uint64_t)self);
  -[GEOLPRRoot _addNoFlagsRegions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsRegions:(uint64_t)a1
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

- (unint64_t)regionsCount
{
  -[GEOLPRRoot _readRegions]((uint64_t)self);
  regions = self->_regions;

  return [(NSMutableArray *)regions count];
}

- (id)regionsAtIndex:(unint64_t)a3
{
  -[GEOLPRRoot _readRegions]((uint64_t)self);
  regions = self->_regions;

  return (id)[(NSMutableArray *)regions objectAtIndex:a3];
}

+ (Class)regionsType
{
  return (Class)objc_opt_class();
}

- (void)_readPowerTypes
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
        GEOLPRRootReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPowerTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableDictionary)powerTypes
{
  -[GEOLPRRoot _readPowerTypes]((uint64_t)self);
  powerTypes = self->_powerTypes;

  return powerTypes;
}

- (void)setPowerTypes:(id)a3
{
  id v4 = (NSMutableDictionary *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  powerTypes = self->_powerTypes;
  self->_powerTypes = v4;
}

- (void)clearPowerTypes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  powerTypes = self->_powerTypes;

  [(NSMutableDictionary *)powerTypes removeAllObjects];
}

- (void)setPowerTypesValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[GEOLPRRoot _readPowerTypes]((uint64_t)self);
  -[GEOLPRRoot _setNoFlagsPowerTypesValue:forKey:]((uint64_t)self, v7, v6);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_setNoFlagsPowerTypesValue:(void *)a3 forKey:
{
  id v9 = a2;
  id v5 = a3;
  if (a1)
  {
    id v6 = *(void **)(a1 + 16);
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v8 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v7;

      id v6 = *(void **)(a1 + 16);
    }
    [v6 setObject:v9 forKey:v5];
  }
}

- (id)powerTypesForKey:(id)a3
{
  id v4 = a3;
  -[GEOLPRRoot _readPowerTypes]((uint64_t)self);
  id v5 = [(NSMutableDictionary *)self->_powerTypes objectForKey:v4];

  return v5;
}

- (void)enumeratePowerTypesUsingBlock:(id)a3
{
  id v4 = a3;
  -[GEOLPRRoot _readPowerTypes]((uint64_t)self);
  [(NSMutableDictionary *)self->_powerTypes enumerateKeysAndObjectsUsingBlock:v4];
}

- (unint64_t)powerTypesCount
{
  -[GEOLPRRoot _readPowerTypes]((uint64_t)self);
  powerTypes = self->_powerTypes;

  return [(NSMutableDictionary *)powerTypes count];
}

+ (Class)powerTypesType
{
  return (Class)objc_opt_class();
}

- (void)_readVehicleTypes
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
        GEOLPRRootReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVehicleTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableDictionary)vehicleTypes
{
  -[GEOLPRRoot _readVehicleTypes]((uint64_t)self);
  vehicleTypes = self->_vehicleTypes;

  return vehicleTypes;
}

- (void)setVehicleTypes:(id)a3
{
  id v4 = (NSMutableDictionary *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  vehicleTypes = self->_vehicleTypes;
  self->_vehicleTypes = v4;
}

- (void)clearVehicleTypes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  vehicleTypes = self->_vehicleTypes;

  [(NSMutableDictionary *)vehicleTypes removeAllObjects];
}

- (void)setVehicleTypesValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[GEOLPRRoot _readVehicleTypes]((uint64_t)self);
  -[GEOLPRRoot _setNoFlagsVehicleTypesValue:forKey:]((uint64_t)self, v7, v6);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_setNoFlagsVehicleTypesValue:(void *)a3 forKey:
{
  id v9 = a2;
  id v5 = a3;
  if (a1)
  {
    id v6 = *(void **)(a1 + 32);
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v8 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v7;

      id v6 = *(void **)(a1 + 32);
    }
    [v6 setObject:v9 forKey:v5];
  }
}

- (id)vehicleTypesForKey:(id)a3
{
  id v4 = a3;
  -[GEOLPRRoot _readVehicleTypes]((uint64_t)self);
  id v5 = [(NSMutableDictionary *)self->_vehicleTypes objectForKey:v4];

  return v5;
}

- (void)enumerateVehicleTypesUsingBlock:(id)a3
{
  id v4 = a3;
  -[GEOLPRRoot _readVehicleTypes]((uint64_t)self);
  [(NSMutableDictionary *)self->_vehicleTypes enumerateKeysAndObjectsUsingBlock:v4];
}

- (unint64_t)vehicleTypesCount
{
  -[GEOLPRRoot _readVehicleTypes]((uint64_t)self);
  vehicleTypes = self->_vehicleTypes;

  return [(NSMutableDictionary *)vehicleTypes count];
}

+ (Class)vehicleTypesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRRoot;
  id v4 = [(GEOLPRRoot *)&v8 description];
  id v5 = [(GEOLPRRoot *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRRoot _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[3] count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v6 = a1[3];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v32 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"regions"];
    }
    if ([a1[2] count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
      id v14 = a1[2];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __40__GEOLPRRoot__dictionaryRepresentation___block_invoke;
      v28[3] = &unk_1E53E8948;
      id v29 = v13;
      char v30 = a2;
      id v15 = v13;
      [v14 enumerateKeysAndObjectsUsingBlock:v28];
      if (a2) {
        v16 = @"powerTypes";
      }
      else {
        v16 = @"power_types";
      }
      [v4 setObject:v15 forKey:v16];
    }
    if ([a1[4] count])
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
      id v18 = a1[4];
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __40__GEOLPRRoot__dictionaryRepresentation___block_invoke_2;
      v25 = &unk_1E53E8970;
      id v26 = v17;
      char v27 = a2;
      id v19 = v17;
      [v18 enumerateKeysAndObjectsUsingBlock:&v22];
      if (a2) {
        v20 = @"vehicleTypes";
      }
      else {
        v20 = @"vehicle_types";
      }
      objc_msgSend(v4, "setObject:forKey:", v19, v20, v22, v23, v24, v25);
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
  return -[GEOLPRRoot _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

void __40__GEOLPRRoot__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  int v5 = *(unsigned __int8 *)(a1 + 40);
  id v6 = a2;
  if (v5) {
    [a3 jsonRepresentation];
  }
  else {
  id v7 = [a3 dictionaryRepresentation];
  }
  [v4 setObject:v7 forKey:v6];
}

void __40__GEOLPRRoot__dictionaryRepresentation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  int v5 = *(unsigned __int8 *)(a1 + 40);
  id v6 = a2;
  if (v5) {
    [a3 jsonRepresentation];
  }
  else {
  id v7 = [a3 dictionaryRepresentation];
  }
  [v4 setObject:v7 forKey:v6];
}

- (GEOLPRRoot)initWithDictionary:(id)a3
{
  return (GEOLPRRoot *)-[GEOLPRRoot _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"regions"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v54 objects:v60 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v55;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v55 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v54 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v13 = [GEOLPRRegion alloc];
                if (a3) {
                  uint64_t v14 = [(GEOLPRRegion *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEOLPRRegion *)v13 initWithDictionary:v12];
                }
                id v15 = (void *)v14;
                [a1 addRegions:v14];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v54 objects:v60 count:16];
          }
          while (v9);
        }
      }
      if (a3) {
        v16 = @"powerTypes";
      }
      else {
        v16 = @"power_types";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      id v45 = v5;
      if (objc_opt_isKindOfClass())
      {
        int v43 = a3;
        uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
        id v19 = (void *)a1[2];
        a1[2] = v18;

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v20 = v17;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v50 objects:v59 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v51;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v51 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void *)(*((void *)&v50 + 1) + 8 * j);
              id v26 = [v20 objectForKeyedSubscript:v25];
              char v27 = (void *)a1[2];
              v28 = [[GEOLPRPowerType alloc] initWithDictionary:v26];
              [v27 setObject:v28 forKey:v25];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v50 objects:v59 count:16];
          }
          while (v22);
        }

        id v5 = v45;
        a3 = v43;
      }

      if (a3) {
        id v29 = @"vehicleTypes";
      }
      else {
        id v29 = @"vehicle_types";
      }
      char v30 = [v5 objectForKeyedSubscript:v29];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v31 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v32 = (void *)a1[4];
        a1[4] = v31;

        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        v44 = v30;
        id v33 = v30;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v46 objects:v58 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v47;
          do
          {
            for (uint64_t k = 0; k != v35; ++k)
            {
              if (*(void *)v47 != v36) {
                objc_enumerationMutation(v33);
              }
              uint64_t v38 = *(void *)(*((void *)&v46 + 1) + 8 * k);
              v39 = [v33 objectForKeyedSubscript:v38];
              v40 = (void *)a1[4];
              v41 = [[GEOLPRVehicleType alloc] initWithDictionary:v39];
              [v40 setObject:v41 forKey:v38];
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v46 objects:v58 count:16];
          }
          while (v35);
        }

        char v30 = v44;
        id v5 = v45;
      }
    }
  }

  return a1;
}

- (GEOLPRRoot)initWithJSON:(id)a3
{
  return (GEOLPRRoot *)-[GEOLPRRoot _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_56;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_56;
    }
    GEOLPRRootReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLPRRootCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRRootIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRRootReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLPRRootIsDirty((uint64_t)self) & 1) == 0)
  {
    v13 = self->_reader;
    objc_sync_enter(v13);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v14 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v14];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLPRRoot *)self readAll:0];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = self->_regions;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }

    powerTypes = self->_powerTypes;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __22__GEOLPRRoot_writeTo___block_invoke;
    v17[3] = &unk_1E53E8998;
    id v11 = v4;
    id v18 = v11;
    [(NSMutableDictionary *)powerTypes enumerateKeysAndObjectsUsingBlock:v17];

    vehicleTypes = self->_vehicleTypes;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __22__GEOLPRRoot_writeTo___block_invoke_2;
    v15[3] = &unk_1E53E89C0;
    id v16 = v11;
    [(NSMutableDictionary *)vehicleTypes enumerateKeysAndObjectsUsingBlock:v15];
  }
}

uint64_t __22__GEOLPRRoot_writeTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  PBDataWriterPlaceMark();
  PBDataWriterWriteStringField();

  PBDataWriterWriteSubmessage();
  return PBDataWriterRecallMark();
}

uint64_t __22__GEOLPRRoot_writeTo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  PBDataWriterPlaceMark();
  PBDataWriterWriteStringField();

  PBDataWriterWriteSubmessage();
  return PBDataWriterRecallMark();
}

- (void)copyTo:(id)a3
{
  id v4 = (id *)a3;
  [(GEOLPRRoot *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLPRRoot *)self regionsCount])
  {
    [v4 clearRegions];
    unint64_t v5 = [(GEOLPRRoot *)self regionsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOLPRRoot *)self regionsAtIndex:i];
        [v4 addRegions:v8];
      }
    }
  }
  if ([(GEOLPRRoot *)self powerTypesCount])
  {
    [v4 clearPowerTypes];
    if (!v4[2])
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v10 = v4[2];
      v4[2] = v9;
    }
    powerTypes = self->_powerTypes;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __21__GEOLPRRoot_copyTo___block_invoke;
    v17[3] = &unk_1E53E8998;
    id v18 = v4;
    [(NSMutableDictionary *)powerTypes enumerateKeysAndObjectsUsingBlock:v17];
  }
  if ([(GEOLPRRoot *)self vehicleTypesCount])
  {
    [v4 clearVehicleTypes];
    if (!v4[4])
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v13 = v4[4];
      v4[4] = v12;
    }
    vehicleTypes = self->_vehicleTypes;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __21__GEOLPRRoot_copyTo___block_invoke_2;
    v15[3] = &unk_1E53E89C0;
    id v16 = v4;
    [(NSMutableDictionary *)vehicleTypes enumerateKeysAndObjectsUsingBlock:v15];
  }
}

void __21__GEOLPRRoot_copyTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v6 forKey:v5];
}

void __21__GEOLPRRoot_copyTo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(*(void *)(a1 + 32) + 32) setObject:v6 forKey:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOLPRRootReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = v5;
      objc_sync_exit(v7);

LABEL_16:
      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRRoot *)self readAll:0];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = self->_regions;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
        [v5 addRegions:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }

  if ([(NSMutableDictionary *)self->_powerTypes count])
  {
    [v5 clearPowerTypes];
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v15 = (void *)v5[2];
    v5[2] = v14;

    powerTypes = self->_powerTypes;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __27__GEOLPRRoot_copyWithZone___block_invoke;
    v24[3] = &unk_1E53E89E8;
    id v26 = a3;
    uint64_t v25 = v5;
    [(NSMutableDictionary *)powerTypes enumerateKeysAndObjectsUsingBlock:v24];
  }
  if ([(NSMutableDictionary *)self->_vehicleTypes count])
  {
    [v5 clearVehicleTypes];
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v18 = (void *)v5[4];
    v5[4] = v17;

    vehicleTypes = self->_vehicleTypes;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __27__GEOLPRRoot_copyWithZone___block_invoke_2;
    v21[3] = &unk_1E53E8A10;
    uint64_t v23 = a3;
    long long v22 = v5;
    [(NSMutableDictionary *)vehicleTypes enumerateKeysAndObjectsUsingBlock:v21];
    uint64_t v8 = v22;
    goto LABEL_16;
  }
  return v5;
}

void __27__GEOLPRRoot_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = (id)[a3 copyWithZone:v5];
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v7 forKey:v6];
}

void __27__GEOLPRRoot_copyWithZone___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = (id)[a3 copyWithZone:v5];
  [*(id *)(*(void *)(a1 + 32) + 32) setObject:v7 forKey:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLPRRoot *)self readAll:1],
         [v4 readAll:1],
         regions = self->_regions,
         !((unint64_t)regions | v4[3]))
     || -[NSMutableArray isEqual:](regions, "isEqual:"))
    && ((powerTypes = self->_powerTypes, !((unint64_t)powerTypes | v4[2]))
     || -[NSMutableDictionary isEqual:](powerTypes, "isEqual:")))
  {
    vehicleTypes = self->_vehicleTypes;
    if ((unint64_t)vehicleTypes | v4[4]) {
      char v8 = -[NSMutableDictionary isEqual:](vehicleTypes, "isEqual:");
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
  [(GEOLPRRoot *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_regions hash];
  uint64_t v4 = [(NSMutableDictionary *)self->_powerTypes hash] ^ v3;
  return v4 ^ [(NSMutableDictionary *)self->_vehicleTypes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4[3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOLPRRoot addRegions:](self, "addRegions:", *(void *)(*((void *)&v16 + 1) + 8 * v9++), (void)v16);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  if (v4[2])
  {
    powerTypes = self->_powerTypes;
    if (powerTypes)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](powerTypes, "addEntriesFromDictionary:");
    }
    else
    {
      uint64_t v11 = (NSMutableDictionary *)[v4[2] copy];
      id v12 = self->_powerTypes;
      self->_powerTypes = v11;
    }
  }
  if (v4[4])
  {
    vehicleTypes = self->_vehicleTypes;
    if (vehicleTypes)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](vehicleTypes, "addEntriesFromDictionary:");
    }
    else
    {
      id v14 = (NSMutableDictionary *)[v4[4] copy];
      id v15 = self->_vehicleTypes;
      self->_vehicleTypes = v14;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleTypes, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_powerTypes, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end