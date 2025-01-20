@interface HMFMessageDestination
+ (BOOL)supportsSecureCoding;
+ (HMFMessageDestination)allMessageDestinations;
+ (id)allMessageTargets;
- (BOOL)isEqual:(id)a3;
- (HMFMessageDestination)initWithCoder:(id)a3;
- (HMFMessageDestination)initWithTarget:(id)a3;
- (NSArray)attributeDescriptions;
- (NSString)shortDescription;
- (NSUUID)target;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMFMessageDestination

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessageDestination *)self target];
  [v4 encodeObject:v5 forKey:@"HMF.target"];
}

+ (HMFMessageDestination)allMessageDestinations
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[HMFMessageDestination allMessageTargets];
  id v4 = (void *)[v2 initWithTarget:v3];

  return (HMFMessageDestination *)v4;
}

- (HMFMessageDestination)initWithTarget:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMFMessageDestination;
  v6 = [(HMFMessageDestination *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_target, a3);
  }

  return v7;
}

+ (id)allMessageTargets
{
  return (id)objc_msgSend(MEMORY[0x1E4F29128], "hmf_zeroUUID");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMFMessageDestination *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(HMFMessageDestination *)self target];
      v6 = [(HMFMessageDestination *)v4 target];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSUUID)target
{
  return self->_target;
}

- (HMFMessageDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMF.target"];
  if (v5)
  {
    self = [(HMFMessageDestination *)self initWithTarget:v5];
    v6 = self;
  }
  else
  {
    char v7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11 reason:@"HMFMessageDestination.target is required"];
    [v4 failWithError:v7];

    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  id v2 = [(HMFMessageDestination *)self target];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)shortDescription
{
  unint64_t v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMFMessageDestination *)self target];
  v6 = [v5 UUIDString];
  char v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return (NSString *)v7;
}

- (NSArray)attributeDescriptions
{
  v9[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [HMFAttributeDescription alloc];
  id v4 = [(HMFMessageDestination *)self target];
  id v5 = [v4 UUIDString];
  v6 = [(HMFAttributeDescription *)v3 initWithName:@"Target" value:v5];
  v9[0] = v6;
  char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return (NSArray *)v7;
}

@end