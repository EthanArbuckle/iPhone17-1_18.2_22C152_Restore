@interface RTStoredTripSegmentFetchOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isAscending;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFetchOptions:(id)a3;
- (NSDateInterval)dateInterval;
- (NSNumber)limit;
- (RTStoredTripSegmentFetchOptions)init;
- (RTStoredTripSegmentFetchOptions)initWithAscending:(BOOL)a3 dateInterval:(id)a4 limit:(id)a5;
- (RTStoredTripSegmentFetchOptions)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDateInterval:(id)a3;
@end

@implementation RTStoredTripSegmentFetchOptions

- (RTStoredTripSegmentFetchOptions)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAscending_dateInterval_limit_);
}

- (RTStoredTripSegmentFetchOptions)initWithAscending:(BOOL)a3 dateInterval:(id)a4 limit:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v10 && ![v10 unsignedIntegerValue])
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !limit || (limit && limit.unsignedIntegerValue > 0)", buf, 2u);
    }

    v14 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)RTStoredTripSegmentFetchOptions;
    v12 = [(RTStoredTripSegmentFetchOptions *)&v17 init];
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      v12->_ascending = a3;
      objc_storeStrong((id *)&v12->_dateInterval, a4);
      objc_storeStrong(p_isa + 3, a5);
    }
    self = p_isa;
    v14 = self;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RTStoredTripSegmentFetchOptions *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTStoredTripSegmentFetchOptions *)self isEqualToFetchOptions:v5];

  return v6;
}

- (BOOL)isEqualToFetchOptions:(id)a3
{
  id v5 = a3;
  int ascending = self->_ascending;
  int v7 = [v5 isAscending];
  dateInterval = self->_dateInterval;
  if (!dateInterval)
  {
    v3 = [v5 dateInterval];
    if (v3)
    {
      if (self->_dateInterval) {
        goto LABEL_2;
      }
      char v13 = 0;
    }
    else
    {
      char v13 = 1;
    }
LABEL_11:

    goto LABEL_12;
  }
LABEL_2:
  uint64_t v9 = [v5 dateInterval];
  if (v9)
  {
    id v10 = (void *)v9;
    v11 = self->_dateInterval;
    v12 = [v5 dateInterval];
    char v13 = [(NSDateInterval *)v11 isEqualToDateInterval:v12];

    if (!dateInterval) {
      goto LABEL_11;
    }
  }
  else
  {
    char v13 = 0;
    if (!dateInterval) {
      goto LABEL_11;
    }
  }
LABEL_12:
  limit = self->_limit;
  if (limit) {
    goto LABEL_13;
  }
  v3 = [v5 limit];
  if (!v3)
  {
    char v19 = 1;
    goto LABEL_22;
  }
  if (self->_limit)
  {
LABEL_13:
    uint64_t v15 = [v5 limit];
    if (v15)
    {
      v16 = (void *)v15;
      objc_super v17 = self->_limit;
      v18 = [v5 limit];
      char v19 = [(NSNumber *)v17 isEqualToNumber:v18];

      if (limit) {
        goto LABEL_23;
      }
    }
    else
    {
      char v19 = 0;
      if (limit) {
        goto LABEL_23;
      }
    }
  }
  else
  {
    char v19 = 0;
  }
LABEL_22:

LABEL_23:
  if (ascending == v7) {
    char v20 = v13;
  }
  else {
    char v20 = 0;
  }
  char v21 = v20 & v19;

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL ascending = self->_ascending;
  id v5 = a3;
  [v5 encodeBool:ascending forKey:@"ascending"];
  [v5 encodeObject:self->_dateInterval forKey:@"dateInterval"];
  [v5 encodeObject:self->_limit forKey:@"limit"];
}

- (RTStoredTripSegmentFetchOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"ascending"];
  BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  int v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"limit"];

  v8 = [(RTStoredTripSegmentFetchOptions *)self initWithAscending:v5 dateInterval:v6 limit:v7];
  return v8;
}

- (BOOL)isAscending
{
  return self->_ascending;
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