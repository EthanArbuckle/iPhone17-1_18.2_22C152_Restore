@interface GEOLogMsgEventTimeToLeaveHypothesis
+ (BOOL)isValid:(id)a3;
- (BOOL)hasArrival;
- (BOOL)hasDeparture;
- (BOOL)hasEarliestArrivalOffset;
- (BOOL)hasEarliestDepartureOffset;
- (BOOL)hasLatestArrivalOffset;
- (BOOL)hasLatestDepartureOffset;
- (BOOL)hasNumberOfReroutes;
- (BOOL)hasTtlUiNotificationShown;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventTimeToLeaveHypothesis)initWithDictionary:(id)a3;
- (GEOLogMsgEventTimeToLeaveHypothesis)initWithJSON:(id)a3;
- (double)earliestArrivalOffset;
- (double)earliestDepartureOffset;
- (double)latestArrivalOffset;
- (double)latestDepartureOffset;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)arrivalAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)departureAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)ttlUiNotificationShownAsString:(int)a3;
- (int)StringAsArrival:(id)a3;
- (int)StringAsDeparture:(id)a3;
- (int)StringAsTtlUiNotificationShown:(id)a3;
- (int)arrival;
- (int)departure;
- (int)ttlUiNotificationShown;
- (unint64_t)hash;
- (unsigned)numberOfReroutes;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArrival:(int)a3;
- (void)setDeparture:(int)a3;
- (void)setEarliestArrivalOffset:(double)a3;
- (void)setEarliestDepartureOffset:(double)a3;
- (void)setHasArrival:(BOOL)a3;
- (void)setHasDeparture:(BOOL)a3;
- (void)setHasEarliestArrivalOffset:(BOOL)a3;
- (void)setHasEarliestDepartureOffset:(BOOL)a3;
- (void)setHasLatestArrivalOffset:(BOOL)a3;
- (void)setHasLatestDepartureOffset:(BOOL)a3;
- (void)setHasNumberOfReroutes:(BOOL)a3;
- (void)setHasTtlUiNotificationShown:(BOOL)a3;
- (void)setLatestArrivalOffset:(double)a3;
- (void)setLatestDepartureOffset:(double)a3;
- (void)setNumberOfReroutes:(unsigned int)a3;
- (void)setTtlUiNotificationShown:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventTimeToLeaveHypothesis

- (int)departure
{
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
    return self->_departure;
  }
  else {
    return 0;
  }
}

- (void)setDeparture:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_departure = a3;
}

- (void)setHasDeparture:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasDeparture
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (id)departureAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7D08[a3];
  }

  return v3;
}

- (int)StringAsDeparture:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TIME_TO_LEAVE_BUCKET_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EARLIER_THAN_22M"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EARLIER_THAN_7M"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ON_TIME"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LATER_THAN_7M"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LATER_THAN_22M"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"DID_NOT_ARRIVE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DID_NOT_DEPART"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)arrival
{
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    return self->_arrival;
  }
  else {
    return 0;
  }
}

- (void)setArrival:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_arrival = a3;
}

- (void)setHasArrival:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasArrival
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)arrivalAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7D08[a3];
  }

  return v3;
}

- (int)StringAsArrival:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TIME_TO_LEAVE_BUCKET_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EARLIER_THAN_22M"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EARLIER_THAN_7M"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ON_TIME"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LATER_THAN_7M"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LATER_THAN_22M"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"DID_NOT_ARRIVE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DID_NOT_DEPART"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)numberOfReroutes
{
  return self->_numberOfReroutes;
}

- (void)setNumberOfReroutes:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x40u;
  self->_numberOfReroutes = a3;
}

- (void)setHasNumberOfReroutes:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasNumberOfReroutes
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (int)ttlUiNotificationShown
{
  if ((*(unsigned char *)&self->_flags & 0x80000000) != 0) {
    return self->_ttlUiNotificationShown;
  }
  else {
    return 0;
  }
}

- (void)setTtlUiNotificationShown:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x80u;
  self->_ttlUiNotificationShown = a3;
}

- (void)setHasTtlUiNotificationShown:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = v3 & 0x80 | *(unsigned char *)&self->_flags & 0x7F;
}

