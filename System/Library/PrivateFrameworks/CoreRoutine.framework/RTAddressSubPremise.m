@interface RTAddressSubPremise
+ (BOOL)supportsSecureCoding;
+ (id)stringForSubPremiseType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAddressSubPremise:(id)a3;
- (NSString)subPremise;
- (RTAddressSubPremise)init;
- (RTAddressSubPremise)initWithCoder:(id)a3;
- (RTAddressSubPremise)initWithSubPremise:(id)a3 subPremiseType:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)subPremiseType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTAddressSubPremise

- (RTAddressSubPremise)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithSubPremise_subPremiseType_);
}

- (RTAddressSubPremise)initWithSubPremise:(id)a3 subPremiseType:(int64_t)a4
{
  id v6 = a3;
  if (!v6)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v10 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: subPremise";
LABEL_12:
    _os_log_error_impl(&dword_1A8FEF000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_9;
  }
  if ((unint64_t)a4 >= 5)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: SUB_PREMISE_TYPE_VALID(subPremiseType)";
    goto LABEL_12;
  }
  v14.receiver = self;
  v14.super_class = (Class)RTAddressSubPremise;
  v7 = [(RTAddressSubPremise *)&v14 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    subPremise = v7->_subPremise;
    v7->_subPremise = (NSString *)v8;

    v7->_subPremiseType = a4;
  }
  self = v7;
  v10 = self;
LABEL_10:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTAddressSubPremise)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subPremise"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"subPremiseType"];

  v7 = [(RTAddressSubPremise *)self initWithSubPremise:v5 subPremiseType:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  subPremise = self->_subPremise;
  id v5 = a3;
  [v5 encodeObject:subPremise forKey:@"subPremise"];
  [v5 encodeInt64:self->_subPremiseType forKey:@"subPremiseType"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t subPremiseType = self->_subPremiseType;
  subPremise = self->_subPremise;
  return (id)[v4 initWithSubPremise:subPremise subPremiseType:subPremiseType];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(id)objc_opt_class() stringForSubPremiseType:self->_subPremiseType];
  id v5 = [v3 stringWithFormat:@"%@ %@", v4, self->_subPremise];

  return v5;
}

- (BOOL)isEqualToAddressSubPremise:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  subPremise = self->_subPremise;
  uint64_t v8 = subPremise;
  if (subPremise)
  {
LABEL_4:
    v9 = [v6 subPremise];
    char v10 = [(NSString *)v8 isEqual:v9];

    if (subPremise) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v3 = [v5 subPremise];
  if (v3)
  {
    uint64_t v8 = self->_subPremise;
    goto LABEL_4;
  }
  char v10 = 1;
LABEL_7:

LABEL_8:
  int64_t subPremiseType = self->_subPremiseType;
  if (subPremiseType == [v6 subPremiseType]) {
    BOOL v12 = v10;
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTAddressSubPremise *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTAddressSubPremise *)self isEqualToAddressSubPremise:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_subPremise hash];
  id v4 = [NSNumber numberWithLongLong:self->_subPremiseType];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

+ (id)stringForSubPremiseType:(int64_t)a3
{
  if ((unint64_t)a3 < 5) {
    return off_1E5D74708[a3];
  }
  NSUInteger v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_error_impl(&dword_1A8FEF000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: SUB_PREMISE_TYPE_VALID(subPremiseType)", v5, 2u);
  }

  return 0;
}

- (int64_t)subPremiseType
{
  return self->_subPremiseType;
}

- (NSString)subPremise
{
  return self->_subPremise;
}

- (void).cxx_destruct
{
}

@end