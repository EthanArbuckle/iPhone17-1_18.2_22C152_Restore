@interface RTStoredVehicleFetchOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFetchOptions:(id)a3;
- (NSDateInterval)dateInterval;
- (NSNumber)limit;
- (RTStoredVehicleFetchOptions)init;
- (RTStoredVehicleFetchOptions)initWithCoder:(id)a3;
- (RTStoredVehicleFetchOptions)initWithDateInterval:(id)a3 limit:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDateInterval:(id)a3;
@end

@implementation RTStoredVehicleFetchOptions

- (RTStoredVehicleFetchOptions)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDateInterval_limit_);
}

- (RTStoredVehicleFetchOptions)initWithDateInterval:(id)a3 limit:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v8 && ![v8 unsignedIntegerValue])
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !limit || (limit && limit.unsignedIntegerValue > 0)", buf, 2u);
    }

    v12 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)RTStoredVehicleFetchOptions;
    v10 = [(RTStoredVehicleFetchOptions *)&v15 init];
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_dateInterval, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v12 = self;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RTStoredVehicleFetchOptions *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTStoredVehicleFetchOptions *)self isEqualToFetchOptions:v5];

  return v6;
}

- (BOOL)isEqualToFetchOptions:(id)a3
{
  id v5 = a3;
  BOOL v6 = v5;
  dateInterval = self->_dateInterval;
  if (dateInterval) {
    goto LABEL_2;
  }
  v3 = [v5 dateInterval];
  if (!v3)
  {
    char v12 = 1;
    goto LABEL_11;
  }
  if (self->_dateInterval)
  {
LABEL_2:
    uint64_t v8 = [v6 dateInterval];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = self->_dateInterval;
      v11 = [v6 dateInterval];
      char v12 = [(NSDateInterval *)v10 isEqualToDateInterval:v11];

      if (dateInterval) {
        goto LABEL_12;
      }
    }
    else
    {
      char v12 = 0;
      if (dateInterval) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    char v12 = 0;
  }
LABEL_11:

LABEL_12:
  limit = self->_limit;
  if (limit) {
    goto LABEL_13;
  }
  v3 = [v6 limit];
  if (!v3)
  {
    char v18 = 1;
    goto LABEL_22;
  }
  if (!self->_limit)
  {
    char v18 = 0;
LABEL_22:

    goto LABEL_23;
  }
LABEL_13:
  uint64_t v14 = [v6 limit];
  if (v14)
  {
    objc_super v15 = (void *)v14;
    v16 = self->_limit;
    v17 = [v6 limit];
    char v18 = [(NSNumber *)v16 isEqualToNumber:v17];

    if (!limit) {
      goto LABEL_22;
    }
  }
  else
  {
    char v18 = 0;
    if (!limit) {
      goto LABEL_22;
    }
  }
LABEL_23:

  return v12 & v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  dateInterval = self->_dateInterval;
  id v5 = a3;
  [v5 encodeObject:dateInterval forKey:@"dateInterval"];
  [v5 encodeObject:self->_limit forKey:@"limit"];
}

- (RTStoredVehicleFetchOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"limit"];

  id v7 = [(RTStoredVehicleFetchOptions *)self initWithDateInterval:v5 limit:v6];
  return v7;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (NSNumber)limit
{
  return self->_limit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end