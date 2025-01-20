@interface GEOAlightNotificationFeedback
+ (BOOL)isValid:(id)a3;
- (BOOL)arrivalDetected;
- (BOOL)displayed;
- (BOOL)hasAlightStopMuid;
- (BOOL)hasArrivalDetected;
- (BOOL)hasArrivedAtTimestamp;
- (BOOL)hasDisplayed;
- (BOOL)hasLastDetectedLocationHorizontalAccuracy;
- (BOOL)hasLastDetectedLocationTimestamp;
- (BOOL)hasLastDetectedLocationTraversalPercent;
- (BOOL)hasLineMuid;
- (BOOL)hasPreviousStopMuid;
- (BOOL)hasStepID;
- (BOOL)hasTrigger;
- (BOOL)hasTriggered;
- (BOOL)hasTriggeredLocationTraversalPercent;
- (BOOL)hasTriggeredTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)triggered;
- (GEOAlightNotificationFeedback)initWithDictionary:(id)a3;
- (GEOAlightNotificationFeedback)initWithJSON:(id)a3;
- (double)arrivedAtTimestamp;
- (double)lastDetectedLocationHorizontalAccuracy;
- (double)lastDetectedLocationTimestamp;
- (double)triggeredTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)triggerAsString:(int)a3;
- (int)StringAsTrigger:(id)a3;
- (int)lastDetectedLocationTraversalPercent;
- (int)trigger;
- (int)triggeredLocationTraversalPercent;
- (unint64_t)alightStopMuid;
- (unint64_t)hash;
- (unint64_t)lineMuid;
- (unint64_t)previousStopMuid;
- (unsigned)stepID;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlightStopMuid:(unint64_t)a3;
- (void)setArrivalDetected:(BOOL)a3;
- (void)setArrivedAtTimestamp:(double)a3;
- (void)setDisplayed:(BOOL)a3;
- (void)setHasAlightStopMuid:(BOOL)a3;
- (void)setHasArrivalDetected:(BOOL)a3;
- (void)setHasArrivedAtTimestamp:(BOOL)a3;
- (void)setHasDisplayed:(BOOL)a3;
- (void)setHasLastDetectedLocationHorizontalAccuracy:(BOOL)a3;
- (void)setHasLastDetectedLocationTimestamp:(BOOL)a3;
- (void)setHasLastDetectedLocationTraversalPercent:(BOOL)a3;
- (void)setHasLineMuid:(BOOL)a3;
- (void)setHasPreviousStopMuid:(BOOL)a3;
- (void)setHasStepID:(BOOL)a3;
- (void)setHasTrigger:(BOOL)a3;
- (void)setHasTriggered:(BOOL)a3;
- (void)setHasTriggeredLocationTraversalPercent:(BOOL)a3;
- (void)setHasTriggeredTimestamp:(BOOL)a3;
- (void)setLastDetectedLocationHorizontalAccuracy:(double)a3;
- (void)setLastDetectedLocationTimestamp:(double)a3;
- (void)setLastDetectedLocationTraversalPercent:(int)a3;
- (void)setLineMuid:(unint64_t)a3;
- (void)setPreviousStopMuid:(unint64_t)a3;
- (void)setStepID:(unsigned int)a3;
- (void)setTrigger:(int)a3;
- (void)setTriggered:(BOOL)a3;
- (void)setTriggeredLocationTraversalPercent:(int)a3;
- (void)setTriggeredTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAlightNotificationFeedback

- (BOOL)displayed
{
  return self->_displayed;
}

- (void)setDisplayed:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1000u;
  self->_displayed = a3;
}

- (void)setHasDisplayed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xEFFF | v3;
}

- (BOOL)hasDisplayed
{
  return (*(_WORD *)&self->_flags >> 12) & 1;
}

- (BOOL)triggered
{
  return self->_triggered;
}

- (void)setTriggered:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_triggered = a3;
}

- (void)setHasTriggered:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xDFFF | v3;
}

- (BOOL)hasTriggered
{
  return (*(_WORD *)&self->_flags >> 13) & 1;
}

