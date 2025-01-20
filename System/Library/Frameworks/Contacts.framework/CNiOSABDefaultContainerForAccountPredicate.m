@interface CNiOSABDefaultContainerForAccountPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)includesDisabledContainers;
- (CNiOSABDefaultContainerForAccountPredicate)initWithAccountIdentifier:(id)a3;
- (CNiOSABDefaultContainerForAccountPredicate)initWithCoder:(id)a3;
- (CNiOSABDefaultContainerForAccountPredicate)initWithPredicate:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABDefaultContainerForAccountPredicate

- (CNiOSABDefaultContainerForAccountPredicate)initWithPredicate:(id)a3
{
  return [(CNiOSABDefaultContainerForAccountPredicate *)self initWithAccountIdentifier:0];
}

- (CNiOSABDefaultContainerForAccountPredicate)initWithAccountIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"defaultForAccount.identifier == %@", v4];
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABDefaultContainerForAccountPredicate;
  v6 = [(CNPredicate *)&v11 initWithPredicate:v5];
  if (v6)
  {
    uint64_t v7 = [v4 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABDefaultContainerForAccountPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABDefaultContainerForAccountPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABDefaultContainerForAccountPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, @"_identifier", v5.receiver, v5.super_class);
}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  id v4 = [(CNiOSABDefaultContainerForAccountPredicate *)self identifier];

  CFArrayRef v5 = (const __CFArray *)ABAddressBookCopyArrayOfAllAccounts();
  if (!v5) {
    return 0;
  }
  CFArrayRef v6 = v5;
  if (CFArrayGetCount(v5) < 1) {
    goto LABEL_13;
  }
  CFIndex v7 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v6, v7);
    v9 = (const void *)ABAccountCopyInternalUUID();
    if (v9) {
      v9 = CFAutorelease(v9);
    }
    if (CFEqual(v9, v4)) {
      break;
    }
    if (++v7 >= CFArrayGetCount(v6)) {
      goto LABEL_13;
    }
  }
  if (ValueAtIndex)
  {
    uint64_t DefaultSourceForAccount = ABAddressBookGetDefaultSourceForAccount();
    if (DefaultSourceForAccount)
    {
      p_uint64_t DefaultSourceForAccount = (const void **)&DefaultSourceForAccount;
      CFIndex v12 = 1;
    }
    else
    {
      p_uint64_t DefaultSourceForAccount = 0;
      CFIndex v12 = 0;
    }
    v10 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], p_DefaultSourceForAccount, v12, MEMORY[0x1E4F1D510]);
  }
  else
  {
LABEL_13:
    v10 = 0;
  }
  CFRelease(v6);
  return v10;
}

- (BOOL)includesDisabledContainers
{
  return 0;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContainer predicateForDefaultContainerForAccountWithIdentifier:]"];
  CFArrayRef v5 = [(CNiOSABDefaultContainerForAccountPredicate *)self identifier];
  id v6 = (id)[v3 appendName:@"identifier" object:v5];

  CFIndex v7 = [v3 build];

  return (NSString *)v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end