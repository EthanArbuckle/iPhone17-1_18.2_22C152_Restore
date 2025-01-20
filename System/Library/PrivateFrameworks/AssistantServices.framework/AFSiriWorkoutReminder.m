@interface AFSiriWorkoutReminder
+ (BOOL)supportsSecureCoding;
- (AFSiriWorkoutReminder)initWithCoder:(id)a3;
- (AFSiriWorkoutReminder)initWithPredictionIdentifier:(id)a3 predictionType:(int64_t)a4 workoutActivityType:(unint64_t)a5 locationType:(int64_t)a6 swimmingLocationType:(int64_t)a7;
- (AFSiriWorkoutReminder)initWithPredictionIdentifier:(id)a3 predictionType:(int64_t)a4 workoutType:(int64_t)a5;
- (AFSiriWorkoutReminder)initWithPredictionIdentifier:(id)a3 predictionType:(int64_t)a4 workoutType:(int64_t)a5 workoutActivityType:(unint64_t)a6 locationType:(int64_t)a7 swimmingLocationType:(int64_t)a8;
- (NSString)predictionIdentifier;
- (id)description;
- (int64_t)predictionType;
- (int64_t)workoutLocationType;
- (int64_t)workoutSwimmingLocationType;
- (int64_t)workoutType;
- (unint64_t)workoutActivityType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSiriWorkoutReminder

- (void).cxx_destruct
{
}

- (int64_t)predictionType
{
  return self->_predictionType;
}

- (int64_t)workoutSwimmingLocationType
{
  return self->_workoutSwimmingLocationType;
}

- (int64_t)workoutLocationType
{
  return self->_workoutLocationType;
}

- (unint64_t)workoutActivityType
{
  return self->_workoutActivityType;
}

- (int64_t)workoutType
{
  return self->_workoutType;
}

- (NSString)predictionIdentifier
{
  return self->_predictionIdentifier;
}

- (AFSiriWorkoutReminder)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predictionIdentifier"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"predictionType"];
  if ([v4 containsValueForKey:@"workoutType"]) {
    uint64_t v7 = [v4 decodeIntegerForKey:@"workoutType"];
  }
  else {
    uint64_t v7 = 0;
  }
  if ([v4 containsValueForKey:@"workoutActivityType"]) {
    uint64_t v8 = [v4 decodeIntegerForKey:@"workoutActivityType"];
  }
  else {
    uint64_t v8 = 0;
  }
  if ([v4 containsValueForKey:@"workoutLocationType"]) {
    uint64_t v9 = [v4 decodeIntegerForKey:@"workoutLocationType"];
  }
  else {
    uint64_t v9 = 0;
  }
  if ([v4 containsValueForKey:@"workoutSwimmingLocationType"]) {
    uint64_t v10 = [v4 decodeIntegerForKey:@"workoutSwimmingLocationType"];
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = [(AFSiriWorkoutReminder *)self initWithPredictionIdentifier:v5 predictionType:v6 workoutType:v7 workoutActivityType:v8 locationType:v9 swimmingLocationType:v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(AFSiriWorkoutReminder *)self predictionIdentifier];
  [v5 encodeObject:v4 forKey:@"predictionIdentifier"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[AFSiriWorkoutReminder predictionType](self, "predictionType"), @"predictionType");
  objc_msgSend(v5, "encodeInteger:forKey:", -[AFSiriWorkoutReminder workoutType](self, "workoutType"), @"workoutType");
  objc_msgSend(v5, "encodeInteger:forKey:", -[AFSiriWorkoutReminder workoutActivityType](self, "workoutActivityType"), @"workoutActivityType");
  objc_msgSend(v5, "encodeInteger:forKey:", -[AFSiriWorkoutReminder workoutLocationType](self, "workoutLocationType"), @"workoutLocationType");
  objc_msgSend(v5, "encodeInteger:forKey:", -[AFSiriWorkoutReminder workoutSwimmingLocationType](self, "workoutSwimmingLocationType"), @"workoutSwimmingLocationType");
}

- (id)description
{
  v3 = NSString;
  unint64_t workoutType = self->_workoutType;
  if (workoutType > 0xA) {
    id v5 = @"(unknown)";
  }
  else {
    id v5 = off_1E592A310[workoutType];
  }
  uint64_t v6 = v5;
  unint64_t workoutActivityType = self->_workoutActivityType;
  int64_t workoutLocationType = self->_workoutLocationType;
  int64_t workoutSwimmingLocationType = self->_workoutSwimmingLocationType;
  unint64_t predictionType = self->_predictionType;
  if (predictionType > 3) {
    v11 = @"(unknown)";
  }
  else {
    v11 = off_1E592A8D0[predictionType];
  }
  v12 = v11;
  v13 = [v3 stringWithFormat:@"AFSiriWorkoutReminder<workoutType: %@ workoutActivityType: %lu workoutLocationType: %lu workoutSwimmingLocationType: %lu predictionType: %@>", v6, workoutActivityType, workoutLocationType, workoutSwimmingLocationType, v12];

  return v13;
}

- (AFSiriWorkoutReminder)initWithPredictionIdentifier:(id)a3 predictionType:(int64_t)a4 workoutType:(int64_t)a5 workoutActivityType:(unint64_t)a6 locationType:(int64_t)a7 swimmingLocationType:(int64_t)a8
{
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AFSiriWorkoutReminder;
  v16 = [(AFSiriWorkoutReminder *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_predictionIdentifier, a3);
    v17->_int64_t workoutSwimmingLocationType = a8;
    v17->_unint64_t predictionType = a4;
    v17->_unint64_t workoutType = a5;
    v17->_unint64_t workoutActivityType = a6;
    v17->_int64_t workoutLocationType = a7;
  }

  return v17;
}

- (AFSiriWorkoutReminder)initWithPredictionIdentifier:(id)a3 predictionType:(int64_t)a4 workoutActivityType:(unint64_t)a5 locationType:(int64_t)a6 swimmingLocationType:(int64_t)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AFSiriWorkoutReminder;
  v14 = [(AFSiriWorkoutReminder *)&v17 init];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_predictionIdentifier, a3);
    v15->_int64_t workoutSwimmingLocationType = a7;
    v15->_unint64_t predictionType = a4;
    v15->_unint64_t workoutType = 0;
    v15->_unint64_t workoutActivityType = a5;
    v15->_int64_t workoutLocationType = a6;
  }

  return v15;
}

- (AFSiriWorkoutReminder)initWithPredictionIdentifier:(id)a3 predictionType:(int64_t)a4 workoutType:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AFSiriWorkoutReminder;
  uint64_t v10 = [(AFSiriWorkoutReminder *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_predictionIdentifier, a3);
    v11->_int64_t workoutSwimmingLocationType = 0;
    v11->_unint64_t predictionType = a4;
    v11->_unint64_t workoutType = a5;
    v11->_unint64_t workoutActivityType = 0;
    v11->_int64_t workoutLocationType = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end