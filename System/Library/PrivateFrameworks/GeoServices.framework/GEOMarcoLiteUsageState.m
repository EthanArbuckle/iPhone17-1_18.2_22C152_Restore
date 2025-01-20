@interface GEOMarcoLiteUsageState
+ (BOOL)isValid:(id)a3;
- (BOOL)hasStateExitReason;
- (BOOL)hasStateTime;
- (BOOL)hasStateType;
- (BOOL)hasStateValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMarcoLiteUsageState)initWithDictionary:(id)a3;
- (GEOMarcoLiteUsageState)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)stateExitReasonAsString:(int)a3;
- (id)stateTypeAsString:(int)a3;
- (int)StringAsStateExitReason:(id)a3;
- (int)StringAsStateType:(id)a3;
- (int)stateExitReason;
- (int)stateType;
- (unint64_t)hash;
- (unsigned)stateTime;
- (unsigned)stateValue;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStateExitReason:(BOOL)a3;
- (void)setHasStateTime:(BOOL)a3;
- (void)setHasStateType:(BOOL)a3;
- (void)setHasStateValue:(BOOL)a3;
- (void)setStateExitReason:(int)a3;
- (void)setStateTime:(unsigned int)a3;
- (void)setStateType:(int)a3;
- (void)setStateValue:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMarcoLiteUsageState

- (int)stateType
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_stateType;
  }
  else {
    return 0;
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
  if (a3 >= 0x1A)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F84A0[a3];
  }

  return v3;
}

- (int)StringAsStateType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DISABLED_REASON_DEVICE_LOW_POWER_MODE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_DEVICE_STATIONARY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_ARTRACKINGSTATE_THRESHOLD_REACHED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_DEVICE_BATTERY_THRESHOLD_REACHED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_DAILY_USAGE_LIMIT_REACHED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_MANUALLY_DISABLED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"AR_TRACKING_NORMAL"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"AR_TRACKING_LIMITED_INITIALIZING"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AR_TRACKING_LIMITED_EXCESSIVE_MOTION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"AR_TRACKING_LIMITED_INSUFFICIENT_FEATURES"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"AR_TRACKING_LIMITED_RELOCALIZING"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"AR_TRACKING_NOT_AVAILABLE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"AR_SESSION_INTERRUPTED"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"AR_INITIALIZING"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"AR_INITIALIZATION_SUCCESS"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"DISABLED_END_NAV"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"DISABLED_INITIALIZATION_FAILED"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_NIGHT"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_VLF"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_THERMAL_PRESSURE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_LOCATION_ACCURACY"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_FUSED_LOCATION"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_SESSION_TIMEOUT"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_HORIZONTAL_DISTANCE_TRAVELED"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_APP_BACKGROUND"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"AR_TRACKING_LIMITED_LOW_LIGHT"])
  {
    int v4 = 25;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)stateValue
{
  return self->_stateValue;
}

- (void)setStateValue:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_stateValue = a3;
}

- (void)setHasStateValue:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasStateValue
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unsigned)stateTime
{
  return self->_stateTime;
}

- (void)setStateTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_stateTime = a3;
}

- (void)setHasStateTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStateTime
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)stateExitReason
{
  if (*(unsigned char *)&self->_flags) {
    return self->_stateExitReason;
  }
  else {
    return 0;
  }
}

- (void)setStateExitReason:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_stateExitReason = a3;
}

- (void)setHasStateExitReason:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasStateExitReason
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)stateExitReasonAsString:(int)a3
{
  if (a3 >= 0x1A)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F84A0[a3];
  }

  return v3;
}

