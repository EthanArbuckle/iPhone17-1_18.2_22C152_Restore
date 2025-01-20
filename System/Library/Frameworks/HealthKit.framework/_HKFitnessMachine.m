@interface _HKFitnessMachine
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKDevice)device;
- (NSString)brand;
- (NSUUID)identifier;
- (_HKFitnessMachine)initWithCoder:(id)a3;
- (_HKFitnessMachine)initWithType:(unint64_t)a3 identifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)activityType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)_setActivityType:(unint64_t)a3;
- (void)_setBrand:(id)a3;
- (void)_setDevice:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HKFitnessMachine

- (_HKFitnessMachine)initWithType:(unint64_t)a3 identifier:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_HKFitnessMachine;
  v8 = [(_HKFitnessMachine *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a4);
    v9->_type = a3;
  }

  return v9;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    identifier = self->_identifier;
    v6 = [v4 identifier];
    char v7 = [(NSUUID *)identifier isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(NSUUID *)self->_identifier UUIDString];
  unint64_t type = self->_type;
  if (type > 6) {
    v8 = 0;
  }
  else {
    v8 = off_1E58C62C8[type];
  }
  v9 = [(HKDevice *)self->_device name];
  v10 = +[HKWorkout _stringFromWorkoutActivityType:self->_activityType];
  objc_super v11 = [v3 stringWithFormat:@"<%@ %p> %@ %@ %@ %@", v5, self, v6, v8, v9, v10];

  return v11;
}

- (void)_setActivityType:(unint64_t)a3
{
  self->_activityType = a3;
}

- (void)_setDevice:(id)a3
{
}

- (void)_setBrand:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKFitnessMachine)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HKFitnessMachine;
  v5 = [(_HKFitnessMachine *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_unint64_t type = [v4 decodeIntegerForKey:@"Type"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Device"];
    device = v5->_device;
    v5->_device = (HKDevice *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Brand"];
    brand = v5->_brand;
    v5->_brand = (NSString *)v10;

    v5->_activityType = [v4 decodeIntegerForKey:@"WorkoutActivityType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"Identifier"];
  [v5 encodeInteger:self->_type forKey:@"Type"];
  [v5 encodeObject:self->_device forKey:@"Device"];
  [v5 encodeObject:self->_brand forKey:@"Brand"];
  [v5 encodeInteger:self->_activityType forKey:@"WorkoutActivityType"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithType:identifier:", self->_type, self->_identifier);
  uint64_t v5 = [(HKDevice *)self->_device copy];
  uint64_t v6 = (void *)v4[4];
  v4[4] = v5;

  uint64_t v7 = [(NSString *)self->_brand copy];
  uint64_t v8 = (void *)v4[5];
  v4[5] = v7;

  v4[3] = self->_activityType;
  return v4;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (HKDevice)device
{
  return self->_device;
}

- (NSString)brand
{
  return self->_brand;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end