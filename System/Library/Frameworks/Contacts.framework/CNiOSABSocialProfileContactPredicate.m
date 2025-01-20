@interface CNiOSABSocialProfileContactPredicate
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7;
@end

@implementation CNiOSABSocialProfileContactPredicate

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
  v8 = [(CNiOSABSocialProfileContactPredicate *)self cn_copyPeopleInAddressBook:a3 fetchRequest:a4 matchInfos:a5 environment:a6 nserror:&v15];
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
  v33[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  if (a5) {
    *a5 = 0;
  }
  v13 = +[CN socialProfilesDescription];
  v14 = [(CNSocialProfileContactPredicate *)self socialProfile];
  id v15 = objc_msgSend((id)objc_msgSend(v13, "ABMultiValueValueFromCNLabeledValueValue:", v14), "mutableCopy");

  uint64_t v16 = *MEMORY[0x1E4F49AA8];
  v17 = [v15 objectForKey:*MEMORY[0x1E4F49AA8]];
  if ([v17 count])
  {
    v18 = NSString;
    v19 = [v17 firstObject];
    v20 = [v18 stringWithFormat:@"%%%@%%", v19];

    [v15 setObject:v20 forKey:v16];
  }
  else if (v17)
  {
    [v15 removeObjectForKey:v16];
  }
  uint64_t v21 = [MEMORY[0x1E4F498A8] personPredicateWithValue:v15 comparison:0 forProperty:*MEMORY[0x1E4F49D30]];
  v22 = (void *)v21;
  if (v21)
  {
    v33[0] = v21;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    v24 = a5;
    v25 = v13;
    id v26 = v12;
    uint64_t v27 = [v11 sortOrder];
    uint64_t v28 = [v11 options];
    uint64_t v29 = v27;
    id v12 = v26;
    v13 = v25;
    v30 = +[CNiOSFetchExecution contactsMatchingPredicates:v23 sortOrdering:v29 matchInfos:v24 options:v28 addressBook:a3 environment:v12 error:a7];
  }
  else
  {
    CNSetError(a7, 400, 0);
    v30 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v30;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsMatchingSocialProfile:]"];
  v5 = [(CNSocialProfileContactPredicate *)self socialProfile];
  id v6 = (id)[v3 appendName:@"socialProfile" object:v5];

  v7 = [v3 build];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F5A3E0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__CNiOSABSocialProfileContactPredicate_isEqual___block_invoke;
  v8[3] = &unk_1E56B3E18;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v8, 0);

  return (char)self;
}

uint64_t __48__CNiOSABSocialProfileContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) socialProfile];
  id v4 = [*(id *)(a1 + 40) socialProfile];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

@end