@interface LACAccessControl
+ (BOOL)checkACLAllowsAll:(id)a3;
+ (id)allowAllACL;
@end

@implementation LACAccessControl

+ (id)allowAllACL
{
  SecAccessControlRef v2 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFTypeRef)*MEMORY[0x263F16ED0], 0, 0);
  v3 = (void *)SecAccessControlCopyData();
  CFRelease(v2);
  return v3;
}

+ (BOOL)checkACLAllowsAll:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = (void *)SecAccessControlCreateFromData();
  if (v3 && (SecAccessControlGetRequirePassword() & 1) == 0)
  {
    v5 = SecAccessControlGetConstraints();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = objc_msgSend(v5, "allValues", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      v10 = (const void *)*MEMORY[0x263EFFB40];
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          if (!CFEqual(*(CFTypeRef *)(*((void *)&v13 + 1) + 8 * i), v10))
          {
            BOOL v4 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v4 = 1;
LABEL_14:
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

@end