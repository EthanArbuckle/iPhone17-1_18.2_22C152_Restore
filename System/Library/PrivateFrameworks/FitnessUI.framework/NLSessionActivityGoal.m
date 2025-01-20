@interface NLSessionActivityGoal
+ (BOOL)supportsSecureCoding;
+ (id)goalWithGoalTypeIdentifier:(unint64_t)a3 value:(id)a4;
+ (id)goalWithGoalTypeIdentifier:(unint64_t)a3 value:(id)a4 requiredDistance:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNLSessionActivityGoal:(id)a3;
- (HKQuantity)requiredDistance;
- (HKQuantity)value;
- (NLSessionActivityGoal)initWithCoder:(id)a3;
- (NLSessionActivityGoal)initWithGoalTypeIdentifier:(unint64_t)a3 value:(id)a4;
- (NLSessionActivityGoal)initWithGoalTypeIdentifier:(unint64_t)a3 value:(id)a4 requiredDistance:(id)a5;
- (double)doubleValue;
- (id)_quantityForDoubleValue:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)goalTypeIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setGoalTypeIdentifier:(unint64_t)a3;
- (void)setRequiredDistance:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation NLSessionActivityGoal

- (NLSessionActivityGoal)initWithGoalTypeIdentifier:(unint64_t)a3 value:(id)a4
{
  return [(NLSessionActivityGoal *)self initWithGoalTypeIdentifier:a3 value:a4 requiredDistance:0];
}

- (NLSessionActivityGoal)initWithGoalTypeIdentifier:(unint64_t)a3 value:(id)a4 requiredDistance:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NLSessionActivityGoal;
  v11 = [(NLSessionActivityGoal *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_goalTypeIdentifier = a3;
    objc_storeStrong((id *)&v11->_value, a4);
    if (v10) {
      [(NLSessionActivityGoal *)v12 setRequiredDistance:v10];
    }
  }

  return v12;
}

- (double)doubleValue
{
  unint64_t v3 = [(NLSessionActivityGoal *)self goalTypeIdentifier];
  if (v3 == 1)
  {
    value = self->_value;
    uint64_t v6 = [MEMORY[0x263F0A830] meterUnit];
    goto LABEL_7;
  }
  if (v3 == 2)
  {
    value = self->_value;
    uint64_t v6 = [MEMORY[0x263F0A830] secondUnit];
    goto LABEL_7;
  }
  double v4 = 0.0;
  if (v3 == 3)
  {
    value = self->_value;
    uint64_t v6 = [MEMORY[0x263F0A830] kilocalorieUnit];
LABEL_7:
    v7 = (void *)v6;
    [(HKQuantity *)value doubleValueForUnit:v6];
    double v4 = v8;
  }
  return v4;
}

- (id)_quantityForDoubleValue:(double)a3
{
  unint64_t goalTypeIdentifier = self->_goalTypeIdentifier;
  switch(goalTypeIdentifier)
  {
    case 1uLL:
      v5 = (void *)MEMORY[0x263F0A630];
      uint64_t v6 = [MEMORY[0x263F0A830] meterUnit];
      goto LABEL_7;
    case 2uLL:
      v5 = (void *)MEMORY[0x263F0A630];
      uint64_t v6 = [MEMORY[0x263F0A830] secondUnit];
      goto LABEL_7;
    case 3uLL:
      v5 = (void *)MEMORY[0x263F0A630];
      uint64_t v6 = [MEMORY[0x263F0A830] kilocalorieUnit];
LABEL_7:
      v7 = (void *)v6;
      double v8 = [v5 quantityWithUnit:v6 doubleValue:a3];

      goto LABEL_9;
  }
  double v8 = 0;
LABEL_9:
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:self->_goalTypeIdentifier forKey:@"NLSessionActivityGoalGoalTypeIdentifier"];
  [(NLSessionActivityGoal *)self doubleValue];
  objc_msgSend(v5, "encodeDouble:forKey:", @"NLSessionActivityGoalValue");
  [v5 encodeObject:self->_value forKey:@"NLSessionActivityGoalQuantity"];
  requiredDistance = self->_requiredDistance;
  if (requiredDistance) {
    [v5 encodeObject:requiredDistance forKey:@"NLSessionActivityGoalRequiredDistance"];
  }
}