- (BOOL)hasTtlUiNotificationShown
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (id)ttlUiNotificationShownAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7D48[a3];
  }

  return v3;
}

- (int)StringAsTtlUiNotificationShown:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TTL_UI_NOTIFICATION_NONE_SHOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EARLY_SHOWN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ON_TIME_SHOWN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BOTH_SHOWN"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (double)earliestDepartureOffset
{
  return self->_earliestDepartureOffset;
}

- (void)setEarliestDepartureOffset:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_earliestDepartureOffset = a3;
}

- (void)setHasEarliestDepartureOffset:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasEarliestDepartureOffset
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)latestDepartureOffset
{
  return self->_latestDepartureOffset;
}

- (void)setLatestDepartureOffset:(double)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_latestDepartureOffset = a3;
}

- (void)setHasLatestDepartureOffset:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasLatestDepartureOffset
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (double)earliestArrivalOffset
{
  return self->_earliestArrivalOffset;
}

- (void)setEarliestArrivalOffset:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_earliestArrivalOffset = a3;
}

- (void)setHasEarliestArrivalOffset:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEarliestArrivalOffset
{
  return *(unsigned char *)&self->_flags & 1;
}

- (double)latestArrivalOffset
{
  return self->_latestArrivalOffset;
}

- (void)setLatestArrivalOffset:(double)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_latestArrivalOffset = a3;
}

