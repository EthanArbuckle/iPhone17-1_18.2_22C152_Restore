@interface CNiOSABEmailAddressContactPredicate
- (BOOL)_inputsAreValid;
- (BOOL)_stringsAreNonEmpty:(id)a3;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
@end

@implementation CNiOSABEmailAddressContactPredicate

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (BOOL)_inputsAreValid
{
  v3 = [(CNEmailAddressContactPredicate *)self emailAddresses];
  if ([v3 count])
  {
    v4 = [(CNEmailAddressContactPredicate *)self emailAddresses];
    BOOL v5 = [(CNiOSABEmailAddressContactPredicate *)self _stringsAreNonEmpty:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  v6 = [(CNEmailAddressContactPredicate *)self groupIdentifiers];
  if ([v6 count])
  {
    v7 = [(CNEmailAddressContactPredicate *)self groupIdentifiers];
    BOOL v8 = [(CNiOSABEmailAddressContactPredicate *)self _stringsAreNonEmpty:v7];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v5 && v8;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  if ([(CNiOSABEmailAddressContactPredicate *)self _inputsAreValid])
  {
    v7 = (void *)MEMORY[0x1E4F498B0];
    uint64_t v8 = *MEMORY[0x1E4F49AC0];
    v9 = [(CNEmailAddressContactPredicate *)self emailAddresses];
    v10 = [(CNEmailAddressContactPredicate *)self groupIdentifiers];
    v11 = objc_msgSend(v7, "predicateForContactsMatchingMultivalueProperty:values:groupIdentifiers:containerIdentifiers:limitToOneResult:map:", v8, v9, v10, 0, -[CNEmailAddressContactPredicate returnsMultipleResults](self, "returnsMultipleResults") ^ 1, 0);
  }
  else
  {
    CNSetError(a5, 400, 0);
    v11 = 0;
  }

  return v11;
}

- (BOOL)_stringsAreNonEmpty:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__CNiOSABEmailAddressContactPredicate__stringsAreNonEmpty___block_invoke;
  v6[3] = &unk_1E56B7880;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __59__CNiOSABEmailAddressContactPredicate__stringsAreNonEmpty___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 length];
  if (!result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (BOOL)cn_supportsNativeSorting
{
  return 1;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  id v9 = a4;
  if ([(CNiOSABEmailAddressContactPredicate *)self _inputsAreValid])
  {
    char v10 = (void *)MEMORY[0x1E4F498B0];
    uint64_t v11 = *MEMORY[0x1E4F49AC0];
    v12 = [(CNEmailAddressContactPredicate *)self emailAddresses];
    v13 = [(CNEmailAddressContactPredicate *)self groupIdentifiers];
    v14 = objc_msgSend(v10, "predicateForContactsMatchingMultivalueProperty:values:groupIdentifiers:containerIdentifiers:limitToOneResult:map:", v11, v12, v13, 0, -[CNEmailAddressContactPredicate returnsMultipleResults](self, "returnsMultipleResults") ^ 1, 0);

    [v9 sortOrder];
    v15 = (__CFArray *)ABAddressBookCopyAllPeopleForBufferPredicate();
  }
  else if (a7)
  {
    +[CNErrorFactory errorWithCode:400 userInfo:0];
    v15 = 0;
    *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end