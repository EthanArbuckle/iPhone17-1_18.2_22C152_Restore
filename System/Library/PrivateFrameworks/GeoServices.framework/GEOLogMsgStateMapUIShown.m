@interface GEOLogMsgStateMapUIShown
+ (BOOL)isValid:(id)a3;
- (BOOL)hasActiveNavMode;
- (BOOL)hasIsAirQualityShown;
- (BOOL)hasIsLookAroundEntryIconShown;
- (BOOL)hasIsVenueExperienceShown;
- (BOOL)hasIsWeatherShown;
- (BOOL)isAirQualityShown;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLookAroundEntryIconShown;
- (BOOL)isVenueExperienceShown;
- (BOOL)isWeatherShown;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateMapUIShown)initWithDictionary:(id)a3;
- (GEOLogMsgStateMapUIShown)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)activeNavModeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsActiveNavMode:(id)a3;
- (int)activeNavMode;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveNavMode:(int)a3;
- (void)setHasActiveNavMode:(BOOL)a3;
- (void)setHasIsAirQualityShown:(BOOL)a3;
- (void)setHasIsLookAroundEntryIconShown:(BOOL)a3;
- (void)setHasIsVenueExperienceShown:(BOOL)a3;
- (void)setHasIsWeatherShown:(BOOL)a3;
- (void)setIsAirQualityShown:(BOOL)a3;
- (void)setIsLookAroundEntryIconShown:(BOOL)a3;
- (void)setIsVenueExperienceShown:(BOOL)a3;
- (void)setIsWeatherShown:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateMapUIShown

- (void)setIsWeatherShown:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_isWeatherShown = a3;
}

- (void)setIsVenueExperienceShown:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_isVenueExperienceShown = a3;
}

- (void)setIsAirQualityShown:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_isAirQualityShown = a3;
}

- (void)setActiveNavMode:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_activeNavMode = a3;
}

- (void)setIsLookAroundEntryIconShown:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_isLookAroundEntryIconShown = a3;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
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
    PBDataWriterWriteInt32Field();
LABEL_7:
}

- (BOOL)isAirQualityShown
{
  return self->_isAirQualityShown;
}

- (void)setHasIsAirQualityShown:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsAirQualityShown
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)isWeatherShown
{
  return self->_isWeatherShown;
}

- (void)setHasIsWeatherShown:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIsWeatherShown
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (BOOL)isVenueExperienceShown
{
  return self->_isVenueExperienceShown;
}

- (void)setHasIsVenueExperienceShown:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIsVenueExperienceShown
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)isLookAroundEntryIconShown
{
  return self->_isLookAroundEntryIconShown;
}

- (void)setHasIsLookAroundEntryIconShown:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsLookAroundEntryIconShown
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)activeNavMode
{
  if (*(unsigned char *)&self->_flags) {
    return self->_activeNavMode;
  }
  else {
    return 0;
  }
}

- (void)setHasActiveNavMode:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasActiveNavMode
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)activeNavModeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F8018[a3];
  }

  return v3;
}

- (int)StringAsActiveNavMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOMOBILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BICYCLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 6;
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
  v8.super_class = (Class)GEOLogMsgStateMapUIShown;
  int v4 = [(GEOLogMsgStateMapUIShown *)&v8 description];
  id v5 = [(GEOLogMsgStateMapUIShown *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMapUIShown _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_31;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 16);
  if ((v5 & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 12)];
    if (a2) {
      v7 = @"isAirQualityShown";
    }
    else {
      v7 = @"is_air_quality_shown";
    }
    [v4 setObject:v6 forKey:v7];

    char v5 = *(unsigned char *)(a1 + 16);
  }
  if ((v5 & 0x10) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 15)];
    if (a2) {
      v9 = @"isWeatherShown";
    }
    else {
      v9 = @"is_weather_shown";
    }
    [v4 setObject:v8 forKey:v9];

    char v5 = *(unsigned char *)(a1 + 16);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 4) == 0) {
        goto LABEL_10;
      }
