@interface MTSKeychainStoreDataSource
- (BOOL)addItemWithAttributes:(id)a3 error:(id *)a4;
- (BOOL)removeItemsMatchingQuery:(id)a3 error:(id *)a4;
- (BOOL)updateItemMatchingQuery:(id)a3 withAttributes:(id)a4 error:(id *)a5;
- (id)resultMatchingQuery:(id)a3 error:(id *)a4;
@end

@implementation MTSKeychainStoreDataSource

- (BOOL)removeItemsMatchingQuery:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = SecItemDelete((CFDictionaryRef)a3);
  uint64_t v6 = v5;
  if (v5)
  {
    v7 = (__CFString *)SecCopyErrorMessageString(v5, 0);
    uint64_t v11 = *MEMORY[0x263F08338];
    v8 = [NSString stringWithFormat:@"SecItemDelete() failed with %d: %@", v6, v7];
    v12[0] = v8;
    v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];

    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:(int)v6 userInfo:v9];
    }
  }
  return v6 == 0;
}

- (BOOL)updateItemMatchingQuery:(id)a3 withAttributes:(id)a4 error:(id *)a5
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = SecItemUpdate((CFDictionaryRef)a3, (CFDictionaryRef)a4);
  uint64_t v7 = v6;
  if (v6)
  {
    v8 = (__CFString *)SecCopyErrorMessageString(v6, 0);
    uint64_t v12 = *MEMORY[0x263F08338];
    v9 = [NSString stringWithFormat:@"SecItemUpdate() failed with %d: %@", v7, v8];
    v13[0] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];

    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:(int)v7 userInfo:v10];
    }
  }
  return v7 == 0;
}

- (BOOL)addItemWithAttributes:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = SecItemAdd((CFDictionaryRef)a3, 0);
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (__CFString *)SecCopyErrorMessageString(v5, 0);
    uint64_t v11 = *MEMORY[0x263F08338];
    v8 = [NSString stringWithFormat:@"SecItemAdd() failed with %d: %@", v6, v7];
    v12[0] = v8;
    v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];

    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:(int)v6 userInfo:v9];
    }
  }
  return v6 == 0;
}

- (id)resultMatchingQuery:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  CFTypeRef result = 0;
  uint64_t v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = (__CFString *)SecCopyErrorMessageString(v5, 0);
    uint64_t v13 = *MEMORY[0x263F08338];
    v8 = [NSString stringWithFormat:@"SecItemCopyMatching() failed with %d: %@", v6, v7];
    v14[0] = v8;
    v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:(int)v6 userInfo:v9];
    }

    v10 = 0;
  }
  else
  {
    v10 = (void *)result;
  }

  return v10;
}

@end