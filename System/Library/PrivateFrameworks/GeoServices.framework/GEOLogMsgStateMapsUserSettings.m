@interface GEOLogMsgStateMapsUserSettings
+ (BOOL)isValid:(id)a3;
- (BOOL)airQualityShown;
- (BOOL)hasAirQualityShown;
- (BOOL)hasIsOptedInToVlCrowdsourcing;
- (BOOL)hasLearnFromAppEnabled;
- (BOOL)hasLocationCadence;
- (BOOL)hasLocationType;
- (BOOL)hasNotificationsEnabled;
- (BOOL)hasSiriSuggestionsEnabled;
- (BOOL)hasWeatherShown;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOptedInToVlCrowdsourcing;
- (BOOL)learnFromAppEnabled;
- (BOOL)notificationsEnabled;
- (BOOL)readFrom:(id)a3;
- (BOOL)siriSuggestionsEnabled;
- (BOOL)weatherShown;
- (GEOLogMsgStateMapsUserSettings)initWithDictionary:(id)a3;
- (GEOLogMsgStateMapsUserSettings)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)locationCadenceAsString:(int)a3;
- (id)locationTypeAsString:(int)a3;
- (int)StringAsLocationCadence:(id)a3;
- (int)StringAsLocationType:(id)a3;
- (int)locationCadence;
- (int)locationType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAirQualityShown:(BOOL)a3;
- (void)setHasAirQualityShown:(BOOL)a3;
- (void)setHasIsOptedInToVlCrowdsourcing:(BOOL)a3;
- (void)setHasLearnFromAppEnabled:(BOOL)a3;
- (void)setHasLocationCadence:(BOOL)a3;
- (void)setHasLocationType:(BOOL)a3;
- (void)setHasNotificationsEnabled:(BOOL)a3;
- (void)setHasSiriSuggestionsEnabled:(BOOL)a3;
- (void)setHasWeatherShown:(BOOL)a3;
- (void)setIsOptedInToVlCrowdsourcing:(BOOL)a3;
- (void)setLearnFromAppEnabled:(BOOL)a3;
- (void)setLocationCadence:(int)a3;
- (void)setLocationType:(int)a3;
- (void)setNotificationsEnabled:(BOOL)a3;
- (void)setSiriSuggestionsEnabled:(BOOL)a3;
- (void)setWeatherShown:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateMapsUserSettings

- (int)locationType
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_locationType;
  }
  else {
    return 0;
  }
}

- (void)setLocationType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLocationType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)locationTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F80D8[a3];
  }

  return v3;
}

- (int)StringAsLocationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LOCATION_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LOCATION_TYPE_PRECISE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LOCATION_TYPE_COURSE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)locationCadence
{
  if (*(unsigned char *)&self->_flags) {
    return self->_locationCadence;
  }
  else {
    return 0;
  }
}

- (void)setLocationCadence:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_locationCadence = a3;
}

- (void)setHasLocationCadence:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLocationCadence
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)locationCadenceAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F80F0[a3];
  }

  return v3;
}

- (int)StringAsLocationCadence:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LOCATION_CADENCE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LOCATION_CADENCE_NEVER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LOCATION_CADENCE_ONCE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LOCATION_CADENCE_IN_APP"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LOCATION_CADENCE_ALWAYS"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)notificationsEnabled
{
  return self->_notificationsEnabled;
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_notificationsEnabled = a3;
}

- (void)setHasNotificationsEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasNotificationsEnabled
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (BOOL)siriSuggestionsEnabled
{
  return self->_siriSuggestionsEnabled;
}

- (void)setSiriSuggestionsEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x40u;
  self->_siriSuggestionsEnabled = a3;
}

- (void)setHasSiriSuggestionsEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasSiriSuggestionsEnabled
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (BOOL)learnFromAppEnabled
{
  return self->_learnFromAppEnabled;
}

- (void)setLearnFromAppEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_learnFromAppEnabled = a3;
}

- (void)setHasLearnFromAppEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasLearnFromAppEnabled
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (BOOL)airQualityShown
{
  return self->_airQualityShown;
}

