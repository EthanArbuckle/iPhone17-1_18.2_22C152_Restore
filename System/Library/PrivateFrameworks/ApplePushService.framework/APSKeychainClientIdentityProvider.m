@interface APSKeychainClientIdentityProvider
- (APSKeychainClientIdentityProvider)init;
- (BOOL)hasUnderlyingIdentityChanged;
- (BOOL)isIdentityAvailable;
- (__SecIdentity)cachedClientIdentity;
- (__SecIdentity)clientIdentity;
- (id)fetchHostVMCertAndSignNonce:(id)a3 error:(id *)a4;
- (id)identityAvailabilityDidChangeBlock;
- (void)_copyClientIdentityFromKeychain:(__SecIdentity *)a3;
- (void)_processPotentialIdentityChanged;
- (void)dealloc;
- (void)deleteClientIdentityRequestingReplacement;
- (void)fetchClientIdentityForcingNewCert:(BOOL)a3 withCompletion:(id)a4;
- (void)setCachedClientIdentity:(__SecIdentity *)a3;
- (void)setIdentityAvailabilityDidChangeBlock:(id)a3;
@end

@implementation APSKeychainClientIdentityProvider

- (APSKeychainClientIdentityProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)APSKeychainClientIdentityProvider;
  v2 = [(APSKeychainClientIdentityProvider *)&v6 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_100073CD4, @"com.apple.mobile.keybagd.first_unlock", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, v2, (CFNotificationCallback)sub_100073CD4, kLockdownNotificationIdentityChanged, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  cachedClientIdentity = self->_cachedClientIdentity;
  if (cachedClientIdentity) {
    CFRelease(cachedClientIdentity);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobile.keybagd.first_unlock", 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, kLockdownNotificationIdentityChanged, 0);
  v6.receiver = self;
  v6.super_class = (Class)APSKeychainClientIdentityProvider;
  [(APSKeychainClientIdentityProvider *)&v6 dealloc];
}

- (void)_copyClientIdentityFromKeychain:(__SecIdentity *)a3
{
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, APSBundleIdentifier);
  CFDictionaryAddValue(Mutable, kSecAttrLabel, @"APSClientIdentity");
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassIdentity);
  CFDictionaryAddValue(Mutable, kSecReturnRef, kCFBooleanTrue);
  v5 = +[APSMultiUserMode sharedInstance];
  unsigned int v6 = [v5 isMultiUser];

  if (v6) {
    CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, kCFBooleanTrue);
  }
  OSStatus v7 = SecItemCopyMatching(Mutable, (CFTypeRef *)a3);
  if (v7 != -25300)
  {
    int v8 = v7;
    if (v7)
    {
      v9 = +[APSLog courier];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000CA8A0(v8, v9);
      }
    }
  }
  CFRelease(Mutable);
}

- (void)_processPotentialIdentityChanged
{
  if ([(APSKeychainClientIdentityProvider *)self hasUnderlyingIdentityChanged])
  {
    v3 = [(APSKeychainClientIdentityProvider *)self identityAvailabilityDidChangeBlock];

    if (v3)
    {
      v4 = [(APSKeychainClientIdentityProvider *)self identityAvailabilityDidChangeBlock];
      v4[2](v4, [(APSKeychainClientIdentityProvider *)self isIdentityAvailable]);
    }
  }
}

- (BOOL)isIdentityAvailable
{
  BOOL result = self->_cachedClientIdentity
        || (uint64_t v3 = 0,
            [(APSKeychainClientIdentityProvider *)self _copyClientIdentityFromKeychain:&v3], v3)|| sub_100074054(0) != 0;
  return result;
}

- (__SecIdentity)clientIdentity
{
  p_cachedClientIdentity = (const void **)&self->_cachedClientIdentity;
  if (self->_cachedClientIdentity)
  {
    uint64_t v3 = +[APSLog courier];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *p_cachedClientIdentity;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v4;
      v5 = "_getClientIdentity: already had identity: %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v5, buf, 0xCu);
      goto LABEL_29;
    }
    goto LABEL_29;
  }
  [(APSKeychainClientIdentityProvider *)self _copyClientIdentityFromKeychain:&self->_cachedClientIdentity];
  cachedClientIdentity = self->_cachedClientIdentity;
  uint64_t v3 = +[APSLog courier];
  BOOL v8 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (!cachedClientIdentity)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "No identity found in keychain. Copying activation identity.", buf, 2u);
    }

    id v24 = 0;
    v10 = sub_100074054(&v24);
    uint64_t v3 = v24;
    *p_cachedClientIdentity = v10;
    uint64_t v11 = MGGetBoolAnswer();
    if (!*p_cachedClientIdentity)
    {
      uint64_t v12 = v11;
      v13 = +[APSLog courier];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000CA9DC((uint64_t)v3, v12, v13);
      }

      if (!*p_cachedClientIdentity) {
        goto LABEL_29;
      }
    }
    v14 = +[APSLog courier];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *p_cachedClientIdentity;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Got identity from keychain: %@", buf, 0xCu);
    }

    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, APSBundleIdentifier);
    CFDictionaryAddValue(Mutable, kSecAttrLabel, @"APSClientIdentity");
    CFDictionaryAddValue(Mutable, kSecValueRef, *p_cachedClientIdentity);
    CFDictionaryAddValue(Mutable, kSecReturnPersistentRef, kCFBooleanTrue);
    v17 = +[APSMultiUserMode sharedInstance];
    unsigned int v18 = [v17 isMultiUser];

    if (v18) {
      CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, kCFBooleanTrue);
    }
    *(void *)buf = 0;
    OSStatus v19 = SecItemAdd(Mutable, (CFTypeRef *)buf);
    v20 = *(const void **)buf;
    if (v19 || *(void *)buf)
    {
      if (!v19)
      {
LABEL_26:
        if (v20) {
          CFRelease(v20);
        }
        CFRelease(Mutable);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, APSClientIdentityUpdatedNotification, 0, 0, 1uLL);
        goto LABEL_29;
      }
      v21 = +[APSLog courier];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1000CA91C(v19, v21);
      }
    }
    else
    {
      v21 = +[APSLog courier];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1000CA998(v21);
      }
    }

    v20 = *(const void **)buf;
    goto LABEL_26;
  }
  if (v8)
  {
    v9 = *p_cachedClientIdentity;
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v9;
    v5 = "Found identity in keychain: %@";
    goto LABEL_7;
  }
