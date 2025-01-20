@interface NSSQLAttributeExtensionFactory
+ (uint64_t)createUnvalidatedTriggerForString:(void *)a3 onAttribute:;
+ (void)newExtensionsForAttribute:(uint64_t *)a3 error:;
@end

@implementation NSSQLAttributeExtensionFactory

+ (void)newExtensionsForAttribute:(uint64_t *)a3 error:
{
  v28[1] = *MEMORY[0x1E4F143B8];
  self;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "attributeDescription"), "userInfo"), "objectForKey:", @"NSTriggerKey");
  if (v7)
  {
    v8 = v7;
    if ([v7 length])
    {
      *(void *)buf = 0;
      v9 = (void *)+[NSSQLAttributeExtensionFactory createUnvalidatedTriggerForString:onAttribute:]((uint64_t)NSSQLAttributeExtensionFactory, v8, a2);
      if ([v9 validate:buf])
      {
        v10 = v6;
        v11 = v9;
      }
      else
      {
        v11 = *(void **)buf;
        v10 = v5;
      }
      [v10 addObject:v11];
    }
  }
  v12 = (void *)[v6 copy];
  if ([v5 count])
  {

    if ([v5 count] == 1)
    {
      uint64_t v13 = [v5 lastObject];
      if (v13) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v14 = *MEMORY[0x1E4F281F8];
      v27 = @"NSDetailedErrors";
      v28[0] = v5;
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v14, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1));
      if (v13)
      {
LABEL_10:
        if (a3)
        {
          v12 = 0;
          *a3 = v13;
          goto LABEL_16;
        }
LABEL_15:
        v12 = 0;
        goto LABEL_16;
      }
    }
    uint64_t v15 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeExtensionFactory.m");
    v22 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeExtensionFactory.m";
      __int16 v25 = 1024;
      int v26 = 48;
      _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_15;
  }
LABEL_16:

  return v12;
}

+ (uint64_t)createUnvalidatedTriggerForString:(void *)a3 onAttribute:
{
  self;
  uint64_t v5 = [a3 entity];
  id v6 = objc_msgSend(a2, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet"));
  int v7 = objc_msgSend((id)objc_msgSend(v6, "lowercaseString"), "hasSuffix:", @"@count");
  v8 = off_1E544B088;
  if (!v7) {
    v8 = off_1E544B050;
  }
  id v9 = objc_alloc(*v8);
  uint64_t v10 = [a3 name];

  return [v9 initWithObjectFromUserInfo:v6 onAttributeNamed:v10 onEntity:v5];
}

@end