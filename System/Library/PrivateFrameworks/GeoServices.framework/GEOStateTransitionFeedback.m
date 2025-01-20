@interface GEOStateTransitionFeedback
+ (BOOL)isValid:(id)a3;
- (BOOL)hasNewValue;
- (BOOL)hasOldValue;
- (BOOL)hasStateType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOStateTransitionFeedback)initWithDictionary:(id)a3;
- (GEOStateTransitionFeedback)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)newValueAsString:(int)a3;
- (id)oldValueAsString:(int)a3;
- (id)stateTypeAsString:(int)a3;
- (int)StringAsNewValue:(id)a3;
- (int)StringAsOldValue:(id)a3;
- (int)StringAsStateType:(id)a3;
- (int)newValue;
- (int)oldValue;
- (int)stateType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNewValue:(BOOL)a3;
- (void)setHasOldValue:(BOOL)a3;
- (void)setHasStateType:(BOOL)a3;
- (void)setNewValue:(int)a3;
- (void)setOldValue:(int)a3;
- (void)setStateType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOStateTransitionFeedback

- (int)stateType
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_stateType;
  }
  else {
    return 1;
  }
}

- (void)setStateType:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_stateType = a3;
}

- (void)setHasStateType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasStateType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)stateTypeAsString:(int)a3
{
  if ((a3 - 1) >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E4AD0[a3 - 1];
  }

  return v3;
}

- (int)StringAsStateType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MAP_DISPLAY_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PITCHED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FLYOVER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TRAFFIC"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"APP_FOCUS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"NAVIGATION_GUIDANCE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"NAVIGATION_OVERVIEW"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"TRACKING"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CARPLAY_TRACKING"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CARPLAY_PITCHED"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"CARPLAY_CONNECTED_STATE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"MAP_APP_STATE"])
  {
    int v4 = 12;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (int)oldValue
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_oldValue;
  }
  else {
    return 1;
  }
}

- (void)setOldValue:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_oldValue = a3;
}

- (void)setHasOldValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasOldValue
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)oldValueAsString:(int)a3
{
  if ((a3 - 1) >= 0x13)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E4B30[a3 - 1];
  }

  return v3;
}

- (int)StringAsOldValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MAP_TYPE_STANDARD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_SATELLITE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_HYBRID"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_SATELLITE_GLOBE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_HYBRID_GLOBE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_NAVIGATION"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_TRANSIT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"FEATURE_ACTIVE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"FEATURE_INACTIVE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"FEATURE_UNAVAILABLE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"APP_FOREGROUND"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"APP_BACKGROUND"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"TRACKING_OFF"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"TRACKING_ON"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"TRACKING_ON_WITH_HEADING"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"APP_STATE_MAP_BROWSING"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"APP_STATE_NAVIGATION"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"APP_STATE_ROUTE_PREVIEW"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"APP_STATE_ROUTE_GENIUS"])
  {
    int v4 = 19;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (int)newValue
{
  if (*(unsigned char *)&self->_flags) {
    return self->_newValue;
  }
  else {
    return 1;
  }
}

- (void)setNewValue:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_newValue = a3;
}

- (void)setHasNewValue:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasNewValue
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)newValueAsString:(int)a3
{
  if ((a3 - 1) < 0x13) {
    return off_1E53E4B30[a3 - 1];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNewValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MAP_TYPE_STANDARD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_SATELLITE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_HYBRID"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_SATELLITE_GLOBE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_HYBRID_GLOBE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_NAVIGATION"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_TRANSIT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"FEATURE_ACTIVE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"FEATURE_INACTIVE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"FEATURE_UNAVAILABLE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"APP_FOREGROUND"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"APP_BACKGROUND"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"TRACKING_OFF"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"TRACKING_ON"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"TRACKING_ON_WITH_HEADING"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"APP_STATE_MAP_BROWSING"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"APP_STATE_NAVIGATION"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"APP_STATE_ROUTE_PREVIEW"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"APP_STATE_ROUTE_GENIUS"])
  {
    int v4 = 19;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOStateTransitionFeedback;
  int v4 = [(GEOStateTransitionFeedback *)&v8 description];
  v5 = [(GEOStateTransitionFeedback *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStateTransitionFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_27;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 4) == 0)
  {
    if ((*(unsigned char *)(a1 + 20) & 2) == 0) {
      goto LABEL_4;
    }
LABEL_13:
    unsigned int v9 = *(_DWORD *)(a1 + 12) - 1;
    if (v9 >= 0x13)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 12));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E53E4B30[v9];
    }
    if (a2) {
      v11 = @"oldValue";
    }
    else {
      v11 = @"old_value";
    }
    [v4 setObject:v10 forKey:v11];

    if ((*(unsigned char *)(a1 + 20) & 1) == 0) {
      goto LABEL_27;
    }
    goto LABEL_20;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 16) - 1;
  if (v6 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 16));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E53E4AD0[v6];
  }
  if (a2) {
    objc_super v8 = @"stateType";
  }
  else {
    objc_super v8 = @"state_type";
  }
  [v4 setObject:v7 forKey:v8];

  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 2) != 0) {
    goto LABEL_13;
  }
