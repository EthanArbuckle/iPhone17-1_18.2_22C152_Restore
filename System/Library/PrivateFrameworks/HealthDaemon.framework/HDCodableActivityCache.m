@interface HDCodableActivityCache
+ (Class)dailyBriskMinutesStatisticsType;
+ (Class)dailyEnergyBurnedStatisticsType;
+ (Class)dailyMoveMinutesStatisticsType;
- (BOOL)applyToObject:(id)a3;
- (BOOL)hasActiveHours;
- (BOOL)hasActiveHoursGoal;
- (BOOL)hasActiveHoursGoalDate;
- (BOOL)hasActivityMoveMode;
- (BOOL)hasBriskMinutes;
- (BOOL)hasBriskMinutesGoal;
- (BOOL)hasBriskMinutesGoalDate;
- (BOOL)hasCacheIndex;
- (BOOL)hasDeepBreathingDuration;
- (BOOL)hasEnergyBurned;
- (BOOL)hasEnergyBurnedGoal;
- (BOOL)hasEnergyBurnedGoalDate;
- (BOOL)hasFlightsClimbed;
- (BOOL)hasMoveMinutes;
- (BOOL)hasMoveMinutesGoal;
- (BOOL)hasMoveMinutesGoalDate;
- (BOOL)hasPaused;
- (BOOL)hasPushCount;
- (BOOL)hasSample;
- (BOOL)hasSequence;
- (BOOL)hasStepCount;
- (BOOL)hasVersion;
- (BOOL)hasWalkingAndRunningDistance;
- (BOOL)hasWheelchairUse;
- (BOOL)isEqual:(id)a3;
- (BOOL)paused;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (NSMutableArray)dailyBriskMinutesStatistics;
- (NSMutableArray)dailyEnergyBurnedStatistics;
- (NSMutableArray)dailyMoveMinutesStatistics;
- (NSString)description;
- (double)activeHours;
- (double)activeHoursGoal;
- (double)activeHoursGoalDate;
- (double)briskMinutes;
- (double)briskMinutesGoal;
- (double)briskMinutesGoalDate;
- (double)deepBreathingDuration;
- (double)energyBurned;
- (double)energyBurnedGoal;
- (double)energyBurnedGoalDate;
- (double)moveMinutes;
- (double)moveMinutesGoal;
- (double)moveMinutesGoalDate;
- (double)walkingAndRunningDistance;
- (id)_decodeCodableActivityStatisticsQuantityInfos:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dailyBriskMinutesStatisticsAtIndex:(unint64_t)a3;
- (id)dailyEnergyBurnedStatisticsAtIndex:(unint64_t)a3;
- (id)dailyMoveMinutesStatisticsAtIndex:(unint64_t)a3;
- (id)decodedEnergyBurnedGoalQuantity;
- (id)decodedEnergyBurnedQuantity;
- (id)decodedWalkingAndRunningDistanceQuantity;
- (id)dictionaryRepresentation;
- (int64_t)activityMoveMode;
- (int64_t)cacheIndex;
- (int64_t)flightsClimbed;
- (int64_t)pushCount;
- (int64_t)sequence;
- (int64_t)stepCount;
- (int64_t)version;
- (int64_t)wheelchairUse;
- (unint64_t)dailyBriskMinutesStatisticsCount;
- (unint64_t)dailyEnergyBurnedStatisticsCount;
- (unint64_t)dailyMoveMinutesStatisticsCount;
- (unint64_t)hash;
- (void)addDailyBriskMinutesStatistics:(id)a3;
- (void)addDailyEnergyBurnedStatistics:(id)a3;
- (void)addDailyMoveMinutesStatistics:(id)a3;
- (void)clearDailyBriskMinutesStatistics;
- (void)clearDailyEnergyBurnedStatistics;
- (void)clearDailyMoveMinutesStatistics;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveHours:(double)a3;
- (void)setActiveHoursGoal:(double)a3;
- (void)setActiveHoursGoalDate:(double)a3;
- (void)setActivityMoveMode:(int64_t)a3;
- (void)setBriskMinutes:(double)a3;
- (void)setBriskMinutesGoal:(double)a3;
- (void)setBriskMinutesGoalDate:(double)a3;
- (void)setCacheIndex:(int64_t)a3;
- (void)setDailyBriskMinutesStatistics:(id)a3;
- (void)setDailyEnergyBurnedStatistics:(id)a3;
- (void)setDailyMoveMinutesStatistics:(id)a3;
- (void)setDeepBreathingDuration:(double)a3;
- (void)setEnergyBurned:(double)a3;
- (void)setEnergyBurnedGoal:(double)a3;
- (void)setEnergyBurnedGoalDate:(double)a3;
- (void)setFlightsClimbed:(int64_t)a3;
- (void)setHasActiveHours:(BOOL)a3;
- (void)setHasActiveHoursGoal:(BOOL)a3;
- (void)setHasActiveHoursGoalDate:(BOOL)a3;
- (void)setHasActivityMoveMode:(BOOL)a3;
- (void)setHasBriskMinutes:(BOOL)a3;
- (void)setHasBriskMinutesGoal:(BOOL)a3;
- (void)setHasBriskMinutesGoalDate:(BOOL)a3;
- (void)setHasCacheIndex:(BOOL)a3;
- (void)setHasDeepBreathingDuration:(BOOL)a3;
- (void)setHasEnergyBurned:(BOOL)a3;
- (void)setHasEnergyBurnedGoal:(BOOL)a3;
- (void)setHasEnergyBurnedGoalDate:(BOOL)a3;
- (void)setHasFlightsClimbed:(BOOL)a3;
- (void)setHasMoveMinutes:(BOOL)a3;
- (void)setHasMoveMinutesGoal:(BOOL)a3;
- (void)setHasMoveMinutesGoalDate:(BOOL)a3;
- (void)setHasPaused:(BOOL)a3;
- (void)setHasPushCount:(BOOL)a3;
- (void)setHasSequence:(BOOL)a3;
- (void)setHasStepCount:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHasWalkingAndRunningDistance:(BOOL)a3;
- (void)setHasWheelchairUse:(BOOL)a3;
- (void)setMoveMinutes:(double)a3;
- (void)setMoveMinutesGoal:(double)a3;
- (void)setMoveMinutesGoalDate:(double)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPushCount:(int64_t)a3;
- (void)setSample:(id)a3;
- (void)setSequence:(int64_t)a3;
- (void)setStepCount:(int64_t)a3;
- (void)setVersion:(int64_t)a3;
- (void)setWalkingAndRunningDistance:(double)a3;
- (void)setWheelchairUse:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableActivityCache

- (void)setSample:(id)a3
{
}

- (void)setCacheIndex:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_cacheIndex = a3;
}

- (void)setEnergyBurned:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_energyBurned = a3;
}

- (void)setBriskMinutes:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_briskMinutes = a3;
}

- (void)setActiveHours:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_activeHours = a3;
}

- (void)setStepCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_stepCount = a3;
}

- (void)setPushCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_pushCount = a3;
}

- (void)setWheelchairUse:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_wheelchairUse = a3;
}

- (void)setWalkingAndRunningDistance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_walkingAndRunningDistance = a3;
}

- (void)setEnergyBurnedGoal:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_energyBurnedGoal = a3;
}

- (void)setEnergyBurnedGoalDate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_energyBurnedGoalDate = a3;
}

- (void)setDeepBreathingDuration:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_deepBreathingDuration = a3;
}

- (void)setFlightsClimbed:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_flightsClimbed = a3;
}

- (void)writeTo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_sample) {
    PBDataWriterWriteSubmessage();
  }
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    PBDataWriterWriteInt64Field();
    $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_5:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_53;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteDoubleField();
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteDoubleField();
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteInt64Field();
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteDoubleField();
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteDoubleField();
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteDoubleField();
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteDoubleField();
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteInt64Field();
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_61:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x200000) != 0) {
LABEL_15:
  }
    PBDataWriterWriteInt64Field();
LABEL_16:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v6 = self->_dailyEnergyBurnedStatistics;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v8);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v11 = self->_dailyBriskMinutesStatistics;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v13);
  }

  $C9169E0A0C311E50A3922DEA03C68203 v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x20000) != 0)
  {
    PBDataWriterWriteInt64Field();
    $C9169E0A0C311E50A3922DEA03C68203 v16 = self->_has;
    if ((*(unsigned char *)&v16 & 0x20) == 0)
    {
LABEL_32:
      if ((*(unsigned char *)&v16 & 2) == 0) {
        goto LABEL_33;
      }
      goto LABEL_65;
    }
  }
  else if ((*(unsigned char *)&v16 & 0x20) == 0)
  {
    goto LABEL_32;
  }
  PBDataWriterWriteDoubleField();
  $C9169E0A0C311E50A3922DEA03C68203 v16 = self->_has;
  if ((*(unsigned char *)&v16 & 2) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v16 & 0x2000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteDoubleField();
  $C9169E0A0C311E50A3922DEA03C68203 v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x2000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v16 & 0x4000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteDoubleField();
  $C9169E0A0C311E50A3922DEA03C68203 v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x4000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v16 & 0x8000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_67:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_has & 0x8000) != 0) {
LABEL_36:
  }
    PBDataWriterWriteDoubleField();
