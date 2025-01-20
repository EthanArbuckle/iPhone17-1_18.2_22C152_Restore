@interface IDSRegistrationKeyManagerIdentityDataSource
+ (id)containerStorageItemNameForContainerIdentityIdentifier:(int64_t)a3;
+ (id)containerStorageItemNameForContainerIdentityIdentifier:(int64_t)a3 applicationKeyIndex:(unsigned __int16)a4;
+ (id)containerStorageItemNameForIsRegisteredAtApplicationKeyIndex:(unsigned __int16)a3;
+ (id)containerStorageItemNameForKTDataAtKeyIndex:(unsigned __int16)a3 isRegistered:(BOOL)a4;
+ (id)legacyStorageItemNameForContainerIdentityIdentifier:(int64_t)a3;
+ (id)storageItemNameForLegacyIdentityIdentifier:(int64_t)a3;
- (BOOL)_removeDataFromKeychainForIdentifier:(id)a3 dataProtectionClass:(int64_t)a4 error:(id *)a5;
- (BOOL)loadIsIdentityRegisteredForApplicationKeyIndex:(unsigned __int16)a3 error:(id *)a4;
- (BOOL)removeIdentityContainer:(id)a3 withIdentifier:(int64_t)a4 dataProtectionClass:(int64_t)a5 error:(id *)a6;
- (BOOL)removeIdentityWithApplicationKeyIndex:(unsigned __int16)a3 error:(id *)a4;
- (BOOL)removeKTRegistrationDataForKeyIndex:(unsigned __int16)a3 isRegistered:(BOOL)a4 error:(id *)a5;
- (BOOL)removeLegacyIdentity:(id)a3 withIdentifier:(int64_t)a4 dataProtectionClass:(int64_t)a5 error:(id *)a6;
- (BOOL)saveIdentityContainer:(id)a3 withIdentifier:(int64_t)a4 dataProtectionClass:(int64_t)a5 error:(id *)a6;
- (BOOL)saveIsRegistered:(BOOL)a3 forApplicationKeyIndex:(unsigned __int16)a4 error:(id *)a5;
- (BOOL)saveKTRegistrationData:(id)a3 forKeyIndex:(unsigned __int16)a4 isRegistered:(BOOL)a5 error:(id *)a6;
- (BOOL)saveLegacyIdentity:(id)a3 withIdentifier:(int64_t)a4 dataProtectionClass:(int64_t)a5 error:(id *)a6;
- (IDSKeychainWrapper)keychainWrapper;
- (IDSRegistrationKeyManagerIdentityDataSource)initWithKeychainWrapper:(id)a3;
- (__SecKey)copyIdentityFromKeychainWithApplicationKeyIndex:(unsigned __int16)a3 error:(id *)a4;
- (__SecKey)createIdentityForApplicationKeyIndex:(unsigned __int16)a3 error:(id *)a4;
- (id)_loadContainerWithIdentifier:(id)a3 serializationDidChage:(BOOL *)a4 deserializationDidFail:(BOOL *)a5 needsEncryptionIdentityRoll:(BOOL *)a6 error:(id *)a7;
- (id)_loadIdentityWithIdentifier:(id)a3 serializationDidChage:(BOOL *)a4 deserializationDidFail:(BOOL *)a5 error:(id *)a6;
- (id)_loadLegacyIdentityWithIdentifier:(id)a3 serializationDidChange:(BOOL *)a4 deserializationDidFail:(BOOL *)a5 error:(id *)a6;
- (id)_retrying_loadLegacyIdentityWithIdentifier:(id)a3 serializationDidChange:(BOOL *)a4 deserializationDidFail:(BOOL *)a5 error:(id *)a6;
- (id)dataRepresentationForNGMVersion:(unsigned int)a3;
- (id)generateIdentityContainerWithIdentifier:(int64_t)a3 existingLegacyIdentity:(id)a4 existingNGMIdentity:(id)a5 dataProtectionClass:(int64_t)a6 nonLegacyError:(id *)a7 error:(id *)a8;
- (id)generateLegacyIdentityWithIdentifier:(int64_t)a3 dataProtectionClass:(int64_t)a4 error:(id *)a5;
- (id)loadIdentityContainerWithIdentifier:(int64_t)a3 withLegacyFallback:(BOOL)a4 serializationDidChange:(BOOL *)a5 deserializationDidFail:(BOOL *)a6 needsEncryptionIdentityRoll:(BOOL *)a7 nonLegacyError:(id *)a8 error:(id *)a9;
- (id)loadKTRegistrationDataForKeyIndex:(unsigned __int16)a3 isRegistered:(BOOL)a4 error:(id *)a5;
- (id)loadLegacyIdentityWithIdentifier:(int64_t)a3 serializationDidChange:(BOOL *)a4 error:(id *)a5;
- (unsigned)ngmVersion;
- (unsigned)ngmVersionFromDataRepresentation:(id)a3;
- (void)_eraseNGMIdentityFromKeychain:(id)a3;
@end

@implementation IDSRegistrationKeyManagerIdentityDataSource

+ (id)storageItemNameForLegacyIdentityIdentifier:(int64_t)a3
{
  if ((unint64_t)(a3 - 4) >= 3) {
    sub_10072344C();
  }
  return *(&off_10098C898 + a3 - 4);
}

+ (id)legacyStorageItemNameForContainerIdentityIdentifier:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      return @"message-protection-key";
    case 3:
      return @"previous-message-protection-key";
    case 0:
      sub_100723478();
  }
  return @"unregistered-message-protection-key";
}

+ (id)containerStorageItemNameForContainerIdentityIdentifier:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      return @"container-message-protection-key";
    case 3:
      return @"container-previous-message-protection-key";
    case 0:
      sub_1007234A4();
  }
  return @"container-unregistered-message-protection-key";
}

+ (id)containerStorageItemNameForContainerIdentityIdentifier:(int64_t)a3 applicationKeyIndex:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  uint64_t v5 = [a1 containerStorageItemNameForContainerIdentityIdentifier:a3];
  if ((v4 | 2) == 2) {
    sub_1007234D0();
  }
  v6 = (void *)v5;
  v7 = +[NSString stringWithFormat:@"%@-%u", v5, v4];

  return v7;
}

