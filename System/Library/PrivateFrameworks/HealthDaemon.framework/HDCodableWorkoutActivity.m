@interface HDCodableWorkoutActivity
+ (Class)statisticsType;
+ (id)codableForWorkoutActivity:(id)a3;
+ (id)codableStatisticsForActivity:(id)a3;
+ (id)codablesForWorkoutActivities:(id)a3;
- (BOOL)hasConfiguration;
- (BOOL)hasDuration;
- (BOOL)hasEndDate;
- (BOOL)hasMetadata;
- (BOOL)hasStartDate;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableMetadataDictionary)metadata;
- (HDCodableWorkoutConfiguration)configuration;
- (NSMutableArray)statistics;
- (NSString)uuid;
- (double)duration;
- (double)endDate;
- (double)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statisticsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)statisticsCount;
- (void)addStatistics:(id)a3;
- (void)clearStatistics;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEndDate:(double)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasEndDate:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setStartDate:(double)a3;
- (void)setStatistics:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableWorkoutActivity

+ (id)codableForWorkoutActivity:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HDCodableWorkoutActivity);
  v6 = [v4 UUID];
  v7 = [v6 UUIDString];
  [(HDCodableWorkoutActivity *)v5 setUuid:v7];

  v8 = [v4 workoutConfiguration];
  v9 = [v8 codableRepresentationForSync];

  [(HDCodableWorkoutActivity *)v5 setConfiguration:v9];
  v10 = [v4 startDate];
  [v10 timeIntervalSinceReferenceDate];
  -[HDCodableWorkoutActivity setStartDate:](v5, "setStartDate:");

  v11 = [v4 endDate];

  if (v11)
  {
    v12 = [v4 endDate];
    [v12 timeIntervalSinceReferenceDate];
    -[HDCodableWorkoutActivity setEndDate:](v5, "setEndDate:");
  }
  [v4 duration];
  -[HDCodableWorkoutActivity setDuration:](v5, "setDuration:");
  v13 = [v4 metadata];

  if (v13)
  {
    v14 = [v4 metadata];
    v15 = objc_msgSend(v14, "hk_codableMetadata");
    [(HDCodableWorkoutActivity *)v5 setMetadata:v15];
  }
  v16 = [a1 codableStatisticsForActivity:v4];
  [(HDCodableWorkoutActivity *)v5 setStatistics:v16];

  return v5;
}

