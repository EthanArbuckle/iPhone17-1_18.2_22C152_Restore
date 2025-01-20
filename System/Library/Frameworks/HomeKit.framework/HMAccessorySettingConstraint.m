@interface HMAccessorySettingConstraint
+ (BOOL)supportsSecureCoding;
+ (NSSet)supportedValueClasses;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessorySettingConstraint)init;
- (HMAccessorySettingConstraint)initWithCoder:(id)a3;
- (HMAccessorySettingConstraint)initWithIdentifier:(id)a3 type:(int64_t)a4 value:(id)a5;
- (HMAccessorySettingConstraint)initWithType:(int64_t)a3 value:(id)a4;
- (NSUUID)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)shortDescription;
- (id)value;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMAccessorySettingConstraint

- (void).cxx_destruct
{
}

- (id)value
{
  return objc_getProperty(self, a2, 32, 1);
}

- (int64_t)type
{
  return self->_type;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMAccessorySettingConstraint *)self identifier];
  [v4 encodeObject:v5 forKey:@"HM.identifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMAccessorySettingConstraint type](self, "type"), @"HM.type");
  id v6 = [(HMAccessorySettingConstraint *)self value];
  [v4 encodeObject:v6 forKey:@"HM.value"];
}

- (HMAccessorySettingConstraint)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"HM.type"];
  id v6 = [(id)objc_opt_class() supportedValueClasses];
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"HM.value"];

  v8 = [(HMAccessorySettingConstraint *)self initWithType:v5 value:v7];
  if (v8 && [v4 containsValueForKey:@"HM.identifier"])
  {
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
    [v9 getUUIDBytes:v8->_identifierUUIDBytes];
  }
  return v8;
}

- (id)description
{
  return [(HMAccessorySettingConstraint *)self descriptionWithPointer:0];
}

- (id)debugDescription
{
  return [(HMAccessorySettingConstraint *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = NSString;
  id v6 = [(id)objc_opt_class() shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1EEE9DD88;
  }
  v8 = [(HMAccessorySettingConstraint *)self identifier];
  v9 = [v8 UUIDString];
  unint64_t v10 = [(HMAccessorySettingConstraint *)self type] - 1;
  if (v10 > 3) {
    v11 = @"Unknown";
  }
  else {
    v11 = off_1E593E5A0[v10];
  }
  v12 = [(HMAccessorySettingConstraint *)self value];
  v13 = [v5 stringWithFormat:@"<%@%@, Identifier = %@, Type = %@, Value = %@>", v6, v7, v9, v11, v12];

  if (v3) {

  }
  return v13;
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  uint64_t v5 = [(HMAccessorySettingConstraint *)self identifier];
  id v6 = [v5 UUIDString];
  v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMAccessorySettingConstraint *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v5;
    if (v6
      && (int64_t v7 = [(HMAccessorySettingConstraint *)self type], v7 == [(HMAccessorySettingConstraint *)v6 type]))
    {
      v8 = [(HMAccessorySettingConstraint *)self value];
      v9 = [(HMAccessorySettingConstraint *)v6 value];
      char v10 = HMFEqualObjects();
    }
    else
    {
      char v10 = 0;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  BOOL v3 = [(HMAccessorySettingConstraint *)self value];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(HMAccessorySettingConstraint *)self type] ^ v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[HMAccessorySettingConstraint allocWithZone:a3];
  int64_t v5 = [(HMAccessorySettingConstraint *)self type];
  id v6 = [(HMAccessorySettingConstraint *)self value];
  int64_t v7 = (void *)[v6 copy];
  v8 = [(HMAccessorySettingConstraint *)v4 initWithType:v5 value:v7];

  return v8;
}

- (NSUUID)identifier
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:self->_identifierUUIDBytes];

  return (NSUUID *)v2;
}

- (HMAccessorySettingConstraint)initWithIdentifier:(id)a3 type:(int64_t)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMAccessorySettingConstraint;
  char v10 = [(HMAccessorySettingConstraint *)&v15 init];
  v11 = v10;
  if (v10)
  {
    [v8 getUUIDBytes:v10->_identifierUUIDBytes];
    v11->_type = a4;
    uint64_t v12 = [v9 copy];
    id value = v11->_value;
    v11->_id value = (id)v12;
  }
  return v11;
}

- (HMAccessorySettingConstraint)initWithType:(int64_t)a3 value:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a4;
  id v8 = [v6 UUID];
  id v9 = [(HMAccessorySettingConstraint *)self initWithIdentifier:v8 type:a3 value:v7];

  return v9;
}

- (HMAccessorySettingConstraint)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  int64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSSet)supportedValueClasses
{
  if (supportedValueClasses_onceToken != -1) {
    dispatch_once(&supportedValueClasses_onceToken, &__block_literal_global_756);
  }
  v2 = (void *)supportedValueClasses_supportedValueClasses;

  return (NSSet *)v2;
}

void __53__HMAccessorySettingConstraint_supportedValueClasses__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:3];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  uint64_t v3 = (void *)supportedValueClasses_supportedValueClasses;
  supportedValueClasses_supportedValueClasses = v2;
}

+ (id)shortDescription
{
  uint64_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end