LABEL_37:
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v17 = self->_dailyMoveMinutesStatistics;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteSubmessage();
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v19);
  }

  $C9169E0A0C311E50A3922DEA03C68203 v22 = self->_has;
  if ((*(unsigned char *)&v22 & 0x40) != 0)
  {
    PBDataWriterWriteDoubleField();
    $C9169E0A0C311E50A3922DEA03C68203 v22 = self->_has;
    if ((*(unsigned char *)&v22 & 4) == 0)
    {
LABEL_46:
      if ((*(unsigned char *)&v22 & 8) == 0) {
        goto LABEL_47;
      }
      goto LABEL_71;
    }
  }
  else if ((*(unsigned char *)&v22 & 4) == 0)
  {
    goto LABEL_46;
  }
  PBDataWriterWriteDoubleField();
  $C9169E0A0C311E50A3922DEA03C68203 v22 = self->_has;
  if ((*(unsigned char *)&v22 & 8) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v22 & 0x80000) == 0) {
      goto LABEL_48;
    }
LABEL_72:
    PBDataWriterWriteInt64Field();
    if ((*(_DWORD *)&self->_has & 0x400000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
LABEL_71:
  PBDataWriterWriteInt64Field();
  $C9169E0A0C311E50A3922DEA03C68203 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x80000) != 0) {
    goto LABEL_72;
  }
LABEL_48:
  if ((*(_DWORD *)&v22 & 0x400000) != 0) {
LABEL_49:
  }
    PBDataWriterWriteBOOLField();
LABEL_50:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_dailyMoveMinutesStatistics, 0);
  objc_storeStrong((id *)&self->_dailyEnergyBurnedStatistics, 0);

  objc_storeStrong((id *)&self->_dailyBriskMinutesStatistics, 0);
}

- (BOOL)applyToObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(HDCodableActivityCache *)self sample],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 applyToObject:v4],
        v5,
        v6))
  {
    uint64_t v7 = [MEMORY[0x1E4F2B448] activityCacheType];
    [v4 _setSampleType:v7];

    objc_msgSend(v4, "_setCacheIndex:", -[HDCodableActivityCache cacheIndex](self, "cacheIndex"));
    if ([(HDCodableActivityCache *)self hasSequence]) {
      objc_msgSend(v4, "_setSequence:", -[HDCodableActivityCache sequence](self, "sequence"));
    }
    uint64_t v8 = [(HDCodableActivityCache *)self decodedEnergyBurnedQuantity];
    [v4 _setEnergyBurned:v8];

    uint64_t v9 = [(HDCodableActivityCache *)self decodedWalkingAndRunningDistanceQuantity];
    [v4 _setWalkingAndRunningDistance:v9];

    uint64_t v10 = [(HDCodableActivityCache *)self decodedEnergyBurnedGoalQuantity];
    [v4 _setEnergyBurnedGoal:v10];

    if ([(HDCodableActivityCache *)self hasMoveMinutes])
    {
      [(HDCodableActivityCache *)self moveMinutes];
      objc_msgSend(v4, "_setMoveMinutes:");
    }
    if ([(HDCodableActivityCache *)self hasMoveMinutesGoal])
    {
      if (self && (*((unsigned char *)&self->_has + 1) & 0x40) != 0)
      {
        uint64_t v13 = (void *)MEMORY[0x1E4F2B370];
        uint64_t v14 = _HKWorkoutCanonicalMoveMinutesUnit();
        v11 = [v13 quantityWithUnit:v14 doubleValue:self->_moveMinutesGoal];
      }
      else
      {
        v11 = 0;
      }
      [v4 _setMoveMinutesGoalOnly:v11];
    }
    if ([(HDCodableActivityCache *)self hasMoveMinutesGoalDate])
    {
      [(HDCodableActivityCache *)self moveMinutesGoalDate];
      uint64_t v15 = HDDecodeDateForValue();
      [v4 _setMoveMinutesGoalDateOnly:v15];
    }
    if ([(HDCodableActivityCache *)self hasBriskMinutes])
    {
      [(HDCodableActivityCache *)self briskMinutes];
      objc_msgSend(v4, "_setBriskMinutes:");
    }
    if ([(HDCodableActivityCache *)self hasBriskMinutesGoal])
    {
      if (self && (*(unsigned char *)&self->_has & 0x20) != 0)
      {
        v17 = (void *)MEMORY[0x1E4F2B370];
        uint64_t v18 = _HKWorkoutCanonicalBriskMinutesUnit();
        $C9169E0A0C311E50A3922DEA03C68203 v16 = [v17 quantityWithUnit:v18 doubleValue:self->_briskMinutesGoal];
      }
      else
      {
        $C9169E0A0C311E50A3922DEA03C68203 v16 = 0;
      }
      [v4 _setBriskMinutesGoalOnly:v16];
    }
    if ([(HDCodableActivityCache *)self hasBriskMinutesGoalDate])
    {
      [(HDCodableActivityCache *)self briskMinutesGoalDate];
      uint64_t v19 = HDDecodeDateForValue();
      [v4 _setBriskMinutesGoalDateOnly:v19];
    }
    if ([(HDCodableActivityCache *)self hasActiveHours])
    {
      [(HDCodableActivityCache *)self activeHours];
      objc_msgSend(v4, "_setActiveHours:");
    }
    if ([(HDCodableActivityCache *)self hasActiveHoursGoal])
    {
      if (self && (*(unsigned char *)&self->_has & 2) != 0)
      {
        uint64_t v21 = (void *)MEMORY[0x1E4F2B370];
        $C9169E0A0C311E50A3922DEA03C68203 v22 = _HKWorkoutCanonicalActiveHoursUnit();
        uint64_t v20 = [v21 quantityWithUnit:v22 doubleValue:self->_activeHoursGoal];
      }
      else
      {
        uint64_t v20 = 0;
      }
      [v4 _setActiveHoursGoalOnly:v20];
    }
    if ([(HDCodableActivityCache *)self hasActiveHoursGoalDate])
    {
      [(HDCodableActivityCache *)self activeHoursGoalDate];
      long long v23 = HDDecodeDateForValue();
      [v4 _setActiveHoursGoalDateOnly:v23];
    }
    if ([(HDCodableActivityCache *)self hasStepCount]) {
      objc_msgSend(v4, "_setStepCount:", -[HDCodableActivityCache stepCount](self, "stepCount"));
    }
    if ([(HDCodableActivityCache *)self hasPushCount]) {
      objc_msgSend(v4, "_setPushCount:", -[HDCodableActivityCache pushCount](self, "pushCount"));
    }
    if ([(HDCodableActivityCache *)self hasWheelchairUse]) {
      objc_msgSend(v4, "_setWheelchairUse:", -[HDCodableActivityCache wheelchairUse](self, "wheelchairUse"));
    }
    if ([(HDCodableActivityCache *)self hasEnergyBurnedGoalDate])
    {
      long long v24 = [(HDCodableActivityCache *)self decodedEnergyBurnedGoalQuantity];
      [(HDCodableActivityCache *)self energyBurnedGoalDate];
      long long v25 = HDDecodeDateForValue();
      [v4 _setEnergyBurnedGoal:v24 date:v25];
    }
    if ([(HDCodableActivityCache *)self hasFlightsClimbed]) {
      objc_msgSend(v4, "_setFlightsClimbed:", -[HDCodableActivityCache flightsClimbed](self, "flightsClimbed"));
    }
    if ([(HDCodableActivityCache *)self hasDeepBreathingDuration])
    {
      [(HDCodableActivityCache *)self deepBreathingDuration];
      objc_msgSend(v4, "_setDeepBreathingDuration:");
    }
    if ([(HDCodableActivityCache *)self activityMoveMode]) {
      int64_t v26 = [(HDCodableActivityCache *)self activityMoveMode];
    }
    else {
      int64_t v26 = 1;
    }
    [v4 _setActivityMoveMode:v26];
    objc_msgSend(v4, "_setVersion:", -[HDCodableActivityCache version](self, "version"));
    long long v27 = [(HDCodableActivityCache *)self dailyEnergyBurnedStatistics];
    uint64_t v28 = [v27 count];

    if (v28)
    {
      long long v29 = [(HDCodableActivityCache *)self dailyEnergyBurnedStatistics];
      long long v30 = -[HDCodableActivityCache _decodeCodableActivityStatisticsQuantityInfos:]((uint64_t)self, v29);

      [v4 _setDailyEnergyBurnedStatistics:v30];
    }
    long long v31 = [(HDCodableActivityCache *)self dailyMoveMinutesStatistics];
    uint64_t v32 = [v31 count];

    if (v32)
    {
      long long v33 = [(HDCodableActivityCache *)self dailyMoveMinutesStatistics];
      long long v34 = -[HDCodableActivityCache _decodeCodableActivityStatisticsQuantityInfos:]((uint64_t)self, v33);

      [v4 _setDailyMoveMinutesStatistics:v34];
    }
    v35 = [(HDCodableActivityCache *)self dailyBriskMinutesStatistics];
    uint64_t v36 = [v35 count];

    if (v36)
    {
      v37 = [(HDCodableActivityCache *)self dailyBriskMinutesStatistics];
      uint64_t v38 = -[HDCodableActivityCache _decodeCodableActivityStatisticsQuantityInfos:]((uint64_t)self, v37);

      [v4 _setDailyBriskMinutesStatistics:v38];
    }
    objc_msgSend(v4, "_setPaused:", -[HDCodableActivityCache paused](self, "paused"));
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (int64_t)cacheIndex
{
  return self->_cacheIndex;
}

- (id)decodedEnergyBurnedQuantity
{
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0)
  {
    id v4 = (void *)MEMORY[0x1E4F2B370];
    v5 = _HKWorkoutCanonicalEnergyBurnedUnit();
    v2 = [v4 quantityWithUnit:v5 doubleValue:self->_energyBurned];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)decodedWalkingAndRunningDistanceQuantity
{
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0)
  {
    id v4 = (void *)MEMORY[0x1E4F2B370];
    v5 = [MEMORY[0x1E4F2B618] meterUnit];
    v2 = [v4 quantityWithUnit:v5 doubleValue:self->_walkingAndRunningDistance];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)decodedEnergyBurnedGoalQuantity
{
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0)
  {
    id v4 = (void *)MEMORY[0x1E4F2B370];
    v5 = _HKWorkoutCanonicalEnergyBurnedUnit();
    v2 = [v4 quantityWithUnit:v5 doubleValue:self->_energyBurnedGoal];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)hasBriskMinutes
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (double)briskMinutes
{
  return self->_briskMinutes;
}

- (BOOL)hasActiveHours
{
  return *(_DWORD *)&self->_has & 1;
}

- (double)activeHours
{
  return self->_activeHours;
}

- (BOOL)hasStepCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (int64_t)stepCount
{
  return self->_stepCount;
}

- (BOOL)hasPushCount
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (int64_t)pushCount
{
  return self->_pushCount;
}

- (BOOL)hasWheelchairUse
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (int64_t)wheelchairUse
{
  return self->_wheelchairUse;
}

- (BOOL)hasEnergyBurnedGoalDate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (double)energyBurnedGoalDate
{
  return self->_energyBurnedGoalDate;
}

- (BOOL)hasFlightsClimbed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (int64_t)flightsClimbed
{
  return self->_flightsClimbed;
}

- (BOOL)hasDeepBreathingDuration
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (double)deepBreathingDuration
{
  return self->_deepBreathingDuration;
}

- (id)_decodeCodableActivityStatisticsQuantityInfos:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(MEMORY[0x1E4F2B838], "createWithCodable:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          if (v10) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    v11 = (void *)[v4 copy];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setHasCacheIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCacheIndex
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasEnergyBurned:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasEnergyBurned
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasBriskMinutes:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (void)setHasActiveHours:(BOOL)a3
{
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (void)setHasStepCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (void)setHasEnergyBurnedGoal:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasEnergyBurnedGoal
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasWalkingAndRunningDistance:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasWalkingAndRunningDistance
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasEnergyBurnedGoalDate:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (void)setHasDeepBreathingDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (void)setHasPushCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (void)setHasFlightsClimbed:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (void)setHasWheelchairUse:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (void)clearDailyEnergyBurnedStatistics
{
}

- (void)addDailyEnergyBurnedStatistics:(id)a3
{
  id v4 = a3;
  dailyEnergyBurnedStatistics = self->_dailyEnergyBurnedStatistics;
  id v8 = v4;
  if (!dailyEnergyBurnedStatistics)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_dailyEnergyBurnedStatistics;
    self->_dailyEnergyBurnedStatistics = v6;

    id v4 = v8;
    dailyEnergyBurnedStatistics = self->_dailyEnergyBurnedStatistics;
  }
  [(NSMutableArray *)dailyEnergyBurnedStatistics addObject:v4];
}

- (unint64_t)dailyEnergyBurnedStatisticsCount
{
  return [(NSMutableArray *)self->_dailyEnergyBurnedStatistics count];
}

- (id)dailyEnergyBurnedStatisticsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_dailyEnergyBurnedStatistics objectAtIndex:a3];
}

