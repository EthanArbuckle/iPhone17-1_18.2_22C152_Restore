@interface MDKeyRing
+ (id)defaultKeyRing;
- (BOOL)createKeychainItemForKey:(id)a3;
- (MDKeyRing)init;
- (NSMutableDictionary)keysByUUID;
- (__CFUUID)_createKeyUUIDWithAccount:(id)a3 password:(id)a4;
- (__SecKey)getKey:(id)a3;
- (id)allKeyUUIDs;
- (id)copyDecryptedData:(id)a3 withKeyUUID:(id)a4 iv1:(unsigned int)a5 iv2:(unsigned int)a6;
- (id)copyDesignatedKeyUUID;
- (id)copyEncryptedData:(id)a3 withKeyUUID:(id)a4 iv1:(unsigned int)a5 iv2:(unsigned int)a6;
- (id)copyPrivateKeyQuery:(id)a3;
- (id)createRandomAESKey;
- (id)createRandomUUID;
- (id)dictionaryToSecItemFormat:(id)a3;
- (id)fetchKeyFromKeychain:(id)a3;
- (id)secItemFormatToDictionary:(id)a3;
- (int)restoreFromExistingKey:(id)a3;
- (void)dealloc;
- (void)scheduleAccessToKey:(__CFUUID *)a3 onQueue:(id)global_queue usingBlock:(id)a5;
- (void)setKeysByUUID:(id)a3;
- (void)writeToKeychain:(id)a3;
@end

@implementation MDKeyRing

- (id)createRandomUUID
{
  uint64_t v2 = 0;
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = 0;
  v4[1] = 0;
  do
  {
    *(_DWORD *)((char *)v4 + v2) = arc4random();
    v2 += 4;
  }
  while (v2 != 16);
  return (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v4];
}

- (__CFUUID)_createKeyUUIDWithAccount:(id)a3 password:(id)a4
{
  *(void *)&md.byte0 = 0;
  *(void *)&md.byte8 = 0;
  memset(&v11, 0, sizeof(v11));
  CC_MD5_Init(&v11);
  CC_MD5_Update(&v11, "obvious", 8u);
  v6 = (const char *)[a3 UTF8String];
  int v7 = strlen(v6);
  CC_MD5_Update(&v11, v6, v7 + 1);
  v8 = (const char *)[a4 UTF8String];
  CC_LONG v9 = strlen(v8);
  CC_MD5_Update(&v11, v8, v9);
  CC_MD5_Final(&md.byte0, &v11);
  md.byte6 = md.byte6 & 0xF | 0x30;
  md.byte8 = md.byte8 & 0x3F | 0x80;
  return CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], md);
}

- (MDKeyRing)init
{
  v11.receiver = self;
  v11.super_class = (Class)MDKeyRing;
  CFTypeRef result = 0;
  uint64_t v2 = [(MDKeyRing *)&v11 init];
  if (v2)
  {
    v2->_keysByUUID = (NSMutableDictionary *)objc_opt_new();
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v3 setObject:*MEMORY[0x263F171E0] forKey:*MEMORY[0x263F171B8]];
    [v3 setObject:*MEMORY[0x263F17408] forKey:*MEMORY[0x263F17400]];
    [v3 setObject:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F17518]];
    addStandardKeychainAttributesToDictionary(v3);
    uint64_t v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);

    v5 = (void *)result;
    if (result)
    {
      if (v4)
      {
        NSLog(&cfstr_Secitemcopymat.isa, v4);
        v5 = (void *)result;
      }
      uint64_t v6 = [v5 indexesOfObjectsPassingTest:&__block_literal_global_1];
      v10[0] = 0;
      v10[1] = v10;
      v10[2] = 0x3052000000;
      v10[3] = __Block_byref_object_copy_;
      v10[4] = __Block_byref_object_dispose_;
      v10[5] = 0;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __17__MDKeyRing_init__block_invoke_9;
      v9[3] = &unk_26525E620;
      v9[4] = v2;
      v9[5] = v10;
      [(id)result enumerateObjectsAtIndexes:v6 options:0 usingBlock:v9];
      CFRelease(result);
      CFTypeRef result = 0;
      _Block_object_dispose(v10, 8);
    }
    if (!v2->_designatedKeyUUID)
    {
      uint64_t v7 = [(MDKeyRing *)v2 createRandomUUID];
      v2->_designatedKeyUUID = (NSUUID *)v7;
      [(MDKeyRing *)v2 fetchKeyFromKeychain:v7];
    }
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.metadata.MDRemoteKeyRing", 0);
  }
  if (result) {
    CFRelease(result);
  }
  return v2;
}

