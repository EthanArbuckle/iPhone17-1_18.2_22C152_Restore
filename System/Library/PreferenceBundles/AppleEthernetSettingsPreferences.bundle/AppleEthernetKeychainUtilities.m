@interface AppleEthernetKeychainUtilities
+ (id)_passwordForHost:(id)a3 username:(id)a4 port:(int)a5;
+ (id)passwordForHost:(id)a3 username:(id)a4 port:(int)a5;
+ (void)removePasswordForHost:(id)a3 username:(id)a4 port:(int)a5;
+ (void)setPassword:(id)a3 forHost:(id)a4 username:(id)a5 port:(int)a6;
- (AppleEthernetKeychainUtilities)init;
@end

@implementation AppleEthernetKeychainUtilities

- (AppleEthernetKeychainUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)AppleEthernetKeychainUtilities;
  return [(AppleEthernetKeychainUtilities *)&v3 init];
}

+ (id)_passwordForHost:(id)a3 username:(id)a4 port:(int)a5
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] && objc_msgSend(v7, "length") && (uint64_t v8 = CFURLCredentialStorageCreate()) != 0)
  {
    v9 = (const void *)v8;
    uint64_t v10 = CFURLProtectionSpaceCreate();
    if (v10)
    {
      v11 = (const void *)v10;
      uint64_t v12 = CFURLCredentialStorageCopyDefaultCredentialForProtectionSpace();
      if (v12)
      {
        v13 = (const void *)v12;
        v14 = (void *)CFURLCredentialCopyPassword();
        CFRelease(v13);
      }
      else
      {
        v14 = 0;
      }
      CFRelease(v11);
    }
    else
    {
      v14 = 0;
    }
    CFRelease(v9);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)passwordForHost:(id)a3 username:(id)a4 port:(int)a5
{
  return [a1 _passwordForHost:a3 username:a4 port:*(void *)&a5];
}

+ (void)setPassword:(id)a3 forHost:(id)a4 username:(id)a5 port:(int)a6
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![v8 length]) {
    goto LABEL_14;
  }
  if (![v17 length]) {
    goto LABEL_14;
  }
  if (![v9 length]) {
    goto LABEL_14;
  }
  uint64_t v10 = CFURLCredentialStorageCreate();
  if (!v10) {
    goto LABEL_14;
  }
  v11 = (const void *)v10;
  uint64_t v12 = (const void *)CFURLProtectionSpaceCreate();
  uint64_t v13 = CFURLProtectionSpaceCreate();
  v14 = (const void *)v13;
  if (v12 && v13)
  {
    uint64_t v15 = CFURLCredentialCreate();
    if (v15)
    {
      v16 = (const void *)v15;
      CFURLCredentialStorageSetDefaultCredentialForProtectionSpace();
      CFURLCredentialStorageSetDefaultCredentialForProtectionSpace();
      CFRelease(v16);
    }
    goto LABEL_10;
  }
  if (v12) {
LABEL_10:
  }
    CFRelease(v12);
  if (v14) {
    CFRelease(v14);
  }
  CFRelease(v11);
LABEL_14:
}

+ (void)removePasswordForHost:(id)a3 username:(id)a4 port:(int)a5
{
  id v17 = a3;
  id v6 = a4;
  if (![v17 length]) {
    goto LABEL_19;
  }
  if (![v6 length]) {
    goto LABEL_19;
  }
  uint64_t v7 = CFURLCredentialStorageCreate();
  if (!v7) {
    goto LABEL_19;
  }
  id v8 = (const void *)v7;
  id v9 = (const void *)CFURLProtectionSpaceCreate();
  uint64_t v10 = CFURLProtectionSpaceCreate();
  v11 = (const void *)v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (!v9) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v13 = CFURLCredentialStorageCopyDefaultCredentialForProtectionSpace();
    if (v13)
    {
      v14 = (const void *)v13;
      CFURLCredentialStorageRemoveCredentialForProtectionSpace();
      CFRelease(v14);
    }
    uint64_t v15 = CFURLCredentialStorageCopyDefaultCredentialForProtectionSpace();
    if (v15)
    {
      v16 = (const void *)v15;
      CFURLCredentialStorageRemoveCredentialForProtectionSpace();
      CFRelease(v16);
    }
  }
  CFRelease(v9);
LABEL_16:
  if (v11) {
    CFRelease(v11);
  }
  CFRelease(v8);
LABEL_19:
}

@end