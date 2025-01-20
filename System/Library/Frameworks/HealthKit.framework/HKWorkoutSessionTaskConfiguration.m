@interface HKWorkoutSessionTaskConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)requiresCoreLocationAssertion;
- (BOOL)requiresRecovery;
- (BOOL)shouldStopPreviousSession;
- (BOOL)supports3rdPartyAOT;
- (BOOL)supportsAppRelaunchForRecovery;
- (HKWorkoutActivity)currentActivity;
- (HKWorkoutConfiguration)workoutConfiguration;
- (HKWorkoutSessionTaskConfiguration)initWithCoder:(id)a3;
- (NSArray)activityConfigurations;
- (NSUUID)sessionUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)sessionType;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityConfigurations:(id)a3;
- (void)setCurrentActivity:(id)a3;
- (void)setRequiresCoreLocationAssertion:(BOOL)a3;
- (void)setRequiresRecovery:(BOOL)a3;
- (void)setSessionType:(int64_t)a3;
- (void)setSessionUUID:(id)a3;
- (void)setShouldStopPreviousSession:(BOOL)a3;
- (void)setSupports3rdPartyAOT:(BOOL)a3;
- (void)setSupportsAppRelaunchForRecovery:(BOOL)a3;
- (void)setWorkoutConfiguration:(id)a3;
@end

@implementation HKWorkoutSessionTaskConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(HKWorkoutSessionTaskConfiguration);
  [(HKWorkoutSessionTaskConfiguration *)v4 setSessionUUID:self->_sessionUUID];
  [(HKWorkoutSessionTaskConfiguration *)v4 setWorkoutConfiguration:self->_workoutConfiguration];
  [(HKWorkoutSessionTaskConfiguration *)v4 setRequiresCoreLocationAssertion:self->_requiresCoreLocationAssertion];
  [(HKWorkoutSessionTaskConfiguration *)v4 setRequiresRecovery:self->_requiresRecovery];
  [(HKWorkoutSessionTaskConfiguration *)v4 setSupportsAppRelaunchForRecovery:self->_supportsAppRelaunchForRecovery];
  [(HKWorkoutSessionTaskConfiguration *)v4 setShouldStopPreviousSession:self->_shouldStopPreviousSession];
  [(HKWorkoutSessionTaskConfiguration *)v4 setSupports3rdPartyAOT:self->_supports3rdPartyAOT];
  [(HKWorkoutSessionTaskConfiguration *)v4 setCurrentActivity:self->_currentActivity];
  [(HKWorkoutSessionTaskConfiguration *)v4 setActivityConfigurations:self->_activityConfigurations];
  [(HKWorkoutSessionTaskConfiguration *)v4 setSessionType:self->_sessionType];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKWorkoutSessionTaskConfiguration)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKWorkoutSessionTaskConfiguration;
  v5 = [(HKTaskConfiguration *)&v18 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"session_uuid"];
    sessionUUID = v5->_sessionUUID;
    v5->_sessionUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workout_configuration"];
    workoutConfiguration = v5->_workoutConfiguration;
    v5->_workoutConfiguration = (HKWorkoutConfiguration *)v8;

    v5->_requiresCoreLocationAssertion = [v4 decodeBoolForKey:@"cl_assertion"];
    v5->_requiresRecovery = [v4 decodeBoolForKey:@"recovery"];
    v5->_supportsAppRelaunchForRecovery = [v4 decodeBoolForKey:@"recovery_relaunch_app"];
    v5->_shouldStopPreviousSession = [v4 decodeBoolForKey:@"stop_previous"];
    v5->_supports3rdPartyAOT = [v4 decodeBoolForKey:@"supports_3rd_party_aot"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"current_activity"];
    currentActivity = v5->_currentActivity;
    v5->_currentActivity = (HKWorkoutActivity *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    v14 = [v12 setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"activity_configurations"];
    activityConfigurations = v5->_activityConfigurations;
    v5->_activityConfigurations = (NSArray *)v15;

    v5->_sessionType = [v4 decodeIntegerForKey:@"session_type"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutSessionTaskConfiguration;
  id v4 = a3;
  [(HKTaskConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sessionUUID, @"session_uuid", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_workoutConfiguration forKey:@"workout_configuration"];
  [v4 encodeBool:self->_requiresCoreLocationAssertion forKey:@"cl_assertion"];
  [v4 encodeBool:self->_requiresRecovery forKey:@"recovery"];
  [v4 encodeBool:self->_supportsAppRelaunchForRecovery forKey:@"recovery_relaunch_app"];
  [v4 encodeBool:self->_shouldStopPreviousSession forKey:@"stop_previous"];
  [v4 encodeBool:self->_supports3rdPartyAOT forKey:@"supports_3rd_party_aot"];
  [v4 encodeObject:self->_currentActivity forKey:@"current_activity"];
  [v4 encodeObject:self->_activityConfigurations forKey:@"activity_configurations"];
  [v4 encodeInteger:self->_sessionType forKey:@"session_type"];
}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return self->_workoutConfiguration;
}

- (void)setWorkoutConfiguration:(id)a3
{
}

- (int64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(int64_t)a3
{
  self->_sessionType = a3;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (BOOL)requiresCoreLocationAssertion
{
  return self->_requiresCoreLocationAssertion;
}

- (void)setRequiresCoreLocationAssertion:(BOOL)a3
{
  self->_requiresCoreLocationAssertion = a3;
}

- (BOOL)requiresRecovery
{
  return self->_requiresRecovery;
}

- (void)setRequiresRecovery:(BOOL)a3
{
  self->_requiresRecovery = a3;
}

- (BOOL)supportsAppRelaunchForRecovery
{
  return self->_supportsAppRelaunchForRecovery;
}

- (void)setSupportsAppRelaunchForRecovery:(BOOL)a3
{
  self->_supportsAppRelaunchForRecovery = a3;
}

- (BOOL)shouldStopPreviousSession
{
  return self->_shouldStopPreviousSession;
}

- (void)setShouldStopPreviousSession:(BOOL)a3
{
  self->_shouldStopPreviousSession = a3;
}

- (BOOL)supports3rdPartyAOT
{
  return self->_supports3rdPartyAOT;
}

- (void)setSupports3rdPartyAOT:(BOOL)a3
{
  self->_supports3rdPartyAOT = a3;
}

- (HKWorkoutActivity)currentActivity
{
  return self->_currentActivity;
}

- (void)setCurrentActivity:(id)a3
{
}

- (NSArray)activityConfigurations
{
  return self->_activityConfigurations;
}

- (void)setActivityConfigurations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityConfigurations, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);

  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
}

@end