@interface _INPBRideStatus
+ (BOOL)supportsSecureCoding;
+ (Class)additionalActionItemsType;
+ (Class)waypointsType;
- (BOOL)hasCompletionStatus;
- (BOOL)hasDriver;
- (BOOL)hasDropOffLocation;
- (BOOL)hasEstimatedDropOffDate;
- (BOOL)hasEstimatedPickupDate;
- (BOOL)hasEstimatedPickupEndDate;
- (BOOL)hasPhase;
- (BOOL)hasPickupLocation;
- (BOOL)hasRideIdentifier;
- (BOOL)hasRideOption;
- (BOOL)hasScheduledPickupTime;
- (BOOL)hasUserActivityForCancelingInApplication;
- (BOOL)hasVehicle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)additionalActionItems;
- (NSArray)waypoints;
- (NSString)rideIdentifier;
- (_INPBDateTimeRangeValue)scheduledPickupTime;
- (_INPBLocationValue)dropOffLocation;
- (_INPBLocationValue)pickupLocation;
- (_INPBRideCompletionStatus)completionStatus;
- (_INPBRideDriver)driver;
- (_INPBRideOption)rideOption;
- (_INPBRideStatus)initWithCoder:(id)a3;
- (_INPBRideVehicle)vehicle;
- (_INPBTimestamp)estimatedDropOffDate;
- (_INPBTimestamp)estimatedPickupDate;
- (_INPBTimestamp)estimatedPickupEndDate;
- (_INPBUserActivity)userActivityForCancelingInApplication;
- (id)additionalActionItemsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)phaseAsString:(int)a3;
- (id)waypointsAtIndex:(unint64_t)a3;
- (int)StringAsPhase:(id)a3;
- (int)phase;
- (unint64_t)additionalActionItemsCount;
- (unint64_t)hash;
- (unint64_t)waypointsCount;
- (void)addAdditionalActionItems:(id)a3;
- (void)addWaypoints:(id)a3;
- (void)clearAdditionalActionItems;
- (void)clearWaypoints;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalActionItems:(id)a3;
- (void)setCompletionStatus:(id)a3;
- (void)setDriver:(id)a3;
- (void)setDropOffLocation:(id)a3;
- (void)setEstimatedDropOffDate:(id)a3;
- (void)setEstimatedPickupDate:(id)a3;
- (void)setEstimatedPickupEndDate:(id)a3;
- (void)setHasPhase:(BOOL)a3;
- (void)setPhase:(int)a3;
- (void)setPickupLocation:(id)a3;
- (void)setRideIdentifier:(id)a3;
- (void)setRideOption:(id)a3;
- (void)setScheduledPickupTime:(id)a3;
- (void)setUserActivityForCancelingInApplication:(id)a3;
- (void)setVehicle:(id)a3;
- (void)setWaypoints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBRideStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_userActivityForCancelingInApplication, 0);
  objc_storeStrong((id *)&self->_scheduledPickupTime, 0);
  objc_storeStrong((id *)&self->_rideOption, 0);
  objc_storeStrong((id *)&self->_rideIdentifier, 0);
  objc_storeStrong((id *)&self->_pickupLocation, 0);
  objc_storeStrong((id *)&self->_estimatedPickupEndDate, 0);
  objc_storeStrong((id *)&self->_estimatedPickupDate, 0);
  objc_storeStrong((id *)&self->_estimatedDropOffDate, 0);
  objc_storeStrong((id *)&self->_dropOffLocation, 0);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_storeStrong((id *)&self->_completionStatus, 0);

  objc_storeStrong((id *)&self->_additionalActionItems, 0);
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (_INPBRideVehicle)vehicle
{
  return self->_vehicle;
}

- (_INPBUserActivity)userActivityForCancelingInApplication
{
  return self->_userActivityForCancelingInApplication;
}

- (_INPBDateTimeRangeValue)scheduledPickupTime
{
  return self->_scheduledPickupTime;
}

- (_INPBRideOption)rideOption
{
  return self->_rideOption;
}

- (NSString)rideIdentifier
{
  return self->_rideIdentifier;
}

- (_INPBLocationValue)pickupLocation
{
  return self->_pickupLocation;
}

- (int)phase
{
  return self->_phase;
}

