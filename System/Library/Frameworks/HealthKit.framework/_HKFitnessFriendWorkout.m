@interface _HKFitnessFriendWorkout
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsSecureCoding;
+ (id)fitnessFriendWorkoutFromHKWorkout:(id)a3;
+ (id)fitnessFriendworkoutWithActivityType:(unint64_t)a3 friendUUID:(id)a4 startDate:(id)a5 endDate:(id)a6 duration:(double)a7 totalActiveEnergyBurned:(id)a8 totalBasalEnergyBurned:(id)a9 totalDistance:(id)a10 goalType:(unint64_t)a11 goal:(id)a12 bundleID:(id)a13 isWatchWorkout:(BOOL)a14 isIndoorWorkout:(BOOL)a15 deviceManufacturer:(id)a16 deviceModel:(id)a17 amm:(int64_t)a18 seymourCatalogWorkoutIdentifier:(id)a19 seymourMediaType:(id)a20;
- (BOOL)isIndoorWorkout;
- (BOOL)isWatchWorkout;
- (HKQuantity)goal;
- (HKQuantity)totalBasalEnergyBurned;
- (HKQuantity)totalDistance;
- (HKQuantity)totalEnergyBurned;
- (NSString)bundleID;
- (NSString)deviceManufacturer;
- (NSString)deviceModel;
- (NSString)seymourCatalogWorkoutIdentifier;
- (NSString)seymourMediaType;
- (NSUUID)friendUUID;
- (_HKFitnessFriendWorkout)initWithCoder:(id)a3;
- (double)duration;
- (id)description;
- (id)hkWorkoutFromFriendWorkout;
- (int64_t)amm;
- (unint64_t)goalType;
- (unint64_t)workoutActivityType;
- (void)encodeWithCoder:(id)a3;
- (void)setAmm:(int64_t)a3;
- (void)setBundleID:(id)a3;
- (void)setDeviceManufacturer:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDuration:(double)a3;
- (void)setFriendUUID:(id)a3;
- (void)setGoal:(id)a3;
- (void)setGoalType:(unint64_t)a3;
- (void)setIsIndoorWorkout:(BOOL)a3;
- (void)setIsWatchWorkout:(BOOL)a3;
- (void)setSeymourCatalogWorkoutIdentifier:(id)a3;
- (void)setSeymourMediaType:(id)a3;
- (void)setTotalBasalEnergyBurned:(id)a3;
- (void)setTotalDistance:(id)a3;
- (void)setTotalEnergyBurned:(id)a3;
- (void)setWorkoutActivityType:(unint64_t)a3;
@end

@implementation _HKFitnessFriendWorkout

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKFitnessFriendWorkout;
  id v4 = a3;
  [(HKSample *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_friendUUID, @"friendUUID", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_workoutActivityType forKey:@"workoutActivityType"];
  [v4 encodeDouble:@"duration" forKey:self->_duration];
  [v4 encodeObject:self->_totalEnergyBurned forKey:@"totalEnergyBurned"];
  [v4 encodeObject:self->_totalBasalEnergyBurned forKey:@"totalBasalEnergyBurned"];
  [v4 encodeObject:self->_totalDistance forKey:@"totalDistance"];
  [v4 encodeInteger:self->_goalType forKey:@"goalType"];
  [v4 encodeObject:self->_goal forKey:@"goal"];
  [v4 encodeObject:self->_bundleID forKey:@"bundle_id"];
  [v4 encodeBool:self->_isWatchWorkout forKey:@"is_watch_workout"];
  [v4 encodeBool:self->_isIndoorWorkout forKey:@"is_indoor_workout"];
  [v4 encodeObject:self->_deviceManufacturer forKey:@"device_manufacturer"];
  [v4 encodeObject:self->_deviceModel forKey:@"device_model"];
  [v4 encodeInteger:self->_amm forKey:@"activity_move_mode"];
  [v4 encodeObject:self->_seymourCatalogWorkoutIdentifier forKey:@"seymourCatalogWorkoutIdentifier"];
  [v4 encodeObject:self->_seymourMediaType forKey:@"seymourMediaType"];
}

