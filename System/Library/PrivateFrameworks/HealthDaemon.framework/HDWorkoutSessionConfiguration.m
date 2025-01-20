@interface HDWorkoutSessionConfiguration
- (BOOL)enableWorkoutChangeDetection;
- (BOOL)requiresCoreLocationAssertion;
- (BOOL)supports3rdPartyAOT;
- (BOOL)supportsAppRelaunchForRecovery;
- (HDHealthStoreClient)client;
- (HDWorkoutSessionConfiguration)initWithSessionIdentifier:(id)a3 workoutConfiguration:(id)a4 sessionType:(int64_t)a5 client:(id)a6 processBundleIdentifier:(id)a7 applicationIdentifier:(id)a8 requiresCoreLocationAssertion:(BOOL)a9 supportsAppRelaunchForRecovery:(BOOL)a10 supports3rdPartyAOT:(BOOL)a11 enableWorkoutChangeDetection:(BOOL)a12 activityConfigurations:(id)a13;
- (HKWorkoutConfiguration)workoutConfiguration;
- (NSArray)activityConfigurations;
- (NSString)clientApplicationIdentifier;
- (NSString)clientProcessBundleIdentifier;
- (NSUUID)sessionIdentifier;
- (int64_t)sessionType;
- (void)setActivityConfigurations:(id)a3;
@end

@implementation HDWorkoutSessionConfiguration

- (HDWorkoutSessionConfiguration)initWithSessionIdentifier:(id)a3 workoutConfiguration:(id)a4 sessionType:(int64_t)a5 client:(id)a6 processBundleIdentifier:(id)a7 applicationIdentifier:(id)a8 requiresCoreLocationAssertion:(BOOL)a9 supportsAppRelaunchForRecovery:(BOOL)a10 supports3rdPartyAOT:(BOOL)a11 enableWorkoutChangeDetection:(BOOL)a12 activityConfigurations:(id)a13
{
  id v36 = a3;
  id v19 = a4;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a13;
  v37.receiver = self;
  v37.super_class = (Class)HDWorkoutSessionConfiguration;
  v24 = [(HDWorkoutSessionConfiguration *)&v37 init];
  if (v24)
  {
    uint64_t v25 = [v36 copy];
    sessionIdentifier = v24->_sessionIdentifier;
    v24->_sessionIdentifier = (NSUUID *)v25;

    uint64_t v27 = [v19 copy];
    workoutConfiguration = v24->_workoutConfiguration;
    v24->_workoutConfiguration = (HKWorkoutConfiguration *)v27;

    v24->_sessionType = a5;
    objc_storeStrong((id *)&v24->_client, a6);
    uint64_t v29 = [v21 copy];
    clientProcessBundleIdentifier = v24->_clientProcessBundleIdentifier;
    v24->_clientProcessBundleIdentifier = (NSString *)v29;

    uint64_t v31 = [v22 copy];
    clientApplicationIdentifier = v24->_clientApplicationIdentifier;
    v24->_clientApplicationIdentifier = (NSString *)v31;

    v24->_requiresCoreLocationAssertion = a9;
    v24->_supportsAppRelaunchForRecovery = a10;
    v24->_supports3rdPartyAOT = a11;
    v24->_enableWorkoutChangeDetection = a12;
    uint64_t v33 = [v23 copy];
    activityConfigurations = v24->_activityConfigurations;
    v24->_activityConfigurations = (NSArray *)v33;
  }
  return v24;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return self->_workoutConfiguration;
}

- (int64_t)sessionType
{
  return self->_sessionType;
}

- (HDHealthStoreClient)client
{
  return self->_client;
}

- (NSString)clientProcessBundleIdentifier
{
  return self->_clientProcessBundleIdentifier;
}

- (NSString)clientApplicationIdentifier
{
  return self->_clientApplicationIdentifier;
}

- (BOOL)requiresCoreLocationAssertion
{
  return self->_requiresCoreLocationAssertion;
}

- (BOOL)supportsAppRelaunchForRecovery
{
  return self->_supportsAppRelaunchForRecovery;
}

- (BOOL)supports3rdPartyAOT
{
  return self->_supports3rdPartyAOT;
}

- (BOOL)enableWorkoutChangeDetection
{
  return self->_enableWorkoutChangeDetection;
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
  objc_storeStrong((id *)&self->_clientApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_clientProcessBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);

  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end