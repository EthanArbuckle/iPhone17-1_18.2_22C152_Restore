@interface GEOEVInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasChargerPlugsInfo;
- (BOOL)hasChargingArguments;
- (BOOL)hasConsumptionArguments;
- (BOOL)hasCriticalBatteryCharge;
- (BOOL)hasCurrentBatteryCharge;
- (BOOL)hasCurrentBatteryPercentage;
- (BOOL)hasIsCharging;
- (BOOL)hasLastSocUpdateDate;
- (BOOL)hasLowBatteryCharge;
- (BOOL)hasMaxBatteryCharge;
- (BOOL)hasMaxRange;
- (BOOL)hasMinBatteryCharge;
- (BOOL)hasVehicleArguments;
- (BOOL)hasVehicleIdentifier;
- (BOOL)isCharging;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOChargerPlugsInfo)chargerPlugsInfo;
- (GEOEVInfo)init;
- (GEOEVInfo)initWithData:(id)a3;
- (GEOEVInfo)initWithDictionary:(id)a3;
- (GEOEVInfo)initWithJSON:(id)a3;
- (NSString)chargingArguments;
- (NSString)consumptionArguments;
- (NSString)vehicleArguments;
- (NSString)vehicleIdentifier;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)criticalBatteryCharge;
- (unsigned)currentBatteryCharge;
- (unsigned)currentBatteryPercentage;
- (unsigned)lastSocUpdateDate;
- (unsigned)lowBatteryCharge;
- (unsigned)maxBatteryCharge;
- (unsigned)maxRange;
- (unsigned)minBatteryCharge;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readChargerPlugsInfo;
- (void)_readChargingArguments;
- (void)_readConsumptionArguments;
- (void)_readVehicleArguments;
- (void)_readVehicleIdentifier;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setChargerPlugsInfo:(id)a3;
- (void)setChargingArguments:(id)a3;
- (void)setConsumptionArguments:(id)a3;
- (void)setCriticalBatteryCharge:(unsigned int)a3;
- (void)setCurrentBatteryCharge:(unsigned int)a3;
- (void)setCurrentBatteryPercentage:(unsigned int)a3;
- (void)setHasCriticalBatteryCharge:(BOOL)a3;
- (void)setHasCurrentBatteryCharge:(BOOL)a3;
- (void)setHasCurrentBatteryPercentage:(BOOL)a3;
- (void)setHasIsCharging:(BOOL)a3;
- (void)setHasLastSocUpdateDate:(BOOL)a3;
- (void)setHasLowBatteryCharge:(BOOL)a3;
- (void)setHasMaxBatteryCharge:(BOOL)a3;
- (void)setHasMaxRange:(BOOL)a3;
- (void)setHasMinBatteryCharge:(BOOL)a3;
- (void)setIsCharging:(BOOL)a3;
- (void)setLastSocUpdateDate:(unsigned int)a3;
- (void)setLowBatteryCharge:(unsigned int)a3;
- (void)setMaxBatteryCharge:(unsigned int)a3;
- (void)setMaxRange:(unsigned int)a3;
- (void)setMinBatteryCharge:(unsigned int)a3;
- (void)setVehicleArguments:(id)a3;
- (void)setVehicleIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOEVInfo

- (GEOEVInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOEVInfo;
  v2 = [(GEOEVInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOEVInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOEVInfo;
  v3 = [(GEOEVInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)currentBatteryPercentage
{
  return self->_currentBatteryPercentage;
}

- (void)setCurrentBatteryPercentage:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8004u;
  self->_currentBatteryPercentage = a3;
}

- (void)setHasCurrentBatteryPercentage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32764;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasCurrentBatteryPercentage
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)maxRange
{
  return self->_maxRange;
}

- (void)setMaxRange:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8040u;
  self->_maxRange = a3;
}

- (void)setHasMaxRange:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32704;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasMaxRange
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (void)_readConsumptionArguments
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 112) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOEVInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readConsumptionArguments_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasConsumptionArguments
{
  return self->_consumptionArguments != 0;
}

- (NSString)consumptionArguments
{
  -[GEOEVInfo _readConsumptionArguments]((uint64_t)self);
  consumptionArguments = self->_consumptionArguments;

  return consumptionArguments;
}

- (void)setConsumptionArguments:(id)a3
{
  *(_WORD *)&self->_flags |= 0x9000u;
  objc_storeStrong((id *)&self->_consumptionArguments, a3);
}

- (void)_readChargingArguments
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 112) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOEVInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChargingArguments_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasChargingArguments
{
  return self->_chargingArguments != 0;
}

