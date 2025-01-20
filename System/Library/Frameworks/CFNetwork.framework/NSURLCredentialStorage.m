@interface NSURLCredentialStorage
+ (NSURLCredentialStorage)sharedCredentialStorage;
- (BOOL)_useSystemKeychain;
- (NSDictionary)allCredentials;
- (NSDictionary)credentialsForProtectionSpace:(NSURLProtectionSpace *)space;
- (NSURLCredential)defaultCredentialForProtectionSpace:(NSURLProtectionSpace *)space;
- (NSURLCredentialStorage)init;
- (_CFURLCredentialStorage)_CFURLCredentialStorage;
- (id)_allCredentialsWithAccessControlGroup:(id)a3 includeLegacyKeychain:(BOOL)a4;
- (id)_initWithCFURLCredentialStorage:(_CFURLCredentialStorage *)a3;
- (id)_initWithIdentifier:(id)a3 private:(BOOL)a4;
- (void)__allCredentialsWithAccessControlGroup:(void *)result includeLegacyKeychain:(uint64_t)a2;
- (void)dealloc;
- (void)getCredentialsForProtectionSpace:(NSURLProtectionSpace *)protectionSpace task:(NSURLSessionTask *)task completionHandler:(void *)completionHandler;
- (void)getDefaultCredentialForProtectionSpace:(NSURLProtectionSpace *)space task:(NSURLSessionTask *)task completionHandler:(void *)completionHandler;
- (void)removeCredential:(NSURLCredential *)credential forProtectionSpace:(NSURLProtectionSpace *)space;
- (void)removeCredential:(NSURLCredential *)credential forProtectionSpace:(NSURLProtectionSpace *)space options:(NSDictionary *)options;
- (void)setCredential:(NSURLCredential *)credential forProtectionSpace:(NSURLProtectionSpace *)space;
- (void)setDefaultCredential:(NSURLCredential *)credential forProtectionSpace:(NSURLProtectionSpace *)space;
- (void)set_useSystemKeychain:(BOOL)a3;
@end

@implementation NSURLCredentialStorage

+ (NSURLCredentialStorage)sharedCredentialStorage
{
  if (+[NSURLCredentialStorage sharedCredentialStorage]::sOnce != -1) {
    dispatch_once(&+[NSURLCredentialStorage sharedCredentialStorage]::sOnce, &__block_literal_global_17361);
  }
  return (NSURLCredentialStorage *)+[NSURLCredentialStorage sharedCredentialStorage]::sStorage;
}

