@interface ASCompetition
+ (id)codableDatabaseCompetitionsFromCompetitions:(id)a3 withFriendWithUUID:(id)a4 withType:(int64_t)a5;
+ (id)competitionWithCodableCompetition:(id)a3;
- (ASCompetition)init;
- (BOOL)hasCalculatedFinalScore;
- (BOOL)hasPushedFinalScore;
- (BOOL)isDailyScoreCapped;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCompetition:(id)a3;
- (BOOL)isFirstDayOfCompetition;
- (BOOL)isLastDayOfCompetition;
- (BOOL)isParticipantWinning:(int64_t)a3;
- (BOOL)isScoreTied;
- (NSArray)opponentScores;
- (NSArray)preferredVictoryBadgeStyles;
- (NSArray)scores;
- (NSDate)currentDateOverride;
- (NSDate)endDate;
- (NSDate)lastDayOfCompetition;
- (NSDate)startDate;
- (NSDateComponents)durationDateComponents;
- (NSDateComponents)startDateComponents;
- (NSUUID)UUID;
- (id)_scoresForParticipant:(int64_t)a3;
- (id)codableCompetition;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentDate;
- (id)daysWonByParticipant:(int64_t)a3;
- (id)description;
- (int64_t)currentCacheIndex;
- (int64_t)endDateCacheIndex;
- (int64_t)lastPushedCacheIndex;
- (int64_t)stage;
- (unint64_t)dailyScoreForParticipant:(int64_t)a3 onDate:(id)a4;
- (unint64_t)maximumNumberOfPointsPerDay;
- (unint64_t)myDailyAverageScore;
- (unint64_t)myTotalScore;
- (unint64_t)numberOfDaysRemaining;
- (unint64_t)opponentDailyAverageScore;
- (unint64_t)opponentTotalScore;
- (unsigned)victoryBadgeStyle;
- (void)setCurrentCacheIndex:(int64_t)a3;
- (void)setCurrentDateOverride:(id)a3;
- (void)setDurationDateComponents:(id)a3;
- (void)setLastPushedCacheIndex:(int64_t)a3;
- (void)setMaximumNumberOfPointsPerDay:(unint64_t)a3;
- (void)setOpponentScores:(id)a3;
- (void)setPreferredVictoryBadgeStyles:(id)a3;
- (void)setScores:(id)a3;
- (void)setStartDateComponents:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation ASCompetition

- (id)codableCompetition
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(ASCodableCloudKitCompetition);
  v4 = [(ASCompetition *)self UUID];
  v5 = objc_msgSend(v4, "hk_dataForUUIDBytes");
  [(ASCodableCloudKitCompetition *)v3 setUuid:v5];

  [(ASCodableCloudKitCompetition *)v3 setCurrentCacheIndex:[(ASCompetition *)self currentCacheIndex]];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v6 = [(ASCompetition *)self scores];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        -[ASCodableCloudKitCompetition addScores:](v3, "addScores:", [*(id *)(*((void *)&v34 + 1) + 8 * i) integerValue]);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v8);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v11 = [(ASCompetition *)self opponentScores];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        -[ASCodableCloudKitCompetition addOpponentScores:](v3, "addOpponentScores:", [*(id *)(*((void *)&v30 + 1) + 8 * j) integerValue]);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v13);
  }

  v16 = [(ASCompetition *)self startDateComponents];
  v17 = objc_msgSend(v16, "as_codableDateComponents");
  [(ASCodableCloudKitCompetition *)v3 setStartDateComponents:v17];

  v18 = [(ASCompetition *)self durationDateComponents];
  v19 = objc_msgSend(v18, "as_codableDateComponents");
  [(ASCodableCloudKitCompetition *)v3 setDurationDateComponents:v19];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v20 = [(ASCompetition *)self preferredVictoryBadgeStyles];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v20);
        }
        -[ASCodableCloudKitCompetition addPreferredVictoryBadgeStyles:](v3, "addPreferredVictoryBadgeStyles:", [*(id *)(*((void *)&v26 + 1) + 8 * k) unsignedIntValue]);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v22);
  }

  [(ASCodableCloudKitCompetition *)v3 setMaximumNumberOfPointsPerDay:[(ASCompetition *)self maximumNumberOfPointsPerDay]];

  return v3;
}

