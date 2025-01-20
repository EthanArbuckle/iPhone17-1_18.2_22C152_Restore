@interface HMDRemoteAccountMessageDestination
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMulticast;
- (BOOL)restrictToResidentCapable;
- (HMDAccountHandle)handle;
- (HMDRemoteAccountMessageDestination)initWithTarget:(id)a3;
- (HMDRemoteAccountMessageDestination)initWithTarget:(id)a3 handle:(id)a4 multicast:(BOOL)a5;
- (HMDRemoteAccountMessageDestination)initWithTarget:(id)a3 handle:(id)a4 multicast:(BOOL)a5 deviceCapabilities:(id)a6;
- (NSDictionary)deviceCapabilities;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)privateDescription;
- (id)remoteDestinationString;
- (id)shortDescription;
- (unint64_t)hash;
- (void)setRestrictToResidentCapable:(BOOL)a3;
@end

@implementation HMDRemoteAccountMessageDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCapabilities, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

- (NSDictionary)deviceCapabilities
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRestrictToResidentCapable:(BOOL)a3
{
  self->_restrictToResidentCapable = a3;
}

- (BOOL)restrictToResidentCapable
{
  return self->_restrictToResidentCapable;
}

- (BOOL)isMulticast
{
  return self->_multicast;
}

- (HMDAccountHandle)handle
{
  return (HMDAccountHandle *)objc_getProperty(self, a2, 24, 1);
}

- (id)remoteDestinationString
{
  v2 = [(HMDRemoteAccountMessageDestination *)self handle];
  v3 = [v2 remoteDestinationString];

  return v3;
}

- (id)privateDescription
{
  return [(HMDRemoteAccountMessageDestination *)self descriptionWithPointer:0];
}

- (id)description
{
  return [(HMDRemoteAccountMessageDestination *)self descriptionWithPointer:0];
}

- (id)debugDescription
{
  return [(HMDRemoteAccountMessageDestination *)self descriptionWithPointer:1];
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
    v7 = &stru_1F2C9F1A8;
  }
  v8 = [(HMFMessageDestination *)self target];
  v9 = [v8 UUIDString];
  v10 = [(HMDRemoteAccountMessageDestination *)self handle];
  v11 = [v10 shortDescription];
  [(HMDRemoteAccountMessageDestination *)self isMulticast];
  v12 = HMFBooleanToString();
  v13 = [(HMDRemoteAccountMessageDestination *)self deviceCapabilities];
  v14 = [v5 stringWithFormat:@"<%@%@, Target = %@, Handle = %@, Multicast = %@, Device Capabilities = %@>", v6, v7, v9, v11, v12, v13];

  if (v3) {
  return v14;
  }
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(HMFMessageDestination *)self target];
  v6 = [v5 UUIDString];
  v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDRemoteAccountMessageDestination *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HMDRemoteAccountMessageDestination;
    if ([(HMFMessageDestination *)&v16 isEqual:v4])
    {
      v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
      v7 = v6;

      if (!v7) {
        goto LABEL_9;
      }
      v8 = [(HMDRemoteAccountMessageDestination *)self handle];
      v9 = [(HMDRemoteAccountMessageDestination *)v7 handle];
      int v10 = [v8 isEqual:v9];

      if (!v10) {
        goto LABEL_9;
      }
      BOOL v11 = [(HMDRemoteAccountMessageDestination *)self isMulticast];
      if (v11 == [(HMDRemoteAccountMessageDestination *)v7 isMulticast])
      {
        v14 = [(HMDRemoteAccountMessageDestination *)self deviceCapabilities];
        v15 = [(HMDRemoteAccountMessageDestination *)v7 deviceCapabilities];
        char v12 = HMFEqualObjects();
      }
      else
      {
LABEL_9:
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  BOOL v3 = [(HMFMessageDestination *)self target];
  uint64_t v4 = [v3 hash];
  v5 = [(HMDRemoteAccountMessageDestination *)self handle];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (HMDRemoteAccountMessageDestination)initWithTarget:(id)a3 handle:(id)a4 multicast:(BOOL)a5 deviceCapabilities:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v11)
  {
LABEL_7:
    v20 = (HMDRemoteAccountMessageDestination *)_HMFPreconditionFailure();
    return [(HMDRemoteAccountMessageDestination *)v20 initWithTarget:v22 handle:v23 multicast:v24];
  }
  v13 = v12;
  v25.receiver = self;
  v25.super_class = (Class)HMDRemoteAccountMessageDestination;
  v14 = [(HMFMessageDestination *)&v25 initWithTarget:v10];
  if (v14)
  {
    uint64_t v15 = [v11 copy];
    handle = v14->_handle;
    v14->_handle = (HMDAccountHandle *)v15;

    v14->_multicast = a5;
    uint64_t v17 = [v13 copy];
    deviceCapabilities = v14->_deviceCapabilities;
    v14->_deviceCapabilities = (NSDictionary *)v17;
  }
  return v14;
}

- (HMDRemoteAccountMessageDestination)initWithTarget:(id)a3 handle:(id)a4 multicast:(BOOL)a5
{
  return [(HMDRemoteAccountMessageDestination *)self initWithTarget:a3 handle:a4 multicast:a5 deviceCapabilities:0];
}

- (HMDRemoteAccountMessageDestination)initWithTarget:(id)a3
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

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end