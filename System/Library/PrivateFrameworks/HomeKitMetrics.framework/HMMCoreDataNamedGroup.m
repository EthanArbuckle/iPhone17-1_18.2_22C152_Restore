@interface HMMCoreDataNamedGroup
+ (id)fetchRequest;
- (HMMGroupSpecifier)groupSpecifier;
@end

@implementation HMMCoreDataNamedGroup

- (HMMGroupSpecifier)groupSpecifier
{
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3B8];
    v11 = NSString;
    v12 = NSStringFromSelector(a2);
    v13 = [v11 stringWithFormat:@"You must override %@ in a subclass", v12];
    id v14 = [v9 exceptionWithName:v10 reason:v13 userInfo:0];

    objc_exception_throw(v14);
  }
  v5 = [HMMNamedGroupSpecifier alloc];
  v6 = [(HMMCoreDataNamedGroup *)self name];
  v7 = [(HMMNamedGroupSpecifier *)v5 initWithGroupName:v6];

  return (HMMGroupSpecifier *)v7;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"NamedGroup"];
}

@end