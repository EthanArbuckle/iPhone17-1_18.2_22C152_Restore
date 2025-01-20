@interface AAFKeychainManager
- (AAFKeychainManager)init;
- (BOOL)_unsafe_deleteKeychainItemWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)_unsafe_updateKeychainItemWithDescriptor:(id)a3 newItem:(id)a4 error:(id *)a5;
- (id)_unsafe_fetchKeychainItemWithDescriptor:(id)a3 error:(id *)a4;
- (id)_unsafe_fetchKeychainItemsWithDescriptor:(id)a3 error:(id *)a4;
- (id)keychainItemForDescriptor:(id)a3 error:(id *)a4;
- (id)keychainItemsForDescriptor:(id)a3 error:(id *)a4;
- (void)_unsafe_addKeychainItem:(id)a3 shouldAttemptUpdate:(BOOL)a4 error:(id *)a5;
- (void)addKeychainItem:(id)a3 error:(id *)a4;
- (void)addOrUpdateKeychainItem:(id)a3 error:(id *)a4;
- (void)deleteKeychainItemsForDescriptor:(id)a3 error:(id *)a4;
- (void)updateKeychainItem:(id)a3 error:(id *)a4;
@end

@implementation AAFKeychainManager

- (AAFKeychainManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)AAFKeychainManager;
  v2 = [(AAFKeychainManager *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.aaaf.keychain", v3);
    keychainQueue = v2->_keychainQueue;
    v2->_keychainQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)addKeychainItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  keychainQueue = self->_keychainQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AAFKeychainManager_addKeychainItem_error___block_invoke;
  block[3] = &unk_1E6CFA6D8;
  block[4] = self;
  id v8 = v6;
  id v10 = v8;
  v11 = &v12;
  dispatch_sync(keychainQueue, block);
  if (a4) {
    *a4 = (id) v13[5];
  }

  _Block_object_dispose(&v12, 8);
}

void __44__AAFKeychainManager_addKeychainItem_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_unsafe_addKeychainItem:shouldAttemptUpdate:error:", v1, 0, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (void)addOrUpdateKeychainItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  keychainQueue = self->_keychainQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AAFKeychainManager_addOrUpdateKeychainItem_error___block_invoke;
  block[3] = &unk_1E6CFA6D8;
  block[4] = self;
  id v8 = v6;
  id v10 = v8;
  v11 = &v12;
  dispatch_sync(keychainQueue, block);
  if (a4) {
    *a4 = (id) v13[5];
  }

  _Block_object_dispose(&v12, 8);
}

void __52__AAFKeychainManager_addOrUpdateKeychainItem_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_unsafe_addKeychainItem:shouldAttemptUpdate:error:", v1, 1, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (void)updateKeychainItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  keychainQueue = self->_keychainQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AAFKeychainManager_updateKeychainItem_error___block_invoke;
  block[3] = &unk_1E6CFA6D8;
  block[4] = self;
  id v8 = v6;
  id v10 = v8;
  v11 = &v12;
  dispatch_sync(keychainQueue, block);
  if (a4) {
    *a4 = (id) v13[5];
  }

  _Block_object_dispose(&v12, 8);
}

void __47__AAFKeychainManager_updateKeychainItem_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) descriptor];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "_unsafe_updateKeychainItemWithDescriptor:newItem:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
}

- (id)keychainItemForDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  keychainQueue = self->_keychainQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__AAFKeychainManager_keychainItemForDescriptor_error___block_invoke;
  v11[3] = &unk_1E6CFA700;
  v13 = &v21;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  uint64_t v14 = &v15;
  dispatch_sync(keychainQueue, v11);
  if (a4) {
    *a4 = (id) v16[5];
  }
  id v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __54__AAFKeychainManager_keychainItemForDescriptor_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = objc_msgSend(v2, "_unsafe_fetchKeychainItemWithDescriptor:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  objc_super v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)keychainItemsForDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  keychainQueue = self->_keychainQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__AAFKeychainManager_keychainItemsForDescriptor_error___block_invoke;
  v11[3] = &unk_1E6CFA700;
  v13 = &v21;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  uint64_t v14 = &v15;
  dispatch_sync(keychainQueue, v11);
  if (a4) {
    *a4 = (id) v16[5];
  }
  id v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __55__AAFKeychainManager_keychainItemsForDescriptor_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = objc_msgSend(v2, "_unsafe_fetchKeychainItemsWithDescriptor:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  objc_super v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)deleteKeychainItemsForDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  keychainQueue = self->_keychainQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__AAFKeychainManager_deleteKeychainItemsForDescriptor_error___block_invoke;
  block[3] = &unk_1E6CFA6D8;
  block[4] = self;
  id v8 = v6;
  id v10 = v8;
  v11 = &v12;
  dispatch_sync(keychainQueue, block);
  if (a4) {
    *a4 = (id) v13[5];
  }

  _Block_object_dispose(&v12, 8);
}

void __61__AAFKeychainManager_deleteKeychainItemsForDescriptor_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_unsafe_deleteKeychainItemWithDescriptor:error:", v1, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (void)_unsafe_addKeychainItem:(id)a3 shouldAttemptUpdate:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v12 = a3;
  CFDictionaryRef v8 = [v12 itemAttributes];
  OSStatus v9 = SecItemAdd(v8, 0);
  if (v9 != -25299 || !v6)
  {
    if (a5 && v9) {
      *a5 = (id)SecCopyLastError();
    }
  }
  else
  {
    v11 = [v12 descriptor];
    [(AAFKeychainManager *)self _unsafe_updateKeychainItemWithDescriptor:v11 newItem:v12 error:a5];
  }
}

