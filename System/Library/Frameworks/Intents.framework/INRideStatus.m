@interface INRideStatus
+ (BOOL)supportsSecureCoding;
- (CLPlacemark)dropOffLocation;
- (CLPlacemark)pickupLocation;
- (INDateComponentsRange)scheduledPickupTime;
- (INRideCompletionStatus)completionStatus;
- (INRideDriver)driver;
- (INRideOption)rideOption;
- (INRidePhase)phase;
- (INRideStatus)initWithCoder:(id)a3;
- (INRideVehicle)vehicle;
- (NSArray)additionalActionActivities;
- (NSArray)waypoints;
- (NSDate)estimatedDropOffDate;
- (NSDate)estimatedPickupDate;
- (NSDate)estimatedPickupEndDate;
- (NSString)description;
- (NSString)rideIdentifier;
- (NSUserActivity)userActivityForCancelingInApplication;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionAtIndent:(unint64_t)a3;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalActionActivities:(NSArray *)additionalActionActivities;
- (void)setCompletionStatus:(INRideCompletionStatus *)completionStatus;
- (void)setDriver:(INRideDriver *)driver;
- (void)setDropOffLocation:(CLPlacemark *)dropOffLocation;
- (void)setEstimatedDropOffDate:(NSDate *)estimatedDropOffDate;
- (void)setEstimatedPickupDate:(NSDate *)estimatedPickupDate;
- (void)setEstimatedPickupEndDate:(NSDate *)estimatedPickupEndDate;
- (void)setPhase:(INRidePhase)phase;
- (void)setPickupLocation:(CLPlacemark *)pickupLocation;
- (void)setRideIdentifier:(NSString *)rideIdentifier;
- (void)setRideOption:(INRideOption *)rideOption;
- (void)setScheduledPickupTime:(INDateComponentsRange *)scheduledPickupTime;
- (void)setUserActivityForCancelingInApplication:(NSUserActivity *)userActivityForCancelingInApplication;
- (void)setVehicle:(INRideVehicle *)vehicle;
- (void)setWaypoints:(NSArray *)waypoints;
@end

@implementation INRideStatus

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4 = a3;
  v5 = [(INRideStatus *)self vehicle];
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);

  v6 = [(INRideStatus *)self driver];
  objc_msgSend(v6, "_intents_updateContainerWithCache:", v4);

  v7 = [(INRideStatus *)self rideOption];
  objc_msgSend(v7, "_intents_updateContainerWithCache:", v4);

  id v8 = [(INRideStatus *)self completionStatus];
  objc_msgSend(v8, "_intents_updateContainerWithCache:", v4);
}

- (id)_intents_cacheableObjects
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(INRideStatus *)self vehicle];
  v5 = objc_msgSend(v4, "_intents_cacheableObjects");
  [v3 unionSet:v5];

  v6 = [(INRideStatus *)self driver];
  v7 = objc_msgSend(v6, "_intents_cacheableObjects");
  [v3 unionSet:v7];

  id v8 = [(INRideStatus *)self rideOption];
  v9 = objc_msgSend(v8, "_intents_cacheableObjects");
  [v3 unionSet:v9];

  v10 = [(INRideStatus *)self userActivityForCancelingInApplication];

  if (v10)
  {
    v11 = [(INRideStatus *)self userActivityForCancelingInApplication];
    [v3 addObject:v11];
  }
  v12 = [(INRideStatus *)self completionStatus];
  v13 = objc_msgSend(v12, "_intents_cacheableObjects");
  [v3 unionSet:v13];

  v14 = [(INRideStatus *)self additionalActionActivities];

  if (v14)
  {
    v15 = [(INRideStatus *)self additionalActionActivities];
    [v3 addObjectsFromArray:v15];
  }
  if ([v3 count]) {
    v16 = v3;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalActionActivities, 0);
  objc_storeStrong((id *)&self->_userActivityForCancelingInApplication, 0);
  objc_storeStrong((id *)&self->_rideOption, 0);
  objc_storeStrong((id *)&self->_dropOffLocation, 0);
  objc_storeStrong((id *)&self->_pickupLocation, 0);
  objc_storeStrong((id *)&self->_scheduledPickupTime, 0);
  objc_storeStrong((id *)&self->_estimatedPickupEndDate, 0);
  objc_storeStrong((id *)&self->_estimatedDropOffDate, 0);
  objc_storeStrong((id *)&self->_estimatedPickupDate, 0);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_completionStatus, 0);
  objc_storeStrong((id *)&self->_rideIdentifier, 0);

  objc_storeStrong((id *)&self->_waypoints, 0);
}

