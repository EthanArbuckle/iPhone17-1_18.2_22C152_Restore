@interface GEOLPRRegionInfo
+ (BOOL)isValid:(id)a3;
+ (Class)licensePlateValidationRulesType;
+ (Class)validPowerTypeKeysType;
+ (Class)validVehicleTypeKeysType;
- (BOOL)hasLicensePlateTemplate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRRegionInfo)init;
- (GEOLPRRegionInfo)initWithData:(id)a3;
- (GEOLPRRegionInfo)initWithDictionary:(id)a3;
- (GEOLPRRegionInfo)initWithJSON:(id)a3;
- (NSMutableArray)licensePlateValidationRules;
- (NSMutableArray)validPowerTypeKeys;
- (NSMutableArray)validVehicleTypeKeys;
- (NSString)licensePlateTemplate;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)licensePlateValidationRulesAtIndex:(unint64_t)a3;
- (id)routingRequiredFieldsAsString:(int)a3;
- (id)validPowerTypeKeysAtIndex:(unint64_t)a3;
- (id)validVehicleTypeKeysAtIndex:(unint64_t)a3;
- (int)StringAsRoutingRequiredFields:(id)a3;
- (int)routingRequiredFields;
- (int)routingRequiredFieldsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)licensePlateValidationRulesCount;
- (unint64_t)routingRequiredFieldsCount;
- (unint64_t)validPowerTypeKeysCount;
- (unint64_t)validVehicleTypeKeysCount;
- (void)_addNoFlagsLicensePlateValidationRules:(uint64_t)a1;
- (void)_addNoFlagsValidPowerTypeKeys:(uint64_t)a1;
- (void)_addNoFlagsValidVehicleTypeKeys:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLicensePlateTemplate;
- (void)_readLicensePlateValidationRules;
- (void)_readRoutingRequiredFields;
- (void)_readValidPowerTypeKeys;
- (void)_readValidVehicleTypeKeys;
- (void)addLicensePlateValidationRules:(id)a3;
- (void)addRoutingRequiredFields:(int)a3;
- (void)addValidPowerTypeKeys:(id)a3;
- (void)addValidVehicleTypeKeys:(id)a3;
- (void)clearLicensePlateValidationRules;
- (void)clearRoutingRequiredFields;
- (void)clearValidPowerTypeKeys;
- (void)clearValidVehicleTypeKeys;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setLicensePlateTemplate:(id)a3;
- (void)setLicensePlateValidationRules:(id)a3;
- (void)setRoutingRequiredFields:(int *)a3 count:(unint64_t)a4;
- (void)setValidPowerTypeKeys:(id)a3;
- (void)setValidVehicleTypeKeys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRRegionInfo

- (GEOLPRRegionInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRRegionInfo;
  v2 = [(GEOLPRRegionInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRRegionInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRRegionInfo;
  v3 = [(GEOLPRRegionInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOLPRRegionInfo;
  [(GEOLPRRegionInfo *)&v3 dealloc];
}

- (void)_readRoutingRequiredFields
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRegionInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoutingRequiredFields_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (unint64_t)routingRequiredFieldsCount
{
  return self->_routingRequiredFields.count;
}

- (int)routingRequiredFields
{
  return self->_routingRequiredFields.list;
}

- (void)clearRoutingRequiredFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;

  PBRepeatedInt32Clear();
}

- (void)addRoutingRequiredFields:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (int)routingRequiredFieldsAtIndex:(unint64_t)a3
{
  -[GEOLPRRegionInfo _readRoutingRequiredFields]((uint64_t)self);
  p_routingRequiredFields = &self->_routingRequiredFields;
  unint64_t count = self->_routingRequiredFields.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_routingRequiredFields->list[a3];
}

- (void)setRoutingRequiredFields:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;

  MEMORY[0x1F4147390](&self->_routingRequiredFields, a3, a4);
}

- (id)routingRequiredFieldsAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E98E0[a3 - 1];
  }

  return v3;
}

- (int)StringAsRoutingRequiredFields:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LICENSE_PLATE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"POWER_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VEHICLE_TYPE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)_readValidPowerTypeKeys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRegionInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readValidPowerTypeKeys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)validPowerTypeKeys
{
  -[GEOLPRRegionInfo _readValidPowerTypeKeys]((uint64_t)self);
  validPowerTypeKeys = self->_validPowerTypeKeys;

  return validPowerTypeKeys;
}

