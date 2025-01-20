@interface RTMotionActivity
+ (BOOL)supportsSecureCoding;
+ (id)motionActivityConfidenceToString:(unint64_t)a3;
+ (id)motionActivityTypeToString:(unint64_t)a3;
+ (unint64_t)motionActivityConfidenceFromString:(id)a3;
+ (unint64_t)motionActivityTypeFromString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)startDate;
- (RTMotionActivity)init;
- (RTMotionActivity)initWithCoder:(id)a3;
- (RTMotionActivity)initWithType:(unint64_t)a3 confidence:(unint64_t)a4 startDate:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)confidence;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTMotionActivity

+ (id)motionActivityTypeToString:(unint64_t)a3
{
  if (a3 > 6) {
    return @"Invalid";
  }
  else {
    return off_1E5D745C0[a3];
  }
}

+ (id)motionActivityConfidenceToString:(unint64_t)a3
{
  if (a3 > 3) {
    return @"Invalid";
  }
  else {
    return off_1E5D745F8[a3];
  }
}

+ (unint64_t)motionActivityTypeFromString:(id)a3
{
  v3 = [&unk_1EFF91B60 objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 integerValue];

  return v4;
}

+ (unint64_t)motionActivityConfidenceFromString:(id)a3
{
  v3 = [&unk_1EFF91B88 objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 integerValue];

  return v4;
}

- (RTMotionActivity)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithType_confidence_startDate_);
}

- (RTMotionActivity)initWithType:(unint64_t)a3 confidence:(unint64_t)a4 startDate:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (v8)
  {
    v16.receiver = self;
    v16.super_class = (Class)RTMotionActivity;
    v9 = [(RTMotionActivity *)&v16 init];
    v10 = v9;
    if (v9)
    {
      v9->_type = a3;
      v9->_confidence = a4;
      uint64_t v11 = [v8 copy];
      startDate = v10->_startDate;
      v10->_startDate = (NSDate *)v11;
    }
    self = v10;
    v13 = self;
  }
  else
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTMotionActivity initWithType:confidence:startDate:]";
      __int16 v19 = 1024;
      int v20 = 97;
      _os_log_error_impl(&dword_1A8FEF000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate (in %s:%d)", buf, 0x12u);
    }

    v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (RTMotionActivity *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(RTMotionActivity *)self type];
      BOOL v8 = 0;
      if (v6 == [(RTMotionActivity *)v5 type])
      {
        unint64_t v7 = [(RTMotionActivity *)self confidence];
        if (v7 == [(RTMotionActivity *)v5 confidence]) {
          BOOL v8 = 1;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithUnsignedInteger:self->_type];
  uint64_t v4 = [v3 hash];
  v5 = [NSNumber numberWithUnsignedInteger:self->_confidence];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(id)objc_opt_class() motionActivityTypeToString:self->_type];
  v5 = [(id)objc_opt_class() motionActivityConfidenceToString:self->_confidence];
  unint64_t v6 = [(NSDate *)self->_startDate stringFromDate];
  unint64_t v7 = [v3 stringWithFormat:@"type, %@, confidence, %@, startDate, %@", v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTMotionActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confidence"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];

  v10 = [(RTMotionActivity *)self initWithType:v6 confidence:v8 startDate:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t type = self->_type;
  id v8 = a3;
  uint64_t v6 = [v4 numberWithUnsignedInteger:type];
  [v8 encodeObject:v6 forKey:@"type"];

  unint64_t v7 = [NSNumber numberWithUnsignedInteger:self->_confidence];
  [v8 encodeObject:v7 forKey:@"confidence"];

  [v8 encodeObject:self->_startDate forKey:@"startDate"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t type = self->_type;
  unint64_t confidence = self->_confidence;
  startDate = self->_startDate;
  return (id)[v4 initWithType:type confidence:confidence startDate:startDate];
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void).cxx_destruct
{
}

@end