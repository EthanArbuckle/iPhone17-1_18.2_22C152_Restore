@interface NSURLCredential
+ (BOOL)supportsSecureCoding;
+ (NSURLCredential)credentialForTrust:(SecTrustRef)trust;
+ (NSURLCredential)credentialWithIdentity:(SecIdentityRef)identity certificates:(NSArray *)certArray persistence:(NSURLCredentialPersistence)persistence;
+ (NSURLCredential)credentialWithUser:(NSString *)user password:(NSString *)password persistence:(NSURLCredentialPersistence)persistence;
- (BOOL)_hasSWCACreatorAttribute;
- (BOOL)hasPassword;
- (BOOL)isEqual:(id)a3;
- (NSArray)certificates;
- (NSString)password;
- (NSString)user;
- (NSURLCredential)initWithCoder:(id)a3;
- (NSURLCredential)initWithIdentity:(SecIdentityRef)identity certificates:(NSArray *)certArray persistence:(NSURLCredentialPersistence)persistence;
- (NSURLCredential)initWithTrust:(SecTrustRef)trust;
- (NSURLCredential)initWithUser:(NSString *)user password:(NSString *)password persistence:(NSURLCredentialPersistence)persistence;
- (NSURLCredentialPersistence)persistence;
- (SecIdentityRef)identity;
- (_CFURLCredential)_CFURLCredential;
- (_CFURLCredential)_cfurlcredential;
- (id)_initWithCFURLCredential:(_CFURLCredential *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_removeSWCACreatorAttribute;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSURLCredential

- (void)_removeSWCACreatorAttribute
{
  internal = self->_internal;
  if (internal)
  {
    if (URLCredential::Class(void)::sOnce_URLCredential != -1) {
      dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_10148);
    }
    if (!*((_DWORD *)internal + 12))
    {
      if (URLCredentialInternetPassword::containsSWCACreator(*((const __CFDictionary **)internal + 12)))
      {
        CFAllocatorRef v3 = CFGetAllocator(internal);
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v3, 0, *((CFDictionaryRef *)internal + 12));
        if (MutableCopy)
        {
          v5 = MutableCopy;
          v6 = (const void *)*MEMORY[0x1E4F3B670];
          AutoScalar::AutoScalar((AutoScalar *)&v9, 0);
          CFDictionarySetValue(v5, v6, value);
          v9 = &unk_1ECF9A500;
          if (value) {
            CFRelease(value);
          }
          v7 = (const void *)*((void *)internal + 12);
          if (v7) {
            CFRelease(v7);
          }
          CFAllocatorRef v8 = CFGetAllocator(internal);
          *((void *)internal + 12) = CFDictionaryCreateCopy(v8, v5);
          CFRelease(v5);
        }
      }
    }
  }
}

- (BOOL)_hasSWCACreatorAttribute
{
  internal = self->_internal;
  if (!internal) {
    return 0;
  }
  if (URLCredential::Class(void)::sOnce_URLCredential != -1) {
    dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_10148);
  }
  return !*((_DWORD *)internal + 12)
      && URLCredentialInternetPassword::containsSWCACreator(*((const __CFDictionary **)internal + 12)) != 0;
}

- (NSURLCredential)initWithCoder:(id)a3
{
  if ([a3 requiresSecureCoding] && objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    CFDictionaryRef v13 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v21, "setWithObjects:", v20, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0), @"__nsurlcredential_proto_plist");
  }
  else
  {
    CFDictionaryRef v13 = (const __CFDictionary *)[a3 decodeObject];
  }
  if (v13)
  {
    v15 = URLCredential::createFromPropertyList((URLCredential *)*MEMORY[0x1E4F1CF80], v13, v14);
    v16 = v15;
    if (v15) {
      v17 = (char *)v15 - 16;
    }
    else {
      v17 = 0;
    }
    v18 = [(NSURLCredential *)self _initWithCFURLCredential:v17];
    if (v16) {
      CFRelease(v17);
    }
    return v18;
  }
  else
  {
    return (NSURLCredential *)[(NSURLCredential *)self _initWithCFURLCredential:0];
  }
}

- (void)encodeWithCoder:(id)a3
{
  CFTypeRef Archive = _CFURLCredentialCreateArchive((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (uint64_t)self->_internal);
  if (Archive)
  {
    uint64_t v5 = Archive;
    if ([a3 requiresSecureCoding] && objc_msgSend(a3, "allowsKeyedCoding")) {
      [a3 encodeObject:v5 forKey:@"__nsurlcredential_proto_plist"];
    }
    else {
      [a3 encodeObject:v5];
    }
    CFRelease(v5);
  }
}

- (NSURLCredential)initWithTrust:(SecTrustRef)trust
{
  v8.receiver = self;
  v8.super_class = (Class)NSURLCredential;
  v4 = [(NSURLCredential *)&v8 init];
  if (v4)
  {
    uint64_t v5 = (const void *)CFURLCredentialCreateWithTrust(*MEMORY[0x1E4F1CF80], trust);
    uint64_t v6 = (NSURLCredentialInternal *)CFMakeCollectable(v5);
    v4->_internal = v6;
    if (!v6)
    {

      return 0;
    }
  }
  return v4;
}

- (NSArray)certificates
{
  internal = self->_internal;
  if (!internal) {
    return 0;
  }
  if (URLCredential::Class(void)::sOnce_URLCredential != -1) {
    dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_10148);
  }
  if (*((_DWORD *)internal + 12) != 3) {
    return 0;
  }
  CFAllocatorRef v3 = *(uint64_t (**)(char *))(*((void *)internal + 2) + 112);

  return (NSArray *)v3((char *)internal + 16);
}

