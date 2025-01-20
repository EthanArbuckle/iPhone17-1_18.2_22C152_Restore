@interface MSPSharedTripNotificationRules
+ (BOOL)supportsSecureCoding;
+ (id)unarchivingObjectsSet;
- (BOOL)hasMadeFinalPush;
- (BOOL)hasSentNotificationType:(unint64_t)a3 forState:(id)a4 waypoint:(id)a5;
- (MSPSharedTripNotificationRules)init;
- (MSPSharedTripNotificationRules)initWithCoder:(id)a3;
- (MSPSharedTripNotificationRules)initWithMaximumNumberOfNotifications:(unint64_t)a3;
- (MSPSharedTripNotificationRules)initWithMaximumNumberOfNotifications:(unint64_t)a3 minimumNotificationInterval:(double)a4;
- (NSDate)currentETADate;
- (NSDate)lastPostedETADate;
- (NSDate)lastPostedNotificationDate;
- (NSDate)lastUpdatedDate;
- (NSMapTable)intermediateArrivalWaypointPostedNotifications;
- (double)minimumETADifference;
- (double)minimumETADifferenceIncrement;
- (double)minimumNotificationInterval;
- (id)description;
- (unint64_t)currentlyNecessaryNotificationTypeForState:(id)a3;
- (unint64_t)maxPostedNotifications;
- (unint64_t)postedNotifications;
- (void)didPostNotificationType:(unint64_t)a3 forState:(id)a4;
- (void)didReceiveUpdateWithETA:(double)a3 lastUpdated:(double)a4;
- (void)encodeWithCoder:(id)a3;
- (void)incrementMinimumETADifference;
- (void)setCurrentETADate:(id)a3;
- (void)setHasMadeFinalPush:(BOOL)a3;
- (void)setIntermediateArrivalWaypointPostedNotifications:(id)a3;
- (void)setLastPostedETADate:(id)a3;
- (void)setLastPostedNotificationDate:(id)a3;
- (void)setLastUpdatedDate:(id)a3;
- (void)setMaxPostedNotifications:(unint64_t)a3;
- (void)setMinimumETADifference:(double)a3;
- (void)setMinimumNotificationInterval:(double)a3;
- (void)setPostedNotifications:(unint64_t)a3;
@end

@implementation MSPSharedTripNotificationRules

+ (id)unarchivingObjectsSet
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = NSNumber;
  unint64_t maxPostedNotifications = self->_maxPostedNotifications;
  id v6 = a3;
  uint64_t v7 = [v4 numberWithUnsignedInteger:maxPostedNotifications];
  uint64_t v8 = NSStringFromSelector(sel_maxPostedNotifications);
  [v6 encodeObject:v7 forKey:v8];

  v9 = [NSNumber numberWithUnsignedInteger:self->_postedNotifications];
  v10 = NSStringFromSelector(sel_postedNotifications);
  [v6 encodeObject:v9 forKey:v10];

  double minimumETADifference = self->_minimumETADifference;
  v12 = NSStringFromSelector(sel_minimumETADifference);
  [v6 encodeDouble:v12 forKey:minimumETADifference];

  double minimumNotificationInterval = self->_minimumNotificationInterval;
  v14 = NSStringFromSelector(sel_minimumNotificationInterval);
  [v6 encodeDouble:v14 forKey:minimumNotificationInterval];

  lastPostedETADate = self->_lastPostedETADate;
  v16 = NSStringFromSelector(sel_lastPostedETADate);
  [v6 encodeObject:lastPostedETADate forKey:v16];

  lastPostedNotificationDate = self->_lastPostedNotificationDate;
  v18 = NSStringFromSelector(sel_lastPostedNotificationDate);
  [v6 encodeObject:lastPostedNotificationDate forKey:v18];

  lastUpdatedDate = self->_lastUpdatedDate;
  v20 = NSStringFromSelector(sel_lastUpdatedDate);
  [v6 encodeObject:lastUpdatedDate forKey:v20];

  BOOL hasMadeFinalPush = self->_hasMadeFinalPush;
  v22 = NSStringFromSelector(sel_hasMadeFinalPush);
  [v6 encodeBool:hasMadeFinalPush forKey:v22];

  intermediateArrivalWaypointPostedNotifications = self->_intermediateArrivalWaypointPostedNotifications;
  NSStringFromSelector(sel_intermediateArrivalWaypointPostedNotifications);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:intermediateArrivalWaypointPostedNotifications forKey:v24];
}

