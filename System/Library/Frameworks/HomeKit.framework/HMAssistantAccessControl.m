@interface HMAssistantAccessControl
+ (BOOL)isAccessorySupported:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)allowUnauthenticatedRequests;
- (BOOL)areActivityNotificationsEnabledForPersonalRequests;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (HMAssistantAccessControl)initWithCoder:(id)a3;
- (HMAssistantAccessControl)initWithUser:(id)a3;
- (NSArray)accessories;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)shortDescription;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMAssistantAccessControl

- (void).cxx_destruct
{
}

- (BOOL)isEnabled
{
  return *(&self->_enabled + 4);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[HMAssistantAccessControl isEnabled](self, "isEnabled"), @"HM.enabled");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMAssistantAccessControl options](self, "options"), @"HM.options");
  objc_msgSend(v4, "encodeBool:forKey:", -[HMAssistantAccessControl areActivityNotificationsEnabledForPersonalRequests](self, "areActivityNotificationsEnabledForPersonalRequests"), @"HM.activityNotificationsEnabledForPersonalRequests");
}

- (HMAssistantAccessControl)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMAssistantAccessControl;
  v5 = [(HMAccessControl *)&v11 initWithCoder:v4];
  if (v5)
  {
    *(&v5->_enabled + 4) = [v4 decodeBoolForKey:@"HM.enabled"];
    v5->_options = [v4 decodeIntegerForKey:@"HM.options"];
    v5->_activityNotificationsEnabledForPersonalRequests = [v4 decodeBoolForKey:@"HM.activityNotificationsEnabledForPersonalRequests"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v7 = objc_msgSend(v4, "hm_decodeArrayOfConditionalObjects:forKey:", objc_opt_class(), @"HM.accessories");
    uint64_t v8 = [v6 setWithArray:v7];
    accessories = v5->_accessories;
    v5->_accessories = (NSSet *)v8;
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = +[HMMutableAssistantAccessControl allocWithZone:](HMMutableAssistantAccessControl, "allocWithZone:");
  v6 = [(HMAccessControl *)self user];
  v7 = [(HMAssistantAccessControl *)v5 initWithUser:v6];

  [(HMMutableAssistantAccessControl *)v7 setEnabled:[(HMAssistantAccessControl *)self isEnabled]];
  [(HMMutableAssistantAccessControl *)v7 setOptions:[(HMAssistantAccessControl *)self options]];
  [(HMMutableAssistantAccessControl *)v7 setActivityNotificationsEnabledForPersonalRequests:[(HMAssistantAccessControl *)self areActivityNotificationsEnabledForPersonalRequests]];
  uint64_t v8 = [(HMAssistantAccessControl *)self accessories];
  v9 = (void *)[v8 copyWithZone:a3];
  [(HMMutableAssistantAccessControl *)v7 setAccessories:v9];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)isAccessorySupported:(id)a3
{
  id v3 = a3;
  id v4 = [v3 category];
  v5 = [v4 categoryType];
  char v6 = [v5 isEqualToString:@"1D8FD40E-7CAE-4AD5-9973-977D18890DE2"];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v8 = [v3 siriEndpointProfile];
    BOOL v7 = v8 != 0;
  }
  return v7;
}

- (NSArray)accessories
{
  return [(NSSet *)self->_accessories allObjects];
}

- (BOOL)allowUnauthenticatedRequests
{
  return [(HMAssistantAccessControl *)self options] & 1;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)areActivityNotificationsEnabledForPersonalRequests
{
  return self->_activityNotificationsEnabledForPersonalRequests;
}

- (id)description
{
  return [(HMAssistantAccessControl *)self descriptionWithPointer:0];
}

