@interface HMDUserManagementOperationTimestamp
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMDDevice)device;
- (HMDUserManagementOperationTimestamp)initWithCoder:(id)a3;
- (HMDUserManagementOperationTimestamp)initWithDevice:(id)a3 state:(unint64_t)a4;
- (NSDate)timestamp;
- (NSNumber)state;
- (id)attributeDescriptions;
- (id)shortDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDUserManagementOperationTimestamp

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (NSNumber)state
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (HMDDevice)device
{
  return (HMDDevice *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDUserManagementOperationTimestamp *)self device];
  [v4 encodeObject:v5 forKey:@"HM.device"];

  v6 = [(HMDUserManagementOperationTimestamp *)self timestamp];
  [v4 encodeObject:v6 forKey:@"HM.date"];

  id v7 = [(HMDUserManagementOperationTimestamp *)self state];
  [v4 encodeObject:v7 forKey:@"HM.state"];
}

- (HMDUserManagementOperationTimestamp)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.device"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.state"];
  id v7 = v6;
  if (v6) {
    uint64_t v8 = [v6 unsignedIntegerValue];
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = [(HMDUserManagementOperationTimestamp *)self initWithDevice:v5 state:v8];
  if (v9)
  {
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.date"];
    if (v10) {
      objc_storeStrong((id *)&v9->_timestamp, v10);
    }
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDUserManagementOperationTimestamp *)a3;
  if (v4 == self)
  {
    char v16 = 1;
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
    id v7 = v6;
    if (!v6) {
      goto LABEL_9;
    }
    uint64_t v8 = [(HMDUserManagementOperationTimestamp *)v6 timestamp];
    v9 = [(HMDUserManagementOperationTimestamp *)self timestamp];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_9;
    }
    v11 = [(HMDUserManagementOperationTimestamp *)v7 state];
    v12 = [(HMDUserManagementOperationTimestamp *)self state];
    int v13 = [v11 isEqual:v12];

    if (v13)
    {
      v14 = [(HMDUserManagementOperationTimestamp *)v7 device];
      v15 = [(HMDUserManagementOperationTimestamp *)self device];
      char v16 = [v14 isEqual:v15];
    }
    else
    {
LABEL_9:
      char v16 = 0;
    }
  }
  return v16;
}

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMDUserManagementOperationTimestamp *)self device];
  v5 = (void *)[v3 initWithName:@"Device" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v7 = [(HMDUserManagementOperationTimestamp *)self timestamp];
  uint64_t v8 = (void *)[v6 initWithName:@"Timestamp" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  int v10 = [(HMDUserManagementOperationTimestamp *)self state];
  v11 = (void *)[v9 initWithName:@"State" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return v12;
}

- (id)shortDescription
{
  id v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(HMDUserManagementOperationTimestamp *)self timestamp];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (HMDUserManagementOperationTimestamp)initWithDevice:(id)a3 state:(unint64_t)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDUserManagementOperationTimestamp;
  uint64_t v8 = [(HMDUserManagementOperationTimestamp *)&v15 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    timestamp = v9->_timestamp;
    v9->_timestamp = (NSDate *)v10;

    uint64_t v12 = [NSNumber numberWithUnsignedInteger:a4];
    state = v9->_state;
    v9->_state = (NSNumber *)v12;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end