@interface GEORoutingSettingsDrivingPrefs
+ (BOOL)isValid:(id)a3;
- (BOOL)avoidHighways;
- (BOOL)avoidTolls;
- (BOOL)hasAvoidHighways;
- (BOOL)hasAvoidTolls;
- (BOOL)hasSpeedLimitEnabled;
- (BOOL)hasTrafficEnabled;
- (BOOL)hasVoiceNavEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)speedLimitEnabled;
- (BOOL)trafficEnabled;
- (BOOL)voiceNavEnabled;
- (GEORoutingSettingsDrivingPrefs)initWithDictionary:(id)a3;
- (GEORoutingSettingsDrivingPrefs)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(unsigned __int8 *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvoidHighways:(BOOL)a3;
- (void)setAvoidTolls:(BOOL)a3;
- (void)setHasAvoidHighways:(BOOL)a3;
- (void)setHasAvoidTolls:(BOOL)a3;
- (void)setHasSpeedLimitEnabled:(BOOL)a3;
- (void)setHasTrafficEnabled:(BOOL)a3;
- (void)setHasVoiceNavEnabled:(BOOL)a3;
- (void)setSpeedLimitEnabled:(BOOL)a3;
- (void)setTrafficEnabled:(BOOL)a3;
- (void)setVoiceNavEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORoutingSettingsDrivingPrefs

- (BOOL)avoidHighways
{
  return self->_avoidHighways;
}

- (void)setAvoidHighways:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_avoidHighways = a3;
}

- (void)setHasAvoidHighways:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAvoidHighways
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)avoidTolls
{
  return self->_avoidTolls;
}

- (void)setAvoidTolls:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_avoidTolls = a3;
}

- (void)setHasAvoidTolls:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAvoidTolls
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)speedLimitEnabled
{
  return self->_speedLimitEnabled;
}

- (void)setSpeedLimitEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_speedLimitEnabled = a3;
}

- (void)setHasSpeedLimitEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSpeedLimitEnabled
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)trafficEnabled
{
  return self->_trafficEnabled;
}

- (void)setTrafficEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_trafficEnabled = a3;
}

- (void)setHasTrafficEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasTrafficEnabled
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)voiceNavEnabled
{
  return self->_voiceNavEnabled;
}

- (void)setVoiceNavEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_voiceNavEnabled = a3;
}

