@interface HDCodableWorkout
+ (Class)eventsType;
+ (Class)subActivitiesType;
- (BOOL)applyToObject:(id)a3;
- (BOOL)hasDuration;
- (BOOL)hasGoal;
- (BOOL)hasGoalType;
- (BOOL)hasPrimaryActivity;
- (BOOL)hasSample;
- (BOOL)hasTotalBasalEnergyBurnedInCanonicalUnit;
- (BOOL)hasTotalDistanceInCanonicalUnit;
- (BOOL)hasTotalEnergyBurnedInCanonicalUnit;
- (BOOL)hasTotalFlightsClimbedInCanonicalUnit;
- (BOOL)hasTotalSwimmingStrokeCountInCanonicalUnit;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (HDCodableWorkoutActivity)primaryActivity;
- (NSMutableArray)events;
- (NSMutableArray)subActivities;
- (NSString)description;
- (double)duration;
- (double)goal;
- (double)totalBasalEnergyBurnedInCanonicalUnit;
- (double)totalDistanceInCanonicalUnit;
- (double)totalEnergyBurnedInCanonicalUnit;
- (double)totalFlightsClimbedInCanonicalUnit;
- (double)totalSwimmingStrokeCountInCanonicalUnit;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)eventsAtIndex:(unint64_t)a3;
- (id)subActivitiesAtIndex:(unint64_t)a3;
- (int64_t)goalType;
- (int64_t)type;
- (unint64_t)eventsCount;
- (unint64_t)hash;
- (unint64_t)subActivitiesCount;
- (void)addEvents:(id)a3;
- (void)addSubActivities:(id)a3;
- (void)clearEvents;
- (void)clearSubActivities;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEvents:(id)a3;
- (void)setGoal:(double)a3;
- (void)setGoalType:(int64_t)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasGoal:(BOOL)a3;
- (void)setHasGoalType:(BOOL)a3;
- (void)setHasTotalBasalEnergyBurnedInCanonicalUnit:(BOOL)a3;
- (void)setHasTotalDistanceInCanonicalUnit:(BOOL)a3;
- (void)setHasTotalEnergyBurnedInCanonicalUnit:(BOOL)a3;
- (void)setHasTotalFlightsClimbedInCanonicalUnit:(BOOL)a3;
- (void)setHasTotalSwimmingStrokeCountInCanonicalUnit:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setPrimaryActivity:(id)a3;
- (void)setSample:(id)a3;
- (void)setSubActivities:(id)a3;
- (void)setTotalBasalEnergyBurnedInCanonicalUnit:(double)a3;
- (void)setTotalDistanceInCanonicalUnit:(double)a3;
- (void)setTotalEnergyBurnedInCanonicalUnit:(double)a3;
- (void)setTotalFlightsClimbedInCanonicalUnit:(double)a3;
- (void)setTotalSwimmingStrokeCountInCanonicalUnit:(double)a3;
- (void)setType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableWorkout

- (void)setSample:(id)a3
{
}

- (void)setType:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_type = a3;
}

- (void)setDuration:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setTotalEnergyBurnedInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_totalEnergyBurnedInCanonicalUnit = a3;
}

- (void)setTotalBasalEnergyBurnedInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_totalBasalEnergyBurnedInCanonicalUnit = a3;
}