+ (id)containerStorageItemNameForIsRegisteredAtApplicationKeyIndex:(unsigned __int16)a3
{
  return +[NSString stringWithFormat:@"%@-%u", @"container-application-key-is-registered", a3];
}

+ (id)containerStorageItemNameForKTDataAtKeyIndex:(unsigned __int16)a3 isRegistered:(BOOL)a4
{
  CFStringRef v4 = @"container-unregistered-ktsignaturedata";
  if (a4) {
    CFStringRef v4 = @"container-registered-ktsignaturedata";
  }
  uint64_t v5 = +[NSString stringWithFormat:@"%@-%u", v4, a3];

  return v5;
}

- (IDSRegistrationKeyManagerIdentityDataSource)initWithKeychainWrapper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSRegistrationKeyManagerIdentityDataSource;
  v6 = [(IDSRegistrationKeyManagerIdentityDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keychainWrapper, a3);
  }

  return v7;
}

- (id)generateLegacyIdentityWithIdentifier:(int64_t)a3 dataProtectionClass:(int64_t)a4 error:(id *)a5
{
  objc_super v9 = [(id)objc_opt_class() storageItemNameForLegacyIdentityIdentifier:a3];
  if (!v9)
  {
    v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManagerIdentityDataSource.m", 116, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v10 = +[IDSMPFullLegacyIdentity identityWithDataProtectionClass:error:](IDSMPFullLegacyIdentity, "identityWithDataProtectionClass:error:", +[IDSKeychainWrapper imDataProtectionClassFromDataProtectionClass:a4], a5);
  v11 = +[IMRGLog registration];
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      v17 = v9;
      __int16 v18 = 2113;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Generated identity {identifier: %{public}@, identity: %{private}@}", buf, 0x16u);
    }

    id v13 = v10;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1007234FC();
    }
  }

  return v10;
}

- (BOOL)saveLegacyIdentity:(id)a3 withIdentifier:(int64_t)a4 dataProtectionClass:(int64_t)a5 error:(id *)a6
{
  v11 = a3;
  v12 = [(id)objc_opt_class() storageItemNameForLegacyIdentityIdentifier:a4];
  if (v12)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_21:
    id v13 = +[IMRGLog registration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100723574((uint64_t)v12, v13);
    }
    goto LABEL_23;
  }
  v24 = +[NSAssertionHandler currentHandler];
  [v24 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManagerIdentityDataSource.m", 132, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

  if (!v11) {
    goto LABEL_21;
  }
LABEL_3:
  id v13 = [v11 dataRepresentationWithError:a6];
  v14 = +[IMRGLog registration];
  v15 = v14;
  if (!v13)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

LABEL_23:
      BOOL v18 = 0;
      goto LABEL_24;
    }
    if (a6) {
      v19 = *a6;
    }
    else {
      v19 = 0;
    }
    *(_DWORD *)buf = 138543875;
    v27 = v19;
    __int16 v28 = 2114;
    v29 = v12;
    __int16 v30 = 2113;
    v31 = v11;
    v21 = "Failed to generate data from identity -- Removing refence from keychain {error: %{public}@, identifier: %{publ"
          "ic}@, identity: %{private}@}";
    v22 = v15;
    uint32_t v23 = 32;
LABEL_19:
    _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543875;
    v27 = v12;
    __int16 v28 = 2113;
    v29 = v11;
    __int16 v30 = 2113;
    v31 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Generated data from identity {identifier: %{public}@, identity: %{private}@, data: %{private}@}", buf, 0x20u);
  }

  v16 = [(IDSRegistrationKeyManagerIdentityDataSource *)self keychainWrapper];
  unsigned __int8 v17 = [v16 saveData:v13 forIdentifier:v12 allowSync:0 dataProtectionClass:a5 error:a6];

  if ((v17 & 1) == 0)
  {
    v15 = +[IMRGLog registration];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    if (a6) {
      v20 = *a6;
    }
    else {
      v20 = 0;
    }
    *(_DWORD *)buf = 138544131;
    v27 = v20;
    __int16 v28 = 2114;
    v29 = v12;
    __int16 v30 = 2113;
    v31 = v11;
    __int16 v32 = 2113;
    v33 = v13;
    v21 = "Failed to save to keychain -- Failed to save identity {error: %{public}@, identifier: %{public}@, identity: %{"
          "private}@, data: %{private}@}";
    v22 = v15;
    uint32_t v23 = 42;
    goto LABEL_19;
  }
  BOOL v18 = 1;
LABEL_24:

  return v18;
}

- (id)loadLegacyIdentityWithIdentifier:(int64_t)a3 serializationDidChange:(BOOL *)a4 error:(id *)a5
{
  objc_super v9 = [(id)objc_opt_class() storageItemNameForLegacyIdentityIdentifier:a3];
  if (!v9)
  {
    v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManagerIdentityDataSource.m", 157, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  char v15 = 0;
  v10 = [(IDSRegistrationKeyManagerIdentityDataSource *)self _retrying_loadLegacyIdentityWithIdentifier:v9 serializationDidChange:a4 deserializationDidFail:&v15 error:a5];
  v11 = v10;
  if (v10) {
    id v12 = v10;
  }

  return v11;
}

- (BOOL)removeLegacyIdentity:(id)a3 withIdentifier:(int64_t)a4 dataProtectionClass:(int64_t)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = [(id)objc_opt_class() storageItemNameForLegacyIdentityIdentifier:a4];
  if (!v12)
  {
    uint32_t v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManagerIdentityDataSource.m", 170, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  if (v11)
  {
    unsigned int v13 = [v11 purgeFromKeychain:a6];
    v14 = +[IMRGLog registration];
    char v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543619;
        id v25 = v12;
        __int16 v26 = 2113;
        id v27 = v11;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Purged identity {identifier: %{public}@, identity: %{private}@}", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      if (a6) {
        id v22 = *a6;
      }
      else {
        id v22 = 0;
      }
      *(_DWORD *)buf = 138543875;
      id v25 = v22;
      __int16 v26 = 2114;
      id v27 = v12;
      __int16 v28 = 2113;
      id v29 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to purge identity from keychain -- leaking identity but removing reference to it {error: %{public}@, identifier: %{public}@, identity: %{private}@}", buf, 0x20u);
    }
  }
  v16 = [(IDSRegistrationKeyManagerIdentityDataSource *)self keychainWrapper];
  unsigned int v17 = [v16 removeDataForIdentifier:v12 dataProtectionClass:a5 error:a6];

  BOOL v18 = +[IMRGLog registration];
  v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      id v25 = v12;
      __int16 v26 = 2113;
      id v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Removed identity reference from keychain {identifier: %{public}@, identity: %{private}@}", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    if (a6) {
      id v21 = *a6;
    }
    else {
      id v21 = 0;
    }
    *(_DWORD *)buf = 138543875;
    id v25 = v21;
    __int16 v26 = 2114;
    id v27 = v12;
    __int16 v28 = 2113;
    id v29 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to remove identity from keychain {error: %{public}@, identifier: %{public}@, identity: %{private}@}", buf, 0x20u);
  }

  return v17;
}