- (unint64_t)lineMuid
{
  return self->_lineMuid;
}

- (void)setLineMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x10u;
  self->_lineMuid = a3;
}

- (void)setHasLineMuid:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasLineMuid
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unint64_t)previousStopMuid
{
  return self->_previousStopMuid;
}

- (void)setPreviousStopMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x20u;
  self->_previousStopMuid = a3;
}

- (void)setHasPreviousStopMuid:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasPreviousStopMuid
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (unint64_t)alightStopMuid
{
  return self->_alightStopMuid;
}

- (void)setAlightStopMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 1u;
  self->_alightStopMuid = a3;
}

- (void)setHasAlightStopMuid:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (BOOL)hasAlightStopMuid
{
  return *(_WORD *)&self->_flags & 1;
}

- (int)trigger
{
  if ((*(_WORD *)&self->_flags & 0x400) != 0) {
    return self->_trigger;
  }
  else {
    return 0;
  }
}

- (void)setTrigger:(int)a3
{
  *(_WORD *)&self->_flags |= 0x400u;
  self->_trigger = a3;
}

- (void)setHasTrigger:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFBFF | v3;
}

- (BOOL)hasTrigger
{
  return (*(_WORD *)&self->_flags >> 10) & 1;
}

- (id)triggerAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E4A60[a3];
  }

  return v3;
}

- (int)StringAsTrigger:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TRIGGER_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRIGGER_LOCATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRIGGER_SCHEDULE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (double)triggeredTimestamp
{
  return self->_triggeredTimestamp;
}

- (void)setTriggeredTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 0x40u;
  self->_triggeredTimestamp = a3;
}

- (void)setHasTriggeredTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasTriggeredTimestamp
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (int)triggeredLocationTraversalPercent
{
  if ((*(_WORD *)&self->_flags & 0x200) != 0) {
    return self->_triggeredLocationTraversalPercent;
  }
  else {
    return -1;
  }
}

- (void)setTriggeredLocationTraversalPercent:(int)a3
{
  *(_WORD *)&self->_flags |= 0x200u;
  self->_triggeredLocationTraversalPercent = a3;
}

- (void)setHasTriggeredLocationTraversalPercent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v3;
}

- (BOOL)hasTriggeredLocationTraversalPercent
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (double)lastDetectedLocationTimestamp
{
  return self->_lastDetectedLocationTimestamp;
}

- (void)setLastDetectedLocationTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 8u;
  self->_lastDetectedLocationTimestamp = a3;
}

- (void)setHasLastDetectedLocationTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasLastDetectedLocationTimestamp
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (int)lastDetectedLocationTraversalPercent
{
  if ((*(_WORD *)&self->_flags & 0x80) != 0) {
    return self->_lastDetectedLocationTraversalPercent;
  }
  else {
    return -1;
  }
}

- (void)setLastDetectedLocationTraversalPercent:(int)a3
{
  *(_WORD *)&self->_flags |= 0x80u;
  self->_lastDetectedLocationTraversalPercent = a3;
}

- (void)setHasLastDetectedLocationTraversalPercent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasLastDetectedLocationTraversalPercent
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (double)lastDetectedLocationHorizontalAccuracy
{
  double result = -1.0;
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    return self->_lastDetectedLocationHorizontalAccuracy;
  }
  return result;
}

- (void)setLastDetectedLocationHorizontalAccuracy:(double)a3
{
  *(_WORD *)&self->_flags |= 4u;
  self->_lastDetectedLocationHorizontalAccuracy = a3;
}

- (void)setHasLastDetectedLocationHorizontalAccuracy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasLastDetectedLocationHorizontalAccuracy
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (BOOL)arrivalDetected
{
  return self->_arrivalDetected;
}

- (void)setArrivalDetected:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x800u;
  self->_arrivalDetected = a3;
}

- (void)setHasArrivalDetected:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xF7FF | v3;
}

- (BOOL)hasArrivalDetected
{
  return (*(_WORD *)&self->_flags >> 11) & 1;
}