LABEL_29:

  return (__SecIdentity *)*p_cachedClientIdentity;
}

- (void)fetchClientIdentityForcingNewCert:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  unsigned int v6 = (void (**)(id, SecKeyRef, void *))a4;
  if (v4)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, APSBundleIdentifier);
    CFDictionaryAddValue(Mutable, kSecAttrLabel, @"APSClientIdentity");
    CFDictionaryAddValue(Mutable, kSecClass, kSecClassIdentity);
    BOOL v8 = +[APSMultiUserMode sharedInstance];
    unsigned int v9 = [v8 isMultiUser];

    if (v9) {
      CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, kCFBooleanTrue);
    }
    uint64_t v10 = SecItemDelete(Mutable);
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = +[APSLog courier];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000CAA6C((uint64_t)self, v11, v12);
      }
    }
    CFRelease(Mutable);
    cachedClientIdentity = self->_cachedClientIdentity;
    if (cachedClientIdentity)
    {
      CFRelease(cachedClientIdentity);
      self->_cachedClientIdentity = 0;
    }
  }
  v14 = [(APSKeychainClientIdentityProvider *)self clientIdentity];
  SecCertificateRef certificate = 0;
  SecKeyRef privateKeyRef = 0;
  v15 = +[NSMutableArray array];
  if (v14)
  {
    if (SecIdentityCopyPrivateKey(v14, &privateKeyRef))
    {
      v16 = +[APSLog courier];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ could not copy private key!", buf, 0xCu);
      }
    }
    if (SecIdentityCopyCertificate(v14, &certificate) || !certificate)
    {
      v17 = +[APSLog courier];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = self;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ could not copy device certificate!", buf, 0xCu);
      }
    }
    else
    {
      v17 = SecCertificateCopyData(certificate);
      [v15 addObject:v17];
    }
  }
  SecKeyRef v18 = privateKeyRef;
  if (v6)
  {
    v6[2](v6, privateKeyRef, v15);
    SecKeyRef v18 = privateKeyRef;
  }
  if (v18) {
    CFRelease(v18);
  }
  if (certificate) {
    CFRelease(certificate);
  }
}

- (void)deleteClientIdentityRequestingReplacement
{
}

- (BOOL)hasUnderlyingIdentityChanged
{
  uint64_t v3 = sub_100074054(0);
  CFTypeRef cf2 = 0;
  [(APSKeychainClientIdentityProvider *)self _copyClientIdentityFromKeychain:&cf2];
  if (v3)
  {
    if (cf2 && CFEqual(v3, cf2))
    {
      cachedClientIdentity = self->_cachedClientIdentity;
      if (cachedClientIdentity && CFEqual(v3, cachedClientIdentity))
      {
        BOOL v5 = 0;
LABEL_16:
        CFRelease(v3);
        goto LABEL_17;
      }
      unsigned int v6 = +[APSLog courier];
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
LABEL_15:

        BOOL v5 = 1;
        goto LABEL_16;
      }
      uint64_t v10 = self->_cachedClientIdentity;
      *(_DWORD *)buf = 138412802;
      v13 = self;
      __int16 v14 = 2112;
      v15 = v3;
      __int16 v16 = 2112;
      CFTypeRef v17 = v10;
      OSStatus v7 = "%@ device mobile activation identity doesn't match cached identity. {mobileActivationIdentiy %@; apsCachedIdentity %@}";
    }
    else
    {
      unsigned int v6 = +[APSLog courier];
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 138412802;
      v13 = self;
      __int16 v14 = 2112;
      v15 = v3;
      __int16 v16 = 2112;
      CFTypeRef v17 = cf2;
      OSStatus v7 = "%@ device mobile activation identity doesn't match apsd's keychain identity. {mobileActivationIdentiy %@; aps"
           "KeychainIdentity %@}";
    }
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v7, buf, 0x20u);
    goto LABEL_15;
  }
  if (cf2 || self->_cachedClientIdentity)
  {
    BOOL v8 = +[APSLog courier];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000CAAE8((uint64_t)self, (uint64_t *)&cf2, v8);
    }

    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }
LABEL_17:
  if (cf2) {
    CFRelease(cf2);
  }
  return v5;
}

- (id)fetchHostVMCertAndSignNonce:(id)a3 error:(id *)a4
{
  BOOL v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    BOOL v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ can't fetch host VM identity with an albert identity provider!", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (id)identityAvailabilityDidChangeBlock
{
  return self->identityAvailabilityDidChangeBlock;
}

- (void)setIdentityAvailabilityDidChangeBlock:(id)a3
{
}

- (__SecIdentity)cachedClientIdentity
{
  return self->_cachedClientIdentity;
}

- (void)setCachedClientIdentity:(__SecIdentity *)a3
{
  self->_cachedClientIdentity = a3;
}

- (void).cxx_destruct
{
}

@end