+ (Class)dailyEnergyBurnedStatisticsType
{
  return (Class)objc_opt_class();
}

- (void)clearDailyBriskMinutesStatistics
{
}

- (void)addDailyBriskMinutesStatistics:(id)a3
{
  id v4 = a3;
  dailyBriskMinutesStatistics = self->_dailyBriskMinutesStatistics;
  id v8 = v4;
  if (!dailyBriskMinutesStatistics)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_dailyBriskMinutesStatistics;
    self->_dailyBriskMinutesStatistics = v6;

    id v4 = v8;
    dailyBriskMinutesStatistics = self->_dailyBriskMinutesStatistics;
  }
  [(NSMutableArray *)dailyBriskMinutesStatistics addObject:v4];
}

- (unint64_t)dailyBriskMinutesStatisticsCount
{
  return [(NSMutableArray *)self->_dailyBriskMinutesStatistics count];
}

- (id)dailyBriskMinutesStatisticsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_dailyBriskMinutesStatistics objectAtIndex:a3];
}

+ (Class)dailyBriskMinutesStatisticsType
{
  return (Class)objc_opt_class();
}

- (void)setSequence:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_sequence = a3;
}

- (void)setHasSequence:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSequence
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setBriskMinutesGoal:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_briskMinutesGoal = a3;
}

- (void)setHasBriskMinutesGoal:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBriskMinutesGoal
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setActiveHoursGoal:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_activeHoursGoal = a3;
}

- (void)setHasActiveHoursGoal:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasActiveHoursGoal
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMoveMinutes:(double)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_moveMinutes = a3;
}

- (void)setHasMoveMinutes:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasMoveMinutes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setMoveMinutesGoal:(double)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_moveMinutesGoal = a3;
}

- (void)setHasMoveMinutesGoal:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasMoveMinutesGoal
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMoveMinutesGoalDate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_moveMinutesGoalDate = a3;
}

- (void)setHasMoveMinutesGoalDate:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasMoveMinutesGoalDate
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)clearDailyMoveMinutesStatistics
{
}

- (void)addDailyMoveMinutesStatistics:(id)a3
{
  id v4 = a3;
  dailyMoveMinutesStatistics = self->_dailyMoveMinutesStatistics;
  id v8 = v4;
  if (!dailyMoveMinutesStatistics)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_dailyMoveMinutesStatistics;
    self->_dailyMoveMinutesStatistics = v6;

    id v4 = v8;
    dailyMoveMinutesStatistics = self->_dailyMoveMinutesStatistics;
  }
  [(NSMutableArray *)dailyMoveMinutesStatistics addObject:v4];
}

- (unint64_t)dailyMoveMinutesStatisticsCount
{
  return [(NSMutableArray *)self->_dailyMoveMinutesStatistics count];
}

- (id)dailyMoveMinutesStatisticsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_dailyMoveMinutesStatistics objectAtIndex:a3];
}

+ (Class)dailyMoveMinutesStatisticsType
{
  return (Class)objc_opt_class();
}

- (void)setBriskMinutesGoalDate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_briskMinutesGoalDate = a3;
}

- (void)setHasBriskMinutesGoalDate:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasBriskMinutesGoalDate
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setActiveHoursGoalDate:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_activeHoursGoalDate = a3;
}

- (void)setHasActiveHoursGoalDate:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasActiveHoursGoalDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setActivityMoveMode:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_activityMoveMode = a3;
}

- (void)setHasActivityMoveMode:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasActivityMoveMode
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasVersion
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setPaused:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_paused = a3;
}

