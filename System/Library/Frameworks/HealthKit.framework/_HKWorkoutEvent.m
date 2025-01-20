@interface _HKWorkoutEvent
+ (BOOL)supportsSecureCoding;
+ (int64_t)internalEventTypeWithPublicEvent:(id)a3;
- (NSDateInterval)dateInterval;
- (NSDictionary)metadata;
- (NSError)error;
- (NSUUID)sessionId;
- (NSUUID)sessionUUID;
- (_HKWorkoutEvent)initWithCoder:(id)a3;
- (_HKWorkoutEvent)initWithEventType:(int64_t)a3 sessionId:(id)a4 dateInterval:(id)a5 metadata:(id)a6;
- (_HKWorkoutEvent)initWithSessionId:(id)a3 error:(id)a4;
- (_HKWorkoutEvent)initWithWorkoutEventType:(int64_t)a3 sessionUUID:(id)a4 dateInterval:(id)a5 metadata:(id)a6 error:(id)a7;
- (id)description;
- (int64_t)eventType;
- (int64_t)workoutEventType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HKWorkoutEvent

- (_HKWorkoutEvent)initWithEventType:(int64_t)a3 sessionId:(id)a4 dateInterval:(id)a5 metadata:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)_HKWorkoutEvent;
  v14 = [(_HKWorkoutEvent *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_eventType = a3;
    objc_storeStrong((id *)&v14->_sessionId, a4);
    objc_storeStrong((id *)&v15->_dateInterval, a5);
    uint64_t v16 = [v13 copy];
    metadata = v15->_metadata;
    v15->_metadata = (NSDictionary *)v16;
  }
  return v15;
}

- (id)description
{
  if (self->_eventType == 4)
  {
    v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = [v3 stringWithFormat:@"%@: ERROR %@", v5, self->_error];
  }
  else
  {
    if (description_onceToken_0 != -1) {
      dispatch_once(&description_onceToken_0, &__block_literal_global_124);
    }
    v7 = (void *)description___formatter;
    v8 = [(NSDateInterval *)self->_dateInterval startDate];
    v5 = [v7 stringFromDate:v8];

    v9 = (void *)description___formatter;
    v10 = [(NSDateInterval *)self->_dateInterval endDate];
    id v11 = [v9 stringFromDate:v10];

    unint64_t eventType = self->_eventType;
    if (eventType > 0xB) {
      id v13 = &stru_1EEC60288;
    }
    else {
      id v13 = off_1E58C8AF0[eventType];
    }
    v14 = NSString;
    v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    v6 = [v14 stringWithFormat:@"%@: %@ %@ %@-%@", v16, v13, self->_sessionId, v5, v11];
  }

  return v6;
}

- (NSUUID)sessionId
{
  return self->_sessionId;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t eventType = self->_eventType;
  id v6 = a3;
  [v6 encodeInteger:eventType forKey:@"eventType"];
  [v6 encodeObject:self->_sessionId forKey:@"sessionId"];
  v5 = [(NSDateInterval *)self->_dateInterval startDate];
  [v6 encodeObject:v5 forKey:@"date"];

  [v6 encodeObject:self->_dateInterval forKey:@"dateInterval"];
  [v6 encodeObject:self->_metadata forKey:@"metadata"];
  [v6 encodeObject:self->_error forKey:@"error"];
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);

  objc_storeStrong((id *)&self->_sessionId, 0);
}

- (_HKWorkoutEvent)initWithSessionId:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HKWorkoutEvent;
  v9 = [(_HKWorkoutEvent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_int64_t eventType = 4;
    objc_storeStrong((id *)&v9->_sessionId, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (_HKWorkoutEvent)initWithWorkoutEventType:(int64_t)a3 sessionUUID:(id)a4 dateInterval:(id)a5 metadata:(id)a6 error:(id)a7
{
  if (a7) {
    id v7 = -[_HKWorkoutEvent initWithSessionId:error:](self, "initWithSessionId:error:", a4, a7, a5, a6);
  }
  else {
    id v7 = [(_HKWorkoutEvent *)self initWithEventType:a3 sessionId:a4 dateInterval:a5 metadata:a6];
  }
  id v8 = v7;

  return v8;
}

+ (int64_t)internalEventTypeWithPublicEvent:(id)a3
{
  uint64_t v3 = [a3 type];
  if ((unint64_t)(v3 - 2) > 6) {
    return 2;
  }
  else {
    return qword_19C3D49B8[v3 - 2];
  }
}

- (NSUUID)sessionUUID
{
  return self->_sessionId;
}

- (int64_t)workoutEventType
{
  return self->_eventType;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKWorkoutEvent)initWithCoder:(id)a3
{
  v23[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_HKWorkoutEvent;
  v5 = [(_HKWorkoutEvent *)&v22 init];
  if (v5)
  {
    v5->_int64_t eventType = [v4 decodeIntegerForKey:@"eventType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionId"];
    sessionId = v5->_sessionId;
    v5->_sessionId = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v8;

    if (!v5->_dateInterval)
    {
      v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
      if (v10)
      {
        uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v10 duration:0.0];
        objc_super v12 = v5->_dateInterval;
        v5->_dateInterval = (NSDateInterval *)v11;
      }
    }
    id v13 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v23[3] = objc_opt_class();
    v23[4] = objc_opt_class();
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:5];
    v15 = [v13 setWithArray:v14];

    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"metadata"];
    uint64_t v17 = objc_msgSend(v16, "hk_replaceKeysFromSharedStringCache");
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v19;
  }
  return v5;
}

- (NSError)error
{
  return self->_error;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

@end