LABEL_4:
  if (v5)
  {
LABEL_20:
    unsigned int v12 = *(_DWORD *)(a1 + 8) - 1;
    if (v12 >= 0x13)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 8));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E53E4B30[v12];
    }
    if (a2) {
      v14 = @"newValue";
    }
    else {
      v14 = @"new_value";
    }
    [v4 setObject:v13 forKey:v14];
  }
LABEL_27:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOStateTransitionFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOStateTransitionFeedback)initWithDictionary:(id)a3
{
  return (GEOStateTransitionFeedback *)-[GEOStateTransitionFeedback _initWithDictionary:isJSON:](self, a3, 0);
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
        unsigned int v6 = @"stateType";
      }
      else {
        unsigned int v6 = @"state_type";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"MAP_DISPLAY_TYPE"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"PITCHED"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"FLYOVER"])
        {
          uint64_t v9 = 3;
        }
        else if ([v8 isEqualToString:@"TRAFFIC"])
        {
          uint64_t v9 = 4;
        }
        else if ([v8 isEqualToString:@"APP_FOCUS"])
        {
          uint64_t v9 = 5;
        }
        else if ([v8 isEqualToString:@"NAVIGATION_GUIDANCE"])
        {
          uint64_t v9 = 6;
        }
        else if ([v8 isEqualToString:@"NAVIGATION_OVERVIEW"])
        {
          uint64_t v9 = 7;
        }
        else if ([v8 isEqualToString:@"TRACKING"])
        {
          uint64_t v9 = 8;
        }
        else if ([v8 isEqualToString:@"CARPLAY_TRACKING"])
        {
          uint64_t v9 = 9;
        }
        else if ([v8 isEqualToString:@"CARPLAY_PITCHED"])
        {
          uint64_t v9 = 10;
        }
        else if ([v8 isEqualToString:@"CARPLAY_CONNECTED_STATE"])
        {
          uint64_t v9 = 11;
        }
        else if ([v8 isEqualToString:@"MAP_APP_STATE"])
        {
          uint64_t v9 = 12;
        }
        else
        {
          uint64_t v9 = 1;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_36;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setStateType:v9];
LABEL_36:

      if (a3) {
        v10 = @"oldValue";
      }
      else {
        v10 = @"old_value";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        if ([v12 isEqualToString:@"MAP_TYPE_STANDARD"])
        {
          uint64_t v13 = 1;
        }
        else if ([v12 isEqualToString:@"MAP_TYPE_SATELLITE"])
        {
          uint64_t v13 = 2;
        }
        else if ([v12 isEqualToString:@"MAP_TYPE_HYBRID"])
        {
          uint64_t v13 = 3;
        }
        else if ([v12 isEqualToString:@"MAP_TYPE_SATELLITE_GLOBE"])
        {
          uint64_t v13 = 4;
        }
        else if ([v12 isEqualToString:@"MAP_TYPE_HYBRID_GLOBE"])
        {
          uint64_t v13 = 5;
        }
        else if ([v12 isEqualToString:@"MAP_TYPE_NAVIGATION"])
        {
          uint64_t v13 = 6;
        }
        else if ([v12 isEqualToString:@"MAP_TYPE_TRANSIT"])
        {
          uint64_t v13 = 7;
        }
        else if ([v12 isEqualToString:@"FEATURE_ACTIVE"])
        {
          uint64_t v13 = 8;
        }
        else if ([v12 isEqualToString:@"FEATURE_INACTIVE"])
        {
          uint64_t v13 = 9;
        }
        else if ([v12 isEqualToString:@"FEATURE_UNAVAILABLE"])
        {
          uint64_t v13 = 10;
        }
        else if ([v12 isEqualToString:@"APP_FOREGROUND"])
        {
          uint64_t v13 = 11;
        }
        else if ([v12 isEqualToString:@"APP_BACKGROUND"])
        {
          uint64_t v13 = 12;
        }
        else if ([v12 isEqualToString:@"TRACKING_OFF"])
        {
          uint64_t v13 = 13;
        }
        else if ([v12 isEqualToString:@"TRACKING_ON"])
        {
          uint64_t v13 = 14;
        }
        else if ([v12 isEqualToString:@"TRACKING_ON_WITH_HEADING"])
        {
          uint64_t v13 = 15;
        }
        else if ([v12 isEqualToString:@"APP_STATE_MAP_BROWSING"])
        {
          uint64_t v13 = 16;
        }
        else if ([v12 isEqualToString:@"APP_STATE_NAVIGATION"])
        {
          uint64_t v13 = 17;
        }
        else if ([v12 isEqualToString:@"APP_STATE_ROUTE_PREVIEW"])
        {
          uint64_t v13 = 18;
        }
        else if ([v12 isEqualToString:@"APP_STATE_ROUTE_GENIUS"])
        {
          uint64_t v13 = 19;
        }
        else
        {
          uint64_t v13 = 1;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_83;
        }
        uint64_t v13 = [v11 intValue];
      }
      [a1 setOldValue:v13];