- (void)setValidPowerTypeKeys:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  validPowerTypeKeys = self->_validPowerTypeKeys;
  self->_validPowerTypeKeys = v4;
}

- (void)clearValidPowerTypeKeys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  validPowerTypeKeys = self->_validPowerTypeKeys;

  [(NSMutableArray *)validPowerTypeKeys removeAllObjects];
}

- (void)addValidPowerTypeKeys:(id)a3
{
  id v4 = a3;
  -[GEOLPRRegionInfo _readValidPowerTypeKeys]((uint64_t)self);
  -[GEOLPRRegionInfo _addNoFlagsValidPowerTypeKeys:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsValidPowerTypeKeys:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)validPowerTypeKeysCount
{
  -[GEOLPRRegionInfo _readValidPowerTypeKeys]((uint64_t)self);
  validPowerTypeKeys = self->_validPowerTypeKeys;

  return [(NSMutableArray *)validPowerTypeKeys count];
}

- (id)validPowerTypeKeysAtIndex:(unint64_t)a3
{
  -[GEOLPRRegionInfo _readValidPowerTypeKeys]((uint64_t)self);
  validPowerTypeKeys = self->_validPowerTypeKeys;

  return (id)[(NSMutableArray *)validPowerTypeKeys objectAtIndex:a3];
}

+ (Class)validPowerTypeKeysType
{
  return (Class)objc_opt_class();
}

- (void)_readValidVehicleTypeKeys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRegionInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readValidVehicleTypeKeys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)validVehicleTypeKeys
{
  -[GEOLPRRegionInfo _readValidVehicleTypeKeys]((uint64_t)self);
  validVehicleTypeKeys = self->_validVehicleTypeKeys;

  return validVehicleTypeKeys;
}

- (void)setValidVehicleTypeKeys:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  validVehicleTypeKeys = self->_validVehicleTypeKeys;
  self->_validVehicleTypeKeys = v4;
}

- (void)clearValidVehicleTypeKeys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  validVehicleTypeKeys = self->_validVehicleTypeKeys;

  [(NSMutableArray *)validVehicleTypeKeys removeAllObjects];
}

- (void)addValidVehicleTypeKeys:(id)a3
{
  id v4 = a3;
  -[GEOLPRRegionInfo _readValidVehicleTypeKeys]((uint64_t)self);
  -[GEOLPRRegionInfo _addNoFlagsValidVehicleTypeKeys:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsValidVehicleTypeKeys:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)validVehicleTypeKeysCount
{
  -[GEOLPRRegionInfo _readValidVehicleTypeKeys]((uint64_t)self);
  validVehicleTypeKeys = self->_validVehicleTypeKeys;

  return [(NSMutableArray *)validVehicleTypeKeys count];
}

- (id)validVehicleTypeKeysAtIndex:(unint64_t)a3
{
  -[GEOLPRRegionInfo _readValidVehicleTypeKeys]((uint64_t)self);
  validVehicleTypeKeys = self->_validVehicleTypeKeys;

  return (id)[(NSMutableArray *)validVehicleTypeKeys objectAtIndex:a3];
}

+ (Class)validVehicleTypeKeysType
{
  return (Class)objc_opt_class();
}

- (void)_readLicensePlateTemplate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRegionInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLicensePlateTemplate_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasLicensePlateTemplate
{
  return self->_licensePlateTemplate != 0;
}

- (NSString)licensePlateTemplate
{
  -[GEOLPRRegionInfo _readLicensePlateTemplate]((uint64_t)self);
  licensePlateTemplate = self->_licensePlateTemplate;

  return licensePlateTemplate;
}

- (void)setLicensePlateTemplate:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_licensePlateTemplate, a3);
}

- (void)_readLicensePlateValidationRules
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRegionInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLicensePlateValidationRules_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)licensePlateValidationRules
{
  -[GEOLPRRegionInfo _readLicensePlateValidationRules]((uint64_t)self);
  licensePlateValidationRules = self->_licensePlateValidationRules;

  return licensePlateValidationRules;
}

- (void)setLicensePlateValidationRules:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  licensePlateValidationRules = self->_licensePlateValidationRules;
  self->_licensePlateValidationRules = v4;
}

- (void)clearLicensePlateValidationRules
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  licensePlateValidationRules = self->_licensePlateValidationRules;

  [(NSMutableArray *)licensePlateValidationRules removeAllObjects];
}

