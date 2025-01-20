@interface GEOLogMsgEventCommuteWindow
+ (BOOL)isValid:(id)a3;
+ (Class)predictedDestinationType;
- (BOOL)hasDuration;
- (BOOL)hasEndReason;
- (BOOL)hasNumberOfAlertingResponses;
- (BOOL)hasNumberOfDoomRoutingRequests;
- (BOOL)hasPredictedExitTime;
- (BOOL)hasStartTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventCommuteWindow)initWithDictionary:(id)a3;
- (GEOLogMsgEventCommuteWindow)initWithJSON:(id)a3;
- (NSMutableArray)predictedDestinations;
- (double)startTime;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)endReasonAsString:(int)a3;
- (id)jsonRepresentation;
- (id)predictedDestinationAtIndex:(unint64_t)a3;
- (int)StringAsEndReason:(id)a3;
- (int)endReason;
- (unint64_t)hash;
- (unint64_t)predictedDestinationsCount;
- (unsigned)duration;
- (unsigned)numberOfAlertingResponses;
- (unsigned)numberOfDoomRoutingRequests;
- (unsigned)predictedExitTime;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addPredictedDestination:(id)a3;
- (void)clearPredictedDestinations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setEndReason:(int)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasEndReason:(BOOL)a3;
- (void)setHasNumberOfAlertingResponses:(BOOL)a3;
- (void)setHasNumberOfDoomRoutingRequests:(BOOL)a3;
- (void)setHasPredictedExitTime:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setNumberOfAlertingResponses:(unsigned int)a3;
- (void)setNumberOfDoomRoutingRequests:(unsigned int)a3;
- (void)setPredictedDestinations:(id)a3;
- (void)setPredictedExitTime:(unsigned int)a3;
- (void)setStartTime:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventCommuteWindow

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasStartTime
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)duration
{
  return self->_duration;
}

- (void)setDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)predictedExitTime
{
  return self->_predictedExitTime;
}

- (void)setPredictedExitTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_predictedExitTime = a3;
}

- (void)setHasPredictedExitTime:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasPredictedExitTime
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (int)endReason
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_endReason;
  }
  else {
    return 0;
  }
}

- (void)setEndReason:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_endReason = a3;
}

- (void)setHasEndReason:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasEndReason
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)endReasonAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7838[a3];
  }

  return v3;
}

- (int)StringAsEndReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_REASON"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COMMUTE_WINDOW_TIMED_OUT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"COMMUTE_MISSION_COMPLETE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (NSMutableArray)predictedDestinations
{
  return self->_predictedDestinations;
}

- (void)setPredictedDestinations:(id)a3
{
}

- (void)clearPredictedDestinations
{
}

- (void)addPredictedDestination:(id)a3
{
  id v4 = a3;
  predictedDestinations = self->_predictedDestinations;
  id v8 = v4;
  if (!predictedDestinations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_predictedDestinations;
    self->_predictedDestinations = v6;

    id v4 = v8;
    predictedDestinations = self->_predictedDestinations;
  }
  [(NSMutableArray *)predictedDestinations addObject:v4];
}

- (unint64_t)predictedDestinationsCount
{
  return [(NSMutableArray *)self->_predictedDestinations count];
}

- (id)predictedDestinationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_predictedDestinations objectAtIndex:a3];
}

+ (Class)predictedDestinationType
{
  return (Class)objc_opt_class();
}

- (unsigned)numberOfDoomRoutingRequests
{
  return self->_numberOfDoomRoutingRequests;
}

- (void)setNumberOfDoomRoutingRequests:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_numberOfDoomRoutingRequests = a3;
}

- (void)setHasNumberOfDoomRoutingRequests:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasNumberOfDoomRoutingRequests
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (unsigned)numberOfAlertingResponses
{
  return self->_numberOfAlertingResponses;
}

- (void)setNumberOfAlertingResponses:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_numberOfAlertingResponses = a3;
}

