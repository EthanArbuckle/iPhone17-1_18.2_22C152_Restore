@interface CNiOSABContainersForAccountPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)includesDisabledContainers;
- (CNiOSABContainersForAccountPredicate)initWithAccountIdentifier:(id)a3 includingDisabledContainers:(BOOL)a4;
- (CNiOSABContainersForAccountPredicate)initWithCoder:(id)a3;
- (CNiOSABContainersForAccountPredicate)initWithPredicate:(id)a3;
- (NSString)accountIdentifier;
- (NSString)description;
- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABContainersForAccountPredicate

- (CNiOSABContainersForAccountPredicate)initWithPredicate:(id)a3
{
  return [(CNiOSABContainersForAccountPredicate *)self initWithAccountIdentifier:0 includingDisabledContainers:0];
}

- (CNiOSABContainersForAccountPredicate)initWithAccountIdentifier:(id)a3 includingDisabledContainers:(BOOL)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"account.identifier == %@", v6];
  v12.receiver = self;
  v12.super_class = (Class)CNiOSABContainersForAccountPredicate;
  v8 = [(CNPredicate *)&v12 initWithPredicate:v7];

  if (v8)
  {
    uint64_t v9 = [v6 copy];
    accountIdentifier = v8->_accountIdentifier;
    v8->_accountIdentifier = (NSString *)v9;

    v8->_includesDisabledContainers = a4;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContainersForAccountPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABContainersForAccountPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_accountIdentifier"];
    uint64_t v7 = [v6 copy];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v7;

    v5->_includesDisabledContainers = [v4 decodeBoolForKey:@"_includesDisabledContainers"];
    uint64_t v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContainersForAccountPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountIdentifier, @"_accountIdentifier", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_includesDisabledContainers forKey:@"_includesDisabledContainers"];
}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  objc_super v5 = [(CNiOSABContainersForAccountPredicate *)self accountIdentifier];
  id v6 = +[CNAccount localAccount];
  uint64_t v7 = [v6 identifier];
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    values = (void *)ABAddressBookCopyLocalSource();
    if (!values) {
      return CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    }
    MutableCopy = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
    v10 = values;
  }
  else
  {
    objc_super v11 = [(CNiOSABContainersForAccountPredicate *)self accountIdentifier];

    if (!v11) {
      return CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    }
    CFArrayRef v12 = (const __CFArray *)ABAddressBookCopyArrayOfAllAccounts();
    if (!v12) {
      return CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    }
    CFArrayRef v13 = v12;
    if (CFArrayGetCount(v12) < 1) {
      goto LABEL_17;
    }
    CFIndex v14 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v13, v14);
      v16 = (const void *)ABAccountCopyInternalUUID();
      if (v16) {
        v16 = CFAutorelease(v16);
      }
      if (CFEqual(v16, v11)) {
        break;
      }
      if (++v14 >= CFArrayGetCount(v13)) {
        goto LABEL_17;
      }
    }
    if (ValueAtIndex && (CFArrayRef v17 = (const __CFArray *)ABAddressBookCopyArrayOfAllSourcesInAccount()) != 0)
    {
      CFArrayRef v18 = v17;
      MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v17);
      CFRelease(v18);
    }
    else
    {
LABEL_17:
      MutableCopy = 0;
    }
    v10 = v13;
  }
  CFRelease(v10);
  if (!MutableCopy) {
    return CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  }
  return MutableCopy;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContainer predicateForContainersInAccountWithIdentifier:]"];
  objc_super v5 = [(CNiOSABContainersForAccountPredicate *)self accountIdentifier];
  id v6 = (id)[v3 appendName:@"identifier" object:v5];

  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (BOOL)includesDisabledContainers
{
  return self->_includesDisabledContainers;
}

- (void).cxx_destruct
{
}

@end