- (NSString)chargingArguments
{
  -[GEOEVInfo _readChargingArguments]((uint64_t)self);
  chargingArguments = self->_chargingArguments;

  return chargingArguments;
}

- (void)setChargingArguments:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8800u;
  objc_storeStrong((id *)&self->_chargingArguments, a3);
}

- (unsigned)currentBatteryCharge
{
  return self->_currentBatteryCharge;
}

- (void)setCurrentBatteryCharge:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8002u;
  self->_currentBatteryCharge = a3;
}

- (void)setHasCurrentBatteryCharge:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32766;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasCurrentBatteryCharge
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unsigned)maxBatteryCharge
{
  return self->_maxBatteryCharge;
}

- (void)setMaxBatteryCharge:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8020u;
  self->_maxBatteryCharge = a3;
}

- (void)setHasMaxBatteryCharge:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32736;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasMaxBatteryCharge
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (BOOL)isCharging
{
  return self->_isCharging;
}

- (void)setIsCharging:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x8100u;
  self->_isCharging = a3;
}

- (void)setHasIsCharging:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32512;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasIsCharging
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (unsigned)minBatteryCharge
{
  return self->_minBatteryCharge;
}

- (void)setMinBatteryCharge:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8080u;
  self->_minBatteryCharge = a3;
}

- (void)setHasMinBatteryCharge:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32640;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasMinBatteryCharge
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (void)_readVehicleIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 112) & 0x4000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOEVInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVehicleIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasVehicleIdentifier
{
  return self->_vehicleIdentifier != 0;
}

- (NSString)vehicleIdentifier
{
  -[GEOEVInfo _readVehicleIdentifier]((uint64_t)self);
  vehicleIdentifier = self->_vehicleIdentifier;

  return vehicleIdentifier;
}

- (void)setVehicleIdentifier:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC000u;
  objc_storeStrong((id *)&self->_vehicleIdentifier, a3);
}

- (void)_readChargerPlugsInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 112) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOEVInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChargerPlugsInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasChargerPlugsInfo
{
  return self->_chargerPlugsInfo != 0;
}

- (GEOChargerPlugsInfo)chargerPlugsInfo
{
  -[GEOEVInfo _readChargerPlugsInfo]((uint64_t)self);
  chargerPlugsInfo = self->_chargerPlugsInfo;

  return chargerPlugsInfo;
}

- (void)setChargerPlugsInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8400u;
  objc_storeStrong((id *)&self->_chargerPlugsInfo, a3);
}

- (unsigned)lastSocUpdateDate
{
  return self->_lastSocUpdateDate;
}

- (void)setLastSocUpdateDate:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8008u;
  self->_lastSocUpdateDate = a3;
}

- (void)setHasLastSocUpdateDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32760;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasLastSocUpdateDate
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unsigned)lowBatteryCharge
{
  return self->_lowBatteryCharge;
}

- (void)setLowBatteryCharge:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8010u;
  self->_lowBatteryCharge = a3;
}

- (void)setHasLowBatteryCharge:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32752;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasLowBatteryCharge
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unsigned)criticalBatteryCharge
{
  return self->_criticalBatteryCharge;
}

- (void)setCriticalBatteryCharge:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8001u;
  self->_criticalBatteryCharge = a3;
}

- (void)setHasCriticalBatteryCharge:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0x7FFE | a3 | 0x8000;
}

- (BOOL)hasCriticalBatteryCharge
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readVehicleArguments
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 112) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOEVInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVehicleArguments_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasVehicleArguments
{
  return self->_vehicleArguments != 0;
}

- (NSString)vehicleArguments
{
  -[GEOEVInfo _readVehicleArguments]((uint64_t)self);
  vehicleArguments = self->_vehicleArguments;

  return vehicleArguments;
}