- (double)arrivedAtTimestamp
{
  return self->_arrivedAtTimestamp;
}

- (void)setArrivedAtTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 2u;
  self->_arrivedAtTimestamp = a3;
}

- (void)setHasArrivedAtTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasArrivedAtTimestamp
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x100u;
  self->_stepID = a3;
}

- (void)setHasStepID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasStepID
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAlightNotificationFeedback;
  int v4 = [(GEOAlightNotificationFeedback *)&v8 description];
  v5 = [(GEOAlightNotificationFeedback *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAlightNotificationFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_64;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x1000) != 0)
  {
    v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 81)];
    [v4 setObject:v6 forKey:@"displayed"];

    __int16 v5 = *(_WORD *)(a1 + 84);
  }
  if ((v5 & 0x2000) != 0)
  {
    v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 82)];
    [v4 setObject:v7 forKey:@"triggered"];

    __int16 v5 = *(_WORD *)(a1 + 84);
    if ((v5 & 0x10) == 0)
    {
LABEL_6:
      if ((v5 & 0x20) == 0) {
        goto LABEL_7;
      }
      goto LABEL_23;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_6;
  }
  objc_super v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  if (a2) {
    v9 = @"lineMuid";
  }
  else {
    v9 = @"line_muid";
  }
  [v4 setObject:v8 forKey:v9];

  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_23:
  v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  if (a2) {
    v11 = @"previousStopMuid";
  }
  else {
    v11 = @"previous_stop_muid";
  }
  [v4 setObject:v10 forKey:v11];

  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_27:
  v12 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
  if (a2) {
    v13 = @"alightStopMuid";
  }
  else {
    v13 = @"alight_stop_muid";
  }
  [v4 setObject:v12 forKey:v13];

  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x400) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_31:
  uint64_t v14 = *(int *)(a1 + 76);
  if (v14 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_1E53E4A60[v14];
  }
  [v4 setObject:v15 forKey:@"trigger"];

  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x40) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_35:
  v16 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  if (a2) {
    v17 = @"triggeredTimestamp";
  }
  else {
    v17 = @"triggered_timestamp";
  }
  [v4 setObject:v16 forKey:v17];

  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_39:
  v18 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  if (a2) {
    v19 = @"triggeredLocationTraversalPercent";
  }
  else {
    v19 = @"triggered_location_traversal_percent";
  }
  [v4 setObject:v18 forKey:v19];

  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_47;
  }
LABEL_43:
  v20 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  if (a2) {
    v21 = @"lastDetectedLocationTimestamp";
  }
  else {
    v21 = @"last_detected_location_timestamp";
  }
  [v4 setObject:v20 forKey:v21];

  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x80) == 0)
  {
LABEL_13:
    if ((v5 & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_51;
  }
LABEL_47:
  v22 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  if (a2) {
    v23 = @"lastDetectedLocationTraversalPercent";
  }
  else {
    v23 = @"last_detected_location_traversal_percent";
  }
  [v4 setObject:v22 forKey:v23];

  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 4) == 0)
  {
LABEL_14:
    if ((v5 & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_55;
  }
LABEL_51:
  v24 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
  if (a2) {
    v25 = @"lastDetectedLocationHorizontalAccuracy";
  }
  else {
    v25 = @"last_detected_location_horizontal_accuracy";
  }
  [v4 setObject:v24 forKey:v25];

  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x800) == 0)
  {
LABEL_15:
    if ((v5 & 2) == 0) {
      goto LABEL_16;
    }
LABEL_59:
    v28 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
    if (a2) {
      v29 = @"arrivedAtTimestamp";
    }
    else {
      v29 = @"arrived_at_timestamp";
    }
    [v4 setObject:v28 forKey:v29];

    if ((*(_WORD *)(a1 + 84) & 0x100) == 0) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }
LABEL_55:
  v26 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
  if (a2) {
    v27 = @"arrivalDetected";
  }
  else {
    v27 = @"arrival_detected";
  }
  [v4 setObject:v26 forKey:v27];

  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 2) != 0) {
    goto LABEL_59;
  }
