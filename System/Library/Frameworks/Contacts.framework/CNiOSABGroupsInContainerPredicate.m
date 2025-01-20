@interface CNiOSABGroupsInContainerPredicate
+ (BOOL)supportsSecureCoding;
- (CNiOSABGroupsInContainerPredicate)initWithCoder:(id)a3;
- (CNiOSABGroupsInContainerPredicate)initWithContainerIdentifier:(id)a3;
- (CNiOSABGroupsInContainerPredicate)initWithPredicate:(id)a3;
- (NSString)containerIdentifier;
- (NSString)description;
- (__CFArray)cn_copyGroupsInAddressBook:(void *)a3 error:(__CFError *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABGroupsInContainerPredicate

- (CNiOSABGroupsInContainerPredicate)initWithContainerIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"parentContainer.identifier == %@", v4];
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABGroupsInContainerPredicate;
  v6 = [(CNPredicate *)&v10 initWithPredicate:v5];

  if (v6)
  {
    uint64_t v7 = [v4 copy];
    containerIdentifier = v6->_containerIdentifier;
    v6->_containerIdentifier = (NSString *)v7;
  }
  return v6;
}

- (CNiOSABGroupsInContainerPredicate)initWithPredicate:(id)a3
{
  return [(CNiOSABGroupsInContainerPredicate *)self initWithContainerIdentifier:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABGroupsInContainerPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABGroupsInContainerPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_containerIdentifier"];
    uint64_t v7 = [v6 copy];
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABGroupsInContainerPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_containerIdentifier, @"_containerIdentifier", v5.receiver, v5.super_class);
}

- (__CFArray)cn_copyGroupsInAddressBook:(void *)a3 error:(__CFError *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(CNiOSABGroupsInContainerPredicate *)self containerIdentifier];
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    if (!a4) {
      return 0;
    }
    +[CNErrorFactory errorWithCode:400 userInfo:0];
    v12 = 0;
    *a4 = (__CFError *)objc_claimAutoreleasedReturnValue();
    return v12;
  }
  v9 = [(CNiOSABGroupsInContainerPredicate *)self containerIdentifier];
  v14[0] = v9;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  objc_super v10 = (const void *)ABAddressBookCopySourcesWithUUIDs();

  if (!v10) {
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E4F1D510]);
  }
  if (CFArrayGetCount((CFArrayRef)v10) <= 0)
  {
    CFRelease(v10);
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E4F1D510]);
  }
  ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v10, 0);
  v12 = ABAddressBookCopyArrayOfAllGroupsInSource(a3, ValueAtIndex);
  CFRelease(v10);
  if (!v12) {
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E4F1D510]);
  }
  return v12;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForGroupsInContainerWithIdentifier:]"];
  objc_super v5 = [(CNiOSABGroupsInContainerPredicate *)self containerIdentifier];
  id v6 = (id)[v3 appendName:@"identifier" object:v5];

  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void).cxx_destruct
{
}

@end