@interface HDCodableRacingCluster
+ (Class)eligibleClusterUUIDsType;
- (BOOL)final;
- (BOOL)hasActivityType;
- (BOOL)hasBestWorkoutMetrics;
- (BOOL)hasClusterSize;
- (BOOL)hasFinal;
- (BOOL)hasLastWorkoutMetrics;
- (BOOL)hasRelevance;
- (BOOL)hasRouteLabel;
- (BOOL)hasRouteSnapshot;
- (BOOL)hasSyncIdentity;
- (BOOL)hasUuid;
- (BOOL)hasWorkoutClusterUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableRacingMetrics)bestWorkoutMetrics;
- (HDCodableRacingMetrics)lastWorkoutMetrics;
- (HDCodableSyncIdentity)syncIdentity;
- (NSData)routeSnapshot;
- (NSData)uuid;
- (NSData)workoutClusterUUID;
- (NSMutableArray)eligibleClusterUUIDs;
- (NSString)routeLabel;
- (double)relevance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eligibleClusterUUIDsAtIndex:(unint64_t)a3;
- (int)activityType;
- (int)clusterSize;
- (unint64_t)eligibleClusterUUIDsCount;
- (unint64_t)hash;
- (void)addEligibleClusterUUIDs:(id)a3;
- (void)clearEligibleClusterUUIDs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityType:(int)a3;
- (void)setBestWorkoutMetrics:(id)a3;
- (void)setClusterSize:(int)a3;
- (void)setEligibleClusterUUIDs:(id)a3;
- (void)setFinal:(BOOL)a3;
- (void)setHasActivityType:(BOOL)a3;
- (void)setHasClusterSize:(BOOL)a3;
- (void)setHasFinal:(BOOL)a3;
- (void)setHasRelevance:(BOOL)a3;
- (void)setLastWorkoutMetrics:(id)a3;
- (void)setRelevance:(double)a3;
- (void)setRouteLabel:(id)a3;
- (void)setRouteSnapshot:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWorkoutClusterUUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableRacingCluster

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasWorkoutClusterUUID
{
  return self->_workoutClusterUUID != 0;
}

- (void)setRelevance:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_relevance = a3;
}

- (void)setHasRelevance:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRelevance
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setClusterSize:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_clusterSize = a3;
}

- (void)setHasClusterSize:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasClusterSize
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setActivityType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_activityType = a3;
}

- (void)setHasActivityType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasActivityType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasRouteSnapshot
{
  return self->_routeSnapshot != 0;
}

- (BOOL)hasRouteLabel
{
  return self->_routeLabel != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (BOOL)hasLastWorkoutMetrics
{
  return self->_lastWorkoutMetrics != 0;
}

- (BOOL)hasBestWorkoutMetrics
{
  return self->_bestWorkoutMetrics != 0;
}

- (void)setFinal:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_final = a3;
}

- (void)setHasFinal:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFinal
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)clearEligibleClusterUUIDs
{
}

- (void)addEligibleClusterUUIDs:(id)a3
{
  id v4 = a3;
  eligibleClusterUUIDs = self->_eligibleClusterUUIDs;
  id v8 = v4;
  if (!eligibleClusterUUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_eligibleClusterUUIDs;
    self->_eligibleClusterUUIDs = v6;

    id v4 = v8;
    eligibleClusterUUIDs = self->_eligibleClusterUUIDs;
  }
  [(NSMutableArray *)eligibleClusterUUIDs addObject:v4];
}

- (unint64_t)eligibleClusterUUIDsCount
{
  return [(NSMutableArray *)self->_eligibleClusterUUIDs count];
}

- (id)eligibleClusterUUIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_eligibleClusterUUIDs objectAtIndex:a3];
}