- (id)debugDescription
{
  return [(HMAssistantAccessControl *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = NSString;
  char v6 = [(id)objc_opt_class() shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    BOOL v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v7 = &stru_1EEE9DD88;
  }
  [(HMAssistantAccessControl *)self isEnabled];
  uint64_t v8 = HMFBooleanToString();
  v9 = HMAssistantAccessControlOptionsToString([(HMAssistantAccessControl *)self options]);
  [(HMAssistantAccessControl *)self areActivityNotificationsEnabledForPersonalRequests];
  v10 = HMFBooleanToString();
  objc_super v11 = [(HMAssistantAccessControl *)self accessories];
  if ([v11 count])
  {
    v12 = [(HMAssistantAccessControl *)self accessories];
    v13 = [v5 stringWithFormat:@"<%@%@, Enabled = %@, Options = %@, Activity Notifications Enabled For Personal Requests = %@, Accessories = %@>", v6, v7, v8, v9, v10, v12];
  }
  else
  {
    v13 = [v5 stringWithFormat:@"<%@%@, Enabled = %@, Options = %@, Activity Notifications Enabled For Personal Requests = %@, Accessories = %@>", v6, v7, v8, v9, v10, @"None"];
  }

  if (v3) {

  }
  return v13;
}

- (id)shortDescription
{
  v2 = objc_opt_class();

  return (id)[v2 shortDescription];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMAssistantAccessControl *)a3;
  if (self == v4)
  {
    char v33 = 1;
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)HMAssistantAccessControl;
    if ([(HMAccessControl *)&v35 isEqual:v4])
    {
      v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v6 = v5;
      }
      else {
        char v6 = 0;
      }
      BOOL v7 = v6;

      if (!v7) {
        goto LABEL_17;
      }
      BOOL v8 = [(HMAssistantAccessControl *)self isEnabled];
      if (v8 != [(HMAssistantAccessControl *)v7 isEnabled]) {
        goto LABEL_17;
      }
      unint64_t v9 = [(HMAssistantAccessControl *)self options];
      if (v9 != [(HMAssistantAccessControl *)v7 options]) {
        goto LABEL_17;
      }
      BOOL v10 = [(HMAssistantAccessControl *)self areActivityNotificationsEnabledForPersonalRequests];
      if (v10 != [(HMAssistantAccessControl *)v7 areActivityNotificationsEnabledForPersonalRequests])goto LABEL_17; {
      objc_super v11 = [(HMAssistantAccessControl *)self accessories];
      }
      uint64_t v12 = [v11 count];
      v13 = [(HMAssistantAccessControl *)v7 accessories];
      uint64_t v14 = [v13 count];

      if (v12 == v14)
      {
        v15 = (void *)MEMORY[0x19F3A64A0]();
        v16 = (void *)MEMORY[0x1E4F1CA80];
        v17 = [(HMAssistantAccessControl *)self accessories];
        v18 = objc_msgSend(v16, "setWithCapacity:", objc_msgSend(v17, "count"));

        v19 = (void *)MEMORY[0x1E4F1CA80];
        v20 = [(HMAssistantAccessControl *)v7 accessories];
        v21 = objc_msgSend(v19, "setWithCapacity:", objc_msgSend(v20, "count"));

        v22 = [(HMAssistantAccessControl *)self accessories];
        uint64_t v23 = [v22 count];

        if (v23)
        {
          unint64_t v24 = 0;
          do
          {
            v25 = [(HMAssistantAccessControl *)self accessories];
            v26 = [v25 objectAtIndexedSubscript:v24];
            v27 = [v26 uuid];
            [v18 addObject:v27];

            v28 = [(HMAssistantAccessControl *)v7 accessories];
            v29 = [v28 objectAtIndexedSubscript:v24];
            v30 = [v29 uuid];
            [v21 addObject:v30];

            ++v24;
            v31 = [(HMAssistantAccessControl *)self accessories];
            unint64_t v32 = [v31 count];
          }
          while (v24 < v32);
        }
        char v33 = [v18 isEqualToSet:v21];
      }
      else
      {
LABEL_17:
        char v33 = 0;
      }
    }
    else
    {
      char v33 = 0;
    }
  }

  return v33;
}

- (HMAssistantAccessControl)initWithUser:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMAssistantAccessControl;
  BOOL v3 = [(HMAccessControl *)&v7 initWithUser:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] set];
    accessories = v3->_accessories;
    v3->_accessories = (NSSet *)v4;
  }
  return v3;
}

@end