- (__SecKey)createIdentityForApplicationKeyIndex:(unsigned __int16)a3 error:(id *)a4
{
  uint64_t v5 = a3;
  v6 = +[IMRGLog registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Generating identity {index: %u}", buf, 8u);
  }

  v7 = [(id)objc_opt_class() containerStorageItemNameForContainerIdentityIdentifier:2 applicationKeyIndex:v5];
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
  CFDictionaryAddValue(Mutable, kSecAttrKeyType, kSecAttrKeyTypeECSECPrimeRandom);
  CFDictionaryAddValue(Mutable, kSecAttrKeySizeInBits, &off_1009D23E8);
  CFDictionaryAddValue(Mutable, kSecAttrApplicationTag, @"com.apple.identityservicesd");
  CFDictionaryAddValue(Mutable, kSecAttrLabel, v7);
  CFDictionaryAddValue(Mutable, kSecAttrIsPermanent, kCFBooleanTrue);
  CFDictionaryAddValue(Mutable, kSecAttrAccessible, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly);
  CFDictionaryAddValue(Mutable, kSecUseDataProtectionKeychain, kCFBooleanTrue);
  CFErrorRef error = 0;
  objc_super v9 = SecKeyCreateRandomKey(Mutable, &error);
  if (a4 && error)
  {
    *a4 = error;
  }
  else if (error)
  {
    CFRelease(error);
    CFErrorRef error = 0;
  }
  if (!v9)
  {
    v10 = +[IMRGLog registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      if (a4) {
        id v12 = *a4;
      }
      else {
        id v12 = 0;
      }
      *(_DWORD *)buf = 138543874;
      id v15 = v12;
      __int16 v16 = 1024;
      int v17 = v5;
      __int16 v18 = 1024;
      int v19 = v5;
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Failed to generate application identity -- returning container with nil ngm identity {error: %{public}@, index: %u, keyIndex: %u}", buf, 0x18u);
    }
  }
  if (Mutable) {
    CFRelease(Mutable);
  }

  return v9;
}

- (id)generateIdentityContainerWithIdentifier:(int64_t)a3 existingLegacyIdentity:(id)a4 existingNGMIdentity:(id)a5 dataProtectionClass:(int64_t)a6 nonLegacyError:(id *)a7 error:(id *)a8
{
  id v14 = a4;
  id v15 = a5;
  __int16 v16 = +[IMRGLog registration];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218499;
    int64_t v38 = a3;
    __int16 v39 = 2048;
    int64_t v40 = a6;
    __int16 v41 = 2113;
    int64_t v42 = (int64_t)v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Generating identity {identifier: %ld, dataProtectionClass: %ld, existingLegacyIdentity: %{private}@}", buf, 0x20u);
  }

  uint64_t v17 = +[IDSKeychainWrapper imDataProtectionClassFromDataProtectionClass:a6];
  id v18 = v15;
  int v19 = v18;
  if (v18) {
    goto LABEL_11;
  }
  int64_t v35 = a6;
  int64_t v20 = a3;
  id v21 = IMGetSecAttrDataProtectionClassFromKeychainDataProtectionClass();
  id v36 = 0;
  int v19 = +[IDSNGMFullDeviceIdentity identityWithAccess:v21 usageIdentifier:@"com.apple.identityservicesd" error:&v36];
  id v22 = v36;
  uint32_t v23 = v22;
  if (a7 && v22) {
    *a7 = v22;
  }
  if (a8 && v23) {
    *a8 = v23;
  }

  a3 = v20;
  a6 = v35;
  if (v19)
  {
LABEL_11:
    v24 = +[NSNumber numberWithUnsignedInt:[(IDSRegistrationKeyManagerIdentityDataSource *)self ngmVersion]];
  }
  else
  {
    v31 = +[IMRGLog registration];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      if (a8) {
        id v33 = *a8;
      }
      else {
        id v33 = 0;
      }
      *(_DWORD *)buf = 138543874;
      int64_t v38 = (int64_t)v33;
      __int16 v39 = 2048;
      int64_t v40 = a3;
      __int16 v41 = 2048;
      int64_t v42 = v35;
      _os_log_fault_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "Failed to generate ngmIdentity -- returning container with nil ngm identity {error: %{public}@, identifier: %ld, dataProtectionClass: %ld}", buf, 0x20u);
    }

    int v19 = 0;
    v24 = 0;
  }
  id v25 = v14;
  __int16 v26 = v25;
  if (v25
    || (+[IDSMPFullLegacyIdentity identityWithDataProtectionClass:v17 error:a8], (__int16 v26 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v27 = +[IDSMPFullDeviceIdentityContainer identityWithLegacyFullIdentity:ngmFullDeviceIdentity:ngmVersion:error:](IDSMPFullDeviceIdentityContainer, "identityWithLegacyFullIdentity:ngmFullDeviceIdentity:ngmVersion:error:", v26, v19, v24, a8, v35);
    if (v27)
    {
      __int16 v28 = (void *)v27;
      goto LABEL_24;
    }
    id v29 = +[IMRGLog registration];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      if (a8) {
        id v30 = *a8;
      }
      else {
        id v30 = 0;
      }
      *(_DWORD *)buf = 138543874;
      int64_t v38 = (int64_t)v30;
      __int16 v39 = 2048;
      int64_t v40 = a3;
      __int16 v41 = 2048;
      int64_t v42 = a6;
      _os_log_fault_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "Failed to generate fullDeviceContainer -- returning nil {error: %{public}@, identifier: %ld, dataProtectionClass: %ld}", buf, 0x20u);
    }
  }
  else
  {
    id v29 = +[IMRGLog registration];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      if (a8) {
        id v34 = *a8;
      }
      else {
        id v34 = 0;
      }
      *(_DWORD *)buf = 138543874;
      int64_t v38 = (int64_t)v34;
      __int16 v39 = 2048;
      int64_t v40 = a3;
      __int16 v41 = 2048;
      int64_t v42 = a6;
      _os_log_fault_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "Failed to generate legacyIdentity -- returning nil container {error: %{public}@, identifier: %ld, dataProtectionClass: %ld}", buf, 0x20u);
    }
    __int16 v26 = 0;
  }

  __int16 v28 = 0;
