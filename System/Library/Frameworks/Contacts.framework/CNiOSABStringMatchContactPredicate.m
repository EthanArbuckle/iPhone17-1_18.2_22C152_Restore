@interface CNiOSABStringMatchContactPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (CNiOSABStringMatchContactPredicate)initWithCoder:(id)a3;
- (CNiOSABStringMatchContactPredicate)initWithSearchString:(id)a3 accountIdentifier:(id)a4 containerIdentifier:(id)a5 groupIdentifier:(id)a6;
- (NSString)accountIdentifier;
- (NSString)containerIdentifier;
- (NSString)description;
- (NSString)groupIdentifier;
- (NSString)searchString;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABStringMatchContactPredicate

- (CNiOSABStringMatchContactPredicate)initWithSearchString:(id)a3 accountIdentifier:(id)a4 containerIdentifier:(id)a5 groupIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CNiOSABStringMatchContactPredicate;
  v14 = [(CNPredicate *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    searchString = v14->_searchString;
    v14->_searchString = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    accountIdentifier = v14->_accountIdentifier;
    v14->_accountIdentifier = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    containerIdentifier = v14->_containerIdentifier;
    v14->_containerIdentifier = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    groupIdentifier = v14->_groupIdentifier;
    v14->_groupIdentifier = (NSString *)v21;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABStringMatchContactPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNiOSABStringMatchContactPredicate;
  v5 = [(CNPredicate *)&v20 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_searchString"];
    uint64_t v7 = [v6 copy];
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_accountIdentifier"];
    uint64_t v10 = [v9 copy];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_containerIdentifier"];
    uint64_t v13 = [v12 copy];
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_groupIdentifier"];
    uint64_t v16 = [v15 copy];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABStringMatchContactPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchString, @"_searchString", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_accountIdentifier forKey:@"_accountIdentifier"];
  [v4 encodeObject:self->_containerIdentifier forKey:@"_containerIdentifier"];
  [v4 encodeObject:self->_groupIdentifier forKey:@"_groupIdentifier"];
}

- (BOOL)cn_supportsNativeSorting
{
  return 0;
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
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4F5A298];
  uint64_t v10 = [(CNiOSABStringMatchContactPredicate *)self searchString];
  LODWORD(v9) = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  if (v9)
  {
    if (!a7) {
      return 0;
    }
    +[CNErrorFactory errorWithCode:400 userInfo:0];
    id v11 = 0;
    *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();
    return v11;
  }
  id v12 = [(CNiOSABStringMatchContactPredicate *)self groupIdentifier];

  if (v12)
  {
    uint64_t v13 = [(CNiOSABStringMatchContactPredicate *)self groupIdentifier];
    v21[0] = v13;
    char v14 = 1;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    id v12 = (void *)ABAddressBookCopyGroupsWithUUIDs();

    if (v12)
    {
      if (CFArrayGetCount((CFArrayRef)v12))
      {
        CFArrayGetValueAtIndex((CFArrayRef)v12, 0);
        char v14 = 0;
      }
      else
      {
        char v14 = 1;
      }
    }
  }
  else
  {
    char v14 = 0;
  }
  uint64_t v15 = [(CNiOSABStringMatchContactPredicate *)self containerIdentifier];

  if (v15)
  {
    uint64_t v16 = [(CNiOSABStringMatchContactPredicate *)self containerIdentifier];
    objc_super v20 = v16;
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    uint64_t v15 = (void *)ABAddressBookCopySourcesWithUUIDs();

    if (!v15) {
      goto LABEL_17;
    }
    if (!CFArrayGetCount((CFArrayRef)v15)) {
      goto LABEL_17;
    }
    CFArrayGetValueAtIndex((CFArrayRef)v15, 0);
    if (v14) {
      goto LABEL_17;
    }
  }
  else if (v14)
  {
LABEL_17:
    id v11 = CFArrayCreate(0, 0, 0, MEMORY[0x1E4F1D510]);
    goto LABEL_18;
  }
  uint64_t v17 = [(CNiOSABStringMatchContactPredicate *)self searchString];
  v18 = [(CNiOSABStringMatchContactPredicate *)self accountIdentifier];
  id v11 = (__CFArray *)ABAddressBookCopyArrayOfAllPeopleMatching();

  if (!v11) {
    goto LABEL_17;
  }
LABEL_18:
  if (v12) {
    CFRelease(v12);
  }
  if (v15) {
    CFRelease(v15);
  }
  return v11;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsMatchingString:accountIdentifier:containerIdentifier:groupIdentifier:]"];
  objc_super v5 = [(CNiOSABStringMatchContactPredicate *)self searchString];
  id v6 = (id)[v3 appendName:@"searchString" object:v5];

  uint64_t v7 = [(CNiOSABStringMatchContactPredicate *)self accountIdentifier];
  id v8 = (id)[v3 appendName:@"accountIdentifier" object:v7];

  uint64_t v9 = [(CNiOSABStringMatchContactPredicate *)self containerIdentifier];
  id v10 = (id)[v3 appendName:@"containerIdentifier" object:v9];

  id v11 = [(CNiOSABStringMatchContactPredicate *)self groupIdentifier];
  id v12 = (id)[v3 appendName:@"groupIdentifier" object:v11];

  uint64_t v13 = [v3 build];

  return (NSString *)v13;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);

  objc_storeStrong((id *)&self->_searchString, 0);
}

@end