- (void)setHasNumberOfAlertingResponses:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasNumberOfAlertingResponses
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventCommuteWindow;
  id v4 = [(GEOLogMsgEventCommuteWindow *)&v8 description];
  v5 = [(GEOLogMsgEventCommuteWindow *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventCommuteWindow _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_48;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 44);
  if (v5)
  {
    v6 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
    if (a2) {
      v7 = @"startTime";
    }
    else {
      v7 = @"start_time";
    }
    [v4 setObject:v6 forKey:v7];

    char v5 = *(unsigned char *)(a1 + 44);
  }
  if ((v5 & 2) == 0)
  {
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
LABEL_12:
    v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
    if (a2) {
      v10 = @"predictedExitTime";
    }
    else {
      v10 = @"predicted_exit_time";
    }
    [v4 setObject:v9 forKey:v10];

    if ((*(unsigned char *)(a1 + 44) & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_16;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
  [v4 setObject:v8 forKey:@"duration"];

  char v5 = *(unsigned char *)(a1 + 44);
  if ((v5 & 0x20) != 0) {
    goto LABEL_12;
  }
LABEL_9:
  if ((v5 & 4) != 0)
  {
LABEL_16:
    uint64_t v11 = *(int *)(a1 + 28);
    if (v11 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 28));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E53F7838[v11];
    }
    if (a2) {
      v13 = @"endReason";
    }
    else {
      v13 = @"end_reason";
    }
    [v4 setObject:v12 forKey:v13];
  }
LABEL_23:
  if ([*(id *)(a1 + 8) count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v15 = *(id *)(a1 + 8);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (a2) {
            [v20 jsonRepresentation];
          }
          else {
          v21 = [v20 dictionaryRepresentation];
          }
          [v14 addObject:v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v17);
    }

    if (a2) {
      v22 = @"predictedDestination";
    }
    else {
      v22 = @"predicted_destination";
    }
    [v4 setObject:v14 forKey:v22];
  }
  char v23 = *(unsigned char *)(a1 + 44);
  if ((v23 & 0x10) != 0)
  {
    v24 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 36)];
    if (a2) {
      v25 = @"numberOfDoomRoutingRequests";
    }
    else {
      v25 = @"number_of_doom_routing_requests";
    }
    [v4 setObject:v24 forKey:v25];

    char v23 = *(unsigned char *)(a1 + 44);
  }
  if ((v23 & 8) != 0)
  {
    v26 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
    if (a2) {
      v27 = @"numberOfAlertingResponses";
    }
    else {
      v27 = @"number_of_alerting_responses";
    }
    [v4 setObject:v26 forKey:v27];
  }
LABEL_48:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventCommuteWindow _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventCommuteWindow)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventCommuteWindow *)-[GEOLogMsgEventCommuteWindow _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_58;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_58;
  }
  if (a3) {
    v6 = @"startTime";
  }
  else {
    v6 = @"start_time";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 doubleValue];
    objc_msgSend(a1, "setStartTime:");
  }

  objc_super v8 = [v5 objectForKeyedSubscript:@"duration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDuration:", objc_msgSend(v8, "unsignedIntValue"));
  }

  if (a3) {
    v9 = @"predictedExitTime";
  }
  else {
    v9 = @"predicted_exit_time";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPredictedExitTime:", objc_msgSend(v10, "unsignedIntValue"));
  }

  if (a3) {
    uint64_t v11 = @"endReason";
  }
  else {
    uint64_t v11 = @"end_reason";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v12;
    if ([v13 isEqualToString:@"UNKNOWN_REASON"])
    {
      uint64_t v14 = 0;
    }
    else if ([v13 isEqualToString:@"COMMUTE_WINDOW_TIMED_OUT"])
    {
      uint64_t v14 = 1;
    }
    else if ([v13 isEqualToString:@"COMMUTE_MISSION_COMPLETE"])
    {
      uint64_t v14 = 2;
    }
    else
    {
      uint64_t v14 = 0;
    }

    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v12 intValue];
LABEL_29:
    [a1 setEndReason:v14];
  }

  if (a3) {
    id v15 = @"predictedDestination";
  }
  else {
    id v15 = @"predicted_destination";
  }
  uint64_t v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v31 = v5;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v23 = [GEOPredictedCommuteDestination alloc];
            if (a3) {
              uint64_t v24 = [(GEOPredictedCommuteDestination *)v23 initWithJSON:v22];
            }
            else {
              uint64_t v24 = [(GEOPredictedCommuteDestination *)v23 initWithDictionary:v22];
            }
            v25 = (void *)v24;
            [a1 addPredictedDestination:v24];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v19);
    }

    id v5 = v31;
  }

  if (a3) {
    v26 = @"numberOfDoomRoutingRequests";
  }
  else {
    v26 = @"number_of_doom_routing_requests";
  }
  v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setNumberOfDoomRoutingRequests:", objc_msgSend(v27, "unsignedIntValue"));
  }

  if (a3) {
    v28 = @"numberOfAlertingResponses";
  }
  else {
    v28 = @"number_of_alerting_responses";
  }
  long long v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setNumberOfAlertingResponses:", objc_msgSend(v29, "unsignedIntValue"));
  }

LABEL_58:
  return a1;
}