- (void)addLicensePlateValidationRules:(id)a3
{
  id v4 = a3;
  -[GEOLPRRegionInfo _readLicensePlateValidationRules]((uint64_t)self);
  -[GEOLPRRegionInfo _addNoFlagsLicensePlateValidationRules:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsLicensePlateValidationRules:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)licensePlateValidationRulesCount
{
  -[GEOLPRRegionInfo _readLicensePlateValidationRules]((uint64_t)self);
  licensePlateValidationRules = self->_licensePlateValidationRules;

  return [(NSMutableArray *)licensePlateValidationRules count];
}

- (id)licensePlateValidationRulesAtIndex:(unint64_t)a3
{
  -[GEOLPRRegionInfo _readLicensePlateValidationRules]((uint64_t)self);
  licensePlateValidationRules = self->_licensePlateValidationRules;

  return (id)[(NSMutableArray *)licensePlateValidationRules objectAtIndex:a3];
}

+ (Class)licensePlateValidationRulesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRRegionInfo;
  id v4 = [(GEOLPRRegionInfo *)&v8 description];
  id v5 = [(GEOLPRRegionInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRRegionInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 24))
    {
      id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v6 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(unsigned int *)(*v6 + 4 * v7);
          if ((v8 - 1) >= 3)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_1E53E98E0[(int)v8 - 1];
          }
          [v5 addObject:v9];

          ++v7;
          objc_super v6 = (void *)(a1 + 16);
        }
        while (v7 < *(void *)(a1 + 24));
      }
      if (a2) {
        v10 = @"routingRequiredFields";
      }
      else {
        v10 = @"routing_required_fields";
      }
      [v4 setObject:v5 forKey:v10];
    }
    if (*(void *)(a1 + 56))
    {
      v11 = [(id)a1 validPowerTypeKeys];
      if (a2) {
        v12 = @"validPowerTypeKeys";
      }
      else {
        v12 = @"valid_power_type_keys";
      }
      [v4 setObject:v11 forKey:v12];
    }
    if (*(void *)(a1 + 64))
    {
      v13 = [(id)a1 validVehicleTypeKeys];
      if (a2) {
        v14 = @"validVehicleTypeKeys";
      }
      else {
        v14 = @"valid_vehicle_type_keys";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = [(id)a1 licensePlateTemplate];
    if (v15)
    {
      if (a2) {
        v16 = @"licensePlateTemplate";
      }
      else {
        v16 = @"license_plate_template";
      }
      [v4 setObject:v15 forKey:v16];
    }

    if ([*(id *)(a1 + 48) count])
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v18 = *(id *)(a1 + 48);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v28 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            v24 = [v23 dictionaryRepresentation];
            }
            [v17 addObject:v24];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v20);
      }

      if (a2) {
        v25 = @"licensePlateValidationRules";
      }
      else {
        v25 = @"license_plate_validation_rules";
      }
      [v4 setObject:v17 forKey:v25];
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
  return -[GEOLPRRegionInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRRegionInfo)initWithDictionary:(id)a3
{
  return (GEOLPRRegionInfo *)-[GEOLPRRegionInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    id v5 = (void *)[a1 init];
    if (v5)
    {
      if (a3) {
        objc_super v6 = @"routingRequiredFields";
      }
      else {
        objc_super v6 = @"routing_required_fields";
      }
      unint64_t v7 = [v4 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v50 = v4;
      if (objc_opt_isKindOfClass())
      {
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        v49 = v7;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v64 objects:v71 count:16];
        if (!v9) {
          goto LABEL_26;
        }
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v65;
        while (1)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v65 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v14 = v13;
              if ([v14 isEqualToString:@"LICENSE_PLATE"])
              {
                uint64_t v15 = 1;
              }
              else if ([v14 isEqualToString:@"POWER_TYPE"])
              {
                uint64_t v15 = 2;
              }
              else if ([v14 isEqualToString:@"VEHICLE_TYPE"])
              {
                uint64_t v15 = 3;
              }
              else
              {
                uint64_t v15 = 1;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v15 = [v13 intValue];
            }
            [v5 addRoutingRequiredFields:v15];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v64 objects:v71 count:16];
          if (!v10)
          {
LABEL_26:

            unint64_t v7 = v49;
            id v4 = v50;
            break;
          }
        }
      }

      if (a3) {
        v16 = @"validPowerTypeKeys";
      }
      else {
        v16 = @"valid_power_type_keys";
      }
      v17 = [v4 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v18 = v17;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v60 objects:v70 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v61;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v61 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = *(void **)(*((void *)&v60 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v24 = (void *)[v23 copy];
                [v5 addValidPowerTypeKeys:v24];
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v60 objects:v70 count:16];
          }
          while (v20);
        }
      }
      if (a3) {
        v25 = @"validVehicleTypeKeys";
      }
      else {
        v25 = @"valid_vehicle_type_keys";
      }
      v26 = [v4 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v27 = v26;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v56 objects:v69 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v57;
          do
          {
            for (uint64_t k = 0; k != v29; ++k)
            {
              if (*(void *)v57 != v30) {
                objc_enumerationMutation(v27);
              }
              uint64_t v32 = *(void **)(*((void *)&v56 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v33 = (void *)[v32 copy];
                [v5 addValidVehicleTypeKeys:v33];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v56 objects:v69 count:16];
          }
          while (v29);
        }
      }
      if (a3) {
        v34 = @"licensePlateTemplate";
      }
      else {
        v34 = @"license_plate_template";
      }
      v35 = [v4 objectForKeyedSubscript:v34];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v36 = (void *)[v35 copy];
        [v5 setLicensePlateTemplate:v36];
      }
      if (a3) {
        v37 = @"licensePlateValidationRules";
      }
      else {
        v37 = @"license_plate_validation_rules";
      }
      v38 = [v4 objectForKeyedSubscript:v37];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v39 = v38;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v52 objects:v68 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v53;
          do
          {
            for (uint64_t m = 0; m != v41; ++m)
            {
              if (*(void *)v53 != v42) {
                objc_enumerationMutation(v39);
              }
              uint64_t v44 = *(void *)(*((void *)&v52 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v45 = [GEOLPRLicensePlateValidationRule alloc];
                if (a3) {
                  uint64_t v46 = [(GEOLPRLicensePlateValidationRule *)v45 initWithJSON:v44];
                }
                else {
                  uint64_t v46 = [(GEOLPRLicensePlateValidationRule *)v45 initWithDictionary:v44];
                }
                v47 = (void *)v46;
                [v5 addLicensePlateValidationRules:v46];
              }
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v52 objects:v68 count:16];
          }
          while (v41);
        }

        id v4 = v50;
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (GEOLPRRegionInfo)initWithJSON:(id)a3
{
  return (GEOLPRRegionInfo *)-[GEOLPRRegionInfo _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_390;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_391;
    }
    GEOLPRRegionInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLPRRegionInfoCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRRegionInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRRegionInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLPRRegionInfoIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v19 = self->_reader;
    objc_sync_enter(v19);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v20 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v20];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLPRRegionInfo *)self readAll:0];
    if (self->_routingRequiredFields.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < self->_routingRequiredFields.count);
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    unint64_t v7 = self->_validPowerTypeKeys;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v8);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v11 = self->_validVehicleTypeKeys;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v12);
    }

    if (self->_licensePlateTemplate) {
      PBDataWriterWriteStringField();
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v15 = self->_licensePlateValidationRules;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t k = 0; k != v16; ++k)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v15);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
      }
      while (v16);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v19 = (id *)a3;
  [(GEOLPRRegionInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v19 + 1, self->_reader);
  *((_DWORD *)v19 + 18) = self->_readerMarkPos;
  *((_DWORD *)v19 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLPRRegionInfo *)self routingRequiredFieldsCount])
  {
    [v19 clearRoutingRequiredFields];
    unint64_t v4 = [(GEOLPRRegionInfo *)self routingRequiredFieldsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v19, "addRoutingRequiredFields:", -[GEOLPRRegionInfo routingRequiredFieldsAtIndex:](self, "routingRequiredFieldsAtIndex:", i));
    }
  }
  if ([(GEOLPRRegionInfo *)self validPowerTypeKeysCount])
  {
    [v19 clearValidPowerTypeKeys];
    unint64_t v7 = [(GEOLPRRegionInfo *)self validPowerTypeKeysCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        uint64_t v10 = [(GEOLPRRegionInfo *)self validPowerTypeKeysAtIndex:j];
        [v19 addValidPowerTypeKeys:v10];
      }
    }
  }
  if ([(GEOLPRRegionInfo *)self validVehicleTypeKeysCount])
  {
    [v19 clearValidVehicleTypeKeys];
    unint64_t v11 = [(GEOLPRRegionInfo *)self validVehicleTypeKeysCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
      {
        id v14 = [(GEOLPRRegionInfo *)self validVehicleTypeKeysAtIndex:k];
        [v19 addValidVehicleTypeKeys:v14];
      }
    }
  }
  if (self->_licensePlateTemplate) {
    objc_msgSend(v19, "setLicensePlateTemplate:");
  }
  if ([(GEOLPRRegionInfo *)self licensePlateValidationRulesCount])
  {
    [v19 clearLicensePlateValidationRules];
    unint64_t v15 = [(GEOLPRRegionInfo *)self licensePlateValidationRulesCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
      {
        id v18 = [(GEOLPRRegionInfo *)self licensePlateValidationRulesAtIndex:m];
        [v19 addLicensePlateValidationRules:v18];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLPRRegionInfoReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRRegionInfo *)self readAll:0];
  PBRepeatedInt32Copy();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unint64_t v8 = self->_validPowerTypeKeys;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * i) copyWithZone:a3];
        [v5 addValidPowerTypeKeys:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v9);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v13 = self->_validVehicleTypeKeys;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * j) copyWithZone:a3];
        [v5 addValidVehicleTypeKeys:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(NSString *)self->_licensePlateTemplate copyWithZone:a3];
  uint64_t v19 = (void *)v5[5];
  v5[5] = v18;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v20 = self->_licensePlateValidationRules;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v20);
        }
        long long v24 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * k), "copyWithZone:", a3, (void)v26);
        [v5 addLicensePlateValidationRules:v24];
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v21);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEOLPRRegionInfo *)self readAll:1],
        [v4 readAll:1],
        PBRepeatedInt32IsEqual())
    && ((validPowerTypeKeys = self->_validPowerTypeKeys, !((unint64_t)validPowerTypeKeys | v4[7]))
     || -[NSMutableArray isEqual:](validPowerTypeKeys, "isEqual:"))
    && ((validVehicleTypeKeys = self->_validVehicleTypeKeys, !((unint64_t)validVehicleTypeKeys | v4[8]))
     || -[NSMutableArray isEqual:](validVehicleTypeKeys, "isEqual:"))
    && ((licensePlateTemplate = self->_licensePlateTemplate, !((unint64_t)licensePlateTemplate | v4[5]))
     || -[NSString isEqual:](licensePlateTemplate, "isEqual:")))
  {
    licensePlateValidationRules = self->_licensePlateValidationRules;
    if ((unint64_t)licensePlateValidationRules | v4[6]) {
      char v9 = -[NSMutableArray isEqual:](licensePlateValidationRules, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  [(GEOLPRRegionInfo *)self readAll:1];
  uint64_t v3 = PBRepeatedInt32Hash();
  uint64_t v4 = [(NSMutableArray *)self->_validPowerTypeKeys hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_validVehicleTypeKeys hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_licensePlateTemplate hash];
  return v6 ^ [(NSMutableArray *)self->_licensePlateValidationRules hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  uint64_t v5 = [v4 routingRequiredFieldsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[GEOLPRRegionInfo addRoutingRequiredFields:](self, "addRoutingRequiredFields:", [v4 routingRequiredFieldsAtIndex:i]);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v4[7];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        [(GEOLPRRegionInfo *)self addValidPowerTypeKeys:*(void *)(*((void *)&v31 + 1) + 8 * j)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v10);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v4[8];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        [(GEOLPRRegionInfo *)self addValidVehicleTypeKeys:*(void *)(*((void *)&v27 + 1) + 8 * k)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v15);
  }

  if (v4[5]) {
    -[GEOLPRRegionInfo setLicensePlateTemplate:](self, "setLicensePlateTemplate:");
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = v4[6];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t m = 0; m != v20; ++m)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        -[GEOLPRRegionInfo addLicensePlateValidationRules:](self, "addLicensePlateValidationRules:", *(void *)(*((void *)&v23 + 1) + 8 * m), (void)v23);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v20);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validVehicleTypeKeys, 0);
  objc_storeStrong((id *)&self->_validPowerTypeKeys, 0);
  objc_storeStrong((id *)&self->_licensePlateValidationRules, 0);
  objc_storeStrong((id *)&self->_licensePlateTemplate, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end