- (NSURLCredentialStorage)init
{
  return (NSURLCredentialStorage *)[(NSURLCredentialStorage *)self _initWithCFURLCredentialStorage:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLCredentialStorage;
  [(NSURLCredentialStorage *)&v3 dealloc];
}

void __49__NSURLCredentialStorage_sharedCredentialStorage__block_invoke()
{
  CFTypeRef v0 = CFURLCredentialStorageCreate(0);
  +[NSURLCredentialStorage sharedCredentialStorage]::sStorage = [[NSURLCredentialStorage alloc] _initWithCFURLCredentialStorage:v0];
  if (v0)
  {
    CFRelease(v0);
  }
}

- (id)_initWithCFURLCredentialStorage:(_CFURLCredentialStorage *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSURLCredentialStorage;
  v4 = [(NSURLCredentialStorage *)&v7 init];
  v5 = v4;
  if (a3 && v4)
  {
    CFRetain(a3);
    v5->_internal = (NSURLCredentialStorageInternal *)CFMakeCollectable(a3);
  }
  return v5;
}

- (void)getDefaultCredentialForProtectionSpace:(NSURLProtectionSpace *)space task:(NSURLSessionTask *)task completionHandler:(void *)completionHandler
{
  v6 = -[NSURLCredentialStorage defaultCredentialForProtectionSpace:](self, "defaultCredentialForProtectionSpace:", space, task);
  objc_super v7 = (void (*)(void *, NSURLCredential *))*((void *)completionHandler + 2);

  v7(completionHandler, v6);
}

- (void)getCredentialsForProtectionSpace:(NSURLProtectionSpace *)protectionSpace task:(NSURLSessionTask *)task completionHandler:(void *)completionHandler
{
  v6 = -[NSURLCredentialStorage credentialsForProtectionSpace:](self, "credentialsForProtectionSpace:", protectionSpace, task);
  objc_super v7 = (void (*)(void *, NSDictionary *))*((void *)completionHandler + 2);

  v7(completionHandler, v6);
}

- (void)setDefaultCredential:(NSURLCredential *)credential forProtectionSpace:(NSURLProtectionSpace *)space
{
  internal = self->_internal;
  if (internal)
  {
    v6 = [(NSURLCredential *)credential _cfurlcredential];
    objc_super v7 = [(NSURLProtectionSpace *)space _cfurlprtotectionspace];
    CFURLCredentialStorageSetDefaultCredentialForProtectionSpace((uint64_t)internal, (uint64_t)v6, (uint64_t)v7);
  }
}

- (NSURLCredential)defaultCredentialForProtectionSpace:(NSURLProtectionSpace *)space
{
  internal = self->_internal;
  if (!internal) {
    return 0;
  }
  uint64_t v4 = CFURLCredentialStorageCopyDefaultCredentialForProtectionSpace((uint64_t)internal, (uint64_t)[(NSURLProtectionSpace *)space _cfurlprtotectionspace]);
  if (!v4) {
    return 0;
  }
  v5 = (const void *)v4;
  id v6 = [[NSURLCredential alloc] _initWithCFURLCredential:v4];
  CFRelease(v5);

  return (NSURLCredential *)v6;
}

- (void)removeCredential:(NSURLCredential *)credential forProtectionSpace:(NSURLProtectionSpace *)space options:(NSDictionary *)options
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  if (internal)
  {
    v8 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
    if (options)
    {
      if ([(NSDictionary *)options objectForKey:@"NSURLCredentialStorageRemoveSynchronizableCredentials"])
      {
        keys = @"kCFCredentialStorageRemoveSynchronizableCredentials";
        values = (void *)*MEMORY[0x1E4F1CFD0];
        CFDictionaryRef v10 = CFDictionaryCreate(*v8, (const void **)&keys, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      }
      else
      {
        CFDictionaryRef v10 = 0;
      }
      internal = self->_internal;
    }
    else
    {
      CFDictionaryRef v10 = 0;
    }
    v11 = [(NSURLCredential *)credential _cfurlcredential];
    v12 = [(NSURLProtectionSpace *)space _cfurlprtotectionspace];
    uint64_t v13 = DiagnosticLogging::newMsg((uint64_t)&__block_literal_global_22, 1);
    uint64_t v14 = v13;
    if (v13
      && (*(unsigned int (**)(uint64_t, const char *, void))(*(void *)v13 + 16))(v13, "RemoveCredential", 0))
    {
      CFAllocatorRef v15 = *v8;
      if (internal)
      {
        v16 = (char *)internal + 16;
        if (URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage != -1) {
          dispatch_once(&URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage, &__block_literal_global_3_1277);
        }
      }
      else
      {
        v16 = 0;
      }
      keys = off_1ECF9A530;
      CFStringRef v17 = CFStringCreateWithCString(v15, "Store", 0x8000100u);
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      CFStringRef v34 = v17;
      if (v16)
      {
        v18 = (__CFString *)(*(uint64_t (**)(char *))(*(void *)v16 + 32))(v16);
        CFStringRef v17 = v34;
      }
      else
      {
        v18 = @"null";
      }
      (*(void (**)(uint64_t, CFStringRef, __CFString *))(*(void *)v14 + 64))(v14, v17, v18);
      if (v16 && v18) {
        CFRelease(v18);
      }
      AutoString::~AutoString((AutoString *)&keys);
      if (v12)
      {
        v19 = (char *)v12 + 16;
        if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1) {
          dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_10309);
        }
      }
      else
      {
        v19 = 0;
      }
      keys = off_1ECF9A530;
      CFStringRef v20 = CFStringCreateWithCString(v15, "Space", 0x8000100u);
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      CFStringRef v34 = v20;
      if (v19)
      {
        v21 = (__CFString *)(*(uint64_t (**)(char *))(*(void *)v19 + 32))(v19);
        CFStringRef v20 = v34;
      }
      else
      {
        v21 = @"null";
      }
      (*(void (**)(uint64_t, CFStringRef, __CFString *))(*(void *)v14 + 64))(v14, v20, v21);
      if (v19 && v21) {
        CFRelease(v21);
      }
      AutoString::~AutoString((AutoString *)&keys);
      if (v11)
      {
        v22 = (char *)v11 + 16;
        if (URLCredential::Class(void)::sOnce_URLCredential != -1) {
          dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_10148);
        }
      }
      else
      {
        v22 = 0;
      }
      keys = off_1ECF9A530;
      CFStringRef v23 = CFStringCreateWithCString(v15, "Credential", 0x8000100u);
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      CFStringRef v34 = v23;
      if (v22)
      {
        v24 = (__CFString *)(*(uint64_t (**)(char *))(*(void *)v22 + 32))(v22);
        CFStringRef v23 = v34;
      }
      else
      {
        v24 = @"null";
      }
      (*(void (**)(uint64_t, CFStringRef, __CFString *))(*(void *)v14 + 64))(v14, v23, v24);
      if (v22 && v24) {
        CFRelease(v24);
      }
      AutoString::~AutoString((AutoString *)&keys);
      keys = off_1ECF9A530;
      CFStringRef v25 = CFStringCreateWithCString(v15, "Options", 0x8000100u);
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      CFStringRef v34 = v25;
      if (v10)
      {
        CFStringRef v26 = CFCopyDescription(v10);
        CFStringRef v25 = v34;
      }
      else
      {
        CFStringRef v26 = @"null";
      }
      (*(void (**)(uint64_t, CFStringRef, CFStringRef))(*(void *)v14 + 64))(v14, v25, v26);
      if (v10 && v26) {
        CFRelease(v26);
      }
      AutoString::~AutoString((AutoString *)&keys);
      (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
    }
    BOOL v28 = !v10
       || (Value = CFDictionaryGetValue(v10, @"kCFCredentialStorageRemoveSynchronizableCredentials")) == 0
       || CFEqual(Value, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) == 0;
    if (URLCredential::Class(void)::sOnce_URLCredential != -1) {
      dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_10148);
    }
    v29 = (char *)v11 + 16;
    if (!v11) {
      v29 = 0;
    }
    if (*((_DWORD *)v29 + 9) != 4 || !v28)
    {
      if (URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage != -1) {
        dispatch_once(&URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage, &__block_literal_global_3_1277);
      }
      if (internal) {
        v31 = (char *)internal + 16;
      }
      else {
        v31 = 0;
      }
      (*(void (**)(void))(*((void *)v31 + 1) + 48))();
    }
  }
}