- (void)setTotalDistanceInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_totalDistanceInCanonicalUnit = a3;
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_sample) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    PBDataWriterWriteInt64Field();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = self->_events;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_14:
      if ((has & 0x10) == 0) {
        goto LABEL_15;
      }
      goto LABEL_33;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_16:
    if ((has & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_17:
    if ((has & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_19:
    if ((has & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_37:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_20:
  }
    PBDataWriterWriteDoubleField();
LABEL_21:
  if (self->_primaryActivity) {
    PBDataWriterWriteSubmessage();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = self->_subActivities;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subActivities, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_primaryActivity, 0);

  objc_storeStrong((id *)&self->_events, 0);
}

- (BOOL)applyToObject:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(HDCodableWorkout *)self sample],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 applyToObject:v4],
        v5,
        v6)
    && _HKWorkoutActivityTypeIsValid())
  {
    [v4 _setWorkoutActivityType:self->_type];
    [v4 _setDuration:self->_duration];
    if ([(NSMutableArray *)self->_events count])
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      uint64_t v8 = self->_events;
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v63 objects:v68 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v64 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = [MEMORY[0x1E4F2B798] createWithCodable:*(void *)(*((void *)&v63 + 1) + 8 * i)];
            if (v13) {
              [v7 addObject:v13];
            }
          }
          uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v63 objects:v68 count:16];
        }
        while (v10);
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    [v4 _setWorkoutEvents:v7];

    long long v16 = [MEMORY[0x1E4F2B720] createWithCodable:self->_primaryActivity];
    if (!v16)
    {
      [v4 workoutActivityType];
      long long v17 = [v4 metadata];
      long long v18 = _HKWorkoutConfigurationWithActivityTypeAndMetadata();

      id v19 = objc_alloc(MEMORY[0x1E4F2B720]);
      long long v20 = [v4 UUID];
      long long v21 = [v4 startDate];
      long long v22 = [v4 endDate];
      long long v23 = [v4 workoutEvents];
      [v4 duration];
      long long v16 = objc_msgSend(v19, "_initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:", v20, v18, v21, v22, v23, 0, 0, 0);
    }
    [v4 _setPrimaryActivity:v16];
    if ([(NSMutableArray *)self->_subActivities count])
    {
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      v25 = self->_subActivities;
      uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v63 objects:v68 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v64;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v64 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = [MEMORY[0x1E4F2B720] createWithCodable:*(void *)(*((void *)&v63 + 1) + 8 * j)];
            if (v30) {
              [v24 addObject:v30];
            }
          }
          uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v63 objects:v68 count:16];
        }
        while (v27);
      }
    }
    else
    {
      id v24 = 0;
    }
    [v4 _setSubActivities:v24];

    v31 = [v4 workoutEvents];
    uint64_t v32 = [v31 count];

    if (v32)
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      v33 = [v4 _subActivities];
      uint64_t v34 = [v33 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v60;
        do
        {
          for (uint64_t k = 0; k != v35; ++k)
          {
            if (*(void *)v60 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = *(void **)(*((void *)&v59 + 1) + 8 * k);
            v39 = [v4 workoutEvents];
            [v38 _filterAndSetWorkoutEvents:v39];
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v59 objects:v67 count:16];
        }
        while (v35);
      }
    }
    if ([(HDCodableWorkout *)self hasTotalEnergyBurnedInCanonicalUnit])
    {
      if ((*(_WORD *)&self->_has & 0x20) != 0)
      {
        v41 = (void *)MEMORY[0x1E4F2B370];
        v42 = _HKWorkoutCanonicalEnergyBurnedUnit();
        v40 = [v41 quantityWithUnit:v42 doubleValue:self->_totalEnergyBurnedInCanonicalUnit];
      }
      else
      {
        v40 = 0;
      }
      [v4 _setTotalEnergyBurned:v40];
    }
    if ([(HDCodableWorkout *)self hasTotalBasalEnergyBurnedInCanonicalUnit])
    {
      if ((*(_WORD *)&self->_has & 8) != 0)
      {
        v44 = (void *)MEMORY[0x1E4F2B370];
        v45 = _HKWorkoutCanonicalEnergyBurnedUnit();
        v43 = [v44 quantityWithUnit:v45 doubleValue:self->_totalBasalEnergyBurnedInCanonicalUnit];
      }
      else
      {
        v43 = 0;
      }
      [v4 _setTotalBasalEnergyBurned:v43];
    }
    if ([(HDCodableWorkout *)self hasTotalDistanceInCanonicalUnit])
    {
      if ((*(_WORD *)&self->_has & 0x10) != 0)
      {
        v47 = (void *)MEMORY[0x1E4F2B370];
        v48 = _HKWorkoutCanonicalDistanceUnit();
        v46 = [v47 quantityWithUnit:v48 doubleValue:self->_totalDistanceInCanonicalUnit];
      }
      else
      {
        v46 = 0;
      }
      [v4 _setTotalDistance:v46];
    }
    if ([(HDCodableWorkout *)self hasTotalSwimmingStrokeCountInCanonicalUnit])
    {
      if ((*(_WORD *)&self->_has & 0x80) != 0)
      {
        v50 = (void *)MEMORY[0x1E4F2B370];
        v51 = _HKWorkoutCanonicalSwimmingStrokeCountUnit();
        v49 = [v50 quantityWithUnit:v51 doubleValue:self->_totalSwimmingStrokeCountInCanonicalUnit];
      }
      else
      {
        v49 = 0;
      }
      [v4 _setTotalSwimmingStrokeCount:v49];
    }
    if ([(HDCodableWorkout *)self hasTotalFlightsClimbedInCanonicalUnit])
    {
      if ((*(_WORD *)&self->_has & 0x40) != 0)
      {
        v53 = (void *)MEMORY[0x1E4F2B370];
        v54 = _HKWorkoutCanonicalFlightsClimbedUnit();
        v52 = [v53 quantityWithUnit:v54 doubleValue:self->_totalFlightsClimbedInCanonicalUnit];
      }
      else
      {
        v52 = 0;
      }
      [v4 _setTotalFlightsClimbed:v52];
    }
    if ([(HDCodableWorkout *)self hasGoalType])
    {
      if ((*(_WORD *)&self->_has & 4) != 0) {
        int64_t goalType = self->_goalType;
      }
      else {
        int64_t goalType = 0;
      }
      [v4 _setGoalType:goalType];
    }
    if ([(HDCodableWorkout *)self hasGoal])
    {
      if ((~*(_WORD *)&self->_has & 6) != 0)
      {
        v58 = 0;
      }
      else
      {
        v56 = (void *)MEMORY[0x1E4F2B370];
        v57 = _HKWorkoutCanonicalUnitForGoalType();
        v58 = [v56 quantityWithUnit:v57 doubleValue:self->_goal];
      }
      [v4 _setGoal:v58];
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)clearEvents
{
}