- (void)setHasPaused:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$C9169E0A0C311E50A3922DEA03C68203 has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasPaused
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (NSString)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableActivityCache;
  id v4 = [(HDCodableActivityCache *)&v8 description];
  id v5 = [(HDCodableActivityCache *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sample = self->_sample;
  if (sample)
  {
    id v5 = [(HDCodableSample *)sample dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sample"];
  }
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    long long v34 = [NSNumber numberWithLongLong:self->_cacheIndex];
    [v3 setObject:v34 forKey:@"cacheIndex"];

    $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_5:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_61;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  v35 = [NSNumber numberWithDouble:self->_energyBurned];
  [v3 setObject:v35 forKey:@"energyBurned"];

  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v36 = [NSNumber numberWithDouble:self->_briskMinutes];
  [v3 setObject:v36 forKey:@"briskMinutes"];

  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_63;
  }
LABEL_62:
  v37 = [NSNumber numberWithDouble:self->_activeHours];
  [v3 setObject:v37 forKey:@"activeHours"];

  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_64;
  }
LABEL_63:
  uint64_t v38 = [NSNumber numberWithLongLong:self->_stepCount];
  [v3 setObject:v38 forKey:@"stepCount"];

  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_65;
  }
LABEL_64:
  v39 = [NSNumber numberWithDouble:self->_energyBurnedGoal];
  [v3 setObject:v39 forKey:@"energyBurnedGoal"];

  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_66;
  }
LABEL_65:
  v40 = [NSNumber numberWithDouble:self->_walkingAndRunningDistance];
  [v3 setObject:v40 forKey:@"walkingAndRunningDistance"];

  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_67;
  }
LABEL_66:
  v41 = [NSNumber numberWithDouble:self->_energyBurnedGoalDate];
  [v3 setObject:v41 forKey:@"energyBurnedGoalDate"];

  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_68;
  }
LABEL_67:
  v42 = [NSNumber numberWithDouble:self->_deepBreathingDuration];
  [v3 setObject:v42 forKey:@"deepBreathingDuration"];

  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_69;
  }
LABEL_68:
  v43 = [NSNumber numberWithLongLong:self->_pushCount];
  [v3 setObject:v43 forKey:@"pushCount"];

  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_69:
  v44 = [NSNumber numberWithLongLong:self->_flightsClimbed];
  [v3 setObject:v44 forKey:@"flightsClimbed"];

  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_15:
    uint64_t v7 = [NSNumber numberWithLongLong:self->_wheelchairUse];
    [v3 setObject:v7 forKey:@"wheelchairUse"];
  }
LABEL_16:
  if ([(NSMutableArray *)self->_dailyEnergyBurnedStatistics count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_dailyEnergyBurnedStatistics, "count"));
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v9 = self->_dailyEnergyBurnedStatistics;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v63 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = [*(id *)(*((void *)&v62 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v62 objects:v68 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"dailyEnergyBurnedStatistics"];
  }
  if ([(NSMutableArray *)self->_dailyBriskMinutesStatistics count])
  {
    long long v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_dailyBriskMinutesStatistics, "count"));
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v16 = self->_dailyBriskMinutesStatistics;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v58 objects:v67 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v59 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = [*(id *)(*((void *)&v58 + 1) + 8 * j) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v58 objects:v67 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"dailyBriskMinutesStatistics"];
  }
  $C9169E0A0C311E50A3922DEA03C68203 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x20000) != 0)
  {
    v45 = [NSNumber numberWithLongLong:self->_sequence];
    [v3 setObject:v45 forKey:@"sequence"];

    $C9169E0A0C311E50A3922DEA03C68203 v22 = self->_has;
    if ((*(unsigned char *)&v22 & 0x20) == 0)
    {
LABEL_36:
      if ((*(unsigned char *)&v22 & 2) == 0) {
        goto LABEL_37;
      }
      goto LABEL_73;
    }
  }
  else if ((*(unsigned char *)&v22 & 0x20) == 0)
  {
    goto LABEL_36;
  }
  v46 = [NSNumber numberWithDouble:self->_briskMinutesGoal];
  [v3 setObject:v46 forKey:@"briskMinutesGoal"];

  $C9169E0A0C311E50A3922DEA03C68203 v22 = self->_has;
  if ((*(unsigned char *)&v22 & 2) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v22 & 0x2000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_74;
  }
LABEL_73:
  v47 = [NSNumber numberWithDouble:self->_activeHoursGoal];
  [v3 setObject:v47 forKey:@"activeHoursGoal"];

  $C9169E0A0C311E50A3922DEA03C68203 v22 = self->_has;
  if ((*(_WORD *)&v22 & 0x2000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v22 & 0x4000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_75;
  }
LABEL_74:
  v48 = [NSNumber numberWithDouble:self->_moveMinutes];
  [v3 setObject:v48 forKey:@"moveMinutes"];

  $C9169E0A0C311E50A3922DEA03C68203 v22 = self->_has;
  if ((*(_WORD *)&v22 & 0x4000) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v22 & 0x8000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_75:
  v49 = [NSNumber numberWithDouble:self->_moveMinutesGoal];
  [v3 setObject:v49 forKey:@"moveMinutesGoal"];

  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_40:
    long long v23 = [NSNumber numberWithDouble:self->_moveMinutesGoalDate];
    [v3 setObject:v23 forKey:@"moveMinutesGoalDate"];
  }
LABEL_41:
  if ([(NSMutableArray *)self->_dailyMoveMinutesStatistics count])
  {
    long long v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_dailyMoveMinutesStatistics, "count"));
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v25 = self->_dailyMoveMinutesStatistics;
    uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v54 objects:v66 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v55;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v55 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * k), "dictionaryRepresentation", (void)v54);
          [v24 addObject:v30];
        }
        uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v54 objects:v66 count:16];
      }
      while (v27);
    }

    [v3 setObject:v24 forKey:@"dailyMoveMinutesStatistics"];
  }
  $C9169E0A0C311E50A3922DEA03C68203 v31 = self->_has;
  if ((*(unsigned char *)&v31 & 0x40) != 0)
  {
    v50 = [NSNumber numberWithDouble:self->_briskMinutesGoalDate];
    [v3 setObject:v50 forKey:@"briskMinutesGoalDate"];

    $C9169E0A0C311E50A3922DEA03C68203 v31 = self->_has;
    if ((*(unsigned char *)&v31 & 4) == 0)
    {
LABEL_52:
      if ((*(unsigned char *)&v31 & 8) == 0) {
        goto LABEL_53;
      }
      goto LABEL_79;
    }
  }
  else if ((*(unsigned char *)&v31 & 4) == 0)
  {
    goto LABEL_52;
  }
  v51 = objc_msgSend(NSNumber, "numberWithDouble:", self->_activeHoursGoalDate, (void)v54);
  [v3 setObject:v51 forKey:@"activeHoursGoalDate"];

  $C9169E0A0C311E50A3922DEA03C68203 v31 = self->_has;
  if ((*(unsigned char *)&v31 & 8) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v31 & 0x80000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_80;
  }
LABEL_79:
  v52 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_activityMoveMode, (void)v54);
  [v3 setObject:v52 forKey:@"activityMoveMode"];

  $C9169E0A0C311E50A3922DEA03C68203 v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x80000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v31 & 0x400000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
LABEL_80:
  v53 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_version, (void)v54);
  [v3 setObject:v53 forKey:@"version"];

  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_55:
    uint64_t v32 = objc_msgSend(NSNumber, "numberWithBool:", self->_paused, (void)v54);
    [v3 setObject:v32 forKey:@"paused"];
  }
LABEL_56:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableActivityCacheReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v20 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    id v4 = v20;
  }
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    *((void *)v4 + 8) = self->_cacheIndex;
    *((_DWORD *)v4 + 55) |= 0x80u;
    $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_5:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_46;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 10) = *(void *)&self->_energyBurned;
  *((_DWORD *)v4 + 55) |= 0x200u;
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((void *)v4 + 5) = *(void *)&self->_briskMinutes;
  *((_DWORD *)v4 + 55) |= 0x10u;
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((void *)v4 + 1) = *(void *)&self->_activeHours;
  *((_DWORD *)v4 + 55) |= 1u;
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)v4 + 19) = self->_stepCount;
  *((_DWORD *)v4 + 55) |= 0x40000u;
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((void *)v4 + 11) = *(void *)&self->_energyBurnedGoal;
  *((_DWORD *)v4 + 55) |= 0x400u;
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)v4 + 21) = *(void *)&self->_walkingAndRunningDistance;
  *((_DWORD *)v4 + 55) |= 0x100000u;
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)v4 + 12) = *(void *)&self->_energyBurnedGoalDate;
  *((_DWORD *)v4 + 55) |= 0x800u;
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((void *)v4 + 9) = *(void *)&self->_deepBreathingDuration;
  *((_DWORD *)v4 + 55) |= 0x100u;
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_14;
    }
