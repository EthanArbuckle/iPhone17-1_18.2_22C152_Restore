@interface IDSPerServiceApplicationKeyManager
- (BOOL)hasUnregisteredIdentity;
- (BOOL)needsPublicDataUpdatedForKeyIndex:(unsigned __int16)a3;
- (BOOL)notePublicIdentityDidRegisterKeyData:(id)a3 forKeyIndex:(unsigned __int16)a4;
- (BOOL)serializeAndPersistIdentitiesDeleteIfNull:(BOOL)a3;
- (IDSPerServiceApplicationKeyManager)initWithIdentityDataSource:(id)a3;
- (IDSRegistrationKeyManagerIdentityDataSource)identityDataSource;
- (NSMutableDictionary)serviceIndexToKeyConfigs;
- (__SecKey)copyPublicIdentityDataToRegisterForKeyIndex:(unsigned __int16)a3 withError:(id *)a4;
- (__SecKey)fullIdentityForKeyIndex:(unsigned __int16)a3;
- (void)_deleteIdentityAtKeyIndex:(unsigned __int16)a3 error:(id *)a4;
- (void)clearIdentities;
- (void)loadIdentitiesWithSerializationDidChange:(BOOL *)a3 deserializationDidFail:(BOOL *)a4 identityGenerated:(BOOL *)a5;
- (void)setIdentityDataSource:(id)a3;
- (void)setServiceIndexToKeyConfigs:(id)a3;
@end

@implementation IDSPerServiceApplicationKeyManager

- (IDSPerServiceApplicationKeyManager)initWithIdentityDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSPerServiceApplicationKeyManager;
  v6 = [(IDSPerServiceApplicationKeyManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identityDataSource, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    serviceIndexToKeyConfigs = v7->_serviceIndexToKeyConfigs;
    v7->_serviceIndexToKeyConfigs = v8;
  }
  return v7;
}

- (BOOL)needsPublicDataUpdatedForKeyIndex:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v4 = [(IDSPerServiceApplicationKeyManager *)self serviceIndexToKeyConfigs];
  id v5 = +[NSNumber numberWithUnsignedShort:v3];
  v6 = [v4 objectForKeyedSubscript:v5];

  if ([v6 identity] && (objc_msgSend(v6, "isRegistered") & 1) == 0)
  {
    v8 = +[IMRGLog registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109379;
      v10[1] = v3;
      __int16 v11 = 2113;
      id v12 = [v6 identity];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found key index has unregistered identity {keyIndex: %u, unregisteredIdentity: %{private}@}", (uint8_t *)v10, 0x12u);
    }

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (__SecKey)fullIdentityForKeyIndex:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(IDSPerServiceApplicationKeyManager *)self serviceIndexToKeyConfigs];
  v6 = +[NSNumber numberWithUnsignedShort:v3];
  BOOL v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10070AD08(v3, self);
    }
    goto LABEL_7;
  }
  v8 = (__SecKey *)[v7 identity];
  if (!v8)
  {
    v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10070AD9C();
    }
LABEL_7:

    v8 = 0;
  }

  return v8;
}

- (__SecKey)copyPublicIdentityDataToRegisterForKeyIndex:(unsigned __int16)a3 withError:(id *)a4
{
  uint64_t v4 = a3;
  v6 = [(IDSPerServiceApplicationKeyManager *)self serviceIndexToKeyConfigs];
  BOOL v7 = +[NSNumber numberWithUnsignedShort:v4];
  v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    __int16 v11 = +[IMRGLog registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10070AD08(v4, self);
    }

    goto LABEL_10;
  }
  v9 = (__SecKey *)[v8 identity];
  if (!v9)
  {
    id v12 = +[IMRGLog registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10070AD9C();
    }

LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v10 = SecKeyCopyPublicKey(v9);
LABEL_11:

  return v10;
}