- (void)addEvents:(id)a3
{
  id v4 = a3;
  events = self->_events;
  id v8 = v4;
  if (!events)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_events;
    self->_events = v6;

    id v4 = v8;
    events = self->_events;
  }
  [(NSMutableArray *)events addObject:v4];
}

- (unint64_t)eventsCount
{
  return [(NSMutableArray *)self->_events count];
}

- (id)eventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_events objectAtIndex:a3];
}

+ (Class)eventsType
{
  return (Class)objc_opt_class();
}

- (void)setHasDuration:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasTotalEnergyBurnedInCanonicalUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTotalEnergyBurnedInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasTotalDistanceInCanonicalUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTotalDistanceInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setGoalType:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_int64_t goalType = a3;
}

- (void)setHasGoalType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGoalType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setGoal:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_goal = a3;
}

- (void)setHasGoal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasGoal
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasTotalBasalEnergyBurnedInCanonicalUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTotalBasalEnergyBurnedInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTotalSwimmingStrokeCountInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_totalSwimmingStrokeCountInCanonicalUnit = a3;
}

- (void)setHasTotalSwimmingStrokeCountInCanonicalUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTotalSwimmingStrokeCountInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTotalFlightsClimbedInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_totalFlightsClimbedInCanonicalUnit = a3;
}

- (void)setHasTotalFlightsClimbedInCanonicalUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTotalFlightsClimbedInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasPrimaryActivity
{
  return self->_primaryActivity != 0;
}

- (void)clearSubActivities
{
}

- (void)addSubActivities:(id)a3
{
  id v4 = a3;
  subActivities = self->_subActivities;
  id v8 = v4;
  if (!subActivities)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_subActivities;
    self->_subActivities = v6;

    id v4 = v8;
    subActivities = self->_subActivities;
  }
  [(NSMutableArray *)subActivities addObject:v4];
}

- (unint64_t)subActivitiesCount
{
  return [(NSMutableArray *)self->_subActivities count];
}

- (id)subActivitiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_subActivities objectAtIndex:a3];
}