- (void)setAdditionalActionActivities:(NSArray *)additionalActionActivities
{
}

- (NSArray)additionalActionActivities
{
  return self->_additionalActionActivities;
}

- (void)setUserActivityForCancelingInApplication:(NSUserActivity *)userActivityForCancelingInApplication
{
}

- (NSUserActivity)userActivityForCancelingInApplication
{
  return self->_userActivityForCancelingInApplication;
}

- (void)setRideOption:(INRideOption *)rideOption
{
}

- (INRideOption)rideOption
{
  return self->_rideOption;
}

- (void)setDropOffLocation:(CLPlacemark *)dropOffLocation
{
}

- (CLPlacemark)dropOffLocation
{
  return self->_dropOffLocation;
}

- (void)setPickupLocation:(CLPlacemark *)pickupLocation
{
}

- (CLPlacemark)pickupLocation
{
  return self->_pickupLocation;
}

- (void)setScheduledPickupTime:(INDateComponentsRange *)scheduledPickupTime
{
}

- (INDateComponentsRange)scheduledPickupTime
{
  return self->_scheduledPickupTime;
}

- (void)setEstimatedPickupEndDate:(NSDate *)estimatedPickupEndDate
{
}

- (NSDate)estimatedPickupEndDate
{
  return self->_estimatedPickupEndDate;
}

- (void)setEstimatedDropOffDate:(NSDate *)estimatedDropOffDate
{
}

- (NSDate)estimatedDropOffDate
{
  return self->_estimatedDropOffDate;
}

- (void)setEstimatedPickupDate:(NSDate *)estimatedPickupDate
{
}

- (NSDate)estimatedPickupDate
{
  return self->_estimatedPickupDate;
}

- (void)setDriver:(INRideDriver *)driver
{
}

- (INRideDriver)driver
{
  return self->_driver;
}

- (void)setVehicle:(INRideVehicle *)vehicle
{
}

- (INRideVehicle)vehicle
{
  return self->_vehicle;
}

- (void)setCompletionStatus:(INRideCompletionStatus *)completionStatus
{
}

- (INRideCompletionStatus)completionStatus
{
  return self->_completionStatus;
}

- (void)setPhase:(INRidePhase)phase
{
  self->_phase = phase;
}

- (INRidePhase)phase
{
  return self->_phase;
}

- (void)setRideIdentifier:(NSString *)rideIdentifier
{
}

- (NSString)rideIdentifier
{
  return self->_rideIdentifier;
}

