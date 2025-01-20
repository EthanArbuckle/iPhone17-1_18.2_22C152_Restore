@interface HKWorkoutBuilderConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresRecovery;
- (BOOL)shouldCollectWorkoutEvents;
- (HKDevice)device;
- (HKQuantity)goal;
- (HKWorkoutBuilderConfiguration)initWithCoder:(id)a3;
- (HKWorkoutConfiguration)workoutConfiguration;
- (NSUUID)associatedSessionUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)goalType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedSessionUUID:(id)a3;
- (void)setDevice:(id)a3;
- (void)setGoal:(id)a3;
- (void)setGoalType:(unint64_t)a3;
- (void)setRequiresRecovery:(BOOL)a3;
- (void)setShouldCollectWorkoutEvents:(BOOL)a3;
- (void)setWorkoutConfiguration:(id)a3;
@end

@implementation HKWorkoutBuilderConfiguration

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_17;
  }
  device = self->_device;
  v6 = (HKDevice *)v4[2];
  if (device != v6 && (!v6 || !-[HKDevice isEqual:](device, "isEqual:"))) {
    goto LABEL_17;
  }
  if (((workoutConfiguration = self->_workoutConfiguration,
         v8 = (HKWorkoutConfiguration *)v4[3],
         workoutConfiguration == v8)
     || v8 && -[HKWorkoutConfiguration isEqual:](workoutConfiguration, "isEqual:"))
    && self->_goalType == v4[4]
    && ((goal = self->_goal, v10 = (HKQuantity *)v4[5], goal == v10) || v10 && -[HKQuantity isEqual:](goal, "isEqual:"))
    && self->_shouldCollectWorkoutEvents == *((unsigned __int8 *)v4 + 8)
    && ((associatedSessionUUID = self->_associatedSessionUUID, v12 = (NSUUID *)v4[6], associatedSessionUUID == v12)
     || v12 && -[NSUUID isEqual:](associatedSessionUUID, "isEqual:")))
  {
    BOOL v13 = self->_requiresRecovery == *((unsigned __int8 *)v4 + 9);
  }
  else
  {
LABEL_17:
    BOOL v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKDevice *)self->_device hash];
  unint64_t v4 = [(HKWorkoutConfiguration *)self->_workoutConfiguration hash] ^ v3;
  unint64_t goalType = self->_goalType;
  return v4 ^ goalType ^ [(HKQuantity *)self->_goal hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKWorkoutBuilderConfiguration;
  id v4 = [(HKTaskConfiguration *)&v7 copyWithZone:a3];
  [v4 setDevice:self->_device];
  [v4 setWorkoutConfiguration:self->_workoutConfiguration];
  [v4 setGoalType:self->_goalType];
  [v4 setGoal:self->_goal];
  v5 = (void *)[(NSUUID *)self->_associatedSessionUUID copy];
  [v4 setAssociatedSessionUUID:v5];

  [v4 setShouldCollectWorkoutEvents:self->_shouldCollectWorkoutEvents];
  [v4 setRequiresRecovery:self->_requiresRecovery];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKWorkoutBuilderConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKWorkoutBuilderConfiguration;
  v5 = [(HKTaskConfiguration *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"device"];
    device = v5->_device;
    v5->_device = (HKDevice *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workoutConfig"];
    workoutConfiguration = v5->_workoutConfiguration;
    v5->_workoutConfiguration = (HKWorkoutConfiguration *)v8;

    v5->_unint64_t goalType = [v4 decodeIntegerForKey:@"goalType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"goal"];
    goal = v5->_goal;
    v5->_goal = (HKQuantity *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associated_session_uuid"];
    associatedSessionUUID = v5->_associatedSessionUUID;
    v5->_associatedSessionUUID = (NSUUID *)v12;

    v5->_shouldCollectWorkoutEvents = [v4 decodeBoolForKey:@"should_collect_events"];
    v5->_requiresRecovery = [v4 decodeBoolForKey:@"requires_recovery"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutBuilderConfiguration;
  id v4 = a3;
  [(HKTaskConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_device, @"device", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_workoutConfiguration forKey:@"workoutConfig"];
  [v4 encodeInteger:self->_goalType forKey:@"goalType"];
  [v4 encodeObject:self->_goal forKey:@"goal"];
  [v4 encodeObject:self->_associatedSessionUUID forKey:@"associated_session_uuid"];
  [v4 encodeBool:self->_shouldCollectWorkoutEvents forKey:@"should_collect_events"];
  [v4 encodeBool:self->_requiresRecovery forKey:@"requires_recovery"];
}

- (HKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return self->_workoutConfiguration;
}

- (void)setWorkoutConfiguration:(id)a3
{
}

- (unint64_t)goalType
{
  return self->_goalType;
}

- (void)setGoalType:(unint64_t)a3
{
  self->_unint64_t goalType = a3;
}

- (HKQuantity)goal
{
  return self->_goal;
}

- (void)setGoal:(id)a3
{
}

- (NSUUID)associatedSessionUUID
{
  return self->_associatedSessionUUID;
}

- (void)setAssociatedSessionUUID:(id)a3
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

- (BOOL)requiresRecovery
{
  return self->_requiresRecovery;
}

- (void)setRequiresRecovery:(BOOL)a3
{
  self->_requiresRecovery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedSessionUUID, 0);
  objc_storeStrong((id *)&self->_goal, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end