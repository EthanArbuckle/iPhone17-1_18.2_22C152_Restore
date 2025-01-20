@interface LASecAccessControl
+ (__SecAccessControl)allowAllACL;
+ (__SecAccessControl)denyAllACL;
+ (__SecAccessControl)deserializeACL:(id)a3;
+ (id)constraintsFromACL:(__SecAccessControl *)a3;
+ (id)serializeACL:(__SecAccessControl *)a3;
@end

@implementation LASecAccessControl

+ (id)constraintsFromACL:(__SecAccessControl *)a3
{
  CFDictionaryRef Constraints = (const __CFDictionary *)SecAccessControlGetConstraints();
  CFDictionaryRef Copy = CFDictionaryCreateCopy(0, Constraints);

  return Copy;
}

+ (id)serializeACL:(__SecAccessControl *)a3
{
  v3 = (void *)SecAccessControlCopyData();

  return v3;
}

+ (__SecAccessControl)deserializeACL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = SecAccessControlCreateFromData();
  if (!v4)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    v9 = [NSString stringWithFormat:@"Could note deserialize ACL (%@)", 0];
    id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

    objc_exception_throw(v10);
  }
  v5 = (__SecAccessControl *)v4;

  return v5;
}

+ (__SecAccessControl)denyAllACL
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = SecAccessControlCreate();
  if (!v2)
  {
    v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    v7 = [NSString stringWithFormat:@"Could not initialize trivial ACL (%@)", 0];
    id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

    objc_exception_throw(v8);
  }
  id v3 = (__SecAccessControl *)v2;
  v9 = @"dacl";
  v10[0] = MEMORY[0x1E4F1CC28];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  SecAccessControlSetConstraints();

  return v3;
}

+ (__SecAccessControl)allowAllACL
{
  CFErrorRef error = 0;
  SecAccessControlRef v2 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x1E4F3B5B8], 0, &error);
  if (!v2)
  {
    v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    v7 = [NSString stringWithFormat:@"Could not initialize trivial ACL (%@)", error];
    id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

    objc_exception_throw(v8);
  }
  id v3 = v2;

  return v3;
}

@end