LABEL_24:

  return v28;
}

- (BOOL)saveIdentityContainer:(id)a3 withIdentifier:(int64_t)a4 dataProtectionClass:(int64_t)a5 error:(id *)a6
{
  v10 = a3;
  id v11 = [v10 dataRepresentationWithError:a6];
  if (v11)
  {
    id v12 = [(id)objc_opt_class() containerStorageItemNameForContainerIdentityIdentifier:a4];
    unsigned int v13 = [(IDSRegistrationKeyManagerIdentityDataSource *)self keychainWrapper];
    unsigned __int8 v14 = [v13 saveData:v11 forIdentifier:v12 allowSync:0 allowBackup:0 dataProtectionClass:a5 error:a6];

    if ((v14 & 1) == 0)
    {
      id v15 = +[IMRGLog registration];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        if (a6) {
          id v18 = *a6;
        }
        else {
          id v18 = 0;
        }
        int v19 = 138544643;
        id v20 = v18;
        __int16 v21 = 2048;
        int64_t v22 = a4;
        __int16 v23 = 2048;
        int64_t v24 = a5;
        __int16 v25 = 2114;
        __int16 v26 = v12;
        __int16 v27 = 2113;
        __int16 v28 = v11;
        __int16 v29 = 2113;
        id v30 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to identity to keychain {error: %{public}@, identifier: %ld, dataProtectionClas: %ld, storageIdentifier: %{public}@, dataToSave: %{private}@, container: %{private}@}", (uint8_t *)&v19, 0x3Eu);
      }
    }
  }
  else
  {
    id v12 = +[IMRGLog registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      if (a6) {
        id v17 = *a6;
      }
      else {
        id v17 = 0;
      }
      int v19 = 138544131;
      id v20 = v17;
      __int16 v21 = 2048;
      int64_t v22 = a4;
      __int16 v23 = 2048;
      int64_t v24 = a5;
      __int16 v25 = 2113;
      __int16 v26 = v10;
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Failed to generate data from container -- not saving {error: %{public}@, identifier: %ld, dataProtectionClass: %ld, container: %{private}@}", (uint8_t *)&v19, 0x2Au);
    }
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (__SecKey)copyIdentityFromKeychainWithApplicationKeyIndex:(unsigned __int16)a3 error:(id *)a4
{
  int v5 = a3;
  v6 = [(id)objc_opt_class() containerStorageItemNameForContainerIdentityIdentifier:2 applicationKeyIndex:a3];
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
  CFDictionaryAddValue(Mutable, kSecAttrKeyType, kSecAttrKeyTypeECSECPrimeRandom);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassKey);
  CFDictionaryAddValue(Mutable, kSecAttrKeyClass, kSecAttrKeyClassPrivate);
  CFDictionaryAddValue(Mutable, kSecAttrKeySizeInBits, &off_1009D23E8);
  CFDictionaryAddValue(Mutable, kSecAttrApplicationTag, @"com.apple.identityservicesd");
  CFDictionaryAddValue(Mutable, kSecAttrLabel, v6);
  CFDictionaryAddValue(Mutable, kSecAttrIsPermanent, kCFBooleanTrue);
  CFDictionaryAddValue(Mutable, kSecReturnRef, kCFBooleanTrue);
  CFDictionaryAddValue(Mutable, kSecAttrAccessible, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly);
  CFDictionaryAddValue(Mutable, kSecUseDataProtectionKeychain, kCFBooleanTrue);
  CFTypeRef result = 0;
  uint64_t v8 = SecItemCopyMatching(Mutable, &result);
  CFTypeRef v9 = result;
  v10 = +[IMRGLog registration];
  id v11 = v10;
  if (v8 || !v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100723688(v8);
    }

    if (result)
    {
      CFRelease(result);
      CFTypeRef result = 0;
    }
    CFTypeRef cf = 0;
    uint64_t v12 = SecItemCopyMatching(Mutable, &cf);
    CFTypeRef v13 = cf;
    unsigned __int8 v14 = +[IMRGLog registration];
    id v15 = v14;
    if (v12 || !v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1007235EC(v12);
      }

      if (a4)
      {
        CFStringRef v21 = @"IDSKeychainWrapperErrorOSStatus";
        __int16 v16 = +[NSNumber numberWithInt:v12];
        int64_t v22 = v16;
        id v17 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        *a4 = +[NSError errorWithDomain:@"IDSKeychainWrapperErrorDomain" code:-2000 userInfo:v17];
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      if (Mutable)
      {
        CFRelease(Mutable);
        Mutable = 0;
      }
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109379;
        int v24 = v5;
        __int16 v25 = 2113;
        CFTypeRef v26 = cf;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Loaded identity on second try -- done {index: %u, secondTry: %{private}@}", buf, 0x12u);
      }

      if (Mutable) {
        CFRelease(Mutable);
      }
      Mutable = (__CFDictionary *)cf;
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109379;
      int v24 = v5;
      __int16 v25 = 2113;
      CFTypeRef v26 = result;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Loaded identity on first try -- done {index: %u, firstTry: %{private}@}", buf, 0x12u);
    }

    if (Mutable) {
      CFRelease(Mutable);
    }
    Mutable = (__CFDictionary *)result;
  }

  return Mutable;
}

