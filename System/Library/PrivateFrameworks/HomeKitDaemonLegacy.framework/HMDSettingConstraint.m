@interface HMDSettingConstraint
+ (BOOL)supportsSecureCoding;
- (HMDSettingConstraint)initWithCoder:(id)a3;
- (HMDSettingConstraint)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 type:(id)a5 numberValue:(id)a6 dataValue:(id)a7;
- (NSData)dataValue;
- (NSNumber)numberValue;
- (NSNumber)type;
- (NSString)name;
- (NSUUID)identifier;
- (NSUUID)parentIdentifier;
- (id)value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDSettingConstraint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSData)dataValue
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)numberValue
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)type
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMDSettingConstraint)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    v5 = [(HMDSettingConstraint *)self identifier];
    [v4 encodeObject:v5 forKey:*MEMORY[0x1E4F2DF38]];

    uint64_t v6 = [(HMDSettingConstraint *)self type];
    [v4 encodeObject:v6 forKey:*MEMORY[0x1E4F2DF40]];

    v7 = [(HMDSettingConstraint *)self value];
    [v4 encodeObject:v7 forKey:*MEMORY[0x1E4F2DF48]];
  }
  else
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Did not encode setting constraint as transport is not XPC.", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (NSString)name
{
  v3 = [(HMDSettingConstraint *)self type];
  [v3 integerValue];
  id v4 = HMSettingConstraintTypeToString();

  v5 = [(HMDSettingConstraint *)self type];
  uint64_t v6 = [v5 integerValue];

  if (v6 == 4)
  {
    v7 = NSString;
    v8 = [(HMDSettingConstraint *)self value];
    uint64_t v9 = [v7 stringWithFormat:@"%@.%@", v4, v8];

    id v4 = (void *)v9;
  }
  return (NSString *)v4;
}

- (id)value
{
  v3 = [(HMDSettingConstraint *)self type];
  uint64_t v4 = [v3 integerValue];

  if ((unint64_t)(v4 - 1) < 3)
  {
    v5 = [(HMDSettingConstraint *)self numberValue];
LABEL_5:
    uint64_t v6 = v5;
    v7 = (void *)[v5 copy];

    goto LABEL_7;
  }
  if (v4 == 4)
  {
    v5 = [(HMDSettingConstraint *)self dataValue];
    goto LABEL_5;
  }
  v7 = 0;
LABEL_7:
  return v7;
}

- (HMDSettingConstraint)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 type:(id)a5 numberValue:(id)a6 dataValue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HMDSettingConstraint;
  v17 = [(HMDSettingConstraint *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSUUID *)v18;

    uint64_t v20 = [v13 copy];
    parentIdentifier = v17->_parentIdentifier;
    v17->_parentIdentifier = (NSUUID *)v20;

    uint64_t v22 = [v14 copy];
    type = v17->_type;
    v17->_type = (NSNumber *)v22;

    uint64_t v24 = [v15 copy];
    numberValue = v17->_numberValue;
    v17->_numberValue = (NSNumber *)v24;

    uint64_t v26 = [v16 copy];
    dataValue = v17->_dataValue;
    v17->_dataValue = (NSData *)v26;
  }
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end