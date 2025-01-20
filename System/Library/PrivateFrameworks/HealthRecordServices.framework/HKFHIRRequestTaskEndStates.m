@interface HKFHIRRequestTaskEndStates
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKFHIRRequestTaskEndState)firstObject;
- (HKFHIRRequestTaskEndStates)init;
- (HKFHIRRequestTaskEndStates)initWithCoder:(id)a3;
- (HKFHIRRequestTaskEndStates)initWithEndState:(id)a3;
- (HKFHIRRequestTaskEndStates)initWithEndStates:(id)a3;
- (NSArray)objects;
- (NSString)eventLoggingDescription;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFHIRRequestTaskEndStates

- (HKFHIRRequestTaskEndStates)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKFHIRRequestTaskEndStates)initWithEndStates:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFHIRRequestTaskEndStates;
  v5 = [(HKFHIRRequestTaskEndStates *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    objects = v5->_objects;
    v5->_objects = (NSArray *)v6;
  }
  return v5;
}

- (HKFHIRRequestTaskEndStates)initWithEndState:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    objc_super v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKFHIRRequestTaskEndState.m", 194, @"Invalid parameter not satisfying: %@", @"endState" object file lineNumber description];
  }
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  v7 = [(HKFHIRRequestTaskEndStates *)self initWithEndStates:v6];

  return v7;
}

- (HKFHIRRequestTaskEndState)firstObject
{
  return (HKFHIRRequestTaskEndState *)[(NSArray *)self->_objects firstObject];
}

- (NSString)eventLoggingDescription
{
  return [(NSArray *)self->_objects componentsJoinedByString:@"; "];
}

- (unint64_t)hash
{
  return [(NSArray *)self->_objects hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKFHIRRequestTaskEndStates *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objects = self->_objects;
      v8 = [(HKFHIRRequestTaskEndStates *)v6 objects];
      if (objects == v8)
      {
        char v12 = 1;
      }
      else
      {
        objc_super v9 = [(HKFHIRRequestTaskEndStates *)v6 objects];
        if (v9)
        {
          v10 = self->_objects;
          v11 = [(HKFHIRRequestTaskEndStates *)v6 objects];
          char v12 = [(NSArray *)v10 isEqualToArray:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSArray *)self->_objects countByEnumeratingWithState:a3 objects:a4 count:a5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKFHIRRequestTaskEndStates)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
  uint64_t v6 = [v4 decodeObjectOfClasses:v5 forKey:@"objects"];
  if (v6)
  {
    self = [(HKFHIRRequestTaskEndStates *)self initWithEndStates:v6];
    v7 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v7 = 0;
  }

  return v7;
}

- (NSArray)objects
{
  return self->_objects;
}

- (void).cxx_destruct
{
}

@end