- (_INPBTimestamp)estimatedPickupEndDate
{
  return self->_estimatedPickupEndDate;
}

- (_INPBTimestamp)estimatedPickupDate
{
  return self->_estimatedPickupDate;
}

- (_INPBTimestamp)estimatedDropOffDate
{
  return self->_estimatedDropOffDate;
}

- (_INPBLocationValue)dropOffLocation
{
  return self->_dropOffLocation;
}

- (_INPBRideDriver)driver
{
  return self->_driver;
}

- (_INPBRideCompletionStatus)completionStatus
{
  return self->_completionStatus;
}

- (NSArray)additionalActionItems
{
  return self->_additionalActionItems;
}

- (id)dictionaryRepresentation
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_additionalActionItems count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v5 = self->_additionalActionItems;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v51 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v50 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"additionalActionItems"];
  }
  v11 = [(_INPBRideStatus *)self completionStatus];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"completionStatus"];

  v13 = [(_INPBRideStatus *)self driver];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"driver"];

  v15 = [(_INPBRideStatus *)self dropOffLocation];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"dropOffLocation"];

  v17 = [(_INPBRideStatus *)self estimatedDropOffDate];
  v18 = [v17 dictionaryRepresentation];
  [v3 setObject:v18 forKeyedSubscript:@"estimatedDropOffDate"];

  v19 = [(_INPBRideStatus *)self estimatedPickupDate];
  v20 = [v19 dictionaryRepresentation];
  [v3 setObject:v20 forKeyedSubscript:@"estimatedPickupDate"];

  v21 = [(_INPBRideStatus *)self estimatedPickupEndDate];
  v22 = [v21 dictionaryRepresentation];
  [v3 setObject:v22 forKeyedSubscript:@"estimatedPickupEndDate"];

  if ([(_INPBRideStatus *)self hasPhase])
  {
    uint64_t v23 = [(_INPBRideStatus *)self phase];
    int v24 = v23 - 1;
    if (v23 - 1) < 7 && ((0x6Fu >> v24))
    {
      v25 = off_1E551A4A0[v24];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v23);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v25 forKeyedSubscript:@"phase"];
  }
  v26 = [(_INPBRideStatus *)self pickupLocation];
  v27 = [v26 dictionaryRepresentation];
  [v3 setObject:v27 forKeyedSubscript:@"pickupLocation"];

  if (self->_rideIdentifier)
  {
    v28 = [(_INPBRideStatus *)self rideIdentifier];
    v29 = (void *)[v28 copy];
    [v3 setObject:v29 forKeyedSubscript:@"rideIdentifier"];
  }
  v30 = [(_INPBRideStatus *)self rideOption];
  v31 = [v30 dictionaryRepresentation];
  [v3 setObject:v31 forKeyedSubscript:@"rideOption"];

  v32 = [(_INPBRideStatus *)self scheduledPickupTime];
  v33 = [v32 dictionaryRepresentation];
  [v3 setObject:v33 forKeyedSubscript:@"scheduledPickupTime"];

  v34 = [(_INPBRideStatus *)self userActivityForCancelingInApplication];
  v35 = [v34 dictionaryRepresentation];
  [v3 setObject:v35 forKeyedSubscript:@"userActivityForCancelingInApplication"];

  v36 = [(_INPBRideStatus *)self vehicle];
  v37 = [v36 dictionaryRepresentation];
  [v3 setObject:v37 forKeyedSubscript:@"vehicle"];

  if ([(NSArray *)self->_waypoints count])
  {
    v38 = [MEMORY[0x1E4F1CA48] array];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v39 = self->_waypoints;
    uint64_t v40 = [(NSArray *)v39 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v47 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = [*(id *)(*((void *)&v46 + 1) + 8 * j) dictionaryRepresentation];
          [v38 addObject:v44];
        }
        uint64_t v41 = [(NSArray *)v39 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v41);
    }

    [v3 setObject:v38 forKeyedSubscript:@"waypoints"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_additionalActionItems hash];
  unint64_t v4 = [(_INPBRideCompletionStatus *)self->_completionStatus hash];
  unint64_t v5 = [(_INPBRideDriver *)self->_driver hash];
  unint64_t v6 = [(_INPBLocationValue *)self->_dropOffLocation hash];
  unint64_t v7 = [(_INPBTimestamp *)self->_estimatedDropOffDate hash];
  unint64_t v8 = [(_INPBTimestamp *)self->_estimatedPickupDate hash];
  unint64_t v9 = [(_INPBTimestamp *)self->_estimatedPickupEndDate hash];
  if ([(_INPBRideStatus *)self hasPhase]) {
    uint64_t v10 = 2654435761 * self->_phase;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  unint64_t v12 = v10 ^ [(_INPBLocationValue *)self->_pickupLocation hash];
  NSUInteger v13 = v12 ^ [(NSString *)self->_rideIdentifier hash];
  unint64_t v14 = v11 ^ v13 ^ [(_INPBRideOption *)self->_rideOption hash];
  unint64_t v15 = [(_INPBDateTimeRangeValue *)self->_scheduledPickupTime hash];
  unint64_t v16 = v15 ^ [(_INPBUserActivity *)self->_userActivityForCancelingInApplication hash];
  unint64_t v17 = v16 ^ [(_INPBRideVehicle *)self->_vehicle hash];
  return v14 ^ v17 ^ [(NSArray *)self->_waypoints hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_76;
  }
  unint64_t v5 = [(_INPBRideStatus *)self additionalActionItems];
  unint64_t v6 = [v4 additionalActionItems];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_75;
  }
  uint64_t v7 = [(_INPBRideStatus *)self additionalActionItems];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_INPBRideStatus *)self additionalActionItems];
    uint64_t v10 = [v4 additionalActionItems];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRideStatus *)self completionStatus];
  unint64_t v6 = [v4 completionStatus];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_75;
  }
  uint64_t v12 = [(_INPBRideStatus *)self completionStatus];
  if (v12)
  {
    NSUInteger v13 = (void *)v12;
    unint64_t v14 = [(_INPBRideStatus *)self completionStatus];
    unint64_t v15 = [v4 completionStatus];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRideStatus *)self driver];
  unint64_t v6 = [v4 driver];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_75;
  }
  uint64_t v17 = [(_INPBRideStatus *)self driver];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBRideStatus *)self driver];
    v20 = [v4 driver];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRideStatus *)self dropOffLocation];
  unint64_t v6 = [v4 dropOffLocation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_75;
  }
  uint64_t v22 = [(_INPBRideStatus *)self dropOffLocation];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    int v24 = [(_INPBRideStatus *)self dropOffLocation];
    v25 = [v4 dropOffLocation];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRideStatus *)self estimatedDropOffDate];
  unint64_t v6 = [v4 estimatedDropOffDate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_75;
  }
  uint64_t v27 = [(_INPBRideStatus *)self estimatedDropOffDate];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBRideStatus *)self estimatedDropOffDate];
    v30 = [v4 estimatedDropOffDate];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRideStatus *)self estimatedPickupDate];
  unint64_t v6 = [v4 estimatedPickupDate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_75;
  }
  uint64_t v32 = [(_INPBRideStatus *)self estimatedPickupDate];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_INPBRideStatus *)self estimatedPickupDate];
    v35 = [v4 estimatedPickupDate];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRideStatus *)self estimatedPickupEndDate];
  unint64_t v6 = [v4 estimatedPickupEndDate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_75;
  }
  uint64_t v37 = [(_INPBRideStatus *)self estimatedPickupEndDate];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_INPBRideStatus *)self estimatedPickupEndDate];
    uint64_t v40 = [v4 estimatedPickupEndDate];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  int v42 = [(_INPBRideStatus *)self hasPhase];
  if (v42 != [v4 hasPhase]) {
    goto LABEL_76;
  }
  if ([(_INPBRideStatus *)self hasPhase])
  {
    if ([v4 hasPhase])
    {
      int phase = self->_phase;
      if (phase != [v4 phase]) {
        goto LABEL_76;
      }
    }
  }
  unint64_t v5 = [(_INPBRideStatus *)self pickupLocation];
  unint64_t v6 = [v4 pickupLocation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_75;
  }
  uint64_t v44 = [(_INPBRideStatus *)self pickupLocation];
  if (v44)
  {
    v45 = (void *)v44;
    long long v46 = [(_INPBRideStatus *)self pickupLocation];
    long long v47 = [v4 pickupLocation];
    int v48 = [v46 isEqual:v47];

    if (!v48) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRideStatus *)self rideIdentifier];
  unint64_t v6 = [v4 rideIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_75;
  }
  uint64_t v49 = [(_INPBRideStatus *)self rideIdentifier];
  if (v49)
  {
    long long v50 = (void *)v49;
    long long v51 = [(_INPBRideStatus *)self rideIdentifier];
    long long v52 = [v4 rideIdentifier];
    int v53 = [v51 isEqual:v52];

    if (!v53) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRideStatus *)self rideOption];
  unint64_t v6 = [v4 rideOption];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_75;
  }
  uint64_t v54 = [(_INPBRideStatus *)self rideOption];
  if (v54)
  {
    v55 = (void *)v54;
    uint64_t v56 = [(_INPBRideStatus *)self rideOption];
    v57 = [v4 rideOption];
    int v58 = [v56 isEqual:v57];

    if (!v58) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRideStatus *)self scheduledPickupTime];
  unint64_t v6 = [v4 scheduledPickupTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_75;
  }
  uint64_t v59 = [(_INPBRideStatus *)self scheduledPickupTime];
  if (v59)
  {
    v60 = (void *)v59;
    v61 = [(_INPBRideStatus *)self scheduledPickupTime];
    v62 = [v4 scheduledPickupTime];
    int v63 = [v61 isEqual:v62];

    if (!v63) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRideStatus *)self userActivityForCancelingInApplication];
  unint64_t v6 = [v4 userActivityForCancelingInApplication];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_75;
  }
  uint64_t v64 = [(_INPBRideStatus *)self userActivityForCancelingInApplication];
  if (v64)
  {
    v65 = (void *)v64;
    v66 = [(_INPBRideStatus *)self userActivityForCancelingInApplication];
    v67 = [v4 userActivityForCancelingInApplication];
    int v68 = [v66 isEqual:v67];

    if (!v68) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRideStatus *)self vehicle];
  unint64_t v6 = [v4 vehicle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_75;
  }
  uint64_t v69 = [(_INPBRideStatus *)self vehicle];
  if (v69)
  {
    v70 = (void *)v69;
    v71 = [(_INPBRideStatus *)self vehicle];
    v72 = [v4 vehicle];
    int v73 = [v71 isEqual:v72];

    if (!v73) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRideStatus *)self waypoints];
  unint64_t v6 = [v4 waypoints];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v74 = [(_INPBRideStatus *)self waypoints];
    if (!v74)
    {

LABEL_79:
      BOOL v79 = 1;
      goto LABEL_77;
    }
    v75 = (void *)v74;
    v76 = [(_INPBRideStatus *)self waypoints];
    v77 = [v4 waypoints];
    char v78 = [v76 isEqual:v77];

    if (v78) {
      goto LABEL_79;
    }
  }
  else
  {
LABEL_75:
  }
