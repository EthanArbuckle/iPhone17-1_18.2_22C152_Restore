@interface CNiOSABContainerExternalIdentifierPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)includesDisabledContainers;
- (CNiOSABContainerExternalIdentifierPredicate)initWithCoder:(id)a3;
- (CNiOSABContainerExternalIdentifierPredicate)initWithExternalIdentifier:(id)a3;
- (NSString)description;
- (NSString)externalIdentifier;
- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABContainerExternalIdentifierPredicate

- (CNiOSABContainerExternalIdentifierPredicate)initWithExternalIdentifier:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"externalIdentifier == %@", v5];
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABContainerExternalIdentifierPredicate;
  v7 = [(CNPredicate *)&v11 initWithPredicate:v6];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_externalIdentifier, a3);
    v9 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContainerExternalIdentifierPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABContainerExternalIdentifierPredicate;
  id v5 = [(CNPredicate *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalIdentifier"];
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContainerExternalIdentifierPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_externalIdentifier, @"externalIdentifier", v5.receiver, v5.super_class);
}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  uint64_t v6 = *MEMORY[0x1E4F5A2A0];
  v7 = [(CNiOSABContainerExternalIdentifierPredicate *)self externalIdentifier];
  LODWORD(v6) = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  if (v6)
  {
    v8 = [(CNiOSABContainerExternalIdentifierPredicate *)self externalIdentifier];
    uint64_t v9 = ABAddressBookCopySourceWithAccountAndExternalIdentifiers();

    uint64_t v16 = v9;
    if (v9)
    {
      CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      objc_super v11 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
      v12 = (const void **)&v16;
      CFIndex v13 = 1;
    }
    else
    {
      objc_super v11 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
      CFAllocatorRef v10 = 0;
      v12 = 0;
      CFIndex v13 = 0;
    }
    return CFArrayCreate(v10, v12, v13, v11);
  }
  else if (a4)
  {
    v14 = +[CNErrorFactory errorWithCode:400 userInfo:0];
    result = 0;
    *a4 = v14;
  }
  else
  {
    return 0;
  }
  return result;
}

- (BOOL)includesDisabledContainers
{
  return 0;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContainer predicateForContainerWithExternalIdentifier:]"];
  objc_super v5 = [(CNiOSABContainerExternalIdentifierPredicate *)self externalIdentifier];
  id v6 = (id)[v3 appendObject:v5 withName:@"externalIdentifier"];

  v7 = [v3 build];

  return (NSString *)v7;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void).cxx_destruct
{
}

@end