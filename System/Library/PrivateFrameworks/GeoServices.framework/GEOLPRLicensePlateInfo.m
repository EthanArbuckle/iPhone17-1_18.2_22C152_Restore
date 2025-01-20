@interface GEOLPRLicensePlateInfo
+ (BOOL)isValid:(id)a3;
+ (Class)powerTypeKeysType;
+ (Class)vehicleTypeKeysType;
- (BOOL)hasLicensePlateStructure;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRLicensePlateInfo)init;
- (GEOLPRLicensePlateInfo)initWithData:(id)a3;
- (GEOLPRLicensePlateInfo)initWithDictionary:(id)a3;
- (GEOLPRLicensePlateInfo)initWithJSON:(id)a3;
- (GEOLPRLicensePlateStructure)licensePlateStructure;
- (NSMutableArray)powerTypeKeys;
- (NSMutableArray)vehicleTypeKeys;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)powerTypeKeysAtIndex:(unint64_t)a3;
- (id)vehicleTypeKeysAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)powerTypeKeysCount;
- (unint64_t)vehicleTypeKeysCount;
- (void)_addNoFlagsPowerTypeKeys:(uint64_t)a1;
- (void)_addNoFlagsVehicleTypeKeys:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLicensePlateStructure;
- (void)_readPowerTypeKeys;
- (void)_readVehicleTypeKeys;
- (void)addPowerTypeKeys:(id)a3;
- (void)addVehicleTypeKeys:(id)a3;
- (void)clearPowerTypeKeys;
- (void)clearVehicleTypeKeys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setLicensePlateStructure:(id)a3;
- (void)setPowerTypeKeys:(id)a3;
- (void)setVehicleTypeKeys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRLicensePlateInfo

- (GEOLPRLicensePlateInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRLicensePlateInfo;
  v2 = [(GEOLPRLicensePlateInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRLicensePlateInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRLicensePlateInfo;
  v3 = [(GEOLPRLicensePlateInfo *)&v7 initWithData:a3];
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
        GEOLPRLicensePlateInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVehicleTypeKeys_tags_421);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)vehicleTypeKeys
{
  -[GEOLPRLicensePlateInfo _readVehicleTypeKeys]((uint64_t)self);
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

- (void)addVehicleTypeKeys:(id)a3
{
  id v4 = a3;
  -[GEOLPRLicensePlateInfo _readVehicleTypeKeys]((uint64_t)self);
  -[GEOLPRLicensePlateInfo _addNoFlagsVehicleTypeKeys:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsVehicleTypeKeys:(uint64_t)a1
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
  -[GEOLPRLicensePlateInfo _readVehicleTypeKeys]((uint64_t)self);
  vehicleTypeKeys = self->_vehicleTypeKeys;

  return [(NSMutableArray *)vehicleTypeKeys count];
}

- (id)vehicleTypeKeysAtIndex:(unint64_t)a3
{
  -[GEOLPRLicensePlateInfo _readVehicleTypeKeys]((uint64_t)self);
  vehicleTypeKeys = self->_vehicleTypeKeys;

  return (id)[(NSMutableArray *)vehicleTypeKeys objectAtIndex:a3];
}

+ (Class)vehicleTypeKeysType
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
        GEOLPRLicensePlateInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPowerTypeKeys_tags_422);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)powerTypeKeys
{
  -[GEOLPRLicensePlateInfo _readPowerTypeKeys]((uint64_t)self);
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

- (void)addPowerTypeKeys:(id)a3
{
  id v4 = a3;
  -[GEOLPRLicensePlateInfo _readPowerTypeKeys]((uint64_t)self);
  -[GEOLPRLicensePlateInfo _addNoFlagsPowerTypeKeys:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsPowerTypeKeys:(uint64_t)a1
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
  -[GEOLPRLicensePlateInfo _readPowerTypeKeys]((uint64_t)self);
  powerTypeKeys = self->_powerTypeKeys;

  return [(NSMutableArray *)powerTypeKeys count];
}

- (id)powerTypeKeysAtIndex:(unint64_t)a3
{
  -[GEOLPRLicensePlateInfo _readPowerTypeKeys]((uint64_t)self);
  powerTypeKeys = self->_powerTypeKeys;

  return (id)[(NSMutableArray *)powerTypeKeys objectAtIndex:a3];
}

+ (Class)powerTypeKeysType
{
  return (Class)objc_opt_class();
}

- (void)_readLicensePlateStructure
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
        GEOLPRLicensePlateInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLicensePlateStructure_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasLicensePlateStructure
{
  return self->_licensePlateStructure != 0;
}

- (GEOLPRLicensePlateStructure)licensePlateStructure
{
  -[GEOLPRLicensePlateInfo _readLicensePlateStructure]((uint64_t)self);
  licensePlateStructure = self->_licensePlateStructure;

  return licensePlateStructure;
}

- (void)setLicensePlateStructure:(id)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_licensePlateStructure, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRLicensePlateInfo;
  id v4 = [(GEOLPRLicensePlateInfo *)&v8 description];
  id v5 = [(GEOLPRLicensePlateInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRLicensePlateInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[4])
    {
      id v5 = [a1 vehicleTypeKeys];
      if (a2) {
        objc_super v6 = @"vehicleTypeKeys";
      }
      else {
        objc_super v6 = @"vehicle_type_keys";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (a1[3])
    {
      id v7 = [a1 powerTypeKeys];
      if (a2) {
        objc_super v8 = @"powerTypeKeys";
      }
      else {
        objc_super v8 = @"power_type_keys";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 licensePlateStructure];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"licensePlateStructure";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"license_plate_structure";
      }
      [v4 setObject:v11 forKey:v12];
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
  return -[GEOLPRLicensePlateInfo _dictionaryRepresentation:](self, 1);
}

- (GEOLPRLicensePlateInfo)initWithDictionary:(id)a3
{
  return (GEOLPRLicensePlateInfo *)-[GEOLPRLicensePlateInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"vehicleTypeKeys";
      }
      else {
        objc_super v6 = @"vehicle_type_keys";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v35 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = (void *)[v13 copy];
                [a1 addVehicleTypeKeys:v14];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
          }
          while (v10);
        }
      }
      if (a3) {
        v15 = @"powerTypeKeys";
      }
      else {
        v15 = @"power_type_keys";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v31 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = *(void **)(*((void *)&v30 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v23 = objc_msgSend(v22, "copy", (void)v30);
                [a1 addPowerTypeKeys:v23];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v19);
        }
      }
      if (a3) {
        v24 = @"licensePlateStructure";
      }
      else {
        v24 = @"license_plate_structure";
      }
      v25 = objc_msgSend(v5, "objectForKeyedSubscript:", v24, (void)v30);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v26 = [GEOLPRLicensePlateStructure alloc];
        if (a3) {
          uint64_t v27 = [(GEOLPRLicensePlateStructure *)v26 initWithJSON:v25];
        }
        else {
          uint64_t v27 = [(GEOLPRLicensePlateStructure *)v26 initWithDictionary:v25];
        }
        v28 = (void *)v27;
        [a1 setLicensePlateStructure:v27];
      }
    }
  }

  return a1;
}

