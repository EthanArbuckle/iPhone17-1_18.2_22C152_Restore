@interface HMCameraActivityZone
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMCameraActivityZone)initWithCoder:(id)a3;
- (HMCameraActivityZone)initWithPoints:(id)a3;
- (NSArray)points;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMCameraActivityZone

- (void).cxx_destruct
{
}

- (NSArray)points
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (HMCameraActivityZone)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"HMC.az.ck.p"];

  if (v8 && (unint64_t)[v8 count] > 2)
  {
    v10 = [(HMCameraActivityZone *)self initWithPoints:v8];
    v13 = v10;
  }
  else
  {
    v9 = (void *)MEMORY[0x19F3A64A0]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded points:%@", buf, 0x16u);
    }
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMCameraActivityZone *)self points];
  [v4 encodeObject:v5 forKey:@"HMC.az.ck.p"];
}

- (unint64_t)hash
{
  v2 = [(HMCameraActivityZone *)self points];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(HMCameraActivityZone *)self points];
    v8 = [v6 points];
    char v9 = [v7 isEqualToArray:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(HMCameraActivityZone *)self points];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@" %@", *(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [v3 appendString:@">"];
  char v9 = (void *)[v3 copy];

  return v9;
}

- (HMCameraActivityZone)initWithPoints:(id)a3
{
  id v4 = a3;
  if (v4 && (uint64_t v5 = v4, (unint64_t)[v4 count] > 2))
  {
    v12.receiver = self;
    v12.super_class = (Class)HMCameraActivityZone;
    uint64_t v6 = [(HMCameraActivityZone *)&v12 init];
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      points = v6->_points;
      v6->_points = (NSArray *)v7;
    }
    return v6;
  }
  else
  {
    v10 = (void *)_HMFPreconditionFailure();
    return (HMCameraActivityZone *)+[HMCameraActivityZone supportsSecureCoding];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end