- (id)_dictionaryRepresentation
{
  v49[15] = *MEMORY[0x1E4F143B8];
  INRidePhase v3 = [(INRideStatus *)self phase];
  if ((unint64_t)(v3 - 1) > 5) {
    id v4 = @"unknown";
  }
  else {
    id v4 = off_1E5517F80[v3 - 1];
  }
  v5 = v4;
  v48[0] = @"rideIdentifier";
  uint64_t rideIdentifier = (uint64_t)self->_rideIdentifier;
  uint64_t v46 = rideIdentifier;
  if (!rideIdentifier)
  {
    uint64_t rideIdentifier = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)rideIdentifier;
  v49[0] = rideIdentifier;
  v49[1] = v5;
  v48[1] = @"phase";
  v48[2] = @"completionStatus";
  completionStatus = self->_completionStatus;
  uint64_t v7 = (uint64_t)completionStatus;
  if (!completionStatus)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v49[2] = v7;
  v48[3] = @"vehicle";
  vehicle = self->_vehicle;
  uint64_t v8 = (uint64_t)vehicle;
  if (!vehicle)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v49[3] = v8;
  v48[4] = @"driver";
  driver = self->_driver;
  uint64_t v9 = (uint64_t)driver;
  if (!driver)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v49[4] = v9;
  v48[5] = @"estimatedPickupDate";
  estimatedPickupDate = self->_estimatedPickupDate;
  uint64_t v10 = (uint64_t)estimatedPickupDate;
  if (!estimatedPickupDate)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v49[5] = v10;
  v48[6] = @"estimatedDropOffDate";
  estimatedDropOffDate = self->_estimatedDropOffDate;
  v11 = estimatedDropOffDate;
  if (!estimatedDropOffDate)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v49[6] = v11;
  v48[7] = @"estimatedPickupEndDate";
  estimatedPickupEndDate = self->_estimatedPickupEndDate;
  uint64_t v12 = (uint64_t)estimatedPickupEndDate;
  if (!estimatedPickupEndDate)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v44 = (void *)v7;
  v49[7] = v12;
  v48[8] = @"scheduledPickupTime";
  scheduledPickupTime = self->_scheduledPickupTime;
  uint64_t v13 = (uint64_t)scheduledPickupTime;
  if (!scheduledPickupTime)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v47 = v5;
  v31 = (void *)v13;
  v49[8] = v13;
  v48[9] = @"pickupLocation";
  pickupLocation = self->_pickupLocation;
  uint64_t v15 = (uint64_t)pickupLocation;
  if (!pickupLocation)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v42 = (void *)v8;
  v30 = (void *)v15;
  v49[9] = v15;
  v48[10] = @"waypoints";
  waypoints = self->_waypoints;
  uint64_t v17 = (uint64_t)waypoints;
  if (!waypoints)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v40 = (void *)v9;
  v29 = (void *)v17;
  v49[10] = v17;
  v48[11] = @"dropOffLocation";
  dropOffLocation = self->_dropOffLocation;
  uint64_t v19 = (uint64_t)dropOffLocation;
  if (!dropOffLocation)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = (void *)v12;
  v38 = (void *)v10;
  uint64_t v27 = v19;
  v49[11] = v19;
  v48[12] = @"rideOption";
  rideOption = self->_rideOption;
  v21 = rideOption;
  if (!rideOption)
  {
    v21 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v19, v29, v30, v31, v32, v33);
  }
  v49[12] = v21;
  v48[13] = @"userActivityForCancelingInApplication";
  userActivityForCancelingInApplication = self->_userActivityForCancelingInApplication;
  v23 = userActivityForCancelingInApplication;
  if (!userActivityForCancelingInApplication)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v49[13] = v23;
  v48[14] = @"additionalActionActivities";
  additionalActionActivities = self->_additionalActionActivities;
  v25 = additionalActionActivities;
  if (!additionalActionActivities)
  {
    v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v49[14] = v25;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v49, v48, 15, v27);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  if (additionalActionActivities)
  {
    if (userActivityForCancelingInApplication) {
      goto LABEL_34;
    }
LABEL_61:

    if (rideOption) {
      goto LABEL_35;
    }
    goto LABEL_62;
  }

  if (!userActivityForCancelingInApplication) {
    goto LABEL_61;
  }
LABEL_34:
  if (rideOption) {
    goto LABEL_35;
  }
LABEL_62:

