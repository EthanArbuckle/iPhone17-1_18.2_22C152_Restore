@interface CNiOSAddressBook
+ (void)initialize;
+ (void)newAddressBookWithDelegateInfo:(id)a3;
+ (void)newAddressBookWithURL:(id)a3;
+ (void)newInMemoryAddressBook;
- (BOOL)addressBookIsShared;
- (CNiOSAddressBook)init;
- (CNiOSAddressBook)initWithAddressBookProvider:(id)a3;
- (CNiOSAddressBook)initWithContactsEnvironment:(id)a3;
- (NSMutableSet)addressBookPool;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_source)memoryMonitoringSource;
- (id)addressBookProvider;
- (id)performAsynchronousWorkWithInvalidatedAddressBook:(id)a3;
- (id)performSynchronousWorkWithInvalidatedAddressBook:(id)a3;
- (id)resultWithInvalidatedAddressBook:(id)a3;
- (void)flushPool;
- (void)popAddressBook;
- (void)preparedAddressBook:(void *)a3;
- (void)pushAddressBook:(void *)a3;
@end

@implementation CNiOSAddressBook

uint64_t __70__CNiOSAddressBook_performAsynchronousWorkWithInvalidatedAddressBook___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushAddressBook:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

uint64_t __70__CNiOSAddressBook_performAsynchronousWorkWithInvalidatedAddressBook___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) popAddressBook];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)popAddressBook
{
  v3 = [(CNiOSAddressBook *)self addressBookPool];
  v4 = (const void *)[v3 anyObject];
  if (!v4 || (CFTypeRef v5 = CFRetain(v4)) == 0)
  {
    CFTypeRef v6 = 0;
    goto LABEL_6;
  }
  CFTypeRef v6 = CFAutorelease(v5);

  if (v6)
  {
    v3 = [(CNiOSAddressBook *)self addressBookPool];
    [v3 removeObject:v6];
LABEL_6:
  }
  return (void *)v6;
}

- (void)pushAddressBook:(void *)a3
{
  if (a3)
  {
    CFTypeRef v5 = [(CNiOSAddressBook *)self addressBookPool];
    unint64_t v6 = [v5 count];

    if (v6 <= 1)
    {
      MEMORY[0x192FD2650](a3);
      id v7 = [(CNiOSAddressBook *)self addressBookPool];
      [v7 addObject:a3];
    }
  }
}

- (NSMutableSet)addressBookPool
{
  return self->_addressBookPool;
}

- (id)performSynchronousWorkWithInvalidatedAddressBook:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__CNiOSAddressBook_performSynchronousWorkWithInvalidatedAddressBook___block_invoke;
  v8[3] = &unk_1E56B85D0;
  id v9 = v4;
  id v5 = v4;
  unint64_t v6 = [(CNiOSAddressBook *)self performAsynchronousWorkWithInvalidatedAddressBook:v8];

  return v6;
}

void __69__CNiOSAddressBook_performSynchronousWorkWithInvalidatedAddressBook___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void (**)(uint64_t, uint64_t))(v4 + 16);
  unint64_t v6 = a3;
  v5(v4, a2);
  v6[2]();
}

void __70__CNiOSAddressBook_performAsynchronousWorkWithInvalidatedAddressBook___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) accessQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__CNiOSAddressBook_performAsynchronousWorkWithInvalidatedAddressBook___block_invoke_3;
  v3[3] = &unk_1E56B85F8;
  long long v4 = *(_OWORD *)(a1 + 32);
  dispatch_sync(v2, v3);
}

