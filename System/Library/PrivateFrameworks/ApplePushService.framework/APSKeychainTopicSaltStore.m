@interface APSKeychainTopicSaltStore
- (APSEnvironment)environment;
- (APSKeychainTopicSaltStore)initWithEnvironment:(id)a3 multiUserMode:(id)a4;
- (APSMultiUserMode)multiUser;
- (BOOL)_saveIdentifiersToSalts:(id)a3 toKeychainForUser:(id)a4;
- (BOOL)_saveKeychainData:(id)a3 forUser:(id)a4;
- (BOOL)_useSystemSaltStoreForUser:(id)a3;
- (BOOL)saveSalt:(id)a3 forIdentifier:(id)a4 user:(id)a5;
- (NSMutableDictionary)identifiersToSaltsSystem;
- (NSMutableDictionary)identifiersToSaltsUser;
- (id)_deserializeKeychainData:(id)a3;
- (id)_keychainService;
- (id)_loadIdentifiersToSaltsFromKeychainForUser:(id)a3;
- (id)_loadKeychainDataForUser:(id)a3;
- (id)_saltStoreForUser:(id)a3;
- (id)_serializeKeychainDict:(id)a3;
- (id)loadIdentifiersToSaltsForUser:(id)a3;
- (id)loadSaltForIdentifier:(id)a3 user:(id)a4;
- (void)_setSaltStore:(id)a3 forUser:(id)a4;
- (void)setEnvironment:(id)a3;
- (void)setIdentifiersToSaltsSystem:(id)a3;
- (void)setIdentifiersToSaltsUser:(id)a3;
- (void)setMultiUser:(id)a3;
@end

@implementation APSKeychainTopicSaltStore

- (APSKeychainTopicSaltStore)initWithEnvironment:(id)a3 multiUserMode:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)APSKeychainTopicSaltStore;
  v9 = [(APSKeychainTopicSaltStore *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_environment, a3);
    objc_storeStrong((id *)&v10->_multiUser, a4);
  }

  return v10;
}

- (id)loadSaltForIdentifier:(id)a3 user:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(APSKeychainTopicSaltStore *)self _saltStoreForUser:v7];
  if (!v8)
  {
    id v8 = [(APSKeychainTopicSaltStore *)self _loadIdentifiersToSaltsFromKeychainForUser:v7];
  }
  v9 = [v8 objectForKeyedSubscript:v6];
  if (v9)
  {
    v10 = +[APSLog courier];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412802;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ loadSaltForIdentifier found salt %@ %@", (uint8_t *)&v12, 0x20u);
    }
  }
  return v9;
}

- (BOOL)saveSalt:(id)a3 forIdentifier:(id)a4 user:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(APSKeychainTopicSaltStore *)self _saltStoreForUser:v10];
  if (!v11)
  {
    v11 = [(APSKeychainTopicSaltStore *)self _loadIdentifiersToSaltsFromKeychainForUser:v10];
  }
  uint64_t v12 = [v11 objectForKeyedSubscript:v9];
  id v13 = (void *)v12;
  if (v8 || !v12) && ([v8 isEqualToData:v12])
  {
    BOOL v14 = 1;
  }
  else
  {
    [v11 setObject:v8 forKeyedSubscript:v9];
    BOOL v14 = [(APSKeychainTopicSaltStore *)self _saveIdentifiersToSalts:v11 toKeychainForUser:v10];
    if (v14)
    {
      id v15 = +[APSLog courier];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412802;
        id v18 = v10;
        __int16 v19 = 2112;
        id v20 = v8;
        __int16 v21 = 2112;
        id v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ saveSalt success %@ %@", (uint8_t *)&v17, 0x20u);
      }
    }
    else
    {
      [v11 setObject:v13 forKeyedSubscript:v9];
      id v15 = +[APSLog courier];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138412802;
        id v18 = v10;
        __int16 v19 = 2112;
        id v20 = v8;
        __int16 v21 = 2112;
        id v22 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@ saveSalt failed %@ %@", (uint8_t *)&v17, 0x20u);
      }
    }
  }
  return v14;
}

