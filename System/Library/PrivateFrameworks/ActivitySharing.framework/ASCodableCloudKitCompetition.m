@interface ASCodableCloudKitCompetition
- (ASCodableCloudKitDateComponents)durationDateComponents;
- (ASCodableCloudKitDateComponents)startDateComponents;
- (BOOL)hasCurrentCacheIndex;
- (BOOL)hasDurationDateComponents;
- (BOOL)hasMaximumNumberOfPointsPerDay;
- (BOOL)hasStartDateComponents;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)preferredVictoryBadgeStyles;
- (int)preferredVictoryBadgeStylesAtIndex:(unint64_t)a3;
- (int64_t)currentCacheIndex;
- (int64_t)maximumNumberOfPointsPerDay;
- (int64_t)opponentScores;
- (int64_t)opponentScoresAtIndex:(unint64_t)a3;
- (int64_t)scores;
- (int64_t)scoresAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)opponentScoresCount;
- (unint64_t)preferredVictoryBadgeStylesCount;
- (unint64_t)scoresCount;
- (void)addOpponentScores:(int64_t)a3;
- (void)addPreferredVictoryBadgeStyles:(int)a3;
- (void)addScores:(int64_t)a3;
- (void)clearOpponentScores;
- (void)clearPreferredVictoryBadgeStyles;
- (void)clearScores;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCurrentCacheIndex:(int64_t)a3;
- (void)setDurationDateComponents:(id)a3;
- (void)setHasCurrentCacheIndex:(BOOL)a3;
- (void)setHasMaximumNumberOfPointsPerDay:(BOOL)a3;
- (void)setMaximumNumberOfPointsPerDay:(int64_t)a3;
- (void)setOpponentScores:(int64_t *)a3 count:(unint64_t)a4;
- (void)setPreferredVictoryBadgeStyles:(int *)a3 count:(unint64_t)a4;
- (void)setScores:(int64_t *)a3 count:(unint64_t)a4;
- (void)setStartDateComponents:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableCloudKitCompetition

- (void)dealloc
{
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)ASCodableCloudKitCompetition;
  [(ASCodableCloudKitCompetition *)&v3 dealloc];
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setCurrentCacheIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_currentCacheIndex = a3;
}

- (void)setHasCurrentCacheIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCurrentCacheIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)scoresCount
{
  return self->_scores.count;
}

- (int64_t)scores
{
  return self->_scores.list;
}

- (void)clearScores
{
}

- (void)addScores:(int64_t)a3
{
}

- (int64_t)scoresAtIndex:(unint64_t)a3
{
  p_scores = &self->_scores;
  unint64_t count = self->_scores.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_scores->list[a3];
}

- (void)setScores:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)opponentScoresCount
{
  return self->_opponentScores.count;
}

- (int64_t)opponentScores
{
  return self->_opponentScores.list;
}

- (void)clearOpponentScores
{
}

- (void)addOpponentScores:(int64_t)a3
{
}

- (int64_t)opponentScoresAtIndex:(unint64_t)a3
{
  p_opponentScores = &self->_opponentScores;
  unint64_t count = self->_opponentScores.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_opponentScores->list[a3];
}

- (void)setOpponentScores:(int64_t *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasStartDateComponents
{
  return self->_startDateComponents != 0;
}

- (BOOL)hasDurationDateComponents
{
  return self->_durationDateComponents != 0;
}

- (unint64_t)preferredVictoryBadgeStylesCount
{
  return self->_preferredVictoryBadgeStyles.count;
}

- (int)preferredVictoryBadgeStyles
{
  return self->_preferredVictoryBadgeStyles.list;
}

- (void)clearPreferredVictoryBadgeStyles
{
}

- (void)addPreferredVictoryBadgeStyles:(int)a3
{
}

- (int)preferredVictoryBadgeStylesAtIndex:(unint64_t)a3
{
  p_preferredVictoryBadgeStyles = &self->_preferredVictoryBadgeStyles;
  unint64_t count = self->_preferredVictoryBadgeStyles.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_preferredVictoryBadgeStyles->list[a3];
}

- (void)setPreferredVictoryBadgeStyles:(int *)a3 count:(unint64_t)a4
{
}

- (void)setMaximumNumberOfPointsPerDay:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_maximumNumberOfPointsPerDay = a3;
}

