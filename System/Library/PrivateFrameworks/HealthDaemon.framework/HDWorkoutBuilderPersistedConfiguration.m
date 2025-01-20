@interface HDWorkoutBuilderPersistedConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldCollectWorkoutEvents;
- (HDDeviceEntity)deviceEntity;
- (HDSourceEntity)sourceEntity;
- (HKQuantity)goal;
- (HKWorkoutConfiguration)workoutConfiguration;
- (NSString)sourceVersion;
- (NSUUID)builderIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)goalType;
- (unint64_t)hash;
- (void)setBuilderIdentifier:(id)a3;
- (void)setDeviceEntity:(id)a3;
- (void)setGoal:(id)a3;
- (void)setGoalType:(unint64_t)a3;
- (void)setShouldCollectWorkoutEvents:(BOOL)a3;
- (void)setSourceEntity:(id)a3;
- (void)setSourceVersion:(id)a3;
- (void)setWorkoutConfiguration:(id)a3;
@end

@implementation HDWorkoutBuilderPersistedConfiguration

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![(NSUUID *)self->_builderIdentifier isEqual:*((void *)v4 + 2)]) {
    goto LABEL_12;
  }
  if (![(HKWorkoutConfiguration *)self->_workoutConfiguration isEqual:*((void *)v4 + 3)]) {
    goto LABEL_12;
  }
  int64_t v5 = [(HDSQLiteEntity *)self->_sourceEntity persistentID];
  if (v5 != [*((id *)v4 + 4) persistentID]) {
    goto LABEL_12;
  }
  int64_t v6 = [(HDSQLiteEntity *)self->_deviceEntity persistentID];
  if (v6 != [*((id *)v4 + 6) persistentID]) {
    goto LABEL_12;
  }
  sourceVersion = self->_sourceVersion;
  v8 = (NSString *)*((void *)v4 + 5);
  if (sourceVersion != v8 && (!v8 || !-[NSString isEqual:](sourceVersion, "isEqual:"))) {
    goto LABEL_12;
  }
  if (self->_goalType != *((void *)v4 + 7)) {
    goto LABEL_12;
  }
  goal = self->_goal;
  v10 = (HKQuantity *)*((void *)v4 + 8);
  if (goal == v10)
  {
    char v11 = 1;
    goto LABEL_13;
  }
  if (v10) {
    char v11 = -[HKQuantity isEqual:](goal, "isEqual:");
  }
  else {
LABEL_12:
  }
    char v11 = 0;
LABEL_13:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(HDWorkoutBuilderPersistedConfiguration);
  [(HDWorkoutBuilderPersistedConfiguration *)v4 setBuilderIdentifier:self->_builderIdentifier];
  [(HDWorkoutBuilderPersistedConfiguration *)v4 setWorkoutConfiguration:self->_workoutConfiguration];
  [(HDWorkoutBuilderPersistedConfiguration *)v4 setSourceEntity:self->_sourceEntity];
  [(HDWorkoutBuilderPersistedConfiguration *)v4 setSourceVersion:self->_sourceVersion];
  [(HDWorkoutBuilderPersistedConfiguration *)v4 setDeviceEntity:self->_deviceEntity];
  [(HDWorkoutBuilderPersistedConfiguration *)v4 setGoalType:self->_goalType];
  [(HDWorkoutBuilderPersistedConfiguration *)v4 setGoal:self->_goal];
  [(HDWorkoutBuilderPersistedConfiguration *)v4 setShouldCollectWorkoutEvents:self->_shouldCollectWorkoutEvents];
  return v4;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_builderIdentifier hash];
}

- (NSUUID)builderIdentifier
{
  return self->_builderIdentifier;
}

- (void)setBuilderIdentifier:(id)a3
{
}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return self->_workoutConfiguration;
}

- (void)setWorkoutConfiguration:(id)a3
{
}

- (HDSourceEntity)sourceEntity
{
  return self->_sourceEntity;
}

- (void)setSourceEntity:(id)a3
{
}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (void)setSourceVersion:(id)a3
{
}

- (HDDeviceEntity)deviceEntity
{
  return self->_deviceEntity;
}

- (void)setDeviceEntity:(id)a3
{
}

- (unint64_t)goalType
{
  return self->_goalType;
}

- (void)setGoalType:(unint64_t)a3
{
  self->_goalType = a3;
}

- (HKQuantity)goal
{
  return self->_goal;
}

- (void)setGoal:(id)a3
{
}

- (BOOL)shouldCollectWorkoutEvents
{
  return self->_shouldCollectWorkoutEvents;
}

- (void)setShouldCollectWorkoutEvents:(BOOL)a3
{
  self->_shouldCollectWorkoutEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goal, 0);
  objc_storeStrong((id *)&self->_deviceEntity, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_sourceEntity, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);

  objc_storeStrong((id *)&self->_builderIdentifier, 0);
}

@end