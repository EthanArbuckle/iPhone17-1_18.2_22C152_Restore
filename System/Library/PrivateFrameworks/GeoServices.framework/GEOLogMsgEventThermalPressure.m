@interface GEOLogMsgEventThermalPressure
+ (BOOL)isValid:(id)a3;
- (BOOL)hasChargingState;
- (BOOL)hasCollectionTrigger;
- (BOOL)hasNavMapType;
- (BOOL)hasThermalPressure;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventThermalPressure)initWithDictionary:(id)a3;
- (GEOLogMsgEventThermalPressure)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)chargingStateAsString:(int)a3;
- (id)collectionTriggerAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)disableMapFeaturesAsString:(int)a3;
- (id)jsonRepresentation;
- (id)navMapTypeAsString:(int)a3;
- (int)StringAsChargingState:(id)a3;
- (int)StringAsCollectionTrigger:(id)a3;
- (int)StringAsDisableMapFeatures:(id)a3;
- (int)StringAsNavMapType:(id)a3;
- (int)chargingState;
- (int)collectionTrigger;
- (int)disableMapFeatures;
- (int)disableMapFeaturesAtIndex:(unint64_t)a3;
- (int)navMapType;
- (unint64_t)disableMapFeaturesCount;
- (unint64_t)hash;
- (unsigned)thermalPressure;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addDisableMapFeatures:(int)a3;
- (void)clearDisableMapFeatures;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setChargingState:(int)a3;
- (void)setCollectionTrigger:(int)a3;
- (void)setDisableMapFeatures:(int *)a3 count:(unint64_t)a4;
- (void)setHasChargingState:(BOOL)a3;
- (void)setHasCollectionTrigger:(BOOL)a3;
- (void)setHasNavMapType:(BOOL)a3;
- (void)setHasThermalPressure:(BOOL)a3;
- (void)setNavMapType:(int)a3;
- (void)setThermalPressure:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventThermalPressure

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOLogMsgEventThermalPressure;
  [(GEOLogMsgEventThermalPressure *)&v3 dealloc];
}

- (unsigned)thermalPressure
{
  return self->_thermalPressure;
}

- (void)setThermalPressure:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_thermalPressure = a3;
}

- (void)setHasThermalPressure:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasThermalPressure
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unint64_t)disableMapFeaturesCount
{
  return self->_disableMapFeatures.count;
}

- (int)disableMapFeatures
{
  return self->_disableMapFeatures.list;
}

- (void)clearDisableMapFeatures
{
}

- (void)addDisableMapFeatures:(int)a3
{
}

- (int)disableMapFeaturesAtIndex:(unint64_t)a3
{
  p_disableMapFeatures = &self->_disableMapFeatures;
  unint64_t count = self->_disableMapFeatures.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_disableMapFeatures->list[a3];
}

- (void)setDisableMapFeatures:(int *)a3 count:(unint64_t)a4
{
}

- (id)disableMapFeaturesAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7C40[a3];
  }

  return v3;
}

- (int)StringAsDisableMapFeatures:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MAP_FEATURE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MAP_FEATURE_TREES"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MAP_FEATURE_SHADOWS"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)navMapType
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_navMapType;
  }
  else {
    return 0;
  }
}

- (void)setNavMapType:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_navMapType = a3;
}

- (void)setHasNavMapType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasNavMapType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)navMapTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7C58[a3];
  }

  return v3;
}

- (int)StringAsNavMapType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NAV_MAP_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NAV_MAP_TYPE_MODERN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NAV_MAP_TYPE_ADVANCED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NAV_MAP_TYPE_MERCATOR"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)collectionTrigger
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_collectionTrigger;
  }
  else {
    return 0;
  }
}

- (void)setCollectionTrigger:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_collectionTrigger = a3;
}

- (void)setHasCollectionTrigger:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCollectionTrigger
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)collectionTriggerAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7C78[a3];
  }

  return v3;
}

- (int)StringAsCollectionTrigger:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"COLLECTION_TRIGGER_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COLLECTION_TRIGGER_START_NAV"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"COLLECTION_TRIGGER_END_NAV"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"COLLECTION_TRIGGER_THERMAL_PRESSURE_DELTA"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CHARGING_STATE_CHANGE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)chargingState
{
  if (*(unsigned char *)&self->_flags) {
    return self->_chargingState;
  }
  else {
    return 0;
  }
}

- (void)setChargingState:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_chargingState = a3;
}

- (void)setHasChargingState:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasChargingState
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)chargingStateAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F7CA0[a3];
  }

  return v3;
}