LABEL_16:
  if ((v5 & 0x100) != 0)
  {
LABEL_63:
    v30 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
    [v4 setObject:v30 forKey:@"stepID"];
  }
LABEL_64:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAlightNotificationFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOAlightNotificationFeedback)initWithDictionary:(id)a3
{
  return (GEOAlightNotificationFeedback *)-[GEOAlightNotificationFeedback _initWithDictionary:isJSON:](self, a3, 0);
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
  v6 = [v5 objectForKeyedSubscript:@"displayed"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDisplayed:", objc_msgSend(v6, "BOOLValue"));
  }

  v7 = [v5 objectForKeyedSubscript:@"triggered"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTriggered:", objc_msgSend(v7, "BOOLValue"));
  }

  if (a3) {
    objc_super v8 = @"lineMuid";
  }
  else {
    objc_super v8 = @"line_muid";
  }
  v9 = [v5 objectForKeyedSubscript:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLineMuid:", objc_msgSend(v9, "unsignedLongLongValue"));
  }

  if (a3) {
    v10 = @"previousStopMuid";
  }
  else {
    v10 = @"previous_stop_muid";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPreviousStopMuid:", objc_msgSend(v11, "unsignedLongLongValue"));
  }

  if (a3) {
    v12 = @"alightStopMuid";
  }
  else {
    v12 = @"alight_stop_muid";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAlightStopMuid:", objc_msgSend(v13, "unsignedLongLongValue"));
  }

  uint64_t v14 = [v5 objectForKeyedSubscript:@"trigger"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    if ([v15 isEqualToString:@"TRIGGER_UNKNOWN"])
    {
      uint64_t v16 = 0;
    }
    else if ([v15 isEqualToString:@"TRIGGER_LOCATION"])
    {
      uint64_t v16 = 1;
    }
    else if ([v15 isEqualToString:@"TRIGGER_SCHEDULE"])
    {
      uint64_t v16 = 2;
    }
    else
    {
      uint64_t v16 = 0;
    }

    goto LABEL_33;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v14 intValue];
LABEL_33:
    [a1 setTrigger:v16];
  }

  if (a3) {
    v17 = @"triggeredTimestamp";
  }
  else {
    v17 = @"triggered_timestamp";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v18 doubleValue];
    objc_msgSend(a1, "setTriggeredTimestamp:");
  }

  if (a3) {
    v19 = @"triggeredLocationTraversalPercent";
  }
  else {
    v19 = @"triggered_location_traversal_percent";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTriggeredLocationTraversalPercent:", objc_msgSend(v20, "intValue"));
  }

  if (a3) {
    v21 = @"lastDetectedLocationTimestamp";
  }
  else {
    v21 = @"last_detected_location_timestamp";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v22 doubleValue];
    objc_msgSend(a1, "setLastDetectedLocationTimestamp:");
  }

  if (a3) {
    v23 = @"lastDetectedLocationTraversalPercent";
  }
  else {
    v23 = @"last_detected_location_traversal_percent";
  }
  v24 = [v5 objectForKeyedSubscript:v23];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLastDetectedLocationTraversalPercent:", objc_msgSend(v24, "intValue"));
  }

  if (a3) {
    v25 = @"lastDetectedLocationHorizontalAccuracy";
  }
  else {
    v25 = @"last_detected_location_horizontal_accuracy";
  }
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v26 doubleValue];
    objc_msgSend(a1, "setLastDetectedLocationHorizontalAccuracy:");
  }

  if (a3) {
    v27 = @"arrivalDetected";
  }
  else {
    v27 = @"arrival_detected";
  }
  v28 = [v5 objectForKeyedSubscript:v27];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setArrivalDetected:", objc_msgSend(v28, "BOOLValue"));
  }

  if (a3) {
    v29 = @"arrivedAtTimestamp";
  }
  else {
    v29 = @"arrived_at_timestamp";
  }
  v30 = [v5 objectForKeyedSubscript:v29];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v30 doubleValue];
    objc_msgSend(a1, "setArrivedAtTimestamp:");
  }

  v31 = [v5 objectForKeyedSubscript:@"stepID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStepID:", objc_msgSend(v31, "unsignedIntValue"));
  }

