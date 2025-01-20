@interface GEORPNavigationSettings
+ (BOOL)isValid:(id)a3;
- (BOOL)beepBeforeInstruction;
- (BOOL)hasBeepBeforeInstruction;
- (BOOL)hasDistanceUnits;
- (BOOL)hasMaxAlternateRouteCount;
- (BOOL)hasMuteSpeechOverride;
- (BOOL)hasPauseSpokenAudio;
- (BOOL)hasShouldUseGuidanceEventManager;
- (BOOL)hasSpeechEnabled;
- (BOOL)hasUserPreferredTransportType;
- (BOOL)hasVoiceLanguage;
- (BOOL)hasVoiceVolume;
- (BOOL)isEqual:(id)a3;
- (BOOL)muteSpeechOverride;
- (BOOL)pauseSpokenAudio;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldUseGuidanceEventManager;
- (BOOL)speechEnabled;
- (GEORPNavigationSettings)initWithDictionary:(id)a3;
- (GEORPNavigationSettings)initWithJSON:(id)a3;
- (NSString)voiceLanguage;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)userPreferredTransportTypeAsString:(int)a3;
- (int)StringAsUserPreferredTransportType:(id)a3;
- (int)userPreferredTransportType;
- (unint64_t)distanceUnits;
- (unint64_t)hash;
- (unint64_t)maxAlternateRouteCount;
- (unint64_t)voiceVolume;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBeepBeforeInstruction:(BOOL)a3;
- (void)setDistanceUnits:(unint64_t)a3;
- (void)setHasBeepBeforeInstruction:(BOOL)a3;
- (void)setHasDistanceUnits:(BOOL)a3;
- (void)setHasMaxAlternateRouteCount:(BOOL)a3;
- (void)setHasMuteSpeechOverride:(BOOL)a3;
- (void)setHasPauseSpokenAudio:(BOOL)a3;
- (void)setHasShouldUseGuidanceEventManager:(BOOL)a3;
- (void)setHasSpeechEnabled:(BOOL)a3;
- (void)setHasUserPreferredTransportType:(BOOL)a3;
- (void)setHasVoiceVolume:(BOOL)a3;
- (void)setMaxAlternateRouteCount:(unint64_t)a3;
- (void)setMuteSpeechOverride:(BOOL)a3;
- (void)setPauseSpokenAudio:(BOOL)a3;
- (void)setShouldUseGuidanceEventManager:(BOOL)a3;
- (void)setSpeechEnabled:(BOOL)a3;
- (void)setUserPreferredTransportType:(int)a3;
- (void)setVoiceLanguage:(id)a3;
- (void)setVoiceVolume:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPNavigationSettings

- (unint64_t)voiceVolume
{
  return self->_voiceVolume;
}

- (void)setVoiceVolume:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 4u;
  self->_voiceVolume = a3;
}

- (void)setHasVoiceVolume:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasVoiceVolume
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unint64_t)distanceUnits
{
  return self->_distanceUnits;
}

- (void)setDistanceUnits:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 1u;
  self->_distanceUnits = a3;
}

- (void)setHasDistanceUnits:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (BOOL)hasDistanceUnits
{
  return *(_WORD *)&self->_flags & 1;
}

- (BOOL)pauseSpokenAudio
{
  return self->_pauseSpokenAudio;
}

- (void)setPauseSpokenAudio:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x40u;
  self->_pauseSpokenAudio = a3;
}

- (void)setHasPauseSpokenAudio:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasPauseSpokenAudio
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (BOOL)muteSpeechOverride
{
  return self->_muteSpeechOverride;
}

- (void)setMuteSpeechOverride:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x20u;
  self->_muteSpeechOverride = a3;
}

- (void)setHasMuteSpeechOverride:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasMuteSpeechOverride
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (BOOL)speechEnabled
{
  return self->_speechEnabled;
}

- (void)setSpeechEnabled:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x100u;
  self->_speechEnabled = a3;
}

- (void)setHasSpeechEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasSpeechEnabled
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (unint64_t)maxAlternateRouteCount
{
  return self->_maxAlternateRouteCount;
}

- (void)setMaxAlternateRouteCount:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 2u;
  self->_maxAlternateRouteCount = a3;
}

- (void)setHasMaxAlternateRouteCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasMaxAlternateRouteCount
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (BOOL)beepBeforeInstruction
{
  return self->_beepBeforeInstruction;
}

- (void)setBeepBeforeInstruction:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x10u;
  self->_beepBeforeInstruction = a3;
}

- (void)setHasBeepBeforeInstruction:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasBeepBeforeInstruction
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (BOOL)hasVoiceLanguage
{
  return self->_voiceLanguage != 0;
}

- (NSString)voiceLanguage
{
  return self->_voiceLanguage;
}

- (void)setVoiceLanguage:(id)a3
{
}

- (BOOL)shouldUseGuidanceEventManager
{
  return self->_shouldUseGuidanceEventManager;
}

- (void)setShouldUseGuidanceEventManager:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x80u;
  self->_shouldUseGuidanceEventManager = a3;
}

- (void)setHasShouldUseGuidanceEventManager:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasShouldUseGuidanceEventManager
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (int)userPreferredTransportType
{
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    return self->_userPreferredTransportType;
  }
  else {
    return 0;
  }
}

- (void)setUserPreferredTransportType:(int)a3
{
  *(_WORD *)&self->_flags |= 8u;
  self->_userPreferredTransportType = a3;
}

- (void)setHasUserPreferredTransportType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasUserPreferredTransportType
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)userPreferredTransportTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E6B50[a3];
  }

  return v3;
}

- (int)StringAsUserPreferredTransportType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_DRIVING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_TRANSIT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_RIDESHARE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_CYCLING"])
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
  v8.super_class = (Class)GEORPNavigationSettings;
  int v4 = [(GEORPNavigationSettings *)&v8 description];
  v5 = [(GEORPNavigationSettings *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPNavigationSettings _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_56;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 4) != 0)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
    if (a2) {
      v7 = @"voiceVolume";
    }
    else {
      v7 = @"voice_volume";
    }
    [v4 setObject:v6 forKey:v7];

    __int16 v5 = *(_WORD *)(a1 + 52);
  }
  if (v5)
  {
    v17 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
    if (a2) {
      v18 = @"distanceUnits";
    }
    else {
      v18 = @"distance_units";
    }
    [v4 setObject:v17 forKey:v18];

    __int16 v5 = *(_WORD *)(a1 + 52);
    if ((v5 & 0x40) == 0)
    {
LABEL_9:
      if ((v5 & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_38;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_9;
  }
  v19 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 46)];
  if (a2) {
    v20 = @"pauseSpokenAudio";
  }
  else {
    v20 = @"pause_spoken_audio";
  }
  [v4 setObject:v19 forKey:v20];

  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_38:
  v21 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 45)];
  if (a2) {
    v22 = @"muteSpeechOverride";
  }
  else {
    v22 = @"mute_speech_override";
  }
  [v4 setObject:v21 forKey:v22];

  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0) {
      goto LABEL_12;
    }
LABEL_46:
    v25 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
    if (a2) {
      v26 = @"maxAlternateRouteCount";
    }
    else {
      v26 = @"max_alternate_route_count";
    }
    [v4 setObject:v25 forKey:v26];

    if ((*(_WORD *)(a1 + 52) & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
LABEL_42:
  v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  if (a2) {
    v24 = @"speechEnabled";
  }
  else {
    v24 = @"speech_enabled";
  }
  [v4 setObject:v23 forKey:v24];

  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 2) != 0) {
    goto LABEL_46;
  }
LABEL_12:
  if ((v5 & 0x10) != 0)
  {
LABEL_13:
    objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 44)];
    if (a2) {
      v9 = @"beepBeforeInstruction";
    }
    else {
      v9 = @"beep_before_instruction";
    }
    [v4 setObject:v8 forKey:v9];
  }
LABEL_17:
  v10 = [(id)a1 voiceLanguage];
  if (v10)
  {
    if (a2) {
      v11 = @"voiceLanguage";
    }
    else {
      v11 = @"voice_language";
    }
    [v4 setObject:v10 forKey:v11];
  }

  __int16 v12 = *(_WORD *)(a1 + 52);
  if ((v12 & 0x80) != 0)
  {
    v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 47)];
    if (a2) {
      v14 = @"shouldUseGuidanceEventManager";
    }
    else {
      v14 = @"should_use_guidance_event_manager";
    }
    [v4 setObject:v13 forKey:v14];

    __int16 v12 = *(_WORD *)(a1 + 52);
  }
  if ((v12 & 8) != 0)
  {
    uint64_t v15 = *(int *)(a1 + 40);
    if (v15 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 40));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E53E6B50[v15];
    }
    if (a2) {
      v27 = @"userPreferredTransportType";
    }
    else {
      v27 = @"user_preferred_transport_type";
    }
    [v4 setObject:v16 forKey:v27];
  }