+ (id)fitnessFriendWorkoutFromHKWorkout:(id)a3
{
  id v3 = a3;
  id v4 = [v3 device];
  int v5 = [v4 _isConnectedGymDevice];

  if (v5)
  {
    v6 = [v3 device];
    v36 = [v6 manufacturer];

    v7 = [v3 device];
    v35 = [v7 model];
  }
  else
  {
    v35 = 0;
    v36 = 0;
  }
  uint64_t v31 = [v3 workoutActivityType];
  v32 = [v3 startDate];
  v30 = [v3 endDate];
  [v3 duration];
  double v9 = v8;
  v28 = [v3 totalEnergyBurned];
  v27 = [v3 _totalBasalEnergyBurned];
  v23 = [v3 totalDistance];
  uint64_t v25 = [v3 _goalType];
  v22 = [v3 _goal];
  v29 = [v3 sourceRevision];
  v26 = [v29 source];
  v24 = [v26 bundleIdentifier];
  char v10 = [v3 _isWatchWorkout];
  v11 = [v3 metadata];
  v12 = [v11 objectForKeyedSubscript:@"HKIndoorWorkout"];
  char v13 = [v12 BOOLValue];

  uint64_t v14 = [v3 _activityMoveMode];
  v15 = [v3 metadata];
  v16 = [v15 objectForKeyedSubscript:@"_HKPrivateSeymourCatalogWorkoutIdentifier"];
  v17 = [v3 metadata];
  v18 = [v17 objectForKeyedSubscript:@"_HKPrivateSeymourMediaType"];
  BYTE1(v21) = v13;
  LOBYTE(v21) = v10;
  objc_msgSend(a1, "fitnessFriendworkoutWithActivityType:friendUUID:startDate:endDate:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:goalType:goal:bundleID:isWatchWorkout:isIndoorWorkout:deviceManufacturer:deviceModel:amm:seymourCatalogWorkoutIdentifier:seymourMediaType:", v31, 0, v32, v30, v28, v27, v9, v23, v25, v22, v24, v21, v36, v35, v14,
    v16,
  v34 = v18);

  v19 = [v3 UUID];
  [v34 _setUUID:v19];

  return v34;
}

- (void)setIsWatchWorkout:(BOOL)a3
{
  self->_isWatchWorkout = a3;
}

- (id)hkWorkoutFromFriendWorkout
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_HKFitnessFriendWorkout *)self isIndoorWorkout]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HKIndoorWorkout"];
  }
  if ([(_HKFitnessFriendWorkout *)self amm] == 2) {
    id v4 = &unk_1EECE5480;
  }
  else {
    id v4 = &unk_1EECE5498;
  }
  [v3 setObject:v4 forKeyedSubscript:@"_HKPrivateWorkoutActivityMoveMode"];
  int v5 = [(_HKFitnessFriendWorkout *)self seymourCatalogWorkoutIdentifier];

  if (v5)
  {
    v6 = [(_HKFitnessFriendWorkout *)self seymourCatalogWorkoutIdentifier];
    [v3 setObject:v6 forKeyedSubscript:@"_HKPrivateSeymourCatalogWorkoutIdentifier"];
  }
  v7 = [(_HKFitnessFriendWorkout *)self seymourMediaType];

  if (v7)
  {
    double v8 = [(_HKFitnessFriendWorkout *)self seymourMediaType];
    [v3 setObject:v8 forKeyedSubscript:@"_HKPrivateSeymourMediaType"];
  }
  unint64_t v9 = [(_HKFitnessFriendWorkout *)self workoutActivityType];
  char v10 = [(HKSample *)self startDate];
  v11 = [(HKSample *)self endDate];
  [(_HKFitnessFriendWorkout *)self duration];
  double v13 = v12;
  uint64_t v14 = [(_HKFitnessFriendWorkout *)self totalEnergyBurned];
  v15 = [(_HKFitnessFriendWorkout *)self totalBasalEnergyBurned];
  v16 = [(_HKFitnessFriendWorkout *)self totalDistance];
  unint64_t v17 = [(_HKFitnessFriendWorkout *)self goalType];
  v18 = [(_HKFitnessFriendWorkout *)self goal];
  v26 = v3;
  v19 = (void *)[v3 copy];
  v20 = +[HKWorkout _workoutWithActivityType:v9 startDate:v10 endDate:v11 workoutEvents:0 duration:v14 totalActiveEnergyBurned:v15 totalBasalEnergyBurned:v13 totalDistance:v16 goalType:v17 goal:v18 device:0 metadata:v19];

  id v21 = [[HKSource alloc] _init];
  v22 = [(_HKFitnessFriendWorkout *)self bundleID];
  [v21 _setBundleIdentifier:v22];

  id v23 = [[HKSourceRevision alloc] _initWithSource:v21];
  [v20 _setSourceRevision:v23];
  if (self->_deviceManufacturer)
  {
    v24 = [[HKDevice alloc] initWithName:0 manufacturer:self->_deviceManufacturer model:self->_deviceModel hardwareVersion:0 firmwareVersion:0 softwareVersion:0 localIdentifier:@"com.healthd.fitnessmachine" UDIDeviceIdentifier:0];
    [v20 _setDevice:v24];
  }
  objc_msgSend(v20, "_setIsWatchWorkout:", -[_HKFitnessFriendWorkout isWatchWorkout](self, "isWatchWorkout"));

  return v20;
}

