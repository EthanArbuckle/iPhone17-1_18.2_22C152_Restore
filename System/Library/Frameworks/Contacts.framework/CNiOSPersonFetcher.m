@interface CNiOSPersonFetcher
+ (id)peopleForFetchRequest:(id)a3 matchInfos:(id *)a4 inAddressBook:(void *)a5 environment:(id)a6 error:(id *)a7;
- (BOOL)shouldSortInMemory;
- (CNContactsEnvironment)environment;
- (CNiOSPersonFetchRequest)fetchRequest;
- (CNiOSPersonFetcher)initWithAddressBook:(void *)a3 fetchRequest:(id)a4 environment:(id)a5;
- (id)executeFetchRequestWithProgressiveResults:(id)a3 completion:(id)a4;
- (id)fetchPeopleReturningMatchInfos:(id *)a3 error:(id *)a4;
- (id)fetchPeopleUsingNativeSortReturningMatchInfos:(id *)a3 error:(id *)a4;
- (id)sortPeople:(id)a3;
- (void)addressBook;
- (void)dealloc;
@end

@implementation CNiOSPersonFetcher

+ (id)peopleForFetchRequest:(id)a3 matchInfos:(id *)a4 inAddressBook:(void *)a5 environment:(id)a6 error:(id *)a7
{
  id v11 = a6;
  id v12 = a3;
  v13 = [[CNiOSPersonFetcher alloc] initWithAddressBook:a5 fetchRequest:v12 environment:v11];

  v14 = [(CNiOSPersonFetcher *)v13 fetchPeopleReturningMatchInfos:a4 error:a7];

  return v14;
}

- (CNiOSPersonFetcher)initWithAddressBook:(void *)a3 fetchRequest:(id)a4 environment:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CNiOSPersonFetcher;
  id v11 = [(CNiOSPersonFetcher *)&v15 init];
  if (v11)
  {
    if (a3) {
      id v12 = (void *)CFRetain(a3);
    }
    else {
      id v12 = 0;
    }
    v11->_addressBook = v12;
    objc_storeStrong((id *)&v11->_fetchRequest, a4);
    objc_storeStrong((id *)&v11->_environment, a5);
    v13 = v11;
  }

  return v11;
}

- (void)dealloc
{
  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  v4.receiver = self;
  v4.super_class = (Class)CNiOSPersonFetcher;
  [(CNiOSPersonFetcher *)&v4 dealloc];
}

- (id)executeFetchRequestWithProgressiveResults:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CNiOSPersonFetchRequest *)self->_fetchRequest predicate];
  if ([v8 conformsToProtocol:&unk_1EE093958])
  {
    id v9 = objc_msgSend(v8, "cn_fetchPeopleInAddressBook:fetchRequest:progressiveResults:completion:environment:", self->_addressBook, self->_fetchRequest, v6, v7, self->_environment);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)fetchPeopleReturningMatchInfos:(id *)a3 error:(id *)a4
{
  v5 = [(CNiOSPersonFetcher *)self fetchPeopleUsingNativeSortReturningMatchInfos:a3 error:a4];
  if ([(CNiOSPersonFetcher *)self shouldSortInMemory])
  {
    uint64_t v6 = [(CNiOSPersonFetcher *)self sortPeople:v5];

    v5 = (void *)v6;
  }

  return v5;
}

- (id)fetchPeopleUsingNativeSortReturningMatchInfos:(id *)a3 error:(id *)a4
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__9;
  objc_super v15 = __Block_byref_object_dispose__9;
  id v16 = 0;
  v9[6] = a3;
  id v10 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__CNiOSPersonFetcher_fetchPeopleUsingNativeSortReturningMatchInfos_error___block_invoke;
  v9[3] = &unk_1E56B5058;
  v9[4] = self;
  v9[5] = &v11;
  uint64_t v6 = CNBridgeABCFResultAndErrorFromBlock(&v10, (uint64_t)v9);
  id v7 = v10;
  if (a3) {
    *a3 = (id) v12[5];
  }
  if (v7)
  {

    uint64_t v6 = 0;
    if (a4) {
      *a4 = v7;
    }
  }

  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __74__CNiOSPersonFetcher_fetchPeopleUsingNativeSortReturningMatchInfos_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v4 = [*(id *)(a1 + 32) fetchRequest];
  v5 = [v4 predicate];
  uint64_t v6 = [*(id *)(a1 + 32) addressBook];
  id v7 = [*(id *)(a1 + 32) fetchRequest];
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v9 + 40);
    id v10 = (id *)(v9 + 40);
    id obj = v11;
    p_id obj = &obj;
  }
  else
  {
    p_id obj = 0;
    id v10 = 0;
  }
  uint64_t v13 = [*(id *)(a1 + 32) environment];
  uint64_t v14 = objc_msgSend(v5, "cn_copyPeopleInAddressBook:fetchRequest:matchInfos:environment:error:", v6, v7, p_obj, v13, a2);
  if (v8) {
    objc_storeStrong(v10, obj);
  }

  return v14;
}

- (BOOL)shouldSortInMemory
{
  if ([(CNiOSPersonFetchRequest *)self->_fetchRequest shouldSort])
  {
    v3 = [(CNiOSPersonFetchRequest *)self->_fetchRequest predicate];
    int v4 = objc_msgSend(v3, "cn_supportsNativeSorting") ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)sortPeople:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__CNiOSPersonFetcher_sortPeople___block_invoke;
  v5[3] = &unk_1E56B5080;
  v5[4] = self;
  v3 = [a3 sortedArrayUsingComparator:v5];

  return v3;
}

CFComparisonResult __33__CNiOSPersonFetcher_sortPeople___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 fetchRequest];
  CFComparisonResult v8 = ABPersonComparePeopleByName(v6, v5, [v7 sortOrder]);

  return v8;
}

- (CNiOSPersonFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)addressBook
{
  return self->_addressBook;
}

- (CNContactsEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_fetchRequest, 0);
}

@end