- (void)setVehicleArguments:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA000u;
  objc_storeStrong((id *)&self->_vehicleArguments, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOEVInfo;
  v4 = [(GEOEVInfo *)&v8 description];
  v5 = [(GEOEVInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOEVInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_69;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 112);
  if ((v5 & 4) != 0)
  {
    objc_super v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
    if (a2) {
      objc_super v7 = @"currentBatteryPercentage";
    }
    else {
      objc_super v7 = @"current_battery_percentage";
    }
    [v4 setObject:v6 forKey:v7];

    __int16 v5 = *(_WORD *)(a1 + 112);
  }
  if ((v5 & 0x40) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 100)];
    if (a2) {
      v9 = @"maxRange";
    }
    else {
      v9 = @"max_range";
    }
    [v4 setObject:v8 forKey:v9];
  }
  v10 = [(id)a1 consumptionArguments];
  if (v10)
  {
    if (a2) {
      v11 = @"consumptionArguments";
    }
    else {
      v11 = @"consumption_arguments";
    }
    [v4 setObject:v10 forKey:v11];
  }

  v12 = [(id)a1 chargingArguments];
  if (v12)
  {
    if (a2) {
      v13 = @"chargingArguments";
    }
    else {
      v13 = @"charging_arguments";
    }
    [v4 setObject:v12 forKey:v13];
  }

  __int16 v14 = *(_WORD *)(a1 + 112);
  if ((v14 & 2) != 0)
  {
    v23 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 80)];
    if (a2) {
      v24 = @"currentBatteryCharge";
    }
    else {
      v24 = @"current_battery_charge";
    }
    [v4 setObject:v23 forKey:v24];

    __int16 v14 = *(_WORD *)(a1 + 112);
    if ((v14 & 0x20) == 0)
    {
LABEL_24:
      if ((v14 & 0x100) == 0) {
        goto LABEL_25;
      }
      goto LABEL_46;
    }
  }
  else if ((v14 & 0x20) == 0)
  {
    goto LABEL_24;
  }
  v25 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 96)];
  if (a2) {
    v26 = @"maxBatteryCharge";
  }
  else {
    v26 = @"max_battery_charge";
  }
  [v4 setObject:v25 forKey:v26];

  __int16 v14 = *(_WORD *)(a1 + 112);
  if ((v14 & 0x100) == 0)
  {
LABEL_25:
    if ((v14 & 0x80) == 0) {
      goto LABEL_30;
    }
    goto LABEL_26;
  }
LABEL_46:
  v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 108)];
  if (a2) {
    v28 = @"isCharging";
  }
  else {
    v28 = @"is_charging";
  }
  [v4 setObject:v27 forKey:v28];

  if ((*(_WORD *)(a1 + 112) & 0x80) != 0)
  {
LABEL_26:
    v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 104)];
    if (a2) {
      v16 = @"minBatteryCharge";
    }
    else {
      v16 = @"min_battery_charge";
    }
    [v4 setObject:v15 forKey:v16];
  }
LABEL_30:
  v17 = [(id)a1 vehicleIdentifier];
  if (v17)
  {
    if (a2) {
      v18 = @"vehicleIdentifier";
    }
    else {
      v18 = @"vehicle_identifier";
    }
    [v4 setObject:v17 forKey:v18];
  }

  v19 = [(id)a1 chargerPlugsInfo];
  v20 = v19;
  if (v19)
  {
    if (a2)
    {
      v21 = [v19 jsonRepresentation];
      v22 = @"chargerPlugsInfo";
    }
    else
    {
      v21 = [v19 dictionaryRepresentation];
      v22 = @"charger_plugs_info";
    }
    [v4 setObject:v21 forKey:v22];
  }
  __int16 v29 = *(_WORD *)(a1 + 112);
  if ((v29 & 8) == 0)
  {
    if ((v29 & 0x10) == 0) {
      goto LABEL_55;
    }
LABEL_76:
    v43 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
    if (a2) {
      v44 = @"lowBatteryCharge";
    }
    else {
      v44 = @"low_battery_charge";
    }
    [v4 setObject:v43 forKey:v44];

    if ((*(_WORD *)(a1 + 112) & 1) == 0) {
      goto LABEL_60;
    }
    goto LABEL_56;
  }
  v41 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 88)];
  if (a2) {
    v42 = @"lastSocUpdateDate";
  }
  else {
    v42 = @"last_soc_update_date";
  }
  [v4 setObject:v41 forKey:v42];

  __int16 v29 = *(_WORD *)(a1 + 112);
  if ((v29 & 0x10) != 0) {
    goto LABEL_76;
  }
LABEL_55:
  if (v29)
  {
LABEL_56:
    v30 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
    if (a2) {
      v31 = @"criticalBatteryCharge";
    }
    else {
      v31 = @"critical_battery_charge";
    }
    [v4 setObject:v30 forKey:v31];
  }
LABEL_60:
  v32 = [(id)a1 vehicleArguments];
  if (v32)
  {
    if (a2) {
      v33 = @"vehicleArguments";
    }
    else {
      v33 = @"vehicle_arguments";
    }
    [v4 setObject:v32 forKey:v33];
  }

  v34 = *(void **)(a1 + 16);
  if (v34)
  {
    v35 = [v34 dictionaryRepresentation];
    v36 = v35;
    if (a2)
    {
      v37 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v35, "count"));
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __39__GEOEVInfo__dictionaryRepresentation___block_invoke;
      v45[3] = &unk_1E53D8860;
      id v38 = v37;
      id v46 = v38;
      [v36 enumerateKeysAndObjectsUsingBlock:v45];
      id v39 = v38;

      v36 = v39;
    }
    [v4 setObject:v36 forKey:@"Unknown Fields"];
  }
