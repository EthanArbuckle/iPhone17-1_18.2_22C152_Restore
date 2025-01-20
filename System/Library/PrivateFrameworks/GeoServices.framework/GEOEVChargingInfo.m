@interface GEOEVChargingInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBatteryChargeAfterCharging;
- (BOOL)hasBatteryPercentageAfterCharging;
- (BOOL)hasChargerPlugsInfo;
- (BOOL)hasChargingTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOChargerPlugsInfo)chargerPlugsInfo;
- (GEOEVChargingInfo)initWithDictionary:(id)a3;
- (GEOEVChargingInfo)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)batteryChargeAfterCharging;
- (unsigned)batteryPercentageAfterCharging;
- (unsigned)chargingTime;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBatteryChargeAfterCharging:(unsigned int)a3;
- (void)setBatteryPercentageAfterCharging:(unsigned int)a3;
- (void)setChargerPlugsInfo:(id)a3;
- (void)setChargingTime:(unsigned int)a3;
- (void)setHasBatteryChargeAfterCharging:(BOOL)a3;
- (void)setHasBatteryPercentageAfterCharging:(BOOL)a3;
- (void)setHasChargingTime:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOEVChargingInfo

- (unsigned)chargingTime
{
  return self->_chargingTime;
}

- (void)setChargingTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_chargingTime = a3;
}

- (void)setHasChargingTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasChargingTime
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)batteryPercentageAfterCharging
{
  return self->_batteryPercentageAfterCharging;
}

- (void)setBatteryPercentageAfterCharging:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_batteryPercentageAfterCharging = a3;
}

- (void)setHasBatteryPercentageAfterCharging:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasBatteryPercentageAfterCharging
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)batteryChargeAfterCharging
{
  return self->_batteryChargeAfterCharging;
}

- (void)setBatteryChargeAfterCharging:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_batteryChargeAfterCharging = a3;
}

- (void)setHasBatteryChargeAfterCharging:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasBatteryChargeAfterCharging
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasChargerPlugsInfo
{
  return self->_chargerPlugsInfo != 0;
}

- (GEOChargerPlugsInfo)chargerPlugsInfo
{
  return self->_chargerPlugsInfo;
}

