@interface CNiOSABInstantMessageAddressContactPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (BOOL)isEqual:(id)a3;
- (CNInstantMessageAddress)imAddress;
- (CNiOSABInstantMessageAddressContactPredicate)initWithCoder:(id)a3;
- (CNiOSABInstantMessageAddressContactPredicate)initWithInstantMessageAddress:(id)a3;
- (NSString)description;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImAddress:(id)a3;
@end

@implementation CNiOSABInstantMessageAddressContactPredicate

- (CNiOSABInstantMessageAddressContactPredicate)initWithInstantMessageAddress:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABInstantMessageAddressContactPredicate;
  v5 = [(CNPredicate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    imAddress = v5->_imAddress;
    v5->_imAddress = (CNInstantMessageAddress *)v6;

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABInstantMessageAddressContactPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABInstantMessageAddressContactPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_imAddress"];
    uint64_t v7 = [v6 copy];
    imAddress = v5->_imAddress;
    v5->_imAddress = (CNInstantMessageAddress *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABInstantMessageAddressContactPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_imAddress, @"_imAddress", v5.receiver, v5.super_class);
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
  id v13 = 0;
  v8 = [(CNiOSABInstantMessageAddressContactPredicate *)self cn_copyPeopleInAddressBook:a3 fetchRequest:a4 matchInfos:a5 environment:a6 nserror:&v13];
  id v9 = v13;
  objc_super v10 = v9;
  if (v8)
  {
    id v11 = v8;
  }
  else if (a7)
  {
    *a7 = (__CFError *)v9;
  }

  return (__CFArray *)v8;
}

- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  if (a5) {
    *a5 = 0;
  }
  v14 = +[CN instantMessagAddressesDescription];
  v15 = [(CNiOSABInstantMessageAddressContactPredicate *)self imAddress];
  v16 = objc_msgSend((id)objc_msgSend(v14, "ABMultiValueValueFromCNLabeledValueValue:", v15), "mutableCopy");

  [v16 removeObjectForKey:*MEMORY[0x1E4F49AA8]];
  v17 = (void *)MEMORY[0x1E4F498A8];
  unsigned int v18 = [v12 sortOrder];
  uint64_t v19 = [v17 personPredicateWithValue:v16 comparison:v18 forProperty:*MEMORY[0x1E4F49B48]];
  v20 = (void *)v19;
  if (v19)
  {
    v31[0] = v19;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    id v22 = v13;
    v23 = a3;
    uint64_t v24 = [v12 sortOrder];
    uint64_t v25 = [v12 options];
    v26 = v23;
    id v13 = v22;
    v27 = +[CNiOSFetchExecution contactsMatchingPredicates:v21 sortOrdering:v24 matchInfos:a5 options:v25 addressBook:v26 environment:v22 error:a7];
  }
  else
  {
    v28 = +[CNErrorFactory errorWithCode:400 userInfo:0];
    v29 = v28;
    if (a7) {
      *a7 = v28;
    }

    v27 = 0;
  }

  return v27;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsMatchingInstantMessageAddress:]"];
  objc_super v5 = [(CNiOSABInstantMessageAddressContactPredicate *)self imAddress];
  id v6 = (id)[v3 appendName:@"im" object:v5];

  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1E4F5A3E0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__CNiOSABInstantMessageAddressContactPredicate_isEqual___block_invoke;
  v8[3] = &unk_1E56B3E18;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v8, 0);

  return (char)self;
}

uint64_t __56__CNiOSABInstantMessageAddressContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) imAddress];
  id v4 = [*(id *)(a1 + 40) imAddress];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__CNiOSABInstantMessageAddressContactPredicate_hash__block_invoke;
  v3[3] = &unk_1E56B3E40;
  v3[4] = self;
  return objc_msgSend(MEMORY[0x1E4F5A418], "hashWithBlocks:", v3, 0);
}

uint64_t __52__CNiOSABInstantMessageAddressContactPredicate_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) imAddress];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (CNInstantMessageAddress)imAddress
{
  return self->_imAddress;
}

- (void)setImAddress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end