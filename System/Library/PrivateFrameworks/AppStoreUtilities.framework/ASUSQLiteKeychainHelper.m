@interface ASUSQLiteKeychainHelper
+ (BOOL)storeKey:(id)a3 withIdentifier:(id)a4 error:(id *)a5;
+ (id)fetchKeyWithIdentifier:(id)a3 error:(id *)a4;
+ (uint64_t)_copyErrorForOSStatus:(uint64_t)a1;
@end

@implementation ASUSQLiteKeychainHelper

+ (id)fetchKeyWithIdentifier:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = [NSString stringWithFormat:@"%@.%@", @"com.apple.app-store-utilities.encryption", a3];
  uint64_t v6 = self;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 3, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16ED8], v5);

  v8 = (const void *)*MEMORY[0x263EFFB40];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17010], (const void *)*MEMORY[0x263EFFB40]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171C8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17520], v8);
  CFTypeRef result = 0;
  uint64_t v9 = SecItemCopyMatching(Mutable, &result);
  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = result == 0;
  }
  if (v10)
  {
    if (v9 == -25300 || v9 == 0)
    {
      uint64_t v18 = *MEMORY[0x263F07F80];
      v19[0] = @"SecItemCopyMatching succeeded with empty results";
      v12 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      v15 = [MEMORY[0x263F087E8] errorWithDomain:@"ASUSQLiteErrorDomain" code:5 userInfo:v12];
    }
    else
    {
      v15 = (void *)+[ASUSQLiteKeychainHelper _copyErrorForOSStatus:](v6, v9);
    }
    v14 = 0;
    if (!a4) {
      goto LABEL_17;
    }
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x263EFF8F8]);
    v14 = (void *)[v13 initWithBase64EncodedData:result options:0];
    CFRelease(result);
    v15 = 0;
    if (!a4) {
      goto LABEL_17;
    }
  }
  if (!v14) {
    *a4 = v15;
  }
LABEL_17:
  CFRelease(Mutable);

  return v14;
}

+ (BOOL)storeKey:(id)a3 withIdentifier:(id)a4 error:(id *)a5
{
  v7 = NSString;
  id v8 = a3;
  id v9 = [v7 stringWithFormat:@"%@.%@", @"com.apple.app-store-utilities.encryption", a4];
  id v10 = v8;
  uint64_t v11 = self;
  v12 = [v10 base64EncodedDataWithOptions:0];

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 7, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16ED8], v9);

  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17000], @"App Store User Data Encryption");
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17010], (const void *)*MEMORY[0x263EFFB40]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171C8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F175A8], v12);
  SecItemDelete(Mutable);
  uint64_t v14 = SecItemAdd(Mutable, 0);
  CFRelease(Mutable);
  if (v14)
  {
    v15 = (void *)+[ASUSQLiteKeychainHelper _copyErrorForOSStatus:](v11, v14);
    id v16 = v15;
    if (a5)
    {
      id v16 = v15;
      *a5 = v16;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v14 == 0;
}

+ (uint64_t)_copyErrorForOSStatus:(uint64_t)a1
{
  v11[1] = *MEMORY[0x263EF8340];
  self;
  v3 = (__CFString *)SecCopyErrorMessageString(a2, 0);
  if (v3) {
    [NSString stringWithFormat:@"Keychain failed to return value (error %d): %@", a2, v3];
  }
  else {
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"Keychain failed to return value (error %d)", a2, v9);
  }
  id v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v10 = *MEMORY[0x263F07F80];
  v11[0] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v7 = [v5 errorWithDomain:@"ASUSQLiteErrorDomain" code:4 userInfo:v6];

  return v7;
}

@end