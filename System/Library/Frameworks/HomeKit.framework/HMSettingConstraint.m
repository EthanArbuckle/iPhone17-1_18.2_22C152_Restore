@interface HMSettingConstraint
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
+ (id)supportedValueClasses;
- (BOOL)isEqual:(id)a3;
- (HMSettingConstraint)init;
- (HMSettingConstraint)initWithCoder:(id)a3;
- (HMSettingConstraint)initWithType:(int64_t)a3 value:(id)a4;
- (NSCopying)value;
- (NSUUID)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)shortDescription;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation HMSettingConstraint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSCopying)value
{
  return (NSCopying *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)type
{
  return self->_type;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMSettingConstraint)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.type"];
  v6 = [(id)objc_opt_class() supportedValueClasses];
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"HM.value"];

  v8 = -[HMSettingConstraint initWithType:value:](self, "initWithType:value:", [v5 integerValue], v7);
  if (v8 && [v4 containsValueForKey:@"HM.identifier"])
  {
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v9;
  }
  return v8;
}

- (id)description
{
  return [(HMSettingConstraint *)self descriptionWithPointer:0];
}

- (id)debugDescription
{
  return [(HMSettingConstraint *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = NSString;
  v6 = [(id)objc_opt_class() shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1EEE9DD88;
  }
  v8 = [(HMSettingConstraint *)self identifier];
  uint64_t v9 = [v8 UUIDString];
  unint64_t v10 = [(HMSettingConstraint *)self type] - 1;
  if (v10 > 3) {
    v11 = @"Unknown";
  }
  else {
    v11 = off_1E5943BD8[v10];
  }
  v12 = [(HMSettingConstraint *)self value];
  v13 = [v5 stringWithFormat:@"<%@%@, Identifier = %@, Type = %@, Value = %@>", v6, v7, v9, v11, v12];

  if (v3) {

  }
  return v13;
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(HMSettingConstraint *)self identifier];
  v6 = [v5 UUIDString];
  v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMSettingConstraint *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6 && (int64_t v7 = [(HMSettingConstraint *)self type], v7 == [(HMSettingConstraint *)v6 type]))
    {
      v8 = [(HMSettingConstraint *)self value];
      uint64_t v9 = [(HMSettingConstraint *)v6 value];
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
  BOOL v3 = [(HMSettingConstraint *)self value];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(HMSettingConstraint *)self type] ^ v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[HMSettingConstraint allocWithZone:a3];
  int64_t v5 = [(HMSettingConstraint *)self type];
  v6 = [(HMSettingConstraint *)self value];
  int64_t v7 = (void *)[v6 copy];
  v8 = [(HMSettingConstraint *)v4 initWithType:v5 value:v7];

  return v8;
}

- (HMSettingConstraint)initWithType:(int64_t)a3 value:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMSettingConstraint;
  int64_t v7 = [(HMSettingConstraint *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v8;

    v7->_type = a3;
    uint64_t v10 = [v6 copy];
    value = v7->_value;
    v7->_value = (NSCopying *)v10;
  }
  return v7;
}

- (HMSettingConstraint)init
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

+ (id)supportedValueClasses
{
  if (supportedValueClasses_onceToken_48901 != -1) {
    dispatch_once(&supportedValueClasses_onceToken_48901, &__block_literal_global_48902);
  }
  v2 = (void *)supportedValueClasses_supportedValueClasses_48903;

  return v2;
}

void __44__HMSettingConstraint_supportedValueClasses__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:3];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  uint64_t v3 = (void *)supportedValueClasses_supportedValueClasses_48903;
  supportedValueClasses_supportedValueClasses_48903 = v2;
}

+ (id)shortDescription
{
  uint64_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end