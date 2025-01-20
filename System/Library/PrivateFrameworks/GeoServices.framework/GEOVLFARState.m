@interface GEOVLFARState
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGeoTrackingState;
- (BOOL)hasGeoTrackingStateReason;
- (BOOL)hasRelativeTimestampMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLFARState)initWithDictionary:(id)a3;
- (GEOVLFARState)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)geoTrackingStateAsString:(int)a3;
- (id)geoTrackingStateReasonAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsGeoTrackingState:(id)a3;
- (int)StringAsGeoTrackingStateReason:(id)a3;
- (int)geoTrackingState;
- (int)geoTrackingStateReason;
- (unint64_t)hash;
- (unsigned)relativeTimestampMs;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGeoTrackingState:(int)a3;
- (void)setGeoTrackingStateReason:(int)a3;
- (void)setHasGeoTrackingState:(BOOL)a3;
- (void)setHasGeoTrackingStateReason:(BOOL)a3;
- (void)setHasRelativeTimestampMs:(BOOL)a3;
- (void)setRelativeTimestampMs:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFARState

- (unsigned)relativeTimestampMs
{
  return self->_relativeTimestampMs;
}

- (void)setRelativeTimestampMs:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_relativeTimestampMs = a3;
}

- (void)setHasRelativeTimestampMs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasRelativeTimestampMs
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)geoTrackingState
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_geoTrackingState;
  }
  else {
    return 0;
  }
}

- (void)setGeoTrackingState:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_geoTrackingState = a3;
}

- (void)setHasGeoTrackingState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasGeoTrackingState
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)geoTrackingStateAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F8CA8[a3];
  }

  return v3;
}

- (int)StringAsGeoTrackingState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VLFARGeoTrackingState_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VLFARGeoTrackingState_NOT_AVAILABLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VLFARGeoTrackingState_INITIALIZING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VLFARGeoTrackingState_LOCALIZING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"VLFARGeoTrackingState_LOCALIZED"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)geoTrackingStateReason
{
  if (*(unsigned char *)&self->_flags) {
    return self->_geoTrackingStateReason;
  }
  else {
    return 0;
  }
}

- (void)setGeoTrackingStateReason:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_geoTrackingStateReason = a3;
}

- (void)setHasGeoTrackingStateReason:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasGeoTrackingStateReason
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)geoTrackingStateReasonAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F8CD0[a3];
  }

  return v3;
}

- (int)StringAsGeoTrackingStateReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VLFARGeoTrackingStateReason_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VLFARGeoTrackingStateReason_NONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VLFARGeoTrackingStateReason_NOT_AVAILABLE_AT_LOCATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VLFARGeoTrackingStateReason_NEED_LOCATION_PERMISSIONS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"VLFARGeoTrackingStateReason_WORLD_TRACKING_UNSTABLE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"VLFARGeoTrackingStateReason_WAITING_FOR_LOCATION"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"VLFARGeoTrackingStateReason_WAITING_FOR_AVAILABILITY_CHECK"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"VLFARGeoTrackingStateReason_GEO_DATA_NOT_LOADED"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"VLFARGeoTrackingStateReason_DEVICE_POINTED_TOO_LOW"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"VLFARGeoTrackingStateReason_VISUAL_LOCALIZATION_FAILED"])
  {
    int v4 = 9;
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
  v8.super_class = (Class)GEOVLFARState;
  int v4 = [(GEOVLFARState *)&v8 description];
  v5 = [(GEOVLFARState *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFARState _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_24;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 4) == 0)
  {
    if ((*(unsigned char *)(a1 + 20) & 2) == 0) {
      goto LABEL_4;
    }
LABEL_10:
    uint64_t v8 = *(int *)(a1 + 12);
    if (v8 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 12));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E53F8CA8[v8];
    }
    if (a2) {
      v10 = @"geoTrackingState";
    }
    else {
      v10 = @"geo_tracking_state";
    }
    [v4 setObject:v9 forKey:v10];

    if ((*(unsigned char *)(a1 + 20) & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_17;
  }
  v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
  if (a2) {
    v7 = @"relativeTimestampMs";
  }
  else {
    v7 = @"relative_timestamp_ms";
  }
  [v4 setObject:v6 forKey:v7];

  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 2) != 0) {
    goto LABEL_10;
  }
LABEL_4:
  if (v5)
  {
LABEL_17:
    uint64_t v11 = *(int *)(a1 + 8);
    if (v11 >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E53F8CD0[v11];
    }
    if (a2) {
      v13 = @"geoTrackingStateReason";
    }
    else {
      v13 = @"geo_tracking_state_reason";
    }
    [v4 setObject:v12 forKey:v13];
  }