- (void)removeCredential:(NSURLCredential *)credential forProtectionSpace:(NSURLProtectionSpace *)space
{
  internal = self->_internal;
  if (internal)
  {
    id v6 = [(NSURLCredential *)credential _cfurlcredential];
    objc_super v7 = [(NSURLProtectionSpace *)space _cfurlprtotectionspace];
    CFURLCredentialStorageRemoveCredentialForProtectionSpace((uint64_t)internal, (uint64_t)v6, (uint64_t)v7);
  }
}

- (void)setCredential:(NSURLCredential *)credential forProtectionSpace:(NSURLProtectionSpace *)space
{
  internal = self->_internal;
  if (internal)
  {
    id v6 = [(NSURLCredential *)credential _cfurlcredential];
    objc_super v7 = [(NSURLProtectionSpace *)space _cfurlprtotectionspace];
    CFURLCredentialStorageSetCredentialForProtectionSpace((uint64_t)internal, (uint64_t)v6, (uint64_t)v7);
  }
}

- (id)_allCredentialsWithAccessControlGroup:(id)a3 includeLegacyKeychain:(BOOL)a4
{
  return -[NSURLCredentialStorage __allCredentialsWithAccessControlGroup:includeLegacyKeychain:](self, (uint64_t)a3);
}

- (void)__allCredentialsWithAccessControlGroup:(void *)result includeLegacyKeychain:(uint64_t)a2
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v2 = result;
    if (result[1])
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v5 = v2[1];
      if (a2)
      {
        if (URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage != -1) {
          dispatch_once(&URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage, &__block_literal_global_3_1277);
        }
        uint64_t v6 = v5 + 16;
        if (v5) {
          uint64_t v7 = v5 + 16;
        }
        else {
          uint64_t v7 = 0;
        }
        v8 = (void *)(*(uint64_t (**)(void))(*(void *)(v7 + 8) + 32))();
        uint64_t v9 = DiagnosticLogging::newMsg((uint64_t)&__block_literal_global_12, 1);
        if (v9)
        {
          uint64_t v10 = v9;
          if ((*(unsigned int (**)(uint64_t, const char *, void))(*(void *)v9 + 16))(v9, "CopyAllCredentialsWithAccessControlGroupIncludeLegacyKeychain", 0))
          {
            CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            if (v5)
            {
              if (URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage != -1)
              {
                CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
                dispatch_once(&URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage, &__block_literal_global_3_1277);
                CFAllocatorRef v11 = v22;
              }
            }
            else
            {
              uint64_t v6 = 0;
            }
            BOOL v28 = off_1ECF9A530;
            CFStringRef v12 = CFStringCreateWithCString(v11, "Store", 0x8000100u);
            uint64_t v30 = 0;
            uint64_t v31 = 0;
            CFStringRef v29 = v12;
            if (v6)
            {
              uint64_t v13 = (__CFString *)(*(uint64_t (**)(uint64_t))(*(void *)v6 + 32))(v6);
              CFStringRef v12 = v29;
            }
            else
            {
              uint64_t v13 = @"null";
            }
            (*(void (**)(uint64_t, CFStringRef, __CFString *))(*(void *)v10 + 64))(v10, v12, v13);
            if (v6 && v13) {
              CFRelease(v13);
            }
            AutoString::~AutoString((AutoString *)&v28);
            (*(void (**)(uint64_t, const char *, void *))(*(void *)v10 + 96))(v10, "Result", v8);
            (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
          }
        }
      }
      else
      {
        v8 = (void *)CFURLCredentialStorageCopyAllCredentials(v2[1]);
      }
      uint64_t v14 = (void *)[v8 allKeys];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v14);
            }
            v18 = *(const void **)(*((void *)&v23 + 1) + 8 * i);
            id v19 = [[NSURLProtectionSpace alloc] _initWithCFURLProtectionSpace:v18];
            CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v8, v18);
            v21 = copyNSCredentialDictForCFCredentialDict(Value);
            [v4 setObject:v21 forKey:v19];
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v15);
      }
      if (v8) {
        CFRelease(v8);
      }
      return v4;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (NSDictionary)allCredentials
{
  return (NSDictionary *)-[NSURLCredentialStorage __allCredentialsWithAccessControlGroup:includeLegacyKeychain:](self, 0);
}