+ (Class)eligibleClusterUUIDsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableRacingCluster;
  id v4 = [(HDCodableRacingCluster *)&v8 description];
  v5 = [(HDCodableRacingCluster *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  workoutClusterUUID = self->_workoutClusterUUID;
  if (workoutClusterUUID) {
    [v4 setObject:workoutClusterUUID forKey:@"workoutClusterUUID"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v20 = [NSNumber numberWithDouble:self->_relevance];
    [v4 setObject:v20 forKey:@"relevance"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  v21 = [NSNumber numberWithInt:self->_clusterSize];
  [v4 setObject:v21 forKey:@"clusterSize"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    objc_super v8 = [NSNumber numberWithInt:self->_activityType];
    [v4 setObject:v8 forKey:@"activityType"];
  }
LABEL_9:
  routeSnapshot = self->_routeSnapshot;
  if (routeSnapshot) {
    [v4 setObject:routeSnapshot forKey:@"routeSnapshot"];
  }
  routeLabel = self->_routeLabel;
  if (routeLabel) {
    [v4 setObject:routeLabel forKey:@"routeLabel"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v12 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"syncIdentity"];
  }
  lastWorkoutMetrics = self->_lastWorkoutMetrics;
  if (lastWorkoutMetrics)
  {
    v14 = [(HDCodableRacingMetrics *)lastWorkoutMetrics dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"lastWorkoutMetrics"];
  }
  bestWorkoutMetrics = self->_bestWorkoutMetrics;
  if (bestWorkoutMetrics)
  {
    v16 = [(HDCodableRacingMetrics *)bestWorkoutMetrics dictionaryRepresentation];
    [v4 setObject:v16 forKey:@"bestWorkoutMetrics"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v17 = [NSNumber numberWithBool:self->_final];
    [v4 setObject:v17 forKey:@"final"];
  }
  eligibleClusterUUIDs = self->_eligibleClusterUUIDs;
  if (eligibleClusterUUIDs) {
    [v4 setObject:eligibleClusterUUIDs forKey:@"eligibleClusterUUIDs"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableRacingClusterReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uuid) {
    PBDataWriterWriteDataField();
  }
  if (self->_workoutClusterUUID) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_8:
  }
    PBDataWriterWriteInt32Field();
LABEL_9:
  if (self->_routeSnapshot) {
    PBDataWriterWriteDataField();
  }
  if (self->_routeLabel) {
    PBDataWriterWriteStringField();
  }
  if (self->_syncIdentity) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_lastWorkoutMetrics) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_bestWorkoutMetrics) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_eligibleClusterUUIDs;
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
        PBDataWriterWriteDataField();
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
  if (self->_workoutClusterUUID)
  {
    objc_msgSend(v10, "setWorkoutClusterUUID:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_relevance;
    *((unsigned char *)v4 + 100) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 8) = self->_clusterSize;
  *((unsigned char *)v4 + 100) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 4) = self->_activityType;
    *((unsigned char *)v4 + 100) |= 2u;
  }
LABEL_9:
  if (self->_routeSnapshot)
  {
    objc_msgSend(v10, "setRouteSnapshot:");
    id v4 = v10;
  }
  if (self->_routeLabel)
  {
    objc_msgSend(v10, "setRouteLabel:");
    id v4 = v10;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v10, "setSyncIdentity:");
    id v4 = v10;
  }
  if (self->_lastWorkoutMetrics)
  {
    objc_msgSend(v10, "setLastWorkoutMetrics:");
    id v4 = v10;
  }
  if (self->_bestWorkoutMetrics)
  {
    objc_msgSend(v10, "setBestWorkoutMetrics:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v4 + 96) = self->_final;
    *((unsigned char *)v4 + 100) |= 8u;
  }
  if ([(HDCodableRacingCluster *)self eligibleClusterUUIDsCount])
  {
    [v10 clearEligibleClusterUUIDs];
    unint64_t v6 = [(HDCodableRacingCluster *)self eligibleClusterUUIDsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(HDCodableRacingCluster *)self eligibleClusterUUIDsAtIndex:i];
        [v10 addEligibleClusterUUIDs:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_uuid copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v6;

  uint64_t v8 = [(NSData *)self->_workoutClusterUUID copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v8;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_relevance;
    *(unsigned char *)(v5 + 100) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 32) = self->_clusterSize;
  *(unsigned char *)(v5 + 100) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_activityType;
    *(unsigned char *)(v5 + 100) |= 2u;
  }
LABEL_5:
  uint64_t v11 = [(NSData *)self->_routeSnapshot copyWithZone:a3];
  long long v12 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v11;

  uint64_t v13 = [(NSString *)self->_routeLabel copyWithZone:a3];
  long long v14 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v13;

  id v15 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v15;

  id v17 = [(HDCodableRacingMetrics *)self->_lastWorkoutMetrics copyWithZone:a3];
  v18 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v17;

  id v19 = [(HDCodableRacingMetrics *)self->_bestWorkoutMetrics copyWithZone:a3];
  v20 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v19;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v5 + 96) = self->_final;
    *(unsigned char *)(v5 + 100) |= 8u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v21 = self->_eligibleClusterUUIDs;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "copyWithZone:", a3, (void)v28);
        [(id)v5 addEligibleClusterUUIDs:v26];
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v23);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:")) {
      goto LABEL_35;
    }
  }
  workoutClusterUUID = self->_workoutClusterUUID;
  if ((unint64_t)workoutClusterUUID | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](workoutClusterUUID, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 100) & 1) == 0 || self->_relevance != *((double *)v4 + 1)) {
      goto LABEL_35;
    }
  }
  else if (*((unsigned char *)v4 + 100))
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 4) == 0 || self->_clusterSize != *((_DWORD *)v4 + 8)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 4) != 0)
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 2) == 0 || self->_activityType != *((_DWORD *)v4 + 4)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 2) != 0)
  {
    goto LABEL_35;
  }
  routeSnapshot = self->_routeSnapshot;
  if ((unint64_t)routeSnapshot | *((void *)v4 + 8)
    && !-[NSData isEqual:](routeSnapshot, "isEqual:"))
  {
    goto LABEL_35;
  }
  routeLabel = self->_routeLabel;
  if ((unint64_t)routeLabel | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](routeLabel, "isEqual:")) {
      goto LABEL_35;
    }
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 9))
  {
    if (!-[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:")) {
      goto LABEL_35;
    }
  }
  lastWorkoutMetrics = self->_lastWorkoutMetrics;
  if ((unint64_t)lastWorkoutMetrics | *((void *)v4 + 6))
  {
    if (!-[HDCodableRacingMetrics isEqual:](lastWorkoutMetrics, "isEqual:")) {
      goto LABEL_35;
    }
  }
  bestWorkoutMetrics = self->_bestWorkoutMetrics;
  if ((unint64_t)bestWorkoutMetrics | *((void *)v4 + 3))
  {
    if (!-[HDCodableRacingMetrics isEqual:](bestWorkoutMetrics, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    if ((*((unsigned char *)v4 + 100) & 8) == 0) {
      goto LABEL_41;
    }
LABEL_35:
    char v12 = 0;
    goto LABEL_36;
  }
  if ((*((unsigned char *)v4 + 100) & 8) == 0) {
    goto LABEL_35;
  }
  if (!self->_final)
  {
    if (!*((unsigned char *)v4 + 96)) {
      goto LABEL_41;
    }
    goto LABEL_35;
  }
  if (!*((unsigned char *)v4 + 96)) {
    goto LABEL_35;
  }
LABEL_41:
  eligibleClusterUUIDs = self->_eligibleClusterUUIDs;
  if ((unint64_t)eligibleClusterUUIDs | *((void *)v4 + 5)) {
    char v12 = -[NSMutableArray isEqual:](eligibleClusterUUIDs, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_36:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v20 = [(NSData *)self->_uuid hash];
  uint64_t v18 = [(NSData *)self->_workoutClusterUUID hash];
  char has = (char)self->_has;
  if (has)
  {
    double relevance = self->_relevance;
    double v6 = -relevance;
    if (relevance >= 0.0) {
      double v6 = self->_relevance;
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
  if ((has & 4) != 0)
  {
    uint64_t v9 = 2654435761 * self->_clusterSize;
    if ((has & 2) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((has & 2) != 0)
    {
LABEL_11:
      uint64_t v10 = 2654435761 * self->_activityType;
      goto LABEL_14;
    }
  }
  uint64_t v10 = 0;
LABEL_14:
  uint64_t v11 = [(NSData *)self->_routeSnapshot hash];
  NSUInteger v12 = [(NSString *)self->_routeLabel hash];
  unint64_t v13 = [(HDCodableSyncIdentity *)self->_syncIdentity hash];
  unint64_t v14 = [(HDCodableRacingMetrics *)self->_lastWorkoutMetrics hash];
  unint64_t v15 = [(HDCodableRacingMetrics *)self->_bestWorkoutMetrics hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v16 = 2654435761 * self->_final;
  }
  else {
    uint64_t v16 = 0;
  }
  return v19 ^ v20 ^ v4 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ [(NSMutableArray *)self->_eligibleClusterUUIDs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 10)) {
    -[HDCodableRacingCluster setUuid:](self, "setUuid:");
  }
  if (*((void *)v4 + 11)) {
    [(HDCodableRacingCluster *)self setWorkoutClusterUUID:"setWorkoutClusterUUID:"];
  }
  char v5 = *((unsigned char *)v4 + 100);
  if (v5)
  {
    self->_double relevance = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 100);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_clusterSize = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 100) & 2) != 0)
  {
LABEL_8:
    self->_activityType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_9:
  if (*((void *)v4 + 8)) {
    [(HDCodableRacingCluster *)self setRouteSnapshot:"setRouteSnapshot:"];
  }
  if (*((void *)v4 + 7)) {
    [(HDCodableRacingCluster *)self setRouteLabel:"setRouteLabel:"];
  }
  syncIdentity = self->_syncIdentity;
  uint64_t v7 = *((void *)v4 + 9);
  if (syncIdentity)
  {
    if (v7) {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[HDCodableRacingCluster setSyncIdentity:](self, "setSyncIdentity:");
  }
  lastWorkoutMetrics = self->_lastWorkoutMetrics;
  uint64_t v9 = *((void *)v4 + 6);
  if (lastWorkoutMetrics)
  {
    if (v9) {
      -[HDCodableRacingMetrics mergeFrom:](lastWorkoutMetrics, "mergeFrom:");
    }
  }
  else if (v9)
  {
    [(HDCodableRacingCluster *)self setLastWorkoutMetrics:"setLastWorkoutMetrics:"];
  }
  bestWorkoutMetrics = self->_bestWorkoutMetrics;
  uint64_t v11 = *((void *)v4 + 3);
  if (bestWorkoutMetrics)
  {
    if (v11) {
      -[HDCodableRacingMetrics mergeFrom:](bestWorkoutMetrics, "mergeFrom:");
    }
  }
  else if (v11)
  {
    [(HDCodableRacingCluster *)self setBestWorkoutMetrics:"setBestWorkoutMetrics:"];
  }
  if ((*((unsigned char *)v4 + 100) & 8) != 0)
  {
    self->_final = *((unsigned char *)v4 + 96);
    *(unsigned char *)&self->_has |= 8u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 5);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[HDCodableRacingCluster addEligibleClusterUUIDs:](self, "addEligibleClusterUUIDs:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSData)workoutClusterUUID
{
  return self->_workoutClusterUUID;
}

- (void)setWorkoutClusterUUID:(id)a3
{
}

- (double)relevance
{
  return self->_relevance;
}

- (int)clusterSize
{
  return self->_clusterSize;
}

- (int)activityType
{
  return self->_activityType;
}

- (NSData)routeSnapshot
{
  return self->_routeSnapshot;
}

- (void)setRouteSnapshot:(id)a3
{
}

- (NSString)routeLabel
{
  return self->_routeLabel;
}

- (void)setRouteLabel:(id)a3
{
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (HDCodableRacingMetrics)lastWorkoutMetrics
{
  return self->_lastWorkoutMetrics;
}

- (void)setLastWorkoutMetrics:(id)a3
{
}

- (HDCodableRacingMetrics)bestWorkoutMetrics
{
  return self->_bestWorkoutMetrics;
}

- (void)setBestWorkoutMetrics:(id)a3
{
}

- (BOOL)final
{
  return self->_final;
}

- (NSMutableArray)eligibleClusterUUIDs
{
  return self->_eligibleClusterUUIDs;
}

- (void)setEligibleClusterUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutClusterUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_routeSnapshot, 0);
  objc_storeStrong((id *)&self->_routeLabel, 0);
  objc_storeStrong((id *)&self->_lastWorkoutMetrics, 0);
  objc_storeStrong((id *)&self->_eligibleClusterUUIDs, 0);

  objc_storeStrong((id *)&self->_bestWorkoutMetrics, 0);
}

@end