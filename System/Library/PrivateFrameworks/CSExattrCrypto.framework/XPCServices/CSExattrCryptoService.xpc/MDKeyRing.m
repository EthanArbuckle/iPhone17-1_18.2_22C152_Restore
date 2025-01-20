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
  v4[0] = 0;
  v4[1] = 0;
  do
  {
    *(_DWORD *)((char *)v4 + v2) = arc4random();
    v2 += 4;
  }
  while (v2 != 16);
  return [objc_alloc((Class)NSUUID) initWithUUIDBytes:v4];
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
  return CFUUIDCreateFromUUIDBytes(kCFAllocatorDefault, md);
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
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    [v3 setObject:kSecClassKey forKey:kSecClass];
    [v3 setObject:kSecMatchLimitAll forKey:kSecMatchLimit];
    [v3 setObject:kCFBooleanTrue forKey:kSecReturnAttributes];
    sub_1000059D8(v3);
    uint64_t v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);

    v5 = (void *)result;
    if (result)
    {
      if (v4)
      {
        NSLog(@"SecItemCopyMatching osErr:%d", v4);
        v5 = (void *)result;
      }
      id v6 = [v5 indexesOfObjectsPassingTest:&stru_100014998];
      v10[0] = 0;
      v10[1] = v10;
      v10[2] = 0x3052000000;
      v10[3] = sub_100005ACC;
      v10[4] = sub_100005ADC;
      v10[5] = 0;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100005AE8;
      v9[3] = &unk_1000149C0;
      v9[4] = v2;
      v9[5] = v10;
      [(id)result enumerateObjectsAtIndexes:v6 options:0 usingBlock:v9];
      CFRelease(result);
      CFTypeRef result = 0;
      _Block_object_dispose(v10, 8);
    }
    if (!v2->_designatedKeyUUID)
    {
      int v7 = [(MDKeyRing *)v2 createRandomUUID];
      v2->_designatedKeyUUID = v7;
      [(MDKeyRing *)v2 fetchKeyFromKeychain:v7];
    }
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.metadata.MDRemoteKeyRing", 0);
  }
  if (result) {
    CFRelease(result);
  }
  return v2;
}

+ (id)defaultKeyRing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005DC4;
  block[3] = &unk_1000149E8;
  block[4] = a1;
  if (qword_10001A360 != -1) {
    dispatch_once(&qword_10001A360, block);
  }
  id result = (id)qword_10001A368;
  if (!qword_10001A368) {
    return objc_alloc_init((Class)a1);
  }
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
    dispatch_release((dispatch_object_t)queue);
  }
  v6.receiver = self;
  v6.super_class = (Class)MDKeyRing;
  [(MDKeyRing *)&v6 dealloc];
}

- (id)allKeyUUIDs
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3052000000;
  CC_LONG v9 = sub_100005ACC;
  v10 = sub_100005ADC;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005F40;
  v5[3] = &unk_100014A10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
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
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006044;
    block[3] = &unk_100014A38;
    void block[5] = a3;
    block[6] = &v7;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)queue, block);
    uint64_t v4 = (__SecKey *)v8[3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)scheduleAccessToKey:(__CFUUID *)a3 onQueue:(id)global_queue usingBlock:(id)a5
{
  if (!global_queue)
  {
    qos_class_t v8 = qos_class_self();
    global_queue = dispatch_get_global_queue(v8, 0);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000628C;
  block[3] = &unk_100014A60;
  void block[5] = a5;
  block[6] = a3;
  block[4] = self;
  dispatch_async((dispatch_queue_t)global_queue, block);
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
  CFNullRef v8 = (const __CFNull *)[(NSMutableDictionary *)v7 objectForKey:a3];
  if (!v8 || (uint64_t v9 = v8, v8 == kCFNull))
  {
    uint64_t v9 = objc_opt_new();
    [(NSMutableDictionary *)v7 setObject:v9 forKey:a3];
  }
  CFTypeRef v10 = result;
  if (!v6 && result)
  {
    [v9 setObject:result forKey:kSecValueData];
    CFTypeRef v10 = result;
  }
  if (v10) {
    CFRelease(v10);
  }
  return v6;
}

- (id)copyPrivateKeyQuery:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:kSecClassKey forKey:kSecClass];
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(a3, "MDUUIDData"), kSecAttrApplicationLabel);
  sub_1000059D8(v4);
  return v4;
}

- (id)fetchKeyFromKeychain:(id)a3
{
  unsigned int v5 = -[MDKeyRing restoreFromExistingKey:](self, "restoreFromExistingKey:");
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
      BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v8) {
        sub_10000F508(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    return 0;
  }
LABEL_5:
  id v6 = [(NSMutableDictionary *)[(MDKeyRing *)self keysByUUID] objectForKey:a3];
  return [v6 objectForKey:kSecValueData];
}