- (MSPSharedTripNotificationRules)initWithCoder:(id)a3
{
  v37[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_maxPostedNotifications);
  id v6 = [v4 decodeObjectForKey:v5];
  uint64_t v7 = [v6 unsignedIntegerValue];

  uint64_t v8 = NSStringFromSelector(sel_minimumNotificationInterval);
  [v4 decodeDoubleForKey:v8];
  double v10 = v9;

  v11 = [(MSPSharedTripNotificationRules *)self initWithMaximumNumberOfNotifications:v7 minimumNotificationInterval:v10];
  if (v11)
  {
    uint64_t v12 = objc_opt_class();
    v13 = NSStringFromSelector(sel_postedNotifications);
    v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    v11->_postedNotifications = [v14 unsignedIntegerValue];

    v15 = NSStringFromSelector(sel_minimumETADifference);
    [v4 decodeDoubleForKey:v15];
    v11->_double minimumETADifference = v16;

    uint64_t v17 = objc_opt_class();
    v18 = NSStringFromSelector(sel_lastPostedETADate);
    uint64_t v19 = [v4 decodeObjectOfClass:v17 forKey:v18];
    lastPostedETADate = v11->_lastPostedETADate;
    v11->_lastPostedETADate = (NSDate *)v19;

    uint64_t v21 = objc_opt_class();
    v22 = NSStringFromSelector(sel_lastPostedNotificationDate);
    uint64_t v23 = [v4 decodeObjectOfClass:v21 forKey:v22];
    lastPostedNotificationDate = v11->_lastPostedNotificationDate;
    v11->_lastPostedNotificationDate = (NSDate *)v23;

    uint64_t v25 = objc_opt_class();
    v26 = NSStringFromSelector(sel_lastUpdatedDate);
    uint64_t v27 = [v4 decodeObjectOfClass:v25 forKey:v26];
    lastUpdatedDate = v11->_lastUpdatedDate;
    v11->_lastUpdatedDate = (NSDate *)v27;

    v29 = NSStringFromSelector(sel_hasMadeFinalPush);
    v11->_BOOL hasMadeFinalPush = [v4 decodeBoolForKey:v29];

    v30 = (void *)MEMORY[0x1E4F1CAD0];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    v37[2] = objc_opt_class();
    v37[3] = objc_opt_class();
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
    v32 = [v30 setWithArray:v31];
    v33 = NSStringFromSelector(sel_intermediateArrivalWaypointPostedNotifications);
    uint64_t v34 = [v4 decodeObjectOfClasses:v32 forKey:v33];
    intermediateArrivalWaypointPostedNotifications = v11->_intermediateArrivalWaypointPostedNotifications;
    v11->_intermediateArrivalWaypointPostedNotifications = (NSMapTable *)v34;
  }
  return v11;
}

- (MSPSharedTripNotificationRules)init
{
  uint64_t UInteger = GEOConfigGetUInteger();
  GEOConfigGetDouble();

  return -[MSPSharedTripNotificationRules initWithMaximumNumberOfNotifications:minimumNotificationInterval:](self, "initWithMaximumNumberOfNotifications:minimumNotificationInterval:", UInteger);
}

- (MSPSharedTripNotificationRules)initWithMaximumNumberOfNotifications:(unint64_t)a3
{
  GEOConfigGetDouble();

  return -[MSPSharedTripNotificationRules initWithMaximumNumberOfNotifications:minimumNotificationInterval:](self, "initWithMaximumNumberOfNotifications:minimumNotificationInterval:", a3);
}