- (void)setHasLatestArrivalOffset:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasLatestArrivalOffset
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventTimeToLeaveHypothesis;
  int v4 = [(GEOLogMsgEventTimeToLeaveHypothesis *)&v8 description];
  v5 = [(GEOLogMsgEventTimeToLeaveHypothesis *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventTimeToLeaveHypothesis _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_46;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 56);
  if ((v5 & 0x20) != 0)
  {
    uint64_t v6 = *(int *)(a1 + 44);
    if (v6 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E53F7D08[v6];
    }
    [v4 setObject:v7 forKey:@"departure"];

    char v5 = *(unsigned char *)(a1 + 56);
  }
  if ((v5 & 0x10) != 0)
  {
    uint64_t v8 = *(int *)(a1 + 40);
    if (v8 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 40));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E53F7D08[v8];
    }
    [v4 setObject:v9 forKey:@"arrival"];

    char v5 = *(unsigned char *)(a1 + 56);
  }
  if ((v5 & 0x40) != 0)
  {
    v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
    if (a2) {
      v11 = @"numberOfReroutes";
    }
    else {
      v11 = @"number_of_reroutes";
    }
    [v4 setObject:v10 forKey:v11];

    char v5 = *(unsigned char *)(a1 + 56);
    if ((v5 & 0x80) == 0)
    {
LABEL_14:
      if ((v5 & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_30;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_14;
  }
  uint64_t v12 = *(int *)(a1 + 52);
  if (v12 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E53F7D48[v12];
  }
  if (a2) {
    v14 = @"ttlUiNotificationShown";
  }
  else {
    v14 = @"ttl_ui_notification_shown";
  }
  [v4 setObject:v13 forKey:v14];

  char v5 = *(unsigned char *)(a1 + 56);
  if ((v5 & 2) == 0)
  {
LABEL_15:
    if ((v5 & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_30:
  v15 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
  if (a2) {
    v16 = @"earliestDepartureOffset";
  }
  else {
    v16 = @"earliest_departure_offset";
  }
  [v4 setObject:v15 forKey:v16];

  char v5 = *(unsigned char *)(a1 + 56);
  if ((v5 & 8) == 0)
  {
LABEL_16:
    if ((v5 & 1) == 0) {
      goto LABEL_17;
    }
LABEL_38:
    v19 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
    if (a2) {
      v20 = @"earliestArrivalOffset";
    }
    else {
      v20 = @"earliest_arrival_offset";
    }
    [v4 setObject:v19 forKey:v20];

    if ((*(unsigned char *)(a1 + 56) & 4) == 0) {
      goto LABEL_46;
    }
    goto LABEL_42;
  }
LABEL_34:
  v17 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  if (a2) {
    v18 = @"latestDepartureOffset";
  }
  else {
    v18 = @"latest_departure_offset";
  }
  [v4 setObject:v17 forKey:v18];

  char v5 = *(unsigned char *)(a1 + 56);
  if (v5) {
    goto LABEL_38;
  }
LABEL_17:
  if ((v5 & 4) != 0)
  {
LABEL_42:
    v21 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    if (a2) {
      v22 = @"latestArrivalOffset";
    }
    else {
      v22 = @"latest_arrival_offset";
    }
    [v4 setObject:v21 forKey:v22];
  }
LABEL_46:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventTimeToLeaveHypothesis _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventTimeToLeaveHypothesis)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventTimeToLeaveHypothesis *)-[GEOLogMsgEventTimeToLeaveHypothesis _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_90;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_90;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"departure"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"TIME_TO_LEAVE_BUCKET_UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"EARLIER_THAN_22M"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"EARLIER_THAN_7M"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"ON_TIME"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"LATER_THAN_7M"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"LATER_THAN_22M"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"DID_NOT_ARRIVE"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"DID_NOT_DEPART"])
    {
      uint64_t v8 = 7;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_25;
    }
    uint64_t v8 = [v6 intValue];
  }
  [a1 setDeparture:v8];
LABEL_25:

  v9 = [v5 objectForKeyedSubscript:@"arrival"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    if ([v10 isEqualToString:@"TIME_TO_LEAVE_BUCKET_UNKNOWN"])
    {
      uint64_t v11 = 0;
    }
    else if ([v10 isEqualToString:@"EARLIER_THAN_22M"])
    {
      uint64_t v11 = 1;
    }
    else if ([v10 isEqualToString:@"EARLIER_THAN_7M"])
    {
      uint64_t v11 = 2;
    }
    else if ([v10 isEqualToString:@"ON_TIME"])
    {
      uint64_t v11 = 3;
    }
    else if ([v10 isEqualToString:@"LATER_THAN_7M"])
    {
      uint64_t v11 = 4;
    }
    else if ([v10 isEqualToString:@"LATER_THAN_22M"])
    {
      uint64_t v11 = 5;
    }
    else if ([v10 isEqualToString:@"DID_NOT_ARRIVE"])
    {
      uint64_t v11 = 6;
    }
    else if ([v10 isEqualToString:@"DID_NOT_DEPART"])
    {
      uint64_t v11 = 7;
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
      goto LABEL_47;
    }
    uint64_t v11 = [v9 intValue];
  }
  [a1 setArrival:v11];
LABEL_47:

  if (a3) {
    uint64_t v12 = @"numberOfReroutes";
  }
  else {
    uint64_t v12 = @"number_of_reroutes";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setNumberOfReroutes:", objc_msgSend(v13, "unsignedIntValue"));
  }

  if (a3) {
    v14 = @"ttlUiNotificationShown";
  }
  else {
    v14 = @"ttl_ui_notification_shown";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v15;
    if ([v16 isEqualToString:@"TTL_UI_NOTIFICATION_NONE_SHOWN"])
    {
      uint64_t v17 = 0;
    }
    else if ([v16 isEqualToString:@"EARLY_SHOWN"])
    {
      uint64_t v17 = 1;
    }
    else if ([v16 isEqualToString:@"ON_TIME_SHOWN"])
    {
      uint64_t v17 = 2;
    }
    else if ([v16 isEqualToString:@"BOTH_SHOWN"])
    {
      uint64_t v17 = 3;
    }
    else
    {
      uint64_t v17 = 0;
    }

    goto LABEL_68;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = [v15 intValue];
LABEL_68:
    [a1 setTtlUiNotificationShown:v17];
  }

  if (a3) {
    v18 = @"earliestDepartureOffset";
  }
  else {
    v18 = @"earliest_departure_offset";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v19 doubleValue];
    objc_msgSend(a1, "setEarliestDepartureOffset:");
  }

  if (a3) {
    v20 = @"latestDepartureOffset";
  }
  else {
    v20 = @"latest_departure_offset";
  }
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v21 doubleValue];
    objc_msgSend(a1, "setLatestDepartureOffset:");
  }

  if (a3) {
    v22 = @"earliestArrivalOffset";
  }
  else {
    v22 = @"earliest_arrival_offset";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v23 doubleValue];
    objc_msgSend(a1, "setEarliestArrivalOffset:");
  }

  if (a3) {
    v24 = @"latestArrivalOffset";
  }
  else {
    v24 = @"latest_arrival_offset";
  }
  v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v25 doubleValue];
    objc_msgSend(a1, "setLatestArrivalOffset:");
  }

