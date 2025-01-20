@interface CNiOSABPostalAddressContactPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (BOOL)isEqual:(id)a3;
- (CNPostalAddress)postalAddress;
- (CNiOSABPostalAddressContactPredicate)initWithCoder:(id)a3;
- (CNiOSABPostalAddressContactPredicate)initWithPostalAddress:(id)a3;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPostalAddress:(id)a3;
@end

@implementation CNiOSABPostalAddressContactPredicate

- (CNiOSABPostalAddressContactPredicate)initWithPostalAddress:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABPostalAddressContactPredicate;
  v5 = [(CNPredicate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    postalAddress = v5->_postalAddress;
    v5->_postalAddress = (CNPostalAddress *)v6;

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABPostalAddressContactPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABPostalAddressContactPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_postalAddress"];
    uint64_t v7 = [v6 copy];
    postalAddress = v5->_postalAddress;
    v5->_postalAddress = (CNPostalAddress *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABPostalAddressContactPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_postalAddress, @"_postalAddress", v5.receiver, v5.super_class);
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
  id v15 = 0;
  v8 = [(CNiOSABPostalAddressContactPredicate *)self cn_copyPeopleInAddressBook:a3 fetchRequest:a4 matchInfos:a5 environment:a6 nserror:&v15];
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
  v24[1] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = +[CN postalAddressesDescription];
  v13 = [(CNiOSABPostalAddressContactPredicate *)self postalAddress];
  v14 = [v12 ABMultiValueValueFromCNLabeledValueValue:v13];

  uint64_t v15 = [MEMORY[0x1E4F498B8] personPredicateWithValue:v14 comparison:3 forProperty:*MEMORY[0x1E4F499E0] addressBook:a3];
  v16 = (void *)v15;
  if (v15)
  {
    v24[0] = v15;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  }
  else
  {
    v17 = 0;
  }
  uint64_t v18 = [v11 sortOrder];
  uint64_t v19 = [v11 options];

  v20 = +[CNiOSFetchExecution contactsMatchingPredicates:v17 sortOrdering:v18 matchInfos:a5 options:v19 addressBook:a3 environment:v10 error:a7];

  if (v16) {

  }
  return v20;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1E4F5A3E0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__CNiOSABPostalAddressContactPredicate_isEqual___block_invoke;
  v8[3] = &unk_1E56B3E18;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v8, 0);

  return (char)self;
}

uint64_t __48__CNiOSABPostalAddressContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) postalAddress];
  id v4 = [*(id *)(a1 + 40) postalAddress];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__CNiOSABPostalAddressContactPredicate_hash__block_invoke;
  v3[3] = &unk_1E56B3E40;
  v3[4] = self;
  return objc_msgSend(MEMORY[0x1E4F5A418], "hashWithBlocks:", v3, 0);
}

uint64_t __44__CNiOSABPostalAddressContactPredicate_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) postalAddress];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (CNPostalAddress)postalAddress
{
  return self->_postalAddress;
}

- (void)setPostalAddress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end