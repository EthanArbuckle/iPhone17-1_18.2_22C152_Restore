@interface HKWorkoutEvent
+ (BOOL)supportsSecureCoding;
+ (HKWorkoutEvent)workoutEventWithType:(HKWorkoutEventType)type date:(NSDate *)date;
+ (HKWorkoutEvent)workoutEventWithType:(HKWorkoutEventType)type date:(NSDate *)date metadata:(NSDictionary *)metadata;
+ (HKWorkoutEvent)workoutEventWithType:(HKWorkoutEventType)type dateInterval:(NSDateInterval *)dateInterval metadata:(NSDictionary *)metadata;
+ (id)_newWorkoutEventWithType:(int64_t)a3 dateInterval:(id)a4 metadata:(id)a5;
+ (id)_unvalidatedWorkoutEventWithType:(int64_t)a3 dateInterval:(id)a4 metadata:(id)a5;
+ (id)_workoutEventWithInternalEvent:(id)a3;
+ (id)_workoutEventWithType:(int64_t)a3 date:(id)a4 metadata:(id)a5;
+ (id)_workoutEventWithType:(int64_t)a3 dateInterval:(id)a4 metadata:(id)a5;
- (BOOL)isEqual:(id)a3;
- (HKWorkoutEvent)init;
- (HKWorkoutEvent)initWithCoder:(id)a3;
- (HKWorkoutEvent)initWithWorkoutEventType:(int64_t)a3 sessionUUID:(id)a4 dateInterval:(id)a5 metadata:(id)a6 error:(id)a7;
- (HKWorkoutEventType)type;
- (NSDate)date;
- (NSDateInterval)dateInterval;
- (NSDictionary)metadata;
- (NSError)error;
- (NSUUID)sessionUUID;
- (id)_init;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)workoutEventType;
- (unint64_t)hash;
- (void)_assertPropertiesValid;
- (void)_setWorkoutEventMetadata:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKWorkoutEvent

uint64_t __30___HKWorkoutEvent_description__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)description___formatter;
  description___formatter = (uint64_t)v0;

  v2 = (void *)description___formatter;

  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

+ (id)_newWorkoutEventWithType:(int64_t)a3 dateInterval:(id)a4 metadata:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [[HKWorkoutEvent alloc] _init];
  v9[1] = a3;
  uint64_t v10 = [v8 copy];

  v11 = (void *)v9[2];
  v9[2] = v10;

  if (v7)
  {
    uint64_t v12 = [v7 copy];
    v13 = (void *)v9[3];
    v9[3] = v12;
  }
  return v9;
}

+ (id)_workoutEventWithType:(int64_t)a3 date:(id)a4 metadata:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F28C18];
  id v9 = a5;
  id v10 = a4;
  v11 = (void *)[[v8 alloc] initWithStartDate:v10 duration:0.0];

  uint64_t v12 = (void *)[a1 _newWorkoutEventWithType:a3 dateInterval:v11 metadata:v9];
  uint64_t v13 = HKDefaultObjectValidationConfiguration();
  v15 = objc_msgSend(v12, "_validateWithConfiguration:", v13, v14);

  if (v15)
  {

    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)_workoutEventWithType:(int64_t)a3 dateInterval:(id)a4 metadata:(id)a5
{
  v5 = (void *)[a1 _newWorkoutEventWithType:a3 dateInterval:a4 metadata:a5];
  uint64_t v6 = HKDefaultObjectValidationConfiguration();
  id v8 = objc_msgSend(v5, "_validateWithConfiguration:", v6, v7);

  if (v8)
  {

    v5 = 0;
  }

  return v5;
}

+ (id)_workoutEventWithInternalEvent:(id)a3
{
  id v3 = a3;
  v4 = [[HKWorkoutEvent alloc] _init];
  uint64_t v5 = [v3 eventType];
  uint64_t v6 = 0;
  uint64_t v7 = 1;
  switch(v5)
  {
    case 0:
    case 1:
    case 4:
    case 11:
    case 12:
    case 13:
    case 14:
      goto LABEL_11;
    case 2:
      goto LABEL_9;
    case 3:
      uint64_t v7 = 2;
      goto LABEL_9;
    case 5:
      uint64_t v7 = 3;
      goto LABEL_9;
    case 6:
      uint64_t v7 = 4;
      goto LABEL_9;
    case 7:
      uint64_t v7 = 5;
      goto LABEL_9;
    case 8:
      uint64_t v7 = 6;
      goto LABEL_9;
    case 9:
      uint64_t v7 = 7;
      goto LABEL_9;
    case 10:
      uint64_t v7 = 8;
LABEL_9:
      v4[1] = v7;
      break;
    default:
      break;
  }
  id v8 = [v3 dateInterval];
  uint64_t v9 = [v8 copy];
  id v10 = (void *)v4[2];
  v4[2] = v9;

  v11 = [v3 metadata];
  uint64_t v12 = [v11 copy];
  uint64_t v13 = (void *)v4[3];
  v4[3] = v12;

  uint64_t v6 = v4;
LABEL_11:

  return v6;
}