LABEL_90:
  return a1;
}

- (GEOLogMsgEventTimeToLeaveHypothesis)initWithJSON:(id)a3
{
  return (GEOLogMsgEventTimeToLeaveHypothesis *)-[GEOLogMsgEventTimeToLeaveHypothesis _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventTimeToLeaveHypothesisIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventTimeToLeaveHypothesisReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_7:
    if ((flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_8:
    if ((flags & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
LABEL_9:
  }
    PBDataWriterWriteDoubleField();
LABEL_10:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgEventTimeToLeaveHypothesis *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
  {
    v5[11] = self->_departure;
    *((unsigned char *)v5 + 56) |= 0x20u;
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v5[10] = self->_arrival;
  *((unsigned char *)v5 + 56) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  v5[12] = self->_numberOfReroutes;
  *((unsigned char *)v5 + 56) |= 0x40u;
  char flags = (char)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  v5[13] = self->_ttlUiNotificationShown;
  *((unsigned char *)v5 + 56) |= 0x80u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)v5 + 2) = *(void *)&self->_earliestDepartureOffset;
  *((unsigned char *)v5 + 56) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_7:
    if ((flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)v5 + 4) = *(void *)&self->_latestDepartureOffset;
  *((unsigned char *)v5 + 56) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_8:
    if ((flags & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  *((void *)v5 + 1) = *(void *)&self->_earliestArrivalOffset;
  *((unsigned char *)v5 + 56) |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_9:
    *((void *)v5 + 3) = *(void *)&self->_latestArrivalOffset;
    *((unsigned char *)v5 + 56) |= 4u;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
  {
    *((_DWORD *)result + 11) = self->_departure;
    *((unsigned char *)result + 56) |= 0x20u;
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 10) = self->_arrival;
  *((unsigned char *)result + 56) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 12) = self->_numberOfReroutes;
  *((unsigned char *)result + 56) |= 0x40u;
  char flags = (char)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 13) = self->_ttlUiNotificationShown;
  *((unsigned char *)result + 56) |= 0x80u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)result + 2) = *(void *)&self->_earliestDepartureOffset;
  *((unsigned char *)result + 56) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_7:
    if ((flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)result + 4) = *(void *)&self->_latestDepartureOffset;
  *((unsigned char *)result + 56) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_8:
    if ((flags & 4) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((void *)result + 1) = *(void *)&self->_earliestArrivalOffset;
  *((unsigned char *)result + 56) |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    return result;
  }
LABEL_9:
  *((void *)result + 3) = *(void *)&self->_latestArrivalOffset;
  *((unsigned char *)result + 56) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  [(GEOLogMsgEventTimeToLeaveHypothesis *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x20) == 0 || self->_departure != *((_DWORD *)v4 + 11)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x20) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x10) == 0 || self->_arrival != *((_DWORD *)v4 + 10)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x40) == 0 || self->_numberOfReroutes != *((_DWORD *)v4 + 12)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x40) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x80) == 0 || self->_ttlUiNotificationShown != *((_DWORD *)v4 + 13)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x80) != 0)
  {
LABEL_41:
    BOOL v5 = 0;
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_earliestDepartureOffset != *((double *)v4 + 2)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_latestDepartureOffset != *((double *)v4 + 4)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_41;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_earliestArrivalOffset != *((double *)v4 + 1)) {
      goto LABEL_41;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_41;
  }
  BOOL v5 = (*((unsigned char *)v4 + 56) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_latestArrivalOffset != *((double *)v4 + 3)) {
      goto LABEL_41;
    }
    BOOL v5 = 1;
  }
LABEL_42:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventTimeToLeaveHypothesis *)self readAll:1];
  char flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
  {
    uint64_t v4 = 2654435761 * self->_departure;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_arrival;
      if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_numberOfReroutes;
    if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
      goto LABEL_5;
    }