LABEL_76:
  BOOL v79 = 0;
LABEL_77:

  return v79;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBRideStatus allocWithZone:](_INPBRideStatus, "allocWithZone:") init];
  unint64_t v6 = (void *)[(NSArray *)self->_additionalActionItems copyWithZone:a3];
  [(_INPBRideStatus *)v5 setAdditionalActionItems:v6];

  id v7 = [(_INPBRideCompletionStatus *)self->_completionStatus copyWithZone:a3];
  [(_INPBRideStatus *)v5 setCompletionStatus:v7];

  id v8 = [(_INPBRideDriver *)self->_driver copyWithZone:a3];
  [(_INPBRideStatus *)v5 setDriver:v8];

  id v9 = [(_INPBLocationValue *)self->_dropOffLocation copyWithZone:a3];
  [(_INPBRideStatus *)v5 setDropOffLocation:v9];

  id v10 = [(_INPBTimestamp *)self->_estimatedDropOffDate copyWithZone:a3];
  [(_INPBRideStatus *)v5 setEstimatedDropOffDate:v10];

  id v11 = [(_INPBTimestamp *)self->_estimatedPickupDate copyWithZone:a3];
  [(_INPBRideStatus *)v5 setEstimatedPickupDate:v11];

  id v12 = [(_INPBTimestamp *)self->_estimatedPickupEndDate copyWithZone:a3];
  [(_INPBRideStatus *)v5 setEstimatedPickupEndDate:v12];

  if ([(_INPBRideStatus *)self hasPhase]) {
    [(_INPBRideStatus *)v5 setPhase:[(_INPBRideStatus *)self phase]];
  }
  id v13 = [(_INPBLocationValue *)self->_pickupLocation copyWithZone:a3];
  [(_INPBRideStatus *)v5 setPickupLocation:v13];

  unint64_t v14 = (void *)[(NSString *)self->_rideIdentifier copyWithZone:a3];
  [(_INPBRideStatus *)v5 setRideIdentifier:v14];

  id v15 = [(_INPBRideOption *)self->_rideOption copyWithZone:a3];
  [(_INPBRideStatus *)v5 setRideOption:v15];

  id v16 = [(_INPBDateTimeRangeValue *)self->_scheduledPickupTime copyWithZone:a3];
  [(_INPBRideStatus *)v5 setScheduledPickupTime:v16];

  id v17 = [(_INPBUserActivity *)self->_userActivityForCancelingInApplication copyWithZone:a3];
  [(_INPBRideStatus *)v5 setUserActivityForCancelingInApplication:v17];

  id v18 = [(_INPBRideVehicle *)self->_vehicle copyWithZone:a3];
  [(_INPBRideStatus *)v5 setVehicle:v18];

  v19 = (void *)[(NSArray *)self->_waypoints copyWithZone:a3];
  [(_INPBRideStatus *)v5 setWaypoints:v19];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBRideStatus *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBRideStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBRideStatus *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBRideStatus *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBRideStatus *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  unint64_t v5 = self->_additionalActionItems;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v43;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v7);
  }

  id v10 = [(_INPBRideStatus *)self completionStatus];

  if (v10)
  {
    id v11 = [(_INPBRideStatus *)self completionStatus];
    PBDataWriterWriteSubmessage();
  }
  id v12 = [(_INPBRideStatus *)self driver];

  if (v12)
  {
    id v13 = [(_INPBRideStatus *)self driver];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v14 = [(_INPBRideStatus *)self dropOffLocation];

  if (v14)
  {
    id v15 = [(_INPBRideStatus *)self dropOffLocation];
    PBDataWriterWriteSubmessage();
  }
  id v16 = [(_INPBRideStatus *)self estimatedDropOffDate];

  if (v16)
  {
    id v17 = [(_INPBRideStatus *)self estimatedDropOffDate];
    PBDataWriterWriteSubmessage();
  }
  id v18 = [(_INPBRideStatus *)self estimatedPickupDate];

  if (v18)
  {
    v19 = [(_INPBRideStatus *)self estimatedPickupDate];
    PBDataWriterWriteSubmessage();
  }
  v20 = [(_INPBRideStatus *)self estimatedPickupEndDate];

  if (v20)
  {
    int v21 = [(_INPBRideStatus *)self estimatedPickupEndDate];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBRideStatus *)self hasPhase]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v22 = [(_INPBRideStatus *)self pickupLocation];

  if (v22)
  {
    uint64_t v23 = [(_INPBRideStatus *)self pickupLocation];
    PBDataWriterWriteSubmessage();
  }
  int v24 = [(_INPBRideStatus *)self rideIdentifier];

  if (v24) {
    PBDataWriterWriteStringField();
  }
  v25 = [(_INPBRideStatus *)self rideOption];

  if (v25)
  {
    int v26 = [(_INPBRideStatus *)self rideOption];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v27 = [(_INPBRideStatus *)self scheduledPickupTime];

  if (v27)
  {
    v28 = [(_INPBRideStatus *)self scheduledPickupTime];
    PBDataWriterWriteSubmessage();
  }
  v29 = [(_INPBRideStatus *)self userActivityForCancelingInApplication];

  if (v29)
  {
    v30 = [(_INPBRideStatus *)self userActivityForCancelingInApplication];
    PBDataWriterWriteSubmessage();
  }
  int v31 = [(_INPBRideStatus *)self vehicle];

  if (v31)
  {
    uint64_t v32 = [(_INPBRideStatus *)self vehicle];
    PBDataWriterWriteSubmessage();
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v33 = self->_waypoints;
  uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v39;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v39 != v36) {
          objc_enumerationMutation(v33);
        }
        PBDataWriterWriteSubmessage();
        ++v37;
      }
      while (v35 != v37);
      uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v35);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRideStatusReadFrom(self, (uint64_t)a3);
}

