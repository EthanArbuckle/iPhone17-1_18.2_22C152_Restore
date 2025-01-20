@interface RTFingerprint
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)accessPoints;
- (NSDate)start;
- (NSUUID)identifier;
- (RTFingerprint)init;
- (RTFingerprint)initWithCoder:(id)a3;
- (RTFingerprint)initWithIdentifier:(id)a3 settledState:(unint64_t)a4 start:(id)a5 accessPoints:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)settledState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTFingerprint

- (RTFingerprint)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_settledState_start_accessPoints_);
}

- (RTFingerprint)initWithIdentifier:(id)a3 settledState:(unint64_t)a4 start:(id)a5 accessPoints:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!v10)
  {
    v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: identifier";
LABEL_13:
    _os_log_error_impl(&dword_1A8FEF000, v21, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    goto LABEL_14;
  }
  if (a4 >= 3)
  {
    v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: RTScenarioTriggerSettledStateIsValid(settledState)";
    goto LABEL_13;
  }
  if (!v11)
  {
    v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v22 = "Invalid parameter not satisfying: start";
      goto LABEL_13;
    }
LABEL_14:

    v20 = 0;
    goto LABEL_15;
  }
  v24.receiver = self;
  v24.super_class = (Class)RTFingerprint;
  v13 = [(RTFingerprint *)&v24 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSUUID *)v14;

    v13->_settledState = a4;
    uint64_t v16 = [v11 copy];
    start = v13->_start;
    v13->_start = (NSDate *)v16;

    uint64_t v18 = [v12 copy];
    accessPoints = v13->_accessPoints;
    v13->_accessPoints = (NSArray *)v18;
  }
  self = v13;
  v20 = self;
LABEL_15:

  return v20;
}

- (id)description
{
  v3 = NSString;
  v4 = +[RTScenarioTrigger scenarioTriggerSettledStateToString:self->_settledState];
  v5 = [(NSDate *)self->_start stringFromDate];
  v6 = [v3 stringWithFormat:@"settled state, %@, start, %@, number of access points, %lu", v4, v5, -[NSArray count](self->_accessPoints, "count")];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  unint64_t settledState = self->_settledState;
  start = self->_start;
  accessPoints = self->_accessPoints;
  return (id)[v4 initWithIdentifier:identifier settledState:settledState start:start accessPoints:accessPoints];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTFingerprint)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"settledState"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"start"];
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  id v12 = [v4 decodeObjectOfClasses:v11 forKey:@"accessPoints"];

  v13 = [(RTFingerprint *)self initWithIdentifier:v5 settledState:v7 start:v8 accessPoints:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"identifier"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_settledState];
  [v6 encodeObject:v5 forKey:@"settledState"];

  [v6 encodeObject:self->_start forKey:@"start"];
  [v6 encodeObject:self->_accessPoints forKey:@"accessPoints"];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_identifier hash];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_settledState];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = v3 ^ [(NSDate *)self->_start hash];
  unint64_t v7 = v5 ^ v6 ^ [(NSArray *)self->_accessPoints hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (RTFingerprint *)a3;
  if (self == v5)
  {
    char v32 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      unint64_t v7 = [(RTFingerprint *)self accessPoints];
      uint64_t v8 = [v7 count];
      v9 = [(RTFingerprint *)v6 accessPoints];
      uint64_t v10 = [v9 count];

      if (v8 != v10)
      {
LABEL_16:
        char v32 = 0;
LABEL_23:

        goto LABEL_24;
      }
      uint64_t v11 = [(RTFingerprint *)self accessPoints];
      if (v11)
      {
        id v12 = (void *)v11;
        v13 = [(RTFingerprint *)v6 accessPoints];

        if (v13)
        {
          uint64_t v14 = [(RTFingerprint *)self accessPoints];
          uint64_t v15 = [v14 count];

          if (v15)
          {
            unint64_t v16 = 0;
            do
            {
              v17 = [(RTFingerprint *)self accessPoints];
              uint64_t v18 = [v17 objectAtIndexedSubscript:v16];

              uint64_t v19 = [(RTFingerprint *)v6 accessPoints];
              v20 = [(id)v19 objectAtIndexedSubscript:v16];

              LOBYTE(v19) = [v18 isEqual:v20];
              if ((v19 & 1) == 0) {
                goto LABEL_16;
              }
              ++v16;
              v21 = [(RTFingerprint *)self accessPoints];
              unint64_t v22 = [v21 count];
            }
            while (v16 < v22);
          }
        }
      }
      v23 = [(RTFingerprint *)self identifier];
      objc_super v24 = [(RTFingerprint *)v6 identifier];
      char v25 = [v23 isEqual:v24];

      unint64_t v26 = [(RTFingerprint *)self settledState];
      uint64_t v27 = [(RTFingerprint *)v6 settledState];
      v28 = [(RTFingerprint *)self start];
      if (v28 || ([(RTFingerprint *)v6 start], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v29 = [(RTFingerprint *)self start];
        v30 = [(RTFingerprint *)v6 start];
        char v31 = [v29 isEqualToDate:v30];

        if (v28)
        {
LABEL_19:

          if (v26 == v27) {
            char v33 = v25;
          }
          else {
            char v33 = 0;
          }
          char v32 = v33 & v31;
          goto LABEL_23;
        }
      }
      else
      {
        char v31 = 1;
      }

      goto LABEL_19;
    }
    char v32 = 0;
  }
LABEL_24:

  return v32;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)settledState
{
  return self->_settledState;
}

- (NSDate)start
{
  return self->_start;
}

- (NSArray)accessPoints
{
  return self->_accessPoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessPoints, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end