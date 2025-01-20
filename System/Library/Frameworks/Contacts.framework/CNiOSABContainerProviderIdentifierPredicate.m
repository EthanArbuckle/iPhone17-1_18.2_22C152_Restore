@interface CNiOSABContainerProviderIdentifierPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)includesDisabledContainers;
- (CNiOSABContainerProviderIdentifierPredicate)initWithCoder:(id)a3;
- (CNiOSABContainerProviderIdentifierPredicate)initWithProviderIdentifier:(id)a3;
- (NSString)description;
- (NSString)providerIdentifier;
- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABContainerProviderIdentifierPredicate

- (CNiOSABContainerProviderIdentifierPredicate)initWithProviderIdentifier:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"providerIdentifier == %@", v5];
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABContainerProviderIdentifierPredicate;
  v7 = [(CNPredicate *)&v11 initWithPredicate:v6];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_providerIdentifier, a3);
    v9 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContainerProviderIdentifierPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABContainerProviderIdentifierPredicate;
  id v5 = [(CNPredicate *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"providerIdentifier"];
    providerIdentifier = v5->_providerIdentifier;
    v5->_providerIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContainerProviderIdentifierPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_providerIdentifier, @"providerIdentifier", v5.receiver, v5.super_class);
}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  uint64_t v6 = *MEMORY[0x1E4F5A2A0];
  v7 = [(CNiOSABContainerProviderIdentifierPredicate *)self providerIdentifier];
  LODWORD(v6) = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  if (v6)
  {
    v8 = [(CNiOSABContainerProviderIdentifierPredicate *)self providerIdentifier];
    uint64_t v9 = ABAddressBookCopySourceWithProviderIdentifier();

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
  return 1;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContainer predicateForContainerWithProviderIdentifier:]"];
  objc_super v5 = [(CNiOSABContainerProviderIdentifierPredicate *)self providerIdentifier];
  id v6 = (id)[v3 appendObject:v5 withName:@"providerIdentifier"];

  v7 = [v3 build];

  return (NSString *)v7;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void).cxx_destruct
{
}

@end