- (int)StringAsChargingState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CHARGING_STATE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CHARGING_STATE_NOT_CHARGING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CHARGING_STATE_WIRED_CHARGING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CHARGING_STATE_WIRELESS_CHARGING"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventThermalPressure;
  int v4 = [(GEOLogMsgEventThermalPressure *)&v8 description];
  v5 = [(GEOLogMsgEventThermalPressure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventThermalPressure _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_43;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)(a1 + 48) & 8) != 0)
  {
    v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 44)];
    if (a2) {
      v6 = @"thermalPressure";
    }
    else {
      v6 = @"thermal_pressure";
    }
    [v4 setObject:v5 forKey:v6];
  }
  if (*(void *)(a1 + 16))
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    objc_super v8 = (void *)(a1 + 8);
    if (*(void *)(a1 + 16))
    {
      unint64_t v9 = 0;
      do
      {
        uint64_t v10 = *(int *)(*v8 + 4 * v9);
        if (v10 >= 3)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = off_1E53F7C40[v10];
        }
        [v7 addObject:v11];

        ++v9;
        objc_super v8 = (void *)(a1 + 8);
      }
      while (v9 < *(void *)(a1 + 16));
    }
    if (a2) {
      v12 = @"disableMapFeatures";
    }
    else {
      v12 = @"disable_map_features";
    }
    [v4 setObject:v7 forKey:v12];
  }
  char v13 = *(unsigned char *)(a1 + 48);
  if ((v13 & 4) == 0)
  {
    if ((*(unsigned char *)(a1 + 48) & 2) == 0) {
      goto LABEL_20;
    }
LABEL_29:
    uint64_t v17 = *(int *)(a1 + 36);
    if (v17 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 36));
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E53F7C78[v17];
    }
    if (a2) {
      v19 = @"collectionTrigger";
    }
    else {
      v19 = @"collection_trigger";
    }
    [v4 setObject:v18 forKey:v19];

    if ((*(unsigned char *)(a1 + 48) & 1) == 0) {
      goto LABEL_43;
    }
    goto LABEL_36;
  }
  uint64_t v14 = *(int *)(a1 + 40);
  if (v14 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 40));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_1E53F7C58[v14];
  }
  if (a2) {
    v16 = @"navMapType";
  }
  else {
    v16 = @"nav_map_type";
  }
  [v4 setObject:v15 forKey:v16];

  char v13 = *(unsigned char *)(a1 + 48);
  if ((v13 & 2) != 0) {
    goto LABEL_29;
  }
LABEL_20:
  if (v13)
  {
LABEL_36:
    uint64_t v20 = *(int *)(a1 + 32);
    if (v20 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E53F7CA0[v20];
    }
    if (a2) {
      v22 = @"chargingState";
    }
    else {
      v22 = @"charging_state";
    }
    [v4 setObject:v21 forKey:v22];
  }
LABEL_43:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventThermalPressure _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventThermalPressure)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventThermalPressure *)-[GEOLogMsgEventThermalPressure _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"thermalPressure";
      }
      else {
        v6 = @"thermal_pressure";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setThermalPressure:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"disableMapFeatures";
      }
      else {
        objc_super v8 = @"disable_map_features";
      }
      unint64_t v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v32 = v5;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v31 = v9;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (!v11) {
          goto LABEL_31;
        }
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v34;
        while (1)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v34 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v16 = v15;
              if ([v16 isEqualToString:@"MAP_FEATURE_UNKNOWN"])
              {
                uint64_t v17 = 0;
              }
              else if ([v16 isEqualToString:@"MAP_FEATURE_TREES"])
              {
                uint64_t v17 = 1;
              }
              else if ([v16 isEqualToString:@"MAP_FEATURE_SHADOWS"])
              {
                uint64_t v17 = 2;
              }
              else
              {
                uint64_t v17 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v17 = [v15 intValue];
            }
            [a1 addDisableMapFeatures:v17];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (!v12)
          {
LABEL_31:

            id v5 = v32;
            unint64_t v9 = v31;
            break;
          }
        }
      }

      if (a3) {
        v18 = @"navMapType";
      }
      else {
        v18 = @"nav_map_type";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = v19;
        if ([v20 isEqualToString:@"NAV_MAP_TYPE_UNKNOWN"])
        {
          uint64_t v21 = 0;
        }
        else if ([v20 isEqualToString:@"NAV_MAP_TYPE_MODERN"])
        {
          uint64_t v21 = 1;
        }
        else if ([v20 isEqualToString:@"NAV_MAP_TYPE_ADVANCED"])
        {
          uint64_t v21 = 2;
        }
        else if ([v20 isEqualToString:@"NAV_MAP_TYPE_MERCATOR"])
        {
          uint64_t v21 = 3;
        }
        else
        {
          uint64_t v21 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_49;
        }
        uint64_t v21 = [v19 intValue];
      }
      [a1 setNavMapType:v21];
LABEL_49:

      if (a3) {
        v22 = @"collectionTrigger";
      }
      else {
        v22 = @"collection_trigger";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = v23;
        if ([v24 isEqualToString:@"COLLECTION_TRIGGER_UNKNOWN"])
        {
          uint64_t v25 = 0;
        }
        else if ([v24 isEqualToString:@"COLLECTION_TRIGGER_START_NAV"])
        {
          uint64_t v25 = 1;
        }
        else if ([v24 isEqualToString:@"COLLECTION_TRIGGER_END_NAV"])
        {
          uint64_t v25 = 2;
        }
        else if ([v24 isEqualToString:@"COLLECTION_TRIGGER_THERMAL_PRESSURE_DELTA"])
        {
          uint64_t v25 = 3;
        }
        else if ([v24 isEqualToString:@"CHARGING_STATE_CHANGE"])
        {
          uint64_t v25 = 4;
        }
        else
        {
          uint64_t v25 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_68;
        }
        uint64_t v25 = [v23 intValue];
      }
      [a1 setCollectionTrigger:v25];
