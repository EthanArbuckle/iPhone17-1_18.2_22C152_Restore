@interface CNiOSABContainerOfGroupPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)includesDisabledContainers;
- (CNiOSABContainerOfGroupPredicate)initWithCoder:(id)a3;
- (CNiOSABContainerOfGroupPredicate)initWithGroupIdentifier:(id)a3;
- (CNiOSABContainerOfGroupPredicate)initWithPredicate:(id)a3;
- (NSString)description;
- (NSString)groupIdentifier;
- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABContainerOfGroupPredicate

- (CNiOSABContainerOfGroupPredicate)initWithPredicate:(id)a3
{
  return [(CNiOSABContainerOfGroupPredicate *)self initWithGroupIdentifier:0];
}

- (CNiOSABContainerOfGroupPredicate)initWithGroupIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY groups.identifier == %@", v4];
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABContainerOfGroupPredicate;
  v6 = [(CNPredicate *)&v10 initWithPredicate:v5];

  if (v6)
  {
    uint64_t v7 = [v4 copy];
    groupIdentifier = v6->_groupIdentifier;
    v6->_groupIdentifier = (NSString *)v7;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContainerOfGroupPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABContainerOfGroupPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_groupIdentifier"];
    uint64_t v7 = [v6 copy];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContainerOfGroupPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_groupIdentifier, @"_groupIdentifier", v5.receiver, v5.super_class);
}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  v6 = [(CNiOSABContainerOfGroupPredicate *)self groupIdentifier];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    v8 = [(CNiOSABContainerOfGroupPredicate *)self groupIdentifier];

    values = v8;
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFArrayRef v10 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&values, 1, MEMORY[0x1E4F1D510]);
    CFArrayRef v11 = (const __CFArray *)ABAddressBookCopyGroupsWithUUIDs();
    if (!v11)
    {
      v14 = 0;
      if (!v10) {
        return v14;
      }
      goto LABEL_14;
    }
    CFArrayRef v12 = v11;
    if (CFArrayGetCount(v11) == 1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v12, 0);
      CFTypeRef cf = ABGroupCopySource(ValueAtIndex);
      if (cf)
      {
        v14 = CFArrayCreate(v9, &cf, 1, MEMORY[0x1E4F1D510]);
        CFRelease(cf);
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = CFArrayCreate(v9, 0, 0, MEMORY[0x1E4F1D510]);
    }
    CFRelease(v12);
    if (v10) {
LABEL_14:
    }
      CFRelease(v10);
  }
  else if (a4)
  {
    +[CNErrorFactory errorWithCode:400 userInfo:0];
    v14 = 0;
    *a4 = (__CFError *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v14;
}

- (BOOL)includesDisabledContainers
{
  return 0;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContainer predicateForContainerOfGroupWithIdentifier:]"];
  objc_super v5 = [(CNiOSABContainerOfGroupPredicate *)self groupIdentifier];
  id v6 = (id)[v3 appendName:@"identifier" object:v5];

  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void).cxx_destruct
{
}

@end