- (id)waypointsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_waypoints objectAtIndexedSubscript:a3];
}

- (unint64_t)waypointsCount
{
  return [(NSArray *)self->_waypoints count];
}

- (void)addWaypoints:(id)a3
{
  id v4 = a3;
  waypoints = self->_waypoints;
  id v8 = v4;
  if (!waypoints)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_waypoints;
    self->_waypoints = v6;

    id v4 = v8;
    waypoints = self->_waypoints;
  }
  [(NSArray *)waypoints addObject:v4];
}

- (void)clearWaypoints
{
}

- (void)setWaypoints:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  waypoints = self->_waypoints;
  self->_waypoints = v4;

  MEMORY[0x1F41817F8](v4, waypoints);
}

- (BOOL)hasVehicle
{
  return self->_vehicle != 0;
}

- (void)setVehicle:(id)a3
{
}

- (BOOL)hasUserActivityForCancelingInApplication
{
  return self->_userActivityForCancelingInApplication != 0;
}

- (void)setUserActivityForCancelingInApplication:(id)a3
{
}

- (BOOL)hasScheduledPickupTime
{
  return self->_scheduledPickupTime != 0;
}

- (void)setScheduledPickupTime:(id)a3
{
}

- (BOOL)hasRideOption
{
  return self->_rideOption != 0;
}

