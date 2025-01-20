@interface COMTUpdateInterestAction
+ (BOOL)supportsSecureCoding;
+ (id)actionWithTargetType:(id)a3 targetIdentifiers:(id)a4;
- (COMTUpdateInterestAction)initWithCoder:(id)a3;
- (COMTUpdateInterestAction)initWithTargetType:(id)a3 targetIdentifiers:(id)a4;
- (NSArray)targetIdentifiers;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COMTUpdateInterestAction

+ (id)actionWithTargetType:(id)a3 targetIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithTargetType:v7 targetIdentifiers:v6];

  return v8;
}

- (COMTUpdateInterestAction)initWithTargetType:(id)a3 targetIdentifiers:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)COMTUpdateInterestAction;
  id v7 = [(COMTTypedAction *)&v11 initWithType:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    targetIdentifiers = v7->_targetIdentifiers;
    v7->_targetIdentifiers = (NSArray *)v8;
  }
  return v7;
}

- (COMTUpdateInterestAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)COMTUpdateInterestAction;
  v5 = [(COMTTypedAction *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"ITI"];
    if (!v6)
    {
      uint64_t v8 = 0;
      goto LABEL_6;
    }
    targetIdentifiers = v5->_targetIdentifiers;
    v5->_targetIdentifiers = (NSArray *)v6;
  }
  uint64_t v8 = v5;
LABEL_6:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)COMTUpdateInterestAction;
  id v4 = a3;
  [(COMTTypedAction *)&v6 encodeWithCoder:v4];
  v5 = [(COMTUpdateInterestAction *)self targetIdentifiers];
  [v4 encodeObject:v5 forKey:@"ITI"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)targetIdentifiers
{
  return self->_targetIdentifiers;
}

- (void).cxx_destruct
{
}

@end