LABEL_83:

      if (a3) {
        v14 = @"newValue";
      }
      else {
        v14 = @"new_value";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        if ([v16 isEqualToString:@"MAP_TYPE_STANDARD"])
        {
          uint64_t v17 = 1;
        }
        else if ([v16 isEqualToString:@"MAP_TYPE_SATELLITE"])
        {
          uint64_t v17 = 2;
        }
        else if ([v16 isEqualToString:@"MAP_TYPE_HYBRID"])
        {
          uint64_t v17 = 3;
        }
        else if ([v16 isEqualToString:@"MAP_TYPE_SATELLITE_GLOBE"])
        {
          uint64_t v17 = 4;
        }
        else if ([v16 isEqualToString:@"MAP_TYPE_HYBRID_GLOBE"])
        {
          uint64_t v17 = 5;
        }
        else if ([v16 isEqualToString:@"MAP_TYPE_NAVIGATION"])
        {
          uint64_t v17 = 6;
        }
        else if ([v16 isEqualToString:@"MAP_TYPE_TRANSIT"])
        {
          uint64_t v17 = 7;
        }
        else if ([v16 isEqualToString:@"FEATURE_ACTIVE"])
        {
          uint64_t v17 = 8;
        }
        else if ([v16 isEqualToString:@"FEATURE_INACTIVE"])
        {
          uint64_t v17 = 9;
        }
        else if ([v16 isEqualToString:@"FEATURE_UNAVAILABLE"])
        {
          uint64_t v17 = 10;
        }
        else if ([v16 isEqualToString:@"APP_FOREGROUND"])
        {
          uint64_t v17 = 11;
        }
        else if ([v16 isEqualToString:@"APP_BACKGROUND"])
        {
          uint64_t v17 = 12;
        }
        else if ([v16 isEqualToString:@"TRACKING_OFF"])
        {
          uint64_t v17 = 13;
        }
        else if ([v16 isEqualToString:@"TRACKING_ON"])
        {
          uint64_t v17 = 14;
        }
        else if ([v16 isEqualToString:@"TRACKING_ON_WITH_HEADING"])
        {
          uint64_t v17 = 15;
        }
        else if ([v16 isEqualToString:@"APP_STATE_MAP_BROWSING"])
        {
          uint64_t v17 = 16;
        }
        else if ([v16 isEqualToString:@"APP_STATE_NAVIGATION"])
        {
          uint64_t v17 = 17;
        }
        else if ([v16 isEqualToString:@"APP_STATE_ROUTE_PREVIEW"])
        {
          uint64_t v17 = 18;
        }
        else if ([v16 isEqualToString:@"APP_STATE_ROUTE_GENIUS"])
        {
          uint64_t v17 = 19;
        }
        else
        {
          uint64_t v17 = 1;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_130:

          goto LABEL_131;
        }
        uint64_t v17 = [v15 intValue];
      }
      [a1 setNewValue:v17];
      goto LABEL_130;
    }
  }
LABEL_131:

  return a1;
}

- (GEOStateTransitionFeedback)initWithJSON:(id)a3
{
  return (GEOStateTransitionFeedback *)-[GEOStateTransitionFeedback _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStateTransitionFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStateTransitionFeedbackReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
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
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOStateTransitionFeedback *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[4] = self->_stateType;
    *((unsigned char *)v5 + 20) |= 4u;
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
  v5[3] = self->_oldValue;
  *((unsigned char *)v5 + 20) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    v5[2] = self->_newValue;
    *((unsigned char *)v5 + 20) |= 1u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_stateType;
    *((unsigned char *)result + 20) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_oldValue;
  *((unsigned char *)result + 20) |= 2u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 2) = self->_newValue;
  *((unsigned char *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOStateTransitionFeedback *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0 || self->_stateType != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_oldValue != *((_DWORD *)v4 + 3)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_newValue != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  [(GEOStateTransitionFeedback *)self readAll:1];
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
    return v4 ^ v3 ^ v5;
  }
  uint64_t v3 = 2654435761 * self->_stateType;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_oldValue;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_newValue;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 20);
  if ((v4 & 4) != 0)
  {
    self->_stateType = v5[4];
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 20);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5[5] & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_oldValue = v5[3];
  *(unsigned char *)&self->_flags |= 2u;
  if (v5[5])
  {
LABEL_4:
    self->_newValue = v5[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_5:
}

@end