- (void)setChargerPlugsInfo:(id)a3
{
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOEVChargingInfo;
  v4 = [(GEOEVChargingInfo *)&v8 description];
  v5 = [(GEOEVChargingInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOEVChargingInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_27;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 36);
  if ((v5 & 4) == 0)
  {
    if ((*(unsigned char *)(a1 + 36) & 2) == 0) {
      goto LABEL_4;
    }
LABEL_16:
    v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
    if (a2) {
      v15 = @"batteryPercentageAfterCharging";
    }
    else {
      v15 = @"battery_percentage_after_charging";
    }
    [v4 setObject:v14 forKey:v15];

    if ((*(unsigned char *)(a1 + 36) & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
  if (a2) {
    v13 = @"chargingTime";
  }
  else {
    v13 = @"charging_time";
  }
  [v4 setObject:v12 forKey:v13];

  char v5 = *(unsigned char *)(a1 + 36);
  if ((v5 & 2) != 0) {
    goto LABEL_16;
  }
LABEL_4:
  if (v5)
  {
LABEL_5:
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    if (a2) {
      v7 = @"batteryChargeAfterCharging";
    }
    else {
      v7 = @"battery_charge_after_charging";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_9:
  objc_super v8 = [(id)a1 chargerPlugsInfo];
  v9 = v8;
  if (v8)
  {
    if (a2)
    {
      v10 = [v8 jsonRepresentation];
      v11 = @"chargerPlugsInfo";
    }
    else
    {
      v10 = [v8 dictionaryRepresentation];
      v11 = @"charger_plugs_info";
    }
    [v4 setObject:v10 forKey:v11];
  }
  v16 = *(void **)(a1 + 8);
  if (v16)
  {
    v17 = [v16 dictionaryRepresentation];
    v18 = v17;
    if (a2)
    {
      v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __47__GEOEVChargingInfo__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E53D8860;
      id v20 = v19;
      id v24 = v20;
      [v18 enumerateKeysAndObjectsUsingBlock:v23];
      id v21 = v20;

      v18 = v21;
    }
    [v4 setObject:v18 forKey:@"Unknown Fields"];
  }
LABEL_27:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOEVChargingInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOEVChargingInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
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

- (GEOEVChargingInfo)initWithDictionary:(id)a3
{
  return (GEOEVChargingInfo *)-[GEOEVChargingInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"chargingTime";
      }
      else {
        v6 = @"charging_time";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setChargingTime:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"batteryPercentageAfterCharging";
      }
      else {
        objc_super v8 = @"battery_percentage_after_charging";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setBatteryPercentageAfterCharging:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        id v10 = @"batteryChargeAfterCharging";
      }
      else {
        id v10 = @"battery_charge_after_charging";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setBatteryChargeAfterCharging:", objc_msgSend(v11, "unsignedIntValue"));
      }

      if (a3) {
        v12 = @"chargerPlugsInfo";
      }
      else {
        v12 = @"charger_plugs_info";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = [GEOChargerPlugsInfo alloc];
        if (a3) {
          uint64_t v15 = [(GEOChargerPlugsInfo *)v14 initWithJSON:v13];
        }
        else {
          uint64_t v15 = [(GEOChargerPlugsInfo *)v14 initWithDictionary:v13];
        }
        v16 = (void *)v15;
        [a1 setChargerPlugsInfo:v15];
      }
    }
  }

  return a1;
}

- (GEOEVChargingInfo)initWithJSON:(id)a3
{
  return (GEOEVChargingInfo *)-[GEOEVChargingInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOEVChargingInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOEVChargingInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_chargerPlugsInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEOEVChargingInfo *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_chargingTime;
    *((unsigned char *)v6 + 36) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 7) = self->_batteryPercentageAfterCharging;
  *((unsigned char *)v6 + 36) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    *((_DWORD *)v6 + 6) = self->_batteryChargeAfterCharging;
    *((unsigned char *)v6 + 36) |= 1u;
  }
LABEL_5:
  if (self->_chargerPlugsInfo)
  {
    objc_msgSend(v6, "setChargerPlugsInfo:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 28) = self->_batteryPercentageAfterCharging;
    *(unsigned char *)(v5 + 36) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 32) = self->_chargingTime;
  *(unsigned char *)(v5 + 36) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_batteryChargeAfterCharging;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
LABEL_5:
  id v8 = [(GEOChargerPlugsInfo *)self->_chargerPlugsInfo copyWithZone:a3];
  v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEOEVChargingInfo *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_chargingTime != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
LABEL_19:
    char v6 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_batteryPercentageAfterCharging != *((_DWORD *)v4 + 7)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_batteryChargeAfterCharging != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_19;
  }
  chargerPlugsInfo = self->_chargerPlugsInfo;
  if ((unint64_t)chargerPlugsInfo | *((void *)v4 + 2)) {
    char v6 = -[GEOChargerPlugsInfo isEqual:](chargerPlugsInfo, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  [(GEOEVChargingInfo *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(GEOChargerPlugsInfo *)self->_chargerPlugsInfo hash];
  }
  uint64_t v3 = 2654435761 * self->_chargingTime;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_batteryPercentageAfterCharging;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_batteryChargeAfterCharging;
  return v4 ^ v3 ^ v5 ^ [(GEOChargerPlugsInfo *)self->_chargerPlugsInfo hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = (unsigned int *)a3;
  [v8 readAll:0];
  uint64_t v4 = v8;
  char v5 = *((unsigned char *)v8 + 36);
  if ((v5 & 4) != 0)
  {
    self->_chargingTime = v8[8];
    *(unsigned char *)&self->_flags |= 4u;
    char v5 = *((unsigned char *)v8 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v8[9] & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_batteryPercentageAfterCharging = v8[7];
  *(unsigned char *)&self->_flags |= 2u;
  if (v8[9])
  {
LABEL_4:
    self->_batteryChargeAfterCharging = v8[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_5:
  chargerPlugsInfo = self->_chargerPlugsInfo;
  uint64_t v7 = *((void *)v8 + 2);
  if (chargerPlugsInfo)
  {
    if (!v7) {
      goto LABEL_14;
    }
    -[GEOChargerPlugsInfo mergeFrom:](chargerPlugsInfo, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_14;
    }
    -[GEOEVChargingInfo setChargerPlugsInfo:](self, "setChargerPlugsInfo:");
  }
  uint64_t v4 = v8;
LABEL_14:
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOEVChargingInfo *)self readAll:0];
    chargerPlugsInfo = self->_chargerPlugsInfo;
    [(GEOChargerPlugsInfo *)chargerPlugsInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargerPlugsInfo, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end