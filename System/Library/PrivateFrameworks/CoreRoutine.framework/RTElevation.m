@interface RTElevation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (NSDate)endDate;
- (NSDate)startDate;
- (RTElevation)initWithCoder:(id)a3;
- (RTElevation)initWithElevation:(double)a3 dateInterval:(id)a4;
- (RTElevation)initWithElevation:(double)a3 dateInterval:(id)a4 elevationUncertainty:(double)a5 estimationStatus:(int64_t)a6;
- (double)elevation;
- (double)elevationUncertainty;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)estimationStatus;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTElevation

- (RTElevation)initWithElevation:(double)a3 dateInterval:(id)a4
{
  return [(RTElevation *)self initWithElevation:a4 dateInterval:0 elevationUncertainty:a3 estimationStatus:50.0];
}

- (RTElevation)initWithElevation:(double)a3 dateInterval:(id)a4 elevationUncertainty:(double)a5 estimationStatus:(int64_t)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  if (v10)
  {
    v21.receiver = self;
    v21.super_class = (Class)RTElevation;
    v11 = [(RTElevation *)&v21 init];
    v12 = v11;
    if (v11)
    {
      v11->_elevation = a3;
      uint64_t v13 = [v10 startDate];
      startDate = v12->_startDate;
      v12->_startDate = (NSDate *)v13;

      uint64_t v15 = [v10 endDate];
      endDate = v12->_endDate;
      v12->_endDate = (NSDate *)v15;

      v12->_elevationUncertainty = a5;
      v12->_estimationStatus = a6;
    }
    v17 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v12;
      _os_log_debug_impl(&dword_1A8FEF000, v17, OS_LOG_TYPE_DEBUG, "elevation, %@", buf, 0xCu);
    }

    self = v12;
    v18 = self;
  }
  else
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    v18 = 0;
  }

  return v18;
}

- (BOOL)isValid
{
  [(RTElevation *)self elevation];
  if (v3 <= -1000.0)
  {
    BOOL v5 = 1;
  }
  else
  {
    [(RTElevation *)self elevation];
    BOOL v5 = v4 >= 10000.0;
  }
  v6 = [(RTElevation *)self startDate];
  v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604801.0];
  if ([v6 compare:v7] == 1)
  {
    v8 = [(RTElevation *)self startDate];
    v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
    if ([v8 compare:v9] == -1)
    {
      v11 = [(RTElevation *)self startDate];
      v12 = [(RTElevation *)self endDate];
      BOOL v10 = [v11 compare:v12] == -1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  uint64_t v13 = [(RTElevation *)self endDate];
  v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604801.0];
  if ([v13 compare:v14] == 1)
  {
    uint64_t v15 = [(RTElevation *)self endDate];
    v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
    BOOL v17 = [v15 compare:v16] == -1;
  }
  else
  {
    BOOL v17 = 0;
  }

  [(RTElevation *)self elevationUncertainty];
  if (v18 >= 0.0)
  {
    [(RTElevation *)self elevationUncertainty];
    BOOL v19 = v20 <= 50.0;
  }
  else
  {
    BOOL v19 = 0;
  }
  return !v5 && v10 && v17 && v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTElevation)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"elevation"];
  double v6 = v5;
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
  [v4 decodeDoubleForKey:@"elevationUncertainty"];
  double v10 = v9;
  uint64_t v11 = [v4 decodeIntegerForKey:@"estimationStatus"];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v8];
  uint64_t v13 = [(RTElevation *)self initWithElevation:v12 dateInterval:v11 elevationUncertainty:v6 estimationStatus:v10];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  double elevation = self->_elevation;
  id v5 = a3;
  [v5 encodeDouble:@"elevation" forKey:elevation];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeDouble:@"elevationUncertainty" forKey:self->_elevationUncertainty];
  [v5 encodeInteger:self->_estimationStatus forKey:@"estimationStatus"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:self->_startDate endDate:self->_endDate];
  double v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithElevation:dateInterval:elevationUncertainty:estimationStatus:", v5, self->_estimationStatus, self->_elevation, self->_elevationUncertainty);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char v5 = [v4 isMemberOfClass:objc_opt_class()];
  double elevation = self->_elevation;
  [v4 elevation];
  double v8 = v7;
  startDate = self->_startDate;
  double v10 = [v4 startDate];
  char v11 = [(NSDate *)startDate isEqual:v10];

  endDate = self->_endDate;
  uint64_t v13 = [v4 endDate];
  char v14 = [(NSDate *)endDate isEqual:v13];

  double elevationUncertainty = self->_elevationUncertainty;
  [v4 elevationUncertainty];
  double v17 = v16;
  int64_t estimationStatus = self->_estimationStatus;
  uint64_t v19 = [v4 estimationStatus];

  if (elevation == v8) {
    char v20 = v5;
  }
  else {
    char v20 = 0;
  }
  char v21 = v20 & v11 & v14;
  if (elevationUncertainty != v17) {
    char v21 = 0;
  }
  if (estimationStatus == v19) {
    return v21;
  }
  else {
    return 0;
  }
}

- (id)description
{
  double v3 = NSString;
  double elevation = self->_elevation;
  char v5 = [(NSDate *)self->_startDate stringFromDate];
  double v6 = [(NSDate *)self->_endDate stringFromDate];
  double v7 = [v3 stringWithFormat:@"elevation,%f,startDate,%@,endDate,%@,elevationUncertainty,%f,estimationStatus,%lu", *(void *)&elevation, v5, v6, *(void *)&self->_elevationUncertainty, self->_estimationStatus];

  return v7;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (double)elevation
{
  return self->_elevation;
}

- (double)elevationUncertainty
{
  return self->_elevationUncertainty;
}

- (int64_t)estimationStatus
{
  return self->_estimationStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end