- (id)performAsynchronousWorkWithInvalidatedAddressBook:(id)a3
{
  long long v4 = (void (**)(id, void *, void *))a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  id v5 = [(CNiOSAddressBook *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__CNiOSAddressBook_performAsynchronousWorkWithInvalidatedAddressBook___block_invoke;
  block[3] = &unk_1E56B3F48;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(v5, block);

  unint64_t v6 = [(CNiOSAddressBook *)self preparedAddressBook:v14[3]];
  v14[3] = (uint64_t)v6;
  if (v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__CNiOSAddressBook_performAsynchronousWorkWithInvalidatedAddressBook___block_invoke_2;
    v11[3] = &unk_1E56B85F8;
    v11[4] = self;
    v11[5] = &v13;
    v4[2](v4, v6, v11);
    id v7 = [MEMORY[0x1E4F5A4E0] successWithValue:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F5A4E0];
    id v9 = +[CNErrorFactory errorWithCode:100];
    id v7 = [v8 failureWithError:v9];
  }
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)preparedAddressBook:(void *)a3
{
  if (a3) {
    return a3;
  }
  long long v4 = [(CNiOSAddressBook *)self addressBookProvider];
  id v5 = (void *)v4[2]();

  return v5;
}

- (id)addressBookProvider
{
  return self->_addressBookProvider;
}

- (CNiOSAddressBook)initWithContactsEnvironment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if ([v4 useInMemoryStores])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__CNiOSAddressBook_initWithContactsEnvironment___block_invoke;
    aBlock[3] = &__block_descriptor_40_e6__v8__0lu32l8;
    aBlock[4] = v5;
    unint64_t v6 = _Block_copy(aBlock);
  }
  else
  {
    id v7 = [v4 delegateInfos];

    if (v7)
    {
      v8 = [v4 delegateInfos];
      id v9 = [v8 firstObject];

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __48__CNiOSAddressBook_initWithContactsEnvironment___block_invoke_2;
      v18[3] = &unk_1E56B8558;
      v19 = v9;
      uint64_t v20 = v5;
      id v10 = v9;
      unint64_t v6 = _Block_copy(v18);
      v11 = v19;
    }
    else
    {
      v12 = [v4 baseURL];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __48__CNiOSAddressBook_initWithContactsEnvironment___block_invoke_3;
      v15[3] = &unk_1E56B8558;
      uint64_t v16 = v12;
      uint64_t v17 = v5;
      id v10 = v12;
      unint64_t v6 = _Block_copy(v15);
      v11 = v16;
    }
  }
  uint64_t v13 = [(CNiOSAddressBook *)self initWithAddressBookProvider:v6];

  return v13;
}

- (CNiOSAddressBook)initWithAddressBookProvider:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CNiOSAddressBook;
  id v5 = [(CNiOSAddressBook *)&v22 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v7 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v6;

    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.contacts.CNiOSAddressBook", v8);
    id v10 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v9;

    uint64_t v11 = [v4 copy];
    v12 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v11;

    uint64_t v13 = dispatch_get_global_queue(25, 0);
    dispatch_source_t v14 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 6uLL, v13);
    uint64_t v15 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v14;

    objc_initWeak(&location, v5);
    uint64_t v16 = *((void *)v5 + 5);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __48__CNiOSAddressBook_initWithAddressBookProvider___block_invoke;
    v19[3] = &unk_1E56B8580;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v16, v19);
    dispatch_resume(*((dispatch_object_t *)v5 + 5));
    id v17 = v5;
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return (CNiOSAddressBook *)v5;
}

CFTypeRef __48__CNiOSAddressBook_initWithContactsEnvironment___block_invoke_3(uint64_t a1)
{
  CFTypeRef result = (CFTypeRef)[*(id *)(a1 + 40) newAddressBookWithURL:*(void *)(a1 + 32)];
  if (result)
  {
    return CFAutorelease(result);
  }
  return result;
}

+ (void)newAddressBookWithURL:(id)a3
{
  CFErrorRef error = 0;
  v3 = [a3 path];
  id v4 = [v3 stringByAppendingString:@"/"];

  if ([v4 length]) {
    uint64_t v5 = ABAddressBookCreateWithDatabaseDirectory();
  }
  else {
    uint64_t v5 = (uint64_t)ABAddressBookCreateWithOptions(0, &error);
  }
  id v6 = (void *)v5;
  if (!v5) {
    NSLog(&cfstr_FailedToCreate_0.isa, error);
  }
  ABAddressBookSetUsedByContacts();

  return v6;
}

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CNiOSAddressBook;
  objc_msgSendSuper2(&v2, sel_initialize);
  ABInitialize();
}