- (BOOL)notePublicIdentityDidRegisterKeyData:(id)a3 forKeyIndex:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  v6 = (__SecKey *)a3;
  BOOL v7 = +[IMRGLog registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109379;
    int v25 = v4;
    __int16 v26 = 2113;
    v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Per service application key manager noting registration of keys { keyIndex: %u, keyData: %{private}@ }", buf, 0x12u);
  }

  v8 = [(IDSPerServiceApplicationKeyManager *)self serviceIndexToKeyConfigs];
  v9 = +[NSNumber numberWithUnsignedShort:v4];
  v10 = [v8 objectForKeyedSubscript:v9];

  if (!v10)
  {
    v13 = +[IMRGLog registration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10070AE04(v4, v13);
    }
    goto LABEL_10;
  }
  __int16 v11 = (__SecKey *)[v10 identity];
  if (v11)
  {
    id v12 = v11;
    if (![v10 isRegistered])
    {
      v16 = SecKeyCopyPublicKey(v12);
      if (!v16)
      {
        v13 = +[IMRGLog registration];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10070AF28();
        }
        goto LABEL_10;
      }
      v17 = v16;
      CFErrorRef error = 0;
      CFDataRef v18 = SecKeyCopyExternalRepresentation(v16, &error);
      CFRelease(v17);
      if (v18)
      {
        if (error)
        {
          CFRelease(error);
          CFErrorRef error = 0;
        }
        unsigned int v19 = [(__CFData *)v18 isEqualToData:v6];
        v20 = +[IMRGLog registration];
        v21 = v20;
        if (v19)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109379;
            int v25 = v4;
            __int16 v26 = 2113;
            v27 = v12;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Completed registration of previously unregistered identity for key index {keyIndex: %u, unregisteredIdentity: %{private}@}", buf, 0x12u);
          }

          BOOL v14 = 1;
          [v10 setIsRegistered:1];
          goto LABEL_30;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10070B028();
        }
      }
      else
      {
        v22 = +[IMRGLog registration];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10070AF90(v4, (uint64_t *)&error, v22);
        }

        if (error)
        {
          CFRelease(error);
          BOOL v14 = 0;
          CFErrorRef error = 0;
LABEL_30:

          goto LABEL_11;
        }
      }
      BOOL v14 = 0;
      goto LABEL_30;
    }
  }
  v13 = +[IMRGLog registration];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10070AE80(v4, v10);
  }
LABEL_10:

  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)hasUnregisteredIdentity
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v3 = [(IDSPerServiceApplicationKeyManager *)self serviceIndexToKeyConfigs];
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v9 = [(IDSPerServiceApplicationKeyManager *)self serviceIndexToKeyConfigs];
        v10 = [v9 objectForKeyedSubscript:v8];
        if ([v10 identity])
        {
          __int16 v11 = [(IDSPerServiceApplicationKeyManager *)self serviceIndexToKeyConfigs];
          id v12 = [v11 objectForKeyedSubscript:v8];
          unsigned int v13 = [v12 isRegistered];

          if (!v13)
          {
            BOOL v14 = 1;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  BOOL v14 = 0;
LABEL_13:

  return v14;
}

- (void)loadIdentitiesWithSerializationDidChange:(BOOL *)a3 deserializationDidFail:(BOOL *)a4 identityGenerated:(BOOL *)a5
{
  BOOL v7 = objc_alloc_init(IDSPerServiceApplicationKeyConfig);
  uint64_t v8 = [(IDSPerServiceApplicationKeyManager *)self identityDataSource];
  id v23 = 0;
  id v9 = [v8 copyIdentityFromKeychainWithApplicationKeyIndex:1 error:&v23];
  id v10 = v23;

  [(IDSPerServiceApplicationKeyConfig *)v7 setIdentity:v9];
  if (v9) {
    CFRelease(v9);
  }
  if ([(IDSPerServiceApplicationKeyConfig *)v7 identity])
  {
    __int16 v11 = [(IDSPerServiceApplicationKeyManager *)self identityDataSource];
    id v22 = v10;
    id v12 = [v11 loadIsIdentityRegisteredForApplicationKeyIndex:1 error:&v22];
    id v13 = v22;

    [(IDSPerServiceApplicationKeyConfig *)v7 setIsRegistered:v12];
    id v10 = v13;
  }
  if ([(IDSPerServiceApplicationKeyConfig *)v7 identity])
  {
    id v14 = v10;
  }
  else
  {
    long long v17 = +[IMRGLog registration];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v25 = 1;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No registered or unregistered identity... generating {keyIndex: %u}", buf, 8u);
    }

    long long v18 = [(IDSPerServiceApplicationKeyManager *)self identityDataSource];
    id v21 = v10;
    id v19 = [v18 createIdentityForApplicationKeyIndex:1 error:&v21];
    id v14 = v21;

    if (v19)
    {
      [(IDSPerServiceApplicationKeyConfig *)v7 setIdentity:v19];
      [(IDSPerServiceApplicationKeyConfig *)v7 setIsRegistered:0];
      if (a5) {
        *a5 = 1;
      }
    }
    else
    {
      v20 = +[IMRGLog registration];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109378;
        int v25 = 1;
        __int16 v26 = 2112;
        id v27 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "generatedIdentityForKeyIndexFailed {keyIndex: %u, error: %@}", buf, 0x12u);
      }
    }
  }
  v15 = [(IDSPerServiceApplicationKeyManager *)self serviceIndexToKeyConfigs];
  long long v16 = +[NSNumber numberWithUnsignedShort:1];
  [v15 setObject:v7 forKeyedSubscript:v16];
}