- (NLSessionActivityGoal)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLSessionActivityGoal;
  id v5 = [(NLSessionActivityGoal *)&v10 init];
  if (v5)
  {
    -[NLSessionActivityGoal setGoalTypeIdentifier:](v5, "setGoalTypeIdentifier:", [v4 decodeIntegerForKey:@"NLSessionActivityGoalGoalTypeIdentifier"]);
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NLSessionActivityGoalQuantity"];
    if (v6)
    {
      [(NLSessionActivityGoal *)v5 setValue:v6];
    }
    else
    {
      [v4 decodeDoubleForKey:@"NLSessionActivityGoalValue"];
      v7 = -[NLSessionActivityGoal _quantityForDoubleValue:](v5, "_quantityForDoubleValue:");
      [(NLSessionActivityGoal *)v5 setValue:v7];
    }
    double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NLSessionActivityGoalRequiredDistance"];
    if (v8) {
      [(NLSessionActivityGoal *)v5 setRequiredDistance:v8];
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)goalWithGoalTypeIdentifier:(unint64_t)a3 value:(id)a4
{
  return +[NLSessionActivityGoal goalWithGoalTypeIdentifier:a3 value:a4 requiredDistance:0];
}

+ (id)goalWithGoalTypeIdentifier:(unint64_t)a3 value:(id)a4 requiredDistance:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  objc_super v10 = (void *)[objc_alloc((Class)a1) initWithGoalTypeIdentifier:a3 value:v9 requiredDistance:v8];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NLSessionActivityGoal *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NLSessionActivityGoal *)self isEqualToNLSessionActivityGoal:v4];
  }

  return v5;
}

- (BOOL)isEqualToNLSessionActivityGoal:(id)a3
{
  id v6 = a3;
  uint64_t v7 = [v6 goalTypeIdentifier];
  if (v7 == [(NLSessionActivityGoal *)self goalTypeIdentifier])
  {
    id v8 = [v6 value];
    id v9 = [(NLSessionActivityGoal *)self value];
    if (v8 == v9
      || ([v6 value],
          unint64_t v3 = objc_claimAutoreleasedReturnValue(),
          [(NLSessionActivityGoal *)self value],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      v11 = [v6 requiredDistance];
      uint64_t v12 = [(NLSessionActivityGoal *)self requiredDistance];
      if (v11 == (void *)v12)
      {

        char v10 = 1;
      }
      else
      {
        v13 = (void *)v12;
        objc_super v14 = [v6 requiredDistance];
        v15 = [(NLSessionActivityGoal *)self requiredDistance];
        char v10 = [v14 isEqual:v15];
      }
      if (v8 == v9) {
        goto LABEL_11;
      }
    }
    else
    {
      char v10 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  char v10 = 0;
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NLSessionActivityGoal *)self value];
  uint64_t v4 = [v3 hash];

  BOOL v5 = [(NLSessionActivityGoal *)self requiredDistance];
  uint64_t v6 = [v5 hash];

  return v6 ^ v4 ^ self->_goalTypeIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [NLSessionActivityGoal alloc];
  unint64_t v5 = [(NLSessionActivityGoal *)self goalTypeIdentifier];
  uint64_t v6 = [(NLSessionActivityGoal *)self value];
  uint64_t v7 = [(NLSessionActivityGoal *)self requiredDistance];
  id v8 = [(NLSessionActivityGoal *)v4 initWithGoalTypeIdentifier:v5 value:v6 requiredDistance:v7];

  return v8;
}

- (void)setRequiredDistance:(id)a3
{
  uint64_t v4 = (HKQuantity *)a3;
  unint64_t v5 = [MEMORY[0x263F0A830] meterUnit];
  [(HKQuantity *)v4 doubleValueForUnit:v5];
  double v7 = v6;

  if (v7 <= 0.0)
  {
    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Invalid unit type. Expected HKQuantity of unit distance." userInfo:0];
    objc_exception_throw(v9);
  }
  requiredDistance = self->_requiredDistance;
  self->_requiredDistance = v4;
}

- (unint64_t)goalTypeIdentifier
{
  return self->_goalTypeIdentifier;
}

- (void)setGoalTypeIdentifier:(unint64_t)a3
{
  self->_unint64_t goalTypeIdentifier = a3;
}

- (HKQuantity)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (HKQuantity)requiredDistance
{
  return self->_requiredDistance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredDistance, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end