uint64_t __17__MDKeyRing_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)[a2 objectForKey:*MEMORY[0x263F17000]];
  if (v2 == (void *)*MEMORY[0x263EFFD08]) {
    uint64_t v2 = 0;
  }
  return [v2 hasPrefix:@"Spotlight Metadata Privacy"];
}

void __17__MDKeyRing_init__block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 objectForKey:*MEMORY[0x263F16EE0]];
  uint64_t v5 = *MEMORY[0x263EFFD08];
  if (v4) {
    BOOL v6 = v4 == v5;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return;
  }
  uint64_t v7 = (void *)v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    if ([v7 length] != 16)
    {
      v12 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
      CC_LONG v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v12];

      goto LABEL_11;
    }
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263F08C38]), "initWithUUIDBytes:", objc_msgSend(v7, "bytes"));
  }
  CC_LONG v9 = (void *)v8;
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v5 forKey:v8];
LABEL_11:
  uint64_t v10 = *(void *)(a1 + 32);
  objc_super v11 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  updateDesignatedUUIDIfNewer(v10, a2, v9, v11);
}

+ (id)defaultKeyRing
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__MDKeyRing_defaultKeyRing__block_invoke;
  block[3] = &unk_26525E648;
  block[4] = a1;
  if (defaultKeyRing_once != -1) {
    dispatch_once(&defaultKeyRing_once, block);
  }
  id result = (id)defaultKeyRing_sKeyRing;
  if (!defaultKeyRing_sKeyRing) {
    return objc_alloc_init((Class)a1);
  }
  return result;
}

id __27__MDKeyRing_defaultKeyRing__block_invoke(uint64_t a1)
{
  id result = objc_alloc_init(*(Class *)(a1 + 32));
  defaultKeyRing_sKeyRing = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  designatedKeyUUID = self->_designatedKeyUUID;
  if (designatedKeyUUID) {

  }
  keysByUUID = self->_keysByUUID;
  if (keysByUUID) {

  }
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v6.receiver = self;
  v6.super_class = (Class)MDKeyRing;
  [(MDKeyRing *)&v6 dealloc];
}

- (id)allKeyUUIDs
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  CC_LONG v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __24__MDKeyRing_allKeyUUIDs__block_invoke;
  v5[3] = &unk_26525E670;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __24__MDKeyRing_allKeyUUIDs__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 24) allKeys];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)copyDesignatedKeyUUID
{
  return self->_designatedKeyUUID;
}

- (__SecKey)getKey:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  if (a3)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __20__MDKeyRing_getKey___block_invoke;
    block[3] = &unk_26525E698;
    void block[5] = a3;
    block[6] = &v7;
    block[4] = self;
    dispatch_sync(queue, block);
    uint64_t v4 = (__SecKey *)v8[3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __20__MDKeyRing_getKey___block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x263EF8340];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == *MEMORY[0x263EFFD08])
  {
    v5[0] = 0;
    v5[1] = 0;
    [*(id *)(a1 + 40) getUUIDBytes:v5];
    uint64_t v2 = (void *)[MEMORY[0x263EFF8F8] dataWithBytes:v5 length:16];
    CFDictionaryRef v3 = (const __CFDictionary *)objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", *MEMORY[0x263F17410], *MEMORY[0x263F17400], *MEMORY[0x263F171E0], *MEMORY[0x263F171B8], *MEMORY[0x263F16F88], *MEMORY[0x263F16F68], v2, *MEMORY[0x263F16EE0], *MEMORY[0x263EFFB40], *MEMORY[0x263F17530], 0, 0);

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    SecItemCopyMatching(v3, (CFTypeRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v4)
    {
      [*(id *)(*(void *)(a1 + 32) + 24) setObject:v4 forKey:*(void *)(a1 + 40)];
      CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    }
  }
}