LABEL_69:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOEVInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __39__GEOEVInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEOEVInfo)initWithDictionary:(id)a3
{
  return (GEOEVInfo *)-[GEOEVInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"currentBatteryPercentage";
      }
      else {
        objc_super v6 = @"current_battery_percentage";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCurrentBatteryPercentage:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"maxRange";
      }
      else {
        objc_super v8 = @"max_range";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMaxRange:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        id v10 = @"consumptionArguments";
      }
      else {
        id v10 = @"consumption_arguments";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = (void *)[v11 copy];
        [a1 setConsumptionArguments:v12];
      }
      if (a3) {
        v13 = @"chargingArguments";
      }
      else {
        v13 = @"charging_arguments";
      }
      __int16 v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = (void *)[v14 copy];
        [a1 setChargingArguments:v15];
      }
      if (a3) {
        v16 = @"currentBatteryCharge";
      }
      else {
        v16 = @"current_battery_charge";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCurrentBatteryCharge:", objc_msgSend(v17, "unsignedIntValue"));
      }

      if (a3) {
        v18 = @"maxBatteryCharge";
      }
      else {
        v18 = @"max_battery_charge";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMaxBatteryCharge:", objc_msgSend(v19, "unsignedIntValue"));
      }

      if (a3) {
        v20 = @"isCharging";
      }
      else {
        v20 = @"is_charging";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsCharging:", objc_msgSend(v21, "BOOLValue"));
      }

      if (a3) {
        v22 = @"minBatteryCharge";
      }
      else {
        v22 = @"min_battery_charge";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMinBatteryCharge:", objc_msgSend(v23, "unsignedIntValue"));
      }

      if (a3) {
        v24 = @"vehicleIdentifier";
      }
      else {
        v24 = @"vehicle_identifier";
      }
      v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v26 = (void *)[v25 copy];
        [a1 setVehicleIdentifier:v26];
      }
      if (a3) {
        v27 = @"chargerPlugsInfo";
      }
      else {
        v27 = @"charger_plugs_info";
      }
      v28 = [v5 objectForKeyedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v29 = [GEOChargerPlugsInfo alloc];
        if (a3) {
          uint64_t v30 = [(GEOChargerPlugsInfo *)v29 initWithJSON:v28];
        }
        else {
          uint64_t v30 = [(GEOChargerPlugsInfo *)v29 initWithDictionary:v28];
        }
        v31 = (void *)v30;
        [a1 setChargerPlugsInfo:v30];
      }
      if (a3) {
        v32 = @"lastSocUpdateDate";
      }
      else {
        v32 = @"last_soc_update_date";
      }
      v33 = [v5 objectForKeyedSubscript:v32];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLastSocUpdateDate:", objc_msgSend(v33, "unsignedIntValue"));
      }

      if (a3) {
        v34 = @"lowBatteryCharge";
      }
      else {
        v34 = @"low_battery_charge";
      }
      v35 = [v5 objectForKeyedSubscript:v34];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLowBatteryCharge:", objc_msgSend(v35, "unsignedIntValue"));
      }

      if (a3) {
        v36 = @"criticalBatteryCharge";
      }
      else {
        v36 = @"critical_battery_charge";
      }
      v37 = [v5 objectForKeyedSubscript:v36];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCriticalBatteryCharge:", objc_msgSend(v37, "unsignedIntValue"));
      }

      if (a3) {
        id v38 = @"vehicleArguments";
      }
      else {
        id v38 = @"vehicle_arguments";
      }
      id v39 = [v5 objectForKeyedSubscript:v38];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v40 = (void *)[v39 copy];
        [a1 setVehicleArguments:v40];
      }
    }
  }

  return a1;
}