LABEL_24:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFARState _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFARState)initWithDictionary:(id)a3
{
  return (GEOVLFARState *)-[GEOVLFARState _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"relativeTimestampMs";
      }
      else {
        v6 = @"relative_timestamp_ms";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRelativeTimestampMs:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        uint64_t v8 = @"geoTrackingState";
      }
      else {
        uint64_t v8 = @"geo_tracking_state";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v9;
        if ([v10 isEqualToString:@"VLFARGeoTrackingState_UNKNOWN"])
        {
          uint64_t v11 = 0;
        }
        else if ([v10 isEqualToString:@"VLFARGeoTrackingState_NOT_AVAILABLE"])
        {
          uint64_t v11 = 1;
        }
        else if ([v10 isEqualToString:@"VLFARGeoTrackingState_INITIALIZING"])
        {
          uint64_t v11 = 2;
        }
        else if ([v10 isEqualToString:@"VLFARGeoTrackingState_LOCALIZING"])
        {
          uint64_t v11 = 3;
        }
        else if ([v10 isEqualToString:@"VLFARGeoTrackingState_LOCALIZED"])
        {
          uint64_t v11 = 4;
        }
        else
        {
          uint64_t v11 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_27;
        }
        uint64_t v11 = [v9 intValue];
      }
      [a1 setGeoTrackingState:v11];
LABEL_27:

      if (a3) {
        v12 = @"geoTrackingStateReason";
      }
      else {
        v12 = @"geo_tracking_state_reason";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v13;
        if ([v14 isEqualToString:@"VLFARGeoTrackingStateReason_UNKNOWN"])
        {
          uint64_t v15 = 0;
        }
        else if ([v14 isEqualToString:@"VLFARGeoTrackingStateReason_NONE"])
        {
          uint64_t v15 = 1;
        }
        else if ([v14 isEqualToString:@"VLFARGeoTrackingStateReason_NOT_AVAILABLE_AT_LOCATION"])
        {
          uint64_t v15 = 2;
        }
        else if ([v14 isEqualToString:@"VLFARGeoTrackingStateReason_NEED_LOCATION_PERMISSIONS"])
        {
          uint64_t v15 = 3;
        }
        else if ([v14 isEqualToString:@"VLFARGeoTrackingStateReason_WORLD_TRACKING_UNSTABLE"])
        {
          uint64_t v15 = 4;
        }
        else if ([v14 isEqualToString:@"VLFARGeoTrackingStateReason_WAITING_FOR_LOCATION"])
        {
          uint64_t v15 = 5;
        }
        else if ([v14 isEqualToString:@"VLFARGeoTrackingStateReason_WAITING_FOR_AVAILABILITY_CHECK"])
        {
          uint64_t v15 = 6;
        }
        else if ([v14 isEqualToString:@"VLFARGeoTrackingStateReason_GEO_DATA_NOT_LOADED"])
        {
          uint64_t v15 = 7;
        }
        else if ([v14 isEqualToString:@"VLFARGeoTrackingStateReason_DEVICE_POINTED_TOO_LOW"])
        {
          uint64_t v15 = 8;
        }
        else if ([v14 isEqualToString:@"VLFARGeoTrackingStateReason_VISUAL_LOCALIZATION_FAILED"])
        {
          uint64_t v15 = 9;
        }
        else
        {
          uint64_t v15 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_56:

          goto LABEL_57;
        }
        uint64_t v15 = [v13 intValue];
      }
      [a1 setGeoTrackingStateReason:v15];
      goto LABEL_56;
    }
  }
LABEL_57:

  return a1;
}

- (GEOVLFARState)initWithJSON:(id)a3
{
  return (GEOVLFARState *)-[GEOVLFARState _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFARStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFARStateReadAllFrom((uint64_t)self, a3);
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
  [(GEOVLFARState *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[4] = self->_relativeTimestampMs;
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
  v5[3] = self->_geoTrackingState;
  *((unsigned char *)v5 + 20) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    v5[2] = self->_geoTrackingStateReason;
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
    *((_DWORD *)result + 4) = self->_relativeTimestampMs;
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
  *((_DWORD *)result + 3) = self->_geoTrackingState;
  *((unsigned char *)result + 20) |= 2u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 2) = self->_geoTrackingStateReason;
  *((unsigned char *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOVLFARState *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0 || self->_relativeTimestampMs != *((_DWORD *)v4 + 4)) {
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
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_geoTrackingState != *((_DWORD *)v4 + 3)) {
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
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_geoTrackingStateReason != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  [(GEOVLFARState *)self readAll:1];
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
  uint64_t v3 = 2654435761 * self->_relativeTimestampMs;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_geoTrackingState;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_geoTrackingStateReason;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 20);
  if ((v4 & 4) != 0)
  {
    self->_relativeTimestampMs = *((_DWORD *)v5 + 4);
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
  else if ((*((unsigned char *)v5 + 20) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_geoTrackingState = *((_DWORD *)v5 + 3);
  *(unsigned char *)&self->_flags |= 2u;
  if (*((unsigned char *)v5 + 20))
  {
LABEL_4:
    self->_geoTrackingStateReason = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_5:
}

@end