- (BOOL)_unsafe_updateKeychainItemWithDescriptor:(id)a3 newItem:(id)a4 error:(id *)a5
{
  id v7 = a4;
  CFDictionaryRef v8 = [a3 attributes];
  OSStatus v9 = [v7 itemAttributes];

  id v10 = (void *)[v9 mutableCopy];
  [v10 removeObjectForKey:*MEMORY[0x1E4F3B978]];
  char v11 = SecItemUpdateWithError();
  if (a5) {
    *a5 = 0;
  }

  return v11;
}

- (id)_unsafe_fetchKeychainItemWithDescriptor:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v6 = [v5 attributes];
  id v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = MEMORY[0x1E4F1CC38];
  [v7 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3BC68]];
  [v7 setObject:v8 forKey:*MEMORY[0x1E4F3BC70]];
  [v7 setObject:*MEMORY[0x1E4F3BB90] forKey:*MEMORY[0x1E4F3BB80]];
  CFTypeRef result = 0;
  OSStatus v9 = SecItemCopyMatching((CFDictionaryRef)v7, &result);
  if (a4 && v9)
  {
    *a4 = (id)SecCopyLastError();
    id v10 = _AAFLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AAFKeychainManager _unsafe_fetchKeychainItemWithDescriptor:error:]((uint64_t)a4, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  if (result && (CFTypeID v17 = CFGetTypeID(result), v17 == CFDictionaryGetTypeID()))
  {
    v18 = (void *)result;
    v19 = [[AAFKeychainItem alloc] initWithAttributes:result];
    id v20 = [(AAFKeychainItem *)v19 descriptor];
    uint64_t v21 = [v20 itemClass];

    if (!v21)
    {
      v22 = [(AAFKeychainItem *)v19 descriptor];
      objc_msgSend(v22, "setItemClass:", objc_msgSend(v5, "itemClass"));
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_unsafe_fetchKeychainItemsWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v5 = [v32 attributes];
  BOOL v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = MEMORY[0x1E4F1CC38];
  [v6 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3BC68]];
  [v6 setObject:v7 forKey:*MEMORY[0x1E4F3BC70]];
  [v6 setObject:*MEMORY[0x1E4F3BB88] forKey:*MEMORY[0x1E4F3BB80]];
  CFTypeRef result = 0;
  OSStatus v8 = SecItemCopyMatching((CFDictionaryRef)v6, &result);
  if (a4 && v8)
  {
    *a4 = (id)SecCopyLastError();
    OSStatus v9 = _AAFLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AAFKeychainManager _unsafe_fetchKeychainItemsWithDescriptor:error:]((uint64_t)a4, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (result)
  {
    CFTypeID v17 = CFGetTypeID(result);
    if (v17 == CFArrayGetTypeID())
    {
      v31 = v6;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v18 = (id)result;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v34 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v24 = v23;
              v25 = [[AAFKeychainItem alloc] initWithAttributes:v24];

              id v26 = [(AAFKeychainItem *)v25 descriptor];
              uint64_t v27 = [v26 itemClass];

              if (!v27)
              {
                v28 = [(AAFKeychainItem *)v25 descriptor];
                objc_msgSend(v28, "setItemClass:", objc_msgSend(v32, "itemClass"));
              }
              objc_msgSend(v16, "addObject:", v25, v31);
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v20);
      }

      BOOL v6 = v31;
    }
  }
  v29 = objc_msgSend(v16, "copy", v31);

  return v29;
}

- (BOOL)_unsafe_deleteKeychainItemWithDescriptor:(id)a3 error:(id *)a4
{
  CFDictionaryRef v5 = [a3 attributes];
  OSStatus v6 = SecItemDelete(v5);
  OSStatus v7 = v6;
  if (a4 && v6)
  {
    *a4 = (id)SecCopyLastError();
    OSStatus v8 = _AAFLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AAFKeychainManager _unsafe_deleteKeychainItemWithDescriptor:error:]((uint64_t)a4, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  return v7 == 0;
}

- (void).cxx_destruct
{
}

- (void)_unsafe_fetchKeychainItemWithDescriptor:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_unsafe_fetchKeychainItemsWithDescriptor:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_unsafe_deleteKeychainItemWithDescriptor:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end