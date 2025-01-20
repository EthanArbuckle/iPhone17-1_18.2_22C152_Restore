@interface CNiOSABExternalUUIDContactPredicate
- (BOOL)_inputsAreValid;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
@end

@implementation CNiOSABExternalUUIDContactPredicate

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

- (BOOL)_inputsAreValid
{
  v3 = [(CNExternalUUIDContactPredicate *)self externalUUIDs];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  v5 = [(CNExternalUUIDContactPredicate *)self externalUUIDs];
  char v6 = objc_msgSend(v5, "_cn_all:", &__block_literal_global_147);

  return v6;
}

void *__54__CNiOSABExternalUUIDContactPredicate__inputsAreValid__block_invoke()
{
  return (*(void *(**)(void *__return_ptr))(*MEMORY[0x1E4F5A2A0] + 16))(MEMORY[0x1E4F5A2A0]);
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  id v9 = a4;
  if ([(CNiOSABExternalUUIDContactPredicate *)self _inputsAreValid])
  {
    v10 = (void *)MEMORY[0x1E4F498B0];
    v11 = [(CNExternalUUIDContactPredicate *)self externalUUIDs];
    v12 = [v10 predicateForContactsWithExternalUUIDs:v11];

    [v9 sortOrder];
    v13 = (__CFArray *)ABAddressBookCopyAllPeopleForBufferPredicate();
  }
  else if (a7)
  {
    +[CNErrorFactory errorWithCode:400 userInfo:0];
    v13 = 0;
    *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  if ([(CNiOSABExternalUUIDContactPredicate *)self _inputsAreValid])
  {
    v7 = (void *)MEMORY[0x1E4F498B0];
    v8 = [(CNExternalUUIDContactPredicate *)self externalUUIDs];
    id v9 = [v7 predicateForContactsWithExternalUUIDs:v8];
  }
  else
  {
    CNSetError(a5, 400, 0);
    id v9 = 0;
  }

  return v9;
}

@end