- (id)loadIdentityContainerWithIdentifier:(int64_t)a3 withLegacyFallback:(BOOL)a4 serializationDidChange:(BOOL *)a5 deserializationDidFail:(BOOL *)a6 needsEncryptionIdentityRoll:(BOOL *)a7 nonLegacyError:(id *)a8 error:(id *)a9
{
  BOOL v13 = a4;
  id v15 = [(id)objc_opt_class() containerStorageItemNameForContainerIdentityIdentifier:a3];
  id v45 = 0;
  __int16 v16 = [(IDSRegistrationKeyManagerIdentityDataSource *)self _loadContainerWithIdentifier:v15 serializationDidChage:a5 deserializationDidFail:a6 needsEncryptionIdentityRoll:a7 error:&v45];
  id v17 = v45;
  id v18 = v17;
  if (a8 && v17) {
    *a8 = v17;
  }
  if (!v16)
  {
    __int16 v39 = v15;
    CFStringRef v21 = +[IMRGLog registration];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100723798((uint64_t)v18);
    }

    id v44 = 0;
    id v15 = v39;
    int64_t v40 = [(IDSRegistrationKeyManagerIdentityDataSource *)self _loadContainerWithIdentifier:v39 serializationDidChage:a5 deserializationDidFail:a6 needsEncryptionIdentityRoll:a7 error:&v44];
    id v22 = v44;
    id v18 = v22;
    if (a8 && v22) {
      *a8 = v22;
    }
    if (v40)
    {
      if (a9 && v18) {
        *a9 = v18;
      }
      __int16 v23 = +[IMRGLog registration];
      int v24 = v40;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218243;
        int64_t v47 = a3;
        __int16 v48 = 2113;
        int64_t v49 = (int64_t)v40;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Loaded identity container on second try -- done {identifier: %ld, secondTry: %{private}@}", buf, 0x16u);
      }

      id v20 = v40;
      goto LABEL_50;
    }
    __int16 v25 = +[IMRGLog registration];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100723724((uint64_t)v18);
    }

    if (a7) {
      *a7 = 0;
    }
    if (!v13)
    {
      id v20 = 0;
LABEL_39:
      int v24 = 0;
LABEL_50:

      goto LABEL_51;
    }
    CFTypeRef v26 = [(id)objc_opt_class() legacyStorageItemNameForContainerIdentityIdentifier:a3];
    BOOL v43 = 0;
    uint64_t v27 = [(IDSRegistrationKeyManagerIdentityDataSource *)self _retrying_loadLegacyIdentityWithIdentifier:v26 serializationDidChange:a5 deserializationDidFail:&v43 error:a9];
    __int16 v28 = (void *)v27;
    if (a6) {
      *a6 = v43;
    }
    if (v27)
    {
      uint64_t v29 = +[IDSMPFullDeviceIdentityContainer identityWithLegacyFullIdentity:v27 ngmFullDeviceIdentity:0 ngmVersion:0 error:a9];
      if (v29)
      {
        id v20 = (id)v29;
        if (![(IDSRegistrationKeyManagerIdentityDataSource *)self saveIdentityContainer:v29 withIdentifier:a3 dataProtectionClass:0 error:a9])
        {
          id v30 = +[IMRGLog registration];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            if (a9) {
              id v38 = *a9;
            }
            else {
              id v38 = 0;
            }
            *(_DWORD *)buf = 138544131;
            int64_t v47 = (int64_t)v38;
            __int16 v48 = 2048;
            int64_t v49 = a3;
            __int16 v50 = 2048;
            id v51 = v26;
            __int16 v52 = 2113;
            v53 = v28;
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to migrate container with legacyIdentity {error: %{public}@, identifier: %ld, legacyIdentifier: %ld, legacyIdentity: %{private}@", buf, 0x2Au);
          }
        }
        v31 = +[IMRGLog registration];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218499;
          int64_t v47 = a3;
          __int16 v48 = 2048;
          int64_t v49 = (int64_t)v26;
          __int16 v50 = 2113;
          id v51 = v20;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Loaded legacy identity -- returning container with nil ngmIdentity {identifier: %ld, legacyIdentifier: %ld, container: %{private}@", buf, 0x20u);
        }

        goto LABEL_39;
      }
      id v34 = +[IMRGLog registration];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        if (a9) {
          id v37 = *a9;
        }
        else {
          id v37 = 0;
        }
        *(_DWORD *)buf = 138544131;
        int64_t v47 = (int64_t)v37;
        __int16 v48 = 2048;
        int v24 = 0;
        int64_t v49 = a3;
        __int16 v50 = 2048;
        id v51 = v26;
        __int16 v52 = 2113;
        v53 = v28;
        _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to create container with legacyIdentity -- returning nil {error: %{public}@, identifier: %ld, legacyIdentifier: %ld, legacyIdentity: %{private}@", buf, 0x2Au);
      }
      else
      {
        int v24 = 0;
      }
    }
    else
    {
      int v24 = 0;
      if (!v43)
      {
LABEL_49:

        id v20 = 0;
        goto LABEL_50;
      }
      __int16 v32 = [(IDSRegistrationKeyManagerIdentityDataSource *)self keychainWrapper];
      id v42 = 0;
      unsigned __int8 v33 = [v32 removeDataForIdentifier:v26 dataProtectionClass:2 error:&v42];
      id v34 = v42;

      if ((v33 & 1) == 0)
      {
        int64_t v35 = +[IMRGLog registration];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138544131;
          int64_t v47 = (int64_t)v34;
          __int16 v48 = 2048;
          int64_t v49 = a3;
          __int16 v50 = 2048;
          id v51 = v26;
          __int16 v52 = 2113;
          v53 = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to remove legacy identity -- purging {removeError: %{public}@, identifier: %ld, legacyIdentifier: %ld, legacyIdentity: %{private}@", buf, 0x2Au);
        }
      }
      id v15 = v39;
    }

    goto LABEL_49;
  }
  if (a9 && v18) {
    *a9 = v18;
  }
  int v19 = +[IMRGLog registration];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218243;
    int64_t v47 = a3;
    __int16 v48 = 2113;
    int64_t v49 = (int64_t)v16;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Loaded identity container on first try -- done {identifier: %ld, firstTry: %{private}@}", buf, 0x16u);
  }

  id v20 = v16;
