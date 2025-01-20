@interface HMDRemoteMessageDestination
+ (HMDRemoteMessageDestination)allocWithZone:(_NSZone *)a3;
+ (id)allMessageDestinations;
- (id)allRemoteDestinationStrings;
- (id)remoteDestinationString;
@end

@implementation HMDRemoteMessageDestination

- (id)allRemoteDestinationStrings
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(HMDRemoteMessageDestination *)self remoteDestinationString];
  if (v3)
  {
    v4 = [MEMORY[0x263EFF8C0] arrayWithObject:v3];
  }
  else
  {
    v5 = (void *)MEMORY[0x230FBD990]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      v11 = v8;
      __int16 v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@This destination is not addressable: %@", (uint8_t *)&v10, 0x16u);
    }
    v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

- (id)remoteDestinationString
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (HMDRemoteMessageDestination)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    v6 = (void *)_HMFPreconditionFailure();
    +[HMDRemoteMessageDestination allMessageDestinations];
  }
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HMDRemoteMessageDestination;
  return (HMDRemoteMessageDestination *)objc_msgSendSuper2(&v8, sel_allocWithZone_, a3);
}

+ (id)allMessageDestinations
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end