@interface NSUUID(BSCoding)
+ (uint64_t)supportsBSXPCSecureCoding;
- (id)initWithBSXPCCoder:()BSCoding;
- (void)encodeWithBSXPCCoder:()BSCoding;
@end

@implementation NSUUID(BSCoding)

+ (uint64_t)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:()BSCoding
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (a1)
  {
    *(void *)uuid = 0;
    uint64_t v7 = 0;
    [a1 getUUIDBytes:uuid];
    a1 = xpc_uuid_create(uuid);
  }
  objc_msgSend(v4, "encodeXPCObject:forKey:", a1, @"uuid", v4);
}

- (id)initWithBSXPCCoder:()BSCoding
{
  id v4 = [a3 decodeXPCObjectOfType:MEMORY[0x1E4F14600] forKey:@"uuid"];
  id v5 = v4;
  if (v4)
  {
    v6 = (void *)[a1 initWithUUIDBytes:xpc_uuid_get_bytes(v4)];
    a1 = v6;
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

@end