- (BOOL)isIndoorWorkout
{
  return self->_isIndoorWorkout;
}

- (unint64_t)workoutActivityType
{
  return self->_workoutActivityType;
}

- (double)duration
{
  return self->_duration;
}

- (HKQuantity)totalEnergyBurned
{
  return self->_totalEnergyBurned;
}

- (HKQuantity)totalBasalEnergyBurned
{
  return self->_totalBasalEnergyBurned;
}

- (HKQuantity)totalDistance
{
  return self->_totalDistance;
}

- (unint64_t)goalType
{
  return self->_goalType;
}

- (HKQuantity)goal
{
  return self->_goal;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (BOOL)isWatchWorkout
{
  return self->_isWatchWorkout;
}

- (NSString)deviceManufacturer
{
  return self->_deviceManufacturer;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seymourMediaType, 0);
  objc_storeStrong((id *)&self->_seymourCatalogWorkoutIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceManufacturer, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_goal, 0);
  objc_storeStrong((id *)&self->_totalDistance, 0);
  objc_storeStrong((id *)&self->_totalBasalEnergyBurned, 0);
  objc_storeStrong((id *)&self->_totalEnergyBurned, 0);

  objc_storeStrong((id *)&self->_friendUUID, 0);
}

- (void)setFriendUUID:(id)a3
{
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setTotalEnergyBurned:(id)a3
{
}

- (void)setTotalBasalEnergyBurned:(id)a3
{
}

- (void)setWorkoutActivityType:(unint64_t)a3
{
  self->_workoutActivityType = a3;
}

- (void)setBundleID:(id)a3
{
}

- (void)setIsIndoorWorkout:(BOOL)a3
{
  self->_isIndoorWorkout = a3;
}

- (NSUUID)friendUUID
{
  return self->_friendUUID;
}

+ (id)fitnessFriendworkoutWithActivityType:(unint64_t)a3 friendUUID:(id)a4 startDate:(id)a5 endDate:(id)a6 duration:(double)a7 totalActiveEnergyBurned:(id)a8 totalBasalEnergyBurned:(id)a9 totalDistance:(id)a10 goalType:(unint64_t)a11 goal:(id)a12 bundleID:(id)a13 isWatchWorkout:(BOOL)a14 isIndoorWorkout:(BOOL)a15 deviceManufacturer:(id)a16 deviceModel:(id)a17 amm:(int64_t)a18 seymourCatalogWorkoutIdentifier:(id)a19 seymourMediaType:(id)a20
{
  id v46 = a4;
  id v45 = a8;
  id v44 = a9;
  id v43 = a10;
  id v42 = a12;
  id v41 = a13;
  id v24 = a16;
  id v25 = a17;
  id v26 = a19;
  id v27 = a20;
  id v28 = a6;
  id v29 = a5;
  v50 = +[HKObjectType fitnessFriendWorkoutType];
  [v29 timeIntervalSinceReferenceDate];
  double v31 = v30;

  [v28 timeIntervalSinceReferenceDate];
  double v33 = v32;

  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __301___HKFitnessFriendWorkout_fitnessFriendworkoutWithActivityType_friendUUID_startDate_endDate_duration_totalActiveEnergyBurned_totalBasalEnergyBurned_totalDistance_goalType_goal_bundleID_isWatchWorkout_isIndoorWorkout_deviceManufacturer_deviceModel_amm_seymourCatalogWorkoutIdentifier_seymourMediaType___block_invoke;
  v57[3] = &unk_1E58C8680;
  unint64_t v68 = a3;
  double v69 = a7;
  id v58 = v46;
  id v59 = v45;
  id v60 = v44;
  id v61 = v43;
  id v62 = v42;
  id v63 = v41;
  BOOL v72 = a14;
  BOOL v73 = a15;
  id v64 = v24;
  id v65 = v25;
  unint64_t v70 = a11;
  int64_t v71 = a18;
  id v66 = v26;
  id v67 = v27;
  v56.receiver = a1;
  v56.super_class = (Class)&OBJC_METACLASS____HKFitnessFriendWorkout;
  id v55 = v27;
  id v53 = v26;
  id v52 = v25;
  id v51 = v24;
  id v48 = v41;
  id v34 = v42;
  id v35 = v43;
  id v36 = v44;
  id v37 = v45;
  id v38 = v46;
  id v39 = objc_msgSendSuper2(&v56, sel__newSampleWithType_startDate_endDate_device_metadata_config_, v50, 0, 0, v57, v31, v33);

  return v39;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"FitnessFriendWorkout(%ld friend: %@, duration: %f"), self->_workoutActivityType, self->_friendUUID, *(void *)&self->_duration;
}

