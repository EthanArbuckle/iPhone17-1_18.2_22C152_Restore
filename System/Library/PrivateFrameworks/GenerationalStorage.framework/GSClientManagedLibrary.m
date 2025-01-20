@interface GSClientManagedLibrary
- (BOOL)generationsRemove:(id)a3 error:(id *)a4;
- (GSAdditionStoring)storage;
- (GSClientManagedLibrary)initWithURL:(id)a3 error:(id *)a4;
- (NSString)nameSpace;
@end

@implementation GSClientManagedLibrary

- (GSAdditionStoring)storage
{
  return (GSAdditionStoring *)self->_ts;
}

- (NSString)nameSpace
{
  return (NSString *)@"com.apple.documentVersions";
}

- (GSClientManagedLibrary)initWithURL:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (([v7 isFileURL] & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"GSClientManagedLibrary.m", 31, @"Invalid parameter not satisfying: %@", @"[url isFileURL]" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)GSClientManagedLibrary;
  v8 = [(GSClientManagedLibrary *)&v14 init];
  if (v8)
  {
    v9 = +[GSStorageManager manager];
    uint64_t v10 = [v9 temporaryStorageForItemAtURL:v7 locatedAtURL:v7 error:a4];
    ts = v8->_ts;
    v8->_ts = (GSTemporaryStorage *)v10;

    if (!v8->_ts)
    {

      v8 = 0;
    }
  }
  return v8;
}

- (BOOL)generationsRemove:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  id v7 = [(GSTemporaryStorage *)self->_ts additionsWithNames:v6 inNameSpace:@"com.apple.documentVersions" error:0];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  if (v7)
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    ts = self->_ts;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__GSClientManagedLibrary_generationsRemove_error___block_invoke;
    v13[3] = &unk_1E6C9F3D8;
    v15 = &v17;
    v16 = &v23;
    uint64_t v10 = v8;
    objc_super v14 = v10;
    [(GSTemporaryStorage *)ts removeAdditions:v7 completionHandler:v13];
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a4) {
    *a4 = (id) v18[5];
  }
  char v11 = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v11;
}

void __50__GSClientManagedLibrary_generationsRemove_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
}

@end