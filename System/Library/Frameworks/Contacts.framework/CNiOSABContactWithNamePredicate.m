@interface CNiOSABContactWithNamePredicate
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
@end

@implementation CNiOSABContactWithNamePredicate

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
  uint64_t v10 = *MEMORY[0x1E4F5A298];
  v11 = [(CNContactWithNamePredicate *)self name];
  LODWORD(v10) = (*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  if (v10)
  {
    if (!a7) {
      return 0;
    }
    +[CNErrorFactory errorWithCode:400 userInfo:0];
    v12 = 0;
    *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();
    return v12;
  }
  v13 = [(CNContactWithNamePredicate *)self name];
  v12 = ABAddressBookCopyPeopleWithName(a3, v13);

  if (v12) {
    return v12;
  }
  v14 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];

  return CFArrayCreate(0, 0, 0, v14);
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  uint64_t v8 = *MEMORY[0x1E4F5A298];
  v9 = [(CNContactWithNamePredicate *)self name];
  LODWORD(v8) = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  if (v8)
  {
    CNSetError(a5, 400, 0);
    uint64_t v10 = 0;
  }
  else
  {
    if (ABCFTSIsEnabled())
    {
      uint64_t WordTokenizer = ABAddressBookGetWordTokenizer();
      uint64_t SearchCollator = ABAddressBookGetSearchCollator();
      v13 = (void *)MEMORY[0x1E4F498B0];
      v14 = [(CNContactWithNamePredicate *)self name];
      [v13 predicateForContactsMatchingText:v14 tokenizer:WordTokenizer collator:SearchCollator matchNameFieldsOnly:1];
    }
    else
    {
      v15 = (void *)MEMORY[0x1E4F498B0];
      v14 = [(CNContactWithNamePredicate *)self name];
      [v15 predicateForContactsMatchingName:v14 addressBook:a3];
    uint64_t v10 = };
  }

  return v10;
}

@end