LABEL_72:
  return a1;
}

- (GEOAlightNotificationFeedback)initWithJSON:(id)a3
{
  return (GEOAlightNotificationFeedback *)-[GEOAlightNotificationFeedback _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAlightNotificationFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAlightNotificationFeedbackReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x2000) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_6:
    if ((flags & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x400) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_8:
    if ((flags & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_9:
    if ((flags & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_10:
    if ((flags & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_11:
    if ((flags & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_12:
    if ((flags & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_13:
    if ((flags & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_14:
    if ((flags & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_flags & 0x100) != 0) {
LABEL_15:
  }
    PBDataWriterWriteUint32Field();
LABEL_16:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOAlightNotificationFeedback *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x1000) != 0)
  {
    v5[81] = self->_displayed;
    *((_WORD *)v5 + 42) |= 0x1000u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x2000) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  v5[82] = self->_triggered;
  *((_WORD *)v5 + 42) |= 0x2000u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)v5 + 5) = self->_lineMuid;
  *((_WORD *)v5 + 42) |= 0x10u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)v5 + 6) = self->_previousStopMuid;
  *((_WORD *)v5 + 42) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_6:
    if ((flags & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)v5 + 1) = self->_alightStopMuid;
  *((_WORD *)v5 + 42) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x400) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 19) = self->_trigger;
  *((_WORD *)v5 + 42) |= 0x400u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_8:
    if ((flags & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)v5 + 7) = *(void *)&self->_triggeredTimestamp;
  *((_WORD *)v5 + 42) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_9:
    if ((flags & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v5 + 18) = self->_triggeredLocationTraversalPercent;
  *((_WORD *)v5 + 42) |= 0x200u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_10:
    if ((flags & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)v5 + 4) = *(void *)&self->_lastDetectedLocationTimestamp;
  *((_WORD *)v5 + 42) |= 8u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_11:
    if ((flags & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v5 + 16) = self->_lastDetectedLocationTraversalPercent;
  *((_WORD *)v5 + 42) |= 0x80u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_12:
    if ((flags & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)v5 + 3) = *(void *)&self->_lastDetectedLocationHorizontalAccuracy;
  *((_WORD *)v5 + 42) |= 4u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_13:
    if ((flags & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  v5[80] = self->_arrivalDetected;
  *((_WORD *)v5 + 42) |= 0x800u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_14:
    if ((flags & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  *((void *)v5 + 2) = *(void *)&self->_arrivedAtTimestamp;
  *((_WORD *)v5 + 42) |= 2u;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
LABEL_15:
    *((_DWORD *)v5 + 17) = self->_stepID;
    *((_WORD *)v5 + 42) |= 0x100u;
  }
LABEL_16:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x1000) != 0)
  {
    *((unsigned char *)result + 81) = self->_displayed;
    *((_WORD *)result + 42) |= 0x1000u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x2000) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 82) = self->_triggered;
  *((_WORD *)result + 42) |= 0x2000u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)result + 5) = self->_lineMuid;
  *((_WORD *)result + 42) |= 0x10u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)result + 6) = self->_previousStopMuid;
  *((_WORD *)result + 42) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_6:
    if ((flags & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)result + 1) = self->_alightStopMuid;
  *((_WORD *)result + 42) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x400) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 19) = self->_trigger;
  *((_WORD *)result + 42) |= 0x400u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_8:
    if ((flags & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)result + 7) = *(void *)&self->_triggeredTimestamp;
  *((_WORD *)result + 42) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_9:
    if ((flags & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 18) = self->_triggeredLocationTraversalPercent;
  *((_WORD *)result + 42) |= 0x200u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_10:
    if ((flags & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)result + 4) = *(void *)&self->_lastDetectedLocationTimestamp;
  *((_WORD *)result + 42) |= 8u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_11:
    if ((flags & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 16) = self->_lastDetectedLocationTraversalPercent;
  *((_WORD *)result + 42) |= 0x80u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_12:
    if ((flags & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)result + 3) = *(void *)&self->_lastDetectedLocationHorizontalAccuracy;
  *((_WORD *)result + 42) |= 4u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_13:
    if ((flags & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((unsigned char *)result + 80) = self->_arrivalDetected;
  *((_WORD *)result + 42) |= 0x800u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_14:
    if ((flags & 0x100) == 0) {
      return result;
    }
    goto LABEL_15;
  }
LABEL_29:
  *((void *)result + 2) = *(void *)&self->_arrivedAtTimestamp;
  *((_WORD *)result + 42) |= 2u;
  if ((*(_WORD *)&self->_flags & 0x100) == 0) {
    return result;
  }
LABEL_15:
  *((_DWORD *)result + 17) = self->_stepID;
  *((_WORD *)result + 42) |= 0x100u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_81;
  }
  [(GEOAlightNotificationFeedback *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 42);
  if ((flags & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x1000) == 0) {
      goto LABEL_81;
    }
    if (self->_displayed)
    {
      if (!*((unsigned char *)v4 + 81)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 81))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 42) & 0x1000) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x2000) == 0) {
      goto LABEL_81;
    }
    if (self->_triggered)
    {
      if (!*((unsigned char *)v4 + 82)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 82))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 42) & 0x2000) != 0)
  {
    goto LABEL_81;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_lineMuid != *((void *)v4 + 5)) {
      goto LABEL_81;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_81;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_previousStopMuid != *((void *)v4 + 6)) {
      goto LABEL_81;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_81;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_alightStopMuid != *((void *)v4 + 1)) {
      goto LABEL_81;
    }
  }
  else if (v6)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x400) == 0 || self->_trigger != *((_DWORD *)v4 + 19)) {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 42) & 0x400) != 0)
  {
    goto LABEL_81;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_triggeredTimestamp != *((double *)v4 + 7)) {
      goto LABEL_81;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x200) == 0 || self->_triggeredLocationTraversalPercent != *((_DWORD *)v4 + 18)) {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 42) & 0x200) != 0)
  {
    goto LABEL_81;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_lastDetectedLocationTimestamp != *((double *)v4 + 4)) {
      goto LABEL_81;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_81;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_lastDetectedLocationTraversalPercent != *((_DWORD *)v4 + 16)) {
      goto LABEL_81;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_81;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_lastDetectedLocationHorizontalAccuracy != *((double *)v4 + 3)) {
      goto LABEL_81;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x800) != 0)
    {
      if (self->_arrivalDetected)
      {
        if (!*((unsigned char *)v4 + 80)) {
          goto LABEL_81;
        }
        goto LABEL_71;
      }
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_71;
      }
    }