- (int)StringAsStateExitReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DISABLED_REASON_DEVICE_LOW_POWER_MODE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_DEVICE_STATIONARY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_ARTRACKINGSTATE_THRESHOLD_REACHED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_DEVICE_BATTERY_THRESHOLD_REACHED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_DAILY_USAGE_LIMIT_REACHED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_MANUALLY_DISABLED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"AR_TRACKING_NORMAL"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"AR_TRACKING_LIMITED_INITIALIZING"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AR_TRACKING_LIMITED_EXCESSIVE_MOTION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"AR_TRACKING_LIMITED_INSUFFICIENT_FEATURES"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"AR_TRACKING_LIMITED_RELOCALIZING"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"AR_TRACKING_NOT_AVAILABLE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"AR_SESSION_INTERRUPTED"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"AR_INITIALIZING"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"AR_INITIALIZATION_SUCCESS"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"DISABLED_END_NAV"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"DISABLED_INITIALIZATION_FAILED"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_NIGHT"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_VLF"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_THERMAL_PRESSURE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_LOCATION_ACCURACY"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_FUSED_LOCATION"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_SESSION_TIMEOUT"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_HORIZONTAL_DISTANCE_TRAVELED"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"DISABLED_REASON_APP_BACKGROUND"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"AR_TRACKING_LIMITED_LOW_LIGHT"])
  {
    int v4 = 25;
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
  v8.super_class = (Class)GEOMarcoLiteUsageState;
  int v4 = [(GEOMarcoLiteUsageState *)&v8 description];
  v5 = [(GEOMarcoLiteUsageState *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMarcoLiteUsageState _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_29;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 4) != 0)
  {
    uint64_t v6 = *(int *)(a1 + 16);
    if (v6 >= 0x1A)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E53F84A0[v6];
    }
    if (a2) {
      objc_super v8 = @"stateType";
    }
    else {
      objc_super v8 = @"state_type";
    }
    [v4 setObject:v7 forKey:v8];

    char v5 = *(unsigned char *)(a1 + 24);
  }
  if ((v5 & 8) == 0)
  {
    if ((v5 & 2) == 0) {
      goto LABEL_12;
    }
LABEL_18:
    v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 12)];
    if (a2) {
      v12 = @"stateTime";
    }
    else {
      v12 = @"state_time";
    }
    [v4 setObject:v11 forKey:v12];

    if ((*(unsigned char *)(a1 + 24) & 1) == 0) {
      goto LABEL_29;
    }
    goto LABEL_22;
  }
  v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
  if (a2) {
    v10 = @"stateValue";
  }
  else {
    v10 = @"state_value";
  }
  [v4 setObject:v9 forKey:v10];

  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 2) != 0) {
    goto LABEL_18;
  }
LABEL_12:
  if (v5)
  {
LABEL_22:
    uint64_t v13 = *(int *)(a1 + 8);
    if (v13 >= 0x1A)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E53F84A0[v13];
    }
    if (a2) {
      v15 = @"stateExitReason";
    }
    else {
      v15 = @"state_exit_reason";
    }
    [v4 setObject:v14 forKey:v15];
  }