LABEL_51:

  return v20;
}

- (BOOL)loadIsIdentityRegisteredForApplicationKeyIndex:(unsigned __int16)a3 error:(id *)a4
{
  v6 = [(id)objc_opt_class() containerStorageItemNameForIsRegisteredAtApplicationKeyIndex:a3];
  if (v6)
  {
    v7 = [(IDSRegistrationKeyManagerIdentityDataSource *)self keychainWrapper];
    uint64_t v8 = [v7 dataForIdentifier:v6 error:a4];

    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)saveIsRegistered:(BOOL)a3 forApplicationKeyIndex:(unsigned __int16)a4 error:(id *)a5
{
  BOOL v6 = a3;
  uint64_t v8 = [(id)objc_opt_class() containerStorageItemNameForIsRegisteredAtApplicationKeyIndex:a4];
  if (v8)
  {
    if (v6)
    {
      char v14 = 1;
      BOOL v9 = +[NSData dataWithBytes:&v14 length:1];
      v10 = [(IDSRegistrationKeyManagerIdentityDataSource *)self keychainWrapper];
      unsigned __int8 v11 = [v10 saveData:v9 forIdentifier:v8 allowSync:0 dataProtectionClass:0 error:a5];
    }
    else
    {
      uint64_t v12 = [(IDSRegistrationKeyManagerIdentityDataSource *)self keychainWrapper];
      unsigned __int8 v11 = [v12 removeDataForIdentifier:v8 dataProtectionClass:0 error:a5];
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)loadKTRegistrationDataForKeyIndex:(unsigned __int16)a3 isRegistered:(BOOL)a4 error:(id *)a5
{
  v7 = [(id)objc_opt_class() containerStorageItemNameForKTDataAtKeyIndex:a3 isRegistered:a4];
  if (v7)
  {
    uint64_t v8 = [(IDSRegistrationKeyManagerIdentityDataSource *)self keychainWrapper];
    BOOL v9 = [v8 dataForIdentifier:v7 error:a5];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)saveKTRegistrationData:(id)a3 forKeyIndex:(unsigned __int16)a4 isRegistered:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v8 = a4;
  id v10 = a3;
  unsigned __int8 v11 = [(id)objc_opt_class() containerStorageItemNameForKTDataAtKeyIndex:v8 isRegistered:v7];
  if (v11)
  {
    uint64_t v12 = [(IDSRegistrationKeyManagerIdentityDataSource *)self keychainWrapper];
    unsigned __int8 v13 = [v12 saveData:v10 forIdentifier:v11 allowSync:0 dataProtectionClass:0 error:a6];
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (BOOL)removeKTRegistrationDataForKeyIndex:(unsigned __int16)a3 isRegistered:(BOOL)a4 error:(id *)a5
{
  BOOL v7 = [(id)objc_opt_class() containerStorageItemNameForKTDataAtKeyIndex:a3 isRegistered:a4];
  if (v7)
  {
    uint64_t v8 = [(IDSRegistrationKeyManagerIdentityDataSource *)self keychainWrapper];
    unsigned __int8 v9 = [v8 removeDataForIdentifier:v7 dataProtectionClass:0 error:a5];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)_eraseNGMIdentityFromKeychain:(id)a3
{
  id v3 = a3;
  id v8 = 0;
  unsigned __int8 v4 = [v3 eraseFromKeyChain:&v8];
  id v5 = v8;
  BOOL v6 = +[IMRGLog registration];
  BOOL v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Purged ngm full device identity {ngmFullDeviceIdentity: %@}", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10072380C((uint64_t)v5);
  }
}

- (BOOL)_removeDataFromKeychainForIdentifier:(id)a3 dataProtectionClass:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  unsigned __int8 v9 = [(IDSRegistrationKeyManagerIdentityDataSource *)self keychainWrapper];
  id v15 = 0;
  unsigned __int8 v10 = [v9 removeDataForIdentifier:v8 dataProtectionClass:a4 error:&v15];
  id v11 = v15;

  uint64_t v12 = +[IMRGLog registration];
  unsigned __int8 v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Purged key blob from keychain {identifier: %@}", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100723880((uint64_t)v11);
    }

    if (a5) {
      *a5 = v11;
    }
  }

  return v10;
}

- (BOOL)removeIdentityWithApplicationKeyIndex:(unsigned __int16)a3 error:(id *)a4
{
  unsigned __int8 v4 = [(id)objc_opt_class() containerStorageItemNameForContainerIdentityIdentifier:2 applicationKeyIndex:a3];
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
  CFDictionaryAddValue(Mutable, kSecAttrKeyType, kSecAttrKeyTypeECSECPrimeRandom);
  CFDictionaryAddValue(Mutable, kSecAttrKeySizeInBits, &off_1009D23E8);
  CFDictionaryAddValue(Mutable, kSecAttrApplicationTag, @"com.apple.identityservicesd");
  CFDictionaryAddValue(Mutable, kSecAttrLabel, v4);
  CFDictionaryAddValue(Mutable, kSecAttrIsPermanent, kCFBooleanTrue);
  CFDictionaryAddValue(Mutable, kSecReturnRef, kCFBooleanTrue);
  CFDictionaryAddValue(Mutable, kSecAttrAccessible, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly);
  OSStatus v6 = SecItemDelete(Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }

  return v6 == 0;
}

- (BOOL)removeIdentityContainer:(id)a3 withIdentifier:(int64_t)a4 dataProtectionClass:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = [v10 legacyFullIdentity];
  id v21 = 0;
  unsigned __int8 v12 = [v11 purgeFromKeychain:&v21];
  id v13 = v21;

  char v14 = +[IMRGLog registration];
  id v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = [v10 legacyFullIdentity];
      *(_DWORD *)buf = 138412290;
      __int16 v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Purged legacy full identity {legacyFullIdentity: %@}", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    sub_1007238F4((uint64_t)v13, v10, v15);
  }

  id v17 = [v10 ngmFullDeviceIdentity];
  [(IDSRegistrationKeyManagerIdentityDataSource *)self _eraseNGMIdentityFromKeychain:v17];

  id v18 = [(id)objc_opt_class() containerStorageItemNameForContainerIdentityIdentifier:a4];
  BOOL v19 = [(IDSRegistrationKeyManagerIdentityDataSource *)self _removeDataFromKeychainForIdentifier:v18 dataProtectionClass:a5 error:a6];

  return v19;
}