LABEL_35:
  if (!dropOffLocation) {

  }
  if (!waypoints) {
  if (!pickupLocation)
  }

  if (!scheduledPickupTime) {
  if (!estimatedPickupEndDate)
  }

  if (!estimatedDropOffDate) {
  if (!estimatedPickupDate)
  }

  if (!driver) {
  if (!vehicle)
  }

  if (!completionStatus) {
  if (!v46)
  }

  return v34;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INRideStatus;
  v6 = [(INRideStatus *)&v11 description];
  uint64_t v7 = [(INRideStatus *)self _dictionaryRepresentation];
  uint64_t v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INRideStatus *)self descriptionAtIndent:0];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 encodeObject:self->_rideIdentifier forKey:@"rideIdentifier"];
  [v4 encodeInteger:self->_phase forKey:@"phase"];
  [v4 encodeObject:self->_vehicle forKey:@"vehicle"];
  [v4 encodeObject:self->_driver forKey:@"driver"];
  [v4 encodeObject:self->_estimatedPickupDate forKey:@"estimatedPickupDate"];
  [v4 encodeObject:self->_estimatedDropOffDate forKey:@"estimatedDropOffDate"];
  [v4 encodeObject:self->_estimatedPickupEndDate forKey:@"estimatedPickupEndDate"];
  [v4 encodeObject:self->_pickupLocation forKey:@"pickupLocation"];
  [v4 encodeObject:self->_waypoints forKey:@"waypoints"];
  [v4 encodeObject:self->_dropOffLocation forKey:@"dropOffLocation"];
  [v4 encodeObject:self->_rideOption forKey:@"rideOption"];
  [v4 encodeObject:self->_completionStatus forKey:@"completionStatus"];
  [v4 encodeObject:self->_scheduledPickupTime forKey:@"scheduledPickupTime"];
  v5 = INUserActivitySerializeToData(self->_userActivityForCancelingInApplication);
  [v4 encodeObject:v5 forKey:@"userActivityForCancelingInApplication"];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = self->_additionalActionActivities;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = INUserActivitySerializeToData(*(void **)(*((void *)&v14 + 1) + 8 * i));
        if (v12)
        {
          if (!v9) {
            uint64_t v9 = objc_opt_new();
          }
          objc_msgSend(v9, "addObject:", v12, (void)v14);
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  uint64_t v13 = (void *)[v9 copy];
  [v4 encodeObject:v13 forKey:@"additionalActionActivities"];
}

- (INRideStatus)initWithCoder:(id)a3
{
  v58[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)INRideStatus;
  v5 = [(INRideStatus *)&v55 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rideIdentifier"];
    uint64_t rideIdentifier = v5->_rideIdentifier;
    v5->_uint64_t rideIdentifier = (NSString *)v6;

    v5->_phase = [v4 decodeIntegerForKey:@"phase"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vehicle"];
    vehicle = v5->_vehicle;
    v5->_vehicle = (INRideVehicle *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"driver"];
    driver = v5->_driver;
    v5->_driver = (INRideDriver *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"estimatedPickupDate"];
    estimatedPickupDate = v5->_estimatedPickupDate;
    v5->_estimatedPickupDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"estimatedDropOffDate"];
    estimatedDropOffDate = v5->_estimatedDropOffDate;
    v5->_estimatedDropOffDate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"estimatedPickupEndDate"];
    estimatedPickupEndDate = v5->_estimatedPickupEndDate;
    v5->_estimatedPickupEndDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pickupLocation"];
    pickupLocation = v5->_pickupLocation;
    v5->_pickupLocation = (CLPlacemark *)v18;

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    v58[0] = objc_opt_class();
    v58[1] = objc_opt_class();
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
    v22 = [v20 setWithArray:v21];
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"waypoints"];
    waypoints = v5->_waypoints;
    v5->_waypoints = (NSArray *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dropOffLocation"];
    dropOffLocation = v5->_dropOffLocation;
    v5->_dropOffLocation = (CLPlacemark *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rideOption"];
    rideOption = v5->_rideOption;
    v5->_rideOption = (INRideOption *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"completionStatus"];
    completionStatus = v5->_completionStatus;
    v5->_completionStatus = (INRideCompletionStatus *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scheduledPickupTime"];
    scheduledPickupTime = v5->_scheduledPickupTime;
    v5->_scheduledPickupTime = (INDateComponentsRange *)v31;

    v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userActivityForCancelingInApplication"];
    uint64_t v34 = INUserActivityDeserializeFromData(v33);
    userActivityForCancelingInApplication = v5->_userActivityForCancelingInApplication;
    v5->_userActivityForCancelingInApplication = (NSUserActivity *)v34;

    v36 = (void *)MEMORY[0x1E4F1CAD0];
    v57[0] = objc_opt_class();
    v57[1] = objc_opt_class();
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
    v38 = [v36 setWithArray:v37];
    v39 = [v4 decodeObjectOfClasses:v38 forKey:@"additionalActionActivities"];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v40 = v39;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      v43 = 0;
      uint64_t v44 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v52 != v44) {
            objc_enumerationMutation(v40);
          }
          uint64_t v46 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          if (!v43) {
            v43 = objc_opt_new();
          }
          v47 = INUserActivityDeserializeFromData(v46);
          if (v47) {
            objc_msgSend(v43, "addObject:", v47, (void)v51);
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v42);
    }
    else
    {
      v43 = 0;
    }

    uint64_t v48 = [v43 copy];
    additionalActionActivities = v5->_additionalActionActivities;
    v5->_additionalActionActivities = (NSArray *)v48;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setRideIdentifier:self->_rideIdentifier];
  [v4 setPhase:self->_phase];
  [v4 setVehicle:self->_vehicle];
  [v4 setDriver:self->_driver];
  [v4 setEstimatedPickupDate:self->_estimatedPickupDate];
  [v4 setEstimatedDropOffDate:self->_estimatedDropOffDate];
  [v4 setEstimatedPickupEndDate:self->_estimatedPickupEndDate];
  [v4 setPickupLocation:self->_pickupLocation];
  [v4 setWaypoints:self->_waypoints];
  [v4 setDropOffLocation:self->_dropOffLocation];
  [v4 setRideOption:self->_rideOption];
  [v4 setCompletionStatus:self->_completionStatus];
  [v4 setUserActivityForCancelingInApplication:self->_userActivityForCancelingInApplication];
  [v4 setAdditionalActionActivities:self->_additionalActionActivities];
  [v4 setScheduledPickupTime:self->_scheduledPickupTime];
  return v4;
}