LABEL_68:

      if (a3) {
        v26 = @"chargingState";
      }
      else {
        v26 = @"charging_state";
      }
      v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v28 = v27;
        if ([v28 isEqualToString:@"CHARGING_STATE_UNKNOWN"])
        {
          uint64_t v29 = 0;
        }
        else if ([v28 isEqualToString:@"CHARGING_STATE_NOT_CHARGING"])
        {
          uint64_t v29 = 1;
        }
        else if ([v28 isEqualToString:@"CHARGING_STATE_WIRED_CHARGING"])
        {
          uint64_t v29 = 2;
        }
        else if ([v28 isEqualToString:@"CHARGING_STATE_WIRELESS_CHARGING"])
        {
          uint64_t v29 = 3;
        }
        else
        {
          uint64_t v29 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_85:

          goto LABEL_86;
        }
        uint64_t v29 = [v27 intValue];
      }
      [a1 setChargingState:v29];
      goto LABEL_85;
    }
  }
LABEL_86:

  return a1;
}

- (GEOLogMsgEventThermalPressure)initWithJSON:(id)a3
{
  return (GEOLogMsgEventThermalPressure *)-[GEOLogMsgEventThermalPressure _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventThermalPressureIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventThermalPressureReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
  if (self->_disableMapFeatures.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v7;
      ++v5;
    }
    while (v5 < self->_disableMapFeatures.count);
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_8:
      if ((flags & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_8;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_9:
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
LABEL_10:
}

- (void)copyTo:(id)a3
{
  objc_super v8 = a3;
  [(GEOLogMsgEventThermalPressure *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    v8[11] = self->_thermalPressure;
    *((unsigned char *)v8 + 48) |= 8u;
  }
  if ([(GEOLogMsgEventThermalPressure *)self disableMapFeaturesCount])
  {
    [v8 clearDisableMapFeatures];
    unint64_t v4 = [(GEOLogMsgEventThermalPressure *)self disableMapFeaturesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v8, "addDisableMapFeatures:", -[GEOLogMsgEventThermalPressure disableMapFeaturesAtIndex:](self, "disableMapFeaturesAtIndex:", i));
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v8[10] = self->_navMapType;
    *((unsigned char *)v8 + 48) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_9:
      if ((flags & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_9;
  }
  v8[9] = self->_collectionTrigger;
  *((unsigned char *)v8 + 48) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_10:
    v8[8] = self->_chargingState;
    *((unsigned char *)v8 + 48) |= 1u;
  }
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v4 + 44) = self->_thermalPressure;
    *(unsigned char *)(v4 + 48) |= 8u;
  }
  PBRepeatedInt32Copy();
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(_DWORD *)(v5 + 36) = self->_collectionTrigger;
    *(unsigned char *)(v5 + 48) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_6;
  }
  *(_DWORD *)(v5 + 40) = self->_navMapType;
  *(unsigned char *)(v5 + 48) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if (flags)
  {
LABEL_6:
    *(_DWORD *)(v5 + 32) = self->_chargingState;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  [(GEOLogMsgEventThermalPressure *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_thermalPressure != *((_DWORD *)v4 + 11)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_22;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_22:
    BOOL v5 = 0;
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_navMapType != *((_DWORD *)v4 + 10)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_collectionTrigger != *((_DWORD *)v4 + 9)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_22;
  }
  BOOL v5 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_chargingState != *((_DWORD *)v4 + 8)) {
      goto LABEL_22;
    }
    BOOL v5 = 1;
  }
LABEL_23:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventThermalPressure *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v3 = 2654435761 * self->_thermalPressure;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_navMapType;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_collectionTrigger;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_chargingState;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  if ((*((unsigned char *)v8 + 48) & 8) != 0)
  {
    self->_thermalPressure = *((_DWORD *)v8 + 11);
    *(unsigned char *)&self->_flags |= 8u;
  }
  uint64_t v4 = [v8 disableMapFeaturesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOLogMsgEventThermalPressure addDisableMapFeatures:](self, "addDisableMapFeatures:", [v8 disableMapFeaturesAtIndex:i]);
  }
  char v7 = *((unsigned char *)v8 + 48);
  if ((v7 & 4) != 0)
  {
    self->_navMapType = *((_DWORD *)v8 + 10);
    *(unsigned char *)&self->_flags |= 4u;
    char v7 = *((unsigned char *)v8 + 48);
    if ((v7 & 2) == 0)
    {
LABEL_8:
      if ((v7 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*((unsigned char *)v8 + 48) & 2) == 0)
  {
    goto LABEL_8;
  }
  self->_collectionTrigger = *((_DWORD *)v8 + 9);
  *(unsigned char *)&self->_flags |= 2u;
  if (*((unsigned char *)v8 + 48))
  {
LABEL_9:
    self->_chargingState = *((_DWORD *)v8 + 8);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_10:
}

@end