- (SecIdentityRef)identity
{
  internal = self->_internal;
  if (!internal) {
    return 0;
  }
  if (URLCredential::Class(void)::sOnce_URLCredential != -1) {
    dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_10148);
  }
  if (*((_DWORD *)internal + 12) != 3) {
    return 0;
  }
  CFAllocatorRef v3 = *(uint64_t (**)(char *))(*((void *)internal + 2) + 120);

  return (SecIdentityRef)v3((char *)internal + 16);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(internal) = 1;
  }
  else
  {
    self;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    internal = self->_internal;
    if (!internal) {
      return (char)internal;
    }
    uint64_t v6 = (const void *)*((void *)a3 + 1);
    if (!v6)
    {
LABEL_6:
      LOBYTE(internal) = 0;
      return (char)internal;
    }
    LOBYTE(internal) = CFEqual(internal, v6) != 0;
  }
  return (char)internal;
}

- (unint64_t)hash
{
  return CFHash(self->_internal);
}

- (id)description
{
  CFAllocatorRef v3 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)NSURLCredential;
  id v4 = [(NSURLCredential *)&v6 description];
  return (id)[v3 stringWithFormat:@"%@: %@", v4, CFURLCredentialGetUsername((uint64_t)self->_internal)];
}

- (NSURLCredentialPersistence)persistence
{
  internal = self->_internal;
  if (URLCredential::Class(void)::sOnce_URLCredential != -1) {
    dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_10148);
  }
  CFAllocatorRef v3 = (char *)internal + 16;
  if (!internal) {
    CFAllocatorRef v3 = 0;
  }
  return *((int *)v3 + 9) - 1;
}

- (BOOL)hasPassword
{
  uint64_t v2 = URLCredential_PasswordBased::safelyCast((uint64_t)self->_internal, (const _CFURLCredential *)a2);
  if (v2) {
    LOBYTE(v2) = (*(unsigned int (**)(uint64_t))(*(void *)v2 + 136))(v2) != 0;
  }
  return v2;
}

- (NSString)password
{
  uint64_t v2 = (void *)URLCredential_PasswordBased::safelyCast((uint64_t)self->_internal, (const _CFURLCredential *)a2);
  if (v2) {
    uint64_t v2 = (void *)(*(uint64_t (**)(void *))(*(void *)v2 + 128))(v2);
  }

  return (NSString *)v2;
}

- (NSString)user
{
  id v2 = (id)CFURLCredentialGetUsername((uint64_t)self->_internal);

  return (NSString *)v2;
}

- (_CFURLCredential)_CFURLCredential
{
  return (_CFURLCredential *)self->_internal;
}

- (_CFURLCredential)_cfurlcredential
{
  return (_CFURLCredential *)self->_internal;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLCredential;
  [(NSURLCredential *)&v3 dealloc];
}

- (NSURLCredential)initWithIdentity:(SecIdentityRef)identity certificates:(NSArray *)certArray persistence:(NSURLCredentialPersistence)persistence
{
  int v5 = persistence;
  v12.receiver = self;
  v12.super_class = (Class)NSURLCredential;
  objc_super v8 = [(NSURLCredential *)&v12 init];
  if (v8)
  {
    uint64_t v9 = CFURLCredentialCreateWithIdentityAndCertificateArray(*MEMORY[0x1E4F1CF80], identity, (const __CFArray *)certArray, v5 + 1);
    uint64_t v10 = (NSURLCredentialInternal *)CFMakeCollectable(v9);
    v8->_internal = v10;
    if (!v10)
    {

      return 0;
    }
  }
  return v8;
}

- (id)_initWithCFURLCredential:(_CFURLCredential *)a3
{
  objc_super v3 = self;
  self->_internal = (NSURLCredentialInternal *)a3;
  if (a3)
  {
    CFRetain(a3);
    CFMakeCollectable(a3);
  }
  else
  {

    return 0;
  }
  return v3;
}

- (NSURLCredential)initWithUser:(NSString *)user password:(NSString *)password persistence:(NSURLCredentialPersistence)persistence
{
  int v5 = persistence;
  v13.receiver = self;
  v13.super_class = (Class)NSURLCredential;
  uint64_t v9 = [(NSURLCredential *)&v13 init];
  if (v9)
  {
    uint64_t v10 = CFURLCredentialCreate(*MEMORY[0x1E4F1CF80], (uint64_t)user, (uint64_t)password, v8, (v5 + 1));
    uint64_t v11 = (NSURLCredentialInternal *)CFMakeCollectable(v10);
    v9->_internal = v11;
    if (!v11)
    {

      return 0;
    }
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSURLCredential)credentialForTrust:(SecTrustRef)trust
{
  objc_super v3 = [[NSURLCredential alloc] initWithTrust:trust];

  return v3;
}

+ (NSURLCredential)credentialWithIdentity:(SecIdentityRef)identity certificates:(NSArray *)certArray persistence:(NSURLCredentialPersistence)persistence
{
  int v5 = [[NSURLCredential alloc] initWithIdentity:identity certificates:certArray persistence:persistence];

  return v5;
}

+ (NSURLCredential)credentialWithUser:(NSString *)user password:(NSString *)password persistence:(NSURLCredentialPersistence)persistence
{
  int v5 = [[NSURLCredential alloc] initWithUser:user password:password persistence:persistence];

  return v5;
}

@end