- (id)loadIdentifiersToSaltsForUser:(id)a3
{
  id v4 = a3;
  v5 = [(APSKeychainTopicSaltStore *)self _saltStoreForUser:v4];
  if (!v5)
  {
    v5 = [(APSKeychainTopicSaltStore *)self _loadIdentifiersToSaltsFromKeychainForUser:v4];
  }

  return v5;
}

- (BOOL)_useSystemSaltStoreForUser:(id)a3
{
  unsigned int v4 = [a3 isDefaultUser];
  if (v4)
  {
    v5 = [(APSKeychainTopicSaltStore *)self multiUser];
    unsigned __int8 v6 = [v5 isMultiUser];

    LOBYTE(v4) = v6;
  }
  return v4;
}

- (id)_saltStoreForUser:(id)a3
{
  if ([(APSKeychainTopicSaltStore *)self _useSystemSaltStoreForUser:a3]) {
    [(APSKeychainTopicSaltStore *)self identifiersToSaltsSystem];
  }
  else {
  unsigned int v4 = [(APSKeychainTopicSaltStore *)self identifiersToSaltsUser];
  }
  return v4;
}

- (void)_setSaltStore:(id)a3 forUser:(id)a4
{
  id v6 = a3;
  if ([(APSKeychainTopicSaltStore *)self _useSystemSaltStoreForUser:a4]) {
    [(APSKeychainTopicSaltStore *)self setIdentifiersToSaltsSystem:v6];
  }
  else {
    [(APSKeychainTopicSaltStore *)self setIdentifiersToSaltsUser:v6];
  }
}

- (id)_loadIdentifiersToSaltsFromKeychainForUser:(id)a3
{
  id v4 = a3;
  v5 = [(APSKeychainTopicSaltStore *)self _loadKeychainDataForUser:v4];
  if (v5
    || ([(APSKeychainTopicSaltStore *)self _loadKeychainDataForUser:v4],
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = [(APSKeychainTopicSaltStore *)self _deserializeKeychainData:v5];
    id v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
    }
    id v9 = v8;
  }
  else
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v10 = +[APSLog courier];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ Loaded salt store from keychain %@", (uint8_t *)&v12, 0x16u);
  }

  [(APSKeychainTopicSaltStore *)self _setSaltStore:v9 forUser:v4];
  return v9;
}

- (BOOL)_saveIdentifiersToSalts:(id)a3 toKeychainForUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(APSKeychainTopicSaltStore *)self _setSaltStore:v6 forUser:v7];
  if ([v6 count])
  {
    id v8 = [(APSKeychainTopicSaltStore *)self _serializeKeychainDict:v6];
  }
  else
  {
    id v8 = 0;
  }
  BOOL v9 = [(APSKeychainTopicSaltStore *)self _saveKeychainData:v8 forUser:v7];

  return v9;
}

- (id)_deserializeKeychainData:(id)a3
{
  id v3 = a3;
  id v4 = +[APSLog courier];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_deserializeKeychainData %@", buf, 0xCu);
  }

  id v26 = 0;
  v5 = +[NSPropertyListSerialization propertyListWithData:v3 options:0 format:0 error:&v26];
  id v6 = v26;
  if (v6)
  {
    id v7 = +[APSLog courier];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000C7CA8();
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = +[APSLog courier];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_1000C7C40();
    }
LABEL_25:

    id v16 = 0;
    goto LABEL_26;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (!v9) {
    goto LABEL_17;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v23;
  id v20 = v6;
  id v21 = v3;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v23 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v17 = +[APSLog courier];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          id v3 = v21;
          sub_1000C7BD8();
LABEL_24:
          id v6 = v20;

          goto LABEL_25;
        }
LABEL_23:
        id v3 = v21;
        goto LABEL_24;
      }
      __int16 v14 = [v8 objectForKeyedSubscript:v13];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        int v17 = +[APSLog courier];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          __int16 v19 = [v8 objectForKeyedSubscript:v13];
          *(_DWORD *)buf = 138412546;
          id v28 = v19;
          __int16 v29 = 2112;
          id v3 = v21;
          id v30 = v21;
          _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "KeychainDict value not a data %@ - _deserializeSaltStoreKeychainData %@", buf, 0x16u);

          goto LABEL_24;
        }
        goto LABEL_23;
      }
    }
    id v10 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
    id v6 = v20;
    id v3 = v21;
    if (v10) {
      continue;
    }
    break;
  }
