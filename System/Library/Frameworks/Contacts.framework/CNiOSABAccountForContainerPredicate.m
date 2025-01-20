@interface CNiOSABAccountForContainerPredicate
+ (BOOL)supportsSecureCoding;
- (CNiOSABAccountForContainerPredicate)initWithCoder:(id)a3;
- (CNiOSABAccountForContainerPredicate)initWithContainerIdentifier:(id)a3;
- (CNiOSABAccountForContainerPredicate)initWithPredicate:(id)a3;
- (NSString)containerIdentifier;
- (__CFArray)cn_copyAccountsInAddressBook:(void *)a3 error:(__CFError *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABAccountForContainerPredicate

- (CNiOSABAccountForContainerPredicate)initWithPredicate:(id)a3
{
  return [(CNiOSABAccountForContainerPredicate *)self initWithContainerIdentifier:0];
}

- (CNiOSABAccountForContainerPredicate)initWithContainerIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY containers.identifier == %@", v4];
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABAccountForContainerPredicate;
  v6 = [(CNPredicate *)&v11 initWithPredicate:v5];
  if (v6)
  {
    uint64_t v7 = [v4 copy];
    containerIdentifier = v6->_containerIdentifier;
    v6->_containerIdentifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABAccountForContainerPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABAccountForContainerPredicate;
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
  v5.super_class = (Class)CNiOSABAccountForContainerPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_containerIdentifier, @"_containerIdentifier", v5.receiver, v5.super_class);
}

- (__CFArray)cn_copyAccountsInAddressBook:(void *)a3 error:(__CFError *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(CNiOSABAccountForContainerPredicate *)self containerIdentifier];

  if (v5)
  {
    v6 = [(CNiOSABAccountForContainerPredicate *)self containerIdentifier];
    v13[0] = v6;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    CFArrayRef v7 = (const __CFArray *)ABAddressBookCopySourcesWithUUIDs();

    if (v7)
    {
      if (CFArrayGetCount(v7) == 1)
      {
        CFArrayGetValueAtIndex(v7, 0);
        int IntValue = ABRecordGetIntValue();
        AccountForSource = (void *)ABAddressBookGetAccountForSource();
        values = AccountForSource;
        if (AccountForSource)
        {
          CFRetain(AccountForSource);
        }
        else if (IntValue || (values = (void *)ABAccountCreate()) == 0)
        {
          v10 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D510]);
          goto LABEL_11;
        }
        v10 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&values, 1, MEMORY[0x1E4F1D510]);
        CFRelease(values);
      }
      else
      {
        v10 = 0;
      }
LABEL_11:
      CFRelease(v7);
      return v10;
    }
  }
  return 0;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void).cxx_destruct
{
}

@end