LABEL_20:
      v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 13)];
      if (a2) {
        v13 = @"isLookAroundEntryIconShown";
      }
      else {
        v13 = @"is_look_around_entry_icon_shown";
      }
      [v4 setObject:v12 forKey:v13];

      if ((*(unsigned char *)(a1 + 16) & 1) == 0) {
        goto LABEL_31;
      }
      goto LABEL_24;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_9;
  }
  v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 14)];
  if (a2) {
    v11 = @"isVenueExperienceShown";
  }
  else {
    v11 = @"is_venue_experience_shown";
  }
  [v4 setObject:v10 forKey:v11];

  char v5 = *(unsigned char *)(a1 + 16);
  if ((v5 & 4) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if (v5)
  {
LABEL_24:
    uint64_t v14 = *(int *)(a1 + 8);
    if (v14 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E53F8018[v14];
    }
    if (a2) {
      v16 = @"activeNavMode";
    }
    else {
      v16 = @"active_nav_mode";
    }
    [v4 setObject:v15 forKey:v16];
  }
LABEL_31:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateMapUIShown _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateMapUIShown)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMapUIShown *)-[GEOLogMsgStateMapUIShown _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"isAirQualityShown";
      }
      else {
        v6 = @"is_air_quality_shown";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsAirQualityShown:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"isWeatherShown";
      }
      else {
        objc_super v8 = @"is_weather_shown";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsWeatherShown:", objc_msgSend(v9, "BOOLValue"));
      }

      if (a3) {
        v10 = @"isVenueExperienceShown";
      }
      else {
        v10 = @"is_venue_experience_shown";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsVenueExperienceShown:", objc_msgSend(v11, "BOOLValue"));
      }

      if (a3) {
        v12 = @"isLookAroundEntryIconShown";
      }
      else {
        v12 = @"is_look_around_entry_icon_shown";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsLookAroundEntryIconShown:", objc_msgSend(v13, "BOOLValue"));
      }

      if (a3) {
        uint64_t v14 = @"activeNavMode";
      }
      else {
        uint64_t v14 = @"active_nav_mode";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        if ([v16 isEqualToString:@"AUTOMOBILE"])
        {
          uint64_t v17 = 0;
        }
        else if ([v16 isEqualToString:@"TRANSIT"])
        {
          uint64_t v17 = 1;
        }
        else if ([v16 isEqualToString:@"WALKING"])
        {
          uint64_t v17 = 2;
        }
        else if ([v16 isEqualToString:@"BICYCLE"])
        {
          uint64_t v17 = 3;
        }
        else if ([v16 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
        {
          uint64_t v17 = 4;
        }
        else if ([v16 isEqualToString:@"FERRY"])
        {
          uint64_t v17 = 5;
        }
        else if ([v16 isEqualToString:@"RIDESHARE"])
        {
          uint64_t v17 = 6;
        }
        else
        {
          uint64_t v17 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_46:

          goto LABEL_47;
        }
        uint64_t v17 = [v15 intValue];
      }
      [a1 setActiveNavMode:v17];
      goto LABEL_46;
    }
  }
LABEL_47:

  return a1;
}

- (GEOLogMsgStateMapUIShown)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMapUIShown *)-[GEOLogMsgStateMapUIShown _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMapUIShownIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMapUIShownReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgStateMapUIShown *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[12] = self->_isAirQualityShown;
    v5[16] |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v5[15] = self->_isWeatherShown;
  v5[16] |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v5[14] = self->_isVenueExperienceShown;
  v5[16] |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v5[13] = self->_isLookAroundEntryIconShown;
  v5[16] |= 4u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_6:
    *((_DWORD *)v5 + 2) = self->_activeNavMode;
    v5[16] |= 1u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((unsigned char *)result + 12) = self->_isAirQualityShown;
    *((unsigned char *)result + 16) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 15) = self->_isWeatherShown;
  *((unsigned char *)result + 16) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((unsigned char *)result + 14) = self->_isVenueExperienceShown;
  *((unsigned char *)result + 16) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((unsigned char *)result + 13) = self->_isLookAroundEntryIconShown;
  *((unsigned char *)result + 16) |= 4u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 2) = self->_activeNavMode;
  *((unsigned char *)result + 16) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  [(GEOLogMsgStateMapUIShown *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0) {
      goto LABEL_38;
    }
    if (self->_isAirQualityShown)
    {
      if (!*((unsigned char *)v4 + 12)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 12))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 0x10) == 0) {
      goto LABEL_38;
    }
    if (self->_isWeatherShown)
    {
      if (!*((unsigned char *)v4 + 15)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 15))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 0x10) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 8) == 0) {
      goto LABEL_38;
    }
    if (self->_isVenueExperienceShown)
    {
      if (!*((unsigned char *)v4 + 14)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 14))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 8) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 4) != 0)
    {
      if (self->_isLookAroundEntryIconShown)
      {
        if (!*((unsigned char *)v4 + 13)) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }
      if (!*((unsigned char *)v4 + 13)) {
        goto LABEL_34;
      }
    }
LABEL_38:
    BOOL v5 = 0;
    goto LABEL_39;
  }
  if ((*((unsigned char *)v4 + 16) & 4) != 0) {
    goto LABEL_38;
  }
LABEL_34:
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_activeNavMode != *((_DWORD *)v4 + 2)) {
      goto LABEL_38;
    }
    BOOL v5 = 1;
  }
LABEL_39:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateMapUIShown *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_isAirQualityShown;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_isWeatherShown;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_isVenueExperienceShown;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
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
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_isLookAroundEntryIconShown;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_activeNavMode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 16);
  if ((v4 & 2) != 0)
  {
    self->_isAirQualityShown = *((unsigned char *)v5 + 12);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 16);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v5 + 16) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_isWeatherShown = *((unsigned char *)v5 + 15);
  *(unsigned char *)&self->_flags |= 0x10u;
  char v4 = *((unsigned char *)v5 + 16);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_isVenueExperienceShown = *((unsigned char *)v5 + 14);
  *(unsigned char *)&self->_flags |= 8u;
  char v4 = *((unsigned char *)v5 + 16);
  if ((v4 & 4) == 0)
  {
LABEL_5:
    if ((v4 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_isLookAroundEntryIconShown = *((unsigned char *)v5 + 13);
  *(unsigned char *)&self->_flags |= 4u;
  if (*((unsigned char *)v5 + 16))
  {
LABEL_6:
    self->_activeNavMode = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_7:
}

@end