- (void)setAirQualityShown:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_airQualityShown = a3;
}

- (void)setHasAirQualityShown:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasAirQualityShown
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)weatherShown
{
  return self->_weatherShown;
}

- (void)setWeatherShown:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x80u;
  self->_weatherShown = a3;
}

- (void)setHasWeatherShown:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = v3 & 0x80 | *(unsigned char *)&self->_flags & 0x7F;
}

- (BOOL)hasWeatherShown
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (BOOL)isOptedInToVlCrowdsourcing
{
  return self->_isOptedInToVlCrowdsourcing;
}

- (void)setIsOptedInToVlCrowdsourcing:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_isOptedInToVlCrowdsourcing = a3;
}

- (void)setHasIsOptedInToVlCrowdsourcing:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIsOptedInToVlCrowdsourcing
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateMapsUserSettings;
  int v4 = [(GEOLogMsgStateMapsUserSettings *)&v8 description];
  v5 = [(GEOLogMsgStateMapsUserSettings *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMapsUserSettings _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_49;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 2) != 0)
  {
    uint64_t v6 = *(int *)(a1 + 12);
    if (v6 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 12));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E53F80D8[v6];
    }
    if (a2) {
      objc_super v8 = @"locationType";
    }
    else {
      objc_super v8 = @"location_type";
    }
    [v4 setObject:v7 forKey:v8];

    char v5 = *(unsigned char *)(a1 + 24);
  }
  if (v5)
  {
    uint64_t v9 = *(int *)(a1 + 8);
    if (v9 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E53F80F0[v9];
    }
    if (a2) {
      v11 = @"locationCadence";
    }
    else {
      v11 = @"location_cadence";
    }
    [v4 setObject:v10 forKey:v11];

    char v5 = *(unsigned char *)(a1 + 24);
  }
  if ((v5 & 0x20) != 0)
  {
    v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 19)];
    if (a2) {
      v13 = @"notificationsEnabled";
    }
    else {
      v13 = @"notifications_enabled";
    }
    [v4 setObject:v12 forKey:v13];

    char v5 = *(unsigned char *)(a1 + 24);
    if ((v5 & 0x40) == 0)
    {
LABEL_20:
      if ((v5 & 0x10) == 0) {
        goto LABEL_21;
      }
      goto LABEL_33;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_20;
  }
  v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 20)];
  if (a2) {
    v15 = @"siriSuggestionsEnabled";
  }
  else {
    v15 = @"siri_suggestions_enabled";
  }
  [v4 setObject:v14 forKey:v15];

  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 0x10) == 0)
  {
LABEL_21:
    if ((v5 & 4) == 0) {
      goto LABEL_22;
    }
    goto LABEL_37;
  }
LABEL_33:
  v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 18)];
  if (a2) {
    v17 = @"learnFromAppEnabled";
  }
  else {
    v17 = @"learn_from_app_enabled";
  }
  [v4 setObject:v16 forKey:v17];

  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 4) == 0)
  {
LABEL_22:
    if ((v5 & 0x80) == 0) {
      goto LABEL_23;
    }
LABEL_41:
    v20 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 21)];
    if (a2) {
      v21 = @"weatherShown";
    }
    else {
      v21 = @"weather_shown";
    }
    [v4 setObject:v20 forKey:v21];

    if ((*(unsigned char *)(a1 + 24) & 8) == 0) {
      goto LABEL_49;
    }
    goto LABEL_45;
  }
LABEL_37:
  v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 16)];
  if (a2) {
    v19 = @"airQualityShown";
  }
  else {
    v19 = @"air_quality_shown";
  }
  [v4 setObject:v18 forKey:v19];

  char v5 = *(unsigned char *)(a1 + 24);
  if (v5 < 0) {
    goto LABEL_41;
  }
LABEL_23:
  if ((v5 & 8) != 0)
  {
LABEL_45:
    v22 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 17)];
    if (a2) {
      v23 = @"isOptedInToVlCrowdsourcing";
    }
    else {
      v23 = @"is_opted_in_to_vl_crowdsourcing";
    }
    [v4 setObject:v22 forKey:v23];
  }
