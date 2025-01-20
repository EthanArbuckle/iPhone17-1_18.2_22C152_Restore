@interface ASCodableBulletin
- (BOOL)hasAchievementData;
- (BOOL)hasCompetitionStage;
- (BOOL)hasFriendListData;
- (BOOL)hasFriendUUID;
- (BOOL)hasSnapshotData;
- (BOOL)hasTimestamp;
- (BOOL)hasTitle;
- (BOOL)hasType;
- (BOOL)hasWorkoutData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)achievementData;
- (NSData)friendListData;
- (NSData)snapshotData;
- (NSData)workoutData;
- (NSString)friendUUID;
- (NSString)title;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)competitionStage;
- (int64_t)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAchievementData:(id)a3;
- (void)setCompetitionStage:(int64_t)a3;
- (void)setFriendListData:(id)a3;
- (void)setFriendUUID:(id)a3;
- (void)setHasCompetitionStage:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setSnapshotData:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setWorkoutData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableBulletin

- (void)setType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasFriendUUID
{
  return self->_friendUUID != 0;
}

- (BOOL)hasFriendListData
{
  return self->_friendListData != 0;
}

- (BOOL)hasAchievementData
{
  return self->_achievementData != 0;
}

- (BOOL)hasWorkoutData
{
  return self->_workoutData != 0;
}

- (BOOL)hasSnapshotData
{
  return self->_snapshotData != 0;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCompetitionStage:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_competitionStage = a3;
}

- (void)setHasCompetitionStage:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompetitionStage
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableBulletin;
  v4 = [(ASCodableBulletin *)&v8 description];
  v5 = [(ASCodableBulletin *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4 = [NSNumber numberWithLongLong:self->_type];
    [v3 setObject:v4 forKey:@"type"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  friendUUID = self->_friendUUID;
  if (friendUUID) {
    [v3 setObject:friendUUID forKey:@"friendUUID"];
  }
  friendListData = self->_friendListData;
  if (friendListData) {
    [v3 setObject:friendListData forKey:@"friendListData"];
  }
  achievementData = self->_achievementData;
  if (achievementData) {
    [v3 setObject:achievementData forKey:@"achievementData"];
  }
  workoutData = self->_workoutData;
  if (workoutData) {
    [v3 setObject:workoutData forKey:@"workoutData"];
  }
  snapshotData = self->_snapshotData;
  if (snapshotData) {
    [v3 setObject:snapshotData forKey:@"snapshotData"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v12 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v12 forKey:@"timestamp"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v13 = [NSNumber numberWithLongLong:self->_competitionStage];
    [v3 setObject:v13 forKey:@"competitionStage"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableBulletinReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_friendUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_friendListData) {
    PBDataWriterWriteDataField();
  }
  if (self->_achievementData) {
    PBDataWriterWriteDataField();
  }
  if (self->_workoutData) {
    PBDataWriterWriteDataField();
  }
  if (self->_snapshotData) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v5[3] = self->_type;
    *((unsigned char *)v5 + 80) |= 4u;
  }
  if (self->_title) {
    objc_msgSend(v5, "setTitle:");
  }
  if (self->_friendUUID) {
    objc_msgSend(v5, "setFriendUUID:");
  }
  if (self->_friendListData) {
    objc_msgSend(v5, "setFriendListData:");
  }
  if (self->_achievementData) {
    objc_msgSend(v5, "setAchievementData:");
  }
  if (self->_workoutData) {
    objc_msgSend(v5, "setWorkoutData:");
  }
  if (self->_snapshotData) {
    objc_msgSend(v5, "setSnapshotData:");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = *(void *)&self->_timestamp;
    *((unsigned char *)v5 + 80) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v5[1] = self->_competitionStage;
    *((unsigned char *)v5 + 80) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_type;
    *(unsigned char *)(v5 + 80) |= 4u;
  }
  uint64_t v7 = [(NSString *)self->_title copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v7;

  uint64_t v9 = [(NSString *)self->_friendUUID copyWithZone:a3];
  v10 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v9;

  uint64_t v11 = [(NSData *)self->_friendListData copyWithZone:a3];
  v12 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v11;

  uint64_t v13 = [(NSData *)self->_achievementData copyWithZone:a3];
  v14 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v13;

  uint64_t v15 = [(NSData *)self->_workoutData copyWithZone:a3];
  v16 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v15;

  uint64_t v17 = [(NSData *)self->_snapshotData copyWithZone:a3];
  v18 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v17;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v6 + 16) = self->_timestamp;
    *(unsigned char *)(v6 + 80) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v6 + 8) = self->_competitionStage;
    *(unsigned char *)(v6 + 80) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_type != *((void *)v4 + 3)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
LABEL_28:
    BOOL v11 = 0;
    goto LABEL_29;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 8) && !-[NSString isEqual:](title, "isEqual:")) {
    goto LABEL_28;
  }
  friendUUID = self->_friendUUID;
  if ((unint64_t)friendUUID | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](friendUUID, "isEqual:")) {
      goto LABEL_28;
    }
  }
  friendListData = self->_friendListData;
  if ((unint64_t)friendListData | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](friendListData, "isEqual:")) {
      goto LABEL_28;
    }
  }
  achievementData = self->_achievementData;
  if ((unint64_t)achievementData | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](achievementData, "isEqual:")) {
      goto LABEL_28;
    }
  }
  workoutData = self->_workoutData;
  if ((unint64_t)workoutData | *((void *)v4 + 9))
  {
    if (!-[NSData isEqual:](workoutData, "isEqual:")) {
      goto LABEL_28;
    }
  }
  snapshotData = self->_snapshotData;
  if ((unint64_t)snapshotData | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](snapshotData, "isEqual:")) {
      goto LABEL_28;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_timestamp != *((double *)v4 + 2)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_28;
  }
  BOOL v11 = (*((unsigned char *)v4 + 80) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_competitionStage != *((void *)v4 + 1)) {
      goto LABEL_28;
    }
    BOOL v11 = 1;
  }
