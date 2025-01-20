@interface CNiOSABPreferredNameInContainersAndGroupsPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (CNiOSABPreferredNameInContainersAndGroupsPredicate)initWithCoder:(id)a3;
- (CNiOSABPreferredNameInContainersAndGroupsPredicate)initWithContainerIdentifiers:(id)a3 groupIdentifiers:(id)a4;
- (NSArray)containerIdentifiers;
- (NSArray)groupIdentifiers;
- (NSString)description;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABPreferredNameInContainersAndGroupsPredicate

- (CNiOSABPreferredNameInContainersAndGroupsPredicate)initWithContainerIdentifiers:(id)a3 groupIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CNiOSABPreferredNameInContainersAndGroupsPredicate;
  v8 = [(CNPredicate *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    containerIdentifiers = v8->_containerIdentifiers;
    v8->_containerIdentifiers = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    groupIdentifiers = v8->_groupIdentifiers;
    v8->_groupIdentifiers = (NSArray *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABPreferredNameInContainersAndGroupsPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNiOSABPreferredNameInContainersAndGroupsPredicate;
  v5 = [(CNPredicate *)&v20 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_containerIdentifiers"];
    uint64_t v10 = [v9 copy];
    containerIdentifiers = v5->_containerIdentifiers;
    v5->_containerIdentifiers = (NSArray *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    objc_super v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"_groupIdentifiers"];
    uint64_t v16 = [v15 copy];
    groupIdentifiers = v5->_groupIdentifiers;
    v5->_groupIdentifiers = (NSArray *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABPreferredNameInContainersAndGroupsPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_containerIdentifiers, @"_containerIdentifiers", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_groupIdentifiers forKey:@"_groupIdentifiers"];
}

- (BOOL)cn_supportsNativeSorting
{
  return 1;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (BOOL)cn_supportsEncodedFetching
{
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  id v8 = a4;
  uint64_t v9 = [(CNiOSABPreferredNameInContainersAndGroupsPredicate *)self groupIdentifiers];

  if (v9)
  {
    uint64_t v10 = [(CNiOSABPreferredNameInContainersAndGroupsPredicate *)self groupIdentifiers];
    uint64_t v9 = (void *)ABAddressBookCopyGroupsWithUUIDs();

    if (!v9) {
      uint64_t v9 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D510]);
    }
  }
  uint64_t v11 = [(CNiOSABPreferredNameInContainersAndGroupsPredicate *)self containerIdentifiers];

  if (v11)
  {
    v12 = [(CNiOSABPreferredNameInContainersAndGroupsPredicate *)self containerIdentifiers];
    uint64_t v13 = (const void *)ABAddressBookCopySourcesWithUUIDs();

    if (!v13) {
      uint64_t v13 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D510]);
    }
    BOOL v14 = v13 == 0;
    BOOL v15 = v9 == 0;
    if (v13 && v9)
    {
      if (CFArrayGetCount((CFArrayRef)v13) <= 0 && CFArrayGetCount((CFArrayRef)v9) <= 0)
      {
        v17 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D510]);
        CFRelease(v9);
LABEL_18:
        CFRelease(v13);
        goto LABEL_19;
      }
      BOOL v15 = 0;
      BOOL v14 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
    BOOL v15 = v9 == 0;
    BOOL v14 = 1;
  }
  [v8 sortOrder];
  uint64_t v16 = ABAddressBookCopyArrayOfPreferredNamePeopleForGroupsAndSourcesWithSortOrdering();
  if (!v16) {
    uint64_t v16 = (uint64_t)CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D510]);
  }
  v17 = (__CFArray *)v16;
  if (!v15) {
    CFRelease(v9);
  }
  if (!v14) {
    goto LABEL_18;
  }
LABEL_19:

  return v17;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForPreferredNameInContainersWithIdentifiers:groupsWithIdentifiers:]"];
  objc_super v5 = [(CNiOSABPreferredNameInContainersAndGroupsPredicate *)self containerIdentifiers];
  id v6 = (id)[v3 appendName:@"containerIdentifiers" object:v5];

  uint64_t v7 = [(CNiOSABPreferredNameInContainersAndGroupsPredicate *)self groupIdentifiers];
  id v8 = (id)[v3 appendName:@"groupIdentifiers" object:v7];

  uint64_t v9 = [v3 build];

  return (NSString *)v9;
}

- (NSArray)containerIdentifiers
{
  return self->_containerIdentifiers;
}

- (NSArray)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);

  objc_storeStrong((id *)&self->_containerIdentifiers, 0);
}

@end