+ (id)codablesForWorkoutActivities:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(a1, "codableForWorkoutActivity:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)codableStatisticsForActivity:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v5 = [v3 allStatistics];
  id v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = objc_msgSend(v3, "allStatistics", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [v3 statisticsForType:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        if (v12)
        {
          long long v13 = objc_alloc_init(HDCodableWorkoutStatistics);
          long long v14 = [v12 quantityType];
          -[HDCodableWorkoutStatistics setQuantityType:](v13, "setQuantityType:", [v14 code]);

          long long v15 = [v12 quantityType];
          long long v16 = [v15 canonicalUnit];

          v17 = [v12 sumQuantity];

          if (v17)
          {
            uint64_t v18 = [v12 sumQuantity];
            [v18 doubleValueForUnit:v16];
            -[HDCodableWorkoutStatistics setSumQuantity:](v13, "setSumQuantity:");
          }
          v19 = [v12 minimumQuantity];

          if (v19)
          {
            v20 = [v12 minimumQuantity];
            [v20 doubleValueForUnit:v16];
            -[HDCodableWorkoutStatistics setMinQuantity:](v13, "setMinQuantity:");
          }
          v21 = [v12 maximumQuantity];

          if (v21)
          {
            v22 = [v12 maximumQuantity];
            [v22 doubleValueForUnit:v16];
            -[HDCodableWorkoutStatistics setMaxQuantity:](v13, "setMaxQuantity:");
          }
          v23 = [v12 averageQuantity];

          if (v23)
          {
            v24 = [v12 averageQuantity];
            [v24 doubleValueForUnit:v16];
            -[HDCodableWorkoutStatistics setAvgQuantity:](v13, "setAvgQuantity:");
          }
          [v6 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasConfiguration
{
  return self->_configuration != 0;
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

- (void)setEndDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearStatistics
{
}

- (void)addStatistics:(id)a3
{
  id v4 = a3;
  statistics = self->_statistics;
  id v8 = v4;
  if (!statistics)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_statistics;
    self->_statistics = v6;

    id v4 = v8;
    statistics = self->_statistics;
  }
  [(NSMutableArray *)statistics addObject:v4];
}

- (unint64_t)statisticsCount
{
  return [(NSMutableArray *)self->_statistics count];
}

- (id)statisticsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_statistics objectAtIndex:a3];
}

+ (Class)statisticsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableWorkoutActivity;
  id v4 = [(HDCodableWorkoutActivity *)&v8 description];
  v5 = [(HDCodableWorkoutActivity *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  configuration = self->_configuration;
  if (configuration)
  {
    uint64_t v7 = [(HDCodableWorkoutConfiguration *)configuration dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"configuration"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v9 = [NSNumber numberWithDouble:self->_startDate];
    [v4 setObject:v9 forKey:@"startDate"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v10 = [NSNumber numberWithDouble:self->_endDate];
    [v4 setObject:v10 forKey:@"endDate"];
  }
  metadata = self->_metadata;
  if (metadata)
  {
    v12 = [(HDCodableMetadataDictionary *)metadata dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"metadata"];
  }
  if (*(unsigned char *)&self->_has)
  {
    long long v13 = [NSNumber numberWithDouble:self->_duration];
    [v4 setObject:v13 forKey:@"duration"];
  }
  if ([(NSMutableArray *)self->_statistics count])
  {
    long long v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_statistics, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v15 = self->_statistics;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (void)v22);
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }

    [v4 setObject:v14 forKey:@"statistics"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutActivityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_configuration) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_metadata) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_statistics;
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
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v10;
  }
  if (self->_configuration)
  {
    objc_msgSend(v10, "setConfiguration:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = *(void *)&self->_startDate;
    *((unsigned char *)v4 + 64) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_endDate;
    *((unsigned char *)v4 + 64) |= 2u;
  }
  if (self->_metadata)
  {
    objc_msgSend(v10, "setMetadata:");
    id v4 = v10;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_duration;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  if ([(HDCodableWorkoutActivity *)self statisticsCount])
  {
    [v10 clearStatistics];
    unint64_t v6 = [(HDCodableWorkoutActivity *)self statisticsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(HDCodableWorkoutActivity *)self statisticsAtIndex:i];
        [v10 addStatistics:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuid copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  id v8 = [(HDCodableWorkoutConfiguration *)self->_configuration copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_startDate;
    *(unsigned char *)(v5 + 64) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_endDate;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  id v11 = [(HDCodableMetadataDictionary *)self->_metadata copyWithZone:a3];
  long long v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_duration;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = self->_statistics;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
        [(id)v5 addStatistics:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:")) {
      goto LABEL_26;
    }
  }
  configuration = self->_configuration;
  if ((unint64_t)configuration | *((void *)v4 + 4))
  {
    if (!-[HDCodableWorkoutConfiguration isEqual:](configuration, "isEqual:")) {
      goto LABEL_26;
    }
  }
  char has = (char)self->_has;
  char v8 = *((unsigned char *)v4 + 64);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_startDate != *((double *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_endDate != *((double *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_26;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 5))
  {
    if (!-[HDCodableMetadataDictionary isEqual:](metadata, "isEqual:"))
    {
LABEL_26:
      char v11 = 0;
      goto LABEL_27;
    }
    char has = (char)self->_has;
    char v8 = *((unsigned char *)v4 + 64);
  }
  if (has)
  {
    if ((v8 & 1) == 0 || self->_duration != *((double *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (v8)
  {
    goto LABEL_26;
  }
  statistics = self->_statistics;
  if ((unint64_t)statistics | *((void *)v4 + 6)) {
    char v11 = -[NSMutableArray isEqual:](statistics, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_27:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuid hash];
  unint64_t v4 = [(HDCodableWorkoutConfiguration *)self->_configuration hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double startDate = self->_startDate;
    double v8 = -startDate;
    if (startDate >= 0.0) {
      double v8 = self->_startDate;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 2) != 0)
  {
    double endDate = self->_endDate;
    double v13 = -endDate;
    if (endDate >= 0.0) {
      double v13 = self->_endDate;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  unint64_t v16 = [(HDCodableMetadataDictionary *)self->_metadata hash];
  if (*(unsigned char *)&self->_has)
  {
    double duration = self->_duration;
    double v19 = -duration;
    if (duration >= 0.0) {
      double v19 = self->_duration;
    }
    long double v20 = floor(v19 + 0.5);
    double v21 = (v19 - v20) * 1.84467441e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0) {
        v17 += (unint64_t)v21;
      }
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    unint64_t v17 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ v17 ^ [(NSMutableArray *)self->_statistics hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 7)) {
    -[HDCodableWorkoutActivity setUuid:](self, "setUuid:");
  }
  configuration = self->_configuration;
  uint64_t v6 = *((void *)v4 + 4);
  if (configuration)
  {
    if (v6) {
      -[HDCodableWorkoutConfiguration mergeFrom:](configuration, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HDCodableWorkoutActivity setConfiguration:](self, "setConfiguration:");
  }
  char v7 = *((unsigned char *)v4 + 64);
  if ((v7 & 4) != 0)
  {
    self->_double startDate = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v7 = *((unsigned char *)v4 + 64);
  }
  if ((v7 & 2) != 0)
  {
    self->_double endDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  metadata = self->_metadata;
  uint64_t v9 = *((void *)v4 + 5);
  if (metadata)
  {
    if (v9) {
      -[HDCodableMetadataDictionary mergeFrom:](metadata, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[HDCodableWorkoutActivity setMetadata:](self, "setMetadata:");
  }
  if (*((unsigned char *)v4 + 64))
  {
    self->_double duration = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 6);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[HDCodableWorkoutActivity addStatistics:](self, "addStatistics:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (HDCodableWorkoutConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (HDCodableMetadataDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (NSMutableArray)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end