LABEL_56:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPNavigationSettings _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPNavigationSettings)initWithDictionary:(id)a3
{
  return (GEORPNavigationSettings *)-[GEORPNavigationSettings _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"voiceVolume";
      }
      else {
        v6 = @"voice_volume";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setVoiceVolume:", objc_msgSend(v7, "unsignedLongLongValue"));
      }

      if (a3) {
        objc_super v8 = @"distanceUnits";
      }
      else {
        objc_super v8 = @"distance_units";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDistanceUnits:", objc_msgSend(v9, "unsignedLongLongValue"));
      }

      if (a3) {
        v10 = @"pauseSpokenAudio";
      }
      else {
        v10 = @"pause_spoken_audio";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setPauseSpokenAudio:", objc_msgSend(v11, "BOOLValue"));
      }

      if (a3) {
        __int16 v12 = @"muteSpeechOverride";
      }
      else {
        __int16 v12 = @"mute_speech_override";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMuteSpeechOverride:", objc_msgSend(v13, "BOOLValue"));
      }

      if (a3) {
        v14 = @"speechEnabled";
      }
      else {
        v14 = @"speech_enabled";
      }
      uint64_t v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSpeechEnabled:", objc_msgSend(v15, "BOOLValue"));
      }

      if (a3) {
        v16 = @"maxAlternateRouteCount";
      }
      else {
        v16 = @"max_alternate_route_count";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMaxAlternateRouteCount:", objc_msgSend(v17, "unsignedLongLongValue"));
      }

      if (a3) {
        v18 = @"beepBeforeInstruction";
      }
      else {
        v18 = @"beep_before_instruction";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setBeepBeforeInstruction:", objc_msgSend(v19, "BOOLValue"));
      }

      if (a3) {
        v20 = @"voiceLanguage";
      }
      else {
        v20 = @"voice_language";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = (void *)[v21 copy];
        [a1 setVoiceLanguage:v22];
      }
      if (a3) {
        v23 = @"shouldUseGuidanceEventManager";
      }
      else {
        v23 = @"should_use_guidance_event_manager";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setShouldUseGuidanceEventManager:", objc_msgSend(v24, "BOOLValue"));
      }

      if (a3) {
        v25 = @"userPreferredTransportType";
      }
      else {
        v25 = @"user_preferred_transport_type";
      }
      v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v27 = v26;
        if ([v27 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_NONE"])
        {
          uint64_t v28 = 0;
        }
        else if ([v27 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_DRIVING"])
        {
          uint64_t v28 = 1;
        }
        else if ([v27 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_WALKING"])
        {
          uint64_t v28 = 2;
        }
        else if ([v27 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_TRANSIT"])
        {
          uint64_t v28 = 3;
        }
        else if ([v27 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_RIDESHARE"])
        {
          uint64_t v28 = 4;
        }
        else if ([v27 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_CYCLING"])
        {
          uint64_t v28 = 5;
        }
        else
        {
          uint64_t v28 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_69:

          goto LABEL_70;
        }
        uint64_t v28 = [v26 intValue];
      }
      [a1 setUserPreferredTransportType:v28];
      goto LABEL_69;
    }
  }
LABEL_70:

  return a1;
}

- (GEORPNavigationSettings)initWithJSON:(id)a3
{
  return (GEORPNavigationSettings *)-[GEORPNavigationSettings _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPNavigationSettingsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPNavigationSettingsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_flags & 0x10) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
  if (self->_voiceLanguage) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_flags;
  if ((v5 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v5 = (__int16)self->_flags;
  }
  if ((v5 & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  v7 = a3;
  [(GEORPNavigationSettings *)self readAll:0];
  int v4 = v7;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v7[4] = self->_voiceVolume;
    *((_WORD *)v7 + 26) |= 4u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v7[1] = self->_distanceUnits;
  *((_WORD *)v7 + 26) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)v7 + 46) = self->_pauseSpokenAudio;
  *((_WORD *)v7 + 26) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((unsigned char *)v7 + 45) = self->_muteSpeechOverride;
  *((_WORD *)v7 + 26) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((unsigned char *)v7 + 48) = self->_speechEnabled;
  *((_WORD *)v7 + 26) |= 0x100u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_23:
  v7[2] = self->_maxAlternateRouteCount;
  *((_WORD *)v7 + 26) |= 2u;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_8:
    *((unsigned char *)v7 + 44) = self->_beepBeforeInstruction;
    *((_WORD *)v7 + 26) |= 0x10u;
  }
LABEL_9:
  if (self->_voiceLanguage)
  {
    objc_msgSend(v7, "setVoiceLanguage:");
    int v4 = v7;
  }
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x80) != 0)
  {
    v4[47] = self->_shouldUseGuidanceEventManager;
    *((_WORD *)v4 + 26) |= 0x80u;
    __int16 v6 = (__int16)self->_flags;
  }
  if ((v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_userPreferredTransportType;
    *((_WORD *)v4 + 26) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(void *)(v5 + 32) = self->_voiceVolume;
    *(_WORD *)(v5 + 52) |= 4u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 8) = self->_distanceUnits;
  *(_WORD *)(v5 + 52) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(unsigned char *)(v5 + 46) = self->_pauseSpokenAudio;
  *(_WORD *)(v5 + 52) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(unsigned char *)(v5 + 45) = self->_muteSpeechOverride;
  *(_WORD *)(v5 + 52) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(unsigned char *)(v5 + 48) = self->_speechEnabled;
  *(_WORD *)(v5 + 52) |= 0x100u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  *(void *)(v5 + 16) = self->_maxAlternateRouteCount;
  *(_WORD *)(v5 + 52) |= 2u;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_8:
    *(unsigned char *)(v5 + 44) = self->_beepBeforeInstruction;
    *(_WORD *)(v5 + 52) |= 0x10u;
  }
LABEL_9:
  uint64_t v8 = [(NSString *)self->_voiceLanguage copyWithZone:a3];
  v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 0x80) != 0)
  {
    *(unsigned char *)(v6 + 47) = self->_shouldUseGuidanceEventManager;
    *(_WORD *)(v6 + 52) |= 0x80u;
    __int16 v10 = (__int16)self->_flags;
  }
  if ((v10 & 8) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_userPreferredTransportType;
    *(_WORD *)(v6 + 52) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_65;
  }
  [(GEORPNavigationSettings *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 26);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_voiceVolume != *((void *)v4 + 4)) {
      goto LABEL_65;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_65;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_distanceUnits != *((void *)v4 + 1)) {
      goto LABEL_65;
    }
  }
  else if (v6)
  {
    goto LABEL_65;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0) {
      goto LABEL_65;
    }
    if (self->_pauseSpokenAudio)
    {
      if (!*((unsigned char *)v4 + 46)) {
        goto LABEL_65;
      }
    }
    else if (*((unsigned char *)v4 + 46))
    {
      goto LABEL_65;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_65;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0) {
      goto LABEL_65;
    }
    if (self->_muteSpeechOverride)
    {
      if (!*((unsigned char *)v4 + 45)) {
        goto LABEL_65;
      }
    }
    else if (*((unsigned char *)v4 + 45))
    {
      goto LABEL_65;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_65;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x100) == 0) {
      goto LABEL_65;
    }
    if (self->_speechEnabled)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_65;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_65;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x100) != 0)
  {
    goto LABEL_65;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_maxAlternateRouteCount != *((void *)v4 + 2)) {
      goto LABEL_65;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_65;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0) {
      goto LABEL_65;
    }
    if (self->_beepBeforeInstruction)
    {
      if (!*((unsigned char *)v4 + 44)) {
        goto LABEL_65;
      }
    }
    else if (*((unsigned char *)v4 + 44))
    {
      goto LABEL_65;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_65;
  }
  voiceLanguage = self->_voiceLanguage;
  if ((unint64_t)voiceLanguage | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](voiceLanguage, "isEqual:")) {
      goto LABEL_65;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v6 = *((_WORD *)v4 + 26);
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) != 0)
    {
      if (self->_shouldUseGuidanceEventManager)
      {
        if (!*((unsigned char *)v4 + 47)) {
          goto LABEL_65;
        }
        goto LABEL_60;
      }
      if (!*((unsigned char *)v4 + 47)) {
        goto LABEL_60;
      }
    }