LABEL_49:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateMapsUserSettings _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateMapsUserSettings)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMapsUserSettings *)-[GEOLogMsgStateMapsUserSettings _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_68;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_68;
  }
  if (a3) {
    uint64_t v6 = @"locationType";
  }
  else {
    uint64_t v6 = @"location_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"LOCATION_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"LOCATION_TYPE_PRECISE"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"LOCATION_TYPE_COURSE"])
    {
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_18;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setLocationType:v9];
LABEL_18:

  if (a3) {
    v10 = @"locationCadence";
  }
  else {
    v10 = @"location_cadence";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"LOCATION_CADENCE_UNKNOWN"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"LOCATION_CADENCE_NEVER"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"LOCATION_CADENCE_ONCE"])
    {
      uint64_t v13 = 2;
    }
    else if ([v12 isEqualToString:@"LOCATION_CADENCE_IN_APP"])
    {
      uint64_t v13 = 3;
    }
    else if ([v12 isEqualToString:@"LOCATION_CADENCE_ALWAYS"])
    {
      uint64_t v13 = 4;
    }
    else
    {
      uint64_t v13 = 0;
    }

    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v11 intValue];
LABEL_36:
    [a1 setLocationCadence:v13];
  }

  if (a3) {
    v14 = @"notificationsEnabled";
  }
  else {
    v14 = @"notifications_enabled";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setNotificationsEnabled:", objc_msgSend(v15, "BOOLValue"));
  }

  if (a3) {
    v16 = @"siriSuggestionsEnabled";
  }
  else {
    v16 = @"siri_suggestions_enabled";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSiriSuggestionsEnabled:", objc_msgSend(v17, "BOOLValue"));
  }

  if (a3) {
    v18 = @"learnFromAppEnabled";
  }
  else {
    v18 = @"learn_from_app_enabled";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLearnFromAppEnabled:", objc_msgSend(v19, "BOOLValue"));
  }

  if (a3) {
    v20 = @"airQualityShown";
  }
  else {
    v20 = @"air_quality_shown";
  }
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAirQualityShown:", objc_msgSend(v21, "BOOLValue"));
  }

  if (a3) {
    v22 = @"weatherShown";
  }
  else {
    v22 = @"weather_shown";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWeatherShown:", objc_msgSend(v23, "BOOLValue"));
  }

  if (a3) {
    v24 = @"isOptedInToVlCrowdsourcing";
  }
  else {
    v24 = @"is_opted_in_to_vl_crowdsourcing";
  }
  v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsOptedInToVlCrowdsourcing:", objc_msgSend(v25, "BOOLValue"));
  }

LABEL_68:
  return a1;
}