- (void)scheduleAccessToKey:(__CFUUID *)a3 onQueue:(id)global_queue usingBlock:(id)a5
{
  if (!global_queue)
  {
    qos_class_t v8 = qos_class_self();
    global_queue = dispatch_get_global_queue(v8, 0);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__MDKeyRing_scheduleAccessToKey_onQueue_usingBlock___block_invoke;
  block[3] = &unk_26525E6C0;
  void block[5] = a5;
  block[6] = a3;
  block[4] = self;
  dispatch_async((dispatch_queue_t)global_queue, block);
}

uint64_t __52__MDKeyRing_scheduleAccessToKey_onQueue_usingBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) getKey:*(void *)(a1 + 48)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (int)restoreFromExistingKey:(id)a3
{
  CFTypeRef result = 0;
  CFDictionaryRef v5 = -[MDKeyRing copyPrivateKeyQuery:](self, "copyPrivateKeyQuery:");
  OSStatus v6 = SecItemCopyMatching(v5, &result);

  uint64_t v7 = [(MDKeyRing *)self keysByUUID];
  if (!v7)
  {
    uint64_t v7 = (NSMutableDictionary *)objc_opt_new();
    [(MDKeyRing *)self setKeysByUUID:v7];
  }
  uint64_t v8 = [(NSMutableDictionary *)v7 objectForKey:a3];
  if (!v8 || (uint64_t v9 = (void *)v8, v8 == *MEMORY[0x263EFFD08]))
  {
    uint64_t v9 = objc_opt_new();
    [(NSMutableDictionary *)v7 setObject:v9 forKey:a3];
  }
  CFTypeRef v10 = result;
  if (!v6 && result)
  {
    [v9 setObject:result forKey:*MEMORY[0x263F175A8]];
    CFTypeRef v10 = result;
  }
  if (v10) {
    CFRelease(v10);
  }
  return v6;
}

- (id)copyPrivateKeyQuery:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v4 setObject:*MEMORY[0x263F171E0] forKey:*MEMORY[0x263F171B8]];
  uint64_t v5 = [a3 MDUUIDData];
  [v4 setObject:v5 forKey:*MEMORY[0x263F16EE0]];
  addStandardKeychainAttributesToDictionary(v4);
  return v4;
}