+ (id)competitionWithCodableCompetition:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ASCompetition);
  v5 = (void *)MEMORY[0x263F08C38];
  v6 = [v3 uuid];
  uint64_t v7 = objc_msgSend(v5, "hk_UUIDWithData:", v6);
  [(ASCompetition *)v4 setUUID:v7];

  -[ASCompetition setCurrentCacheIndex:](v4, "setCurrentCacheIndex:", [v3 currentCacheIndex]);
  -[ASCompetition setLastPushedCacheIndex:](v4, "setLastPushedCacheIndex:", [v3 currentCacheIndex]);
  if ([v3 scoresCount])
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [(ASCompetition *)v4 scores];
      v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "scoresAtIndex:", v8));
      v11 = [v9 arrayByAddingObject:v10];
      [(ASCompetition *)v4 setScores:v11];

      ++v8;
    }
    while (v8 < [v3 scoresCount]);
  }
  if ([v3 opponentScoresCount])
  {
    unint64_t v12 = 0;
    do
    {
      uint64_t v13 = [(ASCompetition *)v4 opponentScores];
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "opponentScoresAtIndex:", v12));
      v15 = [v13 arrayByAddingObject:v14];
      [(ASCompetition *)v4 setOpponentScores:v15];

      ++v12;
    }
    while (v12 < [v3 opponentScoresCount]);
  }
  v16 = (void *)MEMORY[0x263EFF918];
  v17 = [v3 startDateComponents];
  v18 = objc_msgSend(v16, "as_dateComponentsWithCodable:", v17);
  [(ASCompetition *)v4 setStartDateComponents:v18];

  v19 = (void *)MEMORY[0x263EFF918];
  v20 = [v3 durationDateComponents];
  uint64_t v21 = objc_msgSend(v19, "as_dateComponentsWithCodable:", v20);
  [(ASCompetition *)v4 setDurationDateComponents:v21];

  if ([v3 preferredVictoryBadgeStylesCount])
  {
    unint64_t v22 = 0;
    do
    {
      uint64_t v23 = [(ASCompetition *)v4 preferredVictoryBadgeStyles];
      v24 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "preferredVictoryBadgeStylesAtIndex:", v22));
      v25 = [v23 arrayByAddingObject:v24];
      [(ASCompetition *)v4 setPreferredVictoryBadgeStyles:v25];

      ++v22;
    }
    while (v22 < [v3 preferredVictoryBadgeStylesCount]);
  }
  -[ASCompetition setMaximumNumberOfPointsPerDay:](v4, "setMaximumNumberOfPointsPerDay:", [v3 maximumNumberOfPointsPerDay]);

  return v4;
}