LABEL_29:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMarcoLiteUsageState _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOMarcoLiteUsageState)initWithDictionary:(id)a3
{
  return (GEOMarcoLiteUsageState *)-[GEOMarcoLiteUsageState _initWithDictionary:isJSON:](self, a3, 0);
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
        uint64_t v6 = @"stateType";
      }
      else {
        uint64_t v6 = @"state_type";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"DISABLED_REASON_DEVICE_LOW_POWER_MODE"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"DISABLED_REASON_DEVICE_STATIONARY"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"DISABLED_REASON_ARTRACKINGSTATE_THRESHOLD_REACHED"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"DISABLED_REASON_DEVICE_BATTERY_THRESHOLD_REACHED"])
        {
          uint64_t v9 = 3;
        }
        else if ([v8 isEqualToString:@"DISABLED_REASON_DAILY_USAGE_LIMIT_REACHED"])
        {
          uint64_t v9 = 4;
        }
        else if ([v8 isEqualToString:@"DISABLED_REASON_MANUALLY_DISABLED"])
        {
          uint64_t v9 = 5;
        }
        else if ([v8 isEqualToString:@"AR_TRACKING_NORMAL"])
        {
          uint64_t v9 = 6;
        }
        else if ([v8 isEqualToString:@"AR_TRACKING_LIMITED_INITIALIZING"])
        {
          uint64_t v9 = 7;
        }
        else if ([v8 isEqualToString:@"AR_TRACKING_LIMITED_EXCESSIVE_MOTION"])
        {
          uint64_t v9 = 8;
        }
        else if ([v8 isEqualToString:@"AR_TRACKING_LIMITED_INSUFFICIENT_FEATURES"])
        {
          uint64_t v9 = 9;
        }
        else if ([v8 isEqualToString:@"AR_TRACKING_LIMITED_RELOCALIZING"])
        {
          uint64_t v9 = 10;
        }
        else if ([v8 isEqualToString:@"AR_TRACKING_NOT_AVAILABLE"])
        {
          uint64_t v9 = 11;
        }
        else if ([v8 isEqualToString:@"AR_SESSION_INTERRUPTED"])
        {
          uint64_t v9 = 12;
        }
        else if ([v8 isEqualToString:@"AR_INITIALIZING"])
        {
          uint64_t v9 = 13;
        }
        else if ([v8 isEqualToString:@"AR_INITIALIZATION_SUCCESS"])
        {
          uint64_t v9 = 14;
        }
        else if ([v8 isEqualToString:@"DISABLED_END_NAV"])
        {
          uint64_t v9 = 15;
        }
        else if ([v8 isEqualToString:@"DISABLED_INITIALIZATION_FAILED"])
        {
          uint64_t v9 = 16;
        }
        else if ([v8 isEqualToString:@"DISABLED_REASON_NIGHT"])
        {
          uint64_t v9 = 17;
        }
        else if ([v8 isEqualToString:@"DISABLED_REASON_VLF"])
        {
          uint64_t v9 = 18;
        }
        else if ([v8 isEqualToString:@"DISABLED_REASON_THERMAL_PRESSURE"])
        {
          uint64_t v9 = 19;
        }
        else if ([v8 isEqualToString:@"DISABLED_REASON_LOCATION_ACCURACY"])
        {
          uint64_t v9 = 20;
        }
        else if ([v8 isEqualToString:@"DISABLED_REASON_FUSED_LOCATION"])
        {
          uint64_t v9 = 21;
        }
        else if ([v8 isEqualToString:@"DISABLED_REASON_SESSION_TIMEOUT"])
        {
          uint64_t v9 = 22;
        }
        else if ([v8 isEqualToString:@"DISABLED_REASON_HORIZONTAL_DISTANCE_TRAVELED"])
        {
          uint64_t v9 = 23;
        }
        else if ([v8 isEqualToString:@"DISABLED_REASON_APP_BACKGROUND"])
        {
          uint64_t v9 = 24;
        }
        else if ([v8 isEqualToString:@"AR_TRACKING_LIMITED_LOW_LIGHT"])
        {
          uint64_t v9 = 25;
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
          goto LABEL_64;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setStateType:v9];