- (MSPSharedTripNotificationRules)initWithMaximumNumberOfNotifications:(unint64_t)a3 minimumNotificationInterval:(double)a4
{
  v16.receiver = self;
  v16.super_class = (Class)MSPSharedTripNotificationRules;
  id v6 = [(MSPSharedTripNotificationRules *)&v16 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_double minimumNotificationInterval = a4;
    v6->_unint64_t maxPostedNotifications = a3;
    GEOConfigGetDouble();
    v7->_double minimumETADifference = v8;
    v7->_postedNotifications = 0;
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
    lastPostedETADate = v7->_lastPostedETADate;
    v7->_lastPostedETADate = (NSDate *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
    lastPostedNotificationDate = v7->_lastPostedNotificationDate;
    v7->_lastPostedNotificationDate = (NSDate *)v11;

    v7->_BOOL hasMadeFinalPush = 0;
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    intermediateArrivalWaypointPostedNotifications = v7->_intermediateArrivalWaypointPostedNotifications;
    v7->_intermediateArrivalWaypointPostedNotifications = (NSMapTable *)v13;
  }
  return v7;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MSPSharedTripNotificationRules postedNotifications](self, "postedNotifications"));
  uint64_t v5 = [(MSPSharedTripNotificationRules *)self lastPostedNotificationDate];
  id v6 = [(MSPSharedTripNotificationRules *)self lastPostedETADate];
  uint64_t v7 = [(MSPSharedTripNotificationRules *)self lastUpdatedDate];
  BOOL v8 = [(MSPSharedTripNotificationRules *)self hasMadeFinalPush];
  uint64_t v9 = @"NO";
  if (v8) {
    uint64_t v9 = @"YES";
  }
  double v10 = [v3 stringWithFormat:@"postedNotifications %@ \nlastPostedNotificationDate %@ \nlastPostedETADate %@ \nlastUpdatedDate %@ \nhasMadeFinalPush %@", v4, v5, v6, v7, v9];

  return v10;
}

- (void)didPostNotificationType:(unint64_t)a3 forState:(id)a4
{
  id v20 = a4;
  if ([v20 waypointInfosCount])
  {
    if ([v20 hasCurrentWaypointIndex])
    {
      unsigned int v6 = [v20 currentWaypointIndex];
      if ([v20 waypointInfosCount] > (unint64_t)v6)
      {
        uint64_t v7 = [v20 waypointInfos];
        BOOL v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v20, "currentWaypointIndex"));

        if ([v8 hasUniqueIdentifier])
        {
          uint64_t v9 = [(MSPSharedTripNotificationRules *)self intermediateArrivalWaypointPostedNotifications];
          double v10 = [v8 uniqueIdentifier];
          uint64_t v11 = [v9 objectForKey:v10];
          uint64_t v12 = v11;
          if (v11) {
            id v13 = v11;
          }
          else {
            id v13 = (id)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:0 capacity:1];
          }
          v14 = v13;

          v15 = [NSNumber numberWithUnsignedInteger:a3];
          [v14 addObject:v15];

          objc_super v16 = [(MSPSharedTripNotificationRules *)self intermediateArrivalWaypointPostedNotifications];
          uint64_t v17 = [v8 uniqueIdentifier];
          [v16 setObject:v14 forKey:v17];
        }
      }
    }
  }
  v18 = [(MSPSharedTripNotificationRules *)self currentETADate];
  [(MSPSharedTripNotificationRules *)self setLastPostedETADate:v18];

  uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
  [(MSPSharedTripNotificationRules *)self setLastPostedNotificationDate:v19];

  [(MSPSharedTripNotificationRules *)self setPostedNotifications:[(MSPSharedTripNotificationRules *)self postedNotifications] + 1];
  [(MSPSharedTripNotificationRules *)self incrementMinimumETADifference];
}