- (GEOEVInfo)initWithJSON:(id)a3
{
  return (GEOEVInfo *)-[GEOEVInfo _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_1868;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1869;
    }
    GEOEVInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOChargerPlugsInfo *)self->_chargerPlugsInfo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOEVInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOEVInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOEVInfoIsDirty((uint64_t)self) & 1) == 0)
  {
    v9 = self->_reader;
    objc_sync_enter(v9);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v11 writeData:v10];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
    goto LABEL_35;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOEVInfo *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 flags = (__int16)self->_flags;
  }
  id v6 = v11;
  if ((flags & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v6 = v11;
  }
  if (self->_consumptionArguments)
  {
    PBDataWriterWriteStringField();
    id v6 = v11;
  }
  if (self->_chargingArguments)
  {
    PBDataWriterWriteStringField();
    id v6 = v11;
  }
  __int16 v7 = (__int16)self->_flags;
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v6 = v11;
    __int16 v7 = (__int16)self->_flags;
    if ((v7 & 0x20) == 0)
    {
LABEL_13:
      if ((v7 & 0x100) == 0) {
        goto LABEL_14;
      }
      goto LABEL_29;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  id v6 = v11;
  __int16 v7 = (__int16)self->_flags;
  if ((v7 & 0x100) == 0)
  {
LABEL_14:
    if ((v7 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  id v6 = v11;
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
LABEL_15:
    PBDataWriterWriteUint32Field();
    id v6 = v11;
  }
LABEL_16:
  if (self->_vehicleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v6 = v11;
  }
  if (self->_chargerPlugsInfo)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v11;
  }
  __int16 v8 = (__int16)self->_flags;
  if ((v8 & 8) == 0)
  {
    if ((v8 & 0x10) == 0) {
      goto LABEL_22;
    }
LABEL_32:
    PBDataWriterWriteUint32Field();
    id v6 = v11;
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  PBDataWriterWriteUint32Field();
  id v6 = v11;
  __int16 v8 = (__int16)self->_flags;
  if ((v8 & 0x10) != 0) {
    goto LABEL_32;
  }
LABEL_22:
  if (v8)
  {
LABEL_23:
    PBDataWriterWriteUint32Field();
    id v6 = v11;
  }
LABEL_24:
  if (self->_vehicleArguments)
  {
    PBDataWriterWriteStringField();
    id v6 = v11;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
LABEL_35:
}

- (void)copyTo:(id)a3
{
  __int16 v8 = (id *)a3;
  [(GEOEVInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 16) = self->_readerMarkPos;
  *((_DWORD *)v8 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v8;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v8 + 21) = self->_currentBatteryPercentage;
    *((_WORD *)v8 + 56) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 0x40) != 0)
  {
    *((_DWORD *)v8 + 25) = self->_maxRange;
    *((_WORD *)v8 + 56) |= 0x40u;
  }
  if (self->_consumptionArguments)
  {
    objc_msgSend(v8, "setConsumptionArguments:");
    v4 = v8;
  }
  if (self->_chargingArguments)
  {
    objc_msgSend(v8, "setChargingArguments:");
    v4 = v8;
  }
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_currentBatteryCharge;
    *((_WORD *)v4 + 56) |= 2u;
    __int16 v6 = (__int16)self->_flags;
    if ((v6 & 0x20) == 0)
    {
LABEL_11:
      if ((v6 & 0x100) == 0) {
        goto LABEL_12;
      }
      goto LABEL_29;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v4 + 24) = self->_maxBatteryCharge;
  *((_WORD *)v4 + 56) |= 0x20u;
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x100) == 0)
  {
LABEL_12:
    if ((v6 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_29:
  *((unsigned char *)v4 + 108) = self->_isCharging;
  *((_WORD *)v4 + 56) |= 0x100u;
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 26) = self->_minBatteryCharge;
    *((_WORD *)v4 + 56) |= 0x80u;
  }
LABEL_14:
  if (self->_vehicleIdentifier)
  {
    objc_msgSend(v8, "setVehicleIdentifier:");
    v4 = v8;
  }
  if (self->_chargerPlugsInfo)
  {
    objc_msgSend(v8, "setChargerPlugsInfo:");
    v4 = v8;
  }
  __int16 v7 = (__int16)self->_flags;
  if ((v7 & 8) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_lastSocUpdateDate;
    *((_WORD *)v4 + 56) |= 8u;
    __int16 v7 = (__int16)self->_flags;
    if ((v7 & 0x10) == 0)
    {
LABEL_20:
      if ((v7 & 1) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_20;
  }
  *((_DWORD *)v4 + 23) = self->_lowBatteryCharge;
  *((_WORD *)v4 + 56) |= 0x10u;
  if (*(_WORD *)&self->_flags)
  {
LABEL_21:
    *((_DWORD *)v4 + 19) = self->_criticalBatteryCharge;
    *((_WORD *)v4 + 56) |= 1u;
  }
LABEL_22:
  if (self->_vehicleArguments)
  {
    objc_msgSend(v8, "setVehicleArguments:");
    v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOEVInfo *)self readAll:0];
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      *(_DWORD *)(v5 + 84) = self->_currentBatteryPercentage;
      *(_WORD *)(v5 + 112) |= 4u;
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x40) != 0)
    {
      *(_DWORD *)(v5 + 100) = self->_maxRange;
      *(_WORD *)(v5 + 112) |= 0x40u;
    }
    uint64_t v10 = [(NSString *)self->_consumptionArguments copyWithZone:a3];
    id v11 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;

    uint64_t v12 = [(NSString *)self->_chargingArguments copyWithZone:a3];
    v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    __int16 v14 = (__int16)self->_flags;
    if ((v14 & 2) != 0)
    {
      *(_DWORD *)(v5 + 80) = self->_currentBatteryCharge;
      *(_WORD *)(v5 + 112) |= 2u;
      __int16 v14 = (__int16)self->_flags;
      if ((v14 & 0x20) == 0)
      {
LABEL_11:
        if ((v14 & 0x100) == 0) {
          goto LABEL_12;
        }
        goto LABEL_22;
      }
    }
    else if ((v14 & 0x20) == 0)
    {
      goto LABEL_11;
    }
    *(_DWORD *)(v5 + 96) = self->_maxBatteryCharge;
    *(_WORD *)(v5 + 112) |= 0x20u;
    __int16 v14 = (__int16)self->_flags;
    if ((v14 & 0x100) == 0)
    {
LABEL_12:
      if ((v14 & 0x80) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
LABEL_22:
    *(unsigned char *)(v5 + 108) = self->_isCharging;
    *(_WORD *)(v5 + 112) |= 0x100u;
    if ((*(_WORD *)&self->_flags & 0x80) == 0)
    {
LABEL_14:
      uint64_t v15 = [(NSString *)self->_vehicleIdentifier copyWithZone:a3];
      v16 = *(void **)(v5 + 56);
      *(void *)(v5 + 56) = v15;

      id v17 = [(GEOChargerPlugsInfo *)self->_chargerPlugsInfo copyWithZone:a3];
      v18 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = v17;

      __int16 v19 = (__int16)self->_flags;
      if ((v19 & 8) != 0)
      {
        *(_DWORD *)(v5 + 88) = self->_lastSocUpdateDate;
        *(_WORD *)(v5 + 112) |= 8u;
        __int16 v19 = (__int16)self->_flags;
        if ((v19 & 0x10) == 0)
        {
LABEL_16:
          if ((v19 & 1) == 0)
          {
LABEL_18:
            uint64_t v20 = [(NSString *)self->_vehicleArguments copyWithZone:a3];
            v21 = *(void **)(v5 + 48);
            *(void *)(v5 + 48) = v20;

            v22 = self->_unknownFields;
            id v8 = *(id *)(v5 + 16);
            *(void *)(v5 + 16) = v22;
            goto LABEL_19;
          }
LABEL_17:
          *(_DWORD *)(v5 + 76) = self->_criticalBatteryCharge;
          *(_WORD *)(v5 + 112) |= 1u;
          goto LABEL_18;
        }
      }
      else if ((v19 & 0x10) == 0)
      {
        goto LABEL_16;
      }
      *(_DWORD *)(v5 + 92) = self->_lowBatteryCharge;
      *(_WORD *)(v5 + 112) |= 0x10u;
      if ((*(_WORD *)&self->_flags & 1) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
LABEL_13:
    *(_DWORD *)(v5 + 104) = self->_minBatteryCharge;
    *(_WORD *)(v5 + 112) |= 0x80u;
    goto LABEL_14;
  }
  __int16 v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOEVInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_19:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_60;
  }
  [(GEOEVInfo *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 56);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_currentBatteryPercentage != *((_DWORD *)v4 + 21)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_60;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_maxRange != *((_DWORD *)v4 + 25)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_60;
  }
  consumptionArguments = self->_consumptionArguments;
  if ((unint64_t)consumptionArguments | *((void *)v4 + 5)
    && !-[NSString isEqual:](consumptionArguments, "isEqual:"))
  {
    goto LABEL_60;
  }
  chargingArguments = self->_chargingArguments;
  if ((unint64_t)chargingArguments | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](chargingArguments, "isEqual:")) {
      goto LABEL_60;
    }
  }
  __int16 v9 = (__int16)self->_flags;
  __int16 v10 = *((_WORD *)v4 + 56);
  if ((v9 & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_currentBatteryCharge != *((_DWORD *)v4 + 20)) {
      goto LABEL_60;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_60;
  }
  if ((v9 & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_maxBatteryCharge != *((_DWORD *)v4 + 24)) {
      goto LABEL_60;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x100) != 0)
    {
      if (self->_isCharging)
      {
        if (!*((unsigned char *)v4 + 108)) {
          goto LABEL_60;
        }
        goto LABEL_34;
      }
      if (!*((unsigned char *)v4 + 108)) {
        goto LABEL_34;
      }
    }
LABEL_60:
    char v16 = 0;
    goto LABEL_61;
  }
  if ((*((_WORD *)v4 + 56) & 0x100) != 0) {
    goto LABEL_60;
  }
LABEL_34:
  if ((v9 & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_minBatteryCharge != *((_DWORD *)v4 + 26)) {
      goto LABEL_60;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_60;
  }
  vehicleIdentifier = self->_vehicleIdentifier;
  if ((unint64_t)vehicleIdentifier | *((void *)v4 + 7)
    && !-[NSString isEqual:](vehicleIdentifier, "isEqual:"))
  {
    goto LABEL_60;
  }
  chargerPlugsInfo = self->_chargerPlugsInfo;
  if ((unint64_t)chargerPlugsInfo | *((void *)v4 + 3))
  {
    if (!-[GEOChargerPlugsInfo isEqual:](chargerPlugsInfo, "isEqual:")) {
      goto LABEL_60;
    }
  }
  __int16 v13 = (__int16)self->_flags;
  __int16 v14 = *((_WORD *)v4 + 56);
  if ((v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_lastSocUpdateDate != *((_DWORD *)v4 + 22)) {
      goto LABEL_60;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_60;
  }
  if ((v13 & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0 || self->_lowBatteryCharge != *((_DWORD *)v4 + 23)) {
      goto LABEL_60;
    }
  }
  else if ((v14 & 0x10) != 0)
  {
    goto LABEL_60;
  }
  if (v13)
  {
    if ((v14 & 1) == 0 || self->_criticalBatteryCharge != *((_DWORD *)v4 + 19)) {
      goto LABEL_60;
    }
  }
  else if (v14)
  {
    goto LABEL_60;
  }
  vehicleArguments = self->_vehicleArguments;
  if ((unint64_t)vehicleArguments | *((void *)v4 + 6)) {
    char v16 = -[NSString isEqual:](vehicleArguments, "isEqual:");
  }
  else {
    char v16 = 1;
  }
LABEL_61:

  return v16;
}

- (unint64_t)hash
{
  [(GEOEVInfo *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    uint64_t v19 = 2654435761 * self->_currentBatteryPercentage;
    if ((flags & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if ((flags & 0x40) != 0)
    {
LABEL_3:
      uint64_t v18 = 2654435761 * self->_maxRange;
      goto LABEL_6;
    }
  }
  uint64_t v18 = 0;
LABEL_6:
  NSUInteger v17 = [(NSString *)self->_consumptionArguments hash];
  NSUInteger v4 = [(NSString *)self->_chargingArguments hash];
  __int16 v5 = (__int16)self->_flags;
  if ((v5 & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_currentBatteryCharge;
    if ((v5 & 0x20) != 0)
    {
LABEL_8:
      uint64_t v7 = 2654435761 * self->_maxBatteryCharge;
      if ((*(_WORD *)&self->_flags & 0x100) != 0) {
        goto LABEL_9;
      }
LABEL_13:
      uint64_t v8 = 0;
      if ((v5 & 0x80) != 0) {
        goto LABEL_10;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((v5 & 0x20) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_flags & 0x100) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t v8 = 2654435761 * self->_isCharging;
  if ((v5 & 0x80) != 0)
  {
LABEL_10:
    uint64_t v9 = 2654435761 * self->_minBatteryCharge;
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v9 = 0;
LABEL_15:
  NSUInteger v10 = [(NSString *)self->_vehicleIdentifier hash];
  unint64_t v11 = [(GEOChargerPlugsInfo *)self->_chargerPlugsInfo hash];
  __int16 v12 = (__int16)self->_flags;
  if ((v12 & 8) == 0)
  {
    uint64_t v13 = 0;
    if ((v12 & 0x10) != 0) {
      goto LABEL_17;
    }
LABEL_20:
    uint64_t v14 = 0;
    if (v12) {
      goto LABEL_18;
    }
LABEL_21:
    uint64_t v15 = 0;
    return v18 ^ v19 ^ v17 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ [(NSString *)self->_vehicleArguments hash];
  }
  uint64_t v13 = 2654435761 * self->_lastSocUpdateDate;
  if ((v12 & 0x10) == 0) {
    goto LABEL_20;
  }
LABEL_17:
  uint64_t v14 = 2654435761 * self->_lowBatteryCharge;
  if ((v12 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_18:
  uint64_t v15 = 2654435761 * self->_criticalBatteryCharge;
  return v18 ^ v19 ^ v17 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ [(NSString *)self->_vehicleArguments hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v10 = (unsigned int *)a3;
  [v10 readAll:0];
  NSUInteger v4 = v10;
  __int16 v5 = *((_WORD *)v10 + 56);
  if ((v5 & 4) != 0)
  {
    self->_currentBatteryPercentage = v10[21];
    *(_WORD *)&self->_flags |= 4u;
    __int16 v5 = *((_WORD *)v10 + 56);
  }
  if ((v5 & 0x40) != 0)
  {
    self->_maxRange = v10[25];
    *(_WORD *)&self->_flags |= 0x40u;
  }
  if (*((void *)v10 + 5))
  {
    -[GEOEVInfo setConsumptionArguments:](self, "setConsumptionArguments:");
    NSUInteger v4 = v10;
  }
  if (*((void *)v4 + 4))
  {
    -[GEOEVInfo setChargingArguments:](self, "setChargingArguments:");
    NSUInteger v4 = v10;
  }
  __int16 v6 = *((_WORD *)v4 + 56);
  if ((v6 & 2) != 0)
  {
    self->_currentBatteryCharge = v4[20];
    *(_WORD *)&self->_flags |= 2u;
    __int16 v6 = *((_WORD *)v4 + 56);
    if ((v6 & 0x20) == 0)
    {
LABEL_11:
      if ((v6 & 0x100) == 0) {
        goto LABEL_12;
      }
      goto LABEL_21;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  self->_maxBatteryCharge = v4[24];
  *(_WORD *)&self->_flags |= 0x20u;
  __int16 v6 = *((_WORD *)v4 + 56);
  if ((v6 & 0x100) == 0)
  {
LABEL_12:
    if ((v6 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_21:
  self->_isCharging = *((unsigned char *)v4 + 108);
  *(_WORD *)&self->_flags |= 0x100u;
  if ((v4[28] & 0x80) != 0)
  {
LABEL_13:
    self->_minBatteryCharge = v4[26];
    *(_WORD *)&self->_flags |= 0x80u;
  }
LABEL_14:
  if (*((void *)v4 + 7))
  {
    -[GEOEVInfo setVehicleIdentifier:](self, "setVehicleIdentifier:");
    NSUInteger v4 = v10;
  }
  chargerPlugsInfo = self->_chargerPlugsInfo;
  uint64_t v8 = *((void *)v4 + 3);
  if (chargerPlugsInfo)
  {
    if (!v8) {
      goto LABEL_26;
    }
    -[GEOChargerPlugsInfo mergeFrom:](chargerPlugsInfo, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_26;
    }
    -[GEOEVInfo setChargerPlugsInfo:](self, "setChargerPlugsInfo:");
  }
  NSUInteger v4 = v10;
LABEL_26:
  __int16 v9 = *((_WORD *)v4 + 56);
  if ((v9 & 8) != 0)
  {
    self->_lastSocUpdateDate = v4[22];
    *(_WORD *)&self->_flags |= 8u;
    __int16 v9 = *((_WORD *)v4 + 56);
    if ((v9 & 0x10) == 0)
    {
LABEL_28:
      if ((v9 & 1) == 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
  }
  else if ((v9 & 0x10) == 0)
  {
    goto LABEL_28;
  }
  self->_lowBatteryCharge = v4[23];
  *(_WORD *)&self->_flags |= 0x10u;
  if (v4[28])
  {
LABEL_29:
    self->_criticalBatteryCharge = v4[19];
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_30:
  if (*((void *)v4 + 6))
  {
    -[GEOEVInfo setVehicleArguments:](self, "setVehicleArguments:");
    NSUInteger v4 = v10;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x200) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      __int16 v5 = reader;
      objc_sync_enter(v5);
      GEOEVInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1873);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x8200u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOEVInfo *)self readAll:0];
    chargerPlugsInfo = self->_chargerPlugsInfo;
    [(GEOChargerPlugsInfo *)chargerPlugsInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleIdentifier, 0);
  objc_storeStrong((id *)&self->_vehicleArguments, 0);
  objc_storeStrong((id *)&self->_consumptionArguments, 0);
  objc_storeStrong((id *)&self->_chargingArguments, 0);
  objc_storeStrong((id *)&self->_chargerPlugsInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end