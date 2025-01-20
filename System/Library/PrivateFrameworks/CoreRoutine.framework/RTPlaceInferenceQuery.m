@interface RTPlaceInferenceQuery
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)sourceIdentifier;
- (NSUUID)identifier;
- (RTPlaceInference)placeInference;
- (RTPlaceInferenceQuery)init;
- (RTPlaceInferenceQuery)initWithCoder:(id)a3;
- (RTPlaceInferenceQuery)initWithIdentifier:(id)a3 date:(id)a4 errorCode:(int64_t)a5 fidelityPolicyMask:(unint64_t)a6 placeInference:(id)a7 sourceIdentifier:(id)a8;
- (RTPlaceInferenceQuery)initWithIdentifier:(id)a3 date:(id)a4 fidelityPolicyMask:(unint64_t)a5 placeInference:(id)a6;
- (RTPlaceInferenceQuery)initWithIdentifier:(id)a3 date:(id)a4 fidelityPolicyMask:(unint64_t)a5 placeInference:(id)a6 sourceIdentifier:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)errorCode;
- (unint64_t)fidelityPolicyMask;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTPlaceInferenceQuery

- (RTPlaceInference)placeInference
{
  return self->_placeInference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_placeInference, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (RTPlaceInferenceQuery)initWithIdentifier:(id)a3 date:(id)a4 errorCode:(int64_t)a5 fidelityPolicyMask:(unint64_t)a6 placeInference:(id)a7 sourceIdentifier:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  if (v15)
  {
    id v26 = v18;
    if (v16)
    {
      v27.receiver = self;
      v27.super_class = (Class)RTPlaceInferenceQuery;
      v19 = [(RTPlaceInferenceQuery *)&v27 init];
      v20 = v19;
      if (v19)
      {
        objc_storeStrong((id *)&v19->_identifier, a3);
        objc_storeStrong((id *)&v20->_date, a4);
        v20->_errorCode = a5;
        v20->_fidelityPolicyMask = a6;
        objc_storeStrong((id *)&v20->_placeInference, a7);
        objc_storeStrong((id *)&v20->_sourceIdentifier, a8);
      }
      self = v20;
      v21 = self;
    }
    else
    {
      v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A8FEF000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date", buf, 2u);
      }

      v21 = 0;
    }
    v22 = v26;
  }
  else
  {
    v22 = v18;
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v21 = 0;
  }

  return v21;
}

- (RTPlaceInferenceQuery)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_date_errorCode_fidelityPolicyMask_placeInference_sourceIdentifier_);
}

- (RTPlaceInferenceQuery)initWithIdentifier:(id)a3 date:(id)a4 fidelityPolicyMask:(unint64_t)a5 placeInference:(id)a6 sourceIdentifier:(id)a7
{
  return [(RTPlaceInferenceQuery *)self initWithIdentifier:a3 date:a4 errorCode:-1 fidelityPolicyMask:a5 placeInference:a6 sourceIdentifier:a7];
}

- (RTPlaceInferenceQuery)initWithIdentifier:(id)a3 date:(id)a4 fidelityPolicyMask:(unint64_t)a5 placeInference:(id)a6
{
  return [(RTPlaceInferenceQuery *)self initWithIdentifier:a3 date:a4 fidelityPolicyMask:a5 placeInference:a6 sourceIdentifier:0];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RTPlaceInferenceQuery *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(RTPlaceInferenceQuery *)self identifier];
      v6 = [(RTPlaceInferenceQuery *)v4 identifier];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [RTPlaceInferenceQuery alloc];
  v5 = [(RTPlaceInferenceQuery *)self identifier];
  v6 = [(RTPlaceInferenceQuery *)self date];
  int64_t v7 = [(RTPlaceInferenceQuery *)self errorCode];
  unint64_t v8 = [(RTPlaceInferenceQuery *)self fidelityPolicyMask];
  v9 = [(RTPlaceInferenceQuery *)self placeInference];
  v10 = [(RTPlaceInferenceQuery *)self sourceIdentifier];
  v11 = [(RTPlaceInferenceQuery *)v4 initWithIdentifier:v5 date:v6 errorCode:v7 fidelityPolicyMask:v8 placeInference:v9 sourceIdentifier:v10];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RTPlaceInferenceQuery *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(RTPlaceInferenceQuery *)self date];
  [v4 encodeObject:v6 forKey:@"date"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[RTPlaceInferenceQuery errorCode](self, "errorCode"), @"errorCode");
  objc_msgSend(v4, "encodeInteger:forKey:", -[RTPlaceInferenceQuery fidelityPolicyMask](self, "fidelityPolicyMask"), @"fidelityPolicyMask");
  int64_t v7 = [(RTPlaceInferenceQuery *)self placeInference];
  [v4 encodeObject:v7 forKey:@"placeInference"];

  id v8 = [(RTPlaceInferenceQuery *)self sourceIdentifier];
  [v4 encodeObject:v8 forKey:@"sourceIdentifier"];
}

- (RTPlaceInferenceQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"errorCode"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"fidelityPolicyMask"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeInference"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceIdentifier"];

  v11 = [(RTPlaceInferenceQuery *)self initWithIdentifier:v5 date:v6 errorCode:v7 fidelityPolicyMask:v8 placeInference:v9 sourceIdentifier:v10];
  return v11;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(RTPlaceInferenceQuery *)self identifier];
  v5 = [(RTPlaceInferenceQuery *)self date];
  int64_t v6 = [(RTPlaceInferenceQuery *)self errorCode];
  unint64_t v7 = [(RTPlaceInferenceQuery *)self fidelityPolicyMask];
  uint64_t v8 = [(RTPlaceInferenceQuery *)self placeInference];
  v9 = [(RTPlaceInferenceQuery *)self sourceIdentifier];
  v10 = [v3 stringWithFormat:@"identifier, %@, date, %@, errorCode, %lu, fidelityPolicyMask, %lu, placeInference, %@, source identifier, %@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (unint64_t)fidelityPolicyMask
{
  return self->_fidelityPolicyMask;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

@end