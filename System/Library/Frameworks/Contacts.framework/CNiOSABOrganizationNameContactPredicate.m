@interface CNiOSABOrganizationNameContactPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (BOOL)isEqual:(id)a3;
- (CNiOSABOrganizationNameContactPredicate)initWithCoder:(id)a3;
- (CNiOSABOrganizationNameContactPredicate)initWithOrganizationName:(id)a3;
- (NSString)description;
- (NSString)organizationName;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABOrganizationNameContactPredicate

- (CNiOSABOrganizationNameContactPredicate)initWithOrganizationName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABOrganizationNameContactPredicate;
  v5 = [(CNPredicate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABOrganizationNameContactPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABOrganizationNameContactPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_organizationName"];
    uint64_t v7 = [v6 copy];
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABOrganizationNameContactPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_organizationName, @"_organizationName", v5.receiver, v5.super_class);
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactWithOrganizationName:]"];
  objc_super v5 = [(CNiOSABOrganizationNameContactPredicate *)self organizationName];
  id v6 = (id)[v3 appendName:@"organizationName" object:v5];

  uint64_t v7 = [v3 build];

  return (NSString *)v7;
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
  return 1;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  id v15 = 0;
  v8 = [(CNiOSABOrganizationNameContactPredicate *)self cn_copyPeopleInAddressBook:a3 fetchRequest:a4 matchInfos:a5 environment:a6 nserror:&v15];
  id v9 = v15;
  objc_super v10 = v9;
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
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = (void *)MEMORY[0x1E4F498B8];
  id v13 = a6;
  id v14 = a4;
  id v15 = [(CNiOSABOrganizationNameContactPredicate *)self organizationName];
  v16 = [v12 personPredicateWithValue:v15 comparison:3 forProperty:*MEMORY[0x1E4F49C60] addressBook:a3];

  if (v16)
  {
    v22[0] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  }
  else
  {
    v17 = 0;
  }
  uint64_t v18 = [v14 sortOrder];
  uint64_t v19 = [v14 options];

  v20 = +[CNiOSFetchExecution contactsMatchingPredicates:v17 sortOrdering:v18 matchInfos:a5 options:v19 addressBook:a3 environment:v13 error:a7];

  if (v16) {

  }
  return v20;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  objc_super v5 = (void *)MEMORY[0x1E4F498B0];
  id v6 = [(CNiOSABOrganizationNameContactPredicate *)self organizationName];
  uint64_t v7 = [v5 predicateForContactsMatchingOrganizationName:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1E4F5A3E0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__CNiOSABOrganizationNameContactPredicate_isEqual___block_invoke;
  v8[3] = &unk_1E56B3E18;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v8, 0);

  return (char)self;
}

uint64_t __51__CNiOSABOrganizationNameContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) organizationName];
  id v4 = [*(id *)(a1 + 40) organizationName];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__CNiOSABOrganizationNameContactPredicate_hash__block_invoke;
  v3[3] = &unk_1E56B3E40;
  v3[4] = self;
  return objc_msgSend(MEMORY[0x1E4F5A418], "hashWithBlocks:", v3, 0);
}

uint64_t __47__CNiOSABOrganizationNameContactPredicate_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) organizationName];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void).cxx_destruct
{
}

@end