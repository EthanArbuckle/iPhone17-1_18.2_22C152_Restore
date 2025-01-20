@interface HMMCoreDataAccessoryGroup
+ (id)fetchRequest;
- (id)groupSpecifier;
@end

@implementation HMMCoreDataAccessoryGroup

- (id)groupSpecifier
{
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    v13 = NSString;
    v14 = NSStringFromSelector(a2);
    v15 = [v13 stringWithFormat:@"You must override %@ in a subclass", v14];
    id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

    objc_exception_throw(v16);
  }
  v5 = [HMMAccessoryGroupSpecifier alloc];
  v6 = [(HMMCoreDataAccessoryGroup *)self accessoryUUID];
  v7 = [(HMMCoreDataAccessoryGroup *)self homeUUID];
  v8 = [(HMMCoreDataAccessoryGroup *)self name];
  v9 = [(HMMAccessoryGroupSpecifier *)v5 initWithAccessoryUUID:v6 homeUUID:v7 groupName:v8];

  return v9;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"AccessoryGroup"];
}

@end