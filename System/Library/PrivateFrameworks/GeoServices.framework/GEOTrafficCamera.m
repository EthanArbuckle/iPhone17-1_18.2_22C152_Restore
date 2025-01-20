@interface GEOTrafficCamera
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCameraPriority;
- (BOOL)hasCountryCodeStyleId;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHighlightDistance;
- (BOOL)hasIdentifier;
- (BOOL)hasInfoCard;
- (BOOL)hasPosition;
- (BOOL)hasSpeedLimitText;
- (BOOL)hasSpeedThreshold;
- (BOOL)hasSpeedingCard;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)position;
- (GEOMiniCard)infoCard;
- (GEOMiniCard)speedingCard;
- (GEOTrafficCamera)init;
- (GEOTrafficCamera)initWithData:(id)a3;
- (GEOTrafficCamera)initWithDictionary:(id)a3;
- (GEOTrafficCamera)initWithJSON:(id)a3;
- (NSString)identifier;
- (NSString)speedLimitText;
- (PBUnknownFields)unknownFields;
- (double)speedThreshold;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unsigned)cameraPriority;
- (unsigned)countryCodeStyleId;
- (unsigned)highlightDistance;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readIdentifier;
- (void)_readInfoCard;
- (void)_readPosition;
- (void)_readSpeedLimitText;
- (void)_readSpeedingCard;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCameraPriority:(unsigned int)a3;
- (void)setCountryCodeStyleId:(unsigned int)a3;
- (void)setHasCameraPriority:(BOOL)a3;
- (void)setHasCountryCodeStyleId:(BOOL)a3;
- (void)setHasHighlightDistance:(BOOL)a3;
- (void)setHasSpeedThreshold:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHighlightDistance:(unsigned int)a3;
- (void)setIdentifier:(id)a3;
- (void)setInfoCard:(id)a3;
- (void)setPosition:(id)a3;
- (void)setSpeedLimitText:(id)a3;
- (void)setSpeedThreshold:(double)a3;
- (void)setSpeedingCard:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTrafficCamera

- (GEOTrafficCamera)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTrafficCamera;
  v2 = [(GEOTrafficCamera *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTrafficCamera)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTrafficCamera;
  v3 = [(GEOTrafficCamera *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficCameraReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIdentifier_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOTrafficCamera _readIdentifier]((uint64_t)self);
  identifier = self->_identifier;

  return identifier;
}

- (void)setIdentifier:(id)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2064;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasType
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E0780[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SPEED_LIMIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RED_LIGHT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BUS_LANE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EMERGENCY_LANE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SURVEILLANCE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"OTHER_VIOLATION"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readPosition
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficCameraReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPosition_tags_8059);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasPosition
{
  return self->_position != 0;
}

- (GEOLatLng)position
{
  -[GEOTrafficCamera _readPosition]((uint64_t)self);
  position = self->_position;

  return position;
}

- (void)setPosition:(id)a3
{
  *(_WORD *)&self->_flags |= 0x900u;
  objc_storeStrong((id *)&self->_position, a3);
}

- (unsigned)highlightDistance
{
  return self->_highlightDistance;
}

- (void)setHighlightDistance:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_highlightDistance = a3;
}

- (void)setHasHighlightDistance:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2056;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasHighlightDistance
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)_readInfoCard
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficCameraReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInfoCard_tags_8060);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasInfoCard
{
  return self->_infoCard != 0;
}

- (GEOMiniCard)infoCard
{
  -[GEOTrafficCamera _readInfoCard]((uint64_t)self);
  infoCard = self->_infoCard;

  return infoCard;
}

- (void)setInfoCard:(id)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  objc_storeStrong((id *)&self->_infoCard, a3);
}

- (void)_readSpeedLimitText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficCameraReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpeedLimitText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasSpeedLimitText
{
  return self->_speedLimitText != 0;
}

- (NSString)speedLimitText
{
  -[GEOTrafficCamera _readSpeedLimitText]((uint64_t)self);
  speedLimitText = self->_speedLimitText;

  return speedLimitText;
}

- (void)setSpeedLimitText:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_speedLimitText, a3);
}

- (double)speedThreshold
{
  return self->_speedThreshold;
}

- (void)setSpeedThreshold:(double)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_speedThreshold = a3;
}

