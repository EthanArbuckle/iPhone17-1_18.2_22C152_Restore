@interface GEORoutingSettingsCyclingPrefs
+ (BOOL)isValid:(id)a3;
- (BOOL)autoRecordWorkout;
- (BOOL)avoidBusyRoads;
- (BOOL)avoidHills;
- (BOOL)avoidStairs;
- (BOOL)eBike;
- (BOOL)hasAutoRecordWorkout;
- (BOOL)hasAvoidBusyRoads;
- (BOOL)hasAvoidHills;
- (BOOL)hasAvoidStairs;
- (BOOL)hasEBike;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORoutingSettingsCyclingPrefs)initWithDictionary:(id)a3;
- (GEORoutingSettingsCyclingPrefs)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(unsigned __int8 *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAutoRecordWorkout:(BOOL)a3;
- (void)setAvoidBusyRoads:(BOOL)a3;
- (void)setAvoidHills:(BOOL)a3;
- (void)setAvoidStairs:(BOOL)a3;
- (void)setEBike:(BOOL)a3;
- (void)setHasAutoRecordWorkout:(BOOL)a3;
- (void)setHasAvoidBusyRoads:(BOOL)a3;
- (void)setHasAvoidHills:(BOOL)a3;
- (void)setHasAvoidStairs:(BOOL)a3;
- (void)setHasEBike:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORoutingSettingsCyclingPrefs

- (BOOL)avoidStairs
{
  return self->_avoidStairs;
}

- (void)setAvoidStairs:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_avoidStairs = a3;
}

- (void)setHasAvoidStairs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasAvoidStairs
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)avoidHills
{
  return self->_avoidHills;
}

- (void)setAvoidHills:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_avoidHills = a3;
}

- (void)setHasAvoidHills:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasAvoidHills
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)avoidBusyRoads
{
  return self->_avoidBusyRoads;
}

- (void)setAvoidBusyRoads:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_avoidBusyRoads = a3;
}

- (void)setHasAvoidBusyRoads:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAvoidBusyRoads
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)eBike
{
  return self->_eBike;
}

- (void)setEBike:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_eBike = a3;
}

- (void)setHasEBike:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasEBike
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (BOOL)autoRecordWorkout
{
  return self->_autoRecordWorkout;
}

- (void)setAutoRecordWorkout:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_autoRecordWorkout = a3;
}