- (ASCompetition)init
{
  v9.receiver = self;
  v9.super_class = (Class)ASCompetition;
  v2 = [(ASCompetition *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    scores = v2->_scores;
    v5 = (NSArray *)MEMORY[0x263EFFA68];
    v2->_scores = (NSArray *)MEMORY[0x263EFFA68];

    opponentScores = v3->_opponentScores;
    v3->_opponentScores = v5;

    preferredVictoryBadgeStyles = v3->_preferredVictoryBadgeStyles;
    v3->_preferredVictoryBadgeStyles = v5;
  }
  return v3;
}

- (id)description
{
  UUID = self->_UUID;
  v18 = NSString;
  NSInteger v16 = [(NSDateComponents *)self->_startDateComponents month];
  NSInteger v15 = [(NSDateComponents *)self->_startDateComponents day];
  NSInteger v3 = [(NSDateComponents *)self->_startDateComponents year];
  NSInteger v4 = [(NSDateComponents *)self->_durationDateComponents day];
  int64_t currentCacheIndex = self->_currentCacheIndex;
  int64_t lastPushedCacheIndex = self->_lastPushedCacheIndex;
  uint64_t v7 = ASFormattedSequence(self->_scores);
  unint64_t v8 = [(ASCompetition *)self myTotalScore];
  objc_super v9 = ASFormattedSequence(self->_opponentScores);
  unint64_t v10 = [(ASCompetition *)self opponentTotalScore];
  unint64_t maximumNumberOfPointsPerDay = self->_maximumNumberOfPointsPerDay;
  unint64_t v12 = ASFormattedVictoryBadgeStyles(self->_preferredVictoryBadgeStyles);
  uint64_t v13 = [v18 stringWithFormat:@"Competition uuid=%@ start=%ld/%ld/%ld duration=%ld days currentCacheIndex=%ld lastPushedCacheIndex=%ld scores=%@(=%ld) opponentScores=%@(=%ld)  maximumNumberOfPointsPerDay=%lu points preferredVictoryBadgeStyles=%@", UUID, v16, v15, v3, v4, currentCacheIndex, lastPushedCacheIndex, v7, v8, v9, v10, maximumNumberOfPointsPerDay, v12];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  NSInteger v4 = (ASCompetition *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(ASCompetition *)self isEqualToCompetition:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v5 setUUID:self->_UUID];
  [v5 setCurrentCacheIndex:self->_currentCacheIndex];
  [v5 setLastPushedCacheIndex:self->_lastPushedCacheIndex];
  v6 = (void *)[(NSArray *)self->_scores copyWithZone:a3];
  [v5 setScores:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_opponentScores copyWithZone:a3];
  [v5 setOpponentScores:v7];

  unint64_t v8 = (void *)[(NSDateComponents *)self->_startDateComponents copyWithZone:a3];
  [v5 setStartDateComponents:v8];

  objc_super v9 = (void *)[(NSDateComponents *)self->_durationDateComponents copyWithZone:a3];
  [v5 setDurationDateComponents:v9];

  unint64_t v10 = (void *)[(NSArray *)self->_preferredVictoryBadgeStyles copyWithZone:a3];
  [v5 setPreferredVictoryBadgeStyles:v10];

  [v5 setMaximumNumberOfPointsPerDay:self->_maximumNumberOfPointsPerDay];
  return v5;
}

- (BOOL)isDailyScoreCapped
{
  return self->_maximumNumberOfPointsPerDay != 0;
}

- (unsigned)victoryBadgeStyle
{
  v2 = [(NSArray *)self->_preferredVictoryBadgeStyles firstObject];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (NSDate)startDate
{
  unsigned int v3 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  NSInteger v4 = [v3 dateFromComponents:self->_startDateComponents];

  return (NSDate *)v4;
}

- (NSDate)endDate
{
  unsigned int v3 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  durationDateComponents = self->_durationDateComponents;
  BOOL v5 = [(ASCompetition *)self startDate];
  v6 = [v3 dateByAddingComponents:durationDateComponents toDate:v5 options:0];

  return (NSDate *)v6;
}

- (NSDate)lastDayOfCompetition
{
  unsigned int v3 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  NSInteger v4 = [(ASCompetition *)self endDate];
  BOOL v5 = [v3 dateByAddingUnit:16 value:-1 toDate:v4 options:0];

  return (NSDate *)v5;
}

- (BOOL)isFirstDayOfCompetition
{
  unsigned int v3 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  NSInteger v4 = [(ASCompetition *)self startDate];
  BOOL v5 = [(ASCompetition *)self currentDate];
  char v6 = [v3 isDate:v4 inSameDayAsDate:v5];

  return v6;
}

- (BOOL)isLastDayOfCompetition
{
  unsigned int v3 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  NSInteger v4 = [(ASCompetition *)self lastDayOfCompetition];
  BOOL v5 = [(ASCompetition *)self currentDate];
  char v6 = [v3 isDate:v4 inSameDayAsDate:v5];

  return v6;
}

- (int64_t)endDateCacheIndex
{
  unsigned int v3 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  uint64_t v4 = *MEMORY[0x263F0AC18];
  BOOL v5 = [(ASCompetition *)self endDate];
  char v6 = [v3 components:v4 fromDate:v5];

  int64_t v7 = _HKCacheIndexFromDateComponents();
  return v7;
}

- (unint64_t)numberOfDaysRemaining
{
  unsigned int v3 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  uint64_t v4 = [(ASCompetition *)self currentDate];
  BOOL v5 = [(ASCompetition *)self endDate];
  char v6 = [v3 components:16 fromDate:v4 toDate:v5 options:0];

  uint64_t v7 = [v6 day];
  if (v7 < 0) {
    uint64_t v8 = -1;
  }
  else {
    uint64_t v8 = v7;
  }
  unint64_t v9 = v8 + 1;

  return v9;
}

- (int64_t)stage
{
  unsigned int v3 = [(ASCompetition *)self currentDate];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  char v6 = [(ASCompetition *)self startDate];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  if (v5 < v8) {
    return 0;
  }
  unint64_t v10 = [(ASCompetition *)self endDate];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;

  if (v5 <= v12) {
    return 1;
  }
  else {
    return 2;
  }
}

- (unint64_t)myTotalScore
{
  v2 = [(ASCompetition *)self _scoresForParticipant:0];
  unint64_t v3 = ASCompetitionCalculateTotalScore(v2);

  return v3;
}

- (unint64_t)myDailyAverageScore
{
  v2 = [(ASCompetition *)self _scoresForParticipant:0];
  unint64_t v3 = ASCompetitionCalculateDailyAverageScore(v2);

  return v3;
}

- (unint64_t)opponentTotalScore
{
  v2 = [(ASCompetition *)self _scoresForParticipant:1];
  unint64_t v3 = ASCompetitionCalculateTotalScore(v2);

  return v3;
}

- (unint64_t)opponentDailyAverageScore
{
  v2 = [(ASCompetition *)self _scoresForParticipant:1];
  unint64_t v3 = ASCompetitionCalculateDailyAverageScore(v2);

  return v3;
}

- (BOOL)isScoreTied
{
  unint64_t v3 = [(ASCompetition *)self myTotalScore];
  return v3 == [(ASCompetition *)self opponentTotalScore];
}

- (unint64_t)dailyScoreForParticipant:(int64_t)a3 onDate:(id)a4
{
  ASCacheIndexForLocalDate(a4);

  return ASCompetitionDailyScoreForParticipantWithCacheIndex(self, a3);
}

- (id)daysWonByParticipant:(int64_t)a3
{
  if (a3)
  {
    double v4 = [(ASCompetition *)self opponentScores];
    [(ASCompetition *)self scores];
  }
  else
  {
    double v4 = [(ASCompetition *)self scores];
    [(ASCompetition *)self opponentScores];
  double v5 = };
  unint64_t v6 = [v4 count];
  unint64_t v7 = [v5 count];
  if (v6 >= v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v6;
  }
  if (v8 < 1)
  {
    unint64_t v10 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v10 = (void *)MEMORY[0x263EFFA68];
    do
    {
      double v11 = [v4 objectAtIndexedSubscript:v9];
      uint64_t v12 = [v11 integerValue];

      uint64_t v13 = [v5 objectAtIndexedSubscript:v9];
      uint64_t v14 = [v13 integerValue];

      if (v12 > v14)
      {
        NSInteger v15 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
        NSInteger v16 = [(ASCompetition *)self startDate];
        v17 = [v15 dateByAddingUnit:16 value:v9 toDate:v16 options:0];

        uint64_t v18 = [v10 arrayByAddingObject:v17];

        unint64_t v10 = (void *)v18;
      }
      ++v9;
    }
    while (v8 != v9);
  }
  id v19 = v10;

  return v19;
}

- (BOOL)isParticipantWinning:(int64_t)a3
{
  if (a3)
  {
    unint64_t v4 = [(ASCompetition *)self opponentTotalScore];
    unint64_t v5 = [(ASCompetition *)self myTotalScore];
  }
  else
  {
    unint64_t v4 = [(ASCompetition *)self myTotalScore];
    unint64_t v5 = [(ASCompetition *)self opponentTotalScore];
  }
  return v4 >= v5;
}

- (BOOL)hasCalculatedFinalScore
{
  int64_t currentCacheIndex = self->_currentCacheIndex;
  return currentCacheIndex >= [(ASCompetition *)self endDateCacheIndex];
}

- (BOOL)hasPushedFinalScore
{
  int64_t lastPushedCacheIndex = self->_lastPushedCacheIndex;
  return lastPushedCacheIndex >= [(ASCompetition *)self endDateCacheIndex];
}

- (BOOL)isEqualToCompetition:(id)a3
{
  id v4 = a3;
  int64_t currentCacheIndex = self->_currentCacheIndex;
  if (currentCacheIndex == [v4 currentCacheIndex]
    && (int64_t lastPushedCacheIndex = self->_lastPushedCacheIndex,
        lastPushedCacheIndex == [v4 lastPushedCacheIndex]))
  {
    scores = self->_scores;
    uint64_t v8 = [v4 scores];
    if (ASObjectsAreEqual(scores, v8))
    {
      opponentScores = self->_opponentScores;
      unint64_t v10 = [v4 opponentScores];
      if (ASObjectsAreEqual(opponentScores, v10))
      {
        durationDateComponents = self->_durationDateComponents;
        uint64_t v12 = [v4 durationDateComponents];
        if (ASObjectsAreEqual(durationDateComponents, v12))
        {
          UUID = self->_UUID;
          uint64_t v14 = [v4 UUID];
          if (ASObjectsAreEqual(UUID, v14))
          {
            startDateComponents = self->_startDateComponents;
            NSInteger v16 = [v4 startDateComponents];
            if (ASObjectsAreEqual(startDateComponents, v16))
            {
              preferredVictoryBadgeStyles = self->_preferredVictoryBadgeStyles;
              uint64_t v18 = [v4 preferredVictoryBadgeStyles];
              if (ASObjectsAreEqual(preferredVictoryBadgeStyles, v18))
              {
                unint64_t maximumNumberOfPointsPerDay = self->_maximumNumberOfPointsPerDay;
                BOOL v20 = maximumNumberOfPointsPerDay == [v4 maximumNumberOfPointsPerDay];
              }
              else
              {
                BOOL v20 = 0;
              }
            }
            else
            {
              BOOL v20 = 0;
            }
          }
          else
          {
            BOOL v20 = 0;
          }
        }
        else
        {
          BOOL v20 = 0;
        }
      }
      else
      {
        BOOL v20 = 0;
      }
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (id)currentDate
{
  unint64_t v3 = [(ASCompetition *)self currentDateOverride];
  if (v3) {
    [(ASCompetition *)self currentDateOverride];
  }
  else {
  id v4 = [MEMORY[0x263EFF910] date];
  }

  return v4;
}

- (id)_scoresForParticipant:(int64_t)a3
{
  uint64_t v3 = 40;
  if (!a3) {
    uint64_t v3 = 32;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (int64_t)currentCacheIndex
{
  return self->_currentCacheIndex;
}

- (void)setCurrentCacheIndex:(int64_t)a3
{
  self->_int64_t currentCacheIndex = a3;
}

- (int64_t)lastPushedCacheIndex
{
  return self->_lastPushedCacheIndex;
}

- (void)setLastPushedCacheIndex:(int64_t)a3
{
  self->_int64_t lastPushedCacheIndex = a3;
}

- (NSArray)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
}

- (NSArray)opponentScores
{
  return self->_opponentScores;
}

- (void)setOpponentScores:(id)a3
{
}

- (NSDateComponents)startDateComponents
{
  return self->_startDateComponents;
}

- (void)setStartDateComponents:(id)a3
{
}

- (NSDateComponents)durationDateComponents
{
  return self->_durationDateComponents;
}

- (void)setDurationDateComponents:(id)a3
{
}

- (NSArray)preferredVictoryBadgeStyles
{
  return self->_preferredVictoryBadgeStyles;
}

- (void)setPreferredVictoryBadgeStyles:(id)a3
{
}

- (unint64_t)maximumNumberOfPointsPerDay
{
  return self->_maximumNumberOfPointsPerDay;
}

- (void)setMaximumNumberOfPointsPerDay:(unint64_t)a3
{
  self->_unint64_t maximumNumberOfPointsPerDay = a3;
}

- (NSDate)currentDateOverride
{
  return self->_currentDateOverride;
}

- (void)setCurrentDateOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
  objc_storeStrong((id *)&self->_preferredVictoryBadgeStyles, 0);
  objc_storeStrong((id *)&self->_durationDateComponents, 0);
  objc_storeStrong((id *)&self->_startDateComponents, 0);
  objc_storeStrong((id *)&self->_opponentScores, 0);
  objc_storeStrong((id *)&self->_scores, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

+ (id)codableDatabaseCompetitionsFromCompetitions:(id)a3 withFriendWithUUID:(id)a4 withType:(int64_t)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    uint64_t v12 = (void *)MEMORY[0x263EFFA68];
    do
    {
      uint64_t v13 = 0;
      uint64_t v14 = v12;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        NSInteger v15 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
        NSInteger v16 = objc_alloc_init(ASCodableDatabaseCompetition);
        v17 = objc_msgSend(v8, "hk_dataForUUIDBytes");
        [(ASCodableDatabaseCompetition *)v16 setFriendUUID:v17];

        [(ASCodableDatabaseCompetition *)v16 setType:a5];
        uint64_t v18 = [v15 codableCompetition];
        [(ASCodableDatabaseCompetition *)v16 setCompetition:v18];

        uint64_t v12 = [v14 arrayByAddingObject:v16];

        ++v13;
        uint64_t v14 = v12;
      }
      while (v10 != v13);
      uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263EFFA68];
  }

  return v12;
}

@end