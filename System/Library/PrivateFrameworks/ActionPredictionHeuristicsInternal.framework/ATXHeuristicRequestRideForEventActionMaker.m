@interface ATXHeuristicRequestRideForEventActionMaker
+ (BOOL)supportsSecureCoding;
- (ATXHeuristicRequestRideForEventActionMaker)initWithCoder:(id)a3;
- (ATXHeuristicRequestRideForEventActionMaker)initWithTitle:(id)a3 subtitle:(id)a4 pickupLocation:(id)a5 dropoffEvent:(id)a6 preferredAppBundleID:(id)a7;
- (BOOL)shouldPredictDropOffLocationGivenPickupLocation:(id)a3 andDropOffLocation:(id)a4;
- (id)_makeAction;
- (id)actionTypeName;
- (id)dropOffLocationFromEKEvent:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXHeuristicRequestRideForEventActionMaker

- (ATXHeuristicRequestRideForEventActionMaker)initWithTitle:(id)a3 subtitle:(id)a4 pickupLocation:(id)a5 dropoffEvent:(id)a6 preferredAppBundleID:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ATXHeuristicRequestRideForEventActionMaker;
  v17 = [(ATXHeuristicRequestRideForEventActionMaker *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->super._title, a3);
    objc_storeStrong((id *)&v18->super._subtitle, a4);
    objc_storeStrong((id *)&v18->_pickupLocation, a5);
    objc_storeStrong((id *)&v18->_dropoffEvent, a6);
    objc_storeStrong((id *)&v18->_preferredAppBundleID, a7);
  }

  return v18;
}

- (id)dropOffLocationFromEKEvent:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v4 structuredLocation];
      v6 = [v5 geoLocation];

      goto LABEL_9;
    }
    v7 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicCreateCalendarEventActionMaker _makeAction].cold.4();
    }
  }
  else
  {
    v7 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(ATXHeuristicActionMaker *)self heuristic];
      int v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1D0F43000, v7, OS_LOG_TYPE_DEFAULT, "Failed to create drop off location because of nil ekEvent. Heuristic: %@.", (uint8_t *)&v10, 0xCu);
    }
  }

  v6 = 0;
LABEL_9:

  return v6;
}

- (BOOL)shouldPredictDropOffLocationGivenPickupLocation:(id)a3 andDropOffLocation:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  BOOL v10 = !v9;
  if (v6 && v7)
  {
    [(CLLocation *)self->_pickupLocation distanceFromLocation:v7];
    double v12 = v11;
    if (v11 > 96600.0)
    {
      id v13 = __atxlog_handle_heuristic();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(ATXHeuristicActionMaker *)self heuristic];
        int v16 = 134218242;
        double v17 = v12 / 1610.0;
        __int16 v18 = 2112;
        v19 = v14;
        _os_log_impl(&dword_1D0F43000, v13, OS_LOG_TYPE_DEFAULT, "Dropoff location of %f miles is more than 40 miles away from pickup location . Heuristic: %@.", (uint8_t *)&v16, 0x16u);
      }
      BOOL v10 = 0;
    }
    else
    {
      BOOL v10 = 1;
    }
  }

  return v10;
}

- (id)_makeAction
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v3 = [(ATXHeuristicObjectHandle *)self->_dropoffEvent obj];
  id v4 = [(ATXHeuristicRequestRideForEventActionMaker *)self dropOffLocationFromEKEvent:v3];
  if ([(ATXHeuristicRequestRideForEventActionMaker *)self shouldPredictDropOffLocationGivenPickupLocation:self->_pickupLocation andDropOffLocation:v4])
  {
    v5 = (void *)MEMORY[0x1E4F1E630];
    id v6 = [v3 structuredLocation];
    id v7 = [v6 title];
    v8 = [v5 placemarkWithLocation:v4 name:v7 postalAddress:0];

    BOOL v9 = [v3 eventIdentifier];

    if (v9)
    {
      uint64_t v19 = *MEMORY[0x1E4F4AD90];
      BOOL v10 = [v3 eventIdentifier];
      v20[0] = v10;
      BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    }
  }
  else
  {
    v8 = 0;
    BOOL v9 = 0;
  }
  pickupLocation = self->_pickupLocation;
  if (pickupLocation)
  {
    double v12 = [MEMORY[0x1E4F1E630] placemarkWithLocation:pickupLocation name:0 postalAddress:0];
  }
  else
  {
    double v12 = 0;
  }
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F30630]) initWithPickupLocation:v12 dropOffLocation:v8 rideOptionName:0 partySize:0 paymentMethod:0 scheduledPickupTime:0];
  [v13 _setLaunchId:self->_preferredAppBundleID];
  id v14 = objc_alloc(MEMORY[0x1E4F4AE38]);
  id v15 = objc_opt_new();
  LOBYTE(v18) = 0;
  int v16 = (void *)[v14 initWithIntent:v13 actionUUID:v15 bundleId:self->_preferredAppBundleID heuristic:0 heuristicMetadata:v9 criteria:0 isFutureMedia:v18 title:self->super._title subtitle:self->super._subtitle];

  return v16;
}

- (id)actionTypeName
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHeuristicRequestRideForEventActionMaker)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXHeuristicRequestRideForEventActionMaker;
  v5 = [(ATXHeuristicActionMaker *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pickupLocation"];
    pickupLocation = v5->_pickupLocation;
    v5->_pickupLocation = (CLLocation *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dropoffEvent"];
    dropoffEvent = v5->_dropoffEvent;
    v5->_dropoffEvent = (ATXHeuristicObjectHandle *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredAppBundleID"];
    preferredAppBundleID = v5->_preferredAppBundleID;
    v5->_preferredAppBundleID = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ATXHeuristicRequestRideForEventActionMaker;
  [(ATXHeuristicActionMaker *)&v7 encodeWithCoder:v4];
  pickupLocation = self->_pickupLocation;
  if (pickupLocation) {
    [v4 encodeObject:pickupLocation forKey:@"pickupLocation"];
  }
  dropoffEvent = self->_dropoffEvent;
  if (dropoffEvent) {
    [v4 encodeObject:dropoffEvent forKey:@"dropoffEvent"];
  }
  [v4 encodeObject:self->_preferredAppBundleID forKey:@"preferredAppBundleID"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredAppBundleID, 0);
  objc_storeStrong((id *)&self->_dropoffEvent, 0);

  objc_storeStrong((id *)&self->_pickupLocation, 0);
}

@end