+ (id)_unvalidatedWorkoutEventWithType:(int64_t)a3 dateInterval:(id)a4 metadata:(id)a5
{
  uint64_t v5 = (void *)[a1 _newWorkoutEventWithType:a3 dateInterval:a4 metadata:a5];

  return v5;
}

+ (HKWorkoutEvent)workoutEventWithType:(HKWorkoutEventType)type date:(NSDate *)date
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F28C18];
  uint64_t v7 = date;
  id v8 = (void *)[[v6 alloc] initWithStartDate:v7 duration:0.0];

  uint64_t v9 = (void *)[a1 _newWorkoutEventWithType:type dateInterval:v8 metadata:0];
  [v9 _assertPropertiesValid];

  return (HKWorkoutEvent *)v9;
}

+ (HKWorkoutEvent)workoutEventWithType:(HKWorkoutEventType)type date:(NSDate *)date metadata:(NSDictionary *)metadata
{
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F28C18];
  id v8 = date;
  uint64_t v9 = (void *)[[v7 alloc] initWithStartDate:v8 duration:0.0];

  id v10 = (void *)[a1 _newWorkoutEventWithType:type dateInterval:v9 metadata:0];
  [v10 _assertPropertiesValid];

  return (HKWorkoutEvent *)v10;
}

+ (HKWorkoutEvent)workoutEventWithType:(HKWorkoutEventType)type dateInterval:(NSDateInterval *)dateInterval metadata:(NSDictionary *)metadata
{
  uint64_t v5 = (void *)[a1 _newWorkoutEventWithType:type dateInterval:dateInterval metadata:metadata];
  [v5 _assertPropertiesValid];

  return (HKWorkoutEvent *)v5;
}

- (id)description
{
  unint64_t v3 = self->_type - 1;
  if (v3 > 7) {
    v4 = 0;
  }
  else {
    v4 = off_1E58C88B8[v3];
  }
  uint64_t v5 = [NSString stringWithFormat:@"%@, %@", v4, self->_dateInterval];
  if ([(NSDictionary *)self->_metadata count])
  {
    uint64_t v6 = [v5 stringByAppendingFormat:@" %@", self->_metadata];

    uint64_t v5 = (void *)v6;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    id v7 = v4[3];
    NSUInteger v8 = [(NSDictionary *)self->_metadata count];
    BOOL v6 = v8 == [v7 count]
      && ((metadata = self->_metadata) == 0
       || !v7
       || [(NSDictionary *)metadata isEqualToDictionary:v7])
      && v4[1] == self->_type
      && [(NSDateInterval *)self->_dateInterval isEqualToDateInterval:v4[2]];
  }
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDateInterval *)self->_dateInterval hash];
  v4 = [NSNumber numberWithInteger:self->_type];
  unint64_t v5 = [v4 hash] ^ v3;

  if ([(NSDictionary *)self->_metadata count]) {
    v5 ^= [(NSDictionary *)self->_metadata hash];
  }
  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NSDateInterval *)self->_dateInterval startDate];
  BOOL v6 = [v4 dateInterval];
  id v7 = [v6 startDate];
  int64_t v8 = [v5 compare:v7];

  if (!v8)
  {
    uint64_t v9 = [(NSDateInterval *)self->_dateInterval endDate];
    id v10 = [v4 dateInterval];
    v11 = [v10 endDate];
    int64_t v8 = [v9 compare:v11];

    if (!v8)
    {
      int64_t type = self->_type;
      if (type == [v4 type])
      {
        int64_t v8 = 0;
      }
      else
      {
        int64_t v13 = self->_type;
        if (v13 < [v4 type]) {
          int64_t v8 = -1;
        }
        else {
          int64_t v8 = 1;
        }
      }
    }
  }

  return v8;
}