- (id)_retrying_loadLegacyIdentityWithIdentifier:(id)a3 serializationDidChange:(BOOL *)a4 deserializationDidFail:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = [(IDSRegistrationKeyManagerIdentityDataSource *)self _loadLegacyIdentityWithIdentifier:v10 serializationDidChange:a4 deserializationDidFail:a5 error:a6];
  unsigned __int8 v12 = +[IMRGLog registration];
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
      {
        if (*a4) {
          CFStringRef v14 = @"YES";
        }
        else {
          CFStringRef v14 = @"NO";
        }
      }
      else
      {
        CFStringRef v14 = 0;
      }
      int v21 = 138543875;
      id v22 = v10;
      __int16 v23 = 2114;
      CFStringRef v24 = v14;
      __int16 v25 = 2113;
      id v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Loaded identity on first try {identifier: %{public}@}, serializationDidChange: %{public}@, firstTry: %{private}@}", (uint8_t *)&v21, 0x20u);
    }

    id v15 = v11;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100723A20();
    }

    id v15 = [(IDSRegistrationKeyManagerIdentityDataSource *)self _loadLegacyIdentityWithIdentifier:v10 serializationDidChange:a4 deserializationDidFail:a5 error:a6];
    __int16 v16 = +[IMRGLog registration];
    id v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        if (a4)
        {
          if (*a4) {
            CFStringRef v18 = @"YES";
          }
          else {
            CFStringRef v18 = @"NO";
          }
        }
        else
        {
          CFStringRef v18 = 0;
        }
        int v21 = 138543875;
        id v22 = v10;
        __int16 v23 = 2114;
        CFStringRef v24 = v18;
        __int16 v25 = 2113;
        id v26 = v15;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Loaded identity on second try {identifier: %{public}@, serializationDidChange: %{public}@, secondTry: %{private}@}", (uint8_t *)&v21, 0x20u);
      }

      id v19 = v15;
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1007239A8();
      }
    }
  }

  return v15;
}

- (id)_loadLegacyIdentityWithIdentifier:(id)a3 serializationDidChange:(BOOL *)a4 deserializationDidFail:(BOOL *)a5 error:(id *)a6
{
  id v11 = a3;
  if (!v11)
  {
    id v22 = +[NSAssertionHandler currentHandler];
    [v22 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManagerIdentityDataSource.m", 508, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  unsigned __int8 v12 = [(IDSRegistrationKeyManagerIdentityDataSource *)self keychainWrapper];
  id v13 = [v12 dataForIdentifier:v11 error:a6];

  CFStringRef v14 = +[IMRGLog registration];
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      CFStringRef v24 = v11;
      __int16 v25 = 2113;
      id v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Loaded identity data from keychain {identifier: %{public}@, data: %{private}@}", buf, 0x16u);
    }

    __int16 v16 = +[IDSMPFullLegacyIdentity identityWithData:v13 error:a6];
    id v15 = v16;
    if (v16)
    {
      if (a4) {
        *a4 = [v16 didDataRepresentationFormatChangeFromDataRepresentation:v13 error:a6];
      }
      id v17 = +[IMRGLog registration];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543619;
        CFStringRef v24 = v11;
        __int16 v25 = 2113;
        id v26 = v15;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Loaded identity from keychain data {identifier: %{public}@, identity: %{private}@}", buf, 0x16u);
      }

      id v15 = v15;
      CFStringRef v18 = v15;
    }
    else
    {
      id v19 = +[IMRGLog registration];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        if (a6) {
          int v21 = *a6;
        }
        else {
          int v21 = 0;
        }
        *(_DWORD *)buf = 138543875;
        CFStringRef v24 = v21;
        __int16 v25 = 2114;
        id v26 = v11;
        __int16 v27 = 2113;
        __int16 v28 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to load identity from data {error: %{public}@, identifier: %{public}@, data: %{private}@}", buf, 0x20u);
      }

      if (a5) {
        *a5 = 1;
      }
      CFStringRef v18 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100723A98();
    }
    CFStringRef v18 = 0;
  }

  return v18;
}