- (unint64_t)currentlyNecessaryNotificationTypeForState:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MSPSharedTripNotificationRules *)self hasMadeFinalPush])
  {
    unint64_t v5 = 0;
  }
  else
  {
    if ([v4 waypointInfosCount]
      && [v4 hasCurrentWaypointIndex]
      && (unsigned int v6 = [v4 currentWaypointIndex], objc_msgSend(v4, "waypointInfosCount") > (unint64_t)v6))
    {
      uint64_t v7 = [v4 waypointInfos];
      BOOL v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "currentWaypointIndex"));
    }
    else
    {
      BOOL v8 = 0;
    }
    uint64_t v9 = [(MSPSharedTripNotificationRules *)self currentETADate];
    [v9 timeIntervalSinceNow];
    double v11 = v10;
    GEOConfigGetDouble();
    double v13 = v12;

    unint64_t v14 = [(MSPSharedTripNotificationRules *)self postedNotifications];
    if (v11 >= v13 || v14 == 0)
    {
      if (![v4 hasResumed]
        || ![v4 resumed]
        || (unint64_t v5 = 5,
            [(MSPSharedTripNotificationRules *)self hasSentNotificationType:5 forState:v4 waypoint:v8]))
      {
        if ([(MSPSharedTripNotificationRules *)self postedNotifications])
        {
          objc_super v16 = [(MSPSharedTripNotificationRules *)self lastPostedNotificationDate];
          [v16 timeIntervalSinceNow];
          double v18 = v17;
          [(MSPSharedTripNotificationRules *)self minimumNotificationInterval];
          double v20 = -v19;

          uint64_t v21 = [(MSPSharedTripNotificationRules *)self currentETADate];
          v22 = [(MSPSharedTripNotificationRules *)self lastPostedETADate];
          [v21 timeIntervalSinceDate:v22];
          double v24 = v23;
          [(MSPSharedTripNotificationRules *)self minimumETADifference];
          BOOL v26 = v24 <= -v25;

          uint64_t v27 = [(MSPSharedTripNotificationRules *)self currentETADate];
          v28 = [(MSPSharedTripNotificationRules *)self lastPostedETADate];
          [v27 timeIntervalSinceDate:v28];
          double v30 = v29;
          [(MSPSharedTripNotificationRules *)self minimumETADifference];
          double v32 = v31;

          int v33 = v30 >= v32 || v26;
          unint64_t v34 = [(MSPSharedTripNotificationRules *)self postedNotifications];
          unint64_t v35 = [(MSPSharedTripNotificationRules *)self maxPostedNotifications];
          unint64_t v36 = v35;
          if (v18 <= v20 && v33 && v34 < v35)
          {
            unint64_t v5 = 2;
          }
          else
          {
            v40 = MSPGetSharedTripLog();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              int v42 = 134218752;
              unint64_t v43 = [(MSPSharedTripNotificationRules *)self postedNotifications];
              __int16 v44 = 1024;
              BOOL v45 = v18 <= v20;
              __int16 v46 = 1024;
              int v47 = v33;
              __int16 v48 = 1024;
              BOOL v49 = v34 < v36;
              _os_log_impl(&dword_1B87E5000, v40, OS_LOG_TYPE_INFO, "[SR] currentlyNecessaryNotificationType postedNotifications: %lu, minimumTimeElapsedSinceLastPush: %d minimumETADifferenceMet: %d isUnderMaximumPushLimit: %d", (uint8_t *)&v42, 0x1Eu);
            }

            unint64_t v5 = 0;
          }
        }
        else
        {
          unint64_t v5 = 1;
        }
      }
    }
    else if ([v4 isNavigatingToIntermediateStop])
    {
      v37 = [v8 chargingStationInfo];

      if (v37)
      {
        unint64_t v5 = 3;
        v38 = self;
        uint64_t v39 = 3;
      }
      else
      {
        unint64_t v5 = 4;
        v38 = self;
        uint64_t v39 = 4;
      }
      if ([(MSPSharedTripNotificationRules *)v38 hasSentNotificationType:v39 forState:v4 waypoint:v8])
      {
        unint64_t v5 = 0;
      }
    }
    else
    {
      [(MSPSharedTripNotificationRules *)self setHasMadeFinalPush:1];
      unint64_t v5 = 6;
    }
  }
  return v5;
}