- (void)_setWorkoutEventMetadata:(id)a3
{
  id v4 = (NSDictionary *)[a3 copy];
  metadata = self->_metadata;
  self->_metadata = v4;

  MEMORY[0x1F41817F8](v4, metadata);
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)HKWorkoutEvent;
  return [(HKWorkoutEvent *)&v3 init];
}

- (HKWorkoutEvent)init
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  unint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKWorkoutEvent)initWithWorkoutEventType:(int64_t)a3 sessionUUID:(id)a4 dateInterval:(id)a5 metadata:(id)a6 error:(id)a7
{
  int64_t v8 = +[HKWorkoutEvent _unvalidatedWorkoutEventWithType:a3 dateInterval:a5 metadata:a6];

  return v8;
}

- (HKWorkoutEventType)type
{
  return self->_type;
}

- (NSDate)date
{
  int64_t type = self->_type;
  dateInterval = self->_dateInterval;
  if (type == 3) {
    [(NSDateInterval *)dateInterval endDate];
  }
  else {
  uint64_t v4 = [(NSDateInterval *)dateInterval startDate];
  }

  return (NSDate *)v4;
}

- (int64_t)workoutEventType
{
  return self->_type;
}

- (NSUUID)sessionUUID
{
  return 0;
}

- (NSError)error
{
  return 0;
}

- (void)_assertPropertiesValid
{
  uint64_t v3 = HKDefaultObjectValidationConfiguration();
  unint64_t v5 = -[HKWorkoutEvent _validateWithConfiguration:](self, "_validateWithConfiguration:", v3, v4);
  if (v5)
  {
    BOOL v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v9 = v5;
    int64_t v8 = [v5 localizedDescription];
    [v6 raise:v7, @"%@", v8 format];

    unint64_t v5 = v9;
  }
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  if ((unint64_t)(self->_type - 1) >= 8)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = objc_opt_class();
    int64_t type = (__CFString *)self->_type;
    v15 = @"Invalid type (%ld)";
LABEL_18:
    v21 = type;
    goto LABEL_19;
  }
  dateInterval = self->_dateInterval;
  if (!dateInterval)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = objc_opt_class();
    v15 = @"Workout event date interval cannot be nil";
LABEL_19:
    v19 = objc_msgSend(v11, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v12, a2, v15, v21);
    goto LABEL_20;
  }
  unint64_t var1 = a3.var1;
  char var0 = a3.var0;
  [(NSDateInterval *)dateInterval duration];
  unint64_t v9 = self->_type;
  if (v9 > 8) {
    goto LABEL_6;
  }
  double v10 = fabs(v8);
  if (((1 << v9) & 0x176) == 0)
  {
    if (v9 == 3 || v9 == 7 && v10 >= 2.22044605e-16) {
      goto LABEL_13;
    }
LABEL_6:
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = objc_opt_class();
    unint64_t v13 = self->_type - 1;
    if (v13 > 7) {
      int64_t type = 0;
    }
    else {
      int64_t type = off_1E58C88B8[v13];
    }
    v15 = @"Invalid date interval duration for type %@";
    goto LABEL_18;
  }
  if (v10 >= 2.22044605e-16) {
    goto LABEL_6;
  }
LABEL_13:
  if ((var0 & 4) != 0)
  {
    id v18 = 0;
    goto LABEL_24;
  }
  metadata = self->_metadata;
  id v22 = 0;
  BOOL v17 = [(NSDictionary *)metadata hk_validateMetadataKeysAndValuesForWorkoutEvent:self applicationSDKVersionToken:var1 error:&v22];
  id v18 = v22;
  if (v17)
  {
LABEL_24:
    v19 = 0;
    goto LABEL_25;
  }
  id v18 = v18;
  v19 = v18;
LABEL_25:

LABEL_20:

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKWorkoutEvent)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  if (!v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 duration:0.0];
  }
  double v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:5];
  double v10 = objc_msgSend(v8, "setWithArray:", v9, v15, v16, v17, v18);

  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"metadata"];
  uint64_t v12 = objc_msgSend(v11, "hk_replaceKeysFromSharedStringCache");

  unint64_t v13 = [(id)objc_opt_class() _unvalidatedWorkoutEventWithType:v5 dateInterval:v6 metadata:v12];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_dateInterval forKey:@"dateInterval"];
  [v5 encodeObject:self->_metadata forKey:@"metadata"];
}

- (NSDateInterval)dateInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end