- (id)_loadIdentityWithIdentifier:(id)a3 serializationDidChage:(BOOL *)a4 deserializationDidFail:(BOOL *)a5 error:(id *)a6
{
  id v11 = a3;
  if (!v11)
  {
    __int16 v28 = +[NSAssertionHandler currentHandler];
    [v28 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManagerIdentityDataSource.m", 535, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  unsigned __int8 v12 = [(IDSRegistrationKeyManagerIdentityDataSource *)self keychainWrapper];
  id v13 = [v12 dataForIdentifier:v11 error:a6];

  CFStringRef v14 = +[IMRGLog registration];
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      id v30 = v11;
      __int16 v31 = 2113;
      __int16 v32 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Loaded identity data from keychain {identifier: %{public}@, data: %{private}@}", buf, 0x16u);
    }

    __int16 v16 = +[IDSNGMFullDeviceIdentity identityWithDataRepresentation:v13 error:a6];
    id v15 = v16;
    if (v16)
    {
      if (a4)
      {
        id v17 = [v16 dataRepresentationWithError:a6];
        CFStringRef v18 = v17;
        if (v17)
        {
          unsigned int v19 = [v17 isEqualToData:v13];
          id v20 = +[IMRGLog registration];
          int v21 = v20;
          if (v19)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              id v30 = v15;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Serialization did NOT change for identity {identity: %{private}@}", buf, 0xCu);
            }

            *a4 = 0;
          }
          else
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138478339;
              id v30 = v15;
              __int16 v31 = 2113;
              __int16 v32 = v18;
              __int16 v33 = 2113;
              id v34 = v13;
              _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Serialization did change for identity {identity: %{private}@, reSerializedData: %{private}@, data: %{private}@}", buf, 0x20u);
            }

            *a4 = 1;
          }
        }
        else
        {
          CFStringRef v24 = +[IMRGLog registration];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
            sub_100723B10((uint64_t *)a6);
          }
        }
      }
      __int16 v25 = +[IMRGLog registration];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543619;
        id v30 = v11;
        __int16 v31 = 2113;
        __int16 v32 = v15;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Loaded identity from keychain data {identifier: %{public}@, identity: %{private}@}", buf, 0x16u);
      }

      id v15 = v15;
      id v22 = v15;
    }
    else
    {
      __int16 v23 = +[IMRGLog registration];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        if (a6) {
          __int16 v27 = *a6;
        }
        else {
          __int16 v27 = 0;
        }
        *(_DWORD *)buf = 138543875;
        id v30 = v27;
        __int16 v31 = 2114;
        __int16 v32 = v11;
        __int16 v33 = 2113;
        id v34 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to load identity from data {error: %{public}@, identifier: %{public}@, data: %{private}@}", buf, 0x20u);
      }

      if (a5) {
        *a5 = 1;
      }
      id v22 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100723A98();
    }
    id v22 = 0;
  }

  return v22;
}

- (id)_loadContainerWithIdentifier:(id)a3 serializationDidChage:(BOOL *)a4 deserializationDidFail:(BOOL *)a5 needsEncryptionIdentityRoll:(BOOL *)a6 error:(id *)a7
{
  id v13 = a3;
  if (!v13)
  {
    __int16 v32 = +[NSAssertionHandler currentHandler];
    [v32 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManagerIdentityDataSource.m", 573, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  CFStringRef v14 = [(IDSRegistrationKeyManagerIdentityDataSource *)self keychainWrapper];
  id v15 = [v14 dataForIdentifier:v13 error:a7];

  __int16 v16 = +[IMRGLog registration];
  id v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      id v34 = v13;
      __int16 v35 = 2113;
      id v36 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Loaded identity data from keychain {identifier: %{public}@, data: %{private}@}", buf, 0x16u);
    }

    CFStringRef v18 = +[IDSMPFullDeviceIdentityContainer identityWithDataRepresentation:v15 error:a7];
    id v17 = v18;
    if (v18)
    {
      unsigned int v19 = [v18 ngmFullDeviceIdentity];
      unsigned int v20 = [v19 shouldRollEncryptionIdentity];

      if (a6 && v20) {
        *a6 = 1;
      }
      if (a4)
      {
        int v21 = [v17 dataRepresentationWithError:a7];
        id v22 = v21;
        if (v21)
        {
          unsigned int v23 = [v21 isEqualToData:v15];
          CFStringRef v24 = +[IMRGLog registration];
          __int16 v25 = v24;
          if (v23)
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              id v34 = v17;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Serialization did NOT change for identity {identity: %{private}@}", buf, 0xCu);
            }

            *a4 = 0;
          }
          else
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138478339;
              id v34 = v17;
              __int16 v35 = 2113;
              id v36 = v22;
              __int16 v37 = 2113;
              id v38 = v15;
              _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Serialization did change for identity {identity: %{private}@, reSerializedData: %{private}@, data: %{private}@}", buf, 0x20u);
            }

            *a4 = 1;
          }
        }
        else
        {
          __int16 v28 = +[IMRGLog registration];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
            sub_100723B10((uint64_t *)a7);
          }
        }
      }
      uint64_t v29 = +[IMRGLog registration];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543619;
        id v34 = v13;
        __int16 v35 = 2113;
        id v36 = v17;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Loaded identity from keychain data {identifier: %{public}@, identity: %{private}@}", buf, 0x16u);
      }

      id v17 = v17;
      id v26 = v17;
    }
    else
    {
      __int16 v27 = +[IMRGLog registration];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        if (a7) {
          __int16 v31 = *a7;
        }
        else {
          __int16 v31 = 0;
        }
        *(_DWORD *)buf = 138543875;
        id v34 = v31;
        __int16 v35 = 2114;
        id v36 = v13;
        __int16 v37 = 2113;
        id v38 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to load identity container from data {error: %{public}@, identifier: %{public}@, data: %{private}@}", buf, 0x20u);
      }

      if (a5) {
        *a5 = 1;
      }
      id v26 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100723B94();
    }
    id v26 = 0;
  }

  return v26;
}

- (unsigned)ngmVersion
{
  unsigned int v2 = +[IDSNGMProtocolVersion supportedVersion];
  id v3 = +[IMLockdownManager sharedInstance];
  unsigned int v4 = [v3 isInternalInstall];

  if (v4)
  {
    id v5 = IMGetAppValueForKey();
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v6 = [v5 unsignedIntValue];
        if (v6 > v2) {
          unsigned int v2 = v6;
        }
      }
    }
  }
  return v2;
}

- (id)dataRepresentationForNGMVersion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v4 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
  id v9 = 0;
  id v5 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:200 options:0 error:&v9];
  id v6 = v9;
  if (!v5)
  {
    BOOL v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100723C0C((uint64_t)v6, v3, v7);
    }
  }

  return v5;
}

- (unsigned)ngmVersionFromDataRepresentation:(id)a3
{
  id v3 = a3;
  id v9 = 0;
  unsigned int v4 = +[NSPropertyListSerialization propertyListWithData:v3 options:0 format:0 error:&v9];
  id v5 = v9;
  if (v4)
  {
    unsigned int v6 = [v4 unsignedIntValue];
  }
  else
  {
    BOOL v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100723C88((uint64_t)v5);
    }

    unsigned int v6 = 0;
  }

  return v6;
}

- (IDSKeychainWrapper)keychainWrapper
{
  return self->_keychainWrapper;
}

- (void).cxx_destruct
{
}

@end