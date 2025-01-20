@interface GEOLogMsgEventTimeToLeaveInitialTravelTime
+ (BOOL)isValid:(id)a3;
- (BOOL)hasTravelTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventTimeToLeaveInitialTravelTime)initWithDictionary:(id)a3;
- (GEOLogMsgEventTimeToLeaveInitialTravelTime)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)travelTimeAsString:(int)a3;
- (int)StringAsTravelTime:(id)a3;
- (int)travelTime;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTravelTime:(BOOL)a3;
- (void)setTravelTime:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventTimeToLeaveInitialTravelTime

- (int)travelTime
{
  if (*(unsigned char *)&self->_flags) {
    return self->_travelTime;
  }
  else {
    return 0;
  }
}

- (void)setTravelTime:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_travelTime = a3;
}

- (void)setHasTravelTime:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTravelTime
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)travelTimeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F7D68[a3];
  }

  return v3;
}

- (int)StringAsTravelTime:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TTL_INITIAL_TRAVEL_TIME_BUCKET_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LESS_THAN_15M"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LESS_THAN_30M"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LESS_THAN_1H"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LESS_THAN_2H"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LESS_THAN_4H"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MORE_THAN_4H"])
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
  v8.super_class = (Class)GEOLogMsgEventTimeToLeaveInitialTravelTime;
  int v4 = [(GEOLogMsgEventTimeToLeaveInitialTravelTime *)&v8 description];
  v5 = [(GEOLogMsgEventTimeToLeaveInitialTravelTime *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventTimeToLeaveInitialTravelTime _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 12))
    {
      uint64_t v5 = *(int *)(a1 + 8);
      if (v5 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53F7D68[v5];
      }
      if (a2) {
        v7 = @"travelTime";
      }
      else {
        v7 = @"travel_time";
      }
      [v4 setObject:v6 forKey:v7];
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
  return -[GEOLogMsgEventTimeToLeaveInitialTravelTime _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventTimeToLeaveInitialTravelTime)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventTimeToLeaveInitialTravelTime *)-[GEOLogMsgEventTimeToLeaveInitialTravelTime _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"travelTime";
      }
      else {
        v6 = @"travel_time";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"TTL_INITIAL_TRAVEL_TIME_BUCKET_UNKNOWN"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"LESS_THAN_15M"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"LESS_THAN_30M"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"LESS_THAN_1H"])
        {
          uint64_t v9 = 3;
        }
        else if ([v8 isEqualToString:@"LESS_THAN_2H"])
        {
          uint64_t v9 = 4;
        }
        else if ([v8 isEqualToString:@"LESS_THAN_4H"])
        {
          uint64_t v9 = 5;
        }
        else if ([v8 isEqualToString:@"MORE_THAN_4H"])
        {
          uint64_t v9 = 6;
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_26:

          goto LABEL_27;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setTravelTime:v9];
      goto LABEL_26;
    }
  }
LABEL_27:

  return a1;
}

- (GEOLogMsgEventTimeToLeaveInitialTravelTime)initWithJSON:(id)a3
{
  return (GEOLogMsgEventTimeToLeaveInitialTravelTime *)-[GEOLogMsgEventTimeToLeaveInitialTravelTime _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventTimeToLeaveInitialTravelTimeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventTimeToLeaveInitialTravelTimeReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  [(GEOLogMsgEventTimeToLeaveInitialTravelTime *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[2] = self->_travelTime;
    *((unsigned char *)v4 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)result + 2) = self->_travelTime;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  [(GEOLogMsgEventTimeToLeaveInitialTravelTime *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_travelTime == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    return 2654435761 * self->_travelTime;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  id v4 = (int *)a3;
  [v4 readAll:0];
  if (v4[3])
  {
    self->_travelTime = v4[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end