- (void)setHasMaximumNumberOfPointsPerDay:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaximumNumberOfPointsPerDay
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableCloudKitCompetition;
  v4 = [(ASCodableCloudKitCompetition *)&v8 description];
  v5 = [(ASCodableCloudKitCompetition *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithLongLong:self->_currentCacheIndex];
    [v4 setObject:v6 forKey:@"currentCacheIndex"];
  }
  uint64_t v7 = PBRepeatedInt64NSArray();
  [v4 setObject:v7 forKey:@"scores"];

  objc_super v8 = PBRepeatedInt64NSArray();
  [v4 setObject:v8 forKey:@"opponentScores"];

  startDateComponents = self->_startDateComponents;
  if (startDateComponents)
  {
    v10 = [(ASCodableCloudKitDateComponents *)startDateComponents dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"startDateComponents"];
  }
  durationDateComponents = self->_durationDateComponents;
  if (durationDateComponents)
  {
    v12 = [(ASCodableCloudKitDateComponents *)durationDateComponents dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"durationDateComponents"];
  }
  v13 = PBRepeatedInt32NSArray();
  [v4 setObject:v13 forKey:@"preferredVictoryBadgeStyles"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v14 = [NSNumber numberWithLongLong:self->_maximumNumberOfPointsPerDay];
    [v4 setObject:v14 forKey:@"maximumNumberOfPointsPerDay"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableCloudKitCompetitionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    id v4 = v8;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v8;
  }
  if (self->_scores.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      id v4 = v8;
      ++v5;
    }
    while (v5 < self->_scores.count);
  }
  if (self->_opponentScores.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      id v4 = v8;
      ++v6;
    }
    while (v6 < self->_opponentScores.count);
  }
  if (self->_startDateComponents)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  if (self->_durationDateComponents)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  if (self->_preferredVictoryBadgeStyles.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v8;
      ++v7;
    }
    while (v7 < self->_preferredVictoryBadgeStyles.count);
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v14;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 10) = self->_currentCacheIndex;
    *((unsigned char *)v4 + 120) |= 1u;
  }
  if ([(ASCodableCloudKitCompetition *)self scoresCount])
  {
    [v14 clearScores];
    unint64_t v5 = [(ASCodableCloudKitCompetition *)self scoresCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v14, "addScores:", -[ASCodableCloudKitCompetition scoresAtIndex:](self, "scoresAtIndex:", i));
    }
  }
  if ([(ASCodableCloudKitCompetition *)self opponentScoresCount])
  {
    [v14 clearOpponentScores];
    unint64_t v8 = [(ASCodableCloudKitCompetition *)self opponentScoresCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        objc_msgSend(v14, "addOpponentScores:", -[ASCodableCloudKitCompetition opponentScoresAtIndex:](self, "opponentScoresAtIndex:", j));
    }
  }
  if (self->_startDateComponents) {
    objc_msgSend(v14, "setStartDateComponents:");
  }
  if (self->_durationDateComponents) {
    objc_msgSend(v14, "setDurationDateComponents:");
  }
  if ([(ASCodableCloudKitCompetition *)self preferredVictoryBadgeStylesCount])
  {
    [v14 clearPreferredVictoryBadgeStyles];
    unint64_t v11 = [(ASCodableCloudKitCompetition *)self preferredVictoryBadgeStylesCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        objc_msgSend(v14, "addPreferredVictoryBadgeStyles:", -[ASCodableCloudKitCompetition preferredVictoryBadgeStylesAtIndex:](self, "preferredVictoryBadgeStylesAtIndex:", k));
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v14 + 11) = self->_maximumNumberOfPointsPerDay;
    *((unsigned char *)v14 + 120) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_uuid copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 80) = self->_currentCacheIndex;
    *(unsigned char *)(v5 + 120) |= 1u;
  }
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  id v8 = [(ASCodableCloudKitDateComponents *)self->_startDateComponents copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v8;

  id v10 = [(ASCodableCloudKitDateComponents *)self->_durationDateComponents copyWithZone:a3];
  unint64_t v11 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v10;

  PBRepeatedInt32Copy();
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 88) = self->_maximumNumberOfPointsPerDay;
    *(unsigned char *)(v5 + 120) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 14))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 120) & 1) == 0 || self->_currentCacheIndex != *((void *)v4 + 10)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 120))
  {
LABEL_20:
    BOOL v8 = 0;
    goto LABEL_21;
  }
  if (!PBRepeatedInt64IsEqual()) {
    goto LABEL_20;
  }
  if (!PBRepeatedInt64IsEqual()) {
    goto LABEL_20;
  }
  startDateComponents = self->_startDateComponents;
  if ((unint64_t)startDateComponents | *((void *)v4 + 13))
  {
    if (!-[ASCodableCloudKitDateComponents isEqual:](startDateComponents, "isEqual:")) {
      goto LABEL_20;
    }
  }
  durationDateComponents = self->_durationDateComponents;
  if ((unint64_t)durationDateComponents | *((void *)v4 + 12))
  {
    if (!-[ASCodableCloudKitDateComponents isEqual:](durationDateComponents, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_20;
  }
  BOOL v8 = (*((unsigned char *)v4 + 120) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 120) & 2) == 0 || self->_maximumNumberOfPointsPerDay != *((void *)v4 + 11)) {
      goto LABEL_20;
    }
    BOOL v8 = 1;
  }
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_uuid hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_currentCacheIndex;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = PBRepeatedInt64Hash();
  uint64_t v6 = PBRepeatedInt64Hash();
  unint64_t v7 = [(ASCodableCloudKitDateComponents *)self->_startDateComponents hash];
  unint64_t v8 = [(ASCodableCloudKitDateComponents *)self->_durationDateComponents hash];
  uint64_t v9 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_maximumNumberOfPointsPerDay;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int64_t *)a3;
  v19 = v4;
  if (v4[14])
  {
    -[ASCodableCloudKitCompetition setUuid:](self, "setUuid:");
    uint64_t v4 = v19;
  }
  if (v4[15])
  {
    self->_currentCacheIndex = v4[10];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = [v4 scoresCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[ASCodableCloudKitCompetition addScores:](self, "addScores:", [v19 scoresAtIndex:i]);
  }
  uint64_t v8 = [v19 opponentScoresCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[ASCodableCloudKitCompetition addOpponentScores:](self, "addOpponentScores:", [v19 opponentScoresAtIndex:j]);
  }
  startDateComponents = self->_startDateComponents;
  unint64_t v12 = v19;
  int64_t v13 = v19[13];
  if (startDateComponents)
  {
    if (!v13) {
      goto LABEL_17;
    }
    -[ASCodableCloudKitDateComponents mergeFrom:](startDateComponents, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_17;
    }
    -[ASCodableCloudKitCompetition setStartDateComponents:](self, "setStartDateComponents:");
  }
  unint64_t v12 = v19;
LABEL_17:
  durationDateComponents = self->_durationDateComponents;
  int64_t v15 = v12[12];
  if (durationDateComponents)
  {
    if (!v15) {
      goto LABEL_23;
    }
    -[ASCodableCloudKitDateComponents mergeFrom:](durationDateComponents, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_23;
    }
    -[ASCodableCloudKitCompetition setDurationDateComponents:](self, "setDurationDateComponents:");
  }
  unint64_t v12 = v19;
LABEL_23:
  uint64_t v16 = [v12 preferredVictoryBadgeStylesCount];
  if (v16)
  {
    uint64_t v17 = v16;
    for (uint64_t k = 0; k != v17; ++k)
      -[ASCodableCloudKitCompetition addPreferredVictoryBadgeStyles:](self, "addPreferredVictoryBadgeStyles:", [v19 preferredVictoryBadgeStylesAtIndex:k]);
  }
  if ((v19[15] & 2) != 0)
  {
    self->_maximumNumberOfPointsPerDay = v19[11];
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (int64_t)currentCacheIndex
{
  return self->_currentCacheIndex;
}

- (ASCodableCloudKitDateComponents)startDateComponents
{
  return self->_startDateComponents;
}

- (void)setStartDateComponents:(id)a3
{
}

- (ASCodableCloudKitDateComponents)durationDateComponents
{
  return self->_durationDateComponents;
}

- (void)setDurationDateComponents:(id)a3
{
}

- (int64_t)maximumNumberOfPointsPerDay
{
  return self->_maximumNumberOfPointsPerDay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_startDateComponents, 0);

  objc_storeStrong((id *)&self->_durationDateComponents, 0);
}

@end