LABEL_13:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_6;
    }
LABEL_14:
    unint64_t v12 = 0;
    goto LABEL_17;
  }
LABEL_12:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 0x80) == 0) {
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_ttlUiNotificationShown;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_14;
  }
LABEL_6:
  double earliestDepartureOffset = self->_earliestDepartureOffset;
  double v9 = -earliestDepartureOffset;
  if (earliestDepartureOffset >= 0.0) {
    double v9 = self->_earliestDepartureOffset;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_17:
  if ((flags & 8) != 0)
  {
    double latestDepartureOffset = self->_latestDepartureOffset;
    double v15 = -latestDepartureOffset;
    if (latestDepartureOffset >= 0.0) {
      double v15 = self->_latestDepartureOffset;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v13 += (unint64_t)v17;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  if (flags)
  {
    double earliestArrivalOffset = self->_earliestArrivalOffset;
    double v20 = -earliestArrivalOffset;
    if (earliestArrivalOffset >= 0.0) {
      double v20 = self->_earliestArrivalOffset;
    }
    long double v21 = floor(v20 + 0.5);
    double v22 = (v20 - v21) * 1.84467441e19;
    unint64_t v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0) {
        v18 += (unint64_t)v22;
      }
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
  if ((flags & 4) != 0)
  {
    double latestArrivalOffset = self->_latestArrivalOffset;
    double v25 = -latestArrivalOffset;
    if (latestArrivalOffset >= 0.0) {
      double v25 = self->_latestArrivalOffset;
    }
    long double v26 = floor(v25 + 0.5);
    double v27 = (v25 - v26) * 1.84467441e19;
    unint64_t v23 = 2654435761u * (unint64_t)fmod(v26, 1.84467441e19);
    if (v27 >= 0.0)
    {
      if (v27 > 0.0) {
        v23 += (unint64_t)v27;
      }
    }
    else
    {
      v23 -= (unint64_t)fabs(v27);
    }
  }
  else
  {
    unint64_t v23 = 0;
  }
  return v5 ^ v4 ^ v6 ^ v7 ^ v12 ^ v13 ^ v18 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 56);
  if ((v4 & 0x20) != 0)
  {
    self->_departure = *((_DWORD *)v5 + 11);
    *(unsigned char *)&self->_flags |= 0x20u;
    char v4 = *((unsigned char *)v5 + 56);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v5 + 56) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_arrival = *((_DWORD *)v5 + 10);
  *(unsigned char *)&self->_flags |= 0x10u;
  char v4 = *((unsigned char *)v5 + 56);
  if ((v4 & 0x40) == 0)
  {
LABEL_4:
    if ((v4 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_numberOfReroutes = *((_DWORD *)v5 + 12);
  *(unsigned char *)&self->_flags |= 0x40u;
  char v4 = *((unsigned char *)v5 + 56);
  if ((v4 & 0x80) == 0)
  {
LABEL_5:
    if ((v4 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_ttlUiNotificationShown = *((_DWORD *)v5 + 13);
  *(unsigned char *)&self->_flags |= 0x80u;
  char v4 = *((unsigned char *)v5 + 56);
  if ((v4 & 2) == 0)
  {
LABEL_6:
    if ((v4 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_double earliestDepartureOffset = *((double *)v5 + 2);
  *(unsigned char *)&self->_flags |= 2u;
  char v4 = *((unsigned char *)v5 + 56);
  if ((v4 & 8) == 0)
  {
LABEL_7:
    if ((v4 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_double latestDepartureOffset = *((double *)v5 + 4);
  *(unsigned char *)&self->_flags |= 8u;
  char v4 = *((unsigned char *)v5 + 56);
  if ((v4 & 1) == 0)
  {
LABEL_8:
    if ((v4 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  self->_double earliestArrivalOffset = *((double *)v5 + 1);
  *(unsigned char *)&self->_flags |= 1u;
  if ((*((unsigned char *)v5 + 56) & 4) != 0)
  {
LABEL_9:
    self->_double latestArrivalOffset = *((double *)v5 + 3);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_10:
}

@end