- (void)setHasAutoRecordWorkout:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAutoRecordWorkout
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORoutingSettingsCyclingPrefs;
  v4 = [(GEORoutingSettingsCyclingPrefs *)&v8 description];
  v5 = [(GEORoutingSettingsCyclingPrefs *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORoutingSettingsCyclingPrefs _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_28;
  }
  [a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  unsigned __int8 v5 = a1[16];
  if ((v5 & 8) != 0)
  {
    v6 = [NSNumber numberWithBool:a1[11]];
    if (a2) {
      v7 = @"avoidStairs";
    }
    else {
      v7 = @"avoid_stairs";
    }
    [v4 setObject:v6 forKey:v7];

    unsigned __int8 v5 = a1[16];
  }
  if ((v5 & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:a1[10]];
    if (a2) {
      v9 = @"avoidHills";
    }
    else {
      v9 = @"avoid_hills";
    }
    [v4 setObject:v8 forKey:v9];

    unsigned __int8 v5 = a1[16];
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 0x10) == 0) {
        goto LABEL_10;
      }
LABEL_20:
      v12 = [NSNumber numberWithBool:a1[12]];
      if (a2) {
        v13 = @"eBike";
      }
      else {
        v13 = @"e_bike";
      }
      [v4 setObject:v12 forKey:v13];

      if ((a1[16] & 1) == 0) {
        goto LABEL_28;
      }
      goto LABEL_24;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_9;
  }
  v10 = [NSNumber numberWithBool:a1[9]];
  if (a2) {
    v11 = @"avoidBusyRoads";
  }
  else {
    v11 = @"avoid_busy_roads";
  }
  [v4 setObject:v10 forKey:v11];

  unsigned __int8 v5 = a1[16];
  if ((v5 & 0x10) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if (v5)
  {
LABEL_24:
    v14 = [NSNumber numberWithBool:a1[8]];
    if (a2) {
      v15 = @"autoRecordWorkout";
    }
    else {
      v15 = @"auto_record_workout";
    }
    [v4 setObject:v14 forKey:v15];
  }
LABEL_28:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORoutingSettingsCyclingPrefs _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEORoutingSettingsCyclingPrefs)initWithDictionary:(id)a3
{
  return (GEORoutingSettingsCyclingPrefs *)-[GEORoutingSettingsCyclingPrefs _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"avoidStairs";
      }
      else {
        v6 = @"avoid_stairs";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAvoidStairs:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"avoidHills";
      }
      else {
        objc_super v8 = @"avoid_hills";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAvoidHills:", objc_msgSend(v9, "BOOLValue"));
      }

      if (a3) {
        v10 = @"avoidBusyRoads";
      }
      else {
        v10 = @"avoid_busy_roads";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAvoidBusyRoads:", objc_msgSend(v11, "BOOLValue"));
      }

      if (a3) {
        v12 = @"eBike";
      }
      else {
        v12 = @"e_bike";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setEBike:", objc_msgSend(v13, "BOOLValue"));
      }

      if (a3) {
        v14 = @"autoRecordWorkout";
      }
      else {
        v14 = @"auto_record_workout";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAutoRecordWorkout:", objc_msgSend(v15, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEORoutingSettingsCyclingPrefs)initWithJSON:(id)a3
{
  return (GEORoutingSettingsCyclingPrefs *)-[GEORoutingSettingsCyclingPrefs _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORoutingSettingsCyclingPrefsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORoutingSettingsCyclingPrefsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_flags) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEORoutingSettingsCyclingPrefs *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v5[11] = self->_avoidStairs;
    v5[16] |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[10] = self->_avoidHills;
  v5[16] |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v5[9] = self->_avoidBusyRoads;
  v5[16] |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v5[12] = self->_eBike;
  v5[16] |= 0x10u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_6:
    v5[8] = self->_autoRecordWorkout;
    v5[16] |= 1u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((unsigned char *)result + 11) = self->_avoidStairs;
    *((unsigned char *)result + 16) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 10) = self->_avoidHills;
  *((unsigned char *)result + 16) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((unsigned char *)result + 9) = self->_avoidBusyRoads;
  *((unsigned char *)result + 16) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((unsigned char *)result + 12) = self->_eBike;
  *((unsigned char *)result + 16) |= 0x10u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_6:
  *((unsigned char *)result + 8) = self->_autoRecordWorkout;
  *((unsigned char *)result + 16) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  [(GEORoutingSettingsCyclingPrefs *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((v4[16] & 8) == 0) {
      goto LABEL_36;
    }
    if (self->_avoidStairs)
    {
      if (!v4[11]) {
        goto LABEL_36;
      }
    }
    else if (v4[11])
    {
      goto LABEL_36;
    }
  }
  else if ((v4[16] & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v4[16] & 4) == 0) {
      goto LABEL_36;
    }
    if (self->_avoidHills)
    {
      if (!v4[10]) {
        goto LABEL_36;
      }
    }
    else if (v4[10])
    {
      goto LABEL_36;
    }
  }
  else if ((v4[16] & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[16] & 2) == 0) {
      goto LABEL_36;
    }
    if (self->_avoidBusyRoads)
    {
      if (!v4[9]) {
        goto LABEL_36;
      }
    }
    else if (v4[9])
    {
      goto LABEL_36;
    }
  }
  else if ((v4[16] & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((v4[16] & 0x10) == 0) {
      goto LABEL_36;
    }
    if (self->_eBike)
    {
      if (!v4[12]) {
        goto LABEL_36;
      }
    }
    else if (v4[12])
    {
      goto LABEL_36;
    }
  }
  else if ((v4[16] & 0x10) != 0)
  {
    goto LABEL_36;
  }
  BOOL v5 = (v4[16] & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if (v4[16])
    {
      if (self->_autoRecordWorkout)
      {
        if (!v4[8]) {
          goto LABEL_36;
        }
      }
      else if (v4[8])
      {
        goto LABEL_36;
      }
      BOOL v5 = 1;
      goto LABEL_37;
    }
LABEL_36:
    BOOL v5 = 0;
  }
LABEL_37:

  return v5;
}

- (unint64_t)hash
{
  [(GEORoutingSettingsCyclingPrefs *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v3 = 2654435761 * self->_avoidStairs;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_avoidHills;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_avoidBusyRoads;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
LABEL_9:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_eBike;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_autoRecordWorkout;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (BOOL *)a3;
  [v5 readAll:0];
  BOOL v4 = v5[16];
  if ((v4 & 8) != 0)
  {
    self->_avoidStairs = v5[11];
    *(unsigned char *)&self->_flags |= 8u;
    BOOL v4 = v5[16];
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v5[16] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_avoidHills = v5[10];
  *(unsigned char *)&self->_flags |= 4u;
  BOOL v4 = v5[16];
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_avoidBusyRoads = v5[9];
  *(unsigned char *)&self->_flags |= 2u;
  BOOL v4 = v5[16];
  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_eBike = v5[12];
  *(unsigned char *)&self->_flags |= 0x10u;
  if (v5[16])
  {
LABEL_6:
    self->_autoRecordWorkout = v5[8];
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_7:
}

@end