- (void)setRideOption:(id)a3
{
}

- (BOOL)hasRideIdentifier
{
  return self->_rideIdentifier != 0;
}

- (void)setRideIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  rideIdentifier = self->_rideIdentifier;
  self->_rideIdentifier = v4;

  MEMORY[0x1F41817F8](v4, rideIdentifier);
}

- (BOOL)hasPickupLocation
{
  return self->_pickupLocation != 0;
}

- (void)setPickupLocation:(id)a3
{
}

- (int)StringAsPhase:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RECEIVED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONFIRMED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ONGOING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"COMPLETED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"APPROACHING_PICKUP"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PICKUP"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)phaseAsString:(int)a3
{
  int v3 = a3 - 1;
  if (a3 - 1) < 7 && ((0x6Fu >> v3))
  {
    int v4 = off_1E551A4A0[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)setHasPhase:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPhase
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPhase:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int phase = a3;
  }
}

- (BOOL)hasEstimatedPickupEndDate
{
  return self->_estimatedPickupEndDate != 0;
}

- (void)setEstimatedPickupEndDate:(id)a3
{
}

- (BOOL)hasEstimatedPickupDate
{
  return self->_estimatedPickupDate != 0;
}

- (void)setEstimatedPickupDate:(id)a3
{
}

- (BOOL)hasEstimatedDropOffDate
{
  return self->_estimatedDropOffDate != 0;
}

