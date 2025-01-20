@interface CNiOSABContactsInGroupPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (CNiOSABContactsInGroupPredicate)initWithCoder:(id)a3;
- (CNiOSABContactsInGroupPredicate)initWithParentGroupIdentifier:(id)a3;
- (NSString)description;
- (NSString)parentGroupIdentifier;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABContactsInGroupPredicate

- (CNiOSABContactsInGroupPredicate)initWithParentGroupIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"parentGroup.identifier == %@", v4];
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABContactsInGroupPredicate;
  v6 = [(CNPredicate *)&v10 initWithPredicate:v5];

  if (v6)
  {
    uint64_t v7 = [v4 copy];
    parentGroupIdentifier = v6->_parentGroupIdentifier;
    v6->_parentGroupIdentifier = (NSString *)v7;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContactsInGroupPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABContactsInGroupPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_parentGroupIdentifier"];
    uint64_t v7 = [v6 copy];
    parentGroupIdentifier = v5->_parentGroupIdentifier;
    v5->_parentGroupIdentifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContactsInGroupPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_parentGroupIdentifier, @"_parentGroupIdentifier", v5.receiver, v5.super_class);
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
  return 1;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  objc_super v10 = [(CNiOSABContactsInGroupPredicate *)self parentGroupIdentifier];
  uint64_t v11 = [v10 length];

  if (!v11)
  {
    if (a7)
    {
      +[CNErrorFactory errorWithCode:400 userInfo:0];
      v15 = 0;
      *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    goto LABEL_11;
  }
  v12 = [(CNiOSABContactsInGroupPredicate *)self parentGroupIdentifier];
  v17[0] = v12;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v13 = (const void *)ABAddressBookCopyGroupsWithUUIDs();

  if (!v13)
  {
LABEL_9:
    v15 = CFArrayCreate(0, 0, 0, MEMORY[0x1E4F1D510]);
    goto LABEL_11;
  }
  if (CFArrayGetCount((CFArrayRef)v13) <= 0)
  {
    CFRelease(v13);
    goto LABEL_9;
  }
  ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v13, 0);
  v15 = ABGroupCopyArrayOfAllMembersWithSortOrdering(ValueAtIndex, [v9 sortOrder]);
  CFRelease(v13);
  if (!v15) {
    goto LABEL_9;
  }
LABEL_11:

  return v15;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  uint64_t v7 = [(CNiOSABContactsInGroupPredicate *)self parentGroupIdentifier];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F498B0];
    objc_super v10 = [(CNiOSABContactsInGroupPredicate *)self parentGroupIdentifier];
    uint64_t v11 = [v9 predicateForContactsInGroupWithIdentifier:v10];
  }
  else
  {
    CNSetError(a5, 400, 0);
    uint64_t v11 = 0;
  }

  return v11;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsInGroupWithIdentifier:]"];
  objc_super v5 = [(CNiOSABContactsInGroupPredicate *)self parentGroupIdentifier];
  id v6 = (id)[v3 appendName:@"identifier" object:v5];

  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (NSString)parentGroupIdentifier
{
  return self->_parentGroupIdentifier;
}

- (void).cxx_destruct
{
}

@end