+ (void)newInMemoryAddressBook
{
  objc_super v2 = (void *)ABAddressBookCreateWithDatabaseDirectory();
  if (!v2) {
    NSLog(&cfstr_FailedToCreate.isa);
  }
  ABAddressBookSetUsedByContacts();
  return v2;
}

+ (void)newAddressBookWithDelegateInfo:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 altDSID];
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v9 = *MEMORY[0x1E4F498C8];
    v10[0] = v3;
    CFDictionaryRef v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    CFDictionaryRef v5 = (const __CFDictionary *)MEMORY[0x1E4F1CC08];
  }
  CFErrorRef error = 0;
  ABAddressBookRef v6 = ABAddressBookCreateWithOptions(v5, &error);
  if (!v6) {
    NSLog(&cfstr_FailedToCreate_0.isa, error);
  }
  ABAddressBookSetUsedByContacts();

  return (void *)v6;
}

- (CNiOSAddressBook)init
{
  uint64_t v3 = +[CNContactsEnvironment currentEnvironment];
  id v4 = [(CNiOSAddressBook *)self initWithContactsEnvironment:v3];

  return v4;
}

CFTypeRef __48__CNiOSAddressBook_initWithContactsEnvironment___block_invoke(uint64_t a1)
{
  CFTypeRef result = (CFTypeRef)[*(id *)(a1 + 32) newInMemoryAddressBook];
  if (result)
  {
    return CFAutorelease(result);
  }
  return result;
}

CFTypeRef __48__CNiOSAddressBook_initWithContactsEnvironment___block_invoke_2(uint64_t a1)
{
  CFTypeRef result = (CFTypeRef)[*(id *)(a1 + 40) newAddressBookWithDelegateInfo:*(void *)(a1 + 32)];
  if (result)
  {
    return CFAutorelease(result);
  }
  return result;
}

void __48__CNiOSAddressBook_initWithAddressBookProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained flushPool];
}

- (id)resultWithInvalidatedAddressBook:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__26;
  objc_super v22 = __Block_byref_object_dispose__26;
  id v23 = 0;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  dispatch_source_t v14 = __53__CNiOSAddressBook_resultWithInvalidatedAddressBook___block_invoke;
  uint64_t v15 = &unk_1E56B85A8;
  id v17 = &v18;
  id v5 = v4;
  id v16 = v5;
  ABAddressBookRef v6 = [(CNiOSAddressBook *)self performSynchronousWorkWithInvalidatedAddressBook:&v12];
  id v7 = (void *)MEMORY[0x1E4F5A4E0];
  uint64_t v8 = v19[5];
  uint64_t v9 = objc_msgSend(v6, "error", v12, v13, v14, v15);
  id v10 = [v7 resultWithValue:v8 orError:v9];

  _Block_object_dispose(&v18, 8);

  return v10;
}

uint64_t __53__CNiOSAddressBook_resultWithInvalidatedAddressBook___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return MEMORY[0x1F41817F8]();
}

- (void)flushPool
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__26;
  v5[4] = __Block_byref_object_dispose__26;
  id v6 = 0;
  uint64_t v3 = [(CNiOSAddressBook *)self accessQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__CNiOSAddressBook_flushPool__block_invoke;
  v4[3] = &unk_1E56B3F48;
  v4[4] = self;
  v4[5] = v5;
  dispatch_sync(v3, v4);

  _Block_object_dispose(v5, 8);
}

void __29__CNiOSAddressBook_flushPool__block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) addressBookPool];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) addressBookPool];
  [v6 removeAllObjects];
}

- (OS_dispatch_source)memoryMonitoringSource
{
  return self->_memoryMonitoringSource;
}

- (BOOL)addressBookIsShared
{
  return self->_addressBookIsShared;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryMonitoringSource, 0);
  objc_storeStrong(&self->_addressBookProvider, 0);
  objc_storeStrong((id *)&self->_addressBookPool, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end