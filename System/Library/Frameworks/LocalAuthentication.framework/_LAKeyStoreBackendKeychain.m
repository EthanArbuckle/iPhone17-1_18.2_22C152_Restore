@interface _LAKeyStoreBackendKeychain
- (BOOL)createGenericPasswordWithQuery:(id)a3 error:(id *)a4;
- (BOOL)createKeyWithQuery:(id)a3 error:(id *)a4;
- (BOOL)removeItemsWithQuery:(id)a3 error:(id *)a4;
- (id)fetchItemWithQuery:(id)a3 error:(id *)a4;
- (id)fetchItemsWithQuery:(id)a3 error:(id *)a4;
@end

@implementation _LAKeyStoreBackendKeychain

- (BOOL)createKeyWithQuery:(id)a3 error:(id *)a4
{
  CFErrorRef error = 0;
  SecKeyRef v5 = SecKeyCreateRandomKey((CFDictionaryRef)a3, &error);
  if (v5) {
    CFRelease(v5);
  }
  CFErrorRef v6 = error;
  if (a4 && error)
  {
    *a4 = error;
    CFErrorRef v6 = error;
  }
  BOOL v7 = v6 == 0;

  return v7;
}

- (BOOL)createGenericPasswordWithQuery:(id)a3 error:(id *)a4
{
  uint64_t v5 = SecItemAdd((CFDictionaryRef)a3, 0);
  if (v5)
  {
    CFErrorRef v6 = +[LAAuthorizationError genericErrorWithStatus:v5];

    if (a4)
    {
      if (v6)
      {
        *a4 = +[LAAuthorizationError genericErrorWithStatus:v5];
      }
    }
  }
  return v5 == 0;
}

- (id)fetchItemWithQuery:(id)a3 error:(id *)a4
{
  CFTypeRef result = 0;
  uint64_t v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  CFErrorRef v6 = (void *)result;
  if (v5)
  {
    if (result) {
      CFRelease(result);
    }
    BOOL v7 = +[LAAuthorizationError genericErrorWithStatus:v5];

    CFErrorRef v6 = (void *)MEMORY[0x1E4F1CC08];
    if (a4 && v7)
    {
      *a4 = +[LAAuthorizationError genericErrorWithStatus:v5];
      CFErrorRef v6 = (void *)MEMORY[0x1E4F1CC08];
    }
  }

  return v6;
}

- (id)fetchItemsWithQuery:(id)a3 error:(id *)a4
{
  CFTypeRef result = 0;
  uint64_t v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  CFErrorRef v6 = (void *)result;
  if (v5)
  {
    if (result) {
      CFRelease(result);
    }
    BOOL v7 = +[LAAuthorizationError genericErrorWithStatus:v5];

    CFErrorRef v6 = (void *)MEMORY[0x1E4F1CBF0];
    if (a4 && v7)
    {
      *a4 = +[LAAuthorizationError genericErrorWithStatus:v5];
      CFErrorRef v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

  return v6;
}

- (BOOL)removeItemsWithQuery:(id)a3 error:(id *)a4
{
  uint64_t v5 = SecItemDelete((CFDictionaryRef)a3);
  uint64_t v6 = v5;
  if (v5 != -25300)
  {
    if (v5)
    {
      BOOL v7 = +[LAAuthorizationError genericErrorWithStatus:v5];

      if (a4)
      {
        if (v7)
        {
          *a4 = +[LAAuthorizationError genericErrorWithStatus:v6];
        }
      }
    }
  }
  return !v6 || v6 == -25300;
}

@end