- (void)clearIdentities
{
  id v2 = [(IDSPerServiceApplicationKeyManager *)self serviceIndexToKeyConfigs];
  [v2 removeAllObjects];
}

- (BOOL)serializeAndPersistIdentitiesDeleteIfNull:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(IDSPerServiceApplicationKeyManager *)self serviceIndexToKeyConfigs];
  uint64_t v6 = +[NSNumber numberWithUnsignedShort:1];
  BOOL v7 = [v5 objectForKeyedSubscript:v6];

  if ([v7 identity])
  {
    uint64_t v8 = +[IMRGLog registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = [v7 isRegistered];
      CFStringRef v10 = @"NO";
      if (v9) {
        CFStringRef v10 = @"YES";
      }
      *(_DWORD *)buf = 67109378;
      int v18 = 1;
      __int16 v19 = 2112;
      CFStringRef v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Saving isRegistered value for application key, {keyIndex: %u, isRegistered: %@}", buf, 0x12u);
    }

    __int16 v11 = [(IDSPerServiceApplicationKeyManager *)self identityDataSource];
    uint64_t v16 = 0;
    objc_msgSend(v11, "saveIsRegistered:forApplicationKeyIndex:error:", objc_msgSend(v7, "isRegistered"), 1, &v16);
  }
  else
  {
    if ([v7 identity]) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = !v3;
    }
    if (!v12)
    {
      id v13 = +[IMRGLog registration];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v18 = 1;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Removing identities from keychain because deleteIfNull == YES and no config present, {keyIndex: %u}", buf, 8u);
      }

      uint64_t v15 = 0;
      [(IDSPerServiceApplicationKeyManager *)self _deleteIdentityAtKeyIndex:1 error:&v15];
    }
  }

  return 1;
}

- (void)_deleteIdentityAtKeyIndex:(unsigned __int16)a3 error:(id *)a4
{
  uint64_t v5 = a3;
  BOOL v7 = [(IDSPerServiceApplicationKeyManager *)self identityDataSource];
  id v14 = 0;
  unsigned int v8 = [v7 removeIdentityWithApplicationKeyIndex:v5 error:&v14];
  id v9 = v14;

  if (v8)
  {
    CFStringRef v10 = [(IDSPerServiceApplicationKeyManager *)self identityDataSource];
    id v13 = v9;
    [v10 saveIsRegistered:0 forApplicationKeyIndex:v5 error:&v13];
    id v11 = v13;

    BOOL v12 = +[IMRGLog registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Purged identity and removed it from keychain {keyIndex: %u}", buf, 8u);
    }
  }
  else
  {
    BOOL v12 = +[IMRGLog registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10070B090((uint64_t)v9, v5, v12);
    }
    id v11 = v9;
  }

  if (a4 && v11) {
    *a4 = v11;
  }
}

- (NSMutableDictionary)serviceIndexToKeyConfigs
{
  return self->_serviceIndexToKeyConfigs;
}

- (void)setServiceIndexToKeyConfigs:(id)a3
{
}

- (IDSRegistrationKeyManagerIdentityDataSource)identityDataSource
{
  return self->_identityDataSource;
}

- (void)setIdentityDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityDataSource, 0);

  objc_storeStrong((id *)&self->_serviceIndexToKeyConfigs, 0);
}

@end