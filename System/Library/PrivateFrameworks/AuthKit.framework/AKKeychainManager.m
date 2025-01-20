@interface AKKeychainManager
+ (id)sharedManager;
- (AKKeychainManager)init;
- (BOOL)_unsafe_addKeychainItem:(id)a3 shouldAttemptUpdate:(BOOL)a4 error:(id *)a5;
- (BOOL)_unsafe_deleteKeychainItemWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)_unsafe_updateKeychainItemWithDescriptor:(id)a3 newItem:(id)a4 error:(id *)a5;
- (id)_unsafe_fetchKeychainItemWithDescriptor:(id)a3 error:(id *)a4;
- (id)_unsafe_fetchKeychainItemsWithDescriptor:(id)a3 error:(id *)a4;
- (void)addKeychainItem:(id)a3 completion:(id)a4;
- (void)addOrUpdateKeychainItem:(id)a3 completion:(id)a4;
- (void)deleteKeychainItemWithDescriptor:(id)a3 completion:(id)a4;
- (void)fetchKeychainItemWithDescriptor:(id)a3 completion:(id)a4;
- (void)fetchKeychainItemsWithDescriptor:(id)a3 completion:(id)a4;
- (void)updateKeychainItem:(id)a3 completion:(id)a4;
@end

@implementation AKKeychainManager

- (AKKeychainManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKKeychainManager;
  v2 = [(AKKeychainManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.authkit.keychain", 0);
    keychainQueue = v2->_keychainQueue;
    v2->_keychainQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedManager
{
  if (qword_1002725D8 != -1) {
    dispatch_once(&qword_1002725D8, &stru_10022AFE0);
  }
  v2 = (void *)qword_1002725D0;

  return v2;
}

- (void)addKeychainItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  keychainQueue = self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B5464;
  block[3] = &unk_100227A18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(keychainQueue, block);
}

- (void)addOrUpdateKeychainItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  keychainQueue = self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B559C;
  block[3] = &unk_100227A18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(keychainQueue, block);
}

- (void)updateKeychainItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  keychainQueue = self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B56D4;
  block[3] = &unk_100227A18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(keychainQueue, block);
}

- (void)fetchKeychainItemWithDescriptor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  keychainQueue = self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B5820;
  block[3] = &unk_100227A18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(keychainQueue, block);
}

- (void)fetchKeychainItemsWithDescriptor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  keychainQueue = self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B595C;
  block[3] = &unk_100227A18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(keychainQueue, block);
}

- (void)deleteKeychainItemWithDescriptor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  keychainQueue = self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B5A98;
  block[3] = &unk_100227A18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(keychainQueue, block);
}

- (BOOL)_unsafe_addKeychainItem:(id)a3 shouldAttemptUpdate:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  CFDictionaryRef v9 = [v8 itemAttributes];
  OSStatus v10 = SecItemAdd(v9, 0);
  if (v10 != -25299 || !v6)
  {
    unsigned __int8 v13 = v10 == 0;
    if (a5 && v10)
    {
      unsigned __int8 v13 = 0;
      *a5 = (id)SecCopyLastError();
    }
  }
  else
  {
    id v12 = [v8 descriptor];
    unsigned __int8 v13 = [(AKKeychainManager *)self _unsafe_updateKeychainItemWithDescriptor:v12 newItem:v8 error:a5];
  }
  return v13;
}

- (BOOL)_unsafe_updateKeychainItemWithDescriptor:(id)a3 newItem:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = [a3 attributes];
  CFDictionaryRef v9 = [v7 itemAttributes];

  id v10 = [v9 mutableCopy];
  [v10 removeObjectForKey:kSecClass];
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
  id v7 = [v6 mutableCopy];

  [v7 setObject:&__kCFBooleanTrue forKey:kSecReturnAttributes];
  [v7 setObject:&__kCFBooleanTrue forKey:kSecReturnData];
  [v7 setObject:kSecMatchLimitOne forKey:kSecMatchLimit];
  CFTypeRef result = 0;
  SecItemCopyMatching((CFDictionaryRef)v7, &result);
  if (a4) {
    *a4 = (id)SecCopyLastError();
  }
  if (result && (CFTypeID v8 = CFGetTypeID(result), v8 == CFDictionaryGetTypeID()))
  {
    CFDictionaryRef v9 = (void *)result;
    id v10 = [[AKKeychainItem alloc] initWithAttributes:result];
    char v11 = [(AKKeychainItem *)v10 descriptor];
    id v12 = [v11 itemClass];

    if (!v12)
    {
      unsigned __int8 v13 = [(AKKeychainItem *)v10 descriptor];
      objc_msgSend(v13, "setItemClass:", objc_msgSend(v5, "itemClass"));
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_unsafe_fetchKeychainItemsWithDescriptor:(id)a3 error:(id *)a4
{
  id v23 = a3;
  id v5 = [v23 attributes];
  id v6 = [v5 mutableCopy];

  [v6 setObject:&__kCFBooleanTrue forKey:kSecReturnAttributes];
  [v6 setObject:&__kCFBooleanTrue forKey:kSecReturnData];
  [v6 setObject:kSecMatchLimitAll forKey:kSecMatchLimit];
  CFTypeRef result = 0;
  SecItemCopyMatching((CFDictionaryRef)v6, &result);
  if (a4) {
    *a4 = (id)SecCopyLastError();
  }
  id v7 = objc_alloc_init((Class)NSMutableArray);
  if (result)
  {
    CFTypeID v8 = CFGetTypeID(result);
    if (v8 == CFArrayGetTypeID())
    {
      id v22 = v6;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      CFDictionaryRef v9 = (id)result;
      id v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v25;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = v14;
              v16 = [[AKKeychainItem alloc] initWithAttributes:v15];

              v17 = [(AKKeychainItem *)v16 descriptor];
              id v18 = [v17 itemClass];

              if (!v18)
              {
                v19 = [(AKKeychainItem *)v16 descriptor];
                objc_msgSend(v19, "setItemClass:", objc_msgSend(v23, "itemClass"));
              }
              objc_msgSend(v7, "addObject:", v16, v22);
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v11);
      }

      id v6 = v22;
    }
  }
  id v20 = objc_msgSend(v7, "copy", v22);

  return v20;
}

- (BOOL)_unsafe_deleteKeychainItemWithDescriptor:(id)a3 error:(id *)a4
{
  CFDictionaryRef v5 = [a3 attributes];
  OSStatus v6 = SecItemDelete(v5);
  if (a4) {
    *a4 = (id)SecCopyLastError();
  }

  return v6 == 0;
}

- (void).cxx_destruct
{
}

@end