@interface HDCodableRacingMetrics
+ (Class)routePointsType;
- (BOOL)hasDistance;
- (BOOL)hasDuration;
- (BOOL)hasStartDate;
- (BOOL)hasWorkoutUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)workoutUUID;
- (NSMutableArray)routePoints;
- (double)distance;
- (double)duration;
- (double)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)routePointsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)routePointsCount;
- (void)addRoutePoints:(id)a3;
- (void)clearRoutePoints;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDistance:(double)a3;
- (void)setDuration:(double)a3;
- (void)setHasDistance:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setRoutePoints:(id)a3;
- (void)setStartDate:(double)a3;
- (void)setWorkoutUUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableRacingMetrics

- (BOOL)hasWorkoutUUID
{
  return self->_workoutUUID != 0;
}

- (void)setStartDate:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
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
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDistance:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDistance
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearRoutePoints
{
}

- (void)addRoutePoints:(id)a3
{
  id v4 = a3;
  routePoints = self->_routePoints;
  id v8 = v4;
  if (!routePoints)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_routePoints;
    self->_routePoints = v6;

    id v4 = v8;
    routePoints = self->_routePoints;
  }
  [(NSMutableArray *)routePoints addObject:v4];
}

- (unint64_t)routePointsCount
{
  return [(NSMutableArray *)self->_routePoints count];
}

- (id)routePointsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_routePoints objectAtIndex:a3];
}

+ (Class)routePointsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableRacingMetrics;
  id v4 = [(HDCodableRacingMetrics *)&v8 description];
  v5 = [(HDCodableRacingMetrics *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  workoutUUID = self->_workoutUUID;
  if (workoutUUID) {
    [v3 setObject:workoutUUID forKey:@"workoutUUID"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v16 = [NSNumber numberWithDouble:self->_startDate];
    [v4 setObject:v16 forKey:@"startDate"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v17 = [NSNumber numberWithDouble:self->_duration];
  [v4 setObject:v17 forKey:@"duration"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    v7 = [NSNumber numberWithDouble:self->_distance];
    [v4 setObject:v7 forKey:@"distance"];
  }
LABEL_7:
  if ([(NSMutableArray *)self->_routePoints count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_routePoints, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v9 = self->_routePoints;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"routePoints"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableRacingMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_workoutUUID) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  if (*(unsigned char *)&self->_has) {
LABEL_6:
  }
    PBDataWriterWriteDoubleField();
LABEL_7:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_routePoints;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_workoutUUID)
  {
    objc_msgSend(v4, "setWorkoutUUID:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
LABEL_15:
    *((void *)v4 + 2) = *(void *)&self->_duration;
    *((unsigned char *)v4 + 48) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  *((void *)v4 + 3) = *(void *)&self->_startDate;
  *((unsigned char *)v4 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_15;
  }
LABEL_5:
  if (has)
  {
LABEL_6:
    *((void *)v4 + 1) = *(void *)&self->_distance;
    *((unsigned char *)v4 + 48) |= 1u;
  }
LABEL_7:
  if ([(HDCodableRacingMetrics *)self routePointsCount])
  {
    [v10 clearRoutePoints];
    unint64_t v6 = [(HDCodableRacingMetrics *)self routePointsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(HDCodableRacingMetrics *)self routePointsAtIndex:i];
        [v10 addRoutePoints:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_workoutUUID copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_startDate;
    *(unsigned char *)(v5 + 48) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_duration;
  *(unsigned char *)(v5 + 48) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_distance;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
LABEL_5:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = self->_routePoints;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [(id)v5 addRoutePoints:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  workoutUUID = self->_workoutUUID;
  if ((unint64_t)workoutUUID | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](workoutUUID, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_startDate != *((double *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
LABEL_21:
    char v7 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_duration != *((double *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_distance != *((double *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_21;
  }
  routePoints = self->_routePoints;
  if ((unint64_t)routePoints | *((void *)v4 + 4)) {
    char v7 = -[NSMutableArray isEqual:](routePoints, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_workoutUUID hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double startDate = self->_startDate;
    double v7 = -startDate;
    if (startDate >= 0.0) {
      double v7 = self->_startDate;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) != 0)
  {
    double duration = self->_duration;
    double v12 = -duration;
    if (duration >= 0.0) {
      double v12 = self->_duration;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if (has)
  {
    double distance = self->_distance;
    double v17 = -distance;
    if (distance >= 0.0) {
      double v17 = self->_distance;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15 ^ [(NSMutableArray *)self->_routePoints hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    [(HDCodableRacingMetrics *)self setWorkoutUUID:"setWorkoutUUID:"];
  }
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 4) != 0)
  {
    self->_double startDate = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_double duration = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 48))
  {
LABEL_6:
    self->_double distance = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_7:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[HDCodableRacingMetrics addRoutePoints:](self, "addRoutePoints:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSData)workoutUUID
{
  return self->_workoutUUID;
}

- (void)setWorkoutUUID:(id)a3
{
}

- (double)startDate
{
  return self->_startDate;
}

- (double)duration
{
  return self->_duration;
}

- (double)distance
{
  return self->_distance;
}

- (NSMutableArray)routePoints
{
  return self->_routePoints;
}

- (void)setRoutePoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutUUID, 0);

  objc_storeStrong((id *)&self->_routePoints, 0);
}

@end