@interface HMDRemoteDeviceMessageDestination
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMDDevice)device;
- (HMDDeviceHandle)preferredHandle;
- (HMDRemoteDeviceMessageDestination)initWithTarget:(id)a3;
- (HMDRemoteDeviceMessageDestination)initWithTarget:(id)a3 device:(id)a4;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)privateDescription;
- (id)remoteDestinationString;
- (id)shortDescription;
- (unint64_t)hash;
- (void)setPreferredHandle:(id)a3;
@end

@implementation HMDRemoteDeviceMessageDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredHandle, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)setPreferredHandle:(id)a3
{
}

- (HMDDeviceHandle)preferredHandle
{
  return self->_preferredHandle;
}

- (HMDDevice)device
{
  return self->_device;
}

- (id)remoteDestinationString
{
  uint64_t v3 = [(HMDRemoteDeviceMessageDestination *)self preferredHandle];
  if (!v3) {
    goto LABEL_4;
  }
  v4 = (void *)v3;
  v5 = [(HMDRemoteDeviceMessageDestination *)self device];
  v6 = [v5 handles];
  v7 = [(HMDRemoteDeviceMessageDestination *)self preferredHandle];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    v9 = [(HMDRemoteDeviceMessageDestination *)self preferredHandle];
    uint64_t v10 = [v9 destination];
  }
  else
  {
LABEL_4:
    v9 = [(HMDRemoteDeviceMessageDestination *)self device];
    uint64_t v10 = [v9 remoteDestinationString];
  }
  v11 = (void *)v10;

  if (!v11 || ([v11 hasSuffix:@"inbox.appleid.apple.com"] & 1) != 0)
  {
    v12 = [(HMDRemoteDeviceMessageDestination *)self device];
    v13 = [v12 account];
    int v14 = [v13 isCurrentAccount];

    if (!v14) {
      goto LABEL_10;
    }
    v15 = [(HMDRemoteDeviceMessageDestination *)self device];
    v16 = [v15 localHandles];
    v17 = [v16 firstObject];

    if (v17)
    {
      v18 = v17;
    }
    else
    {
LABEL_10:
      uint64_t v19 = [(HMDRemoteDeviceMessageDestination *)self preferredHandle];
      if (!v19) {
        goto LABEL_14;
      }
      v20 = (void *)v19;
      v21 = [(HMDRemoteDeviceMessageDestination *)self device];
      v22 = [v21 handles];
      v23 = [(HMDRemoteDeviceMessageDestination *)self preferredHandle];
      int v24 = [v22 containsObject:v23];

      if (!v24)
      {
LABEL_14:
        v17 = [(HMDRemoteDeviceMessageDestination *)self device];
        uint64_t v25 = [v17 remoteDestinationString];
        goto LABEL_15;
      }
      v18 = [(HMDRemoteDeviceMessageDestination *)self preferredHandle];
      v17 = v18;
    }
    uint64_t v25 = [v18 destination];
LABEL_15:
    id v26 = (id)v25;

    goto LABEL_17;
  }
  id v26 = v11;
LABEL_17:

  return v26;
}

- (id)privateDescription
{
  return [(HMDRemoteDeviceMessageDestination *)self descriptionWithPointer:0];
}

- (id)description
{
  return [(HMDRemoteDeviceMessageDestination *)self descriptionWithPointer:0];
}

- (id)debugDescription
{
  return [(HMDRemoteDeviceMessageDestination *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = shouldLogPrivateInformation();
  v6 = [(HMDRemoteDeviceMessageDestination *)self device];
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    uint64_t v8 = [v6 privateDescription];

    v7 = (void *)v8;
  }
  v9 = NSString;
  uint64_t v10 = [(id)objc_opt_class() shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_26E2EB898;
  }
  v12 = [(HMFMessageDestination *)self target];
  v13 = [v12 UUIDString];
  int v14 = [v9 stringWithFormat:@"<%@%@, Target = %@, Device %@>", v10, v11, v13, v7];

  if (v3) {
  return v14;
  }
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  v4 = [(id)objc_opt_class() shortDescription];
  char v5 = [(HMFMessageDestination *)self target];
  v6 = [v5 UUIDString];
  v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDRemoteDeviceMessageDestination *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(HMFMessageDestination *)self target],
          char v5 = objc_claimAutoreleasedReturnValue(),
          [(HMFMessageDestination *)v4 target],
          v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v5 isEqual:v6],
          v6,
          v5,
          v7))
    {
      uint64_t v8 = [(HMDRemoteDeviceMessageDestination *)self device];
      v9 = [(HMDRemoteDeviceMessageDestination *)v4 device];
      char v10 = [v8 isEqual:v9];
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
  BOOL v3 = [(HMFMessageDestination *)self target];
  uint64_t v4 = [v3 hash];
  char v5 = [(HMDRemoteDeviceMessageDestination *)self device];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (HMDRemoteDeviceMessageDestination)initWithTarget:(id)a3 device:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDRemoteDeviceMessageDestination;
  uint64_t v8 = [(HMFMessageDestination *)&v11 initWithTarget:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_device, a4);
  }

  return v9;
}

- (HMDRemoteDeviceMessageDestination)initWithTarget:(id)a3
{
  id v4 = a3;
  char v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  uint64_t v8 = NSStringFromSelector(a2);
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