LABEL_54:
    *((void *)v4 + 13) = self->_flightsClimbed;
    *((_DWORD *)v4 + 55) |= 0x1000u;
    if ((*(_DWORD *)&self->_has & 0x200000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_53:
  *((void *)v4 + 17) = self->_pushCount;
  *((_DWORD *)v4 + 55) |= 0x10000u;
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0) {
    goto LABEL_54;
  }
LABEL_14:
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_15:
    *((void *)v4 + 22) = self->_wheelchairUse;
    *((_DWORD *)v4 + 55) |= 0x200000u;
  }
LABEL_16:
  if ([(HDCodableActivityCache *)self dailyEnergyBurnedStatisticsCount])
  {
    [v20 clearDailyEnergyBurnedStatistics];
    unint64_t v6 = [(HDCodableActivityCache *)self dailyEnergyBurnedStatisticsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(HDCodableActivityCache *)self dailyEnergyBurnedStatisticsAtIndex:i];
        [v20 addDailyEnergyBurnedStatistics:v9];
      }
    }
  }
  if ([(HDCodableActivityCache *)self dailyBriskMinutesStatisticsCount])
  {
    [v20 clearDailyBriskMinutesStatistics];
    unint64_t v10 = [(HDCodableActivityCache *)self dailyBriskMinutesStatisticsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        long long v13 = [(HDCodableActivityCache *)self dailyBriskMinutesStatisticsAtIndex:j];
        [v20 addDailyBriskMinutesStatistics:v13];
      }
    }
  }
  $C9169E0A0C311E50A3922DEA03C68203 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x20000) != 0)
  {
    *((void *)v20 + 18) = self->_sequence;
    *((_DWORD *)v20 + 55) |= 0x20000u;
    $C9169E0A0C311E50A3922DEA03C68203 v14 = self->_has;
    if ((*(unsigned char *)&v14 & 0x20) == 0)
    {
LABEL_26:
      if ((*(unsigned char *)&v14 & 2) == 0) {
        goto LABEL_27;
      }
      goto LABEL_58;
    }
  }
  else if ((*(unsigned char *)&v14 & 0x20) == 0)
  {
    goto LABEL_26;
  }
  *((void *)v20 + 6) = *(void *)&self->_briskMinutesGoal;
  *((_DWORD *)v20 + 55) |= 0x20u;
  $C9169E0A0C311E50A3922DEA03C68203 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 2) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v14 & 0x2000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((void *)v20 + 2) = *(void *)&self->_activeHoursGoal;
  *((_DWORD *)v20 + 55) |= 2u;
  $C9169E0A0C311E50A3922DEA03C68203 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v14 & 0x4000) == 0) {
      goto LABEL_29;
    }
LABEL_60:
    *((void *)v20 + 15) = *(void *)&self->_moveMinutesGoal;
    *((_DWORD *)v20 + 55) |= 0x4000u;
    if ((*(_DWORD *)&self->_has & 0x8000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_59:
  *((void *)v20 + 14) = *(void *)&self->_moveMinutes;
  *((_DWORD *)v20 + 55) |= 0x2000u;
  $C9169E0A0C311E50A3922DEA03C68203 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) != 0) {
    goto LABEL_60;
  }
LABEL_29:
  if ((*(_WORD *)&v14 & 0x8000) != 0)
  {
LABEL_30:
    *((void *)v20 + 16) = *(void *)&self->_moveMinutesGoalDate;
    *((_DWORD *)v20 + 55) |= 0x8000u;
  }
LABEL_31:
  if ([(HDCodableActivityCache *)self dailyMoveMinutesStatisticsCount])
  {
    [v20 clearDailyMoveMinutesStatistics];
    unint64_t v15 = [(HDCodableActivityCache *)self dailyMoveMinutesStatisticsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t k = 0; k != v16; ++k)
      {
        uint64_t v18 = [(HDCodableActivityCache *)self dailyMoveMinutesStatisticsAtIndex:k];
        [v20 addDailyMoveMinutesStatistics:v18];
      }
    }
  }
  $C9169E0A0C311E50A3922DEA03C68203 v19 = self->_has;
  if ((*(unsigned char *)&v19 & 0x40) != 0)
  {
    *((void *)v20 + 7) = *(void *)&self->_briskMinutesGoalDate;
    *((_DWORD *)v20 + 55) |= 0x40u;
    $C9169E0A0C311E50A3922DEA03C68203 v19 = self->_has;
    if ((*(unsigned char *)&v19 & 4) == 0)
    {
LABEL_37:
      if ((*(unsigned char *)&v19 & 8) == 0) {
        goto LABEL_38;
      }
      goto LABEL_64;
    }
  }
  else if ((*(unsigned char *)&v19 & 4) == 0)
  {
    goto LABEL_37;
  }
  *((void *)v20 + 3) = *(void *)&self->_activeHoursGoalDate;
  *((_DWORD *)v20 + 55) |= 4u;
  $C9169E0A0C311E50A3922DEA03C68203 v19 = self->_has;
  if ((*(unsigned char *)&v19 & 8) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v19 & 0x80000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((void *)v20 + 4) = self->_activityMoveMode;
  *((_DWORD *)v20 + 55) |= 8u;
  $C9169E0A0C311E50A3922DEA03C68203 v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x80000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v19 & 0x400000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_65:
  *((void *)v20 + 20) = self->_version;
  *((_DWORD *)v20 + 55) |= 0x80000u;
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_40:
    *((unsigned char *)v20 + 216) = self->_paused;
    *((_DWORD *)v20 + 55) |= 0x400000u;
  }
LABEL_41:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v6;

  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    *(void *)(v5 + 64) = self->_cacheIndex;
    *(_DWORD *)(v5 + 220) |= 0x80u;
    $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_51;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 80) = self->_energyBurned;
  *(_DWORD *)(v5 + 220) |= 0x200u;
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(double *)(v5 + 40) = self->_briskMinutes;
  *(_DWORD *)(v5 + 220) |= 0x10u;
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(double *)(v5 + 8) = self->_activeHours;
  *(_DWORD *)(v5 + 220) |= 1u;
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(void *)(v5 + 152) = self->_stepCount;
  *(_DWORD *)(v5 + 220) |= 0x40000u;
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(double *)(v5 + 88) = self->_energyBurnedGoal;
  *(_DWORD *)(v5 + 220) |= 0x400u;
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(double *)(v5 + 168) = self->_walkingAndRunningDistance;
  *(_DWORD *)(v5 + 220) |= 0x100000u;
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(double *)(v5 + 96) = self->_energyBurnedGoalDate;
  *(_DWORD *)(v5 + 220) |= 0x800u;
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(double *)(v5 + 72) = self->_deepBreathingDuration;
  *(_DWORD *)(v5 + 220) |= 0x100u;
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(void *)(v5 + 136) = self->_pushCount;
  *(_DWORD *)(v5 + 220) |= 0x10000u;
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_59:
  *(void *)(v5 + 104) = self->_flightsClimbed;
  *(_DWORD *)(v5 + 220) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_13:
    *(void *)(v5 + 176) = self->_wheelchairUse;
    *(_DWORD *)(v5 + 220) |= 0x200000u;
  }
LABEL_14:
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v9 = self->_dailyEnergyBurnedStatistics;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v39;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v9);
        }
        $C9169E0A0C311E50A3922DEA03C68203 v14 = (void *)[*(id *)(*((void *)&v38 + 1) + 8 * v13) copyWithZone:a3];
        [(id)v5 addDailyEnergyBurnedStatistics:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v11);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unint64_t v15 = self->_dailyBriskMinutesStatistics;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v35;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * v19) copyWithZone:a3];
        [(id)v5 addDailyBriskMinutesStatistics:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v17);
  }

  $C9169E0A0C311E50A3922DEA03C68203 v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x20000) != 0)
  {
    *(void *)(v5 + 144) = self->_sequence;
    *(_DWORD *)(v5 + 220) |= 0x20000u;
    $C9169E0A0C311E50A3922DEA03C68203 v21 = self->_has;
    if ((*(unsigned char *)&v21 & 0x20) == 0)
    {
LABEL_30:
      if ((*(unsigned char *)&v21 & 2) == 0) {
        goto LABEL_31;
      }
      goto LABEL_63;
    }
  }
  else if ((*(unsigned char *)&v21 & 0x20) == 0)
  {
    goto LABEL_30;
  }
  *(double *)(v5 + 48) = self->_briskMinutesGoal;
  *(_DWORD *)(v5 + 220) |= 0x20u;
  $C9169E0A0C311E50A3922DEA03C68203 v21 = self->_has;
  if ((*(unsigned char *)&v21 & 2) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v21 & 0x2000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(double *)(v5 + 16) = self->_activeHoursGoal;
  *(_DWORD *)(v5 + 220) |= 2u;
  $C9169E0A0C311E50A3922DEA03C68203 v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x2000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v21 & 0x4000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_65;
  }