- (id)fetchKeyFromKeychain:(id)a3
{
  int v5 = -[MDKeyRing restoreFromExistingKey:](self, "restoreFromExistingKey:");
  if (v5)
  {
    if (v5 == -25300)
    {
      if ([(MDKeyRing *)self createKeychainItemForKey:a3])
      {
        [(MDKeyRing *)self writeToKeychain:a3];
        [(MDKeyRing *)self restoreFromExistingKey:a3];
        goto LABEL_5;
      }
    }
    else
    {
      BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v9) {
        -[MDKeyRing fetchKeyFromKeychain:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    return 0;
  }
LABEL_5:
  OSStatus v6 = (void *)[(NSMutableDictionary *)[(MDKeyRing *)self keysByUUID] objectForKey:a3];
  uint64_t v7 = *MEMORY[0x263F175A8];
  return (id)[v6 objectForKey:v7];
}

- (id)createRandomAESKey
{
  uint64_t v2 = 0;
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = 0;
  v4[1] = 0;
  do
  {
    *(_DWORD *)((char *)v4 + v2) = arc4random();
    v2 += 4;
  }
  while (v2 != 16);
  return (id)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v4 length:16];
}

- (BOOL)createKeychainItemForKey:(id)a3
{
  v27[2] = *MEMORY[0x263EF8340];
  int v5 = [(MDKeyRing *)self keysByUUID];
  if (!v5)
  {
    int v5 = (NSMutableDictionary *)objc_opt_new();
    [(MDKeyRing *)self setKeysByUUID:v5];
  }
  OSStatus v6 = (void *)[(NSMutableDictionary *)v5 objectForKey:a3];
  if (!v6)
  {
    OSStatus v6 = objc_opt_new();
    [(NSMutableDictionary *)v5 setObject:v6 forKey:a3];
  }
  if ([v6 count])
  {
    if (SecItemDelete((CFDictionaryRef)[(MDKeyRing *)self dictionaryToSecItemFormat:v6]))
    {
      BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v7) {
        -[MDKeyRing createKeychainItemForKey:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  id v15 = [(MDKeyRing *)self createRandomAESKey];
  if (v15)
  {
    [v6 setObject:v15 forKey:*MEMORY[0x263F175A8]];
    addStandardKeychainAttributesToDictionary(v6);
    uint64_t v16 = [NSString stringWithFormat:@"%@ (%@)", @"Spotlight Metadata Privacy", objc_msgSend(a3, "UUIDString")];
    [v6 setObject:v16 forKey:*MEMORY[0x263F17000]];
    v27[0] = 0;
    v27[1] = 0;
    [a3 getUUIDBytes:v27];
    uint64_t v17 = [MEMORY[0x263EFF8F8] dataWithBytes:v27 length:16];
    [v6 setObject:v17 forKey:*MEMORY[0x263F16EE0]];
  }
  else
  {
    BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v18) {
      -[MDKeyRing createKeychainItemForKey:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  return v15 != 0;
}

- (void)writeToKeychain:(id)a3
{
  CFTypeRef result = 0;
  id v5 = -[MDKeyRing copyPrivateKeyQuery:](self, "copyPrivateKeyQuery:");
  if (!SecItemCopyMatching((CFDictionaryRef)v5, &result))
  {
    if (result)
    {
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (TypeID == CFGetTypeID(result))
      {
        BOOL v7 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:result];
        uint64_t v8 = *MEMORY[0x263F171B8];
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(v5, "objectForKey:", *MEMORY[0x263F171B8]), *MEMORY[0x263F171B8]);
        id v9 = [(MDKeyRing *)self dictionaryToSecItemFormat:[(NSMutableDictionary *)[(MDKeyRing *)self keysByUUID] objectForKey:a3]];
        [v9 removeObjectForKey:v8];
        if (SecItemUpdate((CFDictionaryRef)v7, (CFDictionaryRef)v9))
        {
          BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v10) {
            -[MDKeyRing writeToKeychain:](v10, v11, v12, v13, v14, v15, v16, v17);
          }
        }
        goto LABEL_15;
      }
    }
  }
  uint64_t v18 = [(NSMutableDictionary *)[(MDKeyRing *)self keysByUUID] objectForKey:a3];
  OSStatus v19 = SecItemAdd((CFDictionaryRef)[(MDKeyRing *)self dictionaryToSecItemFormat:v18], 0);
  if (v19 == -25299)
  {
    if (SecItemDelete((CFDictionaryRef)[(MDKeyRing *)self dictionaryToSecItemFormat:v18])) {
      goto LABEL_11;
    }
    OSStatus v19 = SecItemAdd((CFDictionaryRef)[(MDKeyRing *)self dictionaryToSecItemFormat:v18], 0);
  }
  if (v19)
  {
LABEL_11:
    BOOL v20 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v20) {
      -[MDKeyRing writeToKeychain:](v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }
  if (result) {
    CFRelease(result);
  }
LABEL_15:
}

- (id)dictionaryToSecItemFormat:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:");
  [v4 setObject:*MEMORY[0x263F171E0] forKey:*MEMORY[0x263F171B8]];
  uint64_t v5 = *MEMORY[0x263F175A8];
  uint64_t v6 = [a3 objectForKey:*MEMORY[0x263F175A8]];
  if (v6) {
    [v4 setObject:v6 forKey:v5];
  }
  return v4;
}

- (id)secItemFormatToDictionary:(id)a3
{
  CFDictionaryRef v3 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3];
  [v3 setObject:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F17520]];
  [v3 setObject:*MEMORY[0x263F171E0] forKey:*MEMORY[0x263F171B8]];
  CFTypeRef result = 0;
  OSStatus v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);
  if (v4 == -25300)
  {
    BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v5) {
      -[MDKeyRing secItemFormatToDictionary:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else if (v4)
  {
    BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v13) {
      -[MDKeyRing secItemFormatToDictionary:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  else
  {
    [v3 setObject:result forKey:*MEMORY[0x263F175A8]];
  }
  return v3;
}

- (id)copyEncryptedData:(id)a3 withKeyUUID:(id)a4 iv1:(unsigned int)a5 iv2:(unsigned int)a6
{
  id v11 = [(MDKeyRing *)self fetchKeyFromKeychain:a4];
  if (v11
    || ([(MDKeyRing *)self createKeychainItemForKey:a4],
        (id v11 = [(MDKeyRing *)self fetchKeyFromKeychain:a4]) != 0))
  {
    uint64_t v12 = (const void *)[a3 bytes];
    size_t v13 = [a3 length];
    return _copyCryptedDataWithKey(0, v12, v13, v11, a5, a6);
  }
  else
  {
    NSLog(&cfstr_NoKeyDataFor.isa, a4);
    return 0;
  }
}

- (id)copyDecryptedData:(id)a3 withKeyUUID:(id)a4 iv1:(unsigned int)a5 iv2:(unsigned int)a6
{
  id v11 = [(MDKeyRing *)self fetchKeyFromKeychain:a4];
  if (v11
    || ([(MDKeyRing *)self createKeychainItemForKey:a4],
        id result = [(MDKeyRing *)self fetchKeyFromKeychain:a4],
        (id v11 = result) != 0))
  {
    size_t v13 = (const void *)[a3 bytes];
    size_t v14 = [a3 length];
    return _copyCryptedDataWithKey(1u, v13, v14, v11, a5, a6);
  }
  return result;
}

- (NSMutableDictionary)keysByUUID
{
  return self->_keysByUUID;
}

- (void)setKeysByUUID:(id)a3
{
}

- (void)fetchKeyFromKeychain:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createKeychainItemForKey:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createKeychainItemForKey:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)writeToKeychain:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)writeToKeychain:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)secItemFormatToDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)secItemFormatToDictionary:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end