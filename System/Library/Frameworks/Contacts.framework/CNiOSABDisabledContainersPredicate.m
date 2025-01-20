@interface CNiOSABDisabledContainersPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)includesDisabledContainers;
- (CNiOSABDisabledContainersPredicate)initWithCoder:(id)a3;
- (CNiOSABDisabledContainersPredicate)initWithDisabledContainersIncluded:(BOOL)a3;
- (CNiOSABDisabledContainersPredicate)initWithPredicate:(id)a3;
- (NSString)description;
- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABDisabledContainersPredicate

- (CNiOSABDisabledContainersPredicate)initWithPredicate:(id)a3
{
  return [(CNiOSABDisabledContainersPredicate *)self initWithDisabledContainersIncluded:0];
}

- (CNiOSABDisabledContainersPredicate)initWithDisabledContainersIncluded:(BOOL)a3
{
  if (a3)
  {
    [@"enabled == YES" stringByAppendingString:@" || enabled == NO"];
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = @"enabled == YES";
  }
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:v5];
  v9.receiver = self;
  v9.super_class = (Class)CNiOSABDisabledContainersPredicate;
  v7 = [(CNPredicate *)&v9 initWithPredicate:v6];

  if (v7) {
    v7->_includesDisabledContainers = a3;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABDisabledContainersPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABDisabledContainersPredicate;
  v5 = [(CNPredicate *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_includesDisabledContainers = [v4 decodeBoolForKey:@"_includesDisabledContainers"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABDisabledContainersPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_includesDisabledContainers, @"_includesDisabledContainers", v5.receiver, v5.super_class);
}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  [(CNiOSABDisabledContainersPredicate *)self includesDisabledContainers];

  return (__CFArray *)ABAddressBookCopyArrayOfAllSourcesIncludingDisabledSources();
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContainer predicateForContainersIncludingDisabled:]"];
  objc_super v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CNiOSABDisabledContainersPredicate includesDisabledContainers](self, "includesDisabledContainers"));
  id v6 = (id)[v3 appendName:@"includingDisabled" object:v5];

  v7 = [v3 build];

  return (NSString *)v7;
}

- (BOOL)includesDisabledContainers
{
  return self->_includesDisabledContainers;
}

@end