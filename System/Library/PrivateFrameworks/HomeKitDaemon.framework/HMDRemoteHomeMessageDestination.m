@interface HMDRemoteHomeMessageDestination
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMDRemoteHomeMessageDestination)initWithTarget:(id)a3;
- (HMDRemoteHomeMessageDestination)initWithTarget:(id)a3 homeUUID:(id)a4;
- (HMDRemoteHomeMessageDestination)initWithTarget:(id)a3 homeUUID:(id)a4 queueTimeout:(id)a5;
- (NSNumber)queueTimeout;
- (NSUUID)homeUUID;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)privateDescription;
- (id)shortDescription;
- (unint64_t)hash;
@end

@implementation HMDRemoteHomeMessageDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueTimeout, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

- (NSNumber)queueTimeout
{
  return self->_queueTimeout;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (id)privateDescription
{
  return [(HMDRemoteHomeMessageDestination *)self descriptionWithPointer:0];
}

- (id)description
{
  return [(HMDRemoteHomeMessageDestination *)self descriptionWithPointer:0];
}

- (id)debugDescription
{
  return [(HMDRemoteHomeMessageDestination *)self descriptionWithPointer:1];
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
    v7 = &stru_26E2EB898;
  }
  v8 = [(HMFMessageDestination *)self target];
  v9 = [v8 UUIDString];
  v10 = [(HMDRemoteHomeMessageDestination *)self homeUUID];
  v11 = [v10 UUIDString];
  v12 = [(HMDRemoteHomeMessageDestination *)self queueTimeout];
  v13 = [v5 stringWithFormat:@"<%@%@, Target = %@, Home UUID = %@, Queue Timeout = %@>", v6, v7, v9, v11, v12];

  if (v3) {
  return v13;
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
  v4 = (HMDRemoteHomeMessageDestination *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HMFMessageDestination *)self target];
      v7 = [(HMFMessageDestination *)v5 target];
      int v8 = [v6 isEqual:v7];

      if (v8
        && ([(HMDRemoteHomeMessageDestination *)self homeUUID],
            v9 = objc_claimAutoreleasedReturnValue(),
            [(HMDRemoteHomeMessageDestination *)v5 homeUUID],
            v10 = objc_claimAutoreleasedReturnValue(),
            int v11 = [v9 isEqual:v10],
            v10,
            v9,
            v11))
      {
        v12 = [(HMDRemoteHomeMessageDestination *)self queueTimeout];
        v13 = [(HMDRemoteHomeMessageDestination *)v5 queueTimeout];
        char v14 = HMFEqualObjects();
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  BOOL v3 = [(HMFMessageDestination *)self target];
  uint64_t v4 = [v3 hash];
  v5 = [(HMDRemoteHomeMessageDestination *)self homeUUID];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(HMDRemoteHomeMessageDestination *)self queueTimeout];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (HMDRemoteHomeMessageDestination)initWithTarget:(id)a3 homeUUID:(id)a4 queueTimeout:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDRemoteHomeMessageDestination;
  int v11 = [(HMFMessageDestination *)&v14 initWithTarget:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_homeUUID, a4);
    objc_storeStrong((id *)&v12->_queueTimeout, a5);
  }

  return v12;
}

- (HMDRemoteHomeMessageDestination)initWithTarget:(id)a3 homeUUID:(id)a4
{
  return [(HMDRemoteHomeMessageDestination *)self initWithTarget:a3 homeUUID:a4 queueTimeout:0];
}

- (HMDRemoteHomeMessageDestination)initWithTarget:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = NSString;
  unint64_t v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end