- (id)createRandomAESKey
{
  uint64_t v2 = 0;
  v4[0] = 0;
  v4[1] = 0;
  do
  {
    *(_DWORD *)((char *)v4 + v2) = arc4random();
    v2 += 4;
  }
  while (v2 != 16);
  return [objc_alloc((Class)NSData) initWithBytes:v4 length:16];
}

- (BOOL)createKeychainItemForKey:(id)a3
{
  unsigned int v5 = [(MDKeyRing *)self keysByUUID];
  if (!v5)
  {
    unsigned int v5 = (NSMutableDictionary *)objc_opt_new();
    [(MDKeyRing *)self setKeysByUUID:v5];
  }
  id v6 = [(NSMutableDictionary *)v5 objectForKey:a3];
  if (!v6)
  {
    id v6 = (id)objc_opt_new();
    [(NSMutableDictionary *)v5 setObject:v6 forKey:a3];
  }
  if ([v6 count])
  {
    if (SecItemDelete((CFDictionaryRef)[(MDKeyRing *)self dictionaryToSecItemFormat:v6]))
    {
      BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v7) {
        sub_10000F580(v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  id v15 = [(MDKeyRing *)self createRandomAESKey];
  if (v15)
  {
    [v6 setObject:v15 forKey:kSecValueData];
    sub_1000059D8(v6);
    [v6 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (%@)", @"Spotlight Metadata Privacy", objc_msgSend(a3, "UUIDString")), kSecAttrLabel forKey];
    v25[0] = 0;
    v25[1] = 0;
    [a3 getUUIDBytes:v25];
    objc_msgSend(v6, "setObject:forKey:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v25, 16), kSecAttrApplicationLabel);
  }
  else
  {
    BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v16) {
      sub_10000F544(v16, v17, v18, v19, v20, v21, v22, v23);
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
        BOOL v7 = +[NSMutableDictionary dictionaryWithDictionary:result];
        -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", [v5 objectForKey:kSecClass], kSecClass);
        id v8 = [(MDKeyRing *)self dictionaryToSecItemFormat:[(NSMutableDictionary *)[(MDKeyRing *)self keysByUUID] objectForKey:a3]];
        [v8 removeObjectForKey:kSecClass];
        if (SecItemUpdate((CFDictionaryRef)v7, (CFDictionaryRef)v8))
        {
          BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v9) {
            sub_10000F5BC(v9, v10, v11, v12, v13, v14, v15, v16);
          }
        }
        goto LABEL_15;
      }
    }
  }
  id v17 = [(NSMutableDictionary *)[(MDKeyRing *)self keysByUUID] objectForKey:a3];
  OSStatus v18 = SecItemAdd((CFDictionaryRef)[(MDKeyRing *)self dictionaryToSecItemFormat:v17], 0);
  if (v18 == -25299)
  {
    if (SecItemDelete((CFDictionaryRef)[(MDKeyRing *)self dictionaryToSecItemFormat:v17])) {
      goto LABEL_11;
    }
    OSStatus v18 = SecItemAdd((CFDictionaryRef)[(MDKeyRing *)self dictionaryToSecItemFormat:v17], 0);
  }
  if (v18)
  {
LABEL_11:
    BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v19) {
      sub_10000F5F8(v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  if (result) {
    CFRelease(result);
  }
LABEL_15:
}

- (id)dictionaryToSecItemFormat:(id)a3
{
  id v4 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:");
  [(NSMutableDictionary *)v4 setObject:kSecClassKey forKey:kSecClass];
  id v5 = [a3 objectForKey:kSecValueData];
  if (v5) {
    [(NSMutableDictionary *)v4 setObject:v5 forKey:kSecValueData];
  }
  return v4;
}

- (id)secItemFormatToDictionary:(id)a3
{
  id v3 = +[NSMutableDictionary dictionaryWithDictionary:a3];
  [(NSMutableDictionary *)v3 setObject:kCFBooleanTrue forKey:kSecReturnData];
  [(NSMutableDictionary *)v3 setObject:kSecClassKey forKey:kSecClass];
  CFTypeRef result = 0;
  OSStatus v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);
  if (v4 == -25300)
  {
    BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v5) {
      sub_10000F670(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else if (v4)
  {
    BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v13) {
      sub_10000F634(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  else
  {
    [(NSMutableDictionary *)v3 setObject:result forKey:kSecValueData];
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
    id v12 = [a3 bytes];
    id v13 = [a3 length];
    return sub_100006C10(0, v12, (size_t)v13, v11, a5, a6);
  }
  else
  {
    NSLog(@"No key data for %@", a4);
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
    id v13 = [a3 bytes];
    id v14 = [a3 length];
    return sub_100006C10(1u, v13, (size_t)v14, v11, a5, a6);
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

@end