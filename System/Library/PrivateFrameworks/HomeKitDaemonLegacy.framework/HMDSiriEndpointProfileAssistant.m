@interface HMDSiriEndpointProfileAssistant
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)containsCharacteristic:(id)a3;
- (BOOL)updateCharacteristic:(id)a3 value:(id)a4;
- (HMDService)service;
- (HMDSiriEndpointProfileAssistant)initWithCoder:(id)a3;
- (HMDSiriEndpointProfileAssistant)initWithService:(id)a3;
- (NSArray)allCharacteristics;
- (NSArray)characteristicsToMonitor;
- (NSNumber)active;
- (NSNumber)identifier;
- (NSString)name;
- (id)_activeCharacteristic;
- (id)_identifierCharacteristic;
- (id)_nameCharacteristic;
- (void)encodeWithCoder:(id)a3;
- (void)setActive:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
@end

@implementation HMDSiriEndpointProfileAssistant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_active, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (HMDService)service
{
  return (HMDService *)objc_getProperty(self, a2, 40, 1);
}

- (HMDSiriEndpointProfileAssistant)initWithCoder:(id)a3
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
  id v4 = a3;
  v5 = [(HMDSiriEndpointProfileAssistant *)self identifier];
  [v4 encodeObject:v5 forKey:*MEMORY[0x1E4F2DF98]];

  uint64_t v6 = [(HMDSiriEndpointProfileAssistant *)self name];
  [v4 encodeObject:v6 forKey:*MEMORY[0x1E4F2DFA0]];

  id v7 = [(HMDSiriEndpointProfileAssistant *)self active];
  [v4 encodeObject:v7 forKey:*MEMORY[0x1E4F2DF90]];
}

- (BOOL)updateCharacteristic:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(HMDSiriEndpointProfileAssistant *)self containsCharacteristic:v6]) {
    goto LABEL_26;
  }
  v8 = [v6 type];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F2CF00]];

  if (v9)
  {
    id v10 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    [(HMDSiriEndpointProfileAssistant *)self setIdentifier:v12];
    goto LABEL_24;
  }
  v13 = [v6 type];
  int v14 = [v13 isEqualToString:*MEMORY[0x1E4F2CF48]];

  if (v14)
  {
    id v15 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v12 = v16;

    [(HMDSiriEndpointProfileAssistant *)self setName:v12];
    goto LABEL_24;
  }
  v17 = [v6 type];
  int v18 = [v17 isEqualToString:*MEMORY[0x1E4F2CE48]];

  if (!v18)
  {
LABEL_26:
    BOOL v25 = 0;
    goto LABEL_27;
  }
  id v19 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  id v12 = v20;

  if (!v12)
  {
    BOOL v25 = 0;
    goto LABEL_25;
  }
  uint64_t v21 = [v12 integerValue];
  if (v21 == 1) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = -1;
  }
  if (v21) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = 0;
  }
  v24 = [NSNumber numberWithInteger:v23];
  [(HMDSiriEndpointProfileAssistant *)self setActive:v24];

LABEL_24:
  BOOL v25 = 1;
LABEL_25:

LABEL_27:
  return v25;
}

- (BOOL)containsCharacteristic:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 service];
    id v7 = [v6 serviceType];
    if ([v7 isEqualToString:@"0000026A-0000-1000-8000-0026BB765291"])
    {
      v8 = [v6 instanceID];
      int v9 = [(HMDSiriEndpointProfileAssistant *)self service];
      id v10 = [v9 instanceID];
      int v11 = [v8 isEqual:v10];

      if (v11)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v12 = [(HMDSiriEndpointProfileAssistant *)self service];
        v13 = [v12 characteristics];

        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v25;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v13);
              }
              int v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              id v19 = [v5 instanceID];
              v20 = [v18 instanceID];
              char v21 = [v19 isEqual:v20];

              if (v21)
              {

                BOOL v22 = 1;
                goto LABEL_16;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
      }
    }
    else
    {
    }
    BOOL v22 = 0;
LABEL_16:
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (NSArray)allCharacteristics
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  id v4 = [(HMDSiriEndpointProfileAssistant *)self _identifierCharacteristic];
  if (v4) {
    [v3 addObject:v4];
  }
  v5 = [(HMDSiriEndpointProfileAssistant *)self _nameCharacteristic];

  if (v5) {
    [v3 addObject:v5];
  }
  id v6 = [(HMDSiriEndpointProfileAssistant *)self _activeCharacteristic];

  if (v6) {
    [v3 addObject:v6];
  }
  id v7 = (void *)[v3 copy];

  return (NSArray *)v7;
}

- (NSArray)characteristicsToMonitor
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  id v4 = [(HMDSiriEndpointProfileAssistant *)self _activeCharacteristic];
  if (v4) {
    [v3 addObject:v4];
  }
  v5 = (void *)[v3 copy];

  return (NSArray *)v5;
}

- (void)setActive:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSNumber *)[v6 copy];
  active = self->_active;
  self->_active = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)active
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_active;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setIdentifier:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSNumber *)[v6 copy];
  identifier = self->_identifier;
  self->_identifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)identifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_identifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_activeCharacteristic
{
  v2 = [(HMDSiriEndpointProfileAssistant *)self service];
  v3 = [v2 findCharacteristicWithType:*MEMORY[0x1E4F2CE48]];

  return v3;
}

- (id)_nameCharacteristic
{
  v2 = [(HMDSiriEndpointProfileAssistant *)self service];
  v3 = [v2 findCharacteristicWithType:*MEMORY[0x1E4F2CF48]];

  return v3;
}

- (id)_identifierCharacteristic
{
  v2 = [(HMDSiriEndpointProfileAssistant *)self service];
  v3 = [v2 findCharacteristicWithType:*MEMORY[0x1E4F2CF00]];

  return v3;
}

- (HMDSiriEndpointProfileAssistant)initWithService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSiriEndpointProfileAssistant;
  id v6 = [(HMDSiriEndpointProfileAssistant *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_service, a3);
  }

  return v7;
}

+ (id)shortDescription
{
  return @"HMDSiriEndpointProfileAssistant";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end