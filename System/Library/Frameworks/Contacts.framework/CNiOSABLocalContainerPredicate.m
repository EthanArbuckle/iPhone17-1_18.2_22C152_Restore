@interface CNiOSABLocalContainerPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)includesDisabledContainer;
- (CNiOSABLocalContainerPredicate)init;
- (CNiOSABLocalContainerPredicate)initWithCoder:(id)a3;
- (CNiOSABLocalContainerPredicate)initWithDisabledContainerIncluded:(BOOL)a3;
- (NSString)description;
- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABLocalContainerPredicate

- (CNiOSABLocalContainerPredicate)init
{
  return [(CNiOSABLocalContainerPredicate *)self initWithDisabledContainerIncluded:0];
}

- (CNiOSABLocalContainerPredicate)initWithDisabledContainerIncluded:(BOOL)a3
{
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"type == %@", &unk_1EE089458];
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABLocalContainerPredicate;
  v6 = [(CNPredicate *)&v10 initWithPredicate:v5];
  v7 = v6;
  if (v6)
  {
    v6->_includesDisabledContainer = a3;
    v8 = v6;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABLocalContainerPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABLocalContainerPredicate;
  v5 = [(CNPredicate *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_includesDisabledContainer = [v4 decodeBoolForKey:@"_includesDisabledContainer"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABLocalContainerPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_includesDisabledContainer, @"_includesDisabledContainer", v5.receiver, v5.super_class);
}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  values = (void *)ABAddressBookCopyLocalSource();
  if (!values) {
    return 0;
  }
  id v4 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&values, 1, MEMORY[0x1E4F1D510]);
  CFRelease(values);
  return v4;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContainer predicateForLocalContainer]"];
  id v5 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"includesDisabledContainers", -[CNiOSABLocalContainerPredicate includesDisabledContainer](self, "includesDisabledContainer"));
  v6 = [v3 build];

  return (NSString *)v6;
}

- (BOOL)includesDisabledContainer
{
  return self->_includesDisabledContainer;
}

@end