- (GEOLogMsgStateMapsUserSettings)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMapsUserSettings *)-[GEOLogMsgStateMapsUserSettings _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMapsUserSettingsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMapsUserSettingsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_7:
    if ((flags & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_8:
    if ((flags & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
LABEL_9:
  }
    PBDataWriterWriteBOOLField();
LABEL_10:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgStateMapsUserSettings *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = self->_locationType;
    *((unsigned char *)v5 + 24) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[2] = self->_locationCadence;
  *((unsigned char *)v5 + 24) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((unsigned char *)v5 + 19) = self->_notificationsEnabled;
  *((unsigned char *)v5 + 24) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((unsigned char *)v5 + 20) = self->_siriSuggestionsEnabled;
  *((unsigned char *)v5 + 24) |= 0x40u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((unsigned char *)v5 + 18) = self->_learnFromAppEnabled;
  *((unsigned char *)v5 + 24) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_7:
    if ((flags & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)v5 + 16) = self->_airQualityShown;
  *((unsigned char *)v5 + 24) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_8:
    if ((flags & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  *((unsigned char *)v5 + 21) = self->_weatherShown;
  *((unsigned char *)v5 + 24) |= 0x80u;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_9:
    *((unsigned char *)v5 + 17) = self->_isOptedInToVlCrowdsourcing;
    *((unsigned char *)v5 + 24) |= 8u;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_locationType;
    *((unsigned char *)result + 24) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_locationCadence;
  *((unsigned char *)result + 24) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((unsigned char *)result + 19) = self->_notificationsEnabled;
  *((unsigned char *)result + 24) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)result + 20) = self->_siriSuggestionsEnabled;
  *((unsigned char *)result + 24) |= 0x40u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((unsigned char *)result + 18) = self->_learnFromAppEnabled;
  *((unsigned char *)result + 24) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_7:
    if ((flags & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((unsigned char *)result + 16) = self->_airQualityShown;
  *((unsigned char *)result + 24) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_8:
    if ((flags & 8) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((unsigned char *)result + 21) = self->_weatherShown;
  *((unsigned char *)result + 24) |= 0x80u;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    return result;
  }
LABEL_9:
  *((unsigned char *)result + 17) = self->_isOptedInToVlCrowdsourcing;
  *((unsigned char *)result + 24) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  [(GEOLogMsgStateMapsUserSettings *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_locationType != *((_DWORD *)v4 + 3)) {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_52;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_locationCadence != *((_DWORD *)v4 + 2)) {
      goto LABEL_52;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 0x20) == 0) {
      goto LABEL_52;
    }
    if (self->_notificationsEnabled)
    {
      if (!*((unsigned char *)v4 + 19)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 19))
    {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 0x40) == 0) {
      goto LABEL_52;
    }
    if (self->_siriSuggestionsEnabled)
    {
      if (!*((unsigned char *)v4 + 20)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 20))
    {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 0x40) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 0x10) == 0) {
      goto LABEL_52;
    }
    if (self->_learnFromAppEnabled)
    {
      if (!*((unsigned char *)v4 + 18)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 18))
    {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0) {
      goto LABEL_52;
    }
    if (self->_airQualityShown)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 0x80) == 0) {
      goto LABEL_52;
    }
    if (self->_weatherShown)
    {
      if (!*((unsigned char *)v4 + 21)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 21))
    {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 0x80) != 0)
  {
    goto LABEL_52;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 8) == 0;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) != 0)
    {
      if (self->_isOptedInToVlCrowdsourcing)
      {
        if (!*((unsigned char *)v4 + 17)) {
          goto LABEL_52;
        }
LABEL_60:
        BOOL v5 = 1;
        goto LABEL_53;
      }
      if (!*((unsigned char *)v4 + 17)) {
        goto LABEL_60;
      }
    }
LABEL_52:
    BOOL v5 = 0;
  }
LABEL_53:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateMapsUserSettings *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_locationType;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_locationCadence;
      if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_notificationsEnabled;
    if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_siriSuggestionsEnabled;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_learnFromAppEnabled;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_airQualityShown;
    if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_15:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_flags & 0x80) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_weatherShown;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_isOptedInToVlCrowdsourcing;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 2) != 0)
  {
    self->_locationType = *((_DWORD *)v5 + 3);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 24);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v5 + 24) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_locationCadence = *((_DWORD *)v5 + 2);
  *(unsigned char *)&self->_flags |= 1u;
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 0x20) == 0)
  {
LABEL_4:
    if ((v4 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_notificationsEnabled = *((unsigned char *)v5 + 19);
  *(unsigned char *)&self->_flags |= 0x20u;
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 0x40) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_siriSuggestionsEnabled = *((unsigned char *)v5 + 20);
  *(unsigned char *)&self->_flags |= 0x40u;
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_learnFromAppEnabled = *((unsigned char *)v5 + 18);
  *(unsigned char *)&self->_flags |= 0x10u;
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 4) == 0)
  {
LABEL_7:
    if ((v4 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_airQualityShown = *((unsigned char *)v5 + 16);
  *(unsigned char *)&self->_flags |= 4u;
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 0x80) == 0)
  {
LABEL_8:
    if ((v4 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  self->_weatherShown = *((unsigned char *)v5 + 21);
  *(unsigned char *)&self->_flags |= 0x80u;
  if ((*((unsigned char *)v5 + 24) & 8) != 0)
  {
LABEL_9:
    self->_isOptedInToVlCrowdsourcing = *((unsigned char *)v5 + 17);
    *(unsigned char *)&self->_flags |= 8u;
  }
LABEL_10:
}

@end