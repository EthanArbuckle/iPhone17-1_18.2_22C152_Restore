@interface GEONavVoiceGuidanceSettings
+ (BOOL)isValid:(id)a3;
- (BOOL)hasNavVoiceGuidanceLevel;
- (BOOL)hasTransportMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEONavVoiceGuidanceSettings)initWithDictionary:(id)a3;
- (GEONavVoiceGuidanceSettings)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)navVoiceGuidanceLevelAsString:(int)a3;
- (id)transportModeAsString:(int)a3;
- (int)StringAsNavVoiceGuidanceLevel:(id)a3;
- (int)StringAsTransportMode:(id)a3;
- (int)navVoiceGuidanceLevel;
- (int)transportMode;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNavVoiceGuidanceLevel:(BOOL)a3;
- (void)setHasTransportMode:(BOOL)a3;
- (void)setNavVoiceGuidanceLevel:(int)a3;
- (void)setTransportMode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEONavVoiceGuidanceSettings

- (int)navVoiceGuidanceLevel
{
  if (*(unsigned char *)&self->_flags) {
    return self->_navVoiceGuidanceLevel;
  }
  else {
    return 0;
  }
}

- (void)setNavVoiceGuidanceLevel:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_navVoiceGuidanceLevel = a3;
}

- (void)setHasNavVoiceGuidanceLevel:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasNavVoiceGuidanceLevel
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)navVoiceGuidanceLevelAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F85D8[a3];
  }

  return v3;
}

- (int)StringAsNavVoiceGuidanceLevel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LEVEL_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LEVEL_NONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LEVEL_INCIDENTS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LEVEL_FULL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)transportMode
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_transportMode;
  }
  else {
    return 0;
  }
}

- (void)setTransportMode:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_transportMode = a3;
}

- (void)setHasTransportMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTransportMode
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)transportModeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F85F8[a3];
  }

  return v3;
}

- (int)StringAsTransportMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_MODE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DRIVING_MODE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING_MODE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TRANSIT_MODE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RIDESHARE_MODE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CYCLING_MODE"])
  {
    int v4 = 5;
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
  v8.super_class = (Class)GEONavVoiceGuidanceSettings;
  int v4 = [(GEONavVoiceGuidanceSettings *)&v8 description];
  v5 = [(GEONavVoiceGuidanceSettings *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONavVoiceGuidanceSettings _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 16);
    if (v5)
    {
      uint64_t v6 = *(int *)(a1 + 8);
      if (v6 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53F85D8[v6];
      }
      if (a2) {
        objc_super v8 = @"navVoiceGuidanceLevel";
      }
      else {
        objc_super v8 = @"nav_voice_guidance_level";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 16);
    }
    if ((v5 & 2) != 0)
    {
      uint64_t v9 = *(int *)(a1 + 12);
      if (v9 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 12));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53F85F8[v9];
      }
      if (a2) {
        v11 = @"transportMode";
      }
      else {
        v11 = @"transport_mode";
      }
      [v4 setObject:v10 forKey:v11];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONavVoiceGuidanceSettings _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEONavVoiceGuidanceSettings)initWithDictionary:(id)a3
{
  return (GEONavVoiceGuidanceSettings *)-[GEONavVoiceGuidanceSettings _initWithDictionary:isJSON:](self, a3, 0);
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
        uint64_t v6 = @"navVoiceGuidanceLevel";
      }
      else {
        uint64_t v6 = @"nav_voice_guidance_level";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"LEVEL_UNKNOWN"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"LEVEL_NONE"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"LEVEL_INCIDENTS"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"LEVEL_FULL"])
        {
          uint64_t v9 = 3;
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
          goto LABEL_20;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setNavVoiceGuidanceLevel:v9];
LABEL_20:

      if (a3) {
        v10 = @"transportMode";
      }
      else {
        v10 = @"transport_mode";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        if ([v12 isEqualToString:@"UNKNOWN_TRANSPORT_MODE"])
        {
          uint64_t v13 = 0;
        }
        else if ([v12 isEqualToString:@"DRIVING_MODE"])
        {
          uint64_t v13 = 1;
        }
        else if ([v12 isEqualToString:@"WALKING_MODE"])
        {
          uint64_t v13 = 2;
        }
        else if ([v12 isEqualToString:@"TRANSIT_MODE"])
        {
          uint64_t v13 = 3;
        }
        else if ([v12 isEqualToString:@"RIDESHARE_MODE"])
        {
          uint64_t v13 = 4;
        }
        else if ([v12 isEqualToString:@"CYCLING_MODE"])
        {
          uint64_t v13 = 5;
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_41:

          goto LABEL_42;
        }
        uint64_t v13 = [v11 intValue];
      }
      [a1 setTransportMode:v13];
      goto LABEL_41;
    }
  }
LABEL_42:

  return a1;
}

- (GEONavVoiceGuidanceSettings)initWithJSON:(id)a3
{
  return (GEONavVoiceGuidanceSettings *)-[GEONavVoiceGuidanceSettings _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEONavVoiceGuidanceSettingsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONavVoiceGuidanceSettingsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEONavVoiceGuidanceSettings *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[2] = self->_navVoiceGuidanceLevel;
    *((unsigned char *)v5 + 16) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[3] = self->_transportMode;
    *((unsigned char *)v5 + 16) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)result + 2) = self->_navVoiceGuidanceLevel;
    *((unsigned char *)result + 16) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_transportMode;
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEONavVoiceGuidanceSettings *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_navVoiceGuidanceLevel != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_transportMode != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEONavVoiceGuidanceSettings *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_navVoiceGuidanceLevel;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_transportMode;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 16);
  if (v4)
  {
    self->_navVoiceGuidanceLevel = v5[2];
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 16);
  }
  if ((v4 & 2) != 0)
  {
    self->_transportMode = v5[3];
    *(unsigned char *)&self->_flags |= 2u;
  }
}

@end