@interface HMDHomeUpgradedToROAR
+ (id)defaultModelForHome:(id)a3;
+ (id)modelIDForHome:(id)a3;
+ (id)properties;
@end

@implementation HMDHomeUpgradedToROAR

+ (id)properties
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)defaultModelForHome:(id)a3
{
  id v4 = a3;
  v5 = [HMDHomeUpgradedToROAR alloc];
  v6 = [a1 modelIDForHome:v4];
  v7 = [v4 uuid];

  v8 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:1 uuid:v6 parentUUID:v7];
  return v8;
}

+ (id)modelIDForHome:(id)a3
{
  id v3 = a3;
  id v4 = [@"HMDROARModelUUIDSalt" dataUsingEncoding:4];
  v5 = (void *)MEMORY[0x1E4F29128];
  v6 = [v3 uuid];

  v7 = objc_msgSend(v5, "hmf_UUIDWithNamespace:data:", v6, v4);

  return v7;
}

@end