- (void)setEstimatedDropOffDate:(id)a3
{
}

- (BOOL)hasDropOffLocation
{
  return self->_dropOffLocation != 0;
}

- (void)setDropOffLocation:(id)a3
{
}

- (BOOL)hasDriver
{
  return self->_driver != 0;
}

- (void)setDriver:(id)a3
{
}

- (BOOL)hasCompletionStatus
{
  return self->_completionStatus != 0;
}

- (void)setCompletionStatus:(id)a3
{
}

- (id)additionalActionItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_additionalActionItems objectAtIndexedSubscript:a3];
}

- (unint64_t)additionalActionItemsCount
{
  return [(NSArray *)self->_additionalActionItems count];
}

- (void)addAdditionalActionItems:(id)a3
{
  id v4 = a3;
  additionalActionItems = self->_additionalActionItems;
  id v8 = v4;
  if (!additionalActionItems)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_additionalActionItems;
    self->_additionalActionItems = v6;

    id v4 = v8;
    additionalActionItems = self->_additionalActionItems;
  }
  [(NSArray *)additionalActionItems addObject:v4];
}

- (void)clearAdditionalActionItems
{
}

- (void)setAdditionalActionItems:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  additionalActionItems = self->_additionalActionItems;
  self->_additionalActionItems = v4;

  MEMORY[0x1F41817F8](v4, additionalActionItems);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)waypointsType
{
  return (Class)objc_opt_class();
}

+ (Class)additionalActionItemsType
{
  return (Class)objc_opt_class();
}

@end