LABEL_64:
  *(double *)(v5 + 112) = self->_moveMinutes;
  *(_DWORD *)(v5 + 220) |= 0x2000u;
  $C9169E0A0C311E50A3922DEA03C68203 v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x4000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v21 & 0x8000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_65:
  *(double *)(v5 + 120) = self->_moveMinutesGoal;
  *(_DWORD *)(v5 + 220) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_34:
    *(double *)(v5 + 128) = self->_moveMinutesGoalDate;
    *(_DWORD *)(v5 + 220) |= 0x8000u;
  }
LABEL_35:
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  $C9169E0A0C311E50A3922DEA03C68203 v22 = self->_dailyMoveMinutesStatistics;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v31;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v26), "copyWithZone:", a3, (void)v30);
        [(id)v5 addDailyMoveMinutesStatistics:v27];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v24);
  }

  $C9169E0A0C311E50A3922DEA03C68203 v28 = self->_has;
  if ((*(unsigned char *)&v28 & 0x40) != 0)
  {
    *(double *)(v5 + 56) = self->_briskMinutesGoalDate;
    *(_DWORD *)(v5 + 220) |= 0x40u;
    $C9169E0A0C311E50A3922DEA03C68203 v28 = self->_has;
    if ((*(unsigned char *)&v28 & 4) == 0)
    {
LABEL_44:
      if ((*(unsigned char *)&v28 & 8) == 0) {
        goto LABEL_45;
      }
      goto LABEL_69;
    }
  }
  else if ((*(unsigned char *)&v28 & 4) == 0)
  {
    goto LABEL_44;
  }
  *(double *)(v5 + 24) = self->_activeHoursGoalDate;
  *(_DWORD *)(v5 + 220) |= 4u;
  $C9169E0A0C311E50A3922DEA03C68203 v28 = self->_has;
  if ((*(unsigned char *)&v28 & 8) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v28 & 0x80000) == 0) {
      goto LABEL_46;
    }
LABEL_70:
    *(void *)(v5 + 160) = self->_version;
    *(_DWORD *)(v5 + 220) |= 0x80000u;
    if ((*(_DWORD *)&self->_has & 0x400000) == 0) {
      return (id)v5;
    }
    goto LABEL_47;
  }
LABEL_69:
  *(void *)(v5 + 32) = self->_activityMoveMode;
  *(_DWORD *)(v5 + 220) |= 8u;
  $C9169E0A0C311E50A3922DEA03C68203 v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x80000) != 0) {
    goto LABEL_70;
  }