- (void)setHasSpeedThreshold:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasSpeedThreshold
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readSpeedingCard
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficCameraReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpeedingCard_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasSpeedingCard
{
  return self->_speedingCard != 0;
}

- (GEOMiniCard)speedingCard
{
  -[GEOTrafficCamera _readSpeedingCard]((uint64_t)self);
  speedingCard = self->_speedingCard;

  return speedingCard;
}

- (void)setSpeedingCard:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC00u;
  objc_storeStrong((id *)&self->_speedingCard, a3);
}

- (unsigned)cameraPriority
{
  return self->_cameraPriority;
}

- (void)setCameraPriority:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_cameraPriority = a3;
}

- (void)setHasCameraPriority:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2050;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasCameraPriority
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unsigned)countryCodeStyleId
{
  return self->_countryCodeStyleId;
}

- (void)setCountryCodeStyleId:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_countryCodeStyleId = a3;
}

- (void)setHasCountryCodeStyleId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2052;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasCountryCodeStyleId
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTrafficCamera;
  int v4 = [(GEOTrafficCamera *)&v8 description];
  v5 = [(GEOTrafficCamera *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTrafficCamera _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 identifier];
    if (v5) {
      [v4 setObject:v5 forKey:@"identifier"];
    }

    if ((*(_WORD *)(a1 + 100) & 0x10) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 96);
      if (v6 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 96));
        objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v7 = off_1E53E0780[v6];
      }
      [v4 setObject:v7 forKey:@"type"];
    }
    objc_super v8 = [(id)a1 position];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"position"];
    }
    if ((*(_WORD *)(a1 + 100) & 8) != 0)
    {
      v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
      if (a2) {
        v12 = @"highlightDistance";
      }
      else {
        v12 = @"highlight_distance";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [(id)a1 infoCard];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"infoCard";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"info_card";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = [(id)a1 speedLimitText];
    if (v17)
    {
      if (a2) {
        v18 = @"speedLimitText";
      }
      else {
        v18 = @"speed_limit_text";
      }
      [v4 setObject:v17 forKey:v18];
    }

    if (*(_WORD *)(a1 + 100))
    {
      v19 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
      if (a2) {
        v20 = @"speedThreshold";
      }
      else {
        v20 = @"speed_threshold";
      }
      [v4 setObject:v19 forKey:v20];
    }
    v21 = [(id)a1 speedingCard];
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        v23 = [v21 jsonRepresentation];
        v24 = @"speedingCard";
      }
      else
      {
        v23 = [v21 dictionaryRepresentation];
        v24 = @"speeding_card";
      }
      [v4 setObject:v23 forKey:v24];
    }
    __int16 v25 = *(_WORD *)(a1 + 100);
    if ((v25 & 2) != 0)
    {
      v26 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
      if (a2) {
        v27 = @"cameraPriority";
      }
      else {
        v27 = @"camera_priority";
      }
      [v4 setObject:v26 forKey:v27];

      __int16 v25 = *(_WORD *)(a1 + 100);
    }
    if ((v25 & 4) != 0)
    {
      v28 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 88)];
      if (a2) {
        v29 = @"countryCodeStyleId";
      }
      else {
        v29 = @"country_code_style_id";
      }
      [v4 setObject:v28 forKey:v29];
    }
    v30 = *(void **)(a1 + 16);
    if (v30)
    {
      v31 = [v30 dictionaryRepresentation];
      v32 = v31;
      if (a2)
      {
        v33 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __46__GEOTrafficCamera__dictionaryRepresentation___block_invoke;
        v37[3] = &unk_1E53D8860;
        id v34 = v33;
        id v38 = v34;
        [v32 enumerateKeysAndObjectsUsingBlock:v37];
        id v35 = v34;

        v32 = v35;
      }
      [v4 setObject:v32 forKey:@"Unknown Fields"];
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
  return -[GEOTrafficCamera _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOTrafficCamera__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTrafficCamera)initWithDictionary:(id)a3
{
  return (GEOTrafficCamera *)-[GEOTrafficCamera _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_72;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_72;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = (void *)[v6 copy];
    [a1 setIdentifier:v7];
  }
  objc_super v8 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if ([v9 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v10 = 0;
    }
    else if ([v9 isEqualToString:@"SPEED_LIMIT"])
    {
      uint64_t v10 = 1;
    }
    else if ([v9 isEqualToString:@"RED_LIGHT"])
    {
      uint64_t v10 = 2;
    }
    else if ([v9 isEqualToString:@"BUS_LANE"])
    {
      uint64_t v10 = 3;
    }
    else if ([v9 isEqualToString:@"EMERGENCY_LANE"])
    {
      uint64_t v10 = 4;
    }
    else if ([v9 isEqualToString:@"SURVEILLANCE"])
    {
      uint64_t v10 = 5;
    }
    else if ([v9 isEqualToString:@"OTHER_VIOLATION"])
    {
      uint64_t v10 = 6;
    }
    else
    {
      uint64_t v10 = 0;
    }

    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v8 intValue];
LABEL_24:
    [a1 setType:v10];
  }

  v11 = [v5 objectForKeyedSubscript:@"position"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v13 = [(GEOLatLng *)v12 initWithJSON:v11];
    }
    else {
      uint64_t v13 = [(GEOLatLng *)v12 initWithDictionary:v11];
    }
    v14 = (void *)v13;
    [a1 setPosition:v13];
  }
  if (a3) {
    v15 = @"highlightDistance";
  }
  else {
    v15 = @"highlight_distance";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setHighlightDistance:", objc_msgSend(v16, "unsignedIntValue"));
  }

  if (a3) {
    v17 = @"infoCard";
  }
  else {
    v17 = @"info_card";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = [GEOMiniCard alloc];
    if (a3) {
      uint64_t v20 = [(GEOMiniCard *)v19 initWithJSON:v18];
    }
    else {
      uint64_t v20 = [(GEOMiniCard *)v19 initWithDictionary:v18];
    }
    v21 = (void *)v20;
    [a1 setInfoCard:v20];
  }
  if (a3) {
    v22 = @"speedLimitText";
  }
  else {
    v22 = @"speed_limit_text";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = (void *)[v23 copy];
    [a1 setSpeedLimitText:v24];
  }
  if (a3) {
    __int16 v25 = @"speedThreshold";
  }
  else {
    __int16 v25 = @"speed_threshold";
  }
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v26 doubleValue];
    objc_msgSend(a1, "setSpeedThreshold:");
  }

  if (a3) {
    v27 = @"speedingCard";
  }
  else {
    v27 = @"speeding_card";
  }
  v28 = [v5 objectForKeyedSubscript:v27];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v29 = [GEOMiniCard alloc];
    if (a3) {
      uint64_t v30 = [(GEOMiniCard *)v29 initWithJSON:v28];
    }
    else {
      uint64_t v30 = [(GEOMiniCard *)v29 initWithDictionary:v28];
    }
    v31 = (void *)v30;
    [a1 setSpeedingCard:v30];
  }
  if (a3) {
    v32 = @"cameraPriority";
  }
  else {
    v32 = @"camera_priority";
  }
  v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCameraPriority:", objc_msgSend(v33, "unsignedIntValue"));
  }

  if (a3) {
    id v34 = @"countryCodeStyleId";
  }
  else {
    id v34 = @"country_code_style_id";
  }
  id v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCountryCodeStyleId:", objc_msgSend(v35, "unsignedIntValue"));
  }