- (void)setHasVoiceNavEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasVoiceNavEnabled
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORoutingSettingsDrivingPrefs;
  v4 = [(GEORoutingSettingsDrivingPrefs *)&v8 description];
  v5 = [(GEORoutingSettingsDrivingPrefs *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORoutingSettingsDrivingPrefs _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
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
  if (v5)
  {
    v6 = [NSNumber numberWithBool:a1[8]];
    if (a2) {
      v7 = @"avoidHighways";
    }
    else {
      v7 = @"avoid_highways";
    }
    [v4 setObject:v6 forKey:v7];

    unsigned __int8 v5 = a1[16];
  }
  if ((v5 & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:a1[9]];
    if (a2) {
      v9 = @"avoidTolls";
    }
    else {
      v9 = @"avoid_tolls";
    }
    [v4 setObject:v8 forKey:v9];

    unsigned __int8 v5 = a1[16];
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 8) == 0) {
        goto LABEL_10;
      }
LABEL_20:
      v12 = [NSNumber numberWithBool:a1[11]];
      if (a2) {
        v13 = @"trafficEnabled";
      }
      else {
        v13 = @"traffic_enabled";
      }
      [v4 setObject:v12 forKey:v13];

      if ((a1[16] & 0x10) == 0) {
        goto LABEL_28;
      }
      goto LABEL_24;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_9;
  }
  v10 = [NSNumber numberWithBool:a1[10]];
  if (a2) {
    v11 = @"speedLimitEnabled";
  }
  else {
    v11 = @"speed_limit_enabled";
  }
  [v4 setObject:v10 forKey:v11];

  unsigned __int8 v5 = a1[16];
  if ((v5 & 8) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if ((v5 & 0x10) != 0)
  {
LABEL_24:
    v14 = [NSNumber numberWithBool:a1[12]];
    if (a2) {
      v15 = @"voiceNavEnabled";
    }
    else {
      v15 = @"voice_nav_enabled";
    }
    [v4 setObject:v14 forKey:v15];
  }
LABEL_28:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORoutingSettingsDrivingPrefs _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEORoutingSettingsDrivingPrefs)initWithDictionary:(id)a3
{
  return (GEORoutingSettingsDrivingPrefs *)-[GEORoutingSettingsDrivingPrefs _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"avoidHighways";
      }
      else {
        v6 = @"avoid_highways";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAvoidHighways:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"avoidTolls";
      }
      else {
        objc_super v8 = @"avoid_tolls";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAvoidTolls:", objc_msgSend(v9, "BOOLValue"));
      }

      if (a3) {
        v10 = @"speedLimitEnabled";
      }
      else {
        v10 = @"speed_limit_enabled";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSpeedLimitEnabled:", objc_msgSend(v11, "BOOLValue"));
      }

      if (a3) {
        v12 = @"trafficEnabled";
      }
      else {
        v12 = @"traffic_enabled";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTrafficEnabled:", objc_msgSend(v13, "BOOLValue"));
      }

      if (a3) {
        v14 = @"voiceNavEnabled";
      }
      else {
        v14 = @"voice_nav_enabled";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setVoiceNavEnabled:", objc_msgSend(v15, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEORoutingSettingsDrivingPrefs)initWithJSON:(id)a3
{
  return (GEORoutingSettingsDrivingPrefs *)-[GEORoutingSettingsDrivingPrefs _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORoutingSettingsDrivingPrefsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORoutingSettingsDrivingPrefsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEORoutingSettingsDrivingPrefs *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[8] = self->_avoidHighways;
    v5[16] |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[9] = self->_avoidTolls;
  v5[16] |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v5[10] = self->_speedLimitEnabled;
  v5[16] |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v5[11] = self->_trafficEnabled;
  v5[16] |= 8u;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_6:
    v5[12] = self->_voiceNavEnabled;
    v5[16] |= 0x10u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((unsigned char *)result + 8) = self->_avoidHighways;
    *((unsigned char *)result + 16) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 9) = self->_avoidTolls;
  *((unsigned char *)result + 16) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((unsigned char *)result + 10) = self->_speedLimitEnabled;
  *((unsigned char *)result + 16) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((unsigned char *)result + 11) = self->_trafficEnabled;
  *((unsigned char *)result + 16) |= 8u;
  if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
    return result;
  }
LABEL_6:
  *((unsigned char *)result + 12) = self->_voiceNavEnabled;
  *((unsigned char *)result + 16) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  [(GEORoutingSettingsDrivingPrefs *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[16] & 1) == 0) {
      goto LABEL_36;
    }
    if (self->_avoidHighways)
    {
      if (!v4[8]) {
        goto LABEL_36;
      }
    }
    else if (v4[8])
    {
      goto LABEL_36;
    }
  }
  else if (v4[16])
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[16] & 2) == 0) {
      goto LABEL_36;
    }
    if (self->_avoidTolls)
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
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v4[16] & 4) == 0) {
      goto LABEL_36;
    }
    if (self->_speedLimitEnabled)
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
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((v4[16] & 8) == 0) {
      goto LABEL_36;
    }
    if (self->_trafficEnabled)
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
  BOOL v5 = (v4[16] & 0x10) == 0;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((v4[16] & 0x10) != 0)
    {
      if (self->_voiceNavEnabled)
      {
        if (!v4[12]) {
          goto LABEL_36;
        }
      }
      else if (v4[12])
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
  [(GEORoutingSettingsDrivingPrefs *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_avoidHighways;
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_avoidTolls;
      if ((*(unsigned char *)&self->_flags & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_speedLimitEnabled;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
LABEL_9:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_trafficEnabled;
  if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_voiceNavEnabled;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (BOOL *)a3;
  [v5 readAll:0];
  BOOL v4 = v5[16];
  if (v4)
  {
    self->_avoidHighways = v5[8];
    *(unsigned char *)&self->_flags |= 1u;
    BOOL v4 = v5[16];
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v5[16] & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_avoidTolls = v5[9];
  *(unsigned char *)&self->_flags |= 2u;
  BOOL v4 = v5[16];
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_speedLimitEnabled = v5[10];
  *(unsigned char *)&self->_flags |= 4u;
  BOOL v4 = v5[16];
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_trafficEnabled = v5[11];
  *(unsigned char *)&self->_flags |= 8u;
  if ((v5[16] & 0x10) != 0)
  {
LABEL_6:
    self->_voiceNavEnabled = v5[12];
    *(unsigned char *)&self->_flags |= 0x10u;
  }
LABEL_7:
}

@end