LABEL_29:

  return v11;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_title hash];
  NSUInteger v5 = [(NSString *)self->_friendUUID hash];
  uint64_t v6 = [(NSData *)self->_friendListData hash];
  uint64_t v7 = [(NSData *)self->_achievementData hash];
  uint64_t v8 = [(NSData *)self->_workoutData hash];
  uint64_t v9 = [(NSData *)self->_snapshotData hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double timestamp = self->_timestamp;
    double v13 = -timestamp;
    if (timestamp >= 0.0) {
      double v13 = self->_timestamp;
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
  if (has) {
    uint64_t v16 = 2654435761 * self->_competitionStage;
  }
  else {
    uint64_t v16 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    self->_type = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  id v6 = v4;
  if (*((void *)v4 + 8))
  {
    -[ASCodableBulletin setTitle:](self, "setTitle:");
    id v4 = v6;
  }
  if (*((void *)v4 + 6))
  {
    -[ASCodableBulletin setFriendUUID:](self, "setFriendUUID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[ASCodableBulletin setFriendListData:](self, "setFriendListData:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[ASCodableBulletin setAchievementData:](self, "setAchievementData:");
    id v4 = v6;
  }
  if (*((void *)v4 + 9))
  {
    [(ASCodableBulletin *)self setWorkoutData:"setWorkoutData:"];
    id v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[ASCodableBulletin setSnapshotData:](self, "setSnapshotData:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 80);
  if ((v5 & 2) != 0)
  {
    self->_double timestamp = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 80);
  }
  if (v5)
  {
    self->_competitionStage = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)friendUUID
{
  return self->_friendUUID;
}

- (void)setFriendUUID:(id)a3
{
}

- (NSData)friendListData
{
  return self->_friendListData;
}

- (void)setFriendListData:(id)a3
{
}

- (NSData)achievementData
{
  return self->_achievementData;
}

- (void)setAchievementData:(id)a3
{
}

- (NSData)workoutData
{
  return self->_workoutData;
}

- (void)setWorkoutData:(id)a3
{
}

- (NSData)snapshotData
{
  return self->_snapshotData;
}

- (void)setSnapshotData:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)competitionStage
{
  return self->_competitionStage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutData, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_snapshotData, 0);
  objc_storeStrong((id *)&self->_friendUUID, 0);
  objc_storeStrong((id *)&self->_friendListData, 0);

  objc_storeStrong((id *)&self->_achievementData, 0);
}

@end