@interface HMMCoreDataHomeGroup
+ (id)fetchRequest;
- (id)groupSpecifier;
@end

@implementation HMMCoreDataHomeGroup

- (id)groupSpecifier
{
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3B8];
    v12 = NSString;
    v13 = NSStringFromSelector(a2);
    v14 = [v12 stringWithFormat:@"You must override %@ in a subclass", v13];
    id v15 = [v10 exceptionWithName:v11 reason:v14 userInfo:0];

    objc_exception_throw(v15);
  }
  v5 = [HMMHomeGroupSpecifier alloc];
  v6 = [(HMMCoreDataHomeGroup *)self homeUUID];
  v7 = [(HMMCoreDataHomeGroup *)self name];
  v8 = [(HMMHomeGroupSpecifier *)v5 initWithHomeUUID:v6 groupName:v7];

  return v8;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"HomeGroup"];
}

@end