- (void)setWaypoints:(NSArray *)waypoints
{
  id v4 = waypoints;
  uint64_t v7 = v4;
  if (v4)
  {
    if ([(NSArray *)v4 count])
    {
      v5 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v7 copyItems:1];
      uint64_t v6 = self->_waypoints;
      self->_waypoints = v5;
    }
    else
    {
      uint64_t v6 = self->_waypoints;
      self->_waypoints = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v6 = self->_waypoints;
    self->_waypoints = 0;
  }
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = (void *)[(INRideStatus *)self copy];
    id v9 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    uint64_t v10 = INImageProxyInjectionQueue();
    [v9 setUnderlyingQueue:v10];

    [v9 setMaxConcurrentOperationCount:1];
    [v9 setSuspended:1];
    objc_super v11 = (void *)MEMORY[0x1E4F28B48];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __74__INRideStatus_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
    v19[3] = &unk_1E551F740;
    v19[4] = v8;
    id v20 = v7;
    uint64_t v12 = [v11 blockOperationWithBlock:v19];
    uint64_t v13 = [(INRideStatus *)self vehicle];
    if (v13)
    {
      uint64_t v14 = objc_alloc_init(INImageProxyInjectionOperation);
      [(INImageProxyInjectionOperation *)v14 setInjector:v13];
      [(INImageProxyInjectionOperation *)v14 setImageProxyRequestBlock:v6];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __74__INRideStatus_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2;
      v18[3] = &unk_1E551E178;
      v18[4] = v8;
      [(INImageProxyInjectionOperation *)v14 setCopyReturnBlock:v18];
      [v12 addDependency:v14];
      [v9 addOperation:v14];
    }
    long long v15 = [(INRideStatus *)self driver];
    if (v15)
    {
      uint64_t v16 = objc_alloc_init(INImageProxyInjectionOperation);
      [(INImageProxyInjectionOperation *)v16 setInjector:v15];
      [(INImageProxyInjectionOperation *)v16 setImageProxyRequestBlock:v6];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __74__INRideStatus_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3;
      v17[3] = &unk_1E551E178;
      v17[4] = v8;
      [(INImageProxyInjectionOperation *)v16 setCopyReturnBlock:v17];
      [v12 addDependency:v16];
      [v9 addOperation:v16];
    }
    [v9 addOperation:v12];
    [v9 setSuspended:0];
  }
}

uint64_t __74__INRideStatus_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __74__INRideStatus_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) setVehicle:a2];
  }
  return result;
}

uint64_t __74__INRideStatus_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) setDriver:a2];
  }
  return result;
}

@end