LABEL_46:
  if ((*(_DWORD *)&v28 & 0x400000) != 0)
  {
LABEL_47:
    *(unsigned char *)(v5 + 216) = self->_paused;
    *(_DWORD *)(v5 + 220) |= 0x400000u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_124;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 26))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:")) {
      goto LABEL_124;
    }
  }
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  int v7 = *((_DWORD *)v4 + 55);
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_cacheIndex != *((void *)v4 + 8)) {
      goto LABEL_124;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_energyBurned != *((double *)v4 + 10)) {
      goto LABEL_124;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_124;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_briskMinutes != *((double *)v4 + 5)) {
      goto LABEL_124;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_124;
  }
  if (*(unsigned char *)&has)
  {
    if ((v7 & 1) == 0 || self->_activeHours != *((double *)v4 + 1)) {
      goto LABEL_124;
    }
  }
  else if (v7)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_stepCount != *((void *)v4 + 19)) {
      goto LABEL_124;
    }
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_energyBurnedGoal != *((double *)v4 + 11)) {
      goto LABEL_124;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_walkingAndRunningDistance != *((double *)v4 + 21)) {
      goto LABEL_124;
    }
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_energyBurnedGoalDate != *((double *)v4 + 12)) {
      goto LABEL_124;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_deepBreathingDuration != *((double *)v4 + 9)) {
      goto LABEL_124;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_pushCount != *((void *)v4 + 17)) {
      goto LABEL_124;
    }
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_flightsClimbed != *((void *)v4 + 13)) {
      goto LABEL_124;
    }
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_wheelchairUse != *((void *)v4 + 22)) {
      goto LABEL_124;
    }
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_124;
  }
  dailyEnergyBurnedStatistics = self->_dailyEnergyBurnedStatistics;
  if ((unint64_t)dailyEnergyBurnedStatistics | *((void *)v4 + 24)
    && !-[NSMutableArray isEqual:](dailyEnergyBurnedStatistics, "isEqual:"))
  {
    goto LABEL_124;
  }
  dailyBriskMinutesStatistics = self->_dailyBriskMinutesStatistics;
  if ((unint64_t)dailyBriskMinutesStatistics | *((void *)v4 + 23))
  {
    if (!-[NSMutableArray isEqual:](dailyBriskMinutesStatistics, "isEqual:")) {
      goto LABEL_124;
    }
  }
  $C9169E0A0C311E50A3922DEA03C68203 v10 = self->_has;
  int v11 = *((_DWORD *)v4 + 55);
  if ((*(_DWORD *)&v10 & 0x20000) != 0)
  {
    if ((v11 & 0x20000) == 0 || self->_sequence != *((void *)v4 + 18)) {
      goto LABEL_124;
    }
  }
  else if ((v11 & 0x20000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(unsigned char *)&v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_briskMinutesGoal != *((double *)v4 + 6)) {
      goto LABEL_124;
    }
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_124;
  }
  if ((*(unsigned char *)&v10 & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_activeHoursGoal != *((double *)v4 + 2)) {
      goto LABEL_124;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    if ((v11 & 0x2000) == 0 || self->_moveMinutes != *((double *)v4 + 14)) {
      goto LABEL_124;
    }
  }
  else if ((v11 & 0x2000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    if ((v11 & 0x4000) == 0 || self->_moveMinutesGoal != *((double *)v4 + 15)) {
      goto LABEL_124;
    }
  }
  else if ((v11 & 0x4000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
    if ((v11 & 0x8000) == 0 || self->_moveMinutesGoalDate != *((double *)v4 + 16)) {
      goto LABEL_124;
    }
  }
  else if ((v11 & 0x8000) != 0)
  {
    goto LABEL_124;
  }
  dailyMoveMinutesStatistics = self->_dailyMoveMinutesStatistics;
  if ((unint64_t)dailyMoveMinutesStatistics | *((void *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](dailyMoveMinutesStatistics, "isEqual:")) {
      goto LABEL_124;
    }
    $C9169E0A0C311E50A3922DEA03C68203 v10 = self->_has;
    int v11 = *((_DWORD *)v4 + 55);
  }
  if ((*(unsigned char *)&v10 & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_briskMinutesGoalDate != *((double *)v4 + 7)) {
      goto LABEL_124;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_124;
  }
  if ((*(unsigned char *)&v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_activeHoursGoalDate != *((double *)v4 + 3)) {
      goto LABEL_124;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_124;
  }
  if ((*(unsigned char *)&v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_activityMoveMode != *((void *)v4 + 4)) {
      goto LABEL_124;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&v10 & 0x80000) != 0)
  {
    if ((v11 & 0x80000) == 0 || self->_version != *((void *)v4 + 20)) {
      goto LABEL_124;
    }
  }
  else if ((v11 & 0x80000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&v10 & 0x400000) != 0)
  {
    if ((v11 & 0x400000) != 0)
    {
      if (self->_paused)
      {
        if (!*((unsigned char *)v4 + 216)) {
          goto LABEL_124;
        }
      }
      else if (*((unsigned char *)v4 + 216))
      {
        goto LABEL_124;
      }
      BOOL v13 = 1;
      goto LABEL_125;
    }
LABEL_124:
    BOOL v13 = 0;
    goto LABEL_125;
  }
  BOOL v13 = (v11 & 0x400000) == 0;
LABEL_125:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v98 = [(HDCodableSample *)self->_sample hash];
  $C9169E0A0C311E50A3922DEA03C68203 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    uint64_t v97 = 2654435761 * self->_cacheIndex;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v97 = 0;
  if ((*(_WORD *)&has & 0x200) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double energyBurned = self->_energyBurned;
  double v5 = -energyBurned;
  if (energyBurned >= 0.0) {
    double v5 = self->_energyBurned;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    double briskMinutes = self->_briskMinutes;
    double v11 = -briskMinutes;
    if (briskMinutes >= 0.0) {
      double v11 = self->_briskMinutes;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if (*(unsigned char *)&has)
  {
    double activeHours = self->_activeHours;
    double v16 = -activeHours;
    if (activeHours >= 0.0) {
      double v16 = self->_activeHours;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    uint64_t v94 = 2654435761 * self->_stepCount;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_29;
    }
LABEL_34:
    unint64_t v23 = 0;
    goto LABEL_37;
  }
  uint64_t v94 = 0;
  if ((*(_WORD *)&has & 0x400) == 0) {
    goto LABEL_34;
  }
LABEL_29:
  double energyBurnedGoal = self->_energyBurnedGoal;
  double v20 = -energyBurnedGoal;
  if (energyBurnedGoal >= 0.0) {
    double v20 = self->_energyBurnedGoal;
  }
  long double v21 = floor(v20 + 0.5);
  double v22 = (v20 - v21) * 1.84467441e19;
  unint64_t v23 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
  if (v22 >= 0.0)
  {
    if (v22 > 0.0) {
      v23 += (unint64_t)v22;
    }
  }
  else
  {
    v23 -= (unint64_t)fabs(v22);
  }
LABEL_37:
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    double walkingAndRunningDistance = self->_walkingAndRunningDistance;
    double v26 = -walkingAndRunningDistance;
    if (walkingAndRunningDistance >= 0.0) {
      double v26 = self->_walkingAndRunningDistance;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    double energyBurnedGoalDate = self->_energyBurnedGoalDate;
    double v31 = -energyBurnedGoalDate;
    if (energyBurnedGoalDate >= 0.0) {
      double v31 = self->_energyBurnedGoalDate;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    double deepBreathingDuration = self->_deepBreathingDuration;
    double v36 = -deepBreathingDuration;
    if (deepBreathingDuration >= 0.0) {
      double v36 = self->_deepBreathingDuration;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    uint64_t v91 = 2654435761 * self->_pushCount;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_63;
    }
  }
  else
  {
    uint64_t v91 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
LABEL_63:
      uint64_t v90 = 2654435761 * self->_flightsClimbed;
      goto LABEL_66;
    }
  }
  uint64_t v90 = 0;
LABEL_66:
  unint64_t v95 = v9;
  unint64_t v92 = v34;
  if ((*(_DWORD *)&has & 0x200000) != 0) {
    uint64_t v89 = 2654435761 * self->_wheelchairUse;
  }
  else {
    uint64_t v89 = 0;
  }
  uint64_t v88 = [(NSMutableArray *)self->_dailyEnergyBurnedStatistics hash];
  uint64_t v87 = [(NSMutableArray *)self->_dailyBriskMinutesStatistics hash];
  $C9169E0A0C311E50A3922DEA03C68203 v39 = self->_has;
  if ((*(_DWORD *)&v39 & 0x20000) != 0)
  {
    uint64_t v86 = 2654435761 * self->_sequence;
    if ((*(unsigned char *)&v39 & 0x20) != 0) {
      goto LABEL_71;
    }
LABEL_76:
    unint64_t v44 = 0;
    goto LABEL_79;
  }
  uint64_t v86 = 0;
  if ((*(unsigned char *)&v39 & 0x20) == 0) {
    goto LABEL_76;
  }
LABEL_71:
  double briskMinutesGoal = self->_briskMinutesGoal;
  double v41 = -briskMinutesGoal;
  if (briskMinutesGoal >= 0.0) {
    double v41 = self->_briskMinutesGoal;
  }
  long double v42 = floor(v41 + 0.5);
  double v43 = (v41 - v42) * 1.84467441e19;
  unint64_t v44 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
  if (v43 >= 0.0)
  {
    if (v43 > 0.0) {
      v44 += (unint64_t)v43;
    }
  }
  else
  {
    v44 -= (unint64_t)fabs(v43);
  }
LABEL_79:
  if ((*(unsigned char *)&v39 & 2) != 0)
  {
    double activeHoursGoal = self->_activeHoursGoal;
    double v47 = -activeHoursGoal;
    if (activeHoursGoal >= 0.0) {
      double v47 = self->_activeHoursGoal;
    }
    long double v48 = floor(v47 + 0.5);
    double v49 = (v47 - v48) * 1.84467441e19;
    unint64_t v45 = 2654435761u * (unint64_t)fmod(v48, 1.84467441e19);
    if (v49 >= 0.0)
    {
      if (v49 > 0.0) {
        v45 += (unint64_t)v49;
      }
    }
    else
    {
      v45 -= (unint64_t)fabs(v49);
    }
  }
  else
  {
    unint64_t v45 = 0;
  }
  unint64_t v83 = v45;
  unint64_t v96 = v8;
  if ((*(_WORD *)&v39 & 0x2000) != 0)
  {
    double moveMinutes = self->_moveMinutes;
    double v52 = -moveMinutes;
    if (moveMinutes >= 0.0) {
      double v52 = self->_moveMinutes;
    }
    long double v53 = floor(v52 + 0.5);
    double v54 = (v52 - v53) * 1.84467441e19;
    unint64_t v50 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
    if (v54 >= 0.0)
    {
      if (v54 > 0.0) {
        v50 += (unint64_t)v54;
      }
    }
    else
    {
      v50 -= (unint64_t)fabs(v54);
    }
  }
  else
  {
    unint64_t v50 = 0;
  }
  unint64_t v93 = v14;
  unint64_t v85 = v44;
  if ((*(_WORD *)&v39 & 0x4000) != 0)
  {
    double moveMinutesGoal = self->_moveMinutesGoal;
    double v58 = -moveMinutesGoal;
    if (moveMinutesGoal >= 0.0) {
      double v58 = self->_moveMinutesGoal;
    }
    long double v59 = floor(v58 + 0.5);
    double v60 = (v58 - v59) * 1.84467441e19;
    unint64_t v56 = 2654435761u * (unint64_t)fmod(v59, 1.84467441e19);
    unint64_t v55 = v29;
    if (v60 >= 0.0)
    {
      if (v60 > 0.0) {
        v56 += (unint64_t)v60;
      }
    }
    else
    {
      v56 -= (unint64_t)fabs(v60);
    }
  }
  else
  {
    unint64_t v55 = v29;
    unint64_t v56 = 0;
  }
  unint64_t v61 = v24;
  if ((*(_WORD *)&v39 & 0x8000) != 0)
  {
    double moveMinutesGoalDate = self->_moveMinutesGoalDate;
    double v64 = -moveMinutesGoalDate;
    if (moveMinutesGoalDate >= 0.0) {
      double v64 = self->_moveMinutesGoalDate;
    }
    long double v65 = floor(v64 + 0.5);
    double v66 = (v64 - v65) * 1.84467441e19;
    unint64_t v62 = 2654435761u * (unint64_t)fmod(v65, 1.84467441e19);
    if (v66 >= 0.0)
    {
      if (v66 > 0.0) {
        v62 += (unint64_t)v66;
      }
    }
    else
    {
      v62 -= (unint64_t)fabs(v66);
    }
  }
  else
  {
    unint64_t v62 = 0;
  }
  uint64_t v67 = [(NSMutableArray *)self->_dailyMoveMinutesStatistics hash];
  $C9169E0A0C311E50A3922DEA03C68203 v68 = self->_has;
  if ((*(unsigned char *)&v68 & 0x40) != 0)
  {
    double briskMinutesGoalDate = self->_briskMinutesGoalDate;
    double v71 = -briskMinutesGoalDate;
    if (briskMinutesGoalDate >= 0.0) {
      double v71 = self->_briskMinutesGoalDate;
    }
    long double v72 = floor(v71 + 0.5);
    double v73 = (v71 - v72) * 1.84467441e19;
    unint64_t v69 = 2654435761u * (unint64_t)fmod(v72, 1.84467441e19);
    if (v73 >= 0.0)
    {
      if (v73 > 0.0) {
        v69 += (unint64_t)v73;
      }
    }
    else
    {
      v69 -= (unint64_t)fabs(v73);
    }
  }
  else
  {
    unint64_t v69 = 0;
  }
  if ((*(unsigned char *)&v68 & 4) != 0)
  {
    double activeHoursGoalDate = self->_activeHoursGoalDate;
    double v76 = -activeHoursGoalDate;
    if (activeHoursGoalDate >= 0.0) {
      double v76 = self->_activeHoursGoalDate;
    }
    long double v77 = floor(v76 + 0.5);
    double v78 = (v76 - v77) * 1.84467441e19;
    unint64_t v74 = 2654435761u * (unint64_t)fmod(v77, 1.84467441e19);
    if (v78 >= 0.0)
    {
      if (v78 > 0.0) {
        v74 += (unint64_t)v78;
      }
    }
    else
    {
      v74 -= (unint64_t)fabs(v78);
    }
  }
  else
  {
    unint64_t v74 = 0;
  }
  if ((*(unsigned char *)&v68 & 8) == 0)
  {
    uint64_t v79 = 0;
    if ((*(_DWORD *)&v68 & 0x80000) != 0) {
      goto LABEL_129;
    }
LABEL_132:
    uint64_t v80 = 0;
    if ((*(_DWORD *)&v68 & 0x400000) != 0) {
      goto LABEL_130;
    }
LABEL_133:
    uint64_t v81 = 0;
    return v97 ^ v98 ^ v96 ^ v95 ^ v93 ^ v94 ^ v23 ^ v61 ^ v55 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v50 ^ v56 ^ v62 ^ v67 ^ v69 ^ v74 ^ v79 ^ v80 ^ v81;
  }
  uint64_t v79 = 2654435761 * self->_activityMoveMode;
  if ((*(_DWORD *)&v68 & 0x80000) == 0) {
    goto LABEL_132;
  }
LABEL_129:
  uint64_t v80 = 2654435761 * self->_version;
  if ((*(_DWORD *)&v68 & 0x400000) == 0) {
    goto LABEL_133;
  }
LABEL_130:
  uint64_t v81 = 2654435761 * self->_paused;
  return v97 ^ v98 ^ v96 ^ v95 ^ v93 ^ v94 ^ v23 ^ v61 ^ v55 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v50 ^ v56 ^ v62 ^ v67 ^ v69 ^ v74 ^ v79 ^ v80 ^ v81;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = *((void *)v4 + 26);
  if (sample)
  {
    if (v6) {
      -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HDCodableActivityCache setSample:](self, "setSample:");
  }
  int v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 0x80) != 0)
  {
    self->_cacheIndex = *((void *)v4 + 8);
    *(_DWORD *)&self->_has |= 0x80u;
    int v7 = *((_DWORD *)v4 + 55);
    if ((v7 & 0x200) == 0)
    {
LABEL_8:
      if ((v7 & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_56;
    }
  }
  else if ((v7 & 0x200) == 0)
  {
    goto LABEL_8;
  }
  self->_double energyBurned = *((double *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  int v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 0x10) == 0)
  {
LABEL_9:
    if ((v7 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_double briskMinutes = *((double *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 1) == 0)
  {
LABEL_10:
    if ((v7 & 0x40000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_double activeHours = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 0x40000) == 0)
  {
LABEL_11:
    if ((v7 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_stepCount = *((void *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 0x400) == 0)
  {
LABEL_12:
    if ((v7 & 0x100000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_double energyBurnedGoal = *((double *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  int v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 0x100000) == 0)
  {
LABEL_13:
    if ((v7 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_double walkingAndRunningDistance = *((double *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 0x800) == 0)
  {
LABEL_14:
    if ((v7 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_double energyBurnedGoalDate = *((double *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  int v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 0x100) == 0)
  {
LABEL_15:
    if ((v7 & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_double deepBreathingDuration = *((double *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  int v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 0x10000) == 0)
  {
LABEL_16:
    if ((v7 & 0x1000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_pushCount = *((void *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 0x1000) == 0)
  {
LABEL_17:
    if ((v7 & 0x200000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_64:
  self->_flightsClimbed = *((void *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)v4 + 55) & 0x200000) != 0)
  {
LABEL_18:
    self->_wheelchairUse = *((void *)v4 + 22);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
LABEL_19:
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = *((id *)v4 + 24);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        [(HDCodableActivityCache *)self addDailyEnergyBurnedStatistics:*(void *)(*((void *)&v33 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v10);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = *((id *)v4 + 23);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        [(HDCodableActivityCache *)self addDailyBriskMinutesStatistics:*(void *)(*((void *)&v29 + 1) + 8 * j)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v15);
  }

  int v18 = *((_DWORD *)v4 + 55);
  if ((v18 & 0x20000) != 0)
  {
    self->_sequence = *((void *)v4 + 18);
    *(_DWORD *)&self->_has |= 0x20000u;
    int v18 = *((_DWORD *)v4 + 55);
    if ((v18 & 0x20) == 0)
    {
LABEL_35:
      if ((v18 & 2) == 0) {
        goto LABEL_36;
      }
      goto LABEL_68;
    }
  }
  else if ((v18 & 0x20) == 0)
  {
    goto LABEL_35;
  }
  self->_double briskMinutesGoal = *((double *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v18 = *((_DWORD *)v4 + 55);
  if ((v18 & 2) == 0)
  {
LABEL_36:
    if ((v18 & 0x2000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_double activeHoursGoal = *((double *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v18 = *((_DWORD *)v4 + 55);
  if ((v18 & 0x2000) == 0)
  {
LABEL_37:
    if ((v18 & 0x4000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_double moveMinutes = *((double *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v18 = *((_DWORD *)v4 + 55);
  if ((v18 & 0x4000) == 0)
  {
LABEL_38:
    if ((v18 & 0x8000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_70:
  self->_double moveMinutesGoal = *((double *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v4 + 55) & 0x8000) != 0)
  {
LABEL_39:
    self->_double moveMinutesGoalDate = *((double *)v4 + 16);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_40:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v19 = *((id *)v4 + 25);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        -[HDCodableActivityCache addDailyMoveMinutesStatistics:](self, "addDailyMoveMinutesStatistics:", *(void *)(*((void *)&v25 + 1) + 8 * k), (void)v25);
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v21);
  }

  int v24 = *((_DWORD *)v4 + 55);
  if ((v24 & 0x40) != 0)
  {
    self->_double briskMinutesGoalDate = *((double *)v4 + 7);
    *(_DWORD *)&self->_has |= 0x40u;
    int v24 = *((_DWORD *)v4 + 55);
    if ((v24 & 4) == 0)
    {
LABEL_49:
      if ((v24 & 8) == 0) {
        goto LABEL_50;
      }
      goto LABEL_74;
    }
  }
  else if ((v24 & 4) == 0)
  {
    goto LABEL_49;
  }
  self->_double activeHoursGoalDate = *((double *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v24 = *((_DWORD *)v4 + 55);
  if ((v24 & 8) == 0)
  {
LABEL_50:
    if ((v24 & 0x80000) == 0) {
      goto LABEL_51;
    }
LABEL_75:
    self->_version = *((void *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x80000u;
    if ((*((_DWORD *)v4 + 55) & 0x400000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
LABEL_74:
  self->_activityMoveMode = *((void *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v24 = *((_DWORD *)v4 + 55);
  if ((v24 & 0x80000) != 0) {
    goto LABEL_75;
  }
LABEL_51:
  if ((v24 & 0x400000) != 0)
  {
LABEL_52:
    self->_paused = *((unsigned char *)v4 + 216);
    *(_DWORD *)&self->_has |= 0x400000u;
  }
LABEL_53:
}

- (double)energyBurned
{
  return self->_energyBurned;
}

- (double)energyBurnedGoal
{
  return self->_energyBurnedGoal;
}

- (double)walkingAndRunningDistance
{
  return self->_walkingAndRunningDistance;
}

- (NSMutableArray)dailyEnergyBurnedStatistics
{
  return self->_dailyEnergyBurnedStatistics;
}

- (void)setDailyEnergyBurnedStatistics:(id)a3
{
}

- (NSMutableArray)dailyBriskMinutesStatistics
{
  return self->_dailyBriskMinutesStatistics;
}

- (void)setDailyBriskMinutesStatistics:(id)a3
{
}

- (int64_t)sequence
{
  return self->_sequence;
}

- (double)briskMinutesGoal
{
  return self->_briskMinutesGoal;
}

- (double)activeHoursGoal
{
  return self->_activeHoursGoal;
}

- (double)moveMinutes
{
  return self->_moveMinutes;
}

- (double)moveMinutesGoal
{
  return self->_moveMinutesGoal;
}

- (double)moveMinutesGoalDate
{
  return self->_moveMinutesGoalDate;
}

- (NSMutableArray)dailyMoveMinutesStatistics
{
  return self->_dailyMoveMinutesStatistics;
}

- (void)setDailyMoveMinutesStatistics:(id)a3
{
}

- (double)briskMinutesGoalDate
{
  return self->_briskMinutesGoalDate;
}

- (double)activeHoursGoalDate
{
  return self->_activeHoursGoalDate;
}

- (int64_t)activityMoveMode
{
  return self->_activityMoveMode;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)paused
{
  return self->_paused;
}

@end