LABEL_17:

  id v16 = [v8 mutableCopy];
LABEL_26:

  return v16;
}

- (id)_serializeKeychainDict:(id)a3
{
  id v3 = a3;
  id v4 = +[APSLog courier];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_serializeKeychainDict %@", buf, 0xCu);
  }

  id v9 = 0;
  v5 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:200 options:0 error:&v9];
  id v6 = v9;
  if (v6)
  {
    id v7 = +[APSLog courier];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000C7D10();
    }
  }
  return v5;
}

- (id)_keychainService
{
  v2 = [(APSKeychainTopicSaltStore *)self environment];
  id v3 = [v2 domain];
  id v4 = +[NSString stringWithFormat:@"%@%@", v3, @",TopicSalt.v1"];

  return v4;
}

- (id)_loadKeychainDataForUser:(id)a3
{
  id v4 = a3;
  v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int v12 = 138412290;
    *(void *)&v12[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ _loadSaltStoreKeychainData", v12, 0xCu);
  }

  id v6 = [(APSKeychainTopicSaltStore *)self _keychainService];
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, APSBundleIdentifier);
  if ([(APSKeychainTopicSaltStore *)self _useSystemSaltStoreForUser:v4]) {
    CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, kCFBooleanTrue);
  }
  CFDictionaryAddValue(Mutable, kSecAttrService, v6);
  CFDictionaryAddValue(Mutable, kSecReturnData, kCFBooleanTrue);
  *(void *)int v12 = 0;
  OSStatus v8 = SecItemCopyMatching(Mutable, (CFTypeRef *)v12);
  if (v8 != -25300 && v8)
  {
    id v9 = +[APSLog courier];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000C7D78();
    }
  }
  CFRelease(Mutable);
  id v10 = *(void **)v12;

  return v10;
}

- (BOOL)_saveKeychainData:(id)a3 forUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  OSStatus v8 = +[APSLog courier];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ _saveSaltStoreKeychainData %@", (uint8_t *)&v17, 0x16u);
  }

  id v9 = [(APSKeychainTopicSaltStore *)self _keychainService];
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, APSBundleIdentifier);
  if ([(APSKeychainTopicSaltStore *)self _useSystemSaltStoreForUser:v7]) {
    CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, kCFBooleanTrue);
  }
  CFDictionaryAddValue(Mutable, kSecAttrService, v9);
  if (!v6)
  {
    if (SecItemDelete(Mutable))
    {
      __int16 v14 = +[APSLog courier];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000C7DE0();
      }
      goto LABEL_16;
    }
LABEL_17:
    BOOL v15 = 1;
    goto LABEL_18;
  }
  CFDictionaryAddValue(Mutable, kSecAttrAccessible, kSecAttrAccessibleAlwaysThisDeviceOnly);
  CFDictionaryAddValue(Mutable, kSecValueData, v6);
  OSStatus v11 = SecItemAdd(Mutable, 0);
  if (v11 == -25299)
  {
    int v12 = +[APSLog courier];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SecResult shows duplicate item, trying to update it. _saveSaltStoreKeychainData %@", (uint8_t *)&v17, 0xCu);
    }

    CFDictionaryRemoveValue(Mutable, kSecValueData);
    uint64_t v13 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(v13, kSecValueData, v6);
    OSStatus v11 = SecItemUpdate(Mutable, v13);
    CFRelease(v13);
  }
  if (!v11) {
    goto LABEL_17;
  }
  __int16 v14 = +[APSLog courier];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_1000C7E48();
  }
LABEL_16:

  BOOL v15 = 0;
LABEL_18:
  CFRelease(Mutable);

  return v15;
}

- (APSMultiUserMode)multiUser
{
  return self->_multiUser;
}

- (void)setMultiUser:(id)a3
{
}

- (APSEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSMutableDictionary)identifiersToSaltsUser
{
  return self->_identifiersToSaltsUser;
}

- (void)setIdentifiersToSaltsUser:(id)a3
{
}

- (NSMutableDictionary)identifiersToSaltsSystem
{
  return self->_identifiersToSaltsSystem;
}

- (void)setIdentifiersToSaltsSystem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersToSaltsSystem, 0);
  objc_storeStrong((id *)&self->_identifiersToSaltsUser, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_multiUser, 0);
}

@end