LABEL_64:

      if (a3) {
        v10 = @"stateValue";
      }
      else {
        v10 = @"state_value";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStateValue:", objc_msgSend(v11, "unsignedIntValue"));
      }

      if (a3) {
        v12 = @"stateTime";
      }
      else {
        v12 = @"state_time";
      }
      uint64_t v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStateTime:", objc_msgSend(v13, "unsignedIntValue"));
      }

      if (a3) {
        v14 = @"stateExitReason";
      }
      else {
        v14 = @"state_exit_reason";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        if ([v16 isEqualToString:@"DISABLED_REASON_DEVICE_LOW_POWER_MODE"])
        {
          uint64_t v17 = 0;
        }
        else if ([v16 isEqualToString:@"DISABLED_REASON_DEVICE_STATIONARY"])
        {
          uint64_t v17 = 1;
        }
        else if ([v16 isEqualToString:@"DISABLED_REASON_ARTRACKINGSTATE_THRESHOLD_REACHED"])
        {
          uint64_t v17 = 2;
        }
        else if ([v16 isEqualToString:@"DISABLED_REASON_DEVICE_BATTERY_THRESHOLD_REACHED"])
        {
          uint64_t v17 = 3;
        }
        else if ([v16 isEqualToString:@"DISABLED_REASON_DAILY_USAGE_LIMIT_REACHED"])
        {
          uint64_t v17 = 4;
        }
        else if ([v16 isEqualToString:@"DISABLED_REASON_MANUALLY_DISABLED"])
        {
          uint64_t v17 = 5;
        }
        else if ([v16 isEqualToString:@"AR_TRACKING_NORMAL"])
        {
          uint64_t v17 = 6;
        }
        else if ([v16 isEqualToString:@"AR_TRACKING_LIMITED_INITIALIZING"])
        {
          uint64_t v17 = 7;
        }
        else if ([v16 isEqualToString:@"AR_TRACKING_LIMITED_EXCESSIVE_MOTION"])
        {
          uint64_t v17 = 8;
        }
        else if ([v16 isEqualToString:@"AR_TRACKING_LIMITED_INSUFFICIENT_FEATURES"])
        {
          uint64_t v17 = 9;
        }
        else if ([v16 isEqualToString:@"AR_TRACKING_LIMITED_RELOCALIZING"])
        {
          uint64_t v17 = 10;
        }
        else if ([v16 isEqualToString:@"AR_TRACKING_NOT_AVAILABLE"])
        {
          uint64_t v17 = 11;
        }
        else if ([v16 isEqualToString:@"AR_SESSION_INTERRUPTED"])
        {
          uint64_t v17 = 12;
        }
        else if ([v16 isEqualToString:@"AR_INITIALIZING"])
        {
          uint64_t v17 = 13;
        }
        else if ([v16 isEqualToString:@"AR_INITIALIZATION_SUCCESS"])
        {
          uint64_t v17 = 14;
        }
        else if ([v16 isEqualToString:@"DISABLED_END_NAV"])
        {
          uint64_t v17 = 15;
        }
        else if ([v16 isEqualToString:@"DISABLED_INITIALIZATION_FAILED"])
        {
          uint64_t v17 = 16;
        }
        else if ([v16 isEqualToString:@"DISABLED_REASON_NIGHT"])
        {
          uint64_t v17 = 17;
        }
        else if ([v16 isEqualToString:@"DISABLED_REASON_VLF"])
        {
          uint64_t v17 = 18;
        }
        else if ([v16 isEqualToString:@"DISABLED_REASON_THERMAL_PRESSURE"])
        {
          uint64_t v17 = 19;
        }
        else if ([v16 isEqualToString:@"DISABLED_REASON_LOCATION_ACCURACY"])
        {
          uint64_t v17 = 20;
        }
        else if ([v16 isEqualToString:@"DISABLED_REASON_FUSED_LOCATION"])
        {
          uint64_t v17 = 21;
        }
        else if ([v16 isEqualToString:@"DISABLED_REASON_SESSION_TIMEOUT"])
        {
          uint64_t v17 = 22;
        }
        else if ([v16 isEqualToString:@"DISABLED_REASON_HORIZONTAL_DISTANCE_TRAVELED"])
        {
          uint64_t v17 = 23;
        }
        else if ([v16 isEqualToString:@"DISABLED_REASON_APP_BACKGROUND"])
        {
          uint64_t v17 = 24;
        }
        else if ([v16 isEqualToString:@"AR_TRACKING_LIMITED_LOW_LIGHT"])
        {
          uint64_t v17 = 25;
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
LABEL_135:

          goto LABEL_136;
        }
        uint64_t v17 = [v15 intValue];
      }
      [a1 setStateExitReason:v17];
      goto LABEL_135;
    }
  }
LABEL_136:

  return a1;
}

- (GEOMarcoLiteUsageState)initWithJSON:(id)a3
{
  return (GEOMarcoLiteUsageState *)-[GEOMarcoLiteUsageState _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMarcoLiteUsageStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMarcoLiteUsageStateReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_flags) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOMarcoLiteUsageState *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[4] = self->_stateType;
    *((unsigned char *)v5 + 24) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[5] = self->_stateValue;
  *((unsigned char *)v5 + 24) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v5[3] = self->_stateTime;
  *((unsigned char *)v5 + 24) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_5:
    v5[2] = self->_stateExitReason;
    *((unsigned char *)v5 + 24) |= 1u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_stateType;
    *((unsigned char *)result + 24) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_stateValue;
  *((unsigned char *)result + 24) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 3) = self->_stateTime;
  *((unsigned char *)result + 24) |= 2u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 2) = self->_stateExitReason;
  *((unsigned char *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEOMarcoLiteUsageState *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_stateType != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0 || self->_stateValue != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_stateTime != *((_DWORD *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_stateExitReason != *((_DWORD *)v4 + 2)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  [(GEOMarcoLiteUsageState *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_stateType;
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_stateValue;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if (*(unsigned char *)&self->_flags) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_stateTime;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_stateExitReason;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 4) != 0)
  {
    self->_stateType = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 24);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v5 + 24) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_stateValue = *((_DWORD *)v5 + 5);
  *(unsigned char *)&self->_flags |= 8u;
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_stateTime = *((_DWORD *)v5 + 3);
  *(unsigned char *)&self->_flags |= 2u;
  if (*((unsigned char *)v5 + 24))
  {
LABEL_5:
    self->_stateExitReason = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_6:
}

@end