+ (Class)subActivitiesType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableWorkout;
  id v4 = [(HDCodableWorkout *)&v8 description];
  v5 = [(HDCodableWorkout *)self dictionaryRepresentation];
  int v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sample = self->_sample;
  if (sample)
  {
    v5 = [(HDCodableSample *)sample dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sample"];
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    int v6 = [NSNumber numberWithLongLong:self->_type];
    [v3 setObject:v6 forKey:@"type"];
  }
  if ([(NSMutableArray *)self->_events count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_events, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    objc_super v8 = self->_events;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v37 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"events"];
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v26 = [NSNumber numberWithDouble:self->_duration];
    [v3 setObject:v26 forKey:@"duration"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_16:
      if ((has & 0x10) == 0) {
        goto LABEL_17;
      }
      goto LABEL_39;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_16;
  }
  uint64_t v27 = [NSNumber numberWithDouble:self->_totalEnergyBurnedInCanonicalUnit];
  [v3 setObject:v27 forKey:@"totalEnergyBurnedInCanonicalUnit"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_17:
    if ((has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v28 = [NSNumber numberWithDouble:self->_totalDistanceInCanonicalUnit];
  [v3 setObject:v28 forKey:@"totalDistanceInCanonicalUnit"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_18:
    if ((has & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  v29 = [NSNumber numberWithLongLong:self->_goalType];
  [v3 setObject:v29 forKey:@"goalType"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_19:
    if ((has & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  v30 = [NSNumber numberWithDouble:self->_goal];
  [v3 setObject:v30 forKey:@"goal"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_20:
    if ((has & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  v31 = [NSNumber numberWithDouble:self->_totalBasalEnergyBurnedInCanonicalUnit];
  [v3 setObject:v31 forKey:@"totalBasalEnergyBurnedInCanonicalUnit"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_21:
    if ((has & 0x40) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_43:
  uint64_t v32 = [NSNumber numberWithDouble:self->_totalSwimmingStrokeCountInCanonicalUnit];
  [v3 setObject:v32 forKey:@"totalSwimmingStrokeCountInCanonicalUnit"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_22:
    uint64_t v15 = [NSNumber numberWithDouble:self->_totalFlightsClimbedInCanonicalUnit];
    [v3 setObject:v15 forKey:@"totalFlightsClimbedInCanonicalUnit"];
  }
LABEL_23:
  primaryActivity = self->_primaryActivity;
  if (primaryActivity)
  {
    long long v17 = [(HDCodableWorkoutActivity *)primaryActivity dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"primaryActivity"];
  }
  if ([(NSMutableArray *)self->_subActivities count])
  {
    long long v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_subActivities, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v19 = self->_subActivities;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "dictionaryRepresentation", (void)v33);
          [v18 addObject:v24];
        }
        uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKey:@"subActivities"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    id v4 = v14;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((void *)v4 + 9) = self->_type;
    *((_WORD *)v4 + 56) |= 0x100u;
  }
  if ([(HDCodableWorkout *)self eventsCount])
  {
    [v14 clearEvents];
    unint64_t v5 = [(HDCodableWorkout *)self eventsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        objc_super v8 = [(HDCodableWorkout *)self eventsAtIndex:i];
        [v14 addEvents:v8];
      }
    }
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)v14 + 1) = *(void *)&self->_duration;
    *((_WORD *)v14 + 56) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_11:
      if ((has & 0x10) == 0) {
        goto LABEL_12;
      }
      goto LABEL_29;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_11;
  }
  *((void *)v14 + 6) = *(void *)&self->_totalEnergyBurnedInCanonicalUnit;
  *((_WORD *)v14 + 56) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)v14 + 5) = *(void *)&self->_totalDistanceInCanonicalUnit;
  *((_WORD *)v14 + 56) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)v14 + 3) = self->_goalType;
  *((_WORD *)v14 + 56) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((void *)v14 + 2) = *(void *)&self->_goal;
  *((_WORD *)v14 + 56) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)v14 + 4) = *(void *)&self->_totalBasalEnergyBurnedInCanonicalUnit;
  *((_WORD *)v14 + 56) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_16:
    if ((has & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_33:
  *((void *)v14 + 8) = *(void *)&self->_totalSwimmingStrokeCountInCanonicalUnit;
  *((_WORD *)v14 + 56) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_17:
    *((void *)v14 + 7) = *(void *)&self->_totalFlightsClimbedInCanonicalUnit;
    *((_WORD *)v14 + 56) |= 0x40u;
  }
LABEL_18:
  if (self->_primaryActivity) {
    objc_msgSend(v14, "setPrimaryActivity:");
  }
  if ([(HDCodableWorkout *)self subActivitiesCount])
  {
    [v14 clearSubActivities];
    unint64_t v10 = [(HDCodableWorkout *)self subActivitiesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(HDCodableWorkout *)self subActivitiesAtIndex:j];
        [v14 addSubActivities:v13];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v6;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(void *)(v5 + 72) = self->_type;
    *(_WORD *)(v5 + 112) |= 0x100u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  objc_super v8 = self->_events;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * v12) copyWithZone:a3];
        [(id)v5 addEvents:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v10);
  }

  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_duration;
    *(_WORD *)(v5 + 112) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_12:
      if ((has & 0x10) == 0) {
        goto LABEL_13;
      }
      goto LABEL_29;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_12;
  }
  *(double *)(v5 + 48) = self->_totalEnergyBurnedInCanonicalUnit;
  *(_WORD *)(v5 + 112) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(double *)(v5 + 40) = self->_totalDistanceInCanonicalUnit;
  *(_WORD *)(v5 + 112) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(void *)(v5 + 24) = self->_goalType;
  *(_WORD *)(v5 + 112) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(double *)(v5 + 16) = self->_goal;
  *(_WORD *)(v5 + 112) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_16:
    if ((has & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(double *)(v5 + 32) = self->_totalBasalEnergyBurnedInCanonicalUnit;
  *(_WORD *)(v5 + 112) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_33:
  *(double *)(v5 + 64) = self->_totalSwimmingStrokeCountInCanonicalUnit;
  *(_WORD *)(v5 + 112) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_18:
    *(double *)(v5 + 56) = self->_totalFlightsClimbedInCanonicalUnit;
    *(_WORD *)(v5 + 112) |= 0x40u;
  }
LABEL_19:
  id v15 = [(HDCodableWorkoutActivity *)self->_primaryActivity copyWithZone:a3];
  long long v16 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v15;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v17 = self->_subActivities;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v21), "copyWithZone:", a3, (void)v24);
        [(id)v5 addSubActivities:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v19);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_56;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 12))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:")) {
      goto LABEL_56;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 56);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x100) == 0 || self->_type != *((void *)v4 + 9)) {
      goto LABEL_56;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x100) != 0)
  {
    goto LABEL_56;
  }
  events = self->_events;
  if ((unint64_t)events | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](events, "isEqual:"))
    {
LABEL_56:
      char v11 = 0;
      goto LABEL_57;
    }
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)v4 + 56);
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_duration != *((double *)v4 + 1)) {
      goto LABEL_56;
    }
  }
  else if (v7)
  {
    goto LABEL_56;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_totalEnergyBurnedInCanonicalUnit != *((double *)v4 + 6)) {
      goto LABEL_56;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_totalDistanceInCanonicalUnit != *((double *)v4 + 5)) {
      goto LABEL_56;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_goalType != *((void *)v4 + 3)) {
      goto LABEL_56;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_goal != *((double *)v4 + 2)) {
      goto LABEL_56;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_totalBasalEnergyBurnedInCanonicalUnit != *((double *)v4 + 4)) {
      goto LABEL_56;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_totalSwimmingStrokeCountInCanonicalUnit != *((double *)v4 + 8)) {
      goto LABEL_56;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_totalFlightsClimbedInCanonicalUnit != *((double *)v4 + 7)) {
      goto LABEL_56;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_56;
  }
  primaryActivity = self->_primaryActivity;
  if ((unint64_t)primaryActivity | *((void *)v4 + 11)
    && !-[HDCodableWorkoutActivity isEqual:](primaryActivity, "isEqual:"))
  {
    goto LABEL_56;
  }
  subActivities = self->_subActivities;
  if ((unint64_t)subActivities | *((void *)v4 + 13)) {
    char v11 = -[NSMutableArray isEqual:](subActivities, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_57:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v44 = [(HDCodableSample *)self->_sample hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v43 = 2654435761 * self->_type;
  }
  else {
    uint64_t v43 = 0;
  }
  uint64_t v42 = [(NSMutableArray *)self->_events hash];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    double duration = self->_duration;
    double v6 = -duration;
    if (duration >= 0.0) {
      double v6 = self->_duration;
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
  if ((has & 0x20) != 0)
  {
    double totalEnergyBurnedInCanonicalUnit = self->_totalEnergyBurnedInCanonicalUnit;
    double v11 = -totalEnergyBurnedInCanonicalUnit;
    if (totalEnergyBurnedInCanonicalUnit >= 0.0) {
      double v11 = self->_totalEnergyBurnedInCanonicalUnit;
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
  if ((has & 0x10) != 0)
  {
    double totalDistanceInCanonicalUnit = self->_totalDistanceInCanonicalUnit;
    double v16 = -totalDistanceInCanonicalUnit;
    if (totalDistanceInCanonicalUnit >= 0.0) {
      double v16 = self->_totalDistanceInCanonicalUnit;
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
  if ((has & 4) != 0)
  {
    uint64_t v19 = 2654435761 * self->_goalType;
    if ((has & 2) != 0) {
      goto LABEL_30;
    }
LABEL_35:
    unint64_t v24 = 0;
    goto LABEL_38;
  }
  uint64_t v19 = 0;
  if ((has & 2) == 0) {
    goto LABEL_35;
  }
LABEL_30:
  double goal = self->_goal;
  double v21 = -goal;
  if (goal >= 0.0) {
    double v21 = self->_goal;
  }
  long double v22 = floor(v21 + 0.5);
  double v23 = (v21 - v22) * 1.84467441e19;
  unint64_t v24 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
  if (v23 >= 0.0)
  {
    if (v23 > 0.0) {
      v24 += (unint64_t)v23;
    }
  }
  else
  {
    v24 -= (unint64_t)fabs(v23);
  }
LABEL_38:
  if ((has & 8) != 0)
  {
    double totalBasalEnergyBurnedInCanonicalUnit = self->_totalBasalEnergyBurnedInCanonicalUnit;
    double v27 = -totalBasalEnergyBurnedInCanonicalUnit;
    if (totalBasalEnergyBurnedInCanonicalUnit >= 0.0) {
      double v27 = self->_totalBasalEnergyBurnedInCanonicalUnit;
    }
    long double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    unint64_t v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v25 += (unint64_t)v29;
      }
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    unint64_t v25 = 0;
  }
  if ((has & 0x80) != 0)
  {
    double totalSwimmingStrokeCountInCanonicalUnit = self->_totalSwimmingStrokeCountInCanonicalUnit;
    double v32 = -totalSwimmingStrokeCountInCanonicalUnit;
    if (totalSwimmingStrokeCountInCanonicalUnit >= 0.0) {
      double v32 = self->_totalSwimmingStrokeCountInCanonicalUnit;
    }
    long double v33 = floor(v32 + 0.5);
    double v34 = (v32 - v33) * 1.84467441e19;
    unint64_t v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0) {
        v30 += (unint64_t)v34;
      }
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    unint64_t v30 = 0;
  }
  if ((has & 0x40) != 0)
  {
    double totalFlightsClimbedInCanonicalUnit = self->_totalFlightsClimbedInCanonicalUnit;
    double v37 = -totalFlightsClimbedInCanonicalUnit;
    if (totalFlightsClimbedInCanonicalUnit >= 0.0) {
      double v37 = self->_totalFlightsClimbedInCanonicalUnit;
    }
    long double v38 = floor(v37 + 0.5);
    double v39 = (v37 - v38) * 1.84467441e19;
    unint64_t v35 = 2654435761u * (unint64_t)fmod(v38, 1.84467441e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0) {
        v35 += (unint64_t)v39;
      }
    }
    else
    {
      v35 -= (unint64_t)fabs(v39);
    }
  }
  else
  {
    unint64_t v35 = 0;
  }
  unint64_t v40 = v9 ^ v14 ^ v19 ^ v24 ^ v25 ^ v30 ^ v35 ^ [(HDCodableWorkoutActivity *)self->_primaryActivity hash];
  return v43 ^ v44 ^ v42 ^ v4 ^ v40 ^ [(NSMutableArray *)self->_subActivities hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = *((void *)v4 + 12);
  if (sample)
  {
    if (v6) {
      -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HDCodableWorkout setSample:](self, "setSample:");
  }
  if ((*((_WORD *)v4 + 56) & 0x100) != 0)
  {
    self->_type = *((void *)v4 + 9);
    *(_WORD *)&self->_has |= 0x100u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = *((id *)v4 + 10);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        [(HDCodableWorkout *)self addEvents:*(void *)(*((void *)&v24 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  __int16 v12 = *((_WORD *)v4 + 56);
  if (v12)
  {
    self->_double duration = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v12 = *((_WORD *)v4 + 56);
    if ((v12 & 0x20) == 0)
    {
LABEL_17:
      if ((v12 & 0x10) == 0) {
        goto LABEL_18;
      }
      goto LABEL_29;
    }
  }
  else if ((v12 & 0x20) == 0)
  {
    goto LABEL_17;
  }
  self->_double totalEnergyBurnedInCanonicalUnit = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v12 = *((_WORD *)v4 + 56);
  if ((v12 & 0x10) == 0)
  {
LABEL_18:
    if ((v12 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_double totalDistanceInCanonicalUnit = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v12 = *((_WORD *)v4 + 56);
  if ((v12 & 4) == 0)
  {
LABEL_19:
    if ((v12 & 2) == 0) {
      goto LABEL_20;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_int64_t goalType = *((void *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v12 = *((_WORD *)v4 + 56);
  if ((v12 & 2) == 0)
  {
LABEL_20:
    if ((v12 & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_double goal = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v12 = *((_WORD *)v4 + 56);
  if ((v12 & 8) == 0)
  {
LABEL_21:
    if ((v12 & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_double totalBasalEnergyBurnedInCanonicalUnit = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v12 = *((_WORD *)v4 + 56);
  if ((v12 & 0x80) == 0)
  {
LABEL_22:
    if ((v12 & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_33:
  self->_double totalSwimmingStrokeCountInCanonicalUnit = *((double *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 56) & 0x40) != 0)
  {
LABEL_23:
    self->_double totalFlightsClimbedInCanonicalUnit = *((double *)v4 + 7);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_24:
  primaryActivity = self->_primaryActivity;
  uint64_t v14 = *((void *)v4 + 11);
  if (primaryActivity)
  {
    if (v14) {
      -[HDCodableWorkoutActivity mergeFrom:](primaryActivity, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[HDCodableWorkout setPrimaryActivity:](self, "setPrimaryActivity:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = *((id *)v4 + 13);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[HDCodableWorkout addSubActivities:](self, "addSubActivities:", *(void *)(*((void *)&v20 + 1) + 8 * j), (void)v20);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (int64_t)type
{
  return self->_type;
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (double)totalEnergyBurnedInCanonicalUnit
{
  return self->_totalEnergyBurnedInCanonicalUnit;
}

- (double)totalDistanceInCanonicalUnit
{
  return self->_totalDistanceInCanonicalUnit;
}

- (int64_t)goalType
{
  return self->_goalType;
}

- (double)goal
{
  return self->_goal;
}

- (double)totalBasalEnergyBurnedInCanonicalUnit
{
  return self->_totalBasalEnergyBurnedInCanonicalUnit;
}

- (double)totalSwimmingStrokeCountInCanonicalUnit
{
  return self->_totalSwimmingStrokeCountInCanonicalUnit;
}

- (double)totalFlightsClimbedInCanonicalUnit
{
  return self->_totalFlightsClimbedInCanonicalUnit;
}

- (HDCodableWorkoutActivity)primaryActivity
{
  return self->_primaryActivity;
}

- (void)setPrimaryActivity:(id)a3
{
}

- (NSMutableArray)subActivities
{
  return self->_subActivities;
}

- (void)setSubActivities:(id)a3
{
}

@end