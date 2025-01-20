@interface RTPeopleDensityCallbackConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (RTPeopleDensityCallbackConfiguration)init;
- (RTPeopleDensityCallbackConfiguration)initWithCoder:(id)a3;
- (RTPeopleDensityCallbackConfiguration)initWithPeriodicReportInterval:(unint64_t)a3 magnitude:(unint64_t)a4 densityUpdateHandler:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)densityUpdateHandler;
- (id)description;
- (id)descriptionDictionary;
- (unint64_t)magnitude;
- (unint64_t)periodicReportInterval;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTPeopleDensityCallbackConfiguration

- (RTPeopleDensityCallbackConfiguration)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPeriodicReportInterval_magnitude_densityUpdateHandler_);
}

- (RTPeopleDensityCallbackConfiguration)initWithPeriodicReportInterval:(unint64_t)a3 magnitude:(unint64_t)a4 densityUpdateHandler:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RTPeopleDensityCallbackConfiguration;
  v9 = [(RTPeopleDensityCallbackConfiguration *)&v15 init];
  if (v9)
  {
    if (a3 >= 4)
    {
      v10 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v17 = a3;
        _os_log_error_impl(&dword_1A8FEF000, v10, OS_LOG_TYPE_ERROR, "interval %d out of bounds", buf, 8u);
      }

      a3 = 0;
    }
    v9->_periodicReportInterval = a3;
    if (a4 >= 3)
    {
      v11 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v17 = a4;
        _os_log_error_impl(&dword_1A8FEF000, v11, OS_LOG_TYPE_ERROR, "magnitude %d out of bounds", buf, 8u);
      }

      a4 = 0;
    }
    v9->_magnitude = a4;
    uint64_t v12 = MEMORY[0x1AD0EBF30](v8);
    id densityUpdateHandler = v9->_densityUpdateHandler;
    v9->_id densityUpdateHandler = (id)v12;
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RTPeopleDensityCallbackConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(RTPeopleDensityCallbackConfiguration *)self periodicReportInterval];
      if (v6 == [(RTPeopleDensityCallbackConfiguration *)v5 periodicReportInterval])
      {
        unint64_t v7 = [(RTPeopleDensityCallbackConfiguration *)self magnitude];
        BOOL v8 = v7 == [(RTPeopleDensityCallbackConfiguration *)v5 magnitude];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)descriptionDictionary
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t periodicReportInterval = self->_periodicReportInterval;
  if (periodicReportInterval >= 4)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      unint64_t v13 = self->_periodicReportInterval;
      *(_DWORD *)buf = 138412546;
      v20 = v12;
      __int16 v21 = 1024;
      int v22 = v13;
      _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "%@ invalid periodicInterval %d", buf, 0x12u);
    }
  }
  unint64_t magnitude = self->_magnitude;
  if (magnitude >= 3)
  {
    unint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      objc_super v15 = NSStringFromClass(v14);
      unint64_t v16 = self->_magnitude;
      *(_DWORD *)buf = 138412546;
      v20 = v15;
      __int16 v21 = 1024;
      int v22 = v16;
      _os_log_error_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_ERROR, "%@ invalid magnitude %d", buf, 0x12u);
    }
  }
  v17[0] = @"interval";
  if (periodicReportInterval > 3) {
    unint64_t v7 = &stru_1EFF84648;
  }
  else {
    unint64_t v7 = PeriodicReportIntervalDescriptor[self->_periodicReportInterval];
  }
  v18[0] = v7;
  v17[1] = @"magnitude";
  if (magnitude > 2) {
    BOOL v8 = &stru_1EFF84648;
  }
  else {
    BOOL v8 = UpdateMagnitudeDescriptor[self->_magnitude];
  }
  v18[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  return v9;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(RTPeopleDensityCallbackConfiguration *)self descriptionDictionary];
  id v11 = 0;
  v3 = [MEMORY[0x1E4F28D90] JSONStringFromNSDictionary:v2 error:&v11];
  id v4 = v11;
  if (v4)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412546;
      unint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl(&dword_1A8FEF000, v5, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);
    }
    id v6 = [NSString string];
  }
  else
  {
    id v6 = v3;
  }
  unint64_t v7 = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t v5 = [(RTPeopleDensityCallbackConfiguration *)self periodicReportInterval];
  unint64_t v6 = [(RTPeopleDensityCallbackConfiguration *)self magnitude];
  unint64_t v7 = [(RTPeopleDensityCallbackConfiguration *)self densityUpdateHandler];
  BOOL v8 = (void *)[v4 initWithPeriodicReportInterval:v5 magnitude:v6 densityUpdateHandler:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPeopleDensityCallbackConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"interval"];
  unint64_t v6 = (unint64_t)v5;
  [v4 decodeDoubleForKey:@"magnitude"];
  double v8 = v7;

  return [(RTPeopleDensityCallbackConfiguration *)self initWithPeriodicReportInterval:v6 magnitude:(unint64_t)v8 densityUpdateHandler:0];
}

- (void)encodeWithCoder:(id)a3
{
  double periodicReportInterval = (double)self->_periodicReportInterval;
  id v5 = a3;
  [v5 encodeDouble:@"interval" forKey:periodicReportInterval];
  [v5 encodeDouble:@"magnitude" forKey:(double)self->_magnitude];
}

- (unint64_t)periodicReportInterval
{
  return self->_periodicReportInterval;
}

- (unint64_t)magnitude
{
  return self->_magnitude;
}

- (id)densityUpdateHandler
{
  return self->_densityUpdateHandler;
}

- (void).cxx_destruct
{
}

@end