LABEL_81:
    BOOL v7 = 0;
    goto LABEL_82;
  }
  if ((*((_WORD *)v4 + 42) & 0x800) != 0) {
    goto LABEL_81;
  }
LABEL_71:
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_arrivedAtTimestamp != *((double *)v4 + 2)) {
      goto LABEL_81;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x100) == 0 || self->_stepID != *((_DWORD *)v4 + 17)) {
      goto LABEL_81;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x100) == 0;
  }
LABEL_82:

  return v7;
}

- (unint64_t)hash
{
  [(GEOAlightNotificationFeedback *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x1000) != 0)
  {
    uint64_t v34 = 2654435761 * self->_displayed;
    if ((*(_WORD *)&self->_flags & 0x2000) != 0)
    {
LABEL_3:
      uint64_t v33 = 2654435761 * self->_triggered;
      if ((flags & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v34 = 0;
    if ((*(_WORD *)&self->_flags & 0x2000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v33 = 0;
  if ((flags & 0x10) != 0)
  {
LABEL_4:
    unint64_t v32 = 2654435761u * self->_lineMuid;
    if ((flags & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  unint64_t v32 = 0;
  if ((flags & 0x20) != 0)
  {
LABEL_5:
    unint64_t v31 = 2654435761u * self->_previousStopMuid;
    if (flags) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  unint64_t v31 = 0;
  if (flags)
  {
LABEL_6:
    unint64_t v30 = 2654435761u * self->_alightStopMuid;
    if ((*(_WORD *)&self->_flags & 0x400) != 0) {
      goto LABEL_7;
    }
LABEL_17:
    uint64_t v4 = 0;
    if ((flags & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_18:
    unint64_t v9 = 0;
    goto LABEL_21;
  }
LABEL_16:
  unint64_t v30 = 0;
  if ((*(_WORD *)&self->_flags & 0x400) == 0) {
    goto LABEL_17;
  }
LABEL_7:
  uint64_t v4 = 2654435761 * self->_trigger;
  if ((flags & 0x40) == 0) {
    goto LABEL_18;
  }
LABEL_8:
  double triggeredTimestamp = self->_triggeredTimestamp;
  double v6 = -triggeredTimestamp;
  if (triggeredTimestamp >= 0.0) {
    double v6 = self->_triggeredTimestamp;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_21:
  if ((flags & 0x200) != 0)
  {
    uint64_t v10 = 2654435761 * self->_triggeredLocationTraversalPercent;
    if ((flags & 8) != 0) {
      goto LABEL_23;
    }
LABEL_28:
    unint64_t v15 = 0;
    goto LABEL_31;
  }
  uint64_t v10 = 0;
  if ((flags & 8) == 0) {
    goto LABEL_28;
  }
LABEL_23:
  double lastDetectedLocationTimestamp = self->_lastDetectedLocationTimestamp;
  double v12 = -lastDetectedLocationTimestamp;
  if (lastDetectedLocationTimestamp >= 0.0) {
    double v12 = self->_lastDetectedLocationTimestamp;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0) {
      v15 += (unint64_t)v14;
    }
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_31:
  if ((flags & 0x80) != 0)
  {
    uint64_t v16 = 2654435761 * self->_lastDetectedLocationTraversalPercent;
    if ((flags & 4) != 0) {
      goto LABEL_33;
    }
LABEL_38:
    unint64_t v21 = 0;
    goto LABEL_41;
  }
  uint64_t v16 = 0;
  if ((flags & 4) == 0) {
    goto LABEL_38;
  }
LABEL_33:
  double lastDetectedLocationHorizontalAccuracy = self->_lastDetectedLocationHorizontalAccuracy;
  double v18 = -lastDetectedLocationHorizontalAccuracy;
  if (lastDetectedLocationHorizontalAccuracy >= 0.0) {
    double v18 = self->_lastDetectedLocationHorizontalAccuracy;
  }
  long double v19 = floor(v18 + 0.5);
  double v20 = (v18 - v19) * 1.84467441e19;
  unint64_t v21 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
  if (v20 >= 0.0)
  {
    if (v20 > 0.0) {
      v21 += (unint64_t)v20;
    }
  }
  else
  {
    v21 -= (unint64_t)fabs(v20);
  }
LABEL_41:
  if ((flags & 0x800) != 0)
  {
    uint64_t v22 = 2654435761 * self->_arrivalDetected;
    if ((flags & 2) != 0) {
      goto LABEL_43;
    }
LABEL_48:
    unint64_t v27 = 0;
    goto LABEL_51;
  }
  uint64_t v22 = 0;
  if ((flags & 2) == 0) {
    goto LABEL_48;
  }
LABEL_43:
  double arrivedAtTimestamp = self->_arrivedAtTimestamp;
  double v24 = -arrivedAtTimestamp;
  if (arrivedAtTimestamp >= 0.0) {
    double v24 = self->_arrivedAtTimestamp;
  }
  long double v25 = floor(v24 + 0.5);
  double v26 = (v24 - v25) * 1.84467441e19;
  unint64_t v27 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
  if (v26 >= 0.0)
  {
    if (v26 > 0.0) {
      v27 += (unint64_t)v26;
    }
  }
  else
  {
    v27 -= (unint64_t)fabs(v26);
  }
LABEL_51:
  if ((flags & 0x100) != 0) {
    uint64_t v28 = 2654435761 * self->_stepID;
  }
  else {
    uint64_t v28 = 0;
  }
  return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v4 ^ v9 ^ v10 ^ v15 ^ v16 ^ v21 ^ v22 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  __int16 v4 = *((_WORD *)v5 + 42);
  if ((v4 & 0x1000) != 0)
  {
    self->_displayed = *((unsigned char *)v5 + 81);
    *(_WORD *)&self->_flags |= 0x1000u;
    __int16 v4 = *((_WORD *)v5 + 42);
    if ((v4 & 0x2000) == 0)
    {
LABEL_3:
      if ((v4 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*((_WORD *)v5 + 42) & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  self->_triggered = *((unsigned char *)v5 + 82);
  *(_WORD *)&self->_flags |= 0x2000u;
  __int16 v4 = *((_WORD *)v5 + 42);
  if ((v4 & 0x10) == 0)
  {
LABEL_4:
    if ((v4 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_lineMuid = *((void *)v5 + 5);
  *(_WORD *)&self->_flags |= 0x10u;
  __int16 v4 = *((_WORD *)v5 + 42);
  if ((v4 & 0x20) == 0)
  {
LABEL_5:
    if ((v4 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_previousStopMuid = *((void *)v5 + 6);
  *(_WORD *)&self->_flags |= 0x20u;
  __int16 v4 = *((_WORD *)v5 + 42);
  if ((v4 & 1) == 0)
  {
LABEL_6:
    if ((v4 & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_alightStopMuid = *((void *)v5 + 1);
  *(_WORD *)&self->_flags |= 1u;
  __int16 v4 = *((_WORD *)v5 + 42);
  if ((v4 & 0x400) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_trigger = *((_DWORD *)v5 + 19);
  *(_WORD *)&self->_flags |= 0x400u;
  __int16 v4 = *((_WORD *)v5 + 42);
  if ((v4 & 0x40) == 0)
  {
LABEL_8:
    if ((v4 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_double triggeredTimestamp = *((double *)v5 + 7);
  *(_WORD *)&self->_flags |= 0x40u;
  __int16 v4 = *((_WORD *)v5 + 42);
  if ((v4 & 0x200) == 0)
  {
LABEL_9:
    if ((v4 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_triggeredLocationTraversalPercent = *((_DWORD *)v5 + 18);
  *(_WORD *)&self->_flags |= 0x200u;
  __int16 v4 = *((_WORD *)v5 + 42);
  if ((v4 & 8) == 0)
  {
LABEL_10:
    if ((v4 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_double lastDetectedLocationTimestamp = *((double *)v5 + 4);
  *(_WORD *)&self->_flags |= 8u;
  __int16 v4 = *((_WORD *)v5 + 42);
  if ((v4 & 0x80) == 0)
  {
LABEL_11:
    if ((v4 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_lastDetectedLocationTraversalPercent = *((_DWORD *)v5 + 16);
  *(_WORD *)&self->_flags |= 0x80u;
  __int16 v4 = *((_WORD *)v5 + 42);
  if ((v4 & 4) == 0)
  {
LABEL_12:
    if ((v4 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_double lastDetectedLocationHorizontalAccuracy = *((double *)v5 + 3);
  *(_WORD *)&self->_flags |= 4u;
  __int16 v4 = *((_WORD *)v5 + 42);
  if ((v4 & 0x800) == 0)
  {
LABEL_13:
    if ((v4 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_arrivalDetected = *((unsigned char *)v5 + 80);
  *(_WORD *)&self->_flags |= 0x800u;
  __int16 v4 = *((_WORD *)v5 + 42);
  if ((v4 & 2) == 0)
  {
LABEL_14:
    if ((v4 & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  self->_double arrivedAtTimestamp = *((double *)v5 + 2);
  *(_WORD *)&self->_flags |= 2u;
  if ((*((_WORD *)v5 + 42) & 0x100) != 0)
  {
LABEL_15:
    self->_stepID = *((_DWORD *)v5 + 17);
    *(_WORD *)&self->_flags |= 0x100u;
  }
LABEL_16:
}

@end