@interface RTPeopleDensity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)rssiHistogram;
- (NSUUID)uuid;
- (RTPeopleDensity)init;
- (RTPeopleDensity)initWithBundleUUID:(id)a3 startDate:(id)a4 endDate:(id)a5 densityScore:(double)a6 scanDuration:(double)a7 rssiHistogram:(id)a8;
- (RTPeopleDensity)initWithCoder:(id)a3;
- (double)densityScore;
- (double)scanDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTPeopleDensity

- (RTPeopleDensity)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBundleUUID_startDate_endDate_densityScore_scanDuration_rssiHistogram_);
}

- (RTPeopleDensity)initWithBundleUUID:(id)a3 startDate:(id)a4 endDate:(id)a5 densityScore:(double)a6 scanDuration:(double)a7 rssiHistogram:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  if (v16)
  {
    v24.receiver = self;
    v24.super_class = (Class)RTPeopleDensity;
    v19 = [(RTPeopleDensity *)&v24 init];
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_uuid, a3);
      objc_storeStrong((id *)&v20->_startDate, a4);
      objc_storeStrong((id *)&v20->_endDate, a5);
      v20->_densityScore = a6;
      v20->_scanDuration = a7;
      objc_storeStrong((id *)&v20->_rssiHistogram, a8);
    }
    self = v20;
    v21 = self;
  }
  else
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    v21 = 0;
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RTPeopleDensity *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(RTPeopleDensity *)self uuid];
      v7 = [(RTPeopleDensity *)v5 uuid];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)descriptionDictionary
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  uuid = self->_uuid;
  if (uuid)
  {
    v5 = [(NSUUID *)uuid UUIDString];
    [v3 setObject:v5 forKey:@"UUID"];
  }
  else
  {
    [v3 setObject:&stru_1EFF84648 forKey:@"UUID"];
  }
  startDate = self->_startDate;
  if (startDate)
  {
    v7 = [(NSDate *)startDate getFormattedDateString];
    [v3 setObject:v7 forKey:@"StartDate"];
  }
  else
  {
    [v3 setObject:@"-" forKey:@"StartDate"];
  }
  endDate = self->_endDate;
  if (endDate)
  {
    v9 = [(NSDate *)endDate getFormattedDateString];
    [v3 setObject:v9 forKey:@"EndDate"];
  }
  else
  {
    [v3 setObject:@"-" forKey:@"EndDate"];
  }
  v10 = [NSNumber numberWithDouble:self->_densityScore];
  [v3 setObject:v10 forKey:@"Score"];

  v11 = [NSNumber numberWithDouble:self->_scanDuration];
  [v3 setObject:v11 forKey:@"ScanDuration"];

  if (self->_rssiHistogram)
  {
    v12 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v13 = [(NSDictionary *)self->_rssiHistogram allKeys];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v19 = [(NSDictionary *)self->_rssiHistogram objectForKeyedSubscript:v18];
          v20 = [v18 stringValue];
          [v12 setObject:v19 forKey:v20];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"rssiHistogram"];
  }
  return v3;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(RTPeopleDensity *)self descriptionDictionary];
  id v11 = 0;
  v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:3 error:&v11];
  id v4 = v11;
  if (v4)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl(&dword_1A8FEF000, v5, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);
    }
    uint64_t v6 = [NSString string];
  }
  else
  {
    uint64_t v6 = [[NSString alloc] initWithData:v3 encoding:4];
  }
  v7 = (void *)v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uuid = self->_uuid;
  startDate = self->_startDate;
  endDate = self->_endDate;
  double densityScore = self->_densityScore;
  double scanDuration = self->_scanDuration;
  rssiHistogram = self->_rssiHistogram;
  return (id)[v4 initWithBundleUUID:uuid startDate:startDate endDate:endDate densityScore:rssiHistogram scanDuration:densityScore rssiHistogram:scanDuration];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPeopleDensity)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  char v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"StartDate"];
  v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"EndDate"];
  [v5 decodeDoubleForKey:@"Score"];
  double v12 = v11;
  [v5 decodeDoubleForKey:@"ScanDuration"];
  double v14 = v13;
  id v15 = [v5 decodeObjectOfClasses:v7 forKey:@"rssiHistogram"];

  uint64_t v16 = [(RTPeopleDensity *)self initWithBundleUUID:v8 startDate:v9 endDate:v10 densityScore:v15 scanDuration:v12 rssiHistogram:v14];
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 encodeObject:uuid forKey:@"UUID"];
  [v5 encodeObject:self->_startDate forKey:@"StartDate"];
  [v5 encodeObject:self->_endDate forKey:@"EndDate"];
  [v5 encodeDouble:@"Score" forKey:self->_densityScore];
  [v5 encodeDouble:@"ScanDuration" forKey:self->_scanDuration];
  [v5 encodeObject:self->_rssiHistogram forKey:@"rssiHistogram"];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (double)densityScore
{
  return self->_densityScore;
}

- (double)scanDuration
{
  return self->_scanDuration;
}

- (NSDictionary)rssiHistogram
{
  return self->_rssiHistogram;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rssiHistogram, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end