- (GEOLPRLicensePlateInfo)initWithJSON:(id)a3
{
  return (GEOLPRLicensePlateInfo *)-[GEOLPRLicensePlateInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_441;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_442;
    }
    GEOLPRLicensePlateInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOLPRLicensePlateStructure *)self->_licensePlateStructure readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRLicensePlateInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRLicensePlateInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOLPRLicensePlateInfoIsDirty((uint64_t)self))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLPRLicensePlateInfo *)self readAll:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_vehicleTypeKeys;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = self->_powerTypeKeys;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    if (self->_licensePlateStructure) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOLPRLicensePlateInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 10) = self->_readerMarkPos;
  *((_DWORD *)v12 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLPRLicensePlateInfo *)self vehicleTypeKeysCount])
  {
    [v12 clearVehicleTypeKeys];
    unint64_t v4 = [(GEOLPRLicensePlateInfo *)self vehicleTypeKeysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLPRLicensePlateInfo *)self vehicleTypeKeysAtIndex:i];
        [v12 addVehicleTypeKeys:v7];
      }
    }
  }
  if ([(GEOLPRLicensePlateInfo *)self powerTypeKeysCount])
  {
    [v12 clearPowerTypeKeys];
    unint64_t v8 = [(GEOLPRLicensePlateInfo *)self powerTypeKeysCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOLPRLicensePlateInfo *)self powerTypeKeysAtIndex:j];
        [v12 addPowerTypeKeys:v11];
      }
    }
  }
  if (self->_licensePlateStructure) {
    objc_msgSend(v12, "setLicensePlateStructure:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
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
      GEOLPRLicensePlateInfoReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRLicensePlateInfo *)self readAll:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v8 = self->_vehicleTypeKeys;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [v5 addVehicleTypeKeys:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v13 = self->_powerTypeKeys;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (void)v21);
        [v5 addPowerTypeKeys:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  id v18 = [(GEOLPRLicensePlateStructure *)self->_licensePlateStructure copyWithZone:a3];
  long long v19 = (void *)v5[2];
  v5[2] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLPRLicensePlateInfo *)self readAll:1],
         [v4 readAll:1],
         vehicleTypeKeys = self->_vehicleTypeKeys,
         !((unint64_t)vehicleTypeKeys | v4[4]))
     || -[NSMutableArray isEqual:](vehicleTypeKeys, "isEqual:"))
    && ((powerTypeKeys = self->_powerTypeKeys, !((unint64_t)powerTypeKeys | v4[3]))
     || -[NSMutableArray isEqual:](powerTypeKeys, "isEqual:")))
  {
    licensePlateStructure = self->_licensePlateStructure;
    if ((unint64_t)licensePlateStructure | v4[2]) {
      char v8 = -[GEOLPRLicensePlateStructure isEqual:](licensePlateStructure, "isEqual:");
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
  [(GEOLPRLicensePlateInfo *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_vehicleTypeKeys hash];
  uint64_t v4 = [(NSMutableArray *)self->_powerTypeKeys hash] ^ v3;
  return v4 ^ [(GEOLPRLicensePlateStructure *)self->_licensePlateStructure hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[4];
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
        [(GEOLPRLicensePlateInfo *)self addVehicleTypeKeys:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v4[3];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOLPRLicensePlateInfo addPowerTypeKeys:](self, "addPowerTypeKeys:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  licensePlateStructure = self->_licensePlateStructure;
  id v16 = v4[2];
  if (licensePlateStructure)
  {
    if (v16) {
      -[GEOLPRLicensePlateStructure mergeFrom:](licensePlateStructure, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[GEOLPRLicensePlateInfo setLicensePlateStructure:](self, "setLicensePlateStructure:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleTypeKeys, 0);
  objc_storeStrong((id *)&self->_powerTypeKeys, 0);
  objc_storeStrong((id *)&self->_licensePlateStructure, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end