- (void)didReceiveUpdateWithETA:(double)a3 lastUpdated:(double)a4
{
  unsigned int v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a4];
  [(MSPSharedTripNotificationRules *)self setLastUpdatedDate:v6];

  id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  [(MSPSharedTripNotificationRules *)self setCurrentETADate:v7];
}

- (void)incrementMinimumETADifference
{
  if ([(MSPSharedTripNotificationRules *)self postedNotifications]) {
    double v3 = (double)([(MSPSharedTripNotificationRules *)self postedNotifications] - 1);
  }
  else {
    double v3 = 0.0;
  }
  [(MSPSharedTripNotificationRules *)self minimumETADifferenceIncrement];
  double v5 = v4;
  [(MSPSharedTripNotificationRules *)self minimumETADifference];
  double v7 = v6 + v5 * v3;

  [(MSPSharedTripNotificationRules *)self setMinimumETADifference:v7];
}

- (double)minimumETADifferenceIncrement
{
  GEOConfigGetDouble();
  return result;
}

- (BOOL)hasSentNotificationType:(unint64_t)a3 forState:(id)a4 waypoint:(id)a5
{
  id v7 = a5;
  if ([v7 hasUniqueIdentifier])
  {
    BOOL v8 = [(MSPSharedTripNotificationRules *)self intermediateArrivalWaypointPostedNotifications];
    uint64_t v9 = [v7 uniqueIdentifier];
    double v10 = [v8 objectForKey:v9];
    double v11 = [NSNumber numberWithUnsignedInteger:a3];
    char v12 = [v10 containsObject:v11];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)maxPostedNotifications
{
  return self->_maxPostedNotifications;
}

- (void)setMaxPostedNotifications:(unint64_t)a3
{
  self->_unint64_t maxPostedNotifications = a3;
}

- (unint64_t)postedNotifications
{
  return self->_postedNotifications;
}

- (void)setPostedNotifications:(unint64_t)a3
{
  self->_postedNotifications = a3;
}

- (double)minimumETADifference
{
  return self->_minimumETADifference;
}

- (void)setMinimumETADifference:(double)a3
{
  self->_double minimumETADifference = a3;
}

- (double)minimumNotificationInterval
{
  return self->_minimumNotificationInterval;
}

- (void)setMinimumNotificationInterval:(double)a3
{
  self->_double minimumNotificationInterval = a3;
}

- (NSDate)lastPostedETADate
{
  return self->_lastPostedETADate;
}

- (void)setLastPostedETADate:(id)a3
{
}

- (NSDate)lastPostedNotificationDate
{
  return self->_lastPostedNotificationDate;
}

- (void)setLastPostedNotificationDate:(id)a3
{
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
}

- (NSDate)currentETADate
{
  return self->_currentETADate;
}

- (void)setCurrentETADate:(id)a3
{
}

- (BOOL)hasMadeFinalPush
{
  return self->_hasMadeFinalPush;
}

- (void)setHasMadeFinalPush:(BOOL)a3
{
  self->_BOOL hasMadeFinalPush = a3;
}

- (NSMapTable)intermediateArrivalWaypointPostedNotifications
{
  return self->_intermediateArrivalWaypointPostedNotifications;
}

- (void)setIntermediateArrivalWaypointPostedNotifications:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intermediateArrivalWaypointPostedNotifications, 0);
  objc_storeStrong((id *)&self->_currentETADate, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_lastPostedNotificationDate, 0);

  objc_storeStrong((id *)&self->_lastPostedETADate, 0);
}

@end