- (_HKFitnessFriendWorkout)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_HKFitnessFriendWorkout;
  int v5 = [(HKSample *)&v28 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"friendUUID"];
    friendUUID = v5->_friendUUID;
    v5->_friendUUID = (NSUUID *)v6;

    v5->_workoutActivityType = [v4 decodeIntegerForKey:@"workoutActivityType"];
    [v4 decodeDoubleForKey:@"duration"];
    v5->_duration = v8;
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalEnergyBurned"];
    totalEnergyBurned = v5->_totalEnergyBurned;
    v5->_totalEnergyBurned = (HKQuantity *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalBasalEnergyBurned"];
    totalBasalEnergyBurned = v5->_totalBasalEnergyBurned;
    v5->_totalBasalEnergyBurned = (HKQuantity *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalDistance"];
    totalDistance = v5->_totalDistance;
    v5->_totalDistance = (HKQuantity *)v13;

    v5->_goalType = [v4 decodeIntegerForKey:@"goalType"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"goal"];
    goal = v5->_goal;
    v5->_goal = (HKQuantity *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundle_id"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v17;

    v5->_isWatchWorkout = [v4 decodeBoolForKey:@"is_watch_workout"];
    v5->_isIndoorWorkout = [v4 decodeBoolForKey:@"is_indoor_workout"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"device_manufacturer"];
    deviceManufacturer = v5->_deviceManufacturer;
    v5->_deviceManufacturer = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"device_model"];
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = (NSString *)v21;

    v5->_amm = [v4 decodeIntegerForKey:@"activity_move_mode"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seymourCatalogWorkoutIdentifier"];
    seymourCatalogWorkoutIdentifier = v5->_seymourCatalogWorkoutIdentifier;
    v5->_seymourCatalogWorkoutIdentifier = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seymourMediaType"];
    seymourMediaType = v5->_seymourMediaType;
    v5->_seymourMediaType = (NSString *)v25;
  }
  return v5;
}

- (void)setTotalDistance:(id)a3
{
}

- (void)setGoal:(id)a3
{
}

- (void)setGoalType:(unint64_t)a3
{
  self->_goalType = a3;
}

- (void)setDeviceManufacturer:(id)a3
{
}

- (void)setDeviceModel:(id)a3
{
}

- (int64_t)amm
{
  return self->_amm;
}

- (void)setAmm:(int64_t)a3
{
  self->_amm = a3;
}

- (NSString)seymourCatalogWorkoutIdentifier
{
  return self->_seymourCatalogWorkoutIdentifier;
}

- (void)setSeymourCatalogWorkoutIdentifier:(id)a3
{
}

- (NSString)seymourMediaType
{
  return self->_seymourMediaType;
}

- (void)setSeymourMediaType:(id)a3
{
}

@end