- (GEOLogMsgEventCommuteWindow)initWithJSON:(id)a3
{
  return (GEOLogMsgEventCommuteWindow *)-[GEOLogMsgEventCommuteWindow _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventCommuteWindowIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventCommuteWindowReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteDoubleField();
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_predictedDestinations;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  char v11 = (char)self->_flags;
  if ((v11 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v11 = (char)self->_flags;
  }
  if ((v11 & 8) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  v10 = a3;
  [(GEOLogMsgEventCommuteWindow *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v10[2] = *(void *)&self->_startTime;
    *((unsigned char *)v10 + 44) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
LABEL_19:
      *((_DWORD *)v10 + 10) = self->_predictedExitTime;
      *((unsigned char *)v10 + 44) |= 0x20u;
      if ((*(unsigned char *)&self->_flags & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v10 + 6) = self->_duration;
  *((unsigned char *)v10 + 44) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) != 0) {
    goto LABEL_19;
  }
LABEL_4:
  if ((flags & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v10 + 7) = self->_endReason;
    *((unsigned char *)v10 + 44) |= 4u;
  }
LABEL_6:
  if ([(GEOLogMsgEventCommuteWindow *)self predictedDestinationsCount])
  {
    [v10 clearPredictedDestinations];
    unint64_t v5 = [(GEOLogMsgEventCommuteWindow *)self predictedDestinationsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOLogMsgEventCommuteWindow *)self predictedDestinationAtIndex:i];
        [v10 addPredictedDestination:v8];
      }
    }
  }
  char v9 = (char)self->_flags;
  if ((v9 & 0x10) != 0)
  {
    *((_DWORD *)v10 + 9) = self->_numberOfDoomRoutingRequests;
    *((unsigned char *)v10 + 44) |= 0x10u;
    char v9 = (char)self->_flags;
  }
  if ((v9 & 8) != 0)
  {
    *((_DWORD *)v10 + 8) = self->_numberOfAlertingResponses;
    *((unsigned char *)v10 + 44) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(double *)(v5 + 16) = self->_startTime;
    *(unsigned char *)(v5 + 44) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_duration;
  *(unsigned char *)(v5 + 44) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_20:
  *(_DWORD *)(v5 + 40) = self->_predictedExitTime;
  *(unsigned char *)(v5 + 44) |= 0x20u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 28) = self->_endReason;
    *(unsigned char *)(v5 + 44) |= 4u;
  }
LABEL_6:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_predictedDestinations;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [(id)v6 addPredictedDestination:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  char v14 = (char)self->_flags;
  if ((v14 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 36) = self->_numberOfDoomRoutingRequests;
    *(unsigned char *)(v6 + 44) |= 0x10u;
    char v14 = (char)self->_flags;
  }
  if ((v14 & 8) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_numberOfAlertingResponses;
    *(unsigned char *)(v6 + 44) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  [(GEOLogMsgEventCommuteWindow *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 44);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_startTime != *((double *)v4 + 2)) {
      goto LABEL_34;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_duration != *((_DWORD *)v4 + 6)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x20) == 0 || self->_predictedExitTime != *((_DWORD *)v4 + 10)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x20) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_endReason != *((_DWORD *)v4 + 7)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_34;
  }
  predictedDestinations = self->_predictedDestinations;
  if ((unint64_t)predictedDestinations | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](predictedDestinations, "isEqual:"))
    {
LABEL_34:
      BOOL v8 = 0;
      goto LABEL_35;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 44);
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_numberOfDoomRoutingRequests != *((_DWORD *)v4 + 9)) {
      goto LABEL_34;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_34;
  }
  BOOL v8 = (v6 & 8) == 0;
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_numberOfAlertingResponses != *((_DWORD *)v4 + 8)) {
      goto LABEL_34;
    }
    BOOL v8 = 1;
  }
LABEL_35:

  return v8;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventCommuteWindow *)self readAll:1];
  char flags = (char)self->_flags;
  if (flags)
  {
    double startTime = self->_startTime;
    double v6 = -startTime;
    if (startTime >= 0.0) {
      double v6 = self->_startTime;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((flags & 2) == 0)
  {
    uint64_t v9 = 0;
    if ((flags & 0x20) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v10 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  uint64_t v9 = 2654435761 * self->_duration;
  if ((flags & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v10 = 2654435761 * self->_predictedExitTime;
  if ((flags & 4) != 0)
  {
LABEL_12:
    uint64_t v11 = 2654435761 * self->_endReason;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v11 = 0;
LABEL_16:
  uint64_t v12 = [(NSMutableArray *)self->_predictedDestinations hash];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    uint64_t v13 = 2654435761 * self->_numberOfDoomRoutingRequests;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_18;
    }
LABEL_20:
    uint64_t v14 = 0;
    return v9 ^ v4 ^ v10 ^ v11 ^ v13 ^ v14 ^ v12;
  }
  uint64_t v13 = 0;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v14 = 2654435761 * self->_numberOfAlertingResponses;
  return v9 ^ v4 ^ v10 ^ v11 ^ v13 ^ v14 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 44);
  if (v5)
  {
    self->_double startTime = *((double *)v4 + 2);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_flags |= 2u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_20:
  self->_predictedExitTime = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_flags |= 0x20u;
  if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
LABEL_5:
    self->_endReason = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_6:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *((id *)v4 + 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEOLogMsgEventCommuteWindow addPredictedDestination:](self, "addPredictedDestination:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  char v11 = *((unsigned char *)v4 + 44);
  if ((v11 & 0x10) != 0)
  {
    self->_numberOfDoomRoutingRequests = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_flags |= 0x10u;
    char v11 = *((unsigned char *)v4 + 44);
  }
  if ((v11 & 8) != 0)
  {
    self->_numberOfAlertingResponses = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_flags |= 8u;
  }
}

- (void).cxx_destruct
{
}

@end