LABEL_65:
    BOOL v8 = 0;
    goto LABEL_66;
  }
  if ((v6 & 0x80) != 0) {
    goto LABEL_65;
  }
LABEL_60:
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_userPreferredTransportType != *((_DWORD *)v4 + 10)) {
      goto LABEL_65;
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = (v6 & 8) == 0;
  }
LABEL_66:

  return v8;
}

- (unint64_t)hash
{
  [(GEORPNavigationSettings *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    unint64_t v4 = 2654435761u * self->_voiceVolume;
    if (flags)
    {
LABEL_3:
      unint64_t v5 = 2654435761u * self->_distanceUnits;
      if ((flags & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if (flags) {
      goto LABEL_3;
    }
  }
  unint64_t v5 = 0;
  if ((flags & 0x40) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_pauseSpokenAudio;
    if ((flags & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((flags & 0x20) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_muteSpeechOverride;
    if ((*(_WORD *)&self->_flags & 0x100) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_speechEnabled;
    if ((flags & 2) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    unint64_t v9 = 0;
    if ((flags & 0x10) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v8 = 0;
  if ((flags & 2) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  unint64_t v9 = 2654435761u * self->_maxAlternateRouteCount;
  if ((flags & 0x10) != 0)
  {
LABEL_8:
    uint64_t v10 = 2654435761 * self->_beepBeforeInstruction;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v10 = 0;
LABEL_16:
  NSUInteger v11 = [(NSString *)self->_voiceLanguage hash];
  __int16 v12 = (__int16)self->_flags;
  if ((v12 & 0x80) != 0)
  {
    uint64_t v13 = 2654435761 * self->_shouldUseGuidanceEventManager;
    if ((v12 & 8) != 0) {
      goto LABEL_18;
    }
LABEL_20:
    uint64_t v14 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v11;
  }
  uint64_t v13 = 0;
  if ((v12 & 8) == 0) {
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v14 = 2654435761 * self->_userPreferredTransportType;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  [v7 readAll:0];
  id v4 = v7;
  __int16 v5 = *((_WORD *)v7 + 26);
  if ((v5 & 4) != 0)
  {
    self->_voiceVolume = *((void *)v7 + 4);
    *(_WORD *)&self->_flags |= 4u;
    __int16 v5 = *((_WORD *)v7 + 26);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_distanceUnits = *((void *)v7 + 1);
  *(_WORD *)&self->_flags |= 1u;
  __int16 v5 = *((_WORD *)v7 + 26);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_pauseSpokenAudio = *((unsigned char *)v7 + 46);
  *(_WORD *)&self->_flags |= 0x40u;
  __int16 v5 = *((_WORD *)v7 + 26);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_muteSpeechOverride = *((unsigned char *)v7 + 45);
  *(_WORD *)&self->_flags |= 0x20u;
  __int16 v5 = *((_WORD *)v7 + 26);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_speechEnabled = *((unsigned char *)v7 + 48);
  *(_WORD *)&self->_flags |= 0x100u;
  __int16 v5 = *((_WORD *)v7 + 26);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_23:
  self->_maxAlternateRouteCount = *((void *)v7 + 2);
  *(_WORD *)&self->_flags |= 2u;
  if ((*((_WORD *)v7 + 26) & 0x10) != 0)
  {
LABEL_8:
    self->_beepBeforeInstruction = *((unsigned char *)v7 + 44);
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_9:
  if (*((void *)v7 + 3))
  {
    -[GEORPNavigationSettings setVoiceLanguage:](self, "setVoiceLanguage:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 26);
  if ((v6 & 0x80) != 0)
  {
    self->_shouldUseGuidanceEventManager = *((unsigned char *)v4 + 47);
    *(_WORD *)&self->_flags |= 0x80u;
    __int16 v6 = *((_WORD *)v4 + 26);
  }
  if ((v6 & 8) != 0)
  {
    self->_userPreferredTransportType = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_flags |= 8u;
  }
}

- (void).cxx_destruct
{
}

@end