- (NSDictionary)credentialsForProtectionSpace:(NSURLProtectionSpace *)space
{
  internal = self->_internal;
  if (!internal) {
    return 0;
  }
  CFDictionaryRef v4 = (const __CFDictionary *)CFURLCredentialStorageCopyCredentialsForProtectionSpace((uint64_t)internal, (uint64_t)[(NSURLProtectionSpace *)space _cfurlprtotectionspace]);
  if (!v4) {
    return 0;
  }
  CFDictionaryRef v5 = v4;
  if (!CFDictionaryGetCount(v4))
  {
    CFRelease(v5);
    return 0;
  }
  uint64_t v6 = copyNSCredentialDictForCFCredentialDict(v5);
  CFRelease(v5);

  return (NSDictionary *)v6;
}

- (void)set_useSystemKeychain:(BOOL)a3
{
  internal = self->_internal;
  if (internal)
  {
    BOOL v4 = a3;
    if (URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage != -1) {
      dispatch_once(&URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage, &__block_literal_global_3_1277);
    }
    CFDictionaryRef v5 = *(void (**)(char *, BOOL))(*((void *)internal + 3) + 72);
    v5((char *)internal + 24, v4);
  }
}

- (BOOL)_useSystemKeychain
{
  internal = self->_internal;
  if (!internal) {
    return 0;
  }
  if (URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage != -1) {
    dispatch_once(&URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage, &__block_literal_global_3_1277);
  }
  objc_super v3 = *(uint64_t (**)(char *))(*((void *)internal + 3) + 80);

  return v3((char *)internal + 24);
}

- (_CFURLCredentialStorage)_CFURLCredentialStorage
{
  return (_CFURLCredentialStorage *)self->_internal;
}

- (id)_initWithIdentifier:(id)a3 private:(BOOL)a4
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CFC8];
  if (a4) {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CFD0];
  }
  MutableDictionary = cfTypeCreateMutableDictionary(v6, a2, @"kCFURLStorageSessionIsPrivate", *v7, 0, 0);
  uint64_t v9 = _CFURLCredentialStorageCreateWithProperties(v6, (const __CFString *)a3, MutableDictionary);
  id v10 = [(NSURLCredentialStorage *)self _initWithCFURLCredentialStorage:v9];
  CFRelease(v9);
  CFRelease(MutableDictionary);
  return v10;
}

@end