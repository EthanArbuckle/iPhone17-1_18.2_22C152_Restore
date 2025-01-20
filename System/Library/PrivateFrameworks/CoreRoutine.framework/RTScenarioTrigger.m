@interface RTScenarioTrigger
+ (BOOL)supportsSecureCoding;
+ (id)scenarioTriggerSettledStateToString:(unint64_t)a3;
+ (id)scenarioTriggerTypeToString:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (RTScenarioTrigger)init;
- (RTScenarioTrigger)initWithCoder:(id)a3;
- (RTScenarioTrigger)initWithType:(unint64_t)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTScenarioTrigger

+ (id)scenarioTriggerTypeToString:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E5D73AF8[a3];
  }
}

+ (id)scenarioTriggerSettledStateToString:(unint64_t)a3
{
  v3 = @"Unknown";
  if (a3 == 2) {
    v3 = @"Settled";
  }
  if (a3 == 1) {
    return @"Unsettled";
  }
  else {
    return v3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v3 = NSNumber;
  unint64_t type = self->_type;
  id v5 = a3;
  id v6 = [v3 numberWithUnsignedInteger:type];
  [v5 encodeObject:v6 forKey:@"type"];
}

- (RTScenarioTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];

  uint64_t v6 = [v5 unsignedIntegerValue];
  return [(RTScenarioTrigger *)self initWithType:v6];
}

- (RTScenarioTrigger)init
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithType_);
}

- (RTScenarioTrigger)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTScenarioTrigger;
  result = [(RTScenarioTrigger *)&v5 init];
  if (result) {
    result->_unint64_t type = a3;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  id v4 = +[RTScenarioTrigger scenarioTriggerTypeToString:self->_type];
  objc_super v5 = [v3 stringWithFormat:@"RTScenarioTriggerType, %@ (%lu)", v4, self->_type];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTScenarioTrigger *)a3;
  objc_super v5 = v4;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else if (v4 && [(RTScenarioTrigger *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v6 = v5;
    unint64_t v7 = [(RTScenarioTrigger *)self type];
    uint64_t v8 = [(RTScenarioTrigger *)v6 type];

    BOOL v9 = v7 == v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[RTScenarioTrigger type](self, "type"));
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

@end