LABEL_72:
  return a1;
}

- (GEOTrafficCamera)initWithJSON:(id)a3
{
  return (GEOTrafficCamera *)-[GEOTrafficCamera _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_8091;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_8092;
    }
    GEOTrafficCameraReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOLatLng *)self->_position readAll:1];
    [(GEOMiniCard *)self->_infoCard readAll:1];
    [(GEOMiniCard *)self->_speedingCard readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTrafficCameraIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTrafficCameraReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTrafficCameraIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTrafficCamera *)self readAll:0];
    if (self->_identifier) {
      PBDataWriterWriteStringField();
    }
    id v5 = v9;
    if ((*(_WORD *)&self->_flags & 0x10) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v9;
    }
    if (self->_position)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if ((*(_WORD *)&self->_flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v9;
    }
    if (self->_infoCard)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_speedLimitText)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    if (*(_WORD *)&self->_flags)
    {
      PBDataWriterWriteDoubleField();
      id v5 = v9;
    }
    if (self->_speedingCard)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v9;
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOTrafficCamera _readPosition]((uint64_t)self);
  position = self->_position;

  return [(GEOLatLng *)position hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v6 = (id *)a3;
  [(GEOTrafficCamera *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 18) = self->_readerMarkPos;
  *((_DWORD *)v6 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_identifier) {
    objc_msgSend(v6, "setIdentifier:");
  }
  int v4 = v6;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v6 + 24) = self->_type;
    *((_WORD *)v6 + 50) |= 0x10u;
  }
  if (self->_position)
  {
    objc_msgSend(v6, "setPosition:");
    int v4 = v6;
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v4 + 23) = self->_highlightDistance;
    *((_WORD *)v4 + 50) |= 8u;
  }
  if (self->_infoCard)
  {
    objc_msgSend(v6, "setInfoCard:");
    int v4 = v6;
  }
  if (self->_speedLimitText)
  {
    objc_msgSend(v6, "setSpeedLimitText:");
    int v4 = v6;
  }
  if (*(_WORD *)&self->_flags)
  {
    v4[7] = *(id *)&self->_speedThreshold;
    *((_WORD *)v4 + 50) |= 1u;
  }
  if (self->_speedingCard)
  {
    objc_msgSend(v6, "setSpeedingCard:");
    int v4 = v6;
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_cameraPriority;
    *((_WORD *)v4 + 50) |= 2u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_countryCodeStyleId;
    *((_WORD *)v4 + 50) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTrafficCameraReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_16;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTrafficCamera *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_type;
    *(_WORD *)(v5 + 100) |= 0x10u;
  }
  id v11 = [(GEOLatLng *)self->_position copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_highlightDistance;
    *(_WORD *)(v5 + 100) |= 8u;
  }
  id v13 = [(GEOMiniCard *)self->_infoCard copyWithZone:a3];
  v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  uint64_t v15 = [(NSString *)self->_speedLimitText copyWithZone:a3];
  v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  if (*(_WORD *)&self->_flags)
  {
    *(double *)(v5 + 56) = self->_speedThreshold;
    *(_WORD *)(v5 + 100) |= 1u;
  }
  id v17 = [(GEOMiniCard *)self->_speedingCard copyWithZone:a3];
  v18 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v17;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_cameraPriority;
    *(_WORD *)(v5 + 100) |= 2u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_countryCodeStyleId;
    *(_WORD *)(v5 + 100) |= 4u;
  }
  uint64_t v20 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v20;
