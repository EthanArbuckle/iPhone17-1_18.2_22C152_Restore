@interface CNiOSABSmartDialerStringContactPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (BOOL)isEqual:(id)a3;
- (CNiOSABSmartDialerStringContactPredicate)initWithCoder:(id)a3;
- (CNiOSABSmartDialerStringContactPredicate)initWithString:(id)a3;
- (NSString)description;
- (NSString)smartDialerString;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7;
- (id)cn_fetchPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 progressiveResults:(id)a5 completion:(id)a6 environment:(id)a7;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABSmartDialerStringContactPredicate

- (CNiOSABSmartDialerStringContactPredicate)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNiOSABSmartDialerStringContactPredicate;
  v5 = [(CNPredicate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    smartDialerString = v5->_smartDialerString;
    v5->_smartDialerString = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABSmartDialerStringContactPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABSmartDialerStringContactPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_smartDialerString"];
    uint64_t v7 = [v6 copy];
    smartDialerString = v5->_smartDialerString;
    v5->_smartDialerString = (NSString *)v7;

    objc_super v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABSmartDialerStringContactPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_smartDialerString, @"_smartDialerString", v5.receiver, v5.super_class);
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
  v8 = [(CNiOSABSmartDialerStringContactPredicate *)self cn_copyPeopleInAddressBook:a3 fetchRequest:a4 matchInfos:a5 environment:a6 nserror:&v15];
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
  v24[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = *MEMORY[0x1E4F5A298];
  id v15 = [(CNiOSABSmartDialerStringContactPredicate *)self smartDialerString];
  LODWORD(v14) = (*(uint64_t (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  if (v14)
  {
    v16 = +[CNErrorFactory errorWithCode:400 userInfo:0];
    v17 = v16;
    if (a7) {
      *a7 = v16;
    }

    v18 = 0;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E4F498A8];
    v20 = [(CNiOSABSmartDialerStringContactPredicate *)self smartDialerString];
    v21 = [v19 personPredicateWithSmartDialerStringLike:v20 addressBook:a3];

    if (v21)
    {
      v24[0] = v21;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    }
    else
    {
      v22 = 0;
    }
    v18 = +[CNiOSFetchExecution contactsMatchingPredicates:sortOrdering:matchInfos:options:addressBook:environment:error:](CNiOSFetchExecution, "contactsMatchingPredicates:sortOrdering:matchInfos:options:addressBook:environment:error:", v22, [v12 sortOrder], a5, objc_msgSend(v12, "options"), a3, v13, a7);
    if (v21) {
  }
    }

  return v18;
}

- (id)cn_fetchPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 progressiveResults:(id)a5 completion:(id)a6 environment:(id)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = *MEMORY[0x1E4F5A298];
  v17 = [(CNiOSABSmartDialerStringContactPredicate *)self smartDialerString];
  LOBYTE(v16) = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v17);

  if (v16)
  {
    v18 = 0;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E4F498A8];
    v20 = [(CNiOSABSmartDialerStringContactPredicate *)self smartDialerString];
    v21 = [v19 personPredicateWithSmartDialerStringLike:v20 addressBook:a3];

    if (v21)
    {
      v24[0] = v21;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    }
    else
    {
      v22 = 0;
    }
    v18 = +[CNiOSFetchExecution contactsMatchingPredicates:sortOrdering:options:addressBook:progressiveResults:completion:environment:](CNiOSFetchExecution, "contactsMatchingPredicates:sortOrdering:options:addressBook:progressiveResults:completion:environment:", v22, [v12 sortOrder], objc_msgSend(v12, "options"), a3, v13, v14, v15);
    if (v21) {
  }
    }

  return v18;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  uint64_t v7 = *MEMORY[0x1E4F5A298];
  v8 = [(CNiOSABSmartDialerStringContactPredicate *)self smartDialerString];
  LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if (v7)
  {
    CNSetError(a5, 400, 0);
  }
  else if (ABCFTSIsEnabled())
  {
    uint64_t WordTokenizer = ABAddressBookGetWordTokenizer();
    uint64_t SearchCollator = ABAddressBookGetSearchCollator();
    id v11 = (void *)MEMORY[0x1E4F498B0];
    id v12 = [(CNiOSABSmartDialerStringContactPredicate *)self smartDialerString];
    id v13 = [v11 predicateForContactsMatchingSmartDialerString:v12 tokenizer:WordTokenizer collator:SearchCollator];

    goto LABEL_6;
  }
  id v13 = 0;
LABEL_6:

  return v13;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsMatchingSmartDialerString:]"];
  objc_super v5 = [(CNiOSABSmartDialerStringContactPredicate *)self smartDialerString];
  id v6 = (id)[v3 appendName:@"smartDialerString" object:v5];

  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1E4F5A3E0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__CNiOSABSmartDialerStringContactPredicate_isEqual___block_invoke;
  v8[3] = &unk_1E56B3E18;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v8, 0);

  return (char)self;
}

uint64_t __52__CNiOSABSmartDialerStringContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) smartDialerString];
  id v4 = [*(id *)(a1 + 40) smartDialerString];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__CNiOSABSmartDialerStringContactPredicate_hash__block_invoke;
  v3[3] = &unk_1E56B3E40;
  v3[4] = self;
  return objc_msgSend(MEMORY[0x1E4F5A418], "hashWithBlocks:", v3, 0);
}

uint64_t __48__CNiOSABSmartDialerStringContactPredicate_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) smartDialerString];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (NSString)smartDialerString
{
  return self->_smartDialerString;
}

- (void).cxx_destruct
{
}

@end