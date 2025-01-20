@interface CNiOSABContactsInContainerPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (CNiOSABContactsInContainerPredicate)initWithCoder:(id)a3;
- (CNiOSABContactsInContainerPredicate)initWithParentContainerIdentifier:(id)a3;
- (NSString)description;
- (NSString)parentContainerIdentifier;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABContactsInContainerPredicate

- (CNiOSABContactsInContainerPredicate)initWithParentContainerIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"parentContainer.identifier == %@", v4];
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABContactsInContainerPredicate;
  v6 = [(CNPredicate *)&v11 initWithPredicate:v5];
  if (v6)
  {
    uint64_t v7 = [v4 copy];
    parentContainerIdentifier = v6->_parentContainerIdentifier;
    v6->_parentContainerIdentifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContactsInContainerPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABContactsInContainerPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_parentContainerIdentifier"];
    uint64_t v7 = [v6 copy];
    parentContainerIdentifier = v5->_parentContainerIdentifier;
    v5->_parentContainerIdentifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContactsInContainerPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_parentContainerIdentifier, @"_parentContainerIdentifier", v5.receiver, v5.super_class);
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
  id v15 = 0;
  v8 = [(CNiOSABContactsInContainerPredicate *)self cn_copyPeopleInAddressBook:a3 fetchRequest:a4 matchInfos:a5 environment:a6 nserror:&v15];
  id v9 = v15;
  v10 = v9;
  if (v8)
  {
    id v11 = v8;
  }
  else if (a7)
  {
    uint64_t v12 = [v9 code];
    v13 = [v10 userInfo];
    *a7 = +[CNErrorFactory errorWithCode:v12 userInfo:v13];
  }
  return (__CFArray *)v8;
}

- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  uint64_t v11 = *MEMORY[0x1E4F5A298];
  uint64_t v12 = [(CNiOSABContactsInContainerPredicate *)self parentContainerIdentifier];
  LODWORD(v11) = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  if (v11)
  {
    v13 = +[CNErrorFactory errorWithCode:400 userInfo:0];
    v14 = v13;
    if (a7) {
      *a7 = v13;
    }

    CFArrayRef v15 = 0;
  }
  else
  {
    v16 = [(CNiOSABContactsInContainerPredicate *)self parentContainerIdentifier];
    v20[0] = v16;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    v17 = (void *)ABAddressBookCopySourcesWithUUIDs();

    if (v17
      && ([v17 firstObject], v18 = objc_claimAutoreleasedReturnValue(), v18, v18))
    {
      CFArrayRef v15 = ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering(a3, v18, [v10 sortOrder]);
    }
    else
    {
      CFArrayRef v15 = (CFArrayRef)MEMORY[0x1E4F1CBF0];
    }
  }

  return v15;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  uint64_t v7 = *MEMORY[0x1E4F5A298];
  v8 = [(CNiOSABContactsInContainerPredicate *)self parentContainerIdentifier];
  LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if (v7)
  {
    id v9 = +[CNErrorFactory errorWithCode:400 userInfo:0];
    id v10 = v9;
    if (a5)
    {
      id v10 = v9;
      uint64_t v11 = 0;
      *a5 = v10;
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F498B0];
    id v10 = [(CNiOSABContactsInContainerPredicate *)self parentContainerIdentifier];
    uint64_t v11 = [v12 predicateForContactsInContainerWithIdentifier:v10];
  }

  return v11;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsInContainerWithIdentifier:]"];
  objc_super v5 = [(CNiOSABContactsInContainerPredicate *)self parentContainerIdentifier];
  id v6 = (id)[v3 appendName:@"identifier" object:v5];

  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (NSString)parentContainerIdentifier
{
  return self->_parentContainerIdentifier;
}

- (void).cxx_destruct
{
}

@end