LABEL_16:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  [(GEOTrafficCamera *)self readAll:1];
  [v4 readAll:1];
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_38;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 50);
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 24)) {
      goto LABEL_38;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_38;
  }
  position = self->_position;
  if ((unint64_t)position | *((void *)v4 + 5))
  {
    if (!-[GEOLatLng isEqual:](position, "isEqual:")) {
      goto LABEL_38;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v7 = *((_WORD *)v4 + 50);
  }
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_highlightDistance != *((_DWORD *)v4 + 23)) {
      goto LABEL_38;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_38;
  }
  infoCard = self->_infoCard;
  if ((unint64_t)infoCard | *((void *)v4 + 4) && !-[GEOMiniCard isEqual:](infoCard, "isEqual:")) {
    goto LABEL_38;
  }
  speedLimitText = self->_speedLimitText;
  if ((unint64_t)speedLimitText | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](speedLimitText, "isEqual:")) {
      goto LABEL_38;
    }
  }
  __int16 v11 = (__int16)self->_flags;
  __int16 v12 = *((_WORD *)v4 + 50);
  if (v11)
  {
    if ((v12 & 1) == 0 || self->_speedThreshold != *((double *)v4 + 7)) {
      goto LABEL_38;
    }
  }
  else if (v12)
  {
    goto LABEL_38;
  }
  speedingCard = self->_speedingCard;
  if ((unint64_t)speedingCard | *((void *)v4 + 8))
  {
    if (-[GEOMiniCard isEqual:](speedingCard, "isEqual:"))
    {
      __int16 v11 = (__int16)self->_flags;
      __int16 v12 = *((_WORD *)v4 + 50);
      goto LABEL_29;
    }
LABEL_38:
    BOOL v14 = 0;
    goto LABEL_39;
  }
LABEL_29:
  if ((v11 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_cameraPriority != *((_DWORD *)v4 + 21)) {
      goto LABEL_38;
    }
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_38;
  }
  BOOL v14 = (v12 & 4) == 0;
  if ((v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_countryCodeStyleId != *((_DWORD *)v4 + 22)) {
      goto LABEL_38;
    }
    BOOL v14 = 1;
  }
LABEL_39:

  return v14;
}

- (unint64_t)hash
{
  [(GEOTrafficCamera *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  if ((*(_WORD *)&self->_flags & 0x10) != 0) {
    uint64_t v4 = 2654435761 * self->_type;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(GEOLatLng *)self->_position hash];
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    uint64_t v6 = 2654435761 * self->_highlightDistance;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(GEOMiniCard *)self->_infoCard hash];
  NSUInteger v8 = [(NSString *)self->_speedLimitText hash];
  if (*(_WORD *)&self->_flags)
  {
    double speedThreshold = self->_speedThreshold;
    double v11 = -speedThreshold;
    if (speedThreshold >= 0.0) {
      double v11 = self->_speedThreshold;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  unint64_t v14 = [(GEOMiniCard *)self->_speedingCard hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    uint64_t v16 = 2654435761 * self->_cameraPriority;
    if ((flags & 4) != 0) {
      goto LABEL_17;
    }
LABEL_19:
    uint64_t v17 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v16 ^ v17;
  }
  uint64_t v16 = 0;
  if ((flags & 4) == 0) {
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v17 = 2654435761 * self->_countryCodeStyleId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  long double v12 = a3;
  [v12 readAll:0];
  uint64_t v4 = v12;
  if (v12[3])
  {
    -[GEOTrafficCamera setIdentifier:](self, "setIdentifier:");
    uint64_t v4 = v12;
  }
  if ((*((_WORD *)v4 + 50) & 0x10) != 0)
  {
    self->_type = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_flags |= 0x10u;
  }
  position = self->_position;
  uint64_t v6 = v4[5];
  if (position)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOLatLng mergeFrom:](position, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOTrafficCamera setPosition:](self, "setPosition:");
  }
  uint64_t v4 = v12;
LABEL_11:
  if ((*((_WORD *)v4 + 50) & 8) != 0)
  {
    self->_highlightDistance = *((_DWORD *)v4 + 23);
    *(_WORD *)&self->_flags |= 8u;
  }
  infoCard = self->_infoCard;
  uint64_t v8 = v4[4];
  if (infoCard)
  {
    if (!v8) {
      goto LABEL_19;
    }
    -[GEOMiniCard mergeFrom:](infoCard, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_19;
    }
    -[GEOTrafficCamera setInfoCard:](self, "setInfoCard:");
  }
  uint64_t v4 = v12;
LABEL_19:
  if (v4[6])
  {
    -[GEOTrafficCamera setSpeedLimitText:](self, "setSpeedLimitText:");
    uint64_t v4 = v12;
  }
  if (*((_WORD *)v4 + 50))
  {
    self->_double speedThreshold = (double)v4[7];
    *(_WORD *)&self->_flags |= 1u;
  }
  speedingCard = self->_speedingCard;
  uint64_t v10 = v4[8];
  if (speedingCard)
  {
    if (!v10) {
      goto LABEL_29;
    }
    -[GEOMiniCard mergeFrom:](speedingCard, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_29;
    }
    -[GEOTrafficCamera setSpeedingCard:](self, "setSpeedingCard:");
  }
  uint64_t v4 = v12;
LABEL_29:
  __int16 v11 = *((_WORD *)v4 + 50);
  if ((v11 & 2) != 0)
  {
    self->_cameraPriority = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 2u;
    __int16 v11 = *((_WORD *)v4 + 50);
  }
  if ((v11 & 4) != 0)
  {
    self->_countryCodeStyleId = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 4u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOTrafficCameraReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_8096);
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
  *(_WORD *)&self->_flags |= 0x820u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTrafficCamera *)self readAll:0];
    [(GEOLatLng *)self->_position clearUnknownFields:1];
    [(GEOMiniCard *)self->_infoCard clearUnknownFields:1];
    speedingCard = self->_speedingCard;
    [(GEOMiniCard *